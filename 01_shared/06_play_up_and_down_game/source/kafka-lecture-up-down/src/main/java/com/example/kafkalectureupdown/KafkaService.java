package com.example.kafkalectureupdown;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.kafka.config.KafkaListenerEndpointRegistry;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.messaging.handler.annotation.Header;
import org.springframework.stereotype.Component;

import java.util.Objects;
import java.util.regex.Pattern;

import static com.example.kafkalectureupdown.GameController.GameState.EQUAL;
import static com.example.kafkalectureupdown.GameController.GameState.GREATER;

@Component
public class KafkaService {
    private final KafkaTemplate<String, String> kafkaTemplate;
    private final TopicService topicService;
    private final GameController gameController;
    private final KafkaListenerEndpointRegistry kafkaListenerEndpointRegistry;
    private final Logger logger;
    private final Pattern pattern = Pattern.compile("^[1-9][0-9]{0,2}$");

    public KafkaService(KafkaTemplate<String, String> kafkaTemplate, TopicService topicService, GameController gameController, KafkaListenerEndpointRegistry kafkaListenerEndpointRegistry) {
        this.kafkaTemplate = kafkaTemplate;
        this.topicService = topicService;
        this.gameController = gameController;
        this.kafkaListenerEndpointRegistry = kafkaListenerEndpointRegistry;
        logger = LoggerFactory.getLogger(KafkaService.class);
    }

    @KafkaListener(id = "game", topics = "game", concurrency = "3")
    public void listen(String value, @Header("nick-name") String topic){
        if(!isInteger(value)){
            kafkaTemplate.send(topic, "1~300 사이 양의 정수 값을 입력하셔야 합니다.");
            return;
        }

        if(!topicService.hasTopic(topic)){
            topicService.createTopic(topic);
        }

        final var result = gameController.play(Integer.parseInt(value));
        if(result.equals(EQUAL)){
            notifyWinnerToAllTopics(value, topic);
            stopListenerContainer();
            return;
        }

        final var message = topic + "님이 입력하신 " + value + "값 보다 " + (result.equals(GREATER) ? "큽니다." : "작습니다.");

        logger.info(message);
        kafkaTemplate.send(topic, message);
    }

    private void stopListenerContainer() {
        Objects.requireNonNull(kafkaListenerEndpointRegistry.getListenerContainer("game"))
                .stop();
    }

    private void notifyWinnerToAllTopics(String value, String topic) {
        topicService.getAllTopics()
                .forEach(t -> kafkaTemplate.send(t, topic + " 님이 정답을 맞췄습니다. 정답은 " + value + "입니다. 게임을 종료합니다."));
    }

    private boolean isInteger(String value) {
        return pattern.matcher(value).matches();
    }

}

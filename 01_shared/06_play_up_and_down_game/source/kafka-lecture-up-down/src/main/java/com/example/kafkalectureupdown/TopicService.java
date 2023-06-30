package com.example.kafkalectureupdown;

import org.apache.kafka.clients.admin.AdminClient;
import org.springframework.kafka.config.TopicBuilder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;
import java.util.concurrent.ConcurrentSkipListSet;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

@Service
public class TopicService {
    private final AdminClient kafkaAdmin;
    private final ConcurrentSkipListSet<String> gameTopic;
    private final Set<String> createdTopics;

    public TopicService(AdminClient kafkaAdmin) throws ExecutionException, InterruptedException, TimeoutException {
        this.kafkaAdmin = kafkaAdmin;
        gameTopic = new ConcurrentSkipListSet<>();
        createdTopics = kafkaAdmin.listTopics()
                .names()
                .get(10_000, TimeUnit.SECONDS);
    }

    public void createTopic(String name){
        if(!hasTopic(name)){
            if(!createdTopics.contains(name)){
                kafkaAdmin.createTopics(List.of(TopicBuilder.name(name).build()));
            }
            gameTopic.add(name);
        }
    }
    public boolean hasTopic(String name){
        return gameTopic.contains(name);
    }

    public List<String> getAllTopics(){
        return gameTopic.stream().toList();
    }
}

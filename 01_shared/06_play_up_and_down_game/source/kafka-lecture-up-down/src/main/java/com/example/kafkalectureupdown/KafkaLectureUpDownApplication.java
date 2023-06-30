package com.example.kafkalectureupdown;

import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;

@SpringBootApplication
public class KafkaLectureUpDownApplication {

    public static void main(String[] args) {
        new SpringApplicationBuilder((KafkaLectureUpDownApplication.class))
                .web(WebApplicationType.NONE)
                .run(args);
    }
}

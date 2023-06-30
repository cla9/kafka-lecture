package com.example.kafkalectureupdown;

import org.apache.kafka.clients.admin.AdminClient;
import org.springframework.boot.autoconfigure.kafka.KafkaProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class KafkaConfig {
    @Bean
    public AdminClient adminClient(KafkaProperties properties){
        return AdminClient.create(properties.buildAdminProperties());
    }
}

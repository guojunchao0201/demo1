package com.example.demo.kafkademo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Component;

@Component
public class KafkaProcuder {

    static String topic = "test";

    byte[] bytes = {1, 2, 3};

    @Autowired
    KafkaTemplate<String, String> template;
    public void send() {
        template.send(topic, new String(bytes));
    }
}

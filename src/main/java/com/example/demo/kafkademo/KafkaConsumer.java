package com.example.demo.kafkademo;

import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Component;

@Component
public class KafkaConsumer {

    @KafkaListener(topics = "test")
    public void consume(String msg) {
        System.out.println("消费：" + msg);
    }
}

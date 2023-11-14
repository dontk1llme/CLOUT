package com.mmm.clout.notificationservice.notification.presentation.test;

import java.io.IOException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class KafkaConsumer {

    @KafkaListener(topics = "${message.topic.name}")
    public void consume(String message) throws IOException {
        log.info(String.format("Consumed message : %s", message));
    }
}
package com.mmm.clout.notificationservice.notification.presentation;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@CrossOrigin("*")
@RestController
@RequestMapping(value = "/kafka/test")
public class SampleController {
    private final KafkaProducer producer;

    @Autowired
    SampleController(KafkaProducer producer) {
        this.producer = producer;
    }

    @PostMapping(value = "/message")
    public String sendMessage(@RequestParam("message") String message) {
        this.producer.sendMessage(message);
        return "success";
    }
}
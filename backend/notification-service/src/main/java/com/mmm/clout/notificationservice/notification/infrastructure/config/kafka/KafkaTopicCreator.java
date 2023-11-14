package com.mmm.clout.notificationservice.notification.infrastructure.config.kafka;

import org.apache.kafka.clients.admin.AdminClient;
import org.apache.kafka.clients.admin.NewTopic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.core.KafkaAdmin;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.concurrent.ExecutionException;

@Service
public class KafkaTopicCreator {

    @Autowired
    private KafkaAdmin kafkaAdmin;

    public void createTopic(String topicName, int partitions, short replicationFactor) {
        try (AdminClient client = AdminClient.create(kafkaAdmin.getConfigurationProperties())) {
            NewTopic newTopic = new NewTopic(topicName, partitions, replicationFactor);
            client.createTopics(Collections.singletonList(newTopic)).all().get(); // 동기적으로 결과를 기다림
        } catch (InterruptedException e) {
            // 스레드가 중단될 경우
            Thread.currentThread().interrupt();
            e.printStackTrace();
        } catch (ExecutionException e) {
            // 토픽 생성 중 발생한 예외 처리
            e.printStackTrace();
        } // try-with-resources를 사용하여 자동으로 client.close() 호출
    }
}

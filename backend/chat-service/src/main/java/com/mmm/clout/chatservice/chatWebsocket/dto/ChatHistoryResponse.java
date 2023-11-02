package com.mmm.clout.chatservice.chatWebsocket.dto;


import com.mmm.clout.chatservice.chatWebsocket.ChatHistory;

import java.time.LocalDateTime;

public record ChatHistoryResponse(
    String chatIdx,
        String sender,
        String senderUuid,
        String msg,
        String imgUrl,
        LocalDateTime dateTime
) {

    public static ChatHistoryResponse of(final ChatHistory entity) {
        return new ChatHistoryResponse(
                entity.getId(),
                entity.getSenderName(),
                entity.getSenderUuid(),
                entity.getMsg(),
                entity.getImgUrl(),
                entity.getCreatedAt()
        );
    }
}
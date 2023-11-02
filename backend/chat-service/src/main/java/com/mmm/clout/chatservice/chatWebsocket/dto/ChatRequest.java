package com.mmm.clout.chatservice.chatWebsocket.dto;

public record ChatRequest(
        String sender,
        String senderUuid,
        String imgUrl,
        String msg
) {
}

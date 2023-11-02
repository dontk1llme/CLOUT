package com.mmm.clout.chatservice.chatRoom.service;

import com.mmm.clout.chatservice.chatRoom.dto.response.ChatRoomDetailResponse;
import com.mmm.clout.chatservice.chatRoom.dto.request.ChatRoomRequest;
import com.mmm.clout.chatservice.chatRoom.dto.response.CreateChatRoomResponse;
import org.springframework.stereotype.Service;

@Service
public interface ChatRoomService {

    public CreateChatRoomResponse makeRoom(ChatRoomRequest request);

    ChatRoomDetailResponse enterRoom(Long roomId);
}

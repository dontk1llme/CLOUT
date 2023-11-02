package com.mmm.clout.chatservice.chatRoom.service;

import com.mmm.clout.chatservice.chatRoom.ChatRoom;
import com.mmm.clout.chatservice.chatRoom.ChatRoomRepository;
import com.mmm.clout.chatservice.chatRoom.dto.response.ChatRoomDetailResponse;
import com.mmm.clout.chatservice.chatRoom.dto.request.ChatRoomRequest;
import com.mmm.clout.chatservice.chatRoom.dto.response.CreateChatRoomResponse;
import com.mmm.clout.chatservice.chatRoom.exception.NotFoundRoom;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ChatRoomServiceImpl implements ChatRoomService {

    private final ChatRoomRepository chatRoomRepository;

    @Override
    public CreateChatRoomResponse makeRoom(ChatRoomRequest request) {
        ChatRoom room = ChatRoom.builder()
            .advertisementId(request.getAdvertisementId())
            .hostId(request.getHostId())
            .guestId(request.getGuestId()).build();

        chatRoomRepository.save(room);

        CreateChatRoomResponse result = new CreateChatRoomResponse(room.getId());
        return result;
    }

    @Override
    public ChatRoomDetailResponse enterRoom(Long roomId) {
        ChatRoom room = chatRoomRepository.findById(roomId).orElseThrow(NotFoundRoom::new);

        ChatRoomDetailResponse result = ChatRoomDetailResponse.builder()
            .chatRoomId(room.getId())
            .advertisementId(room.getAdvertisementId())
            .hostId(room.getHostId())
            .guestId(room.getGuestId()).build();

        return result;
    }
}

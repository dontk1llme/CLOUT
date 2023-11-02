package com.mmm.clout.chatservice.chatRoom.service;

import com.mmm.clout.chatservice.chatRoom.ChatRoom;
import com.mmm.clout.chatservice.chatRoom.ChatRoomRepository;
import com.mmm.clout.chatservice.chatRoom.dto.response.ChatRoomDetailResponse;
import com.mmm.clout.chatservice.chatRoom.dto.request.ChatRoomRequest;
import com.mmm.clout.chatservice.chatRoom.dto.response.CreateChatRoomResponse;
import com.mmm.clout.chatservice.chatRoom.exception.NotFoundRoom;
import com.mmm.clout.chatservice.chatWebsocket.ChatSocketService;
import com.mmm.clout.chatservice.chatWebsocket.dto.ChatHistoryResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ChatRoomServiceImpl implements ChatRoomService {

    private final ChatRoomRepository chatRoomRepository;
    private final ChatSocketService chatSocketService;

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

        List<ChatHistoryResponse> chatHistory = chatSocketService.getList(roomId.toString());

        ChatRoomDetailResponse result = ChatRoomDetailResponse.builder()
            .chatRoomId(room.getId())
            .advertisementId(room.getAdvertisementId())
            .hostId(room.getHostId())
            .guestId(room.getGuestId())
            .chatHistories(chatHistory).build();

        return result;
    }

}

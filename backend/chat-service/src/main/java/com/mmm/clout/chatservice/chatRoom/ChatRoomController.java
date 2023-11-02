package com.mmm.clout.chatservice.chatRoom;

import com.mmm.clout.chatservice.chatRoom.docs.ChatRoomControllerDocs;
import com.mmm.clout.chatservice.chatRoom.dto.response.ChatRoomDetailResponse;
import com.mmm.clout.chatservice.chatRoom.dto.request.ChatRoomRequest;
import com.mmm.clout.chatservice.chatRoom.dto.response.CreateChatRoomResponse;
import com.mmm.clout.chatservice.chatRoom.service.ChatRoomService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/chats")
public class ChatRoomController implements ChatRoomControllerDocs {

    private final ChatRoomService chatRoomService;

    //채팅방 생성
    @PostMapping
    public ResponseEntity<CreateChatRoomResponse> makeChatRoom (
        @RequestBody ChatRoomRequest request
    ) {

        CreateChatRoomResponse response = chatRoomService.makeRoom(request);

        return new ResponseEntity<CreateChatRoomResponse>(response, HttpStatus.CREATED);
    }

    @GetMapping("/{chatRoomId}")
    public ResponseEntity<ChatRoomDetailResponse> enterRoom(
        @PathVariable("chatRoomId") Long roomId
    ) {

        ChatRoomDetailResponse response = chatRoomService.enterRoom(roomId);

        return new ResponseEntity<>(response, HttpStatus.OK);
    }

}

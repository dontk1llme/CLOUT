package com.mmm.clout.chatservice.chatRoom.docs;

import com.mmm.clout.chatservice.chatRoom.dto.request.ChatRoomRequest;
import com.mmm.clout.chatservice.chatRoom.dto.response.ChatRoomDetailResponse;
import com.mmm.clout.chatservice.chatRoom.dto.response.CreateChatRoomResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;

import javax.validation.Valid;

@Tag(name = "채팅방 CRUD", description = "채팅방 생성, 조회를 제공하는 api")
public interface ChatRoomControllerDocs {

    @Operation(summary = "채팅방 생성",
        responses =
        @ApiResponse(responseCode = "201", description = "생성된 채팅방 id 리턴",
            content =
            @Content(mediaType="application/json",
                schema=@Schema(implementation= CreateChatRoomResponse.class))
        )
    )
    public ResponseEntity<CreateChatRoomResponse> makeChatRoom(
        @RequestBody @Valid ChatRoomRequest request);


    @Operation(summary = "채팅방 입장 정보 제공",
        responses =
        @ApiResponse(responseCode = "200", description = "채팅방 상세정보와 이전 채팅 목록 제공",
            content =
            @Content(mediaType="application/json",
                schema=@Schema(implementation= ChatRoomDetailResponse.class))
        )
    )
    public ResponseEntity<ChatRoomDetailResponse> enterRoom(
        @PathVariable("chatRoomId") Long roomId);
}

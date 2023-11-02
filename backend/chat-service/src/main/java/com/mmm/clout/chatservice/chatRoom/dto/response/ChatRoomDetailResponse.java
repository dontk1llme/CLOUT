package com.mmm.clout.chatservice.chatRoom.dto.response;
import com.mmm.clout.chatservice.chatWebsocket.dto.ChatHistoryResponse;
import lombok.*;

import java.util.List;

@Getter
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Builder
public class ChatRoomDetailResponse {

    private Long chatRoomId;

    private Long advertisementId;

    private Long hostId;

    private Long guestId;

    private List<ChatHistoryResponse> chatHistories;
}

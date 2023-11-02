package com.mmm.clout.chatservice.chatRoom.dto.response;
import lombok.*;

@Getter
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Builder
public class ChatRoomDetailResponse {

    private Long chatRoomId;

    private Long advertisementId;

    private Long hostId;

    private Long guestId;
}

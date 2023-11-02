package com.mmm.clout.chatservice.chatRoom;

import lombok.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
@AllArgsConstructor
@Builder
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Getter
public class ChatRoom {

    @Id @GeneratedValue
    @Column(name = "chatroom_id")
    private Long id;

    private Long advertisementId;

    private Long hostId;

    private Long guestId;
}

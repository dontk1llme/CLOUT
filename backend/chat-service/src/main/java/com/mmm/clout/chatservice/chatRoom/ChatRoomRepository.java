package com.mmm.clout.chatservice.chatRoom;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;


public interface ChatRoomRepository extends JpaRepository<ChatRoom, Long> {

    Optional<List<ChatRoom>> findAllByHostId(Long hostId);

    Optional<List<ChatRoom>> findAllByGuestId(Long guestId);
}

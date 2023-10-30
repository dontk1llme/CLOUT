package com.mmm.clout.userservice.user.domain.repository;

import com.mmm.clout.userservice.member.domain.Member;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserRepository extends JpaRepository<Member, Long> {
    Optional<Member> findByUserId(String userId);
}

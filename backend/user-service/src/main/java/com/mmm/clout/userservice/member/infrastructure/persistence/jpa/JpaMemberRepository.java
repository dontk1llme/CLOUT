package com.mmm.clout.userservice.member.infrastructure.persistence.jpa;

import com.mmm.clout.userservice.advertiser.domain.Advertiser;
import com.mmm.clout.userservice.member.domain.Member;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface JpaMemberRepository extends JpaRepository<Member, Long> {
    public Optional<Member> findByUserId(String userId);
}

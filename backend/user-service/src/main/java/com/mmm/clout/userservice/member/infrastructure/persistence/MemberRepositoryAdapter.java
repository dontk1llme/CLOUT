package com.mmm.clout.userservice.member.infrastructure.persistence;

import com.mmm.clout.userservice.member.domain.Member;
import com.mmm.clout.userservice.member.domain.repository.MemberRepository;
import com.mmm.clout.userservice.member.infrastructure.persistence.jpa.JpaMemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
@RequiredArgsConstructor
public class MemberRepositoryAdapter implements MemberRepository {

    private final JpaMemberRepository jpaMemberRepository;

    @Override
    public Optional<Member> findByUserId(String userId) {
        return jpaMemberRepository.findByUserId(userId);
    }
}

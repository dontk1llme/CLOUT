package com.mmm.clout.userservice.member.infrastructure.persistence;

import com.mmm.clout.userservice.member.domain.Member;
import com.mmm.clout.userservice.member.domain.repository.MemberRepository;
import com.mmm.clout.userservice.member.infrastructure.persistence.jpa.JpaMemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
@RequiredArgsConstructor
public class MemberRepositoryAdapter implements MemberRepository {

    private final JpaMemberRepository jpaMemberRepository;

    @Override
    public Optional<Member> findByUserId(String userId) {
        return jpaMemberRepository.findByUserId(userId);
    }

    @Override
    public Optional<Member> findById(Long id) {
        return jpaMemberRepository.findById(id);
    }

    @Override
    public List<Member> findAll() {
        return jpaMemberRepository.findAll();
    }
}

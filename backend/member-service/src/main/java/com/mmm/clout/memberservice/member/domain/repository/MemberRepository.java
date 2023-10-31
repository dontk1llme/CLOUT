package com.mmm.clout.memberservice.member.domain.repository;

import com.mmm.clout.memberservice.member.domain.Member;

import java.util.List;
import java.util.Optional;

public interface MemberRepository {

    public Optional<Member> findByUserId(String userId);

    public Optional<Member> findById(Long id);

    public List<Member> findAll();
}

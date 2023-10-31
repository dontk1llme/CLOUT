package com.mmm.clout.userservice.member.domain.repository;

import com.mmm.clout.userservice.member.domain.Member;

import java.util.List;
import java.util.Optional;

public interface MemberRepository {

    public Optional<Member> findByUserId(String userId);

    public Optional<Member> findById(Long id);

    public List<Member> findAll();
}

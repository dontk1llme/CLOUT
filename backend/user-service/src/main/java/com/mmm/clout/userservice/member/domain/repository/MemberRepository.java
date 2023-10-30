package com.mmm.clout.userservice.member.domain.repository;

import com.mmm.clout.userservice.member.domain.Member;

import java.util.Optional;

public interface MemberRepository {

    public Optional<Member> findByUserId(String userId);
}

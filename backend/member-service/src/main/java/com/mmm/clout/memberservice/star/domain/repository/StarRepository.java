package com.mmm.clout.memberservice.star.domain.repository;

import com.mmm.clout.memberservice.member.domain.Member;
import com.mmm.clout.memberservice.star.domain.Star;

public interface StarRepository {

    Star save(Star star);

    Star findByMember(Member member);
}

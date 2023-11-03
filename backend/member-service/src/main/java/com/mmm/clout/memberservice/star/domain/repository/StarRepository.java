package com.mmm.clout.memberservice.star.domain.repository;

import com.mmm.clout.memberservice.star.domain.Star;

public interface StarRepository {

    Star save(Star star);

    Star findById(Long memberId);
}

package com.mmm.clout.memberservice.star.domain.repository;

import com.mmm.clout.memberservice.star.domain.Star;

public interface StarRepository {

    Star findById(Long memberId);
}

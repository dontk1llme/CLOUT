package com.mmm.clout.memberservice.star.domain.repository;

import com.mmm.clout.memberservice.star.domain.Star;
import com.mmm.clout.memberservice.star.domain.StarDetail;

public interface StarDetailRepository {

    StarDetail save(StarDetail starDetail);

    StarDetail findByStarAndGiverId(Star star, Long giverId);
}

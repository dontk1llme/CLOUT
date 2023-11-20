package com.mmm.clout.memberservice.star.infrastructure.persistence.jpa;

import com.mmm.clout.memberservice.star.domain.Star;
import com.mmm.clout.memberservice.star.domain.StarDetail;
import org.springframework.data.jpa.repository.JpaRepository;

public interface JpaStarDetailRepository extends JpaRepository<StarDetail, Long> {

    StarDetail findByStarAndGiverId(Star star, Long giverId);
}

package com.mmm.clout.memberservice.star.infrastructure.persistence;

import com.mmm.clout.memberservice.star.domain.Star;
import com.mmm.clout.memberservice.star.domain.StarDetail;
import com.mmm.clout.memberservice.star.domain.repository.StarDetailRepository;
import com.mmm.clout.memberservice.star.infrastructure.persistence.jpa.JpaStarDetailRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class StarDetailAdapter implements StarDetailRepository {

    private final JpaStarDetailRepository starDetailRepository;

    @Override
    public StarDetail save(StarDetail starDetail) {
        return starDetailRepository.save(starDetail);
    }

    @Override
    public StarDetail findByStarAndGiverId(Star star, Long giverId) {
        return starDetailRepository.findByStarAndGiverId(star, giverId);
    }
}

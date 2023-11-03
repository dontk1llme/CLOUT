package com.mmm.clout.memberservice.star.infrastructure.persistence;

import com.mmm.clout.memberservice.star.domain.Star;
import com.mmm.clout.memberservice.star.domain.repository.StarRepository;
import com.mmm.clout.memberservice.star.infrastructure.exception.NotFoundStarException;
import com.mmm.clout.memberservice.star.infrastructure.persistence.jpa.JpaStarRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class StarAdapter implements StarRepository {

    private final JpaStarRepository jpaStarRepository;

    @Override
    public Star findById(Long memberId) {
        return jpaStarRepository.findByMemberId(memberId).orElseThrow(NotFoundStarException::new);
    }
}

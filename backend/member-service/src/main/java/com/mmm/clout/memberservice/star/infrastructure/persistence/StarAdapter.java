package com.mmm.clout.memberservice.star.infrastructure.persistence;

import com.mmm.clout.memberservice.member.domain.Member;
import com.mmm.clout.memberservice.star.domain.Star;
import com.mmm.clout.memberservice.star.domain.repository.StarRepository;
import com.mmm.clout.memberservice.star.domain.exception.NotFoundStarException;
import com.mmm.clout.memberservice.star.infrastructure.persistence.jpa.JpaStarRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class StarAdapter implements StarRepository {

    private final JpaStarRepository jpaStarRepository;

    @Override
    public Star save(Star star) {
        return jpaStarRepository.save(star);
    }

    @Override
    public Star findByMember(Member member) {
        return jpaStarRepository.findByMember(member).orElseThrow(NotFoundStarException::new);
    }
}

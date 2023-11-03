package com.mmm.clout.memberservice.star.infrastructure.persistence.jpa;

import com.mmm.clout.memberservice.star.domain.Star;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface JpaStarRepository extends JpaRepository<Star, Long> {
    Optional<Star> findByMemberId(Long id);
}

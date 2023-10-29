package com.mmm.clout.userservice.clouter.infrastructure.persistence.jpa;

import com.mmm.clout.userservice.clouter.domain.Clouter;
import org.springframework.data.jpa.repository.JpaRepository;

public interface JpaClouterRepository extends JpaRepository<Clouter, Long> {
}

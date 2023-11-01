package com.mmm.clout.memberservice.clouter.infrastructure.persistence.jpa;

import com.mmm.clout.memberservice.clouter.domain.Clouter;

import java.util.Optional;

public interface JpaClouterRepositoryCustom {

    Optional<Clouter> getClouterWithAllData(Long ClouterId);
}

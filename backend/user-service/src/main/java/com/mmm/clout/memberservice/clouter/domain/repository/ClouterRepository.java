package com.mmm.clout.memberservice.clouter.domain.repository;

import com.mmm.clout.memberservice.clouter.domain.Clouter;

public interface ClouterRepository {

    Clouter save(Clouter clouter);

    Clouter findById(Long userId);
}

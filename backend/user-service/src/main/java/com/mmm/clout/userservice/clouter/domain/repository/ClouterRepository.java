package com.mmm.clout.userservice.clouter.domain.repository;

import com.mmm.clout.userservice.clouter.domain.Clouter;

public interface ClouterRepository {

    Clouter save(Clouter clouter);

    Clouter findById(Long userId);
}

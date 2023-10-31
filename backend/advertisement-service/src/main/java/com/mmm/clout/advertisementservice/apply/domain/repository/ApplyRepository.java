package com.mmm.clout.advertisementservice.apply.domain.repository;

import com.mmm.clout.advertisementservice.apply.domain.Apply;
import java.util.Optional;

public interface ApplyRepository {

    Apply save(Apply apply);

    Optional<Apply> findById(Long applyId);
}

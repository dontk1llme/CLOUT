package com.mmm.clout.advertisementservice.apply.domain.repository;

import com.mmm.clout.advertisementservice.advertisements.domain.Campaign;
import com.mmm.clout.advertisementservice.apply.domain.Apply;
import com.mmm.clout.advertisementservice.apply.domain.Apply.ApplyStatus;
import java.util.List;
import java.util.Optional;

public interface ApplyRepository {

    Apply save(Apply apply);

    Optional<Apply> findById(Long applyId);


    boolean checkApplyExists(Campaign campaign, Long clouterId);

    List<Apply> getAllByStatus(Long applicantId, ApplyStatus applyStatus);

    List<Apply> findApplicantList(Long advertisementId);
}

package com.mmm.clout.advertisementservice.apply.application;

import com.mmm.clout.advertisementservice.apply.application.reader.ApplyCheckReader;
import com.mmm.clout.advertisementservice.apply.domain.Apply;
import com.mmm.clout.advertisementservice.apply.domain.exception.ApplyNotFoundException;
import com.mmm.clout.advertisementservice.apply.domain.repository.ApplyRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
public class CheckApplyProcessor {

    private final ApplyRepository applyRepository;

    @Transactional
    public ApplyCheckReader execute(Long advertisementId, Long clouterId) {
        Apply apply = applyRepository.findByCampaign_IdAndApplicant_ApplicantId(advertisementId, clouterId)
            .orElseThrow(ApplyNotFoundException::new);
        if (Apply.invalid(apply)) {
            return new ApplyCheckReader(null, false);
        } else {
            return new ApplyCheckReader(apply.getId(), true);
        }
    }
}

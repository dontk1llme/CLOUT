package com.mmm.clout.advertisementservice.apply.application;

import com.mmm.clout.advertisementservice.apply.domain.Apply;
import com.mmm.clout.advertisementservice.apply.domain.Apply.ApplyStatus;
import com.mmm.clout.advertisementservice.apply.domain.repository.ApplyRepository;
import java.util.List;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class ReadAllApplyProcessor {

    private final ApplyRepository applyRepository;

    public List<Apply> execute(Long applicantId, ApplyStatus applyStatus) {
        return applyRepository.getAllByStatus(applicantId, applyStatus);
    }
}

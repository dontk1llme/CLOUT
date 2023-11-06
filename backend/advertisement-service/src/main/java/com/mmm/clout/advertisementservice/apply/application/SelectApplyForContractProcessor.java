package com.mmm.clout.advertisementservice.apply.application;

import com.mmm.clout.advertisementservice.apply.domain.Apply;
import com.mmm.clout.advertisementservice.apply.domain.exception.ApplyNotFoundException;
import com.mmm.clout.advertisementservice.apply.domain.repository.ApplyRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
public class SelectApplyForContractProcessor {

    private final ApplyRepository applyRepository;

    @Transactional
    public void execute(Long applyId) {
        Apply apply = applyRepository.findById(applyId).orElseThrow(ApplyNotFoundException::new);
        apply.askForContract();
        // TODO 계약 호출
    }
}

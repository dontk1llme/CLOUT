package com.mmm.clout.contractservice.contract.application;

import com.mmm.clout.contractservice.contract.domain.Contract;
import com.mmm.clout.contractservice.contract.domain.exception.NotFoundContractException;
import com.mmm.clout.contractservice.contract.domain.repository.ContractRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
public class DeleteContractProcessor {

    private final ContractRepository contractRepository;

    @Transactional
    public Long execute(Long id) {
        Contract contract = contractRepository.findById(id)
                .orElseThrow(() -> new NotFoundContractException());
        contractRepository.delete(contract);
        return id;
    }
}

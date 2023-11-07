package com.mmm.clout.contractservice.contract.application;

import com.mmm.clout.contractservice.contract.domain.Contract;
import com.mmm.clout.contractservice.contract.domain.repository.ContractRepository;
import lombok.RequiredArgsConstructor;

import java.util.List;

@RequiredArgsConstructor
public class SelectAllContractAdvertiserProcessor {

    private final ContractRepository contractRepository;

    public List<Contract> execute(Long id) {
        return contractRepository.findAllByAdvertiserInfoAdvertiserId(id);
    }
}

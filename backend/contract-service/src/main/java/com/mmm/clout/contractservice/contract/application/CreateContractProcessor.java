package com.mmm.clout.contractservice.contract.application;

import com.mmm.clout.contractservice.contract.application.command.CreateContractCommand;
import com.mmm.clout.contractservice.contract.domain.Contract;
import com.mmm.clout.contractservice.contract.domain.repository.ContractRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
public class CreateContractProcessor {

    private final ContractRepository contractRepository;

    @Transactional
    public Contract execute(CreateContractCommand command) {
        Contract contract = command.toEntity();
        return contractRepository.save(contract);
    }
}

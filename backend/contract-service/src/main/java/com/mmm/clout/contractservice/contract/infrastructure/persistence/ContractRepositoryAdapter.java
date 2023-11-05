package com.mmm.clout.contractservice.contract.infrastructure.persistence;


import com.mmm.clout.contractservice.contract.domain.Contract;
import com.mmm.clout.contractservice.contract.domain.repository.ContractRepository;
import com.mmm.clout.contractservice.contract.infrastructure.persistence.jpa.JpaContractRepository;
import lombok.RequiredArgsConstructor;

import java.util.Optional;

@RequiredArgsConstructor
public class ContractRepositoryAdapter implements ContractRepository {

    private final JpaContractRepository JpaContractRepository;

    @Override
    public Contract save(Contract contract) {
        return JpaContractRepository.save(contract);
    }

    @Override
    public Optional<Contract> findById(Long id) {
        return JpaContractRepository.findById(id);
    }
}

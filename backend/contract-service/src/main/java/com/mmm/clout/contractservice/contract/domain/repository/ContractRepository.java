package com.mmm.clout.contractservice.contract.domain.repository;


import com.mmm.clout.contractservice.contract.domain.Contract;

import java.util.Optional;

public interface ContractRepository {

    Contract save(Contract contract);

    Optional<Contract> findById(Long id);
}

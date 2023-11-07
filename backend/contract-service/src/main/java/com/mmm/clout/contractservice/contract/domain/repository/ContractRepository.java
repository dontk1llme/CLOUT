package com.mmm.clout.contractservice.contract.domain.repository;


import com.mmm.clout.contractservice.contract.domain.Contract;

import java.util.List;
import java.util.Optional;

public interface ContractRepository {

    Contract save(Contract contract);

    Optional<Contract> findById(Long id);

    void delete(Contract contract);
    List<Contract> findAllByClouterInfoClouterId(Long clouterId);

    List<Contract> findAllByAdvertiserInfoAdvertiserId(Long advertiserId);
}

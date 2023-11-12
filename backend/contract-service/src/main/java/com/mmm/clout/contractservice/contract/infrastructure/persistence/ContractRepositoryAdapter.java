package com.mmm.clout.contractservice.contract.infrastructure.persistence;


import com.mmm.clout.contractservice.contract.domain.Contract;
import com.mmm.clout.contractservice.contract.domain.repository.ContractRepository;
import com.mmm.clout.contractservice.contract.infrastructure.persistence.jpa.JpaContractRepository;
import lombok.RequiredArgsConstructor;

import java.util.List;
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

    @Override
    public void delete(Contract contract) {
        JpaContractRepository.delete(contract);
    }

    @Override
    public List<Contract> findAllByClouterInfoClouterId(Long clouterId) {
        return JpaContractRepository.findAllByClouterInfo_ClouterId(clouterId);
    }

    @Override
    public List<Contract> findAllByAdvertiserInfoAdvertiserId(Long advertiserId) {
        return JpaContractRepository.findAllByAdvertiserInfo_AdvertiserId(advertiserId);
    }

    @Override
    public Optional<Contract> findByAdvertiserInfo_AdvertiserIdAndClouterInfo_ClouterId(
            Long advertiserId,
            Long clouterId
            ) {
        return JpaContractRepository.findByAdvertiserInfo_AdvertiserIdAndClouterInfo_ClouterId(
                advertiserId,
                clouterId
                );
    }


}

package com.mmm.clout.contractservice.contract.infrastructure.persistence.jpa;

import com.mmm.clout.contractservice.contract.domain.Contract;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface JpaContractRepository extends JpaRepository<Contract, Long> {

    List<Contract> findAllByClouterInfo_ClouterId(Long id);

    List<Contract> findAllByAdvertiserInfo_AdvertiserId(Long id);
}

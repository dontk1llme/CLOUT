package com.mmm.clout.contractservice.contract.infrastructure.persistence.jpa;

import com.mmm.clout.contractservice.contract.domain.Contract;
import org.springframework.data.jpa.repository.JpaRepository;

public interface JpaContractRepository extends JpaRepository<Contract, Long> {
}

package com.mmm.clout.pointservice.point.infrastructure.persistence.jpa;

import com.mmm.clout.pointservice.point.domain.PointTransaction;
import org.springframework.data.jpa.repository.JpaRepository;

public interface JpaPointTransactionRepository extends JpaRepository<PointTransaction, Long> {

}

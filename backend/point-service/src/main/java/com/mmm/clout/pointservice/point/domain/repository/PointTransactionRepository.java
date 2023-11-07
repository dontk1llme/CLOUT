package com.mmm.clout.pointservice.point.domain.repository;

import com.mmm.clout.pointservice.point.domain.PointTransaction;

public interface PointTransactionRepository {

    void save(PointTransaction chargedPtx);
}

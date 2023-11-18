package com.mmm.clout.pointservice.point.infrastructure;

import com.mmm.clout.pointservice.point.domain.Point;
import com.mmm.clout.pointservice.point.domain.PointCategory;
import com.mmm.clout.pointservice.point.domain.PointTransaction;
import com.mmm.clout.pointservice.point.domain.repository.PointTransactionRepository;
import com.mmm.clout.pointservice.point.infrastructure.persistence.jpa.JpaPointTransactionRepository;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class PointTransactionRepositoryAdapter implements PointTransactionRepository {

    private final JpaPointTransactionRepository jpaPointTransactionRepository;


    @Override
    public void save(PointTransaction chargedPtx) {
        jpaPointTransactionRepository.save(chargedPtx);
    }

    @Override
    public List<PointTransaction> findByPointAndPointCategory(Point point, PointCategory category) {
        return jpaPointTransactionRepository.findByPointAndPointCategory(point, category);
    }
}

package com.mmm.clout.pointservice.point.application;

import com.mmm.clout.pointservice.point.domain.Point;
import com.mmm.clout.pointservice.point.domain.PointCategory;
import com.mmm.clout.pointservice.point.domain.PointStatus;
import com.mmm.clout.pointservice.point.domain.PointTransaction;
import com.mmm.clout.pointservice.point.domain.exception.PointNotFoundException;
import com.mmm.clout.pointservice.point.domain.repository.PointRepository;
import com.mmm.clout.pointservice.point.domain.repository.PointTransactionRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
public class ReducePointProcessor {

    private final PointRepository pointRepository;
    private final PointTransactionRepository pointTransactionRepository;


    @Transactional
    public void execute(Long memberId, Long reducingPoint, PointCategory pointCategory) {
        Point point = pointRepository.findByMemberId(memberId).map(
            existingPoint -> {
                // 기존 엔티티가 존재하는 경우, 포인트를 업데이트
                existingPoint.reducePoint(reducingPoint);
                return existingPoint;
            }).orElseThrow(PointNotFoundException::new);
        PointTransaction usedPointTsx = PointTransaction.usePoint(point, memberId, pointCategory);
        pointTransactionRepository.save(usedPointTsx);
    }
}

package com.mmm.clout.pointservice.point.application;

import com.mmm.clout.pointservice.point.domain.PaymentType;
import com.mmm.clout.pointservice.point.domain.Point;
import com.mmm.clout.pointservice.point.domain.PointTransaction;
import com.mmm.clout.pointservice.point.domain.repository.PointRepository;
import com.mmm.clout.pointservice.point.domain.repository.PointTransactionRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
public class ChargePointProcessor {

    private final PointRepository pointRepository;
    private final PointTransactionRepository pointTransactionRepository;

    // TODO 멤버에 들어가있는 총 토탈포인트 변경 & 결제

    @Transactional
    public void execute(Long memberId, Long chargePoint, PaymentType paymentType) {
        Point point = pointRepository.findByMemberId(memberId).map(
            existingPoint -> {
                // 기존 엔티티가 존재하는 경우, 포인트를 업데이트
                existingPoint.addPoints(chargePoint);
                return existingPoint;
            }).orElseGet(() -> {
            // 새 엔티티를 생성
            return Point.create(memberId, chargePoint);
        });

        // 변경된 엔티티를 저장 or 업데이트
        Point savedPoint = pointRepository.save(point);
        PointTransaction chargedPtx = PointTransaction.charge(savedPoint, chargePoint);
        pointTransactionRepository.save(chargedPtx);
    }
}

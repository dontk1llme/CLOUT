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

    // TODO 결제
    @Transactional
    public void execute(Long memberId, Long chargePoint, PaymentType paymentType) {
        Point point = Point.charge(memberId, chargePoint);
        Point savedPoint = pointRepository.save(point);
        PointTransaction chargedPtx = PointTransaction.charge(savedPoint, chargePoint);
        pointTransactionRepository.save(chargedPtx);
    }
}

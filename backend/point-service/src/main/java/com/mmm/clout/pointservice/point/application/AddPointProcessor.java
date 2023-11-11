package com.mmm.clout.pointservice.point.application;

import com.mmm.clout.pointservice.point.application.command.AddPointCommand;
import com.mmm.clout.pointservice.point.domain.Point;
import com.mmm.clout.pointservice.point.domain.PointTransaction;
import com.mmm.clout.pointservice.point.domain.repository.PointRepository;
import com.mmm.clout.pointservice.point.domain.repository.PointTransactionRepository;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class AddPointProcessor {

    private final PointRepository pointRepository;
    private final PointTransactionRepository pointTransactionRepository;

    public PointTransaction execute(AddPointCommand command) {
        Point point = pointRepository.findByMemberId(command.getMemberId())
            .orElseGet(() -> pointRepository.save(Point.create(command.getMemberId(), 0L)));
        point.add(command.getAddingPoint());
        PointTransaction pts = PointTransaction.add(point, command.getAddingPoint(), command.getPointCategory(), command.getCounterParty());
        return pointTransactionRepository.save(pts);
    }
}

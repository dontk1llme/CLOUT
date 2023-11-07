package com.mmm.clout.pointservice.point.application.facade;

import com.mmm.clout.pointservice.point.application.ChargePointProcessor;
import com.mmm.clout.pointservice.point.application.ReducePointProcessor;
import com.mmm.clout.pointservice.point.application.command.ChargeCommand;
import com.mmm.clout.pointservice.point.application.command.ReduceCommand;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class PointFacade {

    private final ChargePointProcessor chargePointProcessor;
    private final ReducePointProcessor reducePointProcessor;

    public void charge(ChargeCommand command) {
        chargePointProcessor.execute(command.getMemberId(), command.getChargePoint(),  command.getPaymentType());
    }

    public void reduce(ReduceCommand command) {
        reducePointProcessor.execute(command.getMemberId(), command.getReducingPoint(), command.getPointCategory());
    }
}

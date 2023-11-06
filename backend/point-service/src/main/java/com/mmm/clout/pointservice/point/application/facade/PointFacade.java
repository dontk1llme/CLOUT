package com.mmm.clout.pointservice.point.application.facade;

import com.mmm.clout.pointservice.point.application.ChargePointProcessor;
import com.mmm.clout.pointservice.point.application.command.ChargeCommand;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class PointFacade {

    private final ChargePointProcessor chargePointProcessor;

    public void charge(ChargeCommand command) {
        chargePointProcessor.execute(command.getMemberId(), command.getChargePoint(),  command.getPaymentType());
    }
}

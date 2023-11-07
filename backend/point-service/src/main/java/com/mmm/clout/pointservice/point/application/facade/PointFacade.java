package com.mmm.clout.pointservice.point.application.facade;

import com.mmm.clout.pointservice.point.application.ChargePointProcessor;
import com.mmm.clout.pointservice.point.application.GetMemberPointProcessor;
import com.mmm.clout.pointservice.point.application.ReducePointProcessor;
import com.mmm.clout.pointservice.point.application.WithdrawPointProcessor;
import com.mmm.clout.pointservice.point.application.command.ChargeCommand;
import com.mmm.clout.pointservice.point.application.command.ReduceCommand;
import com.mmm.clout.pointservice.point.application.command.WithdrawCommand;
import com.mmm.clout.pointservice.point.domain.Point;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class PointFacade {

    private final ChargePointProcessor chargePointProcessor;
    private final ReducePointProcessor reducePointProcessor;
    private final WithdrawPointProcessor withdrawPointProcessor;
    private final GetMemberPointProcessor getMemberPointProcessor;

    public void charge(ChargeCommand command) {
        chargePointProcessor.execute(command.getMemberId(), command.getChargePoint(),  command.getPaymentType());
    }

    public void reduce(ReduceCommand command) {
        reducePointProcessor.execute(command.getMemberId(), command.getReducingPoint(), command.getPointCategory());
    }

    public void withdraw(WithdrawCommand command) {
        withdrawPointProcessor.execute(command);
    }

    public Point getMemberPoint(Long memberId) {
        return getMemberPointProcessor.execute(memberId);
    }
}

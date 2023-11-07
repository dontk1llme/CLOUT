package com.mmm.clout.pointservice.point.presentation;

import com.mmm.clout.pointservice.point.application.facade.PointFacade;
import com.mmm.clout.pointservice.point.presentation.request.ChargePointRequest;
import com.mmm.clout.pointservice.point.presentation.request.ReducePointRequest;
import com.mmm.clout.pointservice.point.presentation.request.WithdrawPointRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/v1/points")
@RequiredArgsConstructor
public class PointController {

    private final PointFacade pointFacade;

    /**
     * 충전
     */
    @PostMapping("/charge")
    public ResponseEntity<Void> charge(
        @RequestBody ChargePointRequest request
    ) {
        pointFacade.charge(request.toCommand());
        return new ResponseEntity<>(HttpStatus.OK);
    }

    /**
     * 차감 (포인트 사용)
     */
    @PostMapping("/reduce")
    public ResponseEntity<Void> reduce(
        @RequestBody ReducePointRequest request
    ) {
        pointFacade.reduce(request.toCommand());
        return new ResponseEntity<>(HttpStatus.OK);
    }

    /**
     * 출금
     */
    @PostMapping("/withdraw")
    public ResponseEntity<Void> withdraw(
        @RequestBody WithdrawPointRequest request
    ) {
        pointFacade.withdraw(request.toCommand());
        return new ResponseEntity<>(HttpStatus.OK);
    }

}

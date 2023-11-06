package com.mmm.clout.pointservice.point.presentation;

import com.mmm.clout.pointservice.point.application.facade.PointFacade;
import com.mmm.clout.pointservice.point.presentation.request.ChargeRequest;
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
    @PostMapping("/charge")
    public ResponseEntity<Void> charge(
        @RequestBody ChargeRequest request
    ) {
        pointFacade.charge(request.toCommand());
        return new ResponseEntity<>(HttpStatus.OK);
    }

}

package com.mmm.clout.advertisementservice.apply.presentation;

import com.mmm.clout.advertisementservice.apply.application.facade.ApplyFacade;
import com.mmm.clout.advertisementservice.apply.presentation.request.CreateApplyRequest;
import com.mmm.clout.advertisementservice.apply.presentation.response.CreateApplyResponse;
import javax.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/applies")
@RequiredArgsConstructor
public class ApplyController {

    private final ApplyFacade applyFacade;
    @PostMapping
    public ResponseEntity<CreateApplyResponse> createApply(
        @RequestBody @Valid CreateApplyRequest createApplyRequest
    ) {

        return new ResponseEntity<>(null, HttpStatus.CREATED);
    }
}

package com.mmm.clout.advertisementservice.apply.presentation;

import com.mmm.clout.advertisementservice.apply.application.facade.ApplyFacade;
import com.mmm.clout.advertisementservice.apply.domain.Apply.ApplyStatus;
import com.mmm.clout.advertisementservice.apply.presentation.request.CreateApplyRequest;
import com.mmm.clout.advertisementservice.apply.presentation.response.CreateApplyResponse;
import com.mmm.clout.advertisementservice.apply.presentation.response.GetAllByStatusResponse;
import javax.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
        CreateApplyResponse result = CreateApplyResponse.from(applyFacade.create(createApplyRequest.toCommand()));
        return new ResponseEntity<>(result, HttpStatus.CREATED);
    }

    @PostMapping("/{applyId}/cancel")
    public ResponseEntity<String> cancelApply(
        @PathVariable Long applyId
    ) {
        applyFacade.cancel(applyId);
        return new ResponseEntity<>("신청 취소 완료", HttpStatus.OK);
    }

    @GetMapping
    public ResponseEntity<GetAllByStatusResponse> getApplyListByStatus(
        @RequestParam Long clouterId,
        @RequestParam ApplyStatus type
    ) {
        GetAllByStatusResponse result = GetAllByStatusResponse.from(applyFacade.getAllByApplyStatus(clouterId, type));
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

}

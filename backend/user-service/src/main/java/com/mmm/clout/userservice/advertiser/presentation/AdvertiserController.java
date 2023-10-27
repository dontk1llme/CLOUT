package com.mmm.clout.userservice.advertiser.presentation;

import com.mmm.clout.userservice.advertiser.application.facade.AdvertiserFacade;
import com.mmm.clout.userservice.advertiser.presentation.request.CreateAdrRequest;
import com.mmm.clout.userservice.advertiser.presentation.response.CreateAdrResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

@RestController
@RequestMapping("/member/advertiser")
@RequiredArgsConstructor
public class AdvertiserController {

    private final AdvertiserFacade advertiserFacade;

    @PostMapping
    public ResponseEntity<CreateAdrResponse> create(
        @RequestBody @Valid CreateAdrRequest createAdrRequest
    ) {
        CreateAdrResponse result = CreateAdrResponse.from(
            advertiserFacade.create(createAdrRequest.toCommand())
        );
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

}

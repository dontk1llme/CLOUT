package com.mmm.clout.advertisementservice.advertisements.persentation;

import com.mmm.clout.advertisementservice.advertisements.application.facade.AdvertisementFacade;
import com.mmm.clout.advertisementservice.advertisements.persentation.request.CreateAdRequest;
import com.mmm.clout.advertisementservice.advertisements.persentation.response.CreateAdResponse;
import javax.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/advertisements")
@RequiredArgsConstructor
public class AdvertisementController{

    private final AdvertisementFacade advertisementFacade;

    @PostMapping
    public ResponseEntity<CreateAdResponse> create(
        @RequestBody @Valid CreateAdRequest createAdRequest
    ) {
        CreateAdResponse result = CreateAdResponse.from(
            advertisementFacade.create(createAdRequest.toCommand())
        );
        return new ResponseEntity<>(result, HttpStatus.OK);
    }


}

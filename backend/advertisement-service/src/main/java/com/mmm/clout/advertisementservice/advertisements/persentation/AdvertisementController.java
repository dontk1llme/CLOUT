package com.mmm.clout.advertisementservice.advertisements.persentation;

import com.mmm.clout.advertisementservice.advertisements.application.facade.AdvertisementFacade;
import com.mmm.clout.advertisementservice.advertisements.persentation.request.CreateCampaignRequest;
import com.mmm.clout.advertisementservice.advertisements.persentation.request.UpdateCampaignRequest;
import com.mmm.clout.advertisementservice.advertisements.persentation.response.CreateCampaignResponse;
import com.mmm.clout.advertisementservice.advertisements.persentation.response.DeleteCampaignResponse;
import com.mmm.clout.advertisementservice.advertisements.persentation.response.UpdateCampaignResponse;
import com.mmm.clout.advertisementservice.common.docs.AdvertisementControllerDocs;
import javax.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/advertisements")
@RequiredArgsConstructor
public class AdvertisementController implements AdvertisementControllerDocs {

    private final AdvertisementFacade advertisementFacade;

    // TODO Point 도메인과 연결 & 이미지 저장 필요
    // 등록하기 전 포인트 10,000포인트 있어야 함. 없으면 충전 페이지로 이동.

    @PostMapping
    public ResponseEntity<CreateCampaignResponse> createCampaign(
        @RequestBody @Valid CreateCampaignRequest createCampaignRequest
    ) {
        CreateCampaignResponse result = CreateCampaignResponse.from(
            advertisementFacade.create(createCampaignRequest.toCommand())
        );
        return new ResponseEntity<>(result, HttpStatus.CREATED);
    }


    @PutMapping("/{advertisementId}")
    public ResponseEntity<UpdateCampaignResponse> updateCampaign(
        @PathVariable Long advertisementId,
        @RequestBody @Valid UpdateCampaignRequest updateCampaignRequest
    ) {
        UpdateCampaignResponse result = UpdateCampaignResponse.from(advertisementFacade.update(advertisementId, updateCampaignRequest.toCommand()));
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    @PostMapping("/{advertisementId}")
    public ResponseEntity<DeleteCampaignResponse> deleteCampaign(
        @PathVariable Long advertisementId
    ) {
        advertisementFacade.delete(advertisementId);
        DeleteCampaignResponse result = DeleteCampaignResponse.from(advertisementId);
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

}

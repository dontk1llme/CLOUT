package com.mmm.clout.advertisementservice.advertisements.persentation;

import com.mmm.clout.advertisementservice.advertisements.application.facade.AdvertisementFacade;
import com.mmm.clout.advertisementservice.advertisements.application.reader.CampaignReader;
import com.mmm.clout.advertisementservice.advertisements.domain.Campaign;
import com.mmm.clout.advertisementservice.advertisements.persentation.request.CreateCampaignRequest;
import com.mmm.clout.advertisementservice.advertisements.persentation.request.UpdateCampaignRequest;
import com.mmm.clout.advertisementservice.advertisements.persentation.response.CreateCampaignResponse;
import com.mmm.clout.advertisementservice.advertisements.persentation.response.DeleteCampaignResponse;
import com.mmm.clout.advertisementservice.advertisements.persentation.response.GetCampaignResponse;
import com.mmm.clout.advertisementservice.advertisements.persentation.response.UpdateCampaignResponse;
import com.mmm.clout.advertisementservice.common.docs.AdvertisementControllerDocs;
import java.util.List;
import javax.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/v1/advertisements")
@RequiredArgsConstructor
public class AdvertisementController implements AdvertisementControllerDocs {

    private final AdvertisementFacade advertisementFacade;

    // TODO Point 도메인과 연결 & 이미지 저장 필요
    // 등록하기 전 포인트 10,000포인트 있어야 함. 없으면 충전 페이지로 이동.

    /**
     * 광고 캠페인 등록
     */
    @PostMapping
    public ResponseEntity<CreateCampaignResponse> createCampaign(
        @RequestBody @Valid CreateCampaignRequest createCampaignRequest
    ) {
        CreateCampaignResponse result = CreateCampaignResponse.from(
            advertisementFacade.create(createCampaignRequest.toCommand())
        );
        return new ResponseEntity<>(result, HttpStatus.CREATED);
    }

    /**
     * 캠페인 수정
     */

    @PutMapping("/{advertisementId}")
    public ResponseEntity<UpdateCampaignResponse> updateCampaign(
        @PathVariable Long advertisementId,
        @RequestBody @Valid UpdateCampaignRequest updateCampaignRequest
    ) {
        UpdateCampaignResponse result = UpdateCampaignResponse.from(
            advertisementFacade.update(advertisementId, updateCampaignRequest.toCommand()));
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    /**
     * 캠페인 삭제 (soft delete)
     */

    @PostMapping("/{advertisementId}")
    public ResponseEntity<DeleteCampaignResponse> deleteCampaign(
        @PathVariable Long advertisementId
    ) {
        advertisementFacade.delete(advertisementId);
        DeleteCampaignResponse result = DeleteCampaignResponse.from(advertisementId);
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    /**
     * 캠페인 캠페인 상세 조회 (광고주 정보 포함)
     */

    @GetMapping("/{advertisementId}")
    public ResponseEntity<GetCampaignResponse> getCampaign(
        @PathVariable Long advertisementId
    ) {
        GetCampaignResponse result = GetCampaignResponse.from(
            advertisementFacade.get(advertisementId)
        );

        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    /**
     * 인기 있는 광고 리스트 (10개) 조회 (신청자 수 많은 순 / 모집기간 내 / 우선순위가 같을경우, 최신순)
     * 복잡한 조건이라 jpa 쿼리로 작성하기에 가독성이 좋지 않으므로 jpql 사용
     */
    @GetMapping("/top10")
    public ResponseEntity<Void> getTop10Campaigns() {
        List<Campaign> result = advertisementFacade.getTop10();
        return new ResponseEntity<>(HttpStatus.OK);
    }

}

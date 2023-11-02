package com.mmm.clout.advertisementservice.advertisements.persentation.response;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.mmm.clout.advertisementservice.advertisements.application.reader.CampaignReader;
import com.mmm.clout.advertisementservice.advertisements.domain.Campaign;
import com.mmm.clout.advertisementservice.common.msa.info.AdvertiserInfo;
import lombok.AllArgsConstructor;
import lombok.Getter;

@JsonInclude(Include.NON_NULL)
@Getter
@AllArgsConstructor
public class GetCampaignResponse {

    private CampaignResponse campaignInfo;

    private AdvertiserInfo advertiserInfo;

    public static GetCampaignResponse from(CampaignReader reader) {
        Campaign campaign = reader.getCampaign();
        AdvertiserInfo advertiser = reader.getAdvertiserInfo();
        return new GetCampaignResponse(
            new CampaignResponse(
                campaign.getId(),
                campaign.getAdPlatformList(),
                campaign.getPrice(),
                campaign.getDetails(),
                campaign.getDeletedAt(),
                campaign.getAdCategory(),
                campaign.getIsPriceChangeable(),
                campaign.getIsDeliveryRequired(),
                campaign.getNumberOfRecruiter(),
                campaign.getNumberOfApplicants(),
                campaign.getNumberOfSelectedMembers(),
                campaign.getOfferingDetails(),
                campaign.getSellingLink(),
                campaign.getApplyStartDate(),
                campaign.getApplyEndDate(),
                campaign.getMinClouterAge(),
                campaign.getMaxClouterAge(),
                campaign.getMinFollower()
            ),
            advertiser
        );
    }
}

/*
조회되는 내용
1. 카테고리
2. 타이틀
3. 협찬제공사
4. 희망 플랫폼들
5. 신청 기간: 시작일, 종료일
6. 희망 광고비: 숫자 (Long 범위)
7. 신청자 수
8. 모집인원
9. 배송 체크 여부
10. 제공 내역  + 판매처 링크
11.  상세 내용 (요구사항)
12. 주의사항 (프론트에서 박기)
13. 광고주 별점
—————-
<광고주>
신청자 목록 보기 버튼 있음
<인플루언서>
신청하기 버튼 있음
 */
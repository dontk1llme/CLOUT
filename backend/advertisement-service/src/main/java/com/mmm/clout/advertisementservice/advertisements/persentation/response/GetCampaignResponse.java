package com.mmm.clout.advertisementservice.advertisements.persentation.response;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.mmm.clout.advertisementservice.advertisements.domain.AdCategory;
import com.mmm.clout.advertisementservice.common.msa.info.AdvertiserInfo;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;

@JsonInclude(Include.NON_NULL)
@Getter
@AllArgsConstructor
public class GetCampaignResponse {


    private Long campaignId;

    private List<String> adPlatformList;

    private Long price;

    private String details;

    private LocalDateTime deletedAt;

    private AdCategory adCategory; // 광고 카테고리

    private Boolean isPriceChangeable; // 광고비 협의 여부

    private Boolean isDeliveryRequired; // 배송 여부

    private Integer numberOfRecruiter; // 모집인원

    private Integer numberOfApplicants; // 신청인원

    private Integer numberOfSelectedMembers; // 채택 인원

    private String offeringDetails; // 제공 내역 설명

    private String sellingLink; // 판매처 링크 (선택사항)

    private LocalDate applyStartDate; // 모집 시작 날짜

    private LocalDate applyEndDate; // 모집 종료 날짜

    private Integer minClouterAge; // 최소 클라우터 나이

    private Integer maxClouterAge; // 최대 클라우터 나이

    private Integer minFollower; // 최소 팔로워 수

    private AdvertiserInfo advertiserInfo;

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
package com.mmm.clout.advertisementservice.advertisements.persentation.response;

import com.mmm.clout.advertisementservice.advertisements.application.reader.CampaignReader;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class GetTop10CampainListResponse {

//    private ImageResponse imageResponse;
    private List<CampaignReader> top10CampaignList;

    public static GetTop10CampainListResponse from(List<CampaignReader> result) {
        return new GetTop10CampainListResponse(result);
    }
}
/*
- 사진
- 카테고리
- 플랫폼 리스트
- 채택수/모집인원
- 광고비
- 업체명
- 업체 별점
 */

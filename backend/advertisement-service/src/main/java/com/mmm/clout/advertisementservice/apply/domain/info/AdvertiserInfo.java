package com.mmm.clout.advertisementservice.apply.domain.info;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

@Getter
@AllArgsConstructor
@ToString
public class AdvertiserInfo {

    private Long advertiserId; // memberId

    private String userId; // 아이디

    private Long totalPoint;

    private String role;

    private Long advertiserAvgStar;

    private AddressInfo addressInfo;

    private CompanyInfo companyInfo;
}

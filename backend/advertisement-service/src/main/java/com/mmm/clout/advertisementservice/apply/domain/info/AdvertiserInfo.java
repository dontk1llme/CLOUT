package com.mmm.clout.advertisementservice.apply.domain.info;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

@Getter
@AllArgsConstructor
@ToString
public class AdvertiserInfo {

    private Long advertiserId; // memberId

    private AddressInfo addressInfo;

    private CompanyInfo companyInfo;
}

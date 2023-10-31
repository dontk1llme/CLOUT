package com.mmm.clout.advertisementservice.advertisements.domain.info;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class AdvertiserInfo {

    private Long advertiserId; // memberId

    private AddressInfo address;

    private CompanyInfo companyInfo;
}

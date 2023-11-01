package com.mmm.clout.memberservice.advertiser.presentation.response;

import com.mmm.clout.memberservice.advertiser.domain.Advertiser;
import com.mmm.clout.memberservice.common.entity.address.response.AddressResponse;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class SelectAdrResponse {

    private Long advertiserId;

    private AddressResponse addressInfo;

    private CompanyInfoResponse companyInfo;


    public SelectAdrResponse(Advertiser advertiser) {
        this.advertiserId = advertiser.getId();
        this.addressInfo = new AddressResponse(advertiser.getAddress());
        this.companyInfo = new CompanyInfoResponse(advertiser.getCompanyInfo());
    }

    public static SelectAdrResponse from(Advertiser advertiser) {
        SelectAdrResponse response = new SelectAdrResponse(advertiser);
        return response;
    }
}

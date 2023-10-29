package com.mmm.clout.userservice.advertiser.presentation.response;

import com.mmm.clout.userservice.advertiser.domain.Advertiser;
import com.mmm.clout.userservice.common.entity.address.response.AddressResponse;
import lombok.AllArgsConstructor;
import lombok.Getter;

import javax.persistence.Embedded;

@Getter
@AllArgsConstructor
public class SelectAdrResponse {

    private String userId;

    private String pwd;

    private AddressResponse address;

    private CompanyInfoResponse companyInfo;


    public SelectAdrResponse(Advertiser advertiser) {
        this.userId = advertiser.getUserId();
        this.pwd = advertiser.getPwd();
        this.address = new AddressResponse(advertiser.getAddress());
        this.companyInfo = new CompanyInfoResponse(advertiser.getCompanyInfo());
    }

    public static SelectAdrResponse from(Advertiser advertiser) {
        SelectAdrResponse response = new SelectAdrResponse(advertiser);
        return response;
    }
}

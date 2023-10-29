package com.mmm.clout.userservice.advertiser.presentation.response;

import com.mmm.clout.userservice.advertiser.domain.CompanyInfo;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class CompanyInfoResponse {

    private String companyName;

    private String regNum;

    private String managerName;

    private String managerPhoneNumber;

    public CompanyInfoResponse(CompanyInfo companyInfo) {
        this.companyName = companyInfo.getCompanyName();
        this.regNum = companyInfo.getRegNum();
        this.managerName = companyInfo.getManagerName();
        this.managerPhoneNumber = companyInfo.getManagerPhoneNumber();
    }
}
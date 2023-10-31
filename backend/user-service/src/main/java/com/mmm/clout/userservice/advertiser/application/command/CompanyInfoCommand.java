package com.mmm.clout.userservice.advertiser.application.command;

import com.mmm.clout.userservice.advertiser.domain.CompanyInfo;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class CompanyInfoCommand {

    private String companyName;

    private String regNum;

    private String managerName;

    private String managerPhoneNumber;

    public CompanyInfo toValueType() {
        return new CompanyInfo(
            this.companyName,
            this.regNum,
            this.managerName,
            this.managerPhoneNumber
        );
    }
}
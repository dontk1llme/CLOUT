package com.mmm.clout.memberservice.advertiser.application.command;

import com.mmm.clout.memberservice.advertiser.domain.CompanyInfo;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class CompanyInfoCommand {

    private String companyName;

    private String regNum;

    private String ceoName;

    private String managerName;

    private String managerPhoneNumber;

    public CompanyInfo toValueType() {
        return new CompanyInfo(
            this.companyName,
            this.regNum,
            this.ceoName,
            this.managerName,
            this.managerPhoneNumber
        );
    }
}
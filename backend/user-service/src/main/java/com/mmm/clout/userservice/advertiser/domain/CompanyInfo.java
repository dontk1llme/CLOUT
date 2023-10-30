package com.mmm.clout.userservice.advertiser.domain;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.Embeddable;

@Embeddable
@Getter
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class CompanyInfo {

    private String companyName;

    private String regNum;

    private String managerName;

    private String managerPhoneNumber;
}

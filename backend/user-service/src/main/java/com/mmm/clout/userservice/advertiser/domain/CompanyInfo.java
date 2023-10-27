package com.mmm.clout.userservice.advertiser.domain;

import javax.persistence.Embeddable;

@Embeddable
public class CompanyInfo {

    private String companyName;

    private String regNum;

    private String managerName;

    private String managerPhoneNumber;
}

package com.mmm.clout.userservice.advertiser.domain;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.Size;

@Embeddable
@Getter
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class CompanyInfo {

    @Column(length = 30)
    private String companyName;

    private String regNum;

    @Column(length = 20)
    private String managerName;

    @Column(length = 30)
    private String managerPhoneNumber;
}

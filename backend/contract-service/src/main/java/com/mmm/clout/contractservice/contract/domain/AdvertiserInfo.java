package com.mmm.clout.contractservice.contract.domain;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.Embeddable;

@Embeddable
@AllArgsConstructor
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class AdvertiserInfo {

    private String representativeName;

    private String advertiserAddress;

    private String companyName;

    private String regNum;
}

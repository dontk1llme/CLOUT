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
public class ClouterInfo {

    private Long clouterId;

    private String clouterName;

    private String clouterAddress;

    private String residentRegistrationNumber;

    public ClouterInfo updateResidentRegistrationNumber(String residentRegistrationNumber) {
        this.residentRegistrationNumber = residentRegistrationNumber;
        return this;
    }

}

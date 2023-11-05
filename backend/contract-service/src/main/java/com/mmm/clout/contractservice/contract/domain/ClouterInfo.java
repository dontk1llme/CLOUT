package com.mmm.clout.contractservice.contract.domain;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import javax.persistence.Embeddable;

@Embeddable
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class ClouterInfo {

    private String clouterName;

    private String clouterAddress;

    private String residentRegistrationNumber;
}

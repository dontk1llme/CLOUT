package com.mmm.clout.advertisementservice.advertisements.domain.info;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class AddressInfo {

    private String zipCode;

    private String mainAddress;

    private String detailAddress;

}

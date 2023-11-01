package com.mmm.clout.advertisementservice.apply.domain.info;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

@Getter
@AllArgsConstructor
@ToString
public class AddressInfo {

    private String zipCode;

    private String mainAddress;

    private String detailAddress;

}

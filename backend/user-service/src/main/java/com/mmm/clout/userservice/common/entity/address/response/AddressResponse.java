package com.mmm.clout.userservice.common.entity.address.response;

import com.mmm.clout.userservice.common.entity.address.Address;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class AddressResponse {

    private String zipCode;

    private String mainAddress;

    private String detailAddress;

    public AddressResponse(Address address) {
        this.zipCode = address.getZipCode();
        this.mainAddress = address.getMainAddress();
        this.detailAddress = address.getDetailAddress();
    }
}

package com.mmm.clout.userservice.advertiser.presentation.response;

import com.mmm.clout.userservice.advertiser.application.command.AddressCommand;
import com.mmm.clout.userservice.advertiser.domain.Advertiser;
import com.mmm.clout.userservice.common.entity.Address;
import lombok.AllArgsConstructor;
import lombok.Getter;

import javax.validation.constraints.NotBlank;

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

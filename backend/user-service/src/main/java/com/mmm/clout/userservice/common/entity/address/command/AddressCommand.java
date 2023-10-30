package com.mmm.clout.userservice.common.entity.address.command;

import com.mmm.clout.userservice.common.entity.address.Address;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class AddressCommand {

    private String zipCode;

    private String mainAddress;

    private String detailAddress;

    public Address toValueType() {
        return new Address(
            this.zipCode,
            this.mainAddress,
            this.detailAddress);
    }


}
package com.mmm.clout.userservice.advertiser.presentation.request;

import com.mmm.clout.userservice.advertiser.application.command.AddressCommand;
import lombok.AllArgsConstructor;
import lombok.Getter;

import javax.validation.constraints.NotBlank;

@Getter
@AllArgsConstructor
public class AddressRequest {
    @NotBlank
    private String zipCode;

    @NotBlank
    private String mainAddress;

    @NotBlank
    private String detailAddress;

    public AddressCommand toCommand() {
        return new AddressCommand(
            this.zipCode,
            this.mainAddress,
            this.detailAddress
        );
    }
}

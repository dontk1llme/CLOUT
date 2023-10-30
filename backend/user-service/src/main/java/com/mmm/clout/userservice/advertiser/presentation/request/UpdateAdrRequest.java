package com.mmm.clout.userservice.advertiser.presentation.request;

import com.mmm.clout.userservice.advertiser.application.command.UpdateAdrCommand;
import com.mmm.clout.userservice.common.entity.address.request.AddressRequest;
import lombok.AllArgsConstructor;
import lombok.Getter;

import javax.validation.constraints.NotBlank;

@Getter
@AllArgsConstructor
public class UpdateAdrRequest {

    @NotBlank

    @NotBlank
    private String pwd;

    private AddressRequest address;

    private CompanyInfoRequest companyInfo;

    public UpdateAdrCommand toCommand(Long advertiserId) {
        return new UpdateAdrCommand(
                advertiserId,
                this.pwd,
                this.address.toCommand(),
                this.companyInfo.toCommand()
        );
    }
}

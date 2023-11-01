package com.mmm.clout.memberservice.advertiser.presentation.request;

import com.mmm.clout.memberservice.advertiser.application.command.UpdateAdrCommand;
import com.mmm.clout.memberservice.common.entity.address.request.AddressRequest;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Getter;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Getter
@AllArgsConstructor
public class UpdateAdrRequest {

    @NotBlank
    @Schema(description = "비밀번호")
    @Size(min = 8, max = 20)
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

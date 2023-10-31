package com.mmm.clout.userservice.advertiser.presentation.request;

import com.mmm.clout.userservice.advertiser.application.command.CreateAdrCommand;
import com.mmm.clout.userservice.common.entity.address.request.AddressRequest;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Getter;

import javax.validation.constraints.NotBlank;

@Getter
@AllArgsConstructor
public class CreateAdrRequest {

    @NotBlank
    @Schema(description = "유저 아이디")
    private String userId;

    @NotBlank
    @Schema(description = "비밀번호")
    private String pwd;

    private AddressRequest address;

    private CompanyInfoRequest companyInfo;

    public CreateAdrCommand toCommand() {
        return new CreateAdrCommand(
            this.userId,
            this.pwd,
            this.address.toCommand(),
            this.companyInfo.toCommand()
        );
    }
}


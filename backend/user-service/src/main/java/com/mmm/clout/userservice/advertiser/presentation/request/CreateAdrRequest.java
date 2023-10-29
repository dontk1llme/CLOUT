package com.mmm.clout.userservice.advertiser.presentation.request;

import com.mmm.clout.userservice.advertiser.application.command.CreateAdrCommand;
import lombok.AllArgsConstructor;
import lombok.Getter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import javax.validation.constraints.NotBlank;

@Getter
@AllArgsConstructor
public class CreateAdrRequest {
    @NotBlank
    private String userId;

    @NotBlank
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


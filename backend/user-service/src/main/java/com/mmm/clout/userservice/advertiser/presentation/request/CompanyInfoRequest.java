package com.mmm.clout.userservice.advertiser.presentation.request;

import com.mmm.clout.userservice.advertiser.application.command.CompanyInfoCommand;
import lombok.AllArgsConstructor;
import lombok.Getter;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Getter
@AllArgsConstructor
public class CompanyInfoRequest {
    @NotBlank
    private String companyName;

    @NotBlank
    private String regNum;

    @NotBlank
    @Size(max = 10)
    private String managerName;

    @NotBlank
    @Size(max = 15)
    private String managerPhoneNumber;

    public CompanyInfoCommand toCommand() {
        return new CompanyInfoCommand(
            this.companyName,
            this.regNum,
            this.managerName,
            this.managerPhoneNumber
        );
    }
}
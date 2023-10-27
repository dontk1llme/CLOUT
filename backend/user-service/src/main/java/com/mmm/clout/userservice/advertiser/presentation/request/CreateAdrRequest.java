package com.mmm.clout.userservice.advertiser.presentation.request;

import com.mmm.clout.userservice.advertiser.application.command.CreateAdrCommand;
import lombok.AllArgsConstructor;
import lombok.Getter;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Getter
@AllArgsConstructor
public class CreateAdrRequest {

    @NotBlank
    private String advertiserId;

    @NotBlank
    private String pwd;

    private AddressRequest address;

    private CompanyInfoRequest companyInfo;

    @Getter
    @AllArgsConstructor
    public static class AddressRequest {
        @NotBlank
        private String zipCode;

        @NotBlank
        private String mainAddress;

        @NotBlank
        private String detailAddress;

        private CreateAdrCommand.AddressCommand toCommand() {
            return new CreateAdrCommand.AddressCommand(
                this.zipCode,
                this.mainAddress,
                this.detailAddress
            );
        }
    }

    @Getter
    @AllArgsConstructor
    public static class CompanyInfoRequest {
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

        private CreateAdrCommand.CompanyInfoCommand toCommand() {
            return new CreateAdrCommand.CompanyInfoCommand(
                this.companyName,
                this.regNum,
                this.managerName,
                this.managerPhoneNumber
            );
        }
    }

    public CreateAdrCommand toCommand() {
        return new CreateAdrCommand(
            this.advertiserId,
            this.pwd,
            this.address.toCommand(),
            this.companyInfo.toCommand()
        );
    }
}

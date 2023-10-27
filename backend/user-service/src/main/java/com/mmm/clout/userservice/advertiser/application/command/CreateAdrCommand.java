package com.mmm.clout.userservice.advertiser.application.command;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class CreateAdrCommand {

    private String advertiserId;

    private String pwd;

    private AddressCommand addressCommand;

    private CompanyInfoCommand companyInfoCommand;

    @Getter
    @AllArgsConstructor
    public static class AddressCommand {

        private String zipCode;

        private String mainAddress;

        private String detailAddress;

    }

    @Getter
    @AllArgsConstructor
    public static class CompanyInfoCommand {

        private String companyName;

        private String regNum;

        private String managerName;

        private String managerPhoneNumber;
    }
}


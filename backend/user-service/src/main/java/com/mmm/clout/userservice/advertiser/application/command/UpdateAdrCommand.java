package com.mmm.clout.userservice.advertiser.application.command;

import com.mmm.clout.userservice.advertiser.domain.Advertiser;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class UpdateAdrCommand {

    private Long advertiserId;

    private String userId;

    private String pwd;

    private AddressCommand addressCommand;

    private CompanyInfoCommand companyInfoCommand;
}


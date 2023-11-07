package com.mmm.clout.memberservice.advertiser.application.command;

import com.mmm.clout.memberservice.common.entity.address.command.AddressCommand;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class UpdateAdrCommand {

    private Long advertiserId;

    private String pwd;

    private AddressCommand addressCommand;

    private CompanyInfoCommand companyInfoCommand;
}


package com.mmm.clout.memberservice.advertiser.application.command;

import com.mmm.clout.memberservice.advertiser.domain.Advertiser;
import com.mmm.clout.memberservice.common.entity.address.command.AddressCommand;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class CreateAdrCommand {

    private String userId;

    private String pwd;

    private AddressCommand addressCommand;

    private CompanyInfoCommand companyInfoCommand;

    public Advertiser toEntity() {
        return Advertiser.create(
            this.userId,
            this.pwd,
            this.addressCommand.toValueType(),
            this.companyInfoCommand.toValueType()
        );
    }

}


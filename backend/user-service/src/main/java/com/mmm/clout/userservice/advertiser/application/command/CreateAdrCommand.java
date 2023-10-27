package com.mmm.clout.userservice.advertiser.application.command;

import com.mmm.clout.userservice.advertiser.domain.Advertiser;
import com.mmm.clout.userservice.advertiser.domain.CompanyInfo;
import com.mmm.clout.userservice.common.entity.Address;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class CreateAdrCommand {

    private String advertiserId;

    private String pwd;

    private AddressCommand addressCommand;

    private CompanyInfoCommand companyInfoCommand;

    public Advertiser toEntity() {
        return Advertiser.create(
            this.advertiserId,
            this.pwd,
            this.addressCommand.toValueType(),
            this.companyInfoCommand.toValueType()
        );
    }

}


package com.mmm.clout.contractservice.contract.application.command;

import com.mmm.clout.contractservice.contract.domain.Contract;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class CreateContractCommand {

    private String name;

    private Long price;

    private String postDeadline;

    private String contractExpiration;

    private String contents;

    private ClouterInfoCommand clouterInfo;

    private AdvertiserInfoCommand advertiserInfo;

    public Contract toEntity() {
        return Contract.create(
              this.name,
              this.price,
              this.postDeadline,
              this.contractExpiration,
              this.contents,
              this.clouterInfo.toValueType(),
              this.advertiserInfo.toValueType()
        );
    }
}

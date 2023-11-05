package com.mmm.clout.contractservice.contract.application.command;

import com.mmm.clout.contractservice.contract.domain.ClouterInfo;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class ClouterInfoCommand {

    private String clouterName;

    private String clouterAddress;

    public ClouterInfo toValueType() {
        return new ClouterInfo(
                this.clouterName,
                this.clouterAddress,
                ""
        );
    }
}

package com.mmm.clout.userservice.clouter.presentation.request;

import com.mmm.clout.userservice.clouter.application.command.HopeCostCommand;
import com.mmm.clout.userservice.common.entity.address.command.AddressCommand;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Getter;

import javax.validation.constraints.NotBlank;

@Getter
@AllArgsConstructor
public class HopeCostRequest {

    @NotBlank
    @Schema(description = "원하는 최소 금액")
    private Long minCost;

    @NotBlank
    @Schema(description = "원하는 최대 금액")
    private Long maxCost;

    public HopeCostCommand toCommand() {
        return new HopeCostCommand(
            this.minCost,
            this.maxCost
        );
    }
}

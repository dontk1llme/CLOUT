package com.mmm.clout.memberservice.clouter.presentation.request;

import com.mmm.clout.memberservice.clouter.application.command.HopeCostCommand;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Getter;

import javax.validation.constraints.NotNull;

@Getter
@AllArgsConstructor
public class HopeCostRequest {

    @NotNull
    @Schema(description = "원하는 최소 금액")
    private Long minCost;

    @NotNull
    @Schema(description = "원하는 최대 금액")
    private Long maxCost;

    public HopeCostCommand toCommand() {
        return new HopeCostCommand(
            this.minCost,
            this.maxCost
        );
    }
}

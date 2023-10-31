package com.mmm.clout.userservice.clouter.application.command;

import com.mmm.clout.userservice.clouter.domain.HopeCost;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class HopeCostCommand {

    private Long minCost;

    private Long maxCost;

    public HopeCost toValueType() {
        return new HopeCost(
            this.minCost,
            this.maxCost);
    }
}

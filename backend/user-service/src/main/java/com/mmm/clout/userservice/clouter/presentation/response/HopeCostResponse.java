package com.mmm.clout.userservice.clouter.presentation.response;

import com.mmm.clout.userservice.clouter.domain.HopeCost;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class HopeCostResponse {

    @Schema(description = "원하는 최소 금액")
    private Long minCost;

    @Schema(description = "원하는 최대 금액")
    private Long maxCost;

    public HopeCostResponse(HopeCost hopeCost) {
        this.minCost = hopeCost.getMinCost();
        this.maxCost = hopeCost.getMaxCost();
    }

}
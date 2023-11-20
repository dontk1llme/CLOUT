package com.mmm.clout.memberservice.star.presentation.request;

import com.mmm.clout.memberservice.star.application.command.CreateStarDetailCommand;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class createStarDetailRequest {

    @Schema(description = "점수를 받는 member의 id")
    private Long receiverId;

    @Schema(description = "발생한 계약 건에 대한 id")
    private Long contractId;

    @Schema(description = "리시버에 대한 점수")
    private Long score;

    @Schema(description = "점수를 주는 member의 id")
    private Long giverId;

    public CreateStarDetailCommand toCommand() {
        return new CreateStarDetailCommand(
            this.receiverId,
            this.contractId,
            this.score,
            this.giverId
        );
    }
}

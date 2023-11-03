package com.mmm.clout.memberservice.star.application.command;

import com.mmm.clout.memberservice.star.domain.Star;
import com.mmm.clout.memberservice.star.domain.StarDetail;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class CreateStarDetailCommand {

    private Long receiverId;

    private Long contractId;

    private Long score;

    private Long giverId;

    public StarDetail toEntity(Star star) {
        return StarDetail.create(
            star,
            this.score,
            this.giverId
        );
    }
}

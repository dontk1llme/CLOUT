package com.mmm.clout.memberservice.star.application.facade;

import com.mmm.clout.memberservice.star.application.CreateStarDetailProcessor;
import com.mmm.clout.memberservice.star.application.command.CreateStarDetailCommand;
import com.mmm.clout.memberservice.star.domain.StarDetail;
import lombok.AllArgsConstructor;
import lombok.Getter;
import org.springframework.stereotype.Service;

@Getter
@AllArgsConstructor
@Service
public class StarFacade {

    private final CreateStarDetailProcessor createStarDetailProcessor;

    public StarDetail starScoreAdd(CreateStarDetailCommand command) {
        return createStarDetailProcessor.execute(command);
    }
}

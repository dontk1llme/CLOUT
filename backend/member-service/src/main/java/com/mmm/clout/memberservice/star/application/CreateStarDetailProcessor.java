package com.mmm.clout.memberservice.star.application;

import com.mmm.clout.memberservice.star.application.command.CreateStarDetailCommand;
import com.mmm.clout.memberservice.star.domain.Star;
import com.mmm.clout.memberservice.star.domain.StarDetail;
import com.mmm.clout.memberservice.star.domain.repository.StarDetailRepository;
import com.mmm.clout.memberservice.star.domain.repository.StarRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
public class CreateStarDetailProcessor {

    private final StarDetailRepository starDetailRepository;
    private final StarRepository starRepository;

    @Transactional
    public StarDetail execute(CreateStarDetailCommand command) {
        Star star = starRepository.findById(command.getReceiverId());
        StarDetail starDetail = command.toEntity(star);
        return starDetailRepository.save(starDetail);
    }

}

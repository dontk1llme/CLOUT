package com.mmm.clout.memberservice.star.application;

import com.mmm.clout.memberservice.member.domain.Member;
import com.mmm.clout.memberservice.member.domain.repository.MemberRepository;
import com.mmm.clout.memberservice.star.application.command.CreateStarDetailCommand;
import com.mmm.clout.memberservice.star.domain.Star;
import com.mmm.clout.memberservice.star.domain.StarDetail;
import com.mmm.clout.memberservice.star.domain.exception.DuplicatedStarDetailException;
import com.mmm.clout.memberservice.star.domain.exception.NotFoundMemberException;
import com.mmm.clout.memberservice.star.domain.repository.StarDetailRepository;
import com.mmm.clout.memberservice.star.domain.repository.StarRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
public class CreateStarDetailProcessor {

    private final StarDetailRepository starDetailRepository;
    private final StarRepository starRepository;
    private final MemberRepository memberRepository;

    @Transactional
    public StarDetail execute(CreateStarDetailCommand command) {
        Member member = memberRepository.findById(command.getReceiverId()).orElseThrow(NotFoundMemberException::new);
        Star star = starRepository.findByMember(member);
        checkDuplicateDetail(star, command);
        StarDetail starDetail = command.toEntity(star);
        Long avgScore = updateStar(star, command.getScore());
        updateMember(member, avgScore);
        return starDetailRepository.save(starDetail);
    }

    private boolean checkDuplicateDetail(Star star, CreateStarDetailCommand command) {
        if(starDetailRepository.findByStarAndGiverId(star, command.getGiverId()) == null) return true;
        else throw new DuplicatedStarDetailException();
    }

    private void updateMember(Member member, Long avgScore) {
        member.updateAvgScore(avgScore);
    }

    private Long updateStar(Star star, Long score) {
        Long updatedScore = star.addTotalScore(score);
        Long count = star.addNumberOfRaters();
        return updatedScore / count;
    }


}

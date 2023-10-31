package com.mmm.clout.memberservice.clouter.application;

import com.mmm.clout.memberservice.clouter.application.command.CreateClrCommand;
import com.mmm.clout.memberservice.clouter.domain.Clouter;
import com.mmm.clout.memberservice.clouter.domain.repository.ClouterRepository;
import com.mmm.clout.memberservice.clouter.domain.exceptuion.ClrIdDuplicateException;
import com.mmm.clout.memberservice.member.domain.Member;
import com.mmm.clout.memberservice.member.domain.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
public class CreateClouterProcessor {

    private final ClouterRepository clouterRepository;
    private final MemberRepository memberRepository;
    private final BCryptPasswordEncoder encoder;

    @Transactional
    public Clouter execute(CreateClrCommand command) {
        checkUserId(command.getUserId());
        Clouter clouter = command.toEntity();
        clouter.changePwd(encoder.encode(clouter.getPwd()));
        return clouterRepository.save(clouter);
    }

    private boolean checkUserId(String userId) {
        Member findMember = memberRepository.findByUserId(userId).orElse(null);
        if (findMember == null) {
            return true;
        } else {
            throw new ClrIdDuplicateException();
        }
    }
}

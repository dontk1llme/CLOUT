package com.mmm.clout.userservice.advertiser.application;

import com.mmm.clout.userservice.advertiser.application.command.CreateAdrCommand;
import com.mmm.clout.userservice.advertiser.domain.Advertiser;
import com.mmm.clout.userservice.advertiser.domain.repository.AdvertiserRepository;
import com.mmm.clout.userservice.member.domain.Member;
import com.mmm.clout.userservice.member.domain.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
public class CreateAdvertiserProcessor {

    private final AdvertiserRepository advertiserRepository;
    private final MemberRepository memberRepository;
    private final BCryptPasswordEncoder encoder;

    @Transactional
    public Advertiser execute(CreateAdrCommand command) {
        if (!checkUserId(command.getUserId())) {
            //나중에 에러처리
            throw new RuntimeException("중복 에러염 이거 어드바이스 에러처리 해주셈 나중에");
        }
        Advertiser advertiser = command.toEntity();
        advertiser.changePwd(encoder.encode(advertiser.getPwd()));
        return advertiserRepository.save(advertiser);
    }

    private boolean checkUserId(String userId) {
        Member findMember = memberRepository.findByUserId(userId).orElse(null);
        if (findMember == null) {
            return true;
        } else {
            return false;
        }
    }
}

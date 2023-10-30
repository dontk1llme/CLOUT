package com.mmm.clout.userservice.advertiser.application;

import com.mmm.clout.userservice.advertiser.application.command.CreateAdrCommand;
import com.mmm.clout.userservice.advertiser.domain.Advertiser;
import com.mmm.clout.userservice.advertiser.domain.repository.AdvertiserRepository;
import com.mmm.clout.userservice.advertiser.infrastructure.exceptuion.AdrIdDuplicateException;
import com.mmm.clout.userservice.common.exception.ErrorCode;
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
        checkUserId(command.getUserId());
        Advertiser advertiser = command.toEntity();
        advertiser.changePwd(encoder.encode(advertiser.getPwd()));
        return advertiserRepository.save(advertiser);
    }

    private boolean checkUserId(String userId) {
        Member findMember = memberRepository.findByUserId(userId).orElse(null);
        if (findMember == null) {
            return true;
        } else {
            throw new AdrIdDuplicateException(ErrorCode.ADVERTISER_ID_DUPLICATE);
        }
    }
}

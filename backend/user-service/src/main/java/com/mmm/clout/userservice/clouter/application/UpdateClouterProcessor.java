package com.mmm.clout.userservice.clouter.application;

import com.mmm.clout.userservice.advertiser.application.command.UpdateAdrCommand;
import com.mmm.clout.userservice.advertiser.domain.Advertiser;
import com.mmm.clout.userservice.clouter.application.command.CreateClrCommand;
import com.mmm.clout.userservice.clouter.application.command.UpdateClrCommand;
import com.mmm.clout.userservice.clouter.domain.Clouter;
import com.mmm.clout.userservice.clouter.domain.repository.ClouterRepository;
import com.mmm.clout.userservice.member.domain.Member;
import com.mmm.clout.userservice.member.domain.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
public class UpdateClouterProcessor {

    private final ClouterRepository clouterRepository;
    private final BCryptPasswordEncoder encoder;

    @Transactional
    public Clouter execute(UpdateClrCommand command) {
        Clouter clouter = clouterRepository.findById(command.getClouterId());
        clouter.update(
                command.getUserId(),
                command.getPwd(),
                command.getName(),
                command.getAddressCommand().toValueType(),
                command.getSelectedCategory(),
                command.getFollowerScale(),
                command.getPlatForm(),
                command.getBirthday(),
                command.getAge()
                );
        clouter.changePwd(encoder.encode(clouter.getPwd()));
        return clouter;
    }

}

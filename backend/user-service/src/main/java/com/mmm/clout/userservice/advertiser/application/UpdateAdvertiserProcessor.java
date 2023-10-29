package com.mmm.clout.userservice.advertiser.application;

import com.mmm.clout.userservice.advertiser.application.command.UpdateAdrCommand;
import com.mmm.clout.userservice.advertiser.domain.Advertiser;
import com.mmm.clout.userservice.advertiser.domain.repository.AdvertiserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
public class UpdateAdvertiserProcessor {

    private final AdvertiserRepository advertiserRepository;
    private final BCryptPasswordEncoder encoder;

    @Transactional
    public Advertiser execute(UpdateAdrCommand command) {
        Advertiser advertiser = advertiserRepository.findById(command.getAdvertiserId());
        advertiser.update(
                command.getUserId(),
                command.getPwd(),
                command.getAddressCommand().toValueType(),
                command.getCompanyInfoCommand().toValueType());
        advertiser.changePwd(encoder.encode(advertiser.getPwd()));
        return advertiser;
    }
}

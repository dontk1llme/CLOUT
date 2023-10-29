package com.mmm.clout.userservice.advertiser.application;

import com.mmm.clout.userservice.advertiser.application.command.CreateAdrCommand;
import com.mmm.clout.userservice.advertiser.application.command.UpdateAdrCommand;
import com.mmm.clout.userservice.advertiser.domain.Advertiser;
import com.mmm.clout.userservice.advertiser.domain.repository.AdvertiserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
public class UpdateAdvertiserProcessor {

    private final AdvertiserRepository advertisementRepository;
    private final BCryptPasswordEncoder encoder;

    @Transactional
    public Advertiser excute(UpdateAdrCommand command) {
        Advertiser advertiser = advertisementRepository.findById(command.getAdvertiserId());
        advertiser.update(
                command.getUserId(),
                command.getPwd(),
                command.getAddressCommand().toValueType(),
                command.getCompanyInfoCommand().toValueType());
        advertiser.changePwd(encoder.encode(advertiser.getPwd()));
        return advertisementRepository.save(advertiser);
    }
}

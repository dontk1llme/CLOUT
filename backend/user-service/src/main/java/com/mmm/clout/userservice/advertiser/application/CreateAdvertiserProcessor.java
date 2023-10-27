package com.mmm.clout.userservice.advertiser.application;

import com.mmm.clout.userservice.advertiser.application.command.CreateAdrCommand;
import com.mmm.clout.userservice.advertiser.domain.Advertiser;
import com.mmm.clout.userservice.advertiser.domain.repository.AdvertiserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
public class CreateAdvertiserProcessor {

    private final AdvertiserRepository advertisementRepository;

    @Transactional
    public Advertiser excute(CreateAdrCommand command) {
        Advertiser advertiser = command.toEntity();
        return advertisementRepository.save(advertiser);
    }
}

package com.mmm.clout.userservice.advertiser.application;

import com.mmm.clout.userservice.advertiser.domain.Advertiser;
import com.mmm.clout.userservice.advertiser.domain.repository.AdvertiserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
public class SelectAdvertiserProcessor {

    private final AdvertiserRepository advertisementRepository;

    @Transactional
    public Advertiser execute(Long advertiserId) {
        Advertiser advertiser = advertisementRepository.findById(advertiserId);
        return advertiser;
    }
}

package com.mmm.clout.advertisementservice.advertisements.application;

import com.mmm.clout.advertisementservice.advertisements.application.command.CreateCampaignCommand;
import com.mmm.clout.advertisementservice.advertisements.domain.repository.AdvertisementRepository;
import com.mmm.clout.advertisementservice.advertisements.domain.Campaign;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
public class CreateAdvertisementProcessor {

    private final AdvertisementRepository advertisementRepository;

    @Transactional
    public Campaign execute(CreateCampaignCommand command) {

        return advertisementRepository.save(null);
    }
}

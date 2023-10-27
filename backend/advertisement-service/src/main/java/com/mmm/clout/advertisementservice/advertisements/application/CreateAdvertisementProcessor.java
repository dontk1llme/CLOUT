package com.mmm.clout.advertisementservice.advertisements.application;

import com.mmm.clout.advertisementservice.advertisements.application.command.CreateAdCommand;
import com.mmm.clout.advertisementservice.advertisements.domain.Advertisement;
import com.mmm.clout.advertisementservice.advertisements.domain.repository.AdvertisementRepository;
import com.mmm.clout.advertisementservice.advertisements.domain.Campaign;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
public class CreateAdvertisementProcessor {

    private final AdvertisementRepository advertisementRepository;

    @Transactional
    public Campaign execute(CreateAdCommand command) {
        Campaign campaign = Campaign.create(
            command.getTitle(),
            command.getAdStartDate(),
            command.getAdEndDate()
        );

        return advertisementRepository.save(campaign);
    }
}

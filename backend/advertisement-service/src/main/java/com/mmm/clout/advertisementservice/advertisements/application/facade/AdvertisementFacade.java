package com.mmm.clout.advertisementservice.advertisements.application.facade;

import com.mmm.clout.advertisementservice.advertisements.application.CreateAdvertisementProcessor;
import com.mmm.clout.advertisementservice.advertisements.application.command.CreateAdCommand;
import com.mmm.clout.advertisementservice.advertisements.domain.Campaign;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AdvertisementFacade {

    private final CreateAdvertisementProcessor createAdvertisementProcessor;

    public Campaign create(CreateAdCommand command) {
        return createAdvertisementProcessor.execute(command);
    }
}

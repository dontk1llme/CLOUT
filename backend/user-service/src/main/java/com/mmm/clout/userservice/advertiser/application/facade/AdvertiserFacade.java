package com.mmm.clout.userservice.advertiser.application.facade;

import com.mmm.clout.userservice.advertiser.application.CreateAdvertiserProcessor;
import com.mmm.clout.userservice.advertiser.application.command.CreateAdrCommand;
import com.mmm.clout.userservice.advertiser.domain.Advertiser;
import lombok.AllArgsConstructor;
import lombok.Getter;
import org.springframework.stereotype.Service;

@Getter
@AllArgsConstructor
@Service
public class AdvertiserFacade {

    private final CreateAdvertiserProcessor createAdvertiserProcessor;

    public Advertiser create(CreateAdrCommand command) {
        return createAdvertiserProcessor.excute(command);
    }
}

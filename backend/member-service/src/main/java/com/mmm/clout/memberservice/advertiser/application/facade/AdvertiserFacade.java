package com.mmm.clout.memberservice.advertiser.application.facade;

import com.mmm.clout.memberservice.advertiser.application.CreateAdvertiserProcessor;
import com.mmm.clout.memberservice.advertiser.application.SelectAdvertiserForContractProcessor;
import com.mmm.clout.memberservice.advertiser.application.SelectAdvertiserProcessor;
import com.mmm.clout.memberservice.advertiser.application.UpdateAdvertiserProcessor;
import com.mmm.clout.memberservice.advertiser.application.command.CreateAdrCommand;
import com.mmm.clout.memberservice.advertiser.application.command.UpdateAdrCommand;
import com.mmm.clout.memberservice.advertiser.domain.Advertiser;
import lombok.AllArgsConstructor;
import lombok.Getter;
import org.springframework.stereotype.Service;

@Getter
@AllArgsConstructor
@Service
public class AdvertiserFacade {

    private final CreateAdvertiserProcessor createAdvertiserProcessor;
    private final UpdateAdvertiserProcessor updateAdvertiserProcessor;
    private final SelectAdvertiserProcessor selectAdvertiserProcessor;
    private final SelectAdvertiserForContractProcessor selectAdvertiserForContractProcessor;

    public Advertiser create(CreateAdrCommand command) {
        return createAdvertiserProcessor.execute(command);
    }

    public Advertiser update(UpdateAdrCommand command) {return updateAdvertiserProcessor.execute(command); }

    public Advertiser select(Long advertiserId) { return selectAdvertiserProcessor.execute(advertiserId);
    }
    public Advertiser selectForContract(Long advertiserId) { return selectAdvertiserForContractProcessor.execute(advertiserId);
    }
}

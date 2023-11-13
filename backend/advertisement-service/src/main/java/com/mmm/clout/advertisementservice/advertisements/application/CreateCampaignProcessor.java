package com.mmm.clout.advertisementservice.advertisements.application;

import com.mmm.clout.advertisementservice.advertisements.application.command.CreateCampaignCommand;
import com.mmm.clout.advertisementservice.advertisements.domain.repository.CampaignRepository;
import com.mmm.clout.advertisementservice.advertisements.domain.Campaign;
import com.mmm.clout.advertisementservice.advertisements.application.command.ReducePointCommand;
import com.mmm.clout.advertisementservice.common.msa.provider.PointProvider;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
public class CreateCampaignProcessor {

    private final CampaignRepository campaignRepository;
    private final PointProvider pointProvider;

    @Transactional
    public Campaign execute(CreateCampaignCommand command) {
        Campaign campaign = Campaign.create(
            command.getRegisterId(),
            command.getAdPlatformList(),
            command.getPrice(),
            command.getDetails(),
            command.getTitle(),
            command.getAdCategory(),
            command.isPriceChangeable(),
            command.isDeliveryRequired(),
            command.getNumberOfRecruiter(),
            command.getOfferingDetails(),
            command.getSellingLink(),
            command.getMinClouterAge(),
            command.getMaxClouterAge(),
            command.getMinFollower(),
            command.getRegionList()
        );

        // TODO 보상트랜잭션 추가, Feign client 에러 처리
        reducePoint(command);
        return campaignRepository.save(campaign);
    }

    private void reducePoint(CreateCampaignCommand command) {
        ReducePointCommand request = new ReducePointCommand(command);
        pointProvider.reduce(request);
    }
}

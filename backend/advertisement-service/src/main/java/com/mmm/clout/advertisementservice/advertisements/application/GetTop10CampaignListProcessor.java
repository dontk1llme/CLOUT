package com.mmm.clout.advertisementservice.advertisements.application;

import com.mmm.clout.advertisementservice.advertisements.application.reader.CampaignReader;
import com.mmm.clout.advertisementservice.advertisements.domain.Campaign;
import com.mmm.clout.advertisementservice.advertisements.domain.repository.CampaignRepository;
import com.mmm.clout.advertisementservice.common.msa.provider.MemberProvider;
import java.util.List;
import java.util.stream.Collectors;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
public class GetTop10CampaignListProcessor {

    private final CampaignRepository campaignRepository;
    private final MemberProvider memberProvider;

    @Transactional
    public List<CampaignReader> execute() {
        List<Campaign> top10List = campaignRepository.getTop10List();
        return top10List.stream().map(
            campaign -> new CampaignReader(
                campaign.initialize(),
                memberProvider.getAdvertiserInfoByMemberId(campaign.getAdvertiserId())
            )
        ).collect(Collectors.toList());
    }
}

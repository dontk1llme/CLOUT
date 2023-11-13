package com.mmm.clout.advertisementservice.advertisements.application;

import com.mmm.clout.advertisementservice.advertisements.application.reader.CampaignReader;
import com.mmm.clout.advertisementservice.advertisements.domain.Campaign;
import com.mmm.clout.advertisementservice.advertisements.domain.exception.CampaignNotFoundException;
import com.mmm.clout.advertisementservice.advertisements.domain.repository.CampaignRepository;
import com.mmm.clout.advertisementservice.common.msa.info.AdvertiserInfo;
import com.mmm.clout.advertisementservice.common.msa.provider.MemberProvider;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
public class GetCampaignProcessor {

    private final CampaignRepository campaignRepository;
    private final MemberProvider memberProvider;

    @Transactional(readOnly = true)
    public CampaignReader execute(Long advertisementId) {
        Campaign campaign = campaignRepository.findById(advertisementId)
            .orElseThrow(CampaignNotFoundException::new);
        campaign.initialize();
        AdvertiserInfo advertiserInfo = memberProvider.getAdvertiserInfoByMemberId(
            campaign.getAdvertiserId());
        return new CampaignReader(campaign, advertiserInfo);
    }
}

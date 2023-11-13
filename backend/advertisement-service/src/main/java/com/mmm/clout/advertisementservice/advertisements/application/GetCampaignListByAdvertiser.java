package com.mmm.clout.advertisementservice.advertisements.application;

import com.mmm.clout.advertisementservice.advertisements.application.reader.CampaignListReader;
import com.mmm.clout.advertisementservice.advertisements.application.reader.CampaignReader;
import com.mmm.clout.advertisementservice.advertisements.domain.Campaign;
import com.mmm.clout.advertisementservice.advertisements.domain.repository.CampaignRepository;
import com.mmm.clout.advertisementservice.common.msa.info.AdvertiserInfo;
import com.mmm.clout.advertisementservice.common.msa.provider.MemberProvider;
import java.util.ArrayList;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
public class GetCampaignListByAdvertiser {

    private final CampaignRepository campaignRepository;
    private final MemberProvider memberProvider;

    @Transactional
    public CampaignListReader execute(Long advertiserId, Pageable pageable) {
        AdvertiserInfo advertiserInfo = memberProvider.getAdvertiserInfoByMemberId(advertiserId);
        Page<Campaign> campainList =
            campaignRepository.getCampainListByAdvertiserId(advertiserId, pageable);
        for (Campaign campaign : campainList.getContent()) {
            campaign.initialize();
        }

        return new CampaignListReader(campainList, advertiserInfo);
    }
}

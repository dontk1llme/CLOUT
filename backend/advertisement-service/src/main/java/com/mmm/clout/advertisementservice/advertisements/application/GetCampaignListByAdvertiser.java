package com.mmm.clout.advertisementservice.advertisements.application;

import com.mmm.clout.advertisementservice.advertisements.domain.Campaign;
import com.mmm.clout.advertisementservice.advertisements.domain.repository.CampaignRepository;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Pageable;

@RequiredArgsConstructor
public class GetCampaignListByAdvertiser {

    private final CampaignRepository campaignRepository;

    public List<Campaign> execute(Long advertiserId, Pageable pageable) {
        return campaignRepository.getCampainListByAdvertiserId(advertiserId, pageable);
    }
}

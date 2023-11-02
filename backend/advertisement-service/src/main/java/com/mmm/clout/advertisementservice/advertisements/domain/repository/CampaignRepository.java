package com.mmm.clout.advertisementservice.advertisements.domain.repository;

import com.mmm.clout.advertisementservice.advertisements.domain.Campaign;
import java.util.List;
import java.util.Optional;

public interface CampaignRepository {

    Campaign save(Campaign campaign);

    Optional<Campaign> findById(Long advertisementId);

    List<Campaign> getTop10List();
}

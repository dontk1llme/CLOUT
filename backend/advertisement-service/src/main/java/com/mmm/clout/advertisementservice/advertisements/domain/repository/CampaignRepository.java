package com.mmm.clout.advertisementservice.advertisements.domain.repository;

import com.mmm.clout.advertisementservice.advertisements.domain.Campaign;
import java.util.List;
import java.util.Optional;
import org.springframework.data.domain.Pageable;

public interface CampaignRepository {

    Campaign save(Campaign campaign);

    Optional<Campaign> findById(Long advertisementId);

    List<Campaign> getTop10List();

    List<Campaign> getCampainListByAdvertiserId(Long advertiserId, Pageable pageable);
}

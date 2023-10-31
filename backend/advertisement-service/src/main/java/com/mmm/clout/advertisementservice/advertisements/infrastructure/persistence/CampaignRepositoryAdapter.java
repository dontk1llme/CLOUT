package com.mmm.clout.advertisementservice.advertisements.infrastructure.persistence;

import com.mmm.clout.advertisementservice.advertisements.domain.Campaign;
import com.mmm.clout.advertisementservice.advertisements.domain.repository.CampaignRepository;
import com.mmm.clout.advertisementservice.advertisements.infrastructure.persistence.jpa.JpaCampaignRepository;
import java.util.Optional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class CampaignRepositoryAdapter implements CampaignRepository {

    private final JpaCampaignRepository jpaCampaignRepository;

    @Override
    public Campaign save(Campaign campaign) {
        return jpaCampaignRepository.save(campaign);
    }

    @Override
    public Optional<Campaign> findById(Long advertisementId) {
        return jpaCampaignRepository.findById(advertisementId);
    }
}

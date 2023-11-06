package com.mmm.clout.advertisementservice.advertisements.infrastructure.persistence;

import com.mmm.clout.advertisementservice.advertisements.domain.Campaign;
import com.mmm.clout.advertisementservice.advertisements.domain.repository.CampaignRepository;
import com.mmm.clout.advertisementservice.advertisements.infrastructure.persistence.jpa.JpaCampaignRepository;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
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

    @Override
    public List<Campaign> getTop10List() {
        Pageable pageable = PageRequest.of(0, 10);
        Page<Campaign> pages = jpaCampaignRepository.findActiveCampaignsOrderByApplicants(LocalDate.now(), pageable);
        return pages.getContent();
    }

    @Override
    public List<Campaign> getCampainListByAdvertiserId(Long advertiserId, Pageable pageable) {
        Page<Campaign> pages = jpaCampaignRepository.findByRegisterIdOrderByCreatedAtDesc(advertiserId, pageable);
        return pages.getContent();
    }
}

package com.mmm.clout.advertisementservice.advertisements.infrastructure.persistence;

import com.mmm.clout.advertisementservice.advertisements.domain.Campaign;
import com.mmm.clout.advertisementservice.advertisements.domain.repository.AdvertisementRepository;
import com.mmm.clout.advertisementservice.advertisements.infrastructure.persistence.jpa.JpaAdvertisementRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class AdvertisementRepositoryAdapter implements AdvertisementRepository {

    private final JpaAdvertisementRepository jpaAdvertisementRepository;

    @Override
    public Campaign save(Campaign campaign) {
        return jpaAdvertisementRepository.save(campaign);
    }
}

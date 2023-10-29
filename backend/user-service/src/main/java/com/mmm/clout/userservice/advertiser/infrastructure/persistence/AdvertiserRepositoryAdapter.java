package com.mmm.clout.userservice.advertiser.infrastructure.persistence;

import com.mmm.clout.userservice.advertiser.domain.Advertiser;
import com.mmm.clout.userservice.advertiser.domain.repository.AdvertiserRepository;
import com.mmm.clout.userservice.advertiser.infrastructure.persistence.jpa.JpaAdvertiserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class AdvertiserRepositoryAdapter implements AdvertiserRepository {

    private final JpaAdvertiserRepository jpaAdvertisementRepository;


    @Override
    public Advertiser save(Advertiser advertiser) {
        return jpaAdvertisementRepository.save(advertiser);
    }

    @Override
    public Advertiser findById(Long userId) {
        return jpaAdvertisementRepository.findById(userId).orElseThrow();
    }
}

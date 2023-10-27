package com.mmm.clout.advertisementservice.advertisements.domain.repository;

import com.mmm.clout.advertisementservice.advertisements.domain.Campaign;

public interface AdvertisementRepository {

    Campaign save(Campaign campaign);
}

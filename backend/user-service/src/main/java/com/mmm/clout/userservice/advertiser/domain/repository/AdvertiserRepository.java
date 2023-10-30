package com.mmm.clout.userservice.advertiser.domain.repository;

import com.mmm.clout.userservice.advertiser.domain.Advertiser;

public interface AdvertiserRepository {

    Advertiser save(Advertiser advertiser);

    Advertiser findById(Long userId);
}

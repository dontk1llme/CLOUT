package com.mmm.clout.memberservice.advertiser.domain.repository;

import com.mmm.clout.memberservice.advertiser.domain.Advertiser;
import com.mmm.clout.memberservice.clouter.domain.Clouter;

import java.util.List;

public interface AdvertiserRepository {

    Advertiser save(Advertiser advertiser);

    Advertiser findById(Long userId);

    List<Advertiser> findByIdIn(List<Long> idList);
}

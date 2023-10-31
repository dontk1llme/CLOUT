package com.mmm.clout.advertisementservice.apply.domain.provider;

import com.mmm.clout.advertisementservice.advertisements.domain.info.AdvertiserInfo;


public interface AdvertiserProvider {

    AdvertiserInfo getAdvertiserInfoByMemberId(Long memberId);

}

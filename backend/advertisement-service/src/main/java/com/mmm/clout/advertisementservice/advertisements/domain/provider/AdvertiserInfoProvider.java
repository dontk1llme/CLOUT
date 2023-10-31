package com.mmm.clout.advertisementservice.advertisements.domain.provider;

import com.mmm.clout.advertisementservice.advertisements.domain.info.AdvertiserInfo;

public interface AdvertiserInfoProvider {

    AdvertiserInfo getAdvertiserInfoByMemberId(Long memberId);
}

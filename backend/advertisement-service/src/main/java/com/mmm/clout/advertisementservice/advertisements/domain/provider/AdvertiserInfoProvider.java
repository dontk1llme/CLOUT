package com.mmm.clout.advertisementservice.advertisements.domain.provider;

import com.mmm.clout.advertisementservice.advertisements.domain.info.AdvertiserInfo;
import org.springframework.stereotype.Component;

@Component
public interface AdvertiserInfoProvider {

    AdvertiserInfo getAdvertiserInfoByMemberId(Long memberId);
}

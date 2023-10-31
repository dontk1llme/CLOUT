package com.mmm.clout.advertisementservice.advertisements.infrastructure.provider;

import com.mmm.clout.advertisementservice.advertisements.domain.info.AdvertiserInfo;
import com.mmm.clout.advertisementservice.advertisements.domain.provider.AdvertiserInfoProvider;
import com.mmm.clout.advertisementservice.advertisements.infrastructure.provider.feignclient.MemberFeignClient;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class MemberFeignClientProviderAdapter implements AdvertiserInfoProvider {

    private final MemberFeignClient memberFeignClient;

    @Override
    public AdvertiserInfo getAdvertiserInfoByMemberId(Long memberId) {
        return memberFeignClient.getAdvertiser(memberId);
    }
}

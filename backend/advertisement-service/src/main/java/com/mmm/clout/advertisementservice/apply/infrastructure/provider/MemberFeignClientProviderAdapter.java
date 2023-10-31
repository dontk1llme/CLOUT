package com.mmm.clout.advertisementservice.apply.infrastructure.provider;

import com.mmm.clout.advertisementservice.advertisements.domain.info.AdvertiserInfo;
import com.mmm.clout.advertisementservice.advertisements.domain.provider.AdvertiserInfoProvider;
import com.mmm.clout.advertisementservice.apply.infrastructure.provider.feignclient.MemberFeignClient;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class MemberFeignClientProviderAdapter implements AdvertiserInfoProvider {

    private final MemberFeignClient memberFeignClient;

    @Override
    public AdvertiserInfo getAdvertiserInfoByMemberId(Long memberId) {
        return memberFeignClient.getAdvertiser(memberId);
    }
}

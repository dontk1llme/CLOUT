package com.mmm.clout.advertisementservice.apply.infrastructure.provider.feignclient;

import com.mmm.clout.advertisementservice.advertisements.domain.info.AdvertiserInfo;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@FeignClient(name = "member-service")
public interface MemberFeignClient {

    @GetMapping("/member-service/advertisers/{advertiserId}")
    AdvertiserInfo getAdvertiser(@PathVariable Long advertiserId);

}

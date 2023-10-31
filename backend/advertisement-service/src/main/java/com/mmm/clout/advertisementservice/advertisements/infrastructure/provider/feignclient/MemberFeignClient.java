package com.mmm.clout.advertisementservice.advertisements.infrastructure.provider.feignclient;

import com.mmm.clout.advertisementservice.advertisements.domain.info.AdvertiserInfo;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;


@FeignClient(name = "order-service")
public interface MemberFeignClient {

    @GetMapping("/user-service/advertisers/{advertiserId}")
    AdvertiserInfo getAdvertiser(@PathVariable Long advertiserId);

}

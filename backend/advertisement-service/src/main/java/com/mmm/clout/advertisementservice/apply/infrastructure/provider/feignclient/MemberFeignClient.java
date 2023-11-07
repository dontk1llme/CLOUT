package com.mmm.clout.advertisementservice.apply.infrastructure.provider.feignclient;

import com.mmm.clout.advertisementservice.common.msa.info.AdvertiserInfo;
import com.mmm.clout.advertisementservice.common.msa.info.ClouterInfo;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@FeignClient(name = "member-service")
public interface MemberFeignClient {

    @GetMapping("/advertisers/{advertiserId}")
    AdvertiserInfo selectAdvertiser(@PathVariable Long advertiserId);

    @GetMapping("/clouters/{clouterId}")
    ClouterInfo selectClouter(Long clouterId);
}

package com.mmm.clout.contractservice.contract.infrastructure.persistence.feign;

import com.mmm.clout.contractservice.contract.domain.info.SelectAdrInfo;
import com.mmm.clout.contractservice.contract.domain.info.SelectClrInfo;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@FeignClient("member-service")
public interface MemberServiceFeignClient {

    @GetMapping("/v1/clouters/{clouterId}")
    public ResponseEntity<SelectClrInfo> selectClouter(
        @PathVariable("clouterId") Long clouterId);

    @GetMapping("/v1/advertisers/{advertiserId}")
    public ResponseEntity<SelectAdrInfo> selectAdvertiser(
        @PathVariable("advertiserId") Long advertiserId
    );
}

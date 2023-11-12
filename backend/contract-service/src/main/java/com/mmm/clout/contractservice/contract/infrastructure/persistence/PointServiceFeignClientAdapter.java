package com.mmm.clout.contractservice.contract.infrastructure.persistence;

import com.mmm.clout.contractservice.contract.domain.info.AddCountContractInfo;
import com.mmm.clout.contractservice.contract.domain.info.SelectAdrInfo;
import com.mmm.clout.contractservice.contract.domain.info.SelectClrInfo;
import com.mmm.clout.contractservice.contract.domain.provider.MemberProvider;
import com.mmm.clout.contractservice.contract.domain.provider.PointProvider;
import com.mmm.clout.contractservice.contract.domain.provider.dto.AddPointInfo;
import com.mmm.clout.contractservice.contract.domain.provider.dto.AddPointRequest;
import com.mmm.clout.contractservice.contract.domain.provider.dto.ReducePointInfo;
import com.mmm.clout.contractservice.contract.domain.provider.dto.ReducePointRequest;
import com.mmm.clout.contractservice.contract.infrastructure.persistence.feign.MemberServiceFeignClient;
import com.mmm.clout.contractservice.contract.infrastructure.persistence.feign.PointServiceFeignClient;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@RequiredArgsConstructor
public class PointServiceFeignClientAdapter implements PointProvider {

    private final PointServiceFeignClient pointServiceFeignClient;

    @Override
    public ResponseEntity<ReducePointInfo> reduce(ReducePointRequest request) {
        return pointServiceFeignClient.reduce(request);
    }

    @Override
    public ResponseEntity<AddPointInfo> add(AddPointRequest request) {
        return pointServiceFeignClient.add(request);
    }
}

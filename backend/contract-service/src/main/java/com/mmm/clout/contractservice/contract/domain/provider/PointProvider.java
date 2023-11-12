package com.mmm.clout.contractservice.contract.domain.provider;


import com.mmm.clout.contractservice.contract.domain.provider.dto.AddPointInfo;
import com.mmm.clout.contractservice.contract.domain.provider.dto.AddPointRequest;
import com.mmm.clout.contractservice.contract.domain.provider.dto.ReducePointInfo;
import com.mmm.clout.contractservice.contract.domain.provider.dto.ReducePointRequest;
import org.springframework.http.ResponseEntity;

public interface PointProvider {
    public ResponseEntity<ReducePointInfo> reduce(ReducePointRequest request);

    public ResponseEntity<AddPointInfo> add(AddPointRequest request);
}

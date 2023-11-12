package com.mmm.clout.advertisementservice.common.msa.provider;

import com.mmm.clout.advertisementservice.common.msa.info.ReducePointRequest;
import com.mmm.clout.advertisementservice.common.msa.info.ReducePointInfo;
import org.springframework.http.ResponseEntity;

public interface PointProvider {

    public ResponseEntity<ReducePointInfo> reduce(ReducePointRequest request);

}

package com.mmm.clout.contractservice.contract.domain.provider;


import com.mmm.clout.contractservice.contract.domain.info.SelectAdrInfo;
import com.mmm.clout.contractservice.contract.domain.info.SelectClrInfo;
import org.springframework.http.ResponseEntity;

public interface MemberProvider {

    public ResponseEntity<SelectClrInfo> selectClouter(Long clouterId);

    public ResponseEntity<SelectAdrInfo> selectAdvertiser(Long advertiserId);

}

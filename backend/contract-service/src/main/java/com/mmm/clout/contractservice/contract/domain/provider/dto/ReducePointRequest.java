package com.mmm.clout.contractservice.contract.domain.provider.dto;


import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class ReducePointRequest {

    private Long memberId;

    private Long reducingPoint;

    private String pointCategory;

    private String counterParty;
}

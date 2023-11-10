package com.mmm.clout.memberservice.member.presentation.response;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class AddCountContractResponse {

    private Long memberId;

    private Integer countOfContract;
}

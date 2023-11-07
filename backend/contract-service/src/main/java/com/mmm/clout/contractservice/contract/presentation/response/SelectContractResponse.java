package com.mmm.clout.contractservice.contract.presentation.response;

import com.mmm.clout.contractservice.common.State;
import com.mmm.clout.contractservice.contract.domain.AdvertiserInfo;
import com.mmm.clout.contractservice.contract.domain.ClouterInfo;
import com.mmm.clout.contractservice.contract.domain.Contract;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Getter;

import javax.persistence.Embedded;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;

@AllArgsConstructor
@Getter
public class SelectContractResponse {

    @Schema(description = "조회된 계약 id")
    private Long contractId;

    @Schema(description = "조회된 계약 이름")
    private String name;

    @Schema(description = "조회된 계약비")
    private Long price;

    @Schema(description = "조회된 게시 기간")
    private String postDeadline;

    @Schema(description = "조회된 계약 기간")
    private String contractExpiration;

    @Schema(description = "조회된 계약 상세 내역")
    private String contents;

    private ClouterInfoResponse clouterInfo;

    private AdvertiserInfoResponse advertiserInfo;

    @Schema(description = "조회된 계약 상태")
    private State state;

    public static SelectContractResponse from(Contract contract) {
        return new SelectContractResponse(
                contract.getId(),
                contract.getName(),
                contract.getPrice(),
                contract.getPostDeadline(),
                contract.getContractExpiration(),
                contract.getContents(),
                new ClouterInfoResponse(contract.getClouterInfo()),
                new AdvertiserInfoResponse(contract.getAdvertiserInfo()),
                contract.getState()
        );
    }
}

package com.mmm.clout.contractservice.contract.presentation.response;

import com.mmm.clout.contractservice.contract.domain.Contract;
import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.List;
import java.util.stream.Collectors;

@AllArgsConstructor
@Getter
public class AllSelectContractsResponse {

    private List<SelectContractResponse> contracts;

    public static AllSelectContractsResponse from(List<Contract> contracts) {
        return new AllSelectContractsResponse(contracts.stream().map(
                contract -> new SelectContractResponse(
                    contract.getId(),
                    contract.getName(),
                    contract.getPrice(),
                    contract.getPostDeadline(),
                    contract.getContractExpiration(),
                    contract.getContents(),
                    new ClouterInfoResponse(contract.getClouterInfo()),
                    new AdvertiserInfoResponse(contract.getAdvertiserInfo()),
                    contract.getState()
            )
        ).collect(Collectors.toList()));
    }
}

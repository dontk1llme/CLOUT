package com.mmm.clout.contractservice.contract.presentation;

import com.mmm.clout.contractservice.contract.application.facade.ContractFacade;
import com.mmm.clout.contractservice.contract.presentation.docs.ContractControllerDocs;
import com.mmm.clout.contractservice.contract.presentation.request.CreateContractRequest;
import com.mmm.clout.contractservice.contract.presentation.request.UpdateRRNContractRequest;
import com.mmm.clout.contractservice.contract.presentation.response.CreateContractResponse;
import com.mmm.clout.contractservice.contract.presentation.response.UpdateRRNContractResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
@RequestMapping("/v1/contracts")
@RequiredArgsConstructor
public class ContractController implements ContractControllerDocs {

    private final ContractFacade contractFacade;

    @PostMapping
    public ResponseEntity<CreateContractResponse> create(
            @RequestBody @Valid CreateContractRequest createAdrRequest
    ) {
        CreateContractResponse result = CreateContractResponse.from(
                contractFacade.create(createAdrRequest.toCommand())
        );
        return new ResponseEntity<>(result, HttpStatus.CREATED);
    }

    @PatchMapping("/{contractId}")
    public ResponseEntity<UpdateRRNContractResponse> updateRNN(
            @PathVariable("contractId") Long id,
            @RequestBody UpdateRRNContractRequest request
            ) {
        UpdateRRNContractResponse response = UpdateRRNContractResponse.from(
                contractFacade.updateRRN(id, request.getResidentRegistrationNumber())
        );
        return new ResponseEntity<>(response, HttpStatus.OK);
    }
}

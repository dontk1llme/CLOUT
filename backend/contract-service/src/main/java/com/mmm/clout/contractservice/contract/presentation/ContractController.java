package com.mmm.clout.contractservice.contract.presentation;

import com.mmm.clout.contractservice.contract.application.facade.ContractFacade;
import com.mmm.clout.contractservice.contract.presentation.docs.ContractControllerDocs;
import com.mmm.clout.contractservice.contract.presentation.request.CreateContractRequest;
import com.mmm.clout.contractservice.contract.presentation.response.CreateContractResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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

}

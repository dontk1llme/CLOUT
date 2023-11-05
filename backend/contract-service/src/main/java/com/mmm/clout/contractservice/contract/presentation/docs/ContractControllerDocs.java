package com.mmm.clout.contractservice.contract.presentation.docs;

import com.mmm.clout.contractservice.contract.presentation.request.CreateContractRequest;
import com.mmm.clout.contractservice.contract.presentation.response.CreateContractResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;

import javax.validation.Valid;

@Tag(name = "계약 CRUD", description = "계약 회원가입, 수정, 조회를 제공하는 api")
public interface ContractControllerDocs {


    @Operation(summary = "계약 생성",
            responses =
            @ApiResponse(responseCode = "201", description = "생성된 계약 id 리턴",
                    content =
                    @Content(mediaType="application/json",
                            schema=@Schema(implementation= CreateContractRequest.class))
            )
    )
    public ResponseEntity<CreateContractResponse> create(
            @RequestBody @Valid CreateContractRequest createAdrRequest
    );

}


package com.mmm.clout.contractservice.contract.presentation.docs;

import com.mmm.clout.contractservice.contract.presentation.request.CreateContractRequest;
import com.mmm.clout.contractservice.contract.presentation.request.UpdateRRNContractRequest;
import com.mmm.clout.contractservice.contract.presentation.response.CreateContractResponse;
import com.mmm.clout.contractservice.contract.presentation.response.DeleteContractResponse;
import com.mmm.clout.contractservice.contract.presentation.response.UpdateRRNContractResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;

import javax.validation.Valid;

@Tag(name = "계약 CRUD", description = "계약 회원가입, 수정, 조회를 제공하는 api")
public interface ContractControllerDocs {


    @Operation(summary = "계약 생성",
            responses =
            @ApiResponse(responseCode = "201", description = "생성된 계약 id 리턴",
                    content =
                    @Content(mediaType="application/json",
                            schema=@Schema(implementation=CreateContractResponse.class))
            )
    )
    public ResponseEntity<CreateContractResponse> create(
            @RequestBody @Valid CreateContractRequest createAdrRequest
    );

    @Operation(summary = "계약 클라우터 주민번호 업데이트",
            responses =
            @ApiResponse(responseCode = "200", description = "수정된 계약 id 리턴",
                    content =
                    @Content(mediaType="application/json",
                            schema=@Schema(implementation=UpdateRRNContractResponse.class))
            )
    )
    public ResponseEntity<UpdateRRNContractResponse> updateRNN(
            @PathVariable("contractId") Long id,
            @RequestBody UpdateRRNContractRequest request
    );

    @Operation(summary = "계약 취소/삭제",
            responses =
            @ApiResponse(responseCode = "200", description = "삭제된 계약 id 리턴",
                    content =
                    @Content(mediaType="application/json",
                            schema=@Schema(implementation=DeleteContractResponse.class))
            )
    )
    public ResponseEntity<DeleteContractResponse> delete(
            @PathVariable("contractId") Long id
    );
}


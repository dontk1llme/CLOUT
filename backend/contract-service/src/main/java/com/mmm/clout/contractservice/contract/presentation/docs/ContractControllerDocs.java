package com.mmm.clout.contractservice.contract.presentation.docs;

import com.mmm.clout.contractservice.contract.presentation.request.CreateContractRequest;
import com.mmm.clout.contractservice.contract.presentation.request.UpdateRRNContractRequest;
import com.mmm.clout.contractservice.contract.presentation.response.*;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

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

    @Operation(summary = "계약 상태 확정",
            responses =
            @ApiResponse(responseCode = "200", description = "확정된 계약 id 리턴",
                    content =
                    @Content(mediaType="application/json",
                            schema=@Schema(implementation= UpdateStateContractResponse.class))
            )
    )
    public ResponseEntity<UpdateStateContractResponse> updateState(
            @PathVariable("contractId") Long id
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

    @Operation(summary = "계약 조회",
            responses =
            @ApiResponse(responseCode = "200", description = "조회된 계약 리턴",
                    content =
                    @Content(mediaType="application/json",
                            schema=@Schema(implementation=SelectContractResponse.class))
            )
    )
    public ResponseEntity<SelectContractResponse> select(
            @PathVariable("contractId") Long id
    );

    @Operation(summary = "클라우터 계약 전체 조회",
            responses =
            @ApiResponse(responseCode = "200", description = "조회된 클라우터 계약들 리턴",
                    content =
                    @Content(mediaType="application/json",
                            schema=@Schema(implementation=AllSelectContractsResponse.class))
            )
    )
    public ResponseEntity<AllSelectContractsResponse> selectClouter(
            @RequestParam("clouterId") Long clouterId
    );

    @Operation(summary = "광고주 계약 전체 조회",
            responses =
            @ApiResponse(responseCode = "200", description = "조회된 광고주 계약들 리턴",
                    content =
                    @Content(mediaType="application/json",
                            schema=@Schema(implementation=AllSelectContractsResponse.class))
            )
    )
    public ResponseEntity<AllSelectContractsResponse> selectAdvertiser(
            @RequestParam("advertiserId") Long advertiserId
    );
}


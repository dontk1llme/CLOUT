package com.mmm.clout.advertisementservice.common.docs;

import com.mmm.clout.advertisementservice.advertisements.persentation.request.CreateCampaignRequest;
import com.mmm.clout.advertisementservice.advertisements.persentation.request.UpdateCampaignRequest;
import com.mmm.clout.advertisementservice.advertisements.persentation.response.CreateCampaignResponse;
import com.mmm.clout.advertisementservice.advertisements.persentation.response.DeleteCampaignResponse;
import com.mmm.clout.advertisementservice.advertisements.persentation.response.UpdateCampaignResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.enums.ParameterIn;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.ResponseEntity;


@Tag(name = "캠페인 모집 신청 api", description = "캠페인 모집 신청 관련 api")
public interface ApplyControllerDocs {

    /*
    @Operation(summary = "신청",
        description = "등록자(광고주)id와 캠페인에 필요한 필드를 받아 캠페인 등록합니다.",
        parameters = {
            @Parameter(
                in = ParameterIn.HEADER,
                name = "Authorization",
                required = true,
                schema = @Schema(type = "string"),
                description = "인증 토큰"
            )
        },
        responses =
        @ApiResponse(responseCode = "201", description = "광고 캠페인 등록 성공",
            content =
            @Content(mediaType="application/json",
                schema=@Schema(implementation= CreateCampaignResponse.class))
        ),
        requestBody = @io.swagger.v3.oas.annotations.parameters.RequestBody(
            content = @Content(mediaType = "application/json",
                schema = @Schema(implementation = CreateCampaignRequest.class)),
            description = "캠페인 생성을 위한 정보",
            required = true
        )
    )
    ResponseEntity<CreateCampaignResponse> createCampaign(
        CreateCampaignRequest request
    );


    @Operation(summary = "광고 캠페인 수정",
        description = "광고 캠페인 id를 받아 정보를 수정합니다.",
        parameters = {
            @Parameter(
                in = ParameterIn.HEADER,
                name = "Authorization",
                required = true,
                schema = @Schema(type = "string"),
                description = "인증 토큰"
            )
        },
        responses =
        @ApiResponse(responseCode = "200", description = "광고 캠페인 수정 성공",
            content =
            @Content(mediaType="application/json",
                schema=@Schema(implementation= UpdateCampaignResponse.class))
        ),
        requestBody = @io.swagger.v3.oas.annotations.parameters.RequestBody(
            content = @Content(mediaType = "application/json",
                schema = @Schema(implementation = UpdateCampaignRequest.class)),
            description = "캠페인 수정을 위한 정보",
            required = true
        )
    )
    ResponseEntity<UpdateCampaignResponse> updateCampaign(
        Long advertisementId,
        UpdateCampaignRequest request
    );


    @Operation(summary = "광고 캠페인 삭제 (soft 삭제)",
        description = "광고 캠페인 id를 받아 삭제합니다. (soft delete)",
        parameters = {
            @Parameter(
                in = ParameterIn.HEADER,
                name = "Authorization",
                required = true,
                schema = @Schema(type = "string"),
                description = "인증 토큰"
            )
        },
        responses =
        @ApiResponse(responseCode = "200", description = "광고 캠페인 삭제 처리 성공",
            content =
            @Content(mediaType="application/json",
                schema=@Schema(implementation= DeleteCampaignResponse.class))
        )
    )
    ResponseEntity<DeleteCampaignResponse> deleteCampaign(
        Long advertisementId
    );

     */
}
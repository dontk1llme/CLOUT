package com.mmm.clout.advertisementservice.common.docs;

import com.mmm.clout.advertisementservice.advertisements.persentation.request.CreateCampaignRequest;
import com.mmm.clout.advertisementservice.advertisements.persentation.request.UpdateCampaignRequest;
import com.mmm.clout.advertisementservice.advertisements.persentation.response.CreateCampaignResponse;
import com.mmm.clout.advertisementservice.advertisements.persentation.response.DeleteCampaignResponse;
import com.mmm.clout.advertisementservice.advertisements.persentation.response.UpdateCampaignResponse;
import com.mmm.clout.advertisementservice.apply.presentation.request.CreateApplyRequest;
import com.mmm.clout.advertisementservice.apply.presentation.response.CreateApplyResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.enums.ParameterIn;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;


@Tag(name = "캠페인 모집 신청 api", description = "캠페인 모집 신청 관련 api")
public interface ApplyControllerDocs {


    @Operation(summary = "신청",
        description = "클라우터가 캠페인을 신청합니다.",
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
        @ApiResponse(responseCode = "201", description = "광고 모집 신청 성공",
            content =
            @Content(mediaType="application/json",
                schema=@Schema(implementation= CreateApplyResponse.class))
        ),
        requestBody = @io.swagger.v3.oas.annotations.parameters.RequestBody(
            content = @Content(mediaType = "application/json",
                schema = @Schema(implementation = CreateApplyRequest.class)),
            description = "캠페인 신청을 위한 정보",
            required = true
        )
    )
    ResponseEntity<CreateApplyResponse> createApply(
        @RequestBody CreateApplyRequest request
    );

    @Operation(summary = "신청 취소",
        description = "클라우터가 신청한 캠페인을 신청 취소 합니다.",
        parameters = {
            @Parameter(
                in = ParameterIn.HEADER,
                name = "Authorization",
                required = true,
                schema = @Schema(type = "string"),
                description = "인증 토큰"
            ),
            @Parameter(
                in = ParameterIn.PATH,
                name = "applyId",
                required = true,
                schema = @Schema(type = "long"),
                description = "신청(apply) 고유 식별자"
            )
        }
    )
    ResponseEntity<String> cancelApply(
        @PathVariable Long applyId
    );



}
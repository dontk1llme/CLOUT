package com.mmm.clout.advertisementservice.common.docs;

import com.mmm.clout.advertisementservice.advertisements.persentation.request.CreateCampaignRequest;
import com.mmm.clout.advertisementservice.advertisements.persentation.response.CreateCampaignResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.enums.ParameterIn;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.ResponseEntity;


@Tag(name = "광고 api", description = "광고 관련 api")
public interface AdvertisementControllerDocs {

    @Operation(summary = "광고 캠페인 등록",
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
}
package com.mmm.clout.advertisementservice.common.docs;

import com.mmm.clout.advertisementservice.advertisements.persentation.request.CreateAdRequest;
import com.mmm.clout.advertisementservice.advertisements.persentation.response.CreateCampaignResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.enums.ParameterIn;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.ResponseEntity;


@Tag(name = "맥주 도감 리스트 조회", description = "맥주 도감 리스트를 가져오는 api")
public interface AdvertisementControllerDocs {

    @Operation(summary = "광고 캠페인 등록",
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
        @ApiResponse(responseCode = "200", description = "광고 캠페인 등록 성공",
            content =
            @Content(mediaType="application/json",
                schema=@Schema(implementation= CreateCampaignResponse.class))
        )
    )
    ResponseEntity<CreateCampaignResponse> createCampaign(
        CreateAdRequest request
    );
}
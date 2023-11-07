package com.mmm.clout.advertisementservice.common.docs;

import com.mmm.clout.advertisementservice.advertisements.persentation.request.CreateCampaignRequest;
import com.mmm.clout.advertisementservice.advertisements.persentation.request.UpdateCampaignRequest;
import com.mmm.clout.advertisementservice.advertisements.persentation.response.CreateCampaignResponse;
import com.mmm.clout.advertisementservice.advertisements.persentation.response.DeleteCampaignResponse;
import com.mmm.clout.advertisementservice.advertisements.persentation.response.EndedCampaignResponse;
import com.mmm.clout.advertisementservice.advertisements.persentation.response.GetCampaignAndAdvertiserResponse;
import com.mmm.clout.advertisementservice.advertisements.persentation.response.GetCampainListByAdvertiserResponse;
import com.mmm.clout.advertisementservice.advertisements.persentation.response.GetTop10CampainListResponse;
import com.mmm.clout.advertisementservice.advertisements.persentation.response.UpdateCampaignResponse;
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
            @Content(mediaType = "application/json",
                schema = @Schema(implementation = CreateCampaignResponse.class))
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
            ),
            @Parameter(
                in = ParameterIn.PATH,
                name = "advertisementId",
                required = true,
                schema = @Schema(type = "long"),
                description = "광고 캠페인의 고유 식별자"
            )
        },
        responses =
        @ApiResponse(responseCode = "200", description = "광고 캠페인 수정 성공",
            content =
            @Content(mediaType = "application/json",
                schema = @Schema(implementation = UpdateCampaignResponse.class))
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
            ),
            @Parameter(
                in = ParameterIn.PATH,
                name = "advertisementId",
                required = true,
                schema = @Schema(type = "long"),
                description = "광고 캠페인의 고유 식별자"
            )
        },
        responses =
        @ApiResponse(responseCode = "200", description = "광고 캠페인 삭제 처리 성공",
            content =
            @Content(mediaType = "application/json",
                schema = @Schema(implementation = DeleteCampaignResponse.class))
        )
    )
    ResponseEntity<DeleteCampaignResponse> deleteCampaign(
        Long advertisementId
    );

    @Operation(summary = "캠페인 캠페인 상세 조회 (광고주 정보 포함)",
        description = "광고 캠페인 id를 받아 상세 정보를 조회합니다. ",
        parameters = {
            @Parameter(
                in = ParameterIn.PATH,
                name = "advertisementId",
                required = true,
                schema = @Schema(type = "long"),
                description = "광고 캠페인의 고유 식별자"
            )
        },
        responses =
        @ApiResponse(responseCode = "200", description = "광고 캠페인 상세 정보 조회 성공",
            content =
            @Content(mediaType = "application/json",
                schema = @Schema(implementation = GetCampaignAndAdvertiserResponse.class))
        )
    )
    ResponseEntity<GetCampaignAndAdvertiserResponse> getCampaignDetails(
        Long advertisementId
    );

    @Operation(summary = "인기 있는 광고 리스트 (10개) 조회",
        description = "모집기간 내의 캠페인 중 신청자 수 많은 순 / 우선순위가 같을경우, 최신순",
        responses =
        @ApiResponse(responseCode = "200", description = "인기 있는 광고 리스트 (10개) 조회 성공",
            content =
            @Content(mediaType = "application/json",
                schema = @Schema(implementation = GetTop10CampainListResponse.class))
        )
    )
    ResponseEntity<GetTop10CampainListResponse> getTop10Campaigns();


    @Operation(summary = "광고주 자신이 올린 광고 목록 조회 (최신순)",
        description = "광고주가 본인이 등록한 광고 캠페인 목록을 조회합니다.",
        parameters = {
            @Parameter(
                in = ParameterIn.HEADER,
                name = "Authorization",
                required = true,
                schema = @Schema(type = "string"),
                description = "인증 토큰"
            ),
            @Parameter(
                in = ParameterIn.QUERY,
                name = "advertiserId",
                required = true,
                schema = @Schema(type = "long"),
                description = "광고주의 고유 식별자"
            ),
            @Parameter(
                in = ParameterIn.QUERY,
                name = "page",
                required = true,
                schema = @Schema(type = "int"),
                description = "페이지 번호 (0부터 시작)"
            ),
            @Parameter(
                in = ParameterIn.QUERY,
                name = "size",
                required = true,
                schema = @Schema(type = "int"),
                description = "한 페이지당 보여줄 글 갯수"
            )
        },
        responses =
        @ApiResponse(responseCode = "200", description = "광고주가 올린 광고 목록 조회 성공",
            content =
            @Content(mediaType = "application/json",
                schema = @Schema(implementation = GetCampainListByAdvertiserResponse.class))
        )
    )
    ResponseEntity<GetCampainListByAdvertiserResponse> getCampaignsByAdvertisers(
        Long advertiserId,
        int page,
        int size
    );

    @Operation(summary = "캠페인 모집 종료",
        description = "광고주가 캠페인 모집을 종료합니다.",
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
                name = "advertisementId",
                required = true,
                schema = @Schema(type = "long"),
                description = "광고 캠페인의 고유 식별자"
            )
        },
        responses =
        @ApiResponse(responseCode = "200", description = "광고 캠페인 모집 종료 처리 성공",
            content =
            @Content(mediaType = "application/json",
                schema = @Schema(implementation = EndedCampaignResponse.class))
        )
    )
    ResponseEntity<EndedCampaignResponse> endCampaign(
        Long advertisementId
    );

}
package com.mmm.clout.pointservice.common.docs;

import com.mmm.clout.pointservice.point.presentation.request.ChargePointRequest;
import com.mmm.clout.pointservice.point.presentation.response.ChargePointResponse;
import com.mmm.clout.pointservice.point.presentation.response.CustomPageResponse;
import com.mmm.clout.pointservice.point.presentation.response.GetMemberTotalPointResponse;
import com.mmm.clout.pointservice.point.presentation.response.PointTransactionResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.enums.ParameterIn;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;


@Tag(name = "포인트 api", description = "포인트 관련 api")
public interface PointControllerDocs {
    @Operation(summary = "포인트 충전",
        description = "사용자가 포인트를 충전합니다.",
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
        @ApiResponse(responseCode = "200", description = "충전 성공",
            content =
            @Content(mediaType = "application/json",
                schema = @Schema(implementation = ChargePointResponse.class))
        ),
        requestBody = @io.swagger.v3.oas.annotations.parameters.RequestBody(
            content = @Content(mediaType = "application/json",
                schema = @Schema(implementation = ChargePointRequest.class)),
            description = "캠페인 수정을 위한 정보",
            required = true
        )
    )
    ResponseEntity<ChargePointResponse> charge(
        ChargePointRequest request
    );


    @Operation(summary = "유저 포인트 잔액 조회",
        description = "사용자가 현재 남은 포인트를 조회합니다.",
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
                name = "memberId",
                required = true,
                description = "멤버 고유 식별자(id)"
            ),
        },
        responses =
        @ApiResponse(responseCode = "200", description = "유저 잔액 포인트 조회 성공",
            content =
            @Content(mediaType = "application/json",
                schema = @Schema(implementation = GetMemberTotalPointResponse.class))
        )
    )
    ResponseEntity<GetMemberTotalPointResponse> getMemberPoint(
        @RequestParam Long memberId
    );


    @Operation(summary = "유저 포인트 내역 조회",
        description = "전체, 거래, 충전, 출금 내역 조회 가능 (페이지네이션)",
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
                name = "memberId",
                required = true,
                description = "포인트 카테고리 (ALL, DEAL, CHARGE, WITHDRAWAL)"
            ),
            @Parameter(
                in = ParameterIn.QUERY,
                name = "category",
                required = true,
                description = "페이지네이션 페이지"
            ),
            @Parameter(
                in = ParameterIn.QUERY,
                name = "page",
                required = true,
                description = "페이지네이션 페이지당 보여줄 데이터 사이즈"
            ),
            @Parameter(
                in = ParameterIn.QUERY,
                name = "size",
                required = true,
                description = "멤버 고유 식별자(id)"
            )
        },
        responses =
        @ApiResponse(responseCode = "200", description = "멤버 카테고리별 포인트 내역 조회 성공",
            content =
            @Content(mediaType = "application/json",
                schema = @Schema(implementation = CustomPageResponse.class))
        )
    )
    ResponseEntity<CustomPageResponse<PointTransactionResponse>> getTransactionListByType(
        @RequestParam Long memberId,
        @RequestParam String category,
        @RequestParam(defaultValue = "0") int page,
        @RequestParam(defaultValue = "10") int size
    );




}
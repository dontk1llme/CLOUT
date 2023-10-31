package com.mmm.clout.imageservice.common.docs;

import com.mmm.clout.imageservice.image.presentation.request.UploadImageRequest;
import com.mmm.clout.imageservice.image.presentation.response.UploadImageResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.enums.ParameterIn;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;


@Tag(name = "맥주 도감 리스트 조회", description = "맥주 도감 리스트를 가져오는 api")
public interface ImageControllerDocs {

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
                schema=@Schema(implementation= UploadImageResponse.class))
        )
    )
    ResponseEntity<List<UploadImageResponse>> UploadImage(
            UploadImageRequest uploadImageRequest, List<MultipartFile> fileList
    ) throws Exception;
}
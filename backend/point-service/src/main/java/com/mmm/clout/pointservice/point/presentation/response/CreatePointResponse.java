package com.mmm.clout.pointservice.point.presentation.response;

import com.mmm.clout.pointservice.point.domain.Point;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class CreatePointResponse {

    @Schema(description = "생성된 포인트 고유 식별자 (id)")
    private Long createdPointId;

    @Schema(description = "멤버 고유 식별자(id)")
    private Long memberId;


    public static CreatePointResponse from(Point point) {
        return new CreatePointResponse(point.getId(), point.getMemberId());
    }
}

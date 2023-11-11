package com.mmm.clout.pointservice.point.presentation.response;

import com.mmm.clout.pointservice.point.domain.PointTransaction;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class AddPointResponse {

    private Long pointId;

    private Long memberId;

    private Long addedPoint;

    private Long totalPoint;

    public static AddPointResponse from(PointTransaction pts) {
        return new AddPointResponse(
            pts.getPoint().getId(),
            pts.getPoint().getMemberId(),
            pts.getAmount(),
            pts.getPoint().getTotalPoint()
        );
    }
}

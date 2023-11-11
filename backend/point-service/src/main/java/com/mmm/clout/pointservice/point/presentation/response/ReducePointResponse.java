package com.mmm.clout.pointservice.point.presentation.response;

import com.mmm.clout.pointservice.point.domain.Point;
import com.mmm.clout.pointservice.point.domain.PointTransaction;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class ReducePointResponse {

    private Long pointId;

    private Long memberId;

    private Long reducedPoint;

    private Long totalPoint;

    public static ReducePointResponse from(PointTransaction pts) {
        return new ReducePointResponse(
            pts.getPoint().getId(),
            pts.getPoint().getMemberId(),
            pts.getAmount(),
            pts.getPoint().getTotalPoint()
        );
    }
}

package com.mmm.clout.pointservice.point.domain;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public enum PointCategory {

    /* DEAL */
    CONTRACT("계약"),
    CREATE_CAMPAIGN("캠페인 등록"),
    /* CHARGE */
    CHARGE("포인트 충전"),
    /* WITHDRAWAL */
    WITHDRAWAL("포인트 출금");

    private final String description;

    public static PointCategory convertToEnum(String categoryStr) {
        return PointCategory.valueOf(categoryStr.toUpperCase());
    }

}

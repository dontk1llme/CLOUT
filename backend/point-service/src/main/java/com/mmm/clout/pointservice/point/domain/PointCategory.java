package com.mmm.clout.pointservice.point.domain;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public enum PointCategory {

    CREATE_AD("광고 캠페인 등록"), CONTRACT("계약"), PAY("결제");

    private final String description;

    public PointCategory convertToPointCategory(String categoryStr) {
        return PointCategory.valueOf(categoryStr.toUpperCase());
    }

}

package com.mmm.clout.pointservice.point.domain;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public enum PointCategory {

    CREATE_AD("광고 캠페인 등록"), CONTRACT("계약");

    private final String description;


}

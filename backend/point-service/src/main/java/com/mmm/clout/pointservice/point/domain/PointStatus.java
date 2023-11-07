package com.mmm.clout.pointservice.point.domain;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public enum PointStatus {

    CHARGE("충전"), USED("사용"), REFUND("환불");

    private final String description;

}

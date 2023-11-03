package com.mmm.clout.pointservice.point.domain;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class PointTransaction {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    private Point point;

    private Long amount;

    @Enumerated(EnumType.STRING)
    private PointStatus pointStatus;

    @Enumerated(EnumType.STRING)
    private PointCategory pointCategory;

}

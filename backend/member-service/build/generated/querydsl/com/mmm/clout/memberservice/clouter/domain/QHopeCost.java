package com.mmm.clout.memberservice.clouter.domain;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;


/**
 * QHopeCost is a Querydsl query type for HopeCost
 */
@Generated("com.querydsl.codegen.DefaultEmbeddableSerializer")
public class QHopeCost extends BeanPath<HopeCost> {

    private static final long serialVersionUID = -1805216275L;

    public static final QHopeCost hopeCost = new QHopeCost("hopeCost");

    public final NumberPath<Long> minCost = createNumber("minCost", Long.class);

    public QHopeCost(String variable) {
        super(HopeCost.class, forVariable(variable));
    }

    public QHopeCost(Path<? extends HopeCost> path) {
        super(path.getType(), path.getMetadata());
    }

    public QHopeCost(PathMetadata metadata) {
        super(HopeCost.class, metadata);
    }

}


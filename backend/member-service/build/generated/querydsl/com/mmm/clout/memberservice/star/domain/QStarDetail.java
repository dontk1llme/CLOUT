package com.mmm.clout.memberservice.star.domain;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QStarDetail is a Querydsl query type for StarDetail
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QStarDetail extends EntityPathBase<StarDetail> {

    private static final long serialVersionUID = 1134138491L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QStarDetail starDetail = new QStarDetail("starDetail");

    public final NumberPath<Long> contractId = createNumber("contractId", Long.class);

    public final NumberPath<Long> giverId = createNumber("giverId", Long.class);

    public final NumberPath<Long> id = createNumber("id", Long.class);

    public final NumberPath<Long> score = createNumber("score", Long.class);

    public final QStar star;

    public QStarDetail(String variable) {
        this(StarDetail.class, forVariable(variable), INITS);
    }

    public QStarDetail(Path<? extends StarDetail> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QStarDetail(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QStarDetail(PathMetadata metadata, PathInits inits) {
        this(StarDetail.class, metadata, inits);
    }

    public QStarDetail(Class<? extends StarDetail> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.star = inits.isInitialized("star") ? new QStar(forProperty("star"), inits.get("star")) : null;
    }

}


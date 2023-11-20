package com.mmm.clout.memberservice.star.domain;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QStar is a Querydsl query type for Star
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QStar extends EntityPathBase<Star> {

    private static final long serialVersionUID = 1490149258L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QStar star = new QStar("star");

    public final NumberPath<Long> id = createNumber("id", Long.class);

    public final com.mmm.clout.memberservice.member.domain.QMember member;

    public final NumberPath<Long> numberOfRaters = createNumber("numberOfRaters", Long.class);

    public final ListPath<StarDetail, QStarDetail> starDetails = this.<StarDetail, QStarDetail>createList("starDetails", StarDetail.class, QStarDetail.class, PathInits.DIRECT2);

    public final NumberPath<Long> totalScore = createNumber("totalScore", Long.class);

    public QStar(String variable) {
        this(Star.class, forVariable(variable), INITS);
    }

    public QStar(Path<? extends Star> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QStar(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QStar(PathMetadata metadata, PathInits inits) {
        this(Star.class, metadata, inits);
    }

    public QStar(Class<? extends Star> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.member = inits.isInitialized("member") ? new com.mmm.clout.memberservice.member.domain.QMember(forProperty("member")) : null;
    }

}


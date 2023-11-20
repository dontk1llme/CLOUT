package com.mmm.clout.memberservice.clouter.domain;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QClouter is a Querydsl query type for Clouter
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QClouter extends EntityPathBase<Clouter> {

    private static final long serialVersionUID = 1652591214L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QClouter clouter = new QClouter("clouter");

    public final com.mmm.clout.memberservice.member.domain.QMember _super = new com.mmm.clout.memberservice.member.domain.QMember(this);

    public final com.mmm.clout.memberservice.common.entity.address.QAddress address;

    public final NumberPath<Integer> age = createNumber("age", Integer.class);

    //inherited
    public final NumberPath<Long> avgScore = _super.avgScore;

    public final DatePath<java.time.LocalDate> birthday = createDate("birthday", java.time.LocalDate.class);

    public final ListPath<com.mmm.clout.memberservice.common.Category, EnumPath<com.mmm.clout.memberservice.common.Category>> categoryList = this.<com.mmm.clout.memberservice.common.Category, EnumPath<com.mmm.clout.memberservice.common.Category>>createList("categoryList", com.mmm.clout.memberservice.common.Category.class, EnumPath.class, PathInits.DIRECT2);

    public final ListPath<Channel, QChannel> channelList = this.<Channel, QChannel>createList("channelList", Channel.class, QChannel.class, PathInits.DIRECT2);

    //inherited
    public final NumberPath<Integer> countOfContract = _super.countOfContract;

    //inherited
    public final NumberPath<Long> id = _super.id;

    public final NumberPath<Long> minCost = createNumber("minCost", Long.class);

    public final StringPath name = createString("name");

    public final StringPath nickName = createString("nickName");

    public final StringPath phoneNumber = createString("phoneNumber");

    //inherited
    public final StringPath pwd = _super.pwd;

    public final ListPath<com.mmm.clout.memberservice.common.Region, EnumPath<com.mmm.clout.memberservice.common.Region>> regionList = this.<com.mmm.clout.memberservice.common.Region, EnumPath<com.mmm.clout.memberservice.common.Region>>createList("regionList", com.mmm.clout.memberservice.common.Region.class, EnumPath.class, PathInits.DIRECT2);

    //inherited
    public final EnumPath<com.mmm.clout.memberservice.common.Role> role = _super.role;

    //inherited
    public final StringPath userId = _super.userId;

    public QClouter(String variable) {
        this(Clouter.class, forVariable(variable), INITS);
    }

    public QClouter(Path<? extends Clouter> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QClouter(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QClouter(PathMetadata metadata, PathInits inits) {
        this(Clouter.class, metadata, inits);
    }

    public QClouter(Class<? extends Clouter> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.address = inits.isInitialized("address") ? new com.mmm.clout.memberservice.common.entity.address.QAddress(forProperty("address")) : null;
    }

}


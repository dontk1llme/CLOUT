package com.mmm.clout.memberservice.advertiser.domain;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QAdvertiser is a Querydsl query type for Advertiser
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QAdvertiser extends EntityPathBase<Advertiser> {

    private static final long serialVersionUID = 418725756L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QAdvertiser advertiser = new QAdvertiser("advertiser");

    public final com.mmm.clout.memberservice.member.domain.QMember _super = new com.mmm.clout.memberservice.member.domain.QMember(this);

    public final com.mmm.clout.memberservice.common.entity.address.QAddress address;

    //inherited
    public final NumberPath<Long> avgScore = _super.avgScore;

    public final QCompanyInfo companyInfo;

    //inherited
    public final NumberPath<Integer> countOfContract = _super.countOfContract;

    //inherited
    public final NumberPath<Long> id = _super.id;

    //inherited
    public final StringPath pwd = _super.pwd;

    //inherited
    public final EnumPath<com.mmm.clout.memberservice.common.Role> role = _super.role;

    //inherited
    public final StringPath userId = _super.userId;

    public QAdvertiser(String variable) {
        this(Advertiser.class, forVariable(variable), INITS);
    }

    public QAdvertiser(Path<? extends Advertiser> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QAdvertiser(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QAdvertiser(PathMetadata metadata, PathInits inits) {
        this(Advertiser.class, metadata, inits);
    }

    public QAdvertiser(Class<? extends Advertiser> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.address = inits.isInitialized("address") ? new com.mmm.clout.memberservice.common.entity.address.QAddress(forProperty("address")) : null;
        this.companyInfo = inits.isInitialized("companyInfo") ? new QCompanyInfo(forProperty("companyInfo")) : null;
    }

}


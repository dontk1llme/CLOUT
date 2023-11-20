package com.mmm.clout.memberservice.member.domain;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;


/**
 * QMember is a Querydsl query type for Member
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QMember extends EntityPathBase<Member> {

    private static final long serialVersionUID = 180040090L;

    public static final QMember member = new QMember("member1");

    public final NumberPath<Long> avgScore = createNumber("avgScore", Long.class);

    public final NumberPath<Integer> countOfContract = createNumber("countOfContract", Integer.class);

    public final NumberPath<Long> id = createNumber("id", Long.class);

    public final StringPath pwd = createString("pwd");

    public final EnumPath<com.mmm.clout.memberservice.common.Role> role = createEnum("role", com.mmm.clout.memberservice.common.Role.class);

    public final StringPath userId = createString("userId");

    public QMember(String variable) {
        super(Member.class, forVariable(variable));
    }

    public QMember(Path<? extends Member> path) {
        super(path.getType(), path.getMetadata());
    }

    public QMember(PathMetadata metadata) {
        super(Member.class, metadata);
    }

}


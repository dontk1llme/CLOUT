package com.mmm.clout.memberservice.clouter.domain;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;


/**
 * QChannel is a Querydsl query type for Channel
 */
@Generated("com.querydsl.codegen.DefaultEmbeddableSerializer")
public class QChannel extends BeanPath<Channel> {

    private static final long serialVersionUID = 1524931007L;

    public static final QChannel channel = new QChannel("channel");

    public final NumberPath<Long> followerScale = createNumber("followerScale", Long.class);

    public final StringPath link = createString("link");

    public final StringPath name = createString("name");

    public final EnumPath<com.mmm.clout.memberservice.common.Platform> platform = createEnum("platform", com.mmm.clout.memberservice.common.Platform.class);

    public QChannel(String variable) {
        super(Channel.class, forVariable(variable));
    }

    public QChannel(Path<? extends Channel> path) {
        super(path.getType(), path.getMetadata());
    }

    public QChannel(PathMetadata metadata) {
        super(Channel.class, metadata);
    }

}


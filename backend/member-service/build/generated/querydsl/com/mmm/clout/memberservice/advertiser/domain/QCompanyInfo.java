package com.mmm.clout.memberservice.advertiser.domain;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;


/**
 * QCompanyInfo is a Querydsl query type for CompanyInfo
 */
@Generated("com.querydsl.codegen.DefaultEmbeddableSerializer")
public class QCompanyInfo extends BeanPath<CompanyInfo> {

    private static final long serialVersionUID = 1647343258L;

    public static final QCompanyInfo companyInfo = new QCompanyInfo("companyInfo");

    public final StringPath ceoName = createString("ceoName");

    public final StringPath companyName = createString("companyName");

    public final StringPath managerName = createString("managerName");

    public final StringPath managerPhoneNumber = createString("managerPhoneNumber");

    public final StringPath regNum = createString("regNum");

    public QCompanyInfo(String variable) {
        super(CompanyInfo.class, forVariable(variable));
    }

    public QCompanyInfo(Path<? extends CompanyInfo> path) {
        super(path.getType(), path.getMetadata());
    }

    public QCompanyInfo(PathMetadata metadata) {
        super(CompanyInfo.class, metadata);
    }

}


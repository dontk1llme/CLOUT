package com.mmm.clout.memberservice.clouter.infrastructure.persistence.jpa;

import com.mmm.clout.memberservice.clouter.domain.Clouter;
import com.mmm.clout.memberservice.clouter.domain.QChannel;
import com.mmm.clout.memberservice.clouter.domain.QClouter;
import com.querydsl.jpa.impl.JPAQueryFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.Optional;

import static com.mmm.clout.memberservice.clouter.domain.QChannel.channel;
import static com.mmm.clout.memberservice.clouter.domain.QClouter.*;

@Repository
@RequiredArgsConstructor
public class JpaClouterRepositoryImpl implements JpaClouterRepositoryCustom {

    private final JPAQueryFactory queryFactory;

    @Override
    public Optional<Clouter> getClouterWithAllData(Long ClouterId) {
            return null;
//        return queryFactory
//            .selectFrom(clouter)
//            .leftJoin(channel)
//            .on(clouter.id)
//            .where(clouter.id.eq(clouter.id))
    }
}

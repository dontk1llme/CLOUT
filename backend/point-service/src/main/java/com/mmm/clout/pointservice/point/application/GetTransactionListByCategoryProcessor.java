package com.mmm.clout.pointservice.point.application;

import static com.mmm.clout.pointservice.point.domain.QPointTransaction.pointTransaction;
import static org.springframework.util.StringUtils.hasText;

import com.mmm.clout.pointservice.point.domain.PointCategory;
import com.mmm.clout.pointservice.point.domain.exception.InvalidCategoryException;
import com.mmm.clout.pointservice.point.domain.Point;
import com.mmm.clout.pointservice.point.domain.PointTransaction;
import com.mmm.clout.pointservice.point.domain.repository.PointRepository;
import com.mmm.clout.pointservice.point.domain.repository.PointTransactionRepository;
import com.querydsl.core.types.dsl.BooleanExpression;
import com.querydsl.jpa.impl.JPAQuery;
import com.querydsl.jpa.impl.JPAQueryFactory;
import java.util.List;
import javax.transaction.Transaction;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.support.PageableExecutionUtils;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
public class GetTransactionListByCategoryProcessor {

    private final PointRepository pointRepository;
    private final JPAQueryFactory queryFactory;

    @Transactional
    public Page<PointTransaction> execute(Long memberId, String category, PageRequest pageable) {
        Point point = pointRepository.findByMemberId(memberId)
            .orElseGet(() -> pointRepository.save(Point.create(memberId, 0L)));

        List<PointTransaction> content = queryFactory.query()
            .select(pointTransaction)
            .from(pointTransaction)
            .where(
                pointEq(point).and(categoryEq(category))
            )
            .offset(pageable.getOffset())
            .limit(pageable.getPageSize())
            .fetch();

        JPAQuery<PointTransaction> countQuery = getCountQuery(category, point);

        return PageableExecutionUtils.getPage(content, pageable, countQuery::fetchCount);
    }

    private JPAQuery<PointTransaction> getCountQuery(String category, Point point) {
        JPAQuery<PointTransaction> countQuery = queryFactory.query()
            .select(pointTransaction)
            .from(pointTransaction)
            .where(
                pointEq(point).and(categoryEq(category))
            );
        return countQuery;
    }

    private BooleanExpression pointEq(Point point) {
        return pointTransaction.point.eq(point);
    }

    private BooleanExpression categoryEq(String category) {
        if (!hasText(category)) throw new InvalidCategoryException();
        switch (category) {
            case "ALL":
                return null; // 모든 카테고리
            case "DEAL":  // 거래 카테고리 - 계약, 캠페인 등록
                return pointTransaction.pointCategory.eq(PointCategory.CONTRACT)
                    .or(pointTransaction.pointCategory.eq(PointCategory.CREATE_CAMPAIGN));
            case "CHARGE":  // 충전 카테고리
                return pointTransaction.pointCategory.eq(PointCategory.CHARGE);
            case "WITHDRAWAL":  // 출금 카테고리
                return pointTransaction.pointCategory.eq(PointCategory.WITHDRAWAL);
            default: throw new InvalidCategoryException();
        }
    }
}

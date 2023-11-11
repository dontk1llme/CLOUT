package com.mmm.clout.advertisementservice.advertisements.application;

import static com.mmm.clout.advertisementservice.advertisements.domain.QCampaign.campaign;
import static org.springframework.util.StringUtils.hasText;

import com.mmm.clout.advertisementservice.advertisements.application.command.SearchCondition;
import com.mmm.clout.advertisementservice.advertisements.domain.AdCategory;
import com.mmm.clout.advertisementservice.advertisements.domain.AdPlatform;
import com.mmm.clout.advertisementservice.advertisements.domain.Campaign;
import com.mmm.clout.advertisementservice.advertisements.domain.Region;
import com.mmm.clout.advertisementservice.advertisements.domain.repository.CampaignRepository;
import com.querydsl.core.types.dsl.BooleanExpression;
import com.querydsl.jpa.impl.JPAQuery;
import com.querydsl.jpa.impl.JPAQueryFactory;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.support.PageableExecutionUtils;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
public class SearchCampaignListProcessor {

    private final CampaignRepository campaignRepository;
    private final JPAQueryFactory queryFactory;

    @Transactional
    public Page<Campaign> execute(
        Pageable pageable,
        SearchCondition condition
    ) {

        List<Campaign> content = queryFactory.query()
            .select(campaign)
            .from(campaign)
            .where(
                keywordContains(condition.getKeyword()),
                priceBetween(condition.getMinPrice(), condition.getMaxPrice()),
                ageGoe(condition.getMinAge()),
                ageLoe(condition.getMaxAge()),
                followerGoe(condition.getMinFollower()),
                categoryEq(condition.getCategory()),
                regionEq(condition.getRegion()),
                platformEq(condition.getPlatform())
            )
            .offset(pageable.getOffset())
            .limit(pageable.getPageSize())
            .fetch();

        JPAQuery<Campaign> countQuery = queryFactory.query()
            .select(campaign)
            .from(campaign)
            .where(
                keywordContains(condition.getKeyword()),
                priceBetween(condition.getMinPrice(), condition.getMaxPrice()),
                ageGoe(condition.getMinAge()),
                ageLoe(condition.getMaxAge()),
                followerGoe(condition.getMinFollower()),
                categoryEq(condition.getCategory()),
                regionEq(condition.getRegion()),
                platformEq(condition.getPlatform())
            );

        return PageableExecutionUtils.getPage(content, pageable, countQuery::fetchCount);
    }

    private BooleanExpression platformEq(List<AdPlatform> platform) {
        if (platform.get(0) == AdPlatform.ALL) {
            return null;
        } else {
            return campaign.adPlatformList.any().in(platform);
        }
    }

    private BooleanExpression regionEq(List<Region> region) {
        if (region.get(0) == Region.ALL) {
            return null;
        } else {
            return campaign.regionList.any().in(region);
        }
    }

    private BooleanExpression categoryEq(List<AdCategory> category) {
        if (category.get(0) == AdCategory.ALL) {
            return null;
        } else {
            return campaign.adCategory.in(category);
        }
    }

    private BooleanExpression followerGoe(Integer minFollower) {
        return (minFollower != null) ? campaign.minFollower.goe(minFollower) : null;
    }

    private BooleanExpression ageLoe(Integer maxAge) {
        return (maxAge != null) ? campaign.maxClouterAge.loe(maxAge) : null;
    }

    private BooleanExpression ageGoe(Integer minAge) {
        return (minAge != null) ? campaign.minClouterAge.goe(minAge) : null;
    }

    private BooleanExpression priceBetween(Integer minPrice, Integer maxPrice) {
        return (minPrice != null && maxPrice != null) ? campaign.price.between(minPrice, maxPrice) : null;
    }

    private BooleanExpression keywordContains(String keyword) {
        return hasText(keyword) ? campaign.title.contains(keyword) : null;
    }
}

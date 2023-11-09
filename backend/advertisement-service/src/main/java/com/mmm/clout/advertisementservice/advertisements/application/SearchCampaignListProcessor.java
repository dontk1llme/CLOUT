package com.mmm.clout.advertisementservice.advertisements.application;

import com.mmm.clout.advertisementservice.advertisements.application.reader.CampaignDto;
import com.mmm.clout.advertisementservice.advertisements.domain.AdCategory;
import com.mmm.clout.advertisementservice.advertisements.domain.AdPlatform;
import com.mmm.clout.advertisementservice.advertisements.domain.Campaign;
import com.mmm.clout.advertisementservice.advertisements.domain.QCampaign;
import com.mmm.clout.advertisementservice.advertisements.domain.Region;
import com.mmm.clout.advertisementservice.advertisements.domain.repository.CampaignRepository;
import com.mmm.clout.advertisementservice.advertisements.domain.search.CampaignSort;
import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.types.Order;
import com.querydsl.core.types.OrderSpecifier;
import com.querydsl.core.types.dsl.PathBuilder;
import com.querydsl.jpa.impl.JPAQueryFactory;
import java.util.List;
import java.util.stream.Collectors;
import lombok.RequiredArgsConstructor;
import org.hibernate.Hibernate;
import org.springframework.data.domain.Pageable;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

@RequiredArgsConstructor
public class SearchCampaignListProcessor {

    private final CampaignRepository campaignRepository;
    private final JPAQueryFactory jpaQueryFactory;

    @Transactional(readOnly = true)
    public List<CampaignDto> execute(
        Pageable pageable,
        List<String> category,
        List<String> platform,
        Integer minAge,
        Integer maxAge,
        Integer minFollower,
        Integer minPrice,
        Integer maxPrice,
        List<String> region,
        String keyword,
        String sort
    ) {
        QCampaign qcp = QCampaign.campaign;
        BooleanBuilder condition = new BooleanBuilder();

        // 광고 TITLE 키워드 검색 조건
        if (StringUtils.hasText(keyword)) {
            condition.and(qcp.title.like("%" + keyword + "%"));
        }

        // 최소/최대 광고비, 최소 팔로워 수, 최소/최대 클라우터 나이 조건
        condition
            .and(qcp.price.loe(maxPrice))
            .and(qcp.price.goe(minPrice))
            .and(qcp.minClouterAge.loe(maxAge))
            .and(qcp.maxClouterAge.goe(minAge))
            .and(qcp.minFollower.goe(minFollower));

        // 카테고리 조건
        BooleanBuilder categoryCondition = new BooleanBuilder();
        if (category != null && !category.isEmpty()) {
            for (String cat : category) {
                categoryCondition.or(qcp.adCategory.eq(AdCategory.valueOf(cat)));
            }
        }

        // 지역 조건
        BooleanBuilder regionCondition = new BooleanBuilder();
        if (region != null && !region.isEmpty()) {
            for (String reg : region) {
                regionCondition.or(qcp.regionList.any().eq(Region.valueOf(reg)));
            }
        }

        // 플랫폼 조건
        BooleanBuilder platformCondition = new BooleanBuilder();
        if (platform != null && !platform.isEmpty()) {
            for (String pl : platform) {
                platformCondition.or(qcp.adPlatformList.any().eq(AdPlatform.valueOf(pl)));
            }
        }

        List<Campaign> campaigns = jpaQueryFactory.query()
            .select(qcp).from(qcp)
            .where(condition, categoryCondition, regionCondition, platformCondition)
            .offset(pageable.getOffset()).limit(pageable.getPageSize()).fetch();

        for (Campaign campaign : campaigns) {
            campaign.readTransaction();
        }

        return campaigns.stream().map(
            CampaignDto::from
        ).collect(Collectors.toList());
    }

}

package com.mmm.clout.advertisementservice.advertisements.application;

import static com.mmm.clout.advertisementservice.advertisements.domain.QCampaign.campaign;

import com.mmm.clout.advertisementservice.advertisements.application.command.SearchCondition;
import com.mmm.clout.advertisementservice.advertisements.application.reader.CampaignDto;
import com.mmm.clout.advertisementservice.advertisements.domain.AdCategory;
import com.mmm.clout.advertisementservice.advertisements.domain.AdPlatform;
import com.mmm.clout.advertisementservice.advertisements.domain.Campaign;
import com.mmm.clout.advertisementservice.advertisements.domain.Region;
import com.mmm.clout.advertisementservice.advertisements.domain.repository.CampaignRepository;
import com.querydsl.core.BooleanBuilder;
import com.querydsl.jpa.impl.JPAQueryFactory;
import java.util.List;
import java.util.stream.Collectors;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Pageable;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

@RequiredArgsConstructor
public class SearchCampaignListProcessor {

    private final CampaignRepository campaignRepository;
    private final JPAQueryFactory jpaQueryFactory;


    @Transactional(readOnly = true)
    public List<CampaignDto> execute(SearchCondition condition) {
        BooleanBuilder searchCondition = new BooleanBuilder();

        // 광고 TITLE 키워드 검색 조건 (%keyword%)
        if (StringUtils.hasText(condition.getKeyword())) {
            searchCondition.and(campaign.title.contains(condition.getKeyword()));
        }

        // 최소/최대 광고비, 최소 팔로워 수, 최소/최대 클라우터 나이 조건
        searchCondition
            .and(campaign.price.between(condition.getMinPrice(), condition.getMaxPrice()))
            .and(campaign.minClouterAge.loe(condition.getMaxAge()))
            .and(campaign.maxClouterAge.goe(condition.getMinAge()))
            .and(campaign.minFollower.goe(condition.getMinFollower()));

        // 카테고리 조건
        BooleanBuilder categoryCondition = new BooleanBuilder();
        List<String> category = condition.getCategory();
        if (category != null && !category.isEmpty()) {
            for (String cat : category) {
                categoryCondition.or(campaign.adCategory.eq(AdCategory.valueOf(cat)));
            }
        }

        // 지역 조건
        BooleanBuilder regionCondition = new BooleanBuilder();
        List<String> region = condition.getRegion();
        if (region != null && !region.isEmpty()) {
            for (String reg : region) {
                regionCondition.or(campaign.regionList.any().eq(Region.valueOf(reg)));
            }
        }

        // 플랫폼 조건
        BooleanBuilder platformCondition = new BooleanBuilder();
        List<String> platform = condition.getPlatform();
        if (platform != null && !platform.isEmpty()) {
            for (String pl : platform) {
                platformCondition.or(campaign.adPlatformList.any().eq(AdPlatform.valueOf(pl)));
            }
        }
        Pageable pageable = condition.getPageable();
        List<Campaign> campaigns = jpaQueryFactory.query()
            .select(campaign).from(campaign)
            .where(searchCondition, categoryCondition, regionCondition, platformCondition)
            .offset(pageable.getOffset()).limit(pageable.getPageSize())
            .fetch();


        for (Campaign c : campaigns) {
            c.readTransaction();
        }

        return campaigns.stream().map(
            CampaignDto::from
        ).collect(Collectors.toList());
    }
}

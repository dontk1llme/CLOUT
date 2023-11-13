package com.mmm.clout.advertisementservice.advertisements.application;

import com.mmm.clout.advertisementservice.advertisements.application.command.SearchCondition;
import com.mmm.clout.advertisementservice.advertisements.application.reader.CampaignReader;
import com.mmm.clout.advertisementservice.advertisements.domain.Campaign;
import com.mmm.clout.advertisementservice.advertisements.domain.repository.CampaignRepository;
import com.mmm.clout.advertisementservice.common.msa.provider.MemberProvider;
import com.querydsl.jpa.impl.JPAQuery;
import java.util.List;
import java.util.stream.Collectors;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.support.PageableExecutionUtils;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
public class SearchCampaignListProcessor {

    private final CampaignRepository campaignRepository;
    private final MemberProvider memberProvider;

    @Transactional
    public Page<CampaignReader> execute(
        Pageable pageable,
        SearchCondition condition
    ) {
        List<Campaign> searchResult = campaignRepository.search(condition, pageable);
        JPAQuery<Campaign> countQuery = campaignRepository.getCountQuery(condition);

        List<CampaignReader> content = searchResult.stream().map(
            campaign -> new CampaignReader(
                campaign.initialize(),
                memberProvider.getAdvertiserInfoByMemberId(campaign.getAdvertiserId())
            )
        ).collect(Collectors.toList());

        return PageableExecutionUtils.getPage(content, pageable, countQuery::fetchCount);
    }


}

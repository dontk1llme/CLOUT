package com.mmm.clout.advertisementservice.advertisements.application;

import com.mmm.clout.advertisementservice.advertisements.application.command.SearchCondition;
import com.mmm.clout.advertisementservice.advertisements.application.reader.CampaignReader;
import com.mmm.clout.advertisementservice.advertisements.domain.Campaign;
import com.mmm.clout.advertisementservice.advertisements.domain.repository.CampaignRepository;
import com.mmm.clout.advertisementservice.common.msa.provider.MemberProvider;
import com.mmm.clout.advertisementservice.image.domain.AdvertiseSign;
import com.mmm.clout.advertisementservice.image.domain.Image;
import com.mmm.clout.advertisementservice.image.domain.repository.AdvertiseSignRepository;
import com.mmm.clout.advertisementservice.image.domain.repository.ImageRepository;
import com.querydsl.jpa.impl.JPAQuery;
import java.util.ArrayList;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.support.PageableExecutionUtils;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@RequiredArgsConstructor
public class SearchCampaignListProcessor {

    private final CampaignRepository campaignRepository;
    private final MemberProvider memberProvider;
    private final ImageRepository imageRepository;
    private final AdvertiseSignRepository advertiseSignRepository;

    @Transactional
    public Page<CampaignReader> execute(
        Pageable pageable,
        SearchCondition condition
    ) {
        List<Campaign> searchResult = campaignRepository.search(condition, pageable);
        JPAQuery<Campaign> countQuery = campaignRepository.getSearchCountQuery(condition);


        // TODO n+1 성능 최적화 필요 & image db 조회 더 개선할 수 있을지 고민해보기
        List<CampaignReader> content = new ArrayList<>();
        for (Campaign campaign : searchResult) {
            List<Image> images = imageRepository.findByCampaignId(campaign.getId());
            AdvertiseSign sign = advertiseSignRepository.findByAdvertisementId(campaign.getId());
            content.add(
                new CampaignReader(
                    campaign.initialize(),
                    memberProvider.getAdvertiserInfoByMemberId(campaign.getAdvertiserId()),
                    images,
                    sign
                )
            );
        }

        return PageableExecutionUtils.getPage(content, pageable, countQuery::fetchCount);
    }


}

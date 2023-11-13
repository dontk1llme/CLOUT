package com.mmm.clout.memberservice.bookmark.application;

import com.mmm.clout.memberservice.bookmark.application.reader.CampaignReader;
import com.mmm.clout.memberservice.bookmark.domain.info.CampaignInfo;
import com.mmm.clout.memberservice.bookmark.domain.provider.AdvertisementProvider;
import com.mmm.clout.memberservice.bookmark.domain.repository.BookmarkRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@RequiredArgsConstructor
public class SelectAdByMemberIdProcessor {

    private final BookmarkRepository bookmarkRepository;
    private final AdvertisementProvider advertisementProvider;

    @Transactional
    public List<CampaignReader> execute(Long memberId) {
        List<Long> idList = bookmarkRepository.findByMemberId(memberId).stream().map(v -> v.getTargetId()).collect(Collectors.toList());
        List<CampaignInfo> campaignInfos = advertisementProvider.getCampaignListById(idList).getBody();
        List<CampaignReader> result = campaignInfos.stream().map(v -> new CampaignReader(v)).collect(Collectors.toList());
        return result;
    }
}

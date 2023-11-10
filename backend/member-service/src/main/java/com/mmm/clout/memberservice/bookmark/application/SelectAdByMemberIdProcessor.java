package com.mmm.clout.memberservice.bookmark.application;

import com.mmm.clout.memberservice.bookmark.domain.repository.BookmarkRepository;
import com.mmm.clout.memberservice.bookmark.presentation.response.CampaignReader;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@RequiredArgsConstructor
public class SelectAdByMemberIdProcessor {

    private final BookmarkRepository bookmarkRepository;

    @Transactional
    public List<CampaignReader> execute(Long memberId) {
        List<Long> idList = bookmarkRepository.findByMemberId(memberId).stream().map(v -> v.getId()).collect(Collectors.toList());
        /// feign client 필요
        return null;
    }

}

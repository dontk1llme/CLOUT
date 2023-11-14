package com.mmm.clout.memberservice.bookmark.application;

import com.mmm.clout.memberservice.bookmark.domain.Bookmark;
import com.mmm.clout.memberservice.bookmark.domain.repository.BookmarkRepository;
import com.mmm.clout.memberservice.clouter.application.reader.ClouterReader;
import com.mmm.clout.memberservice.clouter.domain.Clouter;
import com.mmm.clout.memberservice.clouter.domain.repository.ClouterRepository;
import com.querydsl.jpa.impl.JPAQuery;
import lombok.RequiredArgsConstructor;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.support.PageableExecutionUtils;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@RequiredArgsConstructor
public class SelectClouterByMemberIdProcessor {

    private final BookmarkRepository bookmarkRepository;
    private final ClouterRepository clouterRepository;

    @Transactional
    public Page<ClouterReader> execute(Long memberId, Pageable pageable) {
        List<Long> idList = bookmarkRepository.findByMemberId(memberId, pageable).stream().map(v -> v.getTargetId()).collect(Collectors.toList());
        List<Clouter> clouterList = clouterRepository.findByIdIn(idList);
        List<ClouterReader> result = clouterList.stream().map(ClouterReader::new).collect(Collectors.toList());

        JPAQuery<Bookmark> countQuery = bookmarkRepository.findByMemberIdForCount(memberId);

        return PageableExecutionUtils.getPage(result, pageable, countQuery::fetchCount);
    }
}

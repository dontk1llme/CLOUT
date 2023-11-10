package com.mmm.clout.memberservice.bookmark.application;

import com.mmm.clout.memberservice.bookmark.domain.repository.BookmarkRepository;
import com.mmm.clout.memberservice.clouter.application.reader.ClouterReader;
import com.mmm.clout.memberservice.clouter.domain.Clouter;
import com.mmm.clout.memberservice.clouter.domain.repository.ClouterRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@RequiredArgsConstructor
public class SelectClouterByMemberIdProcessor {

    private final BookmarkRepository bookmarkRepository;
    private final ClouterRepository clouterRepository;

    @Transactional
    public List<ClouterReader> execute(Long memberId) {
        List<Long> idList = bookmarkRepository.findByMemberId(memberId).stream().map(v -> v.getId()).collect(Collectors.toList());
        List<Clouter> clouterList = clouterRepository.findByIdIn(idList);
        List<ClouterReader> result = clouterList.stream().map(
            v -> new ClouterReader(v)
        ).collect(Collectors.toList());
        return result;
    }
}

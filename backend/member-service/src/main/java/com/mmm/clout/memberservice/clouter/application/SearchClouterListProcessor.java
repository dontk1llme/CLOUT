package com.mmm.clout.memberservice.clouter.application;

import com.mmm.clout.memberservice.clouter.application.command.SearchCondition;
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
public class SearchClouterListProcessor {

    private final ClouterRepository clouterRepository;

    @Transactional
    public Page<ClouterReader> execute(Pageable pageable, SearchCondition condition) {

        List<Clouter> searchResult = clouterRepository.search(condition, pageable);
        JPAQuery<Clouter> countQuery = clouterRepository.getSearchCountQuery(condition);

        List<ClouterReader> content = searchResult.stream().map(
                clouter -> new ClouterReader(clouter)
        ).collect(Collectors.toList());

        return PageableExecutionUtils.getPage(content, pageable, countQuery::fetchCount);
    }

}

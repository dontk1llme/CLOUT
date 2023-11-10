package com.mmm.clout.memberservice.bookmark.infrastructure.configuration;

import com.mmm.clout.memberservice.bookmark.application.*;
import com.mmm.clout.memberservice.bookmark.domain.provider.AdvertisementProvider;
import com.mmm.clout.memberservice.bookmark.domain.repository.BookmarkRepository;
import com.mmm.clout.memberservice.clouter.domain.repository.ClouterRepository;
import com.mmm.clout.memberservice.member.domain.repository.MemberRepository;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class BookmarkConfig {

    @Bean
    public CreateAdBookmarkProcessor createAdBookmarkProcessor(
        BookmarkRepository bookmarkRepository,
        MemberRepository memberRepository
    ) {
        return new CreateAdBookmarkProcessor(bookmarkRepository, memberRepository);
    }

    @Bean
    public CreateClouterBookmarkProcessor createClouterBookmarkProcessor(
        BookmarkRepository bookmarkRepository,
        MemberRepository memberRepository
    ) {
        return new CreateClouterBookmarkProcessor(bookmarkRepository, memberRepository);
    }

    @Bean
    public DeleteBookmarkProcessor deleteBookmarkProcessor(
        BookmarkRepository bookmarkRepository
    ) {
        return new DeleteBookmarkProcessor(bookmarkRepository);
    }

    @Bean
    public SelectAdByMemberIdProcessor selectAdByMemberIdProcessor(
        BookmarkRepository bookmarkRepository, AdvertisementProvider advertisementProvider
    ) {
        return new SelectAdByMemberIdProcessor(bookmarkRepository, advertisementProvider);
    }

    @Bean
    public SelectClouterByMemberIdProcessor selectClouterByMemberIdProcessor(
        BookmarkRepository bookmarkRepository,
        ClouterRepository clouterRepository
    ) {
        return new SelectClouterByMemberIdProcessor(bookmarkRepository, clouterRepository);
    }
}

package com.mmm.clout.memberservice.bookmark.infrastructure.configuration;

import com.mmm.clout.memberservice.bookmark.application.CreateAdBookmarkProcessor;
import com.mmm.clout.memberservice.bookmark.application.CreateClouterBookmarkProcessor;
import com.mmm.clout.memberservice.bookmark.application.DeleteBookmarkProcessor;
import com.mmm.clout.memberservice.bookmark.domain.repository.BookmarkRepository;
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
}

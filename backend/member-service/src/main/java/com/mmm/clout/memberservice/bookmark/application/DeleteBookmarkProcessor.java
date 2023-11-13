package com.mmm.clout.memberservice.bookmark.application;

import com.mmm.clout.memberservice.bookmark.application.command.BookmarkDeleteCommand;
import com.mmm.clout.memberservice.bookmark.domain.Bookmark;
import com.mmm.clout.memberservice.bookmark.domain.exception.NotFoundBookmark;
import com.mmm.clout.memberservice.bookmark.domain.repository.BookmarkRepository;
import com.mmm.clout.memberservice.bookmark.presentation.request.BookmarkDeleteRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
public class DeleteBookmarkProcessor {

    private final BookmarkRepository bookmarkRepository;

    @Transactional
    public Long execute(BookmarkDeleteCommand command) {
        Bookmark findBookmark = bookmarkRepository.findByMemberAndTargetId(command.getMemberId(), command.getTargetId()).orElseThrow(() -> new NotFoundBookmark());
        Long bookmarkId = findBookmark.getId();
        bookmarkRepository.delete(findBookmark);
        return bookmarkId;
    }
}

package com.mmm.clout.memberservice.bookmark.application;

import com.mmm.clout.memberservice.bookmark.domain.Bookmark;
import com.mmm.clout.memberservice.bookmark.domain.exception.NotFoundBookmark;
import com.mmm.clout.memberservice.bookmark.domain.repository.BookmarkRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
public class DeleteBookmarkProcessor {

    private final BookmarkRepository bookmarkRepository;

    @Transactional
    public Long execute(Long bookmarkId) {
        Bookmark findBookmark = bookmarkRepository.findById(bookmarkId).orElseThrow(() -> new NotFoundBookmark());
        bookmarkRepository.delete(findBookmark);
        return bookmarkId;
    }
}

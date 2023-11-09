package com.mmm.clout.memberservice.bookmark.domain.repository;

import com.mmm.clout.memberservice.bookmark.domain.Bookmark;

import java.util.Optional;

public interface BookmarkRepository {

    Bookmark save(Bookmark bookmark);

    Optional<Bookmark> findById(Long bookmarkId);

    void delete(Bookmark findBookmark);
}

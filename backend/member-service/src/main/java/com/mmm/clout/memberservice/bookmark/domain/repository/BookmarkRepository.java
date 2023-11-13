package com.mmm.clout.memberservice.bookmark.domain.repository;

import com.mmm.clout.memberservice.bookmark.domain.Bookmark;

import java.util.List;
import java.util.Optional;

public interface BookmarkRepository {

    Bookmark save(Bookmark bookmark);

    Optional<Bookmark> findById(Long bookmarkId);

    Optional<Bookmark> findByMemberAndTargetId(Long memberId, Long targetId);

    void delete(Bookmark findBookmark);

    List<Bookmark> findByMemberId(Long memberId);
}

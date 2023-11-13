package com.mmm.clout.memberservice.bookmark.infrastructure.persistence;

import com.mmm.clout.memberservice.bookmark.domain.Bookmark;
import com.mmm.clout.memberservice.bookmark.domain.repository.BookmarkRepository;
import com.mmm.clout.memberservice.bookmark.infrastructure.persistence.jpa.JpaBookmarkRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
@RequiredArgsConstructor
public class BookmarkAdaptor implements BookmarkRepository {

    private final JpaBookmarkRepository jpaBookmarkRepository;

    @Override
    public Bookmark save(Bookmark bookmark) {
        return jpaBookmarkRepository.save(bookmark);
    }

    @Override
    public Optional<Bookmark> findById(Long bookmarkId) {
        return jpaBookmarkRepository.findById(bookmarkId);
    }

    @Override
    public Optional<Bookmark> findByMemberAndTargetId(Long memberId, Long targetId) {
        return jpaBookmarkRepository.findByMemberAndTargetId(memberId, targetId);
    }

    @Override
    public void delete(Bookmark bookmark) {
        jpaBookmarkRepository.delete(bookmark);
    }

    @Override
    public List<Bookmark> findByMemberId(Long memberId) {
        return jpaBookmarkRepository.findByMemberId(memberId);
    }
}

package com.mmm.clout.memberservice.bookmark.infrastructure.persistence.jpa;

import com.mmm.clout.memberservice.bookmark.domain.Bookmark;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface JpaBookmarkRepository extends JpaRepository<Bookmark, Long> {

    List<Bookmark> findByMemberId(Long memberId);

    Optional<Bookmark> findByMemberAndTargetId(Long memberId, Long targetId);
}

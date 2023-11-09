package com.mmm.clout.memberservice.bookmark.infrastructure.persistence.jpa;

import com.mmm.clout.memberservice.bookmark.domain.Bookmark;
import org.springframework.data.jpa.repository.JpaRepository;

public interface JpaBookmarkRepository extends JpaRepository<Bookmark, Long> {
}

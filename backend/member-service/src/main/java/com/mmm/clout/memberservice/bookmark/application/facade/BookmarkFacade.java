package com.mmm.clout.memberservice.bookmark.application.facade;

import com.mmm.clout.memberservice.bookmark.application.CreateAdBookmarkProcessor;
import com.mmm.clout.memberservice.bookmark.application.command.CreateAdBookmarkCommand;
import com.mmm.clout.memberservice.bookmark.domain.Bookmark;
import lombok.AllArgsConstructor;
import lombok.Getter;
import org.springframework.stereotype.Service;

@Getter
@AllArgsConstructor
@Service
public class BookmarkFacade {

    private final CreateAdBookmarkProcessor createAdBookmarkProcessor;

    public Bookmark createAdBookmark(CreateAdBookmarkCommand command) {
        return createAdBookmarkProcessor.execute(command);
    }
}

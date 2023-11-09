package com.mmm.clout.memberservice.bookmark.application.facade;

import com.mmm.clout.memberservice.bookmark.application.CreateAdBookmarkProcessor;
import com.mmm.clout.memberservice.bookmark.application.CreateClouterBookmarkProcessor;
import com.mmm.clout.memberservice.bookmark.application.command.CreateAdBookmarkCommand;
import com.mmm.clout.memberservice.bookmark.application.command.CreateClouterBookmarkCommand;
import com.mmm.clout.memberservice.bookmark.domain.Bookmark;
import lombok.AllArgsConstructor;
import lombok.Getter;
import org.springframework.stereotype.Service;

@Getter
@AllArgsConstructor
@Service
public class BookmarkFacade {

    private final CreateAdBookmarkProcessor createAdBookmarkProcessor;
    private final CreateClouterBookmarkProcessor createClouterBookmarkProcessor;

    public Bookmark createAdBookmark(CreateAdBookmarkCommand command) {
        return createAdBookmarkProcessor.execute(command);
    }

    public Bookmark createClouterBookmark(CreateClouterBookmarkCommand command) {
        return createClouterBookmarkProcessor.execute(command);
    }
}

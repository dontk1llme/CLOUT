package com.mmm.clout.memberservice.bookmark.application.facade;

import com.mmm.clout.memberservice.bookmark.application.*;
import com.mmm.clout.memberservice.bookmark.application.command.CreateAdBookmarkCommand;
import com.mmm.clout.memberservice.bookmark.application.command.CreateClouterBookmarkCommand;
import com.mmm.clout.memberservice.bookmark.domain.Bookmark;
import com.mmm.clout.memberservice.bookmark.presentation.response.CampaignReader;
import com.mmm.clout.memberservice.clouter.application.reader.ClouterReader;
import lombok.AllArgsConstructor;
import lombok.Getter;
import org.springframework.stereotype.Service;

import java.util.List;

@Getter
@AllArgsConstructor
@Service
public class BookmarkFacade {

    private final CreateAdBookmarkProcessor createAdBookmarkProcessor;
    private final CreateClouterBookmarkProcessor createClouterBookmarkProcessor;
    private final DeleteBookmarkProcessor deleteBookmarkProcessor;
    private final SelectAdByMemberIdProcessor selectAdByMemberIdProcessor;
    private final SelectClouterByMemberIdProcessor selectClouterByMemberIdProcessor;

    public Bookmark createAdBookmark(CreateAdBookmarkCommand command) {
        return createAdBookmarkProcessor.execute(command);
    }

    public Bookmark createClouterBookmark(CreateClouterBookmarkCommand command) {
        return createClouterBookmarkProcessor.execute(command);
    }

    public Long delete(Long bookmarkId) {
        return deleteBookmarkProcessor.execute(bookmarkId);
    }

    public List<CampaignReader> selectAdByMemberId(Long memberId) {
        return selectAdByMemberIdProcessor.execute(memberId);
    }

    public List<ClouterReader> selectClouterByMemberId(Long memberId) {
        return selectClouterByMemberIdProcessor.execute(memberId);
    }
}

package com.mmm.clout.memberservice.bookmark.presentation;

import com.mmm.clout.memberservice.bookmark.application.facade.BookmarkFacade;
import com.mmm.clout.memberservice.bookmark.presentation.docs.BookmarkControllerDocs;
import com.mmm.clout.memberservice.bookmark.presentation.request.CreateAdBookmarkRequest;
import com.mmm.clout.memberservice.bookmark.presentation.response.AdBookmarkResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/bookmarks")
public class BookmarkController implements BookmarkControllerDocs {

    private final BookmarkFacade bookmarkFacade;

    @PostMapping("/v1/bookmarks/ad")
    public ResponseEntity<AdBookmarkResponse> adBookmark(
        @RequestBody CreateAdBookmarkRequest request
    ) {
        AdBookmarkResponse response = AdBookmarkResponse.from(
            bookmarkFacade.createAdBookmark(request.toCommand())
        );
        return new ResponseEntity<>(response, HttpStatus.OK);
    }
}

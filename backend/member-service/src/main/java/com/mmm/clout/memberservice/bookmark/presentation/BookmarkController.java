package com.mmm.clout.memberservice.bookmark.presentation;

import com.mmm.clout.memberservice.bookmark.application.facade.BookmarkFacade;
import com.mmm.clout.memberservice.bookmark.presentation.docs.BookmarkControllerDocs;
import com.mmm.clout.memberservice.bookmark.presentation.request.CreateAdBookmarkRequest;
import com.mmm.clout.memberservice.bookmark.presentation.request.CreateClouterBookmarkRequest;
import com.mmm.clout.memberservice.bookmark.presentation.response.AdBookmarkResponse;
import com.mmm.clout.memberservice.bookmark.presentation.response.BookmarkDeleteResponse;
import com.mmm.clout.memberservice.bookmark.presentation.response.ClouterBookmarkResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

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

    @PostMapping("/v1/bookmarks/clouter")
    public ResponseEntity<ClouterBookmarkResponse> clouterBookmark(
        @RequestBody CreateClouterBookmarkRequest request
    ) {
        ClouterBookmarkResponse response = ClouterBookmarkResponse.from(
            bookmarkFacade.createClouterBookmark(request.toCommand())
        );
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @DeleteMapping("/{bookmarkId}")
    public ResponseEntity<BookmarkDeleteResponse> delete(
        @PathVariable("bookmarkId") Long bookmarkId
    ) {
        BookmarkDeleteResponse response = BookmarkDeleteResponse.from(
            bookmarkFacade.delete(bookmarkId)
        );
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

}

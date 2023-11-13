package com.mmm.clout.memberservice.bookmark.presentation;

import com.mmm.clout.memberservice.bookmark.application.facade.BookmarkFacade;
import com.mmm.clout.memberservice.bookmark.presentation.docs.BookmarkControllerDocs;
import com.mmm.clout.memberservice.bookmark.presentation.request.BookmarkDeleteRequest;
import com.mmm.clout.memberservice.bookmark.presentation.request.CreateAdBookmarkRequest;
import com.mmm.clout.memberservice.bookmark.presentation.request.CreateClouterBookmarkRequest;
import com.mmm.clout.memberservice.bookmark.presentation.response.*;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/v1/bookmarks")
public class BookmarkController implements BookmarkControllerDocs {

    private final BookmarkFacade bookmarkFacade;

    @PostMapping("/ad")
    public ResponseEntity<AdBookmarkResponse> adBookmark(
        @RequestBody CreateAdBookmarkRequest request
    ) {
        AdBookmarkResponse response = AdBookmarkResponse.from(
            bookmarkFacade.createAdBookmark(request.toCommand())
        );
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @PostMapping("/clouter")
    public ResponseEntity<ClouterBookmarkResponse> clouterBookmark(
        @RequestBody CreateClouterBookmarkRequest request
    ) {
        ClouterBookmarkResponse response = ClouterBookmarkResponse.from(
            bookmarkFacade.createClouterBookmark(request.toCommand())
        );
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @DeleteMapping("/delete")
    public ResponseEntity<BookmarkDeleteResponse> delete(
        @RequestBody BookmarkDeleteRequest request
    ) {
        BookmarkDeleteResponse response = BookmarkDeleteResponse.from(
            bookmarkFacade.delete(request.toCommand())
        );
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @GetMapping("/ad")
    public ResponseEntity<AdBookmarkListResponse> selectAdBookmarkByMemberId(
        @RequestParam("memberId") Long memberId
    ) {
        AdBookmarkListResponse response = AdBookmarkListResponse.from(
            bookmarkFacade.selectAdByMemberId(memberId)
        );
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @GetMapping("/clouter")
    public ResponseEntity<ClouterBookmarkListResponse> selectClouterBookmarkByMemberId(
        @RequestParam("memberId") Long memberId
    ) {
        ClouterBookmarkListResponse response = ClouterBookmarkListResponse.from(
            bookmarkFacade.selectClouterByMemberId(memberId)
        );
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

}

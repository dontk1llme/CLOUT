package com.mmm.clout.memberservice.bookmark.presentation.docs;

import com.mmm.clout.memberservice.bookmark.presentation.request.CreateAdBookmarkRequest;
import com.mmm.clout.memberservice.bookmark.presentation.request.CreateClouterBookmarkRequest;
import com.mmm.clout.memberservice.bookmark.presentation.response.AdBookmarkResponse;
import com.mmm.clout.memberservice.bookmark.presentation.response.BookmarkDeleteResponse;
import com.mmm.clout.memberservice.bookmark.presentation.response.ClouterBookmarkListResponse;
import com.mmm.clout.memberservice.bookmark.presentation.response.ClouterBookmarkResponse;
import com.mmm.clout.memberservice.star.presentation.request.createStarDetailRequest;
import com.mmm.clout.memberservice.star.presentation.response.CreateStarResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

@Tag(name = "북마크 CRUD", description = "북마크를 관리하는 api")
public interface BookmarkControllerDocs {


    @Operation(summary = "광고 북마크 생성 api",
        responses =
        @ApiResponse(responseCode = "200", description = "생성된 북마크 id 리턴",
            content =
            @Content(mediaType="application/json",
                schema=@Schema(implementation=AdBookmarkResponse.class))
        )
    )
    public ResponseEntity<AdBookmarkResponse> adBookmark(
        @RequestBody CreateAdBookmarkRequest request
    );

    @Operation(summary = "클라우터 북마크 생성 api",
        responses =
        @ApiResponse(responseCode = "200", description = "생성된 북마크 id 리턴",
            content =
            @Content(mediaType="application/json",
                schema=@Schema(implementation=ClouterBookmarkResponse.class))
        )
    )
    public ResponseEntity<ClouterBookmarkResponse> clouterBookmark(
        @RequestBody CreateClouterBookmarkRequest request
    );

    @Operation(summary = "북마크 삭제 api",
        responses =
        @ApiResponse(responseCode = "200", description = "삭제된 북마크 id 리턴",
            content =
            @Content(mediaType="application/json",
                schema=@Schema(implementation=BookmarkDeleteResponse.class))
        )
    )
    public ResponseEntity<BookmarkDeleteResponse> delete(
        @PathVariable("bookmarkId") Long bookmarkId
    );

    @Operation(summary = "광고주가 북마크한 클라우터들 조회 api",
        responses =
        @ApiResponse(responseCode = "200", description = "클라우터 상세 데이터 리턴",
            content =
            @Content(mediaType="application/json",
                schema=@Schema(implementation=ClouterBookmarkListResponse.class))
        )
    )
    public ResponseEntity<ClouterBookmarkListResponse> selectClouterBookmarkByMemberId(
        @RequestParam("memberId") Long memberId
    );
}

package com.mmm.clout.imageservice.image.presentation;

import com.mmm.clout.imageservice.common.docs.ImageControllerDocs;
import com.mmm.clout.imageservice.image.application.facade.ImageFacade;
import com.mmm.clout.imageservice.image.presentation.request.UploadImageRequest;
import com.mmm.clout.imageservice.image.presentation.response.UploadImageResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("/api/v1/image")
@RequiredArgsConstructor
public class ImageController implements ImageControllerDocs {

    private final ImageFacade imageFacade;

    /**
     * 사진 등록하기 위한 API
     *
     * @param uploadImageRequest : 사진 등록할 때 입력한 정보
     * @param fileList           : 사진 리스트
     */
    @Override
    @PostMapping(consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.MULTIPART_FORM_DATA_VALUE})
    public ResponseEntity<List<UploadImageResponse>> UploadImage(@RequestPart UploadImageRequest uploadImageRequest,
                                                           @RequestPart(value = "files") List<MultipartFile> fileList) throws Exception {

        log.info("ImageController_regist_start: " + uploadImageRequest.toString() + ", "
                    + fileList);
        List<UploadImageResponse> uploadImageResponseList = new ArrayList<>();
        for(MultipartFile multipartFile : fileList) {
            UploadImageResponse uploadImageResponse = UploadImageResponse.from(
                    imageFacade.create(uploadImageRequest.toCommand(), multipartFile)
            );
            uploadImageResponseList.add(uploadImageResponse);
        }

        log.info("ImageController_regist_start_end: " + uploadImageRequest.toString() + ", "
                + fileList);
        return new ResponseEntity<>(uploadImageResponseList, HttpStatus.CREATED);
    }
}

package com.mmm.clout.imageservice.image.presentation;

import com.mmm.clout.imageservice.common.docs.ImageControllerDocs;
import com.mmm.clout.imageservice.image.application.facade.ImageFacade;
import com.mmm.clout.imageservice.image.domain.Image;
import com.mmm.clout.imageservice.image.presentation.request.UploadImageRequest;
import com.mmm.clout.imageservice.image.presentation.response.FindImageResponse;
import com.mmm.clout.imageservice.image.presentation.response.UploadImageResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@RestController
@RequestMapping("/v1/images")
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
        for (MultipartFile multipartFile : fileList) {
            UploadImageResponse uploadImageResponse = UploadImageResponse.from(
                    imageFacade.create(uploadImageRequest.toCommand(), multipartFile)
            );
            uploadImageResponseList.add(uploadImageResponse);
        }

        log.info("ImageController_regist_start_end: " + uploadImageRequest.toString() + ", "
                + fileList);
        return new ResponseEntity<>(uploadImageResponseList, HttpStatus.CREATED);
    }

    /**
     * 이미지 url을 받기 위한 API
     *
     * @param targetId : 타겟 Id
     * @param type     : 타입
     */
    @GetMapping("/find")
    public ResponseEntity<List<FindImageResponse>> findImage(@RequestParam Long targetId, String type) {

        log.info("ImageController_findImage_start: " + targetId + ", " + type);

        List<FindImageResponse> findImageResponses =
                imageFacade.find(targetId, type).stream().map(m -> FindImageResponse.from(m))
                        .collect(Collectors.toList());

        if (findImageResponses != null) { // 조회 성공하면 조회 결과 return
            log.info("ImageController_findImage_end: " + findImageResponses.toString());
            return new ResponseEntity<>(findImageResponses, HttpStatus.ACCEPTED);
        } else {    // 조회 실패하면 Exception
            throw new NullPointerException();
        }
    }
    /**
     * 이미지 삭제를 위한 API
     *
     * @param id : img Id
     */
    @DeleteMapping("/delete")
    public ResponseEntity<?> deleteImage(@RequestParam Long id) {

        log.info("ImageController_deleteImage_start: " + id);

        boolean isDeleted = imageFacade.delete(id);

        if (isDeleted) { // 삭제 성공하면 조회 결과 return
            log.info("ImageController_deleteImage_end: ");
            return new ResponseEntity<>(isDeleted, HttpStatus.ACCEPTED);
        } else {    // 조회 실패하면 Exception
            throw new NullPointerException();
        }
    }

    /**
     * 이미지 삭제를 위한 API
     *
     * @param id : img Id
     */
    @GetMapping("/downlaod")
    public ResponseEntity<?> downloadImage(@RequestParam Long id) {

        log.info("ImageController_downlaodImage_start: " + id);

        ResponseEntity<UrlResource> downlaodedImage = imageFacade.download(id);

        return downlaodedImage;
    }

    /**
     * 사진 수정 위한 API
     *
     * @param uploadImageRequest : 사진 등록할 때 입력한 정보
     * @param fileList           : 사진 리스트
     */
    @PostMapping(value = "/update",consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.MULTIPART_FORM_DATA_VALUE})
    public ResponseEntity<List<UploadImageResponse>> modifyImage(@RequestPart UploadImageRequest uploadImageRequest,
                                                                 @RequestPart(value = "files") List<MultipartFile> fileList) throws Exception {

        log.info("ImageController_modify_start: " + uploadImageRequest.toString() + ", "
                + fileList);

        log.info("ImageController_find_start: ");
        List<Image> findedImage = imageFacade.find(uploadImageRequest.getTargetId(), uploadImageRequest.getType());
        for(Image image : findedImage){
            log.info("ImageController_delete_start: "+image.getId());
            boolean isDeleted = imageFacade.delete(image.getId());
        }
        log.info("ImageController_find_end: ");
        List<UploadImageResponse> uploadImageResponseList = new ArrayList<>();
        for (MultipartFile multipartFile : fileList) {
            UploadImageResponse uploadImageResponse = UploadImageResponse.from(
                    imageFacade.create(uploadImageRequest.toCommand(), multipartFile)
            );
            uploadImageResponseList.add(uploadImageResponse);
        }

        log.info("ImageController_modify_start_end: " + uploadImageRequest.toString() + ", "
                + fileList);
        return new ResponseEntity<>(uploadImageResponseList, HttpStatus.CREATED);
    }

}
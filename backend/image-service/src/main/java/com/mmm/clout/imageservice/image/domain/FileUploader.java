package com.mmm.clout.imageservice.image.domain;

import org.springframework.core.io.UrlResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

public interface FileUploader {
    public String upload(MultipartFile multipartFile, String type, Long targetId) throws Exception;

    public void delete(String imagePath);

    public ResponseEntity<UrlResource> downloadImage(String originalFilename);
}

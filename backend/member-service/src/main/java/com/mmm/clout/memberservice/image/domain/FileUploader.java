package com.mmm.clout.memberservice.image.domain;

import org.springframework.core.io.UrlResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface FileUploader {
    public String upload(MultipartFile multipartFile,Long targetId) throws Exception;

    public boolean delete(String imagePath);

    public ResponseEntity<UrlResource> downloadImage(String originalFilename);
}

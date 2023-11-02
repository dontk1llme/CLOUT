package com.mmm.clout.imageservice.image.application;

import com.mmm.clout.imageservice.image.domain.FileUploader;
import com.mmm.clout.imageservice.image.domain.Image;
import com.mmm.clout.imageservice.image.domain.repository.ImageRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.core.io.UrlResource;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
public class DownloadImageProcessor {

    private final ImageRepository imageRepository;

    private final FileUploader fileUploader;
    @Transactional
    public ResponseEntity<UrlResource> execute(Long id) {
        Image image = imageRepository.find(id);
        ResponseEntity<UrlResource> res =  fileUploader.downloadImage(image.getImageName());
        return res;
    }
}

package com.mmm.clout.imageservice.image.application;

import com.mmm.clout.imageservice.image.domain.FileUploader;
import com.mmm.clout.imageservice.image.domain.Image;
import com.mmm.clout.imageservice.image.domain.repository.ImageRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@RequiredArgsConstructor
public class DeleteImageProcessor {

    private final ImageRepository imageRepository;

    private final FileUploader fileUploader;
    @Transactional
    public boolean execute(Long id) {
        Image image = imageRepository.delete(id);
        boolean res =  fileUploader.delete(image.getImageName());
        return res;
    }
}

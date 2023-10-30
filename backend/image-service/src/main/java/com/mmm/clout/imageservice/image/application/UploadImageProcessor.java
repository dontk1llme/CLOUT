package com.mmm.clout.imageservice.image.application;

import com.mmm.clout.imageservice.image.domain.Image;
import com.mmm.clout.imageservice.image.domain.repository.ImageRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
public class UploadImageProcessor {

    private final ImageRepository imageRepository;

    @Transactional
    public Image execute()
}

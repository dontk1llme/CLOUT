package com.mmm.clout.imageservice.image.application;

import com.mmm.clout.imageservice.image.domain.Image;
import com.mmm.clout.imageservice.image.domain.repository.ImageRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@RequiredArgsConstructor
public class FindImageProcessor {

    private final ImageRepository imageRepository;

    @Transactional
    public List<Image> execute(Long targetId, String type) {
        List<Image> images = imageRepository.findByTargetIdAndType(targetId, type);
        return images;
    }
}

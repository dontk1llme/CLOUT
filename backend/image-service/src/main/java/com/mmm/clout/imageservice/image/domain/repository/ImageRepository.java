package com.mmm.clout.imageservice.image.domain.repository;

import com.mmm.clout.imageservice.image.domain.Image;

import java.util.List;

public interface ImageRepository {

    Image save(Image image);

    List<Image> findByTargetIdAndType(Long targetId, String type);
}

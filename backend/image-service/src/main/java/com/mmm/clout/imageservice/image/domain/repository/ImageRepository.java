package com.mmm.clout.imageservice.image.domain.repository;

import com.mmm.clout.imageservice.image.domain.Image;

public interface ImageRepository {

    Image save(Image image);
}

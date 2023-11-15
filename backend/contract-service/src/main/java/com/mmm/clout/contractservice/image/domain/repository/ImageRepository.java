package com.mmm.clout.contractservice.image.domain.repository;

import com.mmm.clout.contractservice.image.domain.Image;

import java.util.List;

public interface ImageRepository {

    Image save(Image image);

    List<Image> findByMemberId(Long memberId);

    Image delete(Long id);

    Image find(Long id);
}

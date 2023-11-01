package com.mmm.clout.imageservice.image.infrastructure.persistance.jpa;

import com.mmm.clout.imageservice.image.domain.Image;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface JpaImageRepository extends JpaRepository<Image, Long> {

    List<Image> findByTargetIdAndType(Long targetId, String type);
}

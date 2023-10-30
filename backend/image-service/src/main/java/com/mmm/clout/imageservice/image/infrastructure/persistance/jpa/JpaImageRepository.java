package com.mmm.clout.imageservice.image.infrastructure.persistance.jpa;

import com.mmm.clout.imageservice.image.domain.Image;
import org.springframework.data.jpa.repository.JpaRepository;

public interface JpaImageRepository extends JpaRepository<Image, Long> {
}

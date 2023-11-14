package com.mmm.clout.advertisementservice.image.infrastructure.persistance.jpa;

import com.mmm.clout.advertisementservice.image.domain.Image;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface JpaImageRepository extends JpaRepository<Image, Long> {

        List<Image> findByAdvertisement_Id(Long Id);

}

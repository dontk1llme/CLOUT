package com.mmm.clout.imageservice.image.infrastructure.persistance;

import com.mmm.clout.imageservice.image.domain.Image;
import com.mmm.clout.imageservice.image.domain.repository.ImageRepository;
import com.mmm.clout.imageservice.image.infrastructure.persistance.jpa.JpaImageRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
@RequiredArgsConstructor
public class ImageRepositoryAdapter implements ImageRepository {
    private final JpaImageRepository jpaImageRepository;

    @Override
    public Image save(Image image) {return jpaImageRepository.save(image);}

    @Override
    public List<Image> findByTargetIdAndType(Long targetId, String type) {
        return jpaImageRepository.findByTargetIdAndType(targetId, type);
    }

    @Override
    public Image delete(Long id){
        Image image = jpaImageRepository.findById(id)
                .orElseThrow(IllegalAccessError::new);

        jpaImageRepository.deleteById(id);
        return image;
    }

    @Override
    public Image find(Long id){
        Image image = jpaImageRepository.findById(id)
                .orElseThrow(IllegalAccessError::new);

        return image;
    }
}

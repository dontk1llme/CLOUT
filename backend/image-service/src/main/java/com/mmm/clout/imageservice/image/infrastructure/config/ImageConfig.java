package com.mmm.clout.imageservice.image.infrastructure.config;

import com.mmm.clout.imageservice.image.application.UploadImageProcessor;
import com.mmm.clout.imageservice.image.domain.S3Uploader;
import com.mmm.clout.imageservice.image.domain.repository.ImageRepository;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ImageConfig {
    @Bean
    public UploadImageProcessor uploadImageProcessor(ImageRepository imageRepository, S3Uploader s3Uploader) {
        return new UploadImageProcessor(imageRepository, s3Uploader);
    }
}

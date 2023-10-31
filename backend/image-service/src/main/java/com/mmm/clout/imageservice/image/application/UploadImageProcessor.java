package com.mmm.clout.imageservice.image.application;

import com.mmm.clout.imageservice.image.application.command.CreateImageCommand;
import com.mmm.clout.imageservice.image.domain.Image;
import com.mmm.clout.imageservice.image.domain.S3Uploader;
import com.mmm.clout.imageservice.image.domain.repository.ImageRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@RequiredArgsConstructor
public class UploadImageProcessor {

    private final ImageRepository imageRepository;
    private final S3Uploader fileUploader;

    @Transactional
    public Image execute(CreateImageCommand createImageCommand, MultipartFile multipartFile) throws Exception {
        String originalName = multipartFile.getOriginalFilename();
        String uploadedPath = fileUploader.upload(multipartFile);
        Image image = Image.create(
                createImageCommand.getTargetId(),
                createImageCommand.getType(),
                uploadedPath,
                originalName,
                uploadedPath
        );
        return imageRepository.save(image);
    }
}

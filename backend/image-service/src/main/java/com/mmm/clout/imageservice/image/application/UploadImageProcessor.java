package com.mmm.clout.imageservice.image.application;

import com.mmm.clout.imageservice.image.application.command.CreateImageCommand;
import com.mmm.clout.imageservice.image.domain.Image;
import com.mmm.clout.imageservice.image.domain.FileUploader;
import com.mmm.clout.imageservice.image.domain.repository.ImageRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@RequiredArgsConstructor
public class UploadImageProcessor {

    private final ImageRepository imageRepository;
    private final FileUploader fileUploader;

    @Transactional
    public Image execute(CreateImageCommand createImageCommand, MultipartFile multipartFile) throws Exception {
        String originalName = multipartFile.getOriginalFilename();
        String uploadedPath = fileUploader.upload(multipartFile, createImageCommand.getType(), createImageCommand.getTargetId());
        Image image = Image.create(
                createImageCommand.getTargetId(),
                originalName,
                "https://yangkidsbucket.s3.ap-northeast-2.amazonaws.com/"+uploadedPath,
                uploadedPath,
                createImageCommand.getType()
        );
        return imageRepository.save(image);
    }
}

package com.mmm.clout.imageservice.image.application.facade;

import com.mmm.clout.imageservice.image.application.UploadImageProcessor;
import com.mmm.clout.imageservice.image.application.command.CreateImageCommand;
import com.mmm.clout.imageservice.image.domain.Image;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
@RequiredArgsConstructor
public class ImageFacade {

    private final UploadImageProcessor uploadImageProcessor;

    public Image create(CreateImageCommand createImageCommand, MultipartFile multipartFile) throws Exception {
        return uploadImageProcessor.execute(createImageCommand, multipartFile);
    }
}

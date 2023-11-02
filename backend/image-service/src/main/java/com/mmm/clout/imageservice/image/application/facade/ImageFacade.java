package com.mmm.clout.imageservice.image.application.facade;

import com.mmm.clout.imageservice.image.application.DeleteImageProcessor;
import com.mmm.clout.imageservice.image.application.FindImageProcessor;
import com.mmm.clout.imageservice.image.application.UploadImageProcessor;
import com.mmm.clout.imageservice.image.application.command.CreateImageCommand;
import com.mmm.clout.imageservice.image.domain.Image;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ImageFacade {

    private final UploadImageProcessor uploadImageProcessor;

    private final FindImageProcessor findImageProcessor;

    private final DeleteImageProcessor deleteImageProcessor;

    public Image create(CreateImageCommand createImageCommand, MultipartFile multipartFile) throws Exception {
        return uploadImageProcessor.execute(createImageCommand, multipartFile);
    }

    public List<Image> find(Long targetId, String type){
        return findImageProcessor.execute(targetId, type);
    }

    public Boolean delete(Long id){
        return deleteImageProcessor.execute(id);
    }
}

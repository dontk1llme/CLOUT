package com.mmm.clout.advertisementservice.image.domain;

import com.mmm.clout.advertisementservice.advertisements.domain.Campaign;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

public interface FileUploader {
    String upload(MultipartFile multipartFile,Long targetId) throws Exception;

    String uploadSign(MultipartFile multipartFile,Campaign campaign) throws Exception;

    void uploadList(List<MultipartFile> files, Campaign campaign) throws IOException;


    void updateCampaignImages(List<Image> images, List<MultipartFile> fileList, Campaign campaign)
        throws IOException;

    void delete(List<Image> images);
}

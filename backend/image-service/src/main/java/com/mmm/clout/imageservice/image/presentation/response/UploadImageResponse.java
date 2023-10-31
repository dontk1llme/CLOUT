package com.mmm.clout.imageservice.image.presentation.response;

import com.mmm.clout.imageservice.image.domain.Image;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class UploadImageResponse {
    private Long Id;

    private String poath;

    public static UploadImageResponse from(Image image) {
        return new UploadImageResponse(image.getId(), image.getPath());
    }
}

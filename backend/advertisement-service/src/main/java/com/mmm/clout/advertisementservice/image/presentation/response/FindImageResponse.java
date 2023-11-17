package com.mmm.clout.imageservice.image.presentation.response;

import com.mmm.clout.imageservice.image.domain.Image;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class FindImageResponse {

    private String path;

    public static FindImageResponse from(Image image) {
        return new FindImageResponse(image.getPath());
    }
}

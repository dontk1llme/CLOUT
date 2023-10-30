package com.mmm.clout.imageservice.image.presentation.request;

import lombok.AllArgsConstructor;
import lombok.Getter;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Getter
@AllArgsConstructor
public class UploadImageRequest {

    @NotNull
    private Long targertId;

    @NotBlank
    private String type;
}

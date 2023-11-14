package com.mmm.clout.imageservice.image.presentation.request;

import com.mmm.clout.imageservice.image.application.command.CreateImageCommand;
import lombok.AllArgsConstructor;
import lombok.Getter;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Getter
@AllArgsConstructor
public class UploadImageRequest {

    @NotNull
    private Long targetId;

    @NotBlank
    private String type;

    public CreateImageCommand toCommand(){
        return new CreateImageCommand(
                this.targetId,
                this.type
        );
    }
}

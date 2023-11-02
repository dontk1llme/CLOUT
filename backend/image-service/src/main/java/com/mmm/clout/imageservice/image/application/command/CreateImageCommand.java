package com.mmm.clout.imageservice.image.application.command;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class CreateImageCommand {
    private Long targetId;

    private String type;

}

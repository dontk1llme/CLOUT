package com.mmm.clout.advertisementservice.apply.application.command;

import io.swagger.v3.oas.annotations.media.Schema;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class CreateApplyCommand {

    private Long advertisementId;

    private Long clouterId;

    private String applyMessage;

    private Long hodeAdFee;

}

package com.mmm.clout.advertisementservice.advertisements.application.command;

import java.time.LocalDate;
import javax.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class CreateAdCommand {

    private String title;
    private LocalDate adStartDate;
    private LocalDate adEndDate;

}

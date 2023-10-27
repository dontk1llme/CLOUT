package com.mmm.clout.advertisementservice.advertisements.persentation.request;

import com.mmm.clout.advertisementservice.advertisements.application.command.CreateAdCommand;
import com.mmm.clout.advertisementservice.advertisements.domain.AdCategory;
import java.time.LocalDate;
import java.util.List;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Getter;
import org.hibernate.validator.constraints.Length;

@Getter
@AllArgsConstructor
public class CreateAdRequest {

    @NotNull
    private AdCategory adCategory;
    @NotBlank
    @Size(min = 1, max = 20)
    private String title;
    @NotBlank
    private LocalDate adStartDate;
    @NotBlank
    private LocalDate adEndDate;
    @NotNull
    private Integer numberOfRecruiter;


    public CreateAdCommand toCommand() {
        return new CreateAdCommand(
            this.title,
            this.adStartDate,
            this.adEndDate
        );
    }
}

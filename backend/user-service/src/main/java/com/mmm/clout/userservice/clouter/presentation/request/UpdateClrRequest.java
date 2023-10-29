package com.mmm.clout.userservice.clouter.presentation.request;

import com.mmm.clout.userservice.clouter.application.command.CreateClrCommand;
import com.mmm.clout.userservice.clouter.application.command.UpdateClrCommand;
import com.mmm.clout.userservice.common.entity.Category;
import com.mmm.clout.userservice.common.entity.FollowerScale;
import com.mmm.clout.userservice.common.entity.Platform;
import com.mmm.clout.userservice.common.entity.address.request.AddressRequest;
import lombok.AllArgsConstructor;
import lombok.Getter;

import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.validation.constraints.NotBlank;
import java.time.LocalDate;

@Getter
@AllArgsConstructor
public class UpdateClrRequest {

    @NotBlank
    private String userId;

    @NotBlank
    private String pwd;

    @NotBlank
    private String name;

    private AddressRequest address;

    @Enumerated(EnumType.STRING)
    private Category selectedCategory;

    @NotBlank
    private FollowerScale followerScale;

    @NotBlank
    private Platform platForm;

    @NotBlank
    private LocalDate birthday;

    @NotBlank
    private Integer age;

    public UpdateClrCommand toCommand(Long clouterId) {
        return new UpdateClrCommand(
                clouterId,
                this.userId,
                this.pwd,
                this.name,
                this.address.toCommand(),
                this.selectedCategory,
                this.followerScale,
                this.platForm,
                this.birthday,
                this.age
        );
    }
}

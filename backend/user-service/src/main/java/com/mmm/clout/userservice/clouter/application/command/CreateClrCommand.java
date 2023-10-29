package com.mmm.clout.userservice.clouter.application.command;

import com.mmm.clout.userservice.clouter.domain.Clouter;
import com.mmm.clout.userservice.common.entity.address.command.AddressCommand;
import com.mmm.clout.userservice.common.entity.Category;
import com.mmm.clout.userservice.common.entity.FollowerScale;
import com.mmm.clout.userservice.common.entity.Platform;
import lombok.AllArgsConstructor;
import lombok.Getter;

import java.time.LocalDate;

@Getter
@AllArgsConstructor
public class CreateClrCommand {

    private String userId;

    private String pwd;

    private String name;

    private AddressCommand addressCommand;

    private Category selectedCategory;

    private FollowerScale followerScale;

    private Platform platForm;

    private LocalDate birthday;

    private Integer age;

    public Clouter toEntity() {
        return Clouter.create(
                this.userId,
                this.pwd,
                this.name,
                this.addressCommand.toValueType(),
                this.selectedCategory,
                this.followerScale,
                this.platForm,
                this.birthday,
                this.age
        );
    }
}

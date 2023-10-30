package com.mmm.clout.userservice.clouter.application.command;

import com.mmm.clout.userservice.clouter.domain.Clouter;
import com.mmm.clout.userservice.clouter.presentation.request.ChannelRequest;
import com.mmm.clout.userservice.clouter.presentation.request.HopeCostRequest;
import com.mmm.clout.userservice.common.entity.Region;
import com.mmm.clout.userservice.common.entity.address.command.AddressCommand;
import com.mmm.clout.userservice.common.entity.Category;
import com.mmm.clout.userservice.common.entity.FollowerScale;
import com.mmm.clout.userservice.common.entity.Platform;
import com.mmm.clout.userservice.common.entity.address.request.AddressRequest;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Getter;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

@Getter
@AllArgsConstructor
public class CreateClrCommand {

    private String userId;

    private String pwd;

    private String nickName;

    private String name;

    private LocalDate birthday;

    private Integer age;

    private String phoneNumber;

    private List<ChannelCommand> channelList;

    private HopeCostCommand hopeCost;

    private boolean negoable;

    private List<Category> categoryList;

    private List<Region> regionList;

    private AddressCommand address;

    public Clouter toEntity() {
        return Clouter.create(
            this.userId,
            this.pwd,
            this.nickName,
            this.name,
            this.birthday,
            this.age,
            this.phoneNumber,
            this.channelList.stream().map(ChannelCommand::toValueType).collect(Collectors.toList()),
            this.hopeCost.toValueType(),
            this.negoable,
            this.categoryList,
            this.regionList,
            this.address.toValueType()
        );
    }
}

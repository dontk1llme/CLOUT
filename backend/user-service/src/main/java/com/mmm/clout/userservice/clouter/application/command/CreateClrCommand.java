package com.mmm.clout.userservice.clouter.application.command;

import com.mmm.clout.userservice.clouter.domain.Clouter;
import com.mmm.clout.userservice.common.Region;
import com.mmm.clout.userservice.common.entity.address.command.AddressCommand;
import com.mmm.clout.userservice.common.Category;
import lombok.AllArgsConstructor;
import lombok.Getter;

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

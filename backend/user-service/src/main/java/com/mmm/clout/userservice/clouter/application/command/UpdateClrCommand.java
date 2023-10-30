package com.mmm.clout.userservice.clouter.application.command;

import com.mmm.clout.userservice.clouter.domain.Clouter;
import com.mmm.clout.userservice.common.entity.Category;
import com.mmm.clout.userservice.common.entity.FollowerScale;
import com.mmm.clout.userservice.common.entity.Platform;
import com.mmm.clout.userservice.common.entity.Region;
import com.mmm.clout.userservice.common.entity.address.command.AddressCommand;
import lombok.AllArgsConstructor;
import lombok.Getter;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

@Getter
@AllArgsConstructor
public class UpdateClrCommand {
    private Long ClouterId;

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
}

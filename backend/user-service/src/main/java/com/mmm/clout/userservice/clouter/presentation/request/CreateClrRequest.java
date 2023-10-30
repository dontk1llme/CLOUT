package com.mmm.clout.userservice.clouter.presentation.request;

import com.mmm.clout.userservice.clouter.domain.Channel;
import com.mmm.clout.userservice.clouter.domain.HopeCost;
import com.mmm.clout.userservice.common.entity.Region;
import com.mmm.clout.userservice.common.entity.address.Address;
import com.mmm.clout.userservice.common.entity.address.request.AddressRequest;
import com.mmm.clout.userservice.clouter.application.command.CreateClrCommand;
import com.mmm.clout.userservice.common.entity.Category;
import com.mmm.clout.userservice.common.entity.FollowerScale;
import com.mmm.clout.userservice.common.entity.Platform;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Getter;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

@Getter
@AllArgsConstructor
public class CreateClrRequest {

    @NotBlank
    @Schema(description = "클라우터 아이디")
    private String userId;

    @NotBlank
    @Schema(description = "클라우터 비밀번호")
    private String pwd;

    @NotBlank
    @Schema(description = "클라우터 닉네임임")
    private String nickName;

    @NotBlank
    @Schema(description = "이름")
    private String name;

    @NotBlank
    @Schema(description = "생일")
    private LocalDate birthday;

    @NotBlank
    @Schema(description = "나이")
    private Integer age;

    @NotBlank
    @Schema(description = "전화번호")
    private String phoneNumber;

    @NotNull
    @Schema(description = "개인 채널 리스트")
    private List<ChannelRequest> channelList;

    private HopeCostRequest hopeCost;

    @Schema(description = "네고 가능 여부")
    private boolean negoable;

    @NotNull
    @Size(min = 1, message = "최소 1개의 카테고리는 선택 해야 합니다.")
    @Schema(description = "광고를 원하는 카테고리 목록")
    private List<Category> categoryList;

    @NotNull
    @Size(min = 1, message = "최소 1개의 지역은 선택 해야 합니다.")
    @Schema(description = "광고를 희망하는 지역 목록")
    private List<Region> regionList;

    private AddressRequest address;

    public CreateClrCommand toCommand() {
        return new CreateClrCommand(
                this.userId,
                this.pwd,
                this.nickName,
                this.name,
                this.birthday,
                this.age,
                this.phoneNumber,
                this.channelList.stream().map(ChannelRequest::toCommand).collect(Collectors.toList()),
                this.hopeCost.toCommand(),
                this.negoable,
                this.categoryList,
                this.regionList,
                this.address.toCommand()
        );
    }
}

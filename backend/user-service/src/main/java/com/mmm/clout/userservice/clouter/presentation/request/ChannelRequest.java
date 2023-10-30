package com.mmm.clout.userservice.clouter.presentation.request;

import com.mmm.clout.userservice.clouter.application.command.ChannelCommand;
import com.mmm.clout.userservice.clouter.application.command.HopeCostCommand;
import com.mmm.clout.userservice.common.entity.FollowerScale;
import com.mmm.clout.userservice.common.entity.Platform;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Getter;

import javax.validation.constraints.NotBlank;

@Getter
@AllArgsConstructor
public class ChannelRequest {

    @NotBlank
    @Schema(description = "원하는 최대 금액")
    private String name;

    @NotBlank
    @Schema(description = "원하는 최대 금액")
    private Platform platform;

    @NotBlank
    @Schema(description = "원하는 최대 금액")
    private String link;

    @NotBlank
    @Schema(description = "원하는 최대 금액")
    private FollowerScale followerScale;

    public ChannelCommand toCommand() {
        return new ChannelCommand(
            this.name,
            this.platform,
            this.link,
            this.followerScale
        );
    }

}

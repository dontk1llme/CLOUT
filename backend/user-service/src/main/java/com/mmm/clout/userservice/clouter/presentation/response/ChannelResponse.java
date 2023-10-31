package com.mmm.clout.userservice.clouter.presentation.response;

import com.mmm.clout.userservice.clouter.domain.Channel;
import com.mmm.clout.userservice.common.FollowerScale;
import com.mmm.clout.userservice.common.Platform;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class ChannelResponse {

    @Schema(description = "원하는 최대 금액")
    private String name;

    @Schema(description = "원하는 최대 금액")
    private Platform platform;

    @Schema(description = "원하는 최대 금액")
    private String link;

    @Schema(description = "원하는 최대 금액")
    private FollowerScale followerScale;

    public ChannelResponse(Channel channel) {
        this.name = channel.getName();
        this.platform = channel.getPlatform();
        this.link = channel.getLink();
        this.followerScale = channel.getFollowerScale();
    }
}

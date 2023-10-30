package com.mmm.clout.userservice.clouter.application.command;

import com.mmm.clout.userservice.clouter.domain.Channel;
import com.mmm.clout.userservice.common.entity.FollowerScale;
import com.mmm.clout.userservice.common.entity.Platform;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class ChannelCommand {

    private String name;

    private Platform platform;

    private String link;

    private FollowerScale followerScale;

    public Channel toValueType() {
        return new Channel(
            this.name,
            this.platform,
            this.link,
            this.followerScale
        );
    }
}

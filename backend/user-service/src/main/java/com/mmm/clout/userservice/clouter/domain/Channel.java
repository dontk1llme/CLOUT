package com.mmm.clout.userservice.clouter.domain;

import com.mmm.clout.userservice.common.FollowerScale;
import com.mmm.clout.userservice.common.Platform;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
@Getter
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Channel {

    @Column(length = 20)
    private String name;

    private Platform platform;

    @Column(length = 600)
    private String link;

    private FollowerScale followerScale;
}

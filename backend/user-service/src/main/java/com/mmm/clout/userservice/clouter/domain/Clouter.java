package com.mmm.clout.userservice.clouter.domain;

import com.mmm.clout.userservice.common.entity.Address;
import com.mmm.clout.userservice.common.entity.Category;
import com.mmm.clout.userservice.common.entity.FollowerScale;
import com.mmm.clout.userservice.common.entity.Platform;
import com.mmm.clout.userservice.member.domain.Member;
import lombok.*;
import lombok.experimental.SuperBuilder;
import org.hibernate.annotations.DynamicInsert;

import javax.persistence.*;
import java.time.LocalDate;

@Getter
@ToString
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@SuperBuilder
@DynamicInsert
@DiscriminatorValue("CT")
@Entity
public class Clouter extends Member {

    private String name;

    @Embedded
    private Address address;

    @Enumerated(EnumType.STRING)
    private Category selectedCategory;

    @Column(name="follower_scale")
    @Enumerated(EnumType.STRING)
    private FollowerScale followerScale;

    @Column(name="platform")
    @Enumerated(EnumType.STRING)
    private Platform platForm;

    private LocalDate birthday;

    private Integer age;

}

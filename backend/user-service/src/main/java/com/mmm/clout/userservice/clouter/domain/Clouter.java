package com.mmm.clout.userservice.clouter.domain;

import com.mmm.clout.userservice.common.entity.address.Address;
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

    public Clouter(String userid, String pwd, String name, Address address, Category selectedCategory, FollowerScale followerScale, Platform platForm, LocalDate birthday, Integer age) {
        super(userid, pwd);
        this.name = name;
        this.address = address;
        this.selectedCategory = selectedCategory;
        this.followerScale = followerScale;
        this.platForm = platForm;
        this.birthday = birthday;
        this.age = age;
    }

    public static Clouter create(String userId, String pwd, String name,Address address, Category selectedCategory, FollowerScale followerScale, Platform platForm, LocalDate birthday, Integer age) {
        Clouter clouter = new Clouter(userId, pwd, name, address, selectedCategory, followerScale, platForm, birthday, age);
        return clouter;
    }

    public Clouter update(String userId, String pwd, String name, Address address, Category selectedCategory, FollowerScale followerScale, Platform platForm, LocalDate birthday, Integer age) {
        super.update(userId, pwd);
        this.name = name;
        this.address = address;
        this.selectedCategory = selectedCategory;
        this.followerScale = followerScale;
        this.platForm = platForm;
        this.birthday = birthday;
        this.age = age;
        return this;
    }
}

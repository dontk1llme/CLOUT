package com.mmm.clout.userservice.clouter.domain;

import com.mmm.clout.userservice.common.entity.Region;
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
import java.util.ArrayList;
import java.util.List;

@Getter
@ToString
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@SuperBuilder
@DynamicInsert
@DiscriminatorValue("CT")
@Entity
public class Clouter extends Member {

    private String nickName;

    private String name;

    private LocalDate birthday;

    private Integer age;

    private String phoneNumber;

    @ElementCollection
    @CollectionTable(name = "channel", joinColumns = @JoinColumn(name = "member_id"))
    private List<Channel> channelList = new ArrayList<>();

    @Embedded
    private HopeCost hopeCost;

    private boolean negoable;

    @ElementCollection(targetClass = Category.class, fetch = FetchType.LAZY)
    @JoinTable(name="clouter_categories", joinColumns = @JoinColumn(name = "member_id"))
    @Column(name = "category", nullable = false)
    @Enumerated(EnumType.STRING)
    private List<Category> categoryList = new ArrayList<>();

    @ElementCollection(targetClass = Region.class, fetch = FetchType.LAZY)
    @JoinTable(name="clouter_regions", joinColumns = @JoinColumn(name = "member_id"))
    @Column(name = "region", nullable = false)
    @Enumerated(EnumType.STRING)
    private List<Region> regioinList = new ArrayList<>();

    @Embedded
    private Address address;

    public Clouter(String userid, String pwd, String nickName, String name, LocalDate birthday, Integer age,
                   String phoneNumber,List<Channel> channelList, HopeCost hopeCost, boolean negoable,
                   List<Category> categoryList,List<Region> regioinList, Address address) {
        super(userid, pwd);
        this.nickName = nickName;
        this.name = name;
        this.birthday = birthday;
        this.age = age;
        this.phoneNumber = phoneNumber;
        this.channelList = channelList;
        this.hopeCost = hopeCost;
        this.negoable = negoable;
        this.categoryList = categoryList;
        this.regioinList = regioinList;
        this.address = address;
    }

    public static Clouter create(String userid, String pwd, String nickName, String name, LocalDate birthday, Integer age,
                                  String phoneNumber,List<Channel> channelList, HopeCost hopeCost, boolean negoable,
                                  List<Category> categoryList,List<Region> regioinList, Address address) {
        Clouter clouter = new Clouter(userid,pwd,nickName,name,birthday,age,phoneNumber,channelList,hopeCost,negoable,
                                     categoryList, regioinList, address);
        return clouter;
    }

    public Clouter update(String pwd, String nickName, String name, LocalDate birthday, Integer age,
                          String phoneNumber,List<Channel> channelList, HopeCost hopeCost, boolean negoable,
                          List<Category> categoryList,List<Region> regioinList, Address address) {
        super.update(pwd);
        this.nickName = nickName;
        this.name = name;
        this.birthday = birthday;
        this.age = age;
        this.phoneNumber = phoneNumber;
        this.channelList = channelList;
        this.hopeCost = hopeCost;
        this.negoable = negoable;
        this.categoryList = categoryList;
        this.regioinList = regioinList;
        this.address = address;
        return this;
    }
}

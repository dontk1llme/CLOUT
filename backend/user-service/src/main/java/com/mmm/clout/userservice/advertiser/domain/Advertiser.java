package com.mmm.clout.userservice.advertiser.domain;

import com.mmm.clout.userservice.common.entity.Address;
import com.mmm.clout.userservice.member.domain.Member;
import lombok.*;
import lombok.experimental.SuperBuilder;
import org.hibernate.annotations.DynamicInsert;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Embedded;
import javax.persistence.Entity;

@Getter
@ToString
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@SuperBuilder
@DynamicInsert
@DiscriminatorValue("AD")
@Entity
public class Advertiser extends Member {

    private Address address;

    @Embedded
    private CompanyInfo companyInfo;

    public Advertiser(String userid, String pwd, Address address, CompanyInfo companyInfo) {
        super(userid, pwd);
        this.address = address;
        this.companyInfo = companyInfo;
    }

    public static Advertiser create(String advertiserId, String pwd, Address address, CompanyInfo companyInfo) {
        Advertiser advertiser = new Advertiser(advertiserId, pwd, address, companyInfo);
        return advertiser;
    }

    public Advertiser changePassword(String pwd) {
        super.changePwd(pwd);
        return this;
    }
}

package com.mmm.clout.userservice.advertiser.domain;

import com.mmm.clout.userservice.common.entity.Address;
import com.mmm.clout.userservice.user.domain.entity.User;
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
@DiscriminatorValue("DT")
@Entity
public class Advertiser extends User {

    private Address address;

    @Embedded
    private CompanyInfo companyInfo;


}

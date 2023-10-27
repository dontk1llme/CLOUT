package com.mmm.clout.userservice.common.entity;

import javax.persistence.Embeddable;

@Embeddable
public class Address {

    private String zipCode;

    private String mainAddress;

    private String detailAddress;

}

package com.mmm.clout.contractservice.contract.domain;

import com.mmm.clout.contractservice.common.State;
import com.mmm.clout.contractservice.common.entity.BaseEntity;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Getter
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Contract extends BaseEntity {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "contract_id")
    private Long id;

    private String name;

    private Long price;

    private String postDeadline;

    private String contractExpiration;

    private String contents;

    @Embedded
    private ClouterInfo clouterInfo;

    @Embedded
    private AdvertiserInfo advertiserInfo;

    @Enumerated(EnumType.STRING)
    private State state;


    public Contract(String name, Long price, String postDeadline, String contractExpiration, String contents, ClouterInfo clouterInfo, AdvertiserInfo advertiserInfo) {
        this.name = name;
        this.price = price;
        this.postDeadline = postDeadline;
        this.contractExpiration = contractExpiration;
        this.contents = contents;
        this.clouterInfo = clouterInfo;
        this.advertiserInfo = advertiserInfo;
        this.state = State.WATING;
    }
    public static Contract create(String name, Long price, String postDeadline, String contractExpiration, String contents, ClouterInfo clouterInfo, AdvertiserInfo advertiserInfo) {
        return new Contract(name,price,postDeadline,contractExpiration,contents,clouterInfo,advertiserInfo);
    }

    public Contract updateResidentRegistrationNumber(String rnn) {
        this.clouterInfo.updateResidentRegistrationNumber(rnn);
        return this;
    }
}

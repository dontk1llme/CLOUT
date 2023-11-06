package com.mmm.clout.memberservice.star.domain;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class StarDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "star_detail_id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "star_id")
    private Star star;

    private Long contractId;

    private Long score;

    private Long giverId;

    public StarDetail(Star star, Long contractId, Long score, Long giverId) {
        this.star = star;
        this.contractId = contractId;
        this.score = score;
        this.giverId = giverId;
    }

    public static StarDetail create(Star star, Long contractId, Long score, Long giverId) {
        return new StarDetail(star, contractId, score, giverId);
    }
}

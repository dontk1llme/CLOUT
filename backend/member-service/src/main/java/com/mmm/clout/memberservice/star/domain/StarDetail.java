package com.mmm.clout.memberservice.star.domain;

import com.mmm.clout.memberservice.member.domain.Member;
import lombok.Getter;

import javax.persistence.*;

@Entity
@Getter
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

    @OneToOne
    @JoinColumn(name = "member_id")
    private Member rater;

    public StarDetail(Star star, Long contractId, Long score) {
        this.star = star;
        this.contractId = contractId;
        this.score = score;
    }

    public static StarDetail create(Star star, Long contractId, Long score) {
        return new StarDetail(star,contractId,score);
    }
}

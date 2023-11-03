package com.mmm.clout.memberservice.star.domain;

import com.mmm.clout.memberservice.member.domain.Member;
import lombok.Getter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Getter
public class Star {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "star_id")
    private Long id;

    @OneToOne
    @JoinColumn(name = "member_id")
    private Member member;

    private Long totalScore;

    private Long numberOfRaters;

    @OneToMany(mappedBy = "star")
    private List<StarDetail> starDetails = new ArrayList<>();

}

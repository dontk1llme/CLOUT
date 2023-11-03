package com.mmm.clout.memberservice.star.domain;

import com.mmm.clout.memberservice.member.domain.Member;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
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

    public Star(Member member) {
        this.member = member;
        this.totalScore = 0L;
        this.numberOfRaters = 0L;
    }

    public static Star init(Member member) {
        Star star = new Star(member);
        return star;
    }
}

package com.mmm.clout.userservice.member.domain;

import com.mmm.clout.userservice.user.domain.common.Role;
import lombok.*;
import lombok.experimental.SuperBuilder;
import org.hibernate.annotations.DynamicInsert;

import javax.persistence.*;

@Getter
@ToString
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@SuperBuilder
@DynamicInsert
@DiscriminatorColumn(name = "DTYPE")
@Entity
@Inheritance(strategy = InheritanceType.JOINED)
public abstract class Member {

    @Id @GeneratedValue
    @Column(name="member_id")
    private Long id;

    private String userId;

    private String pwd;

    private Long avgScore;

    private Long totalPoint;

    private Role role;

    public Long update(String newPassword) {
        this.pwd = newPassword;
        return this.id;
    }

    public Member(String userId, String pwd) {
        this.userId = userId;
        this.pwd = pwd;
        this.role = Role.USER;
        this.avgScore = 0L;
        this.totalPoint = 0L;
    }
}

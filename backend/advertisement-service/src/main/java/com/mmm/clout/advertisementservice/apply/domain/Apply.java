package com.mmm.clout.advertisementservice.apply.domain;

import com.mmm.clout.advertisementservice.advertisements.domain.Campaign;
import com.mmm.clout.advertisementservice.apply.domain.exception.CannotCancelApplyException;
import com.mmm.clout.advertisementservice.common.entity.BaseEntity;
import com.mmm.clout.advertisementservice.common.exception.ErrorCode;
import java.time.LocalDateTime;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.ToString;
import org.hibernate.annotations.DynamicInsert;

@Getter
@ToString
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@DynamicInsert
@Table(name = "apply")
@Entity
public class Apply extends BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "apply_id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "advertisement_id")
    private Campaign campaign;

    @Embedded
    private Applicant applicant;

    private String applyMessage;

    private Long hopeAdFee;

    private LocalDateTime appliedAt;

    @Enumerated(EnumType.STRING)
    private ApplyStatus applyStatus;

    public static Apply apply(Campaign campaign, Applicant applicant, String applyMessage, Long hodeAdFee) {
        return new Apply(campaign, applicant, applyMessage, hodeAdFee);
    }

    public Apply(Campaign campaign, Applicant applicant, String applyMessage, Long hopeAdFee) {
        this.campaign = campaign;
        this.applicant = applicant;
        this.applyMessage = applyMessage;
        this.hopeAdFee = hopeAdFee;
        this.appliedAt = LocalDateTime.now();
        this.applyStatus = ApplyStatus.WAITING;
    }

    public void cancelApply() {
        if (this.applyStatus == ApplyStatus.ACCEPTED) {
            throw new CannotCancelApplyException("해당 캠페인은 이미 채택되어 취소할 수 없습니다.", ErrorCode.ALREADY_ACCEPTED_APPLY);
        }
        this.getCampaign().cancel();
        this.applyStatus  = ApplyStatus.CANCEL;
    }

    @Getter
    @RequiredArgsConstructor
    public enum ApplyStatus {

        WAITING("채택 대기"),
        ACCEPTED("채택"),
        NOT_ACCEPTED("미채택"),
        CANCEL("신청 취소");

        private final String description;
    }

}

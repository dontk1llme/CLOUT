package com.mmm.clout.advertisementservice.advertisements.domain;

import java.time.LocalDate;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Table;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.hibernate.annotations.DynamicInsert;
import org.springframework.transaction.annotation.Transactional;

@Getter
@ToString
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@DynamicInsert
@Table(name = "campaign")
@Entity
@DiscriminatorValue("CP")
public class Campaign extends Advertisement {

    @Enumerated(EnumType.STRING)
    private AdCategory adCategory;

    private Boolean isPriceChangeable;

    private Boolean isDeliveryRequired;

    private Integer numberOfRecruiter; // 모집인원

    private Integer numberOfApplicants; // 신청인원

    public Campaign(String title, LocalDate adStartDate, LocalDate adEndDate,
        Integer numberOfRecruiter,
        Integer numberOfApplicants) {
        super(title, adStartDate, adEndDate);
        this.numberOfRecruiter = numberOfRecruiter;
        this.numberOfApplicants = numberOfApplicants;
    }

    public static Campaign create(String title, LocalDate adStartDate, LocalDate adEndDate) {
        return new Campaign(
            title,
            adStartDate,
            adEndDate,
            5,
            0
        );
    }
}

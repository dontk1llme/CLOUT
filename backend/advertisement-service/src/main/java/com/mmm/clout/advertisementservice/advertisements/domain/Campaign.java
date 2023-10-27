package com.mmm.clout.advertisementservice.advertisements.domain;

import java.time.LocalDate;
import java.util.List;
import javax.persistence.CollectionTable;
import javax.persistence.DiscriminatorValue;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.Table;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.hibernate.annotations.DynamicInsert;

@Getter
@ToString
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@DynamicInsert
@Table(name = "campaign")
@Entity
@DiscriminatorValue("CP")
public class Campaign extends Advertisement {

    private String title;

    @Enumerated(EnumType.STRING)
    private AdCategory adCategory; // 광고 카테고리

    private Boolean isPriceChangeable; // 광고비 협의 여부

    private Boolean isDeliveryRequired; // 배송 여부

    private Integer numberOfRecruiter; // 모집인원

    private Integer numberOfApplicants; // 신청인원

    private String offeringDetails; // 제공 내역 설명

    private String sellingLink;

    private LocalDate applyStartDate; // 모집 시작 날짜

    private LocalDate applyEndDate; // 모집 종료 날짜

    private Integer minClouterAge;

    private Integer maxClouterAge;

    private Integer minFollower;

    @ElementCollection(targetClass = Region.class, fetch = FetchType.EAGER)
    @CollectionTable(name = "advertisement_platform", joinColumns = @JoinColumn(name = "advertisement_id"))
    @Enumerated(EnumType.STRING)
    private List<Region> regionList;

    public Campaign(String title, AdCategory category, Boolean isPriceChangeable, Boolean isDeliveryRequired, Integer numberOfRecruiter, Integer numberOfApplicants, String offeringDetails, String sellingLink, LocalDate applyStartDate,
        LocalDate applyEndDate, Integer minClouterAge, Integer maxClouterAge, Integer minFollower) {
    }


    public void create(
        String title,
        AdCategory category,
        Boolean isPriceChangeable,
        Boolean isDeliveryRequired,
        Integer numberOfRecruiter,
        Integer numberOfApplicants,
        String offeringDetails,
        String sellingLink,
        LocalDate applyStartDate,
        LocalDate applyEndDate,
        Integer minClouterAge,
        Integer maxClouterAge,
        Integer minFollower
    ) {
        new Campaign(
            title,
            category,
            isPriceChangeable,
            isDeliveryRequired,
            numberOfRecruiter,
            numberOfApplicants,
            offeringDetails,
            sellingLink,
            applyStartDate,
            applyEndDate,
            minClouterAge,
            maxClouterAge,
            minFollower
        );
    }

}

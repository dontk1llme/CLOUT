package com.mmm.clout.advertisementservice.apply.infrastructure.persistence.jpa;

import com.mmm.clout.advertisementservice.advertisements.domain.Campaign;
import com.mmm.clout.advertisementservice.apply.domain.Apply;
import org.springframework.data.jpa.repository.JpaRepository;

public interface JpaApplyRepository extends JpaRepository<Apply, Long> {

    boolean existsByCampaignAndApplicantId(Campaign campaign, Long applicantId);
}

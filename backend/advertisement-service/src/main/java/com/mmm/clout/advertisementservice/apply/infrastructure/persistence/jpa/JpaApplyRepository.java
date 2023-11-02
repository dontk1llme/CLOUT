package com.mmm.clout.advertisementservice.apply.infrastructure.persistence.jpa;

import com.mmm.clout.advertisementservice.advertisements.domain.Campaign;
import com.mmm.clout.advertisementservice.apply.domain.Apply;
import com.mmm.clout.advertisementservice.apply.domain.Apply.ApplyStatus;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface JpaApplyRepository extends JpaRepository<Apply, Long> {

    boolean existsByCampaignAndApplicant_ApplicantId(Campaign campaign, Long clouterId);

    List<Apply> findByApplicant_ApplicantIdAndApplyStatus(Long applicantId, ApplyStatus applyStatus);

    List<Apply> findByCampaignId(Long advertisementId);

    List<Apply> findByCampaign(Campaign campaign);
}

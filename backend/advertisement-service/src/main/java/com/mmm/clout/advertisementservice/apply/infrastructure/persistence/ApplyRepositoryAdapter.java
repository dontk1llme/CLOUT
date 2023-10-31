package com.mmm.clout.advertisementservice.apply.infrastructure.persistence;

import com.mmm.clout.advertisementservice.advertisements.domain.Campaign;
import com.mmm.clout.advertisementservice.apply.domain.Apply;
import com.mmm.clout.advertisementservice.apply.domain.repository.ApplyRepository;
import com.mmm.clout.advertisementservice.apply.infrastructure.persistence.jpa.JpaApplyRepository;
import java.util.Optional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class ApplyRepositoryAdapter implements ApplyRepository {

    private final JpaApplyRepository jpaApplyRepository;

    @Override
    public Apply save(Apply apply) {
        return jpaApplyRepository.save(apply);
    }

    @Override
    public Optional<Apply> findById(Long applyId) {
        return jpaApplyRepository.findById(applyId);
    }

    @Override
    public boolean checkApplyExists(Campaign campaign, Long clouterId) {
        return jpaApplyRepository.existsByCampaignAndApplicantId(campaign, clouterId);
    }


}

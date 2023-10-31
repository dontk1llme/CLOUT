package com.mmm.clout.advertisementservice.advertisements.infrastructure.persistence.jpa;

import com.mmm.clout.advertisementservice.advertisements.domain.Campaign;
import org.springframework.data.jpa.repository.JpaRepository;

public interface JpaCampaignRepository extends JpaRepository<Campaign, Long> {

}

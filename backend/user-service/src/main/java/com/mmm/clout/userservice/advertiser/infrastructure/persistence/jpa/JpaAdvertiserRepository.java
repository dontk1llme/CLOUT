package com.mmm.clout.userservice.advertiser.infrastructure.persistence.jpa;

import com.mmm.clout.userservice.advertiser.domain.Advertiser;
import org.springframework.data.jpa.repository.JpaRepository;

public interface JpaAdvertiserRepository extends JpaRepository<Advertiser, Long> {
}

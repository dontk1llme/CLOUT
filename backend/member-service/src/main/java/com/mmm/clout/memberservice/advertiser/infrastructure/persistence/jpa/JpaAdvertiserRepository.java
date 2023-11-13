package com.mmm.clout.memberservice.advertiser.infrastructure.persistence.jpa;

import com.mmm.clout.memberservice.advertiser.domain.Advertiser;
import com.mmm.clout.memberservice.clouter.domain.Clouter;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface JpaAdvertiserRepository extends JpaRepository<Advertiser, Long> {

    List<Advertiser> findByIdIn(List<Long> idList);
}

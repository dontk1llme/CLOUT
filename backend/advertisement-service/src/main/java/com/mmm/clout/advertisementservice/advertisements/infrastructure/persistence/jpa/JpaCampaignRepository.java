package com.mmm.clout.advertisementservice.advertisements.infrastructure.persistence.jpa;

import com.mmm.clout.advertisementservice.advertisements.domain.Advertisement;
import com.mmm.clout.advertisementservice.advertisements.domain.Campaign;
import java.time.LocalDate;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.data.repository.query.Param;

public interface JpaCampaignRepository extends JpaRepository<Campaign, Long>,
    QuerydslPredicateExecutor<Campaign> {

    /*
     * jpa 쿼리로 작성하기에 가독성이 좋지 않아 jpql로 작성
     */
    @Query("SELECT c FROM Campaign c WHERE :current BETWEEN c.applyStartDate AND c.applyEndDate AND c.isEnded = false ORDER BY c.numberOfApplicants DESC, c.createdAt DESC")
    Page<Campaign> findActiveCampaignsOrderByApplicants(@Param("current") LocalDate current,
        Pageable pageable);

    Page<Campaign> findByRegisterIdOrderByCreatedAtDesc(Long advertiserId, Pageable pageable);
}

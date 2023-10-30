package com.mmm.clout.userservice.clouter.application;

import com.mmm.clout.userservice.advertiser.domain.Advertiser;
import com.mmm.clout.userservice.clouter.domain.Clouter;
import com.mmm.clout.userservice.clouter.domain.repository.ClouterRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
public class SelectClouterProcessor {

    private final ClouterRepository clouterRepository;

    @Transactional
    public Clouter execute(Long clouterId) {
        Clouter clouter = clouterRepository.findById(clouterId);
        return clouter;
    }

}

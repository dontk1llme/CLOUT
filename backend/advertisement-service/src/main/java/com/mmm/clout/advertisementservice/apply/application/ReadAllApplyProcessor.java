package com.mmm.clout.advertisementservice.apply.application;

import com.mmm.clout.advertisementservice.apply.domain.Apply;
import com.mmm.clout.advertisementservice.apply.domain.Apply.ApplyStatus;
import com.mmm.clout.advertisementservice.apply.domain.info.AdvertiserInfo;
import com.mmm.clout.advertisementservice.apply.domain.provider.AdvertiserProvider;
import com.mmm.clout.advertisementservice.apply.domain.repository.ApplyRepository;
import java.util.List;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
public class ReadAllApplyProcessor {

    private final ApplyRepository applyRepository;
    private final AdvertiserProvider advertiserInfoProvider;

    public List<Apply> execute(Long applicantId, ApplyStatus applyStatus) {
        List<Apply> applyList = applyRepository.getAllByStatus(applicantId, applyStatus);
        applyList.stream().map(
            apply -> {
                Long advertiserId = apply.getCampaign().getAdvertiserId();
                AdvertiserInfo info = advertiserInfoProvider.getAdvertiserInfoByMemberId(advertiserId);
                return info;
            }
        ).forEach(
            System.out::println
        );


        return null;
    }
}

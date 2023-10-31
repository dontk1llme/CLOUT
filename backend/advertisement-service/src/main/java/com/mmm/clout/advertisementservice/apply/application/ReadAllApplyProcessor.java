package com.mmm.clout.advertisementservice.apply.application;

import com.mmm.clout.advertisementservice.advertisements.domain.info.AdvertiserInfo;
import com.mmm.clout.advertisementservice.advertisements.domain.provider.AdvertiserInfoProvider;
import com.mmm.clout.advertisementservice.apply.domain.Apply;
import com.mmm.clout.advertisementservice.apply.domain.Apply.ApplyStatus;
import com.mmm.clout.advertisementservice.apply.domain.repository.ApplyRepository;
import java.util.List;
import java.util.stream.Collectors;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class ReadAllApplyProcessor {

    private final ApplyRepository applyRepository;
    private final AdvertiserInfoProvider advertiserInfoProvider;

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

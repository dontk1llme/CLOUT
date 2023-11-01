package com.mmm.clout.advertisementservice.apply.application;

import com.mmm.clout.advertisementservice.apply.application.reader.ClouterApplyListReader;
import com.mmm.clout.advertisementservice.apply.domain.Apply;
import com.mmm.clout.advertisementservice.apply.domain.Apply.ApplyStatus;
import com.mmm.clout.advertisementservice.apply.domain.info.AdvertiserInfo;
import com.mmm.clout.advertisementservice.apply.domain.provider.AdvertiserProvider;
import com.mmm.clout.advertisementservice.apply.domain.repository.ApplyRepository;
import java.sql.Array;
import java.util.ArrayList;
import java.util.List;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@RequiredArgsConstructor
public class ReadAllApplyProcessor {

    private final ApplyRepository applyRepository;
    private final AdvertiserProvider advertiserInfoProvider;

    @Transactional
    public List<ClouterApplyListReader> execute(Long applicantId, ApplyStatus applyStatus) {
        List<Apply> applyList = applyRepository.getAllByStatus(applicantId, applyStatus);
        List<ClouterApplyListReader> readerList = new ArrayList<>();
        for (Apply apply: applyList) {
            Long advertiserId = apply.getCampaign().getAdvertiserId();
            AdvertiserInfo info = advertiserInfoProvider.getAdvertiserInfoByMemberId(advertiserId);
            readerList.add(
                new ClouterApplyListReader(
                    apply, info.getCompanyInfo().getCompanyName(), 0
                )
            );
        }
        return readerList;
    }
}

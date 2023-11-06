package com.mmm.clout.advertisementservice.apply.application;

import com.mmm.clout.advertisementservice.advertisements.domain.Campaign;
import com.mmm.clout.advertisementservice.apply.application.reader.ApplicantListByCampaignReader;
import com.mmm.clout.advertisementservice.apply.domain.Apply;
import com.mmm.clout.advertisementservice.common.msa.info.ClouterInfo;
import com.mmm.clout.advertisementservice.common.msa.provider.MemberProvider;
import com.mmm.clout.advertisementservice.apply.domain.repository.ApplyRepository;
import java.util.ArrayList;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
public class ReadApplicantsByCampaignProcessor {

    private final ApplyRepository applyRepository;
    private final MemberProvider clouterProvider;
    @Transactional
    public List<ApplicantListByCampaignReader> execute(Long advertisementId) {
        List<Apply> applyList = applyRepository.findApplicantList(advertisementId);
        List<ApplicantListByCampaignReader> readerList = new ArrayList<>();
        for (Apply apply: applyList) {
            Long applicantId = apply.getApplicant().getApplicantId();
            ClouterInfo info = clouterProvider.getClouterInfoByMemberId(applicantId);
            Campaign campaign = apply.getCampaign();
            readerList.add(
                new ApplicantListByCampaignReader(
                    campaign.getId(),
                    campaign.getNumberOfRecruiter(),
                    campaign.getNumberOfApplicants(),
                    campaign.getNumberOfSelectedMembers(),
                    //TODO image
                    apply.getHopeAdFee(),
                    apply.getApplyStatus().toString(),
                    info.getNickName(),
                    info.getAvgScore(),
                    info.getChannelList()
                )
            );
        }

        return readerList;
    }
}

package com.mmm.clout.advertisementservice.apply.presentation.response;

import com.mmm.clout.advertisementservice.apply.application.reader.ApplicantListByCampaignReader;
import java.util.List;
import java.util.stream.Collectors;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class ApplicantResponse {

    private Long campaignId;

    private Integer numberOfRecruiter; // 모집인원

    private Integer numberOfApplicants; // 신청인원

    private Integer numberOfSelectedMembers; // 채택 인원

    // TODO
    // private Image clouterProfileImage;

    private Long hopeAdFee;

    private String applyStatus;

    private String nickname;

    private Long clouterAvgStar;

    private List<ChannelResponse> clouterChannelList;

    public static List<ApplicantResponse> from(List<ApplicantListByCampaignReader> applicantList) {
        return applicantList.stream().map(
            a -> new ApplicantResponse(
                a.getCampaignId(),
                a.getNumberOfRecruiter(),
                a.getNumberOfApplicants(),
                a.getNumberOfSelectedMembers(),
                a.getHopeAdFee(),
                a.getApplyStatus(),
                a.getNickname(),
                a.getClouterAvgStar(),
                ChannelResponse.from(a.getClouterChannelList())
            )
        ).collect(Collectors.toList());
    }

}
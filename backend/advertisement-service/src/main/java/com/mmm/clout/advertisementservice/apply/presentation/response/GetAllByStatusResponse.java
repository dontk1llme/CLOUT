package com.mmm.clout.advertisementservice.apply.presentation.response;

import com.mmm.clout.advertisementservice.advertisements.domain.AdCategory;
import com.mmm.clout.advertisementservice.apply.application.reader.ClouterApplyListReader;
import com.mmm.clout.advertisementservice.apply.domain.Apply;
import com.mmm.clout.advertisementservice.apply.domain.Apply.ApplyStatus;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class GetAllByStatusResponse {

    private List<GetApplyByStatusResponse> applyList;


    public static GetAllByStatusResponse from(List<ClouterApplyListReader> readerList) {
        List<GetApplyByStatusResponse> responseList = new ArrayList<>();
        for (ClouterApplyListReader r :readerList) {
            Apply apply = r.getApply();
            responseList.add(
                new GetApplyByStatusResponse(
                    apply.getId(),
                    apply.getApplyStatus(),
                    apply.getCampaign().getAdCategory(),
                    apply.getCampaign().getTitle(),
                    apply.getCampaign().getPrice(),
                    apply.getCampaign().getNumberOfSelectedMembers(),
                    apply.getCampaign().getNumberOfRecruiter(),
                    r.getCompanyName(),
                    r.getAdvertiserAvgStar()
                )
            );
        }
        return new GetAllByStatusResponse(responseList);
    }
}

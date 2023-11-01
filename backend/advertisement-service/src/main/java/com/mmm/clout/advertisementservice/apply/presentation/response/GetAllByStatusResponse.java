package com.mmm.clout.advertisementservice.apply.presentation.response;

import com.mmm.clout.advertisementservice.advertisements.domain.AdCategory;
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


    // TODO msa 통신 후 dto 값 넣기
    public static GetAllByStatusResponse from(List<Apply> applyList) {
        List<GetApplyByStatusResponse> res = applyList.stream().map(apply -> {
            return new GetApplyByStatusResponse(
                apply.getId(),
                apply.getApplyStatus(),
                apply.getCampaign().getAdCategory(),
                apply.getCampaign().getTitle(),
                apply.getCampaign().getPrice(),
                apply.getCampaign().getNumberOfSelectedMembers(),
                apply.getCampaign().getNumberOfRecruiter(),
                "CompanyNAme",
                100
            );
        }).collect(Collectors.toList());
        return new GetAllByStatusResponse(res);
    }
}

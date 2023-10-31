package com.mmm.clout.advertisementservice.apply.presentation.response;

import com.mmm.clout.advertisementservice.advertisements.domain.AdCategory;
import com.mmm.clout.advertisementservice.apply.domain.Apply.ApplyStatus;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class GetApplyByStatusResponse {
    private Long applyId;
    private ApplyStatus applyStatus;
    private AdCategory adCategory;
    private String title;
    private Long price;
    private Integer numberOfSelectedMembers;
    private Integer numberOfRecruiter;
    private List<ImageResponse> responseList;
    private String companyName;
    private Integer companyAvgStars;

}

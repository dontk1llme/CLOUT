package com.mmm.clout.advertisementservice.apply.presentation.response;

import com.mmm.clout.advertisementservice.advertisements.domain.AdCategory;
import com.mmm.clout.advertisementservice.apply.domain.Apply;
import com.mmm.clout.advertisementservice.apply.domain.Apply.ApplyStatus;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class GetAllByStatusResponse {

    private ApplyStatus applyStatus;
    private AdCategory adCategory;
    private String title;
    private Long price;


    public static GetAllByStatusResponse from(List<Apply> allByApplyStatus) {
        return null;
    }
}

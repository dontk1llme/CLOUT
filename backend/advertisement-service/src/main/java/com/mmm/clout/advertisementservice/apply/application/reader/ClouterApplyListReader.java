package com.mmm.clout.advertisementservice.apply.application.reader;

import com.mmm.clout.advertisementservice.advertisements.domain.AdCategory;
import com.mmm.clout.advertisementservice.apply.domain.Apply;
import com.mmm.clout.advertisementservice.apply.domain.Apply.ApplyStatus;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class ClouterApplyListReader {

    private Apply apply;
    //    private List<ImageResponse> imageList; // TODO
    private String companyName;
    private Integer advertiserAvgStar;

}

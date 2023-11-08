package com.mmm.clout.advertisementservice.apply.application.reader;

import com.mmm.clout.advertisementservice.apply.domain.Apply;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class ApplyListByClouterReader {

    private Apply apply;
    //    private List<ImageResponse> imageList; // TODO
    private String companyName;
    private Integer advertiserAvgStar;

}

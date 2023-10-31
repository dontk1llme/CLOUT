package com.mmm.clout.memberservice.clouter.presentation.response;

import com.mmm.clout.memberservice.clouter.domain.Clouter;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class CreateClrResponse {

    private Long createdCtrId;

    public static CreateClrResponse from(Clouter clouter) {
        return new CreateClrResponse(clouter.getId());
    }

}

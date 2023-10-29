package com.mmm.clout.userservice.clouter.presentation.response;

import com.mmm.clout.userservice.clouter.domain.Clouter;
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

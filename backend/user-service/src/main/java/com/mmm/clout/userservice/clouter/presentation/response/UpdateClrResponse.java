package com.mmm.clout.userservice.clouter.presentation.response;

import com.mmm.clout.userservice.clouter.domain.Clouter;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class UpdateClrResponse {

    private Long updatedCtrId;

    public static UpdateClrResponse from(Clouter clouter) {
        return new UpdateClrResponse(clouter.getId());
    }

}

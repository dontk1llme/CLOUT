package com.mmm.clout.userservice.common.entity.address.response;

import com.mmm.clout.userservice.common.entity.address.Address;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class AddressResponse {

    @Schema(description = "우편 번호")
    private String zipCode;

    @Schema(description = "메인 주소")
    private String mainAddress;

    @Schema(description = "상세 주소")
    private String detailAddress;

    public AddressResponse(Address address) {
        this.zipCode = address.getZipCode();
        this.mainAddress = address.getMainAddress();
        this.detailAddress = address.getDetailAddress();
    }
}

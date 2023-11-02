package com.mmm.clout.memberservice.common.entity.address.reader;

import com.mmm.clout.memberservice.common.entity.address.Address;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class AddressReader {

    @Schema(description = "우편 번호")
    private String zipCode;

    @Schema(description = "메인 주소")
    private String mainAddress;

    @Schema(description = "상세 주소")
    private String detailAddress;

    public AddressReader(Address address) {
        this.zipCode = address.getZipCode();
        this.mainAddress = address.getMainAddress();
        this.detailAddress = address.getDetailAddress();
    }
}

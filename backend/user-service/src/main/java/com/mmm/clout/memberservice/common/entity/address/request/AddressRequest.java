package com.mmm.clout.memberservice.common.entity.address.request;

import com.mmm.clout.memberservice.common.entity.address.command.AddressCommand;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Getter;

import javax.validation.constraints.NotBlank;

@Getter
@AllArgsConstructor
public class AddressRequest {
    @NotBlank
    @Schema(description = "우편번호")
    private String zipCode;

    @NotBlank
    @Schema(description = "메인 주소")
    private String mainAddress;

    @NotBlank
    @Schema(description = "상세 주소")
    private String detailAddress;

    public AddressCommand toCommand() {
        return new AddressCommand(
            this.zipCode,
            this.mainAddress,
            this.detailAddress
        );
    }
}

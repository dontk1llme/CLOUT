package com.mmm.clout.memberservice.advertiser.presentation.request;

import com.mmm.clout.memberservice.advertiser.application.command.CompanyInfoCommand;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Getter;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Getter
@AllArgsConstructor
public class CompanyInfoRequest {
    @NotBlank
    @Schema(description = "회사 이름")
    @Size(max = 20)
    private String companyName;

    @NotBlank
    @Schema(description = "사업자 등록 번호")
    private String regNum;

    @NotBlank
    @Schema(description = "회사 대표자 이름")
    private String ceoName;

    @NotBlank
    @Size(max = 10)
    @Schema(description = "담당자 이름")
    private String managerName;

    @NotBlank
    @Size(max = 15)
    @Schema(description = "담당자 전화번호")
    private String managerPhoneNumber;

    public CompanyInfoCommand toCommand() {
        return new CompanyInfoCommand(
            this.companyName,
            this.regNum,
            this.ceoName,
            this.managerName,
            this.managerPhoneNumber
        );
    }
}
package com.mmm.clout.memberservice.advertiser.presentation.response;

import com.mmm.clout.memberservice.advertiser.domain.CompanyInfo;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class CompanyInfoResponse {

    @Schema(description = "회사 이름")
    private String companyName;

    @Schema(description = "사업자 등록 번호")
    private String regNum;

    @Schema(description = "회사 대표 이름")
    private String ceoName;

    @Schema(description = "담당자 이름")
    private String managerName;

    @Schema(description = "담당자 전화번호")
    private String managerPhoneNumber;

    public CompanyInfoResponse(CompanyInfo companyInfo) {
        this.companyName = companyInfo.getCompanyName();
        this.regNum = companyInfo.getRegNum();
        this.ceoName = companyInfo.getCeoName();
        this.managerName = companyInfo.getManagerName();
        this.managerPhoneNumber = companyInfo.getManagerPhoneNumber();
    }
}
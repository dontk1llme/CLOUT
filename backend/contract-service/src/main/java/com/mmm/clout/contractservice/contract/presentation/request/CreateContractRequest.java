package com.mmm.clout.contractservice.contract.presentation.request;

import com.mmm.clout.contractservice.contract.application.command.CreateContractCommand;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Getter;
import org.jetbrains.annotations.NotNull;

import javax.validation.constraints.NotBlank;

@AllArgsConstructor
@Getter
public class CreateContractRequest {

    @Schema(description = "계약건 명")
    @NotBlank
    private String name;

    @Schema(description = "계약의 계약 금액")
    @NotNull
    private Long price;

    @Schema(description = "계약 게시 기간")
    @NotBlank
    private String postDeadline;

    @Schema(description = "계약 지속 기간")
    @NotBlank
    private String contractExpiration;

    @Schema(description = "계약 상세 수행 내역")
    @NotBlank
    private String contents;

    private ClouterInfoRequest clouterInfo;

    private AdvertiserInfoRequest advertiserInfo;

    public CreateContractCommand toCommand() {
           return new CreateContractCommand(
                   this.name,
                   this.price,
                   this.postDeadline,
                   this.contractExpiration,
                   this.contents,
                   this.clouterInfo.toCommand(),
                   this.advertiserInfo.toCommand()
           );
    }
}

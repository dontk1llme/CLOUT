package com.mmm.clout.advertisementservice.apply.application.command;

import com.mmm.clout.advertisementservice.apply.domain.Apply;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class CreateContractCommand {

    private String name;

    private Long price;

    private String postDeadline;

    private String contractExpiration;

    private String contents;

    private Long advertiserId;

    private Long clouterId;

    public CreateContractCommand(Apply apply) {
        this.name = apply.getCampaign().getTitle();
        hopeFeeCheck(apply);
        this.postDeadline = "ONE-MONTH";
        this.contractExpiration = "SIX-MONTH";
        this.contents = apply.getCampaign().getDetails();
        this.advertiserId = apply.getCampaign().getAdvertiserId();
        this.clouterId = apply.getApplicant().getApplicantId();
    }

    private void hopeFeeCheck(Apply apply) {
        if (apply.getHopeAdFee() <= 0 || apply.getHopeAdFee() == null) {
            this.price = apply.getCampaign().getPrice();
        } else {
            this.price = apply.getHopeAdFee();
        }
    }
}

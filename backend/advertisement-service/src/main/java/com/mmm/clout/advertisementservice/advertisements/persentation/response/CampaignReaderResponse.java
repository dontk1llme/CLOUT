package com.mmm.clout.advertisementservice.advertisements.persentation.response;

import com.mmm.clout.advertisementservice.advertisements.application.reader.CampaignReader;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class CampaignReaderResponse {

    private CampaignResponse campaign;
    private AdvertiserResponse advertiserInfo;


    public static CampaignReaderResponse from(CampaignReader result) {
        return new CampaignReaderResponse(
            CampaignResponse.from(result.getCampaign()),
            AdvertiserResponse.from(result.getAdvertiserInfo())
        );
    }
}

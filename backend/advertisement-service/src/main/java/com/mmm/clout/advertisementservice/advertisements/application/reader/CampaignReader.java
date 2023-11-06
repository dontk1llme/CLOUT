package com.mmm.clout.advertisementservice.advertisements.application.reader;

import com.mmm.clout.advertisementservice.advertisements.domain.Campaign;
import com.mmm.clout.advertisementservice.common.msa.info.AdvertiserInfo;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class CampaignReader {

    private Campaign campaign;

    private AdvertiserInfo advertiserInfo;

}

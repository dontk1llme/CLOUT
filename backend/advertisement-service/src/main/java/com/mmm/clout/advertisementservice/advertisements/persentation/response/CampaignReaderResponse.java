package com.mmm.clout.advertisementservice.advertisements.persentation.response;

import com.mmm.clout.advertisementservice.advertisements.application.reader.CampaignListReader;
import com.mmm.clout.advertisementservice.advertisements.application.reader.CampaignReader;
import com.mmm.clout.advertisementservice.advertisements.domain.Campaign;
import com.mmm.clout.advertisementservice.common.msa.info.AdvertiserInfo;
import com.mmm.clout.advertisementservice.image.domain.AdvertiseSign;
import com.mmm.clout.advertisementservice.image.domain.Image;
import com.mmm.clout.advertisementservice.image.presentation.AdvertiseSIgnResponse;
import com.mmm.clout.advertisementservice.image.presentation.ImageResponse;
import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.List;
import java.util.stream.Collectors;
import org.springframework.data.domain.Page;

@Getter
@AllArgsConstructor
public class CampaignReaderResponse {

    private CampaignResponse campaign;
    private AdvertiserResponse advertiserInfo;
    private List<ImageResponse> imageList;
    private AdvertiseSIgnResponse signImage;


    public static CampaignReaderResponse from(CampaignReader result) {
        return new CampaignReaderResponse(
            CampaignResponse.from(result.getCampaign()),
            AdvertiserResponse.from(result.getAdvertiserInfo()),
            result.getImageList().stream().map(v -> new ImageResponse(v)).collect(Collectors.toList()),
            new AdvertiseSIgnResponse(result.getSignImage())
        );
    }

    public static CustomPageResponse<CampaignReaderResponse> of(CampaignListReader campaigns) {
        Page<Campaign> campaignList = campaigns.getCampaignList();
        AdvertiserInfo advertiserInfo = campaigns.getAdvertiserInfo();

        return new CustomPageResponse<>(
            campaignList.stream().map(
                campaign -> CampaignReaderResponse.from(
                    new CampaignReader(campaign,
                        advertiserInfo,
                        campaigns.getImageMap().get(campaign.getId()),
                        campaigns.getSignMap().get(campaign.getId())
                    )
                )
            ).collect(Collectors.toList()),
            campaigns.getCampaignList().getNumber(),
            campaigns.getCampaignList().getSize(),
            campaigns.getCampaignList().getTotalPages(),
            campaigns.getCampaignList().getTotalElements()
        );

    }
}

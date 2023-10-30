package com.mmm.clout.advertisementservice.advertisements.persentation.request;

import com.mmm.clout.advertisementservice.advertisements.application.command.CreateCampaignCommand;
import com.mmm.clout.advertisementservice.advertisements.domain.AdCategory;
import com.mmm.clout.advertisementservice.advertisements.domain.AdPlatform;
import com.mmm.clout.advertisementservice.advertisements.domain.Region;
import java.util.List;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class CreateCampaignRequest {

    @NotNull
    private AdCategory adCategory;

    @NotBlank
    @Size(min = 1, max = 20)
    private String title;

    @NotNull
    @Min(1)
    @Max(100)
    private Integer numberOfRecruiter;

    @NotNull
    private Boolean isPriceChangeable;

    @NotNull
    private Long price;

    @NotBlank
    @Size(max = 500)
    private String offeringDetails;

    private String sellingLink;

    @NotNull
    private Boolean isDeliveryRequired;

    @NotBlank
    @Size(max = 800)
    private String details;

    @NotNull
    private List<AdPlatform> adPlatformList;

    @NotNull
    @Min(0)
    @Max(100)
    private Integer minClouterAge;

    @NotNull
    @Min(0)
    @Max(100)
    private Integer maxClouterAge;

    @NotNull
    private Integer minFollower;

    @NotNull
    private List<Region> regionList;


    public CreateCampaignCommand toCommand() {
        return new CreateCampaignCommand(
            this.adCategory,
            this.title,
            this.numberOfRecruiter,
            this.isPriceChangeable,
            this.price,
            this.offeringDetails,
            this.sellingLink,
            this.isDeliveryRequired,
            this.details,
            this.adPlatformList,
            this.minClouterAge,
            this.maxClouterAge,
            this.minFollower,
            this.regionList
        );
    }
}

package com.mmm.clout.advertisementservice.advertisements.application.command;

import com.mmm.clout.advertisementservice.advertisements.domain.AdCategory;
import com.mmm.clout.advertisementservice.advertisements.domain.AdPlatform;
import com.mmm.clout.advertisementservice.advertisements.domain.Region;
import java.time.LocalDate;
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
public class CreateAdCommand {

    private AdCategory adCategory;

    private String title;

    private int numberOfRecruiter;

    private boolean isPriceChangeable;

    private long price;

    private String offeringDetails;

    private String sellingLink;

    private boolean isDeliveryRequired;

    private String details;

    private List<AdPlatform> adPlatformList;

    private int minClouterAge;

    private int maxClouterAge;

    private int minFollower;

    private List<Region> regionList;

}

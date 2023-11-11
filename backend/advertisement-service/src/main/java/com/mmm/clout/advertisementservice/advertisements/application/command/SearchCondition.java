package com.mmm.clout.advertisementservice.advertisements.application.command;

import com.mmm.clout.advertisementservice.advertisements.domain.AdCategory;
import com.mmm.clout.advertisementservice.advertisements.domain.AdPlatform;
import com.mmm.clout.advertisementservice.advertisements.domain.Region;
import java.util.List;
import java.util.stream.Collectors;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class SearchCondition {

    private List<AdCategory> category;
    private List<AdPlatform> platform;
    private Integer minAge;
    private Integer maxAge;
    private Integer minFollower;
    private Integer minPrice;
    private Integer maxPrice;
    private List<Region> region;
    private String keyword;
    private String sortKe;

    public static SearchCondition from(
        List<String> category,
        List<String> platform,
        Integer minAge,
        Integer maxAge,
        Integer minFollower,
        Integer minPrice,
        Integer maxPrice,
        List<String> region,
        String keyword,
        String sortKey
    ) {
        return new SearchCondition(
            category.stream().map(
                AdCategory::valueOf
            ).collect(Collectors.toList()),
            platform.stream().map(
                AdPlatform::valueOf
            ).collect(Collectors.toList()),
            minAge,
            maxAge,
            minFollower,
            minPrice,
            maxPrice,
            region.stream().map(
                Region::valueOf
            ).collect(Collectors.toList()),
            keyword,
            sortKey
        );
    }
}

package com.mmm.clout.advertisementservice.advertisements.application.command;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;
import org.springframework.data.domain.Pageable;

@Getter
@AllArgsConstructor
public class SearchCondition {

    private Pageable pageable;
    private List<String> category;
    private List<String> platform;
    private Integer minAge;
    private Integer maxAge;
    private Integer minFollower;
    private Integer minPrice;
    private Integer maxPrice;
    private List<String> region;
    private String keyword;
    private String sortKey;
    public static SearchCondition from(
        Pageable pageable,
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
            pageable,
            category,
            platform,
            minAge,
            maxAge,
            minFollower,
            minPrice,
            maxPrice,
            region,
            keyword,
            sortKey
        );
    }
}

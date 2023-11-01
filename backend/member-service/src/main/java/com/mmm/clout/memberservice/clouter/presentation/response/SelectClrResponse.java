package com.mmm.clout.memberservice.clouter.presentation.response;

import com.mmm.clout.memberservice.clouter.domain.Clouter;
import com.mmm.clout.memberservice.common.Category;
import com.mmm.clout.memberservice.common.Region;
import com.mmm.clout.memberservice.common.entity.address.response.AddressResponse;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Getter;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

@Getter
@AllArgsConstructor
public class SelectClrResponse {

    @Schema(description = "클라우터 닉네임임")
    private String nickName;

    @Schema(description = "이름")
    private String name;

    @Schema(description = "생일")
    private LocalDate birthday;

    @Schema(description = "나이")
    private Integer age;

    @Schema(description = "전화번호")
    private String phoneNumber;

    @Schema(description = "개인 채널 리스트")
    private List<ChannelResponse> channelList;

    private HopeCostResponse hopeCost;

    @Schema(description = "네고 가능 여부")
    private boolean negoable;

    @Schema(description = "광고를 원하는 카테고리 목록")
    private List<Category> categoryList;

    @Schema(description = "광고를 희망하는 지역 목록")
    private List<Region> regionList;

    private AddressResponse address;

    public SelectClrResponse(Clouter clouter) {
        this.nickName = clouter.getNickName();
        this.name = clouter.getName();
        this.birthday = clouter.getBirthday();
        this.age = clouter.getAge();
        this.phoneNumber = clouter.getPhoneNumber();
        this.channelList = clouter.getChannelList()
            .stream().map(ChannelResponse::new).collect(Collectors.toList());
        this.hopeCost = new HopeCostResponse(clouter.getHopeCost());
        this.negoable = clouter.isNegoable();
        this.categoryList = clouter.getCategoryList();
        this.regionList = clouter.getRegioinList();
        this.address = new AddressResponse(clouter.getAddress());
    }

    public static SelectClrResponse from(Clouter clouter) {
        SelectClrResponse response = new SelectClrResponse(clouter);
        return response;
    }
}

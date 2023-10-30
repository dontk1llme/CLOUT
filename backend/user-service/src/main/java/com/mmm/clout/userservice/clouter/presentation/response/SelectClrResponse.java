package com.mmm.clout.userservice.clouter.presentation.response;

import com.mmm.clout.userservice.clouter.domain.Clouter;
import com.mmm.clout.userservice.common.entity.Category;
import com.mmm.clout.userservice.common.entity.FollowerScale;
import com.mmm.clout.userservice.common.entity.Platform;
import com.mmm.clout.userservice.common.entity.address.Address;
import com.mmm.clout.userservice.common.entity.address.response.AddressResponse;
import lombok.AllArgsConstructor;
import lombok.Getter;

import java.time.LocalDate;

@Getter
@AllArgsConstructor
public class SelectClrResponse {

    private String name;

    private AddressResponse address;

    private Category selectedCategory;

    private FollowerScale followerScale;

    private Platform platForm;

    private LocalDate birthday;

    private Integer age;

    public SelectClrResponse(Clouter clouter) {
        this.name = clouter.getName();
        this.address = new AddressResponse(clouter.getAddress());
        this.selectedCategory = clouter.getSelectedCategory();
        this.followerScale = clouter.getFollowerScale();
        this.platForm = clouter.getPlatForm();
        this.birthday = clouter.getBirthday();
        this.age = clouter.getAge();
    }

    public static SelectClrResponse from(Clouter clouter) {
        SelectClrResponse response = new SelectClrResponse(clouter);
        return response;
    }
}

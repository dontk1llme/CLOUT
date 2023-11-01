package com.mmm.clout.advertisementservice.apply.domain.provider;


import com.mmm.clout.advertisementservice.apply.domain.info.AdvertiserInfo;
import com.mmm.clout.advertisementservice.apply.domain.info.ClouterInfo;

public interface MemberProvider {

    AdvertiserInfo getAdvertiserInfoByMemberId(Long memberId);

    ClouterInfo getClouterInfoByMemberId(Long memberId);

}

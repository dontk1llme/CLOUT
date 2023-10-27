package com.mmm.clout.userservice.advertiser.application;

import com.mmm.clout.userservice.advertiser.application.command.CreateAdrCommand;
import com.mmm.clout.userservice.advertiser.domain.Advertiser;
import com.mmm.clout.userservice.advertiser.domain.CompanyInfo;
import com.mmm.clout.userservice.advertiser.domain.repository.AdvertiserRepository;
import com.mmm.clout.userservice.common.entity.Address;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
public class CreateAdvertiserProcessor {

    private final AdvertiserRepository advertisementRepository;

    @Transactional
    public Advertiser excute(CreateAdrCommand command) {
        Advertiser advertiser = Advertiser.create(
            command.getAdvertiserId(),
            command.getPwd(),
            new Address(command.getAddressCommand().getZipCode(),
                command.getAddressCommand().getMainAddress(),
                command.getAddressCommand().getDetailAddress()),
            new CompanyInfo(
                command.getCompanyInfoCommand().getCompanyName(),
                command.getCompanyInfoCommand().getRegNum(),
                command.getCompanyInfoCommand().getManagerName(),
                command.getCompanyInfoCommand().getManagerPhoneNumber())
            );
        return advertisementRepository.save(advertiser);
    }
}

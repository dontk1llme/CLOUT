package com.mmm.clout.contractservice.contract.application;

import com.mmm.clout.contractservice.contract.application.command.CreateContractCommand;
import com.mmm.clout.contractservice.contract.domain.Contract;
import com.mmm.clout.contractservice.contract.domain.info.SelectAdrInfo;
import com.mmm.clout.contractservice.contract.domain.info.SelectClrInfo;
import com.mmm.clout.contractservice.contract.domain.repository.ContractRepository;
import com.mmm.clout.contractservice.contract.domain.provider.MemberProvider;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@RequiredArgsConstructor
public class CreateContractProcessor {

    private final ContractRepository contractRepository;
    private final MemberProvider memberProvider;

    @Transactional
    public Contract execute(CreateContractCommand command) {
        SelectClrInfo clouter = memberProvider.selectClouter(command.getClouterId()).getBody();
        SelectAdrInfo advertiser = memberProvider.selectAdvertiser(command.getAdvertiserId()).getBody();
        Contract contract = command.toEntity(clouter, advertiser);
        return contractRepository.save(contract);
    }
}

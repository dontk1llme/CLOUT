package com.mmm.clout.contractservice.contract.application;

import com.mmm.clout.contractservice.contract.domain.Contract;
import com.mmm.clout.contractservice.contract.domain.exception.NotFoundContractException;
import com.mmm.clout.contractservice.contract.domain.provider.MemberProvider;
import com.mmm.clout.contractservice.contract.domain.provider.PointProvider;
import com.mmm.clout.contractservice.contract.domain.provider.dto.AddPointRequest;
import com.mmm.clout.contractservice.contract.domain.repository.ContractRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@RequiredArgsConstructor
public class UpdateStateContractProcessor {

    private final ContractRepository contractRepository;
    private final MemberProvider memberProvider;
    private final PointProvider pointProvider;

    @Transactional
    public Contract execute(Long id) {
        Contract contract = findContract(id);
        addContractCountList(contract);
        addClouterPoint(contract);
        contract.updateState();
        return contract;
    }

    private Contract findContract(Long id) {
        return contractRepository.findById(id)
                .orElseThrow(() -> new NotFoundContractException());
    }

    private List<Long> addContractCountList(Contract contract) {
        List<Long> idList = new ArrayList<>();
        idList.add(contract.getAdvertiserInfo().getAdvertiserId());
        idList.add(contract.getClouterInfo().getClouterId());
        memberProvider.addCount(idList, true);
        return idList;
    }

    private void addClouterPoint(Contract contract) {
        AddPointRequest request = new AddPointRequest(contract);
        pointProvider.add(request);
    }
}

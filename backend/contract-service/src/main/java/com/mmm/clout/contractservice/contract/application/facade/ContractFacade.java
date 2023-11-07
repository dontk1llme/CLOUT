package com.mmm.clout.contractservice.contract.application.facade;

import com.mmm.clout.contractservice.contract.application.*;
import com.mmm.clout.contractservice.contract.application.command.CreateContractCommand;
import com.mmm.clout.contractservice.contract.domain.Contract;
import com.mmm.clout.contractservice.contract.presentation.response.DeleteContractResponse;
import com.mmm.clout.contractservice.contract.presentation.response.UpdateRRNContractResponse;
import com.mmm.clout.contractservice.contract.presentation.response.UpdateStateContractResponse;
import lombok.AllArgsConstructor;
import lombok.Getter;
import org.springframework.stereotype.Service;

import java.util.List;

@Getter
@AllArgsConstructor
@Service
public class ContractFacade {

    private final CreateContractProcessor createContractProcessor;
    private final UpdateRRNContractProcessor updateRRNContractProcessor;
    private final UpdateStateContractProcessor updateStateContractProcessor;
    private final DeleteContractProcessor deleteContractProcessor;
    private final SelectContractProcessor selectContractProcessor;
    private final SelectAllContractClouterProcessor selectAllContractClouterProcessor;
    private final SelectAllContractAdvertiserProcessor selectAllContractAdvertiserProcessor;

    public Contract create(CreateContractCommand command) {
        return createContractProcessor.execute(command);
    }

    public Contract updateRRN(Long id, String residentRegistrationNumber) {
        return updateRRNContractProcessor.execute(id, residentRegistrationNumber);
    }

    public Contract updateState(Long id) {
        return updateStateContractProcessor.execute(id);
    }

    public Long delete(Long id) {
        return deleteContractProcessor.execute(id);
    }

    public Contract select(Long id) {
        return selectContractProcessor.execute(id);
    }

    public List<Contract> selectAllClouter(Long clouterId) {
        return selectAllContractClouterProcessor.execute(clouterId);
    }

    public List<Contract> selectAllAdvertiser(Long advertiserId) {
        return selectAllContractAdvertiserProcessor.execute(advertiserId);
    }
}

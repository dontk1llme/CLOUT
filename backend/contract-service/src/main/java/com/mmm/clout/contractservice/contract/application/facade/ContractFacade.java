package com.mmm.clout.contractservice.contract.application.facade;

import com.mmm.clout.contractservice.contract.application.*;
import com.mmm.clout.contractservice.contract.application.command.CreateContractCommand;
import com.mmm.clout.contractservice.contract.application.reader.ContractReader;
import com.mmm.clout.contractservice.contract.domain.Contract;
import com.mmm.clout.contractservice.contract.presentation.response.DeleteContractResponse;
import com.mmm.clout.contractservice.contract.presentation.response.UpdateRRNContractResponse;
import com.mmm.clout.contractservice.contract.presentation.response.UpdateStateContractResponse;
import lombok.AllArgsConstructor;
import lombok.Getter;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
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

    public Contract updateState(Long id, MultipartFile file) throws IOException {
        return updateStateContractProcessor.execute(id, file);
    }

    public Long delete(Long id) {
        return deleteContractProcessor.execute(id);
    }

    public Contract select(Long id) {
        return selectContractProcessor.execute(id);
    }

    public Page<ContractReader> selectAllClouter(Long clouterId, Pageable pageable) {
        return selectAllContractClouterProcessor.execute(clouterId, pageable);
    }

    public Page<ContractReader> selectAllAdvertiser(Long advertiserId, Pageable pageable) {
        return selectAllContractAdvertiserProcessor.execute(advertiserId, pageable);
    }
}

package com.mmm.clout.contractservice.contract.application.facade;

import com.mmm.clout.contractservice.contract.application.CreateContractProcessor;
import com.mmm.clout.contractservice.contract.application.command.CreateContractCommand;
import com.mmm.clout.contractservice.contract.domain.Contract;
import lombok.AllArgsConstructor;
import lombok.Getter;
import org.springframework.stereotype.Service;

@Getter
@AllArgsConstructor
@Service
public class ContractFacade {

    private final CreateContractProcessor createContractProcessor;

    public Contract create(CreateContractCommand command) {
        return createContractProcessor.execute(command);
    }

}

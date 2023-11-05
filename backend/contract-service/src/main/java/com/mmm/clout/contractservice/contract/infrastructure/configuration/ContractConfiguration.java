package com.mmm.clout.contractservice.contract.infrastructure.configuration;

import com.mmm.clout.contractservice.contract.application.CreateContractProcessor;
import com.mmm.clout.contractservice.contract.application.DeleteContractProcessor;
import com.mmm.clout.contractservice.contract.application.UpdateRRNContractProcessor;
import com.mmm.clout.contractservice.contract.domain.repository.ContractRepository;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ContractConfiguration {

    @Bean
    public CreateContractProcessor createContractProcessor(ContractRepository contractRepository) {
        return new CreateContractProcessor(contractRepository);
    }

    @Bean
    public UpdateRRNContractProcessor updateRRNContractProcessor(ContractRepository contractRepository) {
        return new UpdateRRNContractProcessor(contractRepository);
    }

    @Bean
    public DeleteContractProcessor deleteContractProcessor(ContractRepository contractRepository) {
        return new DeleteContractProcessor(contractRepository);
    }
}

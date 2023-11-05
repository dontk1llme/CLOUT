package com.mmm.clout.contractservice.contract.infrastructure.configuration;

import com.mmm.clout.contractservice.contract.application.*;
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
    public UpdateStateContractProcessor updateStateContractProcessor(ContractRepository contractRepository) {
        return new UpdateStateContractProcessor(contractRepository);
    }

    @Bean
    public DeleteContractProcessor deleteContractProcessor(ContractRepository contractRepository) {
        return new DeleteContractProcessor(contractRepository);
    }

    @Bean
    public SelectContractProcessor selectContractProcessor(ContractRepository contractRepository) {
        return new SelectContractProcessor(contractRepository);
    }
}

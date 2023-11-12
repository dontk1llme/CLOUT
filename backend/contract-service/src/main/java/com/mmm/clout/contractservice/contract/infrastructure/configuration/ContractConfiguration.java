package com.mmm.clout.contractservice.contract.infrastructure.configuration;

import com.mmm.clout.contractservice.contract.application.*;
import com.mmm.clout.contractservice.contract.domain.provider.MemberProvider;
import com.mmm.clout.contractservice.contract.domain.provider.PointProvider;
import com.mmm.clout.contractservice.contract.domain.repository.ContractRepository;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ContractConfiguration {

    @Bean
    public CreateContractProcessor createContractProcessor(
            ContractRepository contractRepository,
            MemberProvider memberProvider,
            PointProvider pointProvider
    ) {
        return new CreateContractProcessor(contractRepository, memberProvider, pointProvider);
    }

    @Bean
    public UpdateRRNContractProcessor updateRRNContractProcessor(ContractRepository contractRepository) {
        return new UpdateRRNContractProcessor(contractRepository);
    }

    @Bean
    public UpdateStateContractProcessor updateStateContractProcessor(
            ContractRepository contractRepository,
            MemberProvider memberProvider,
            PointProvider pointProvider
    ) {
        return new UpdateStateContractProcessor(contractRepository, memberProvider, pointProvider);
    }

    @Bean
    public DeleteContractProcessor deleteContractProcessor(
            ContractRepository contractRepository,
            PointProvider pointProvider
    ) {
        return new DeleteContractProcessor(contractRepository, pointProvider);
    }

    @Bean
    public SelectContractProcessor selectContractProcessor(ContractRepository contractRepository) {
        return new SelectContractProcessor(contractRepository);
    }

    @Bean
    public SelectAllContractClouterProcessor selectAllContractClouterProcessor(ContractRepository contractRepository) {
        return new SelectAllContractClouterProcessor(contractRepository);
    }

    @Bean
    public SelectAllContractAdvertiserProcessor selectAllContractAdvertiserProcessor(ContractRepository contractRepository) {
        return new SelectAllContractAdvertiserProcessor(contractRepository);
    }
}

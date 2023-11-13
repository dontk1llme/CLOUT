package com.mmm.clout.memberservice.clouter.application.facade;

import com.mmm.clout.memberservice.clouter.application.*;
import com.mmm.clout.memberservice.clouter.application.command.CreateClrCommand;
import com.mmm.clout.memberservice.clouter.application.command.SearchCondition;
import com.mmm.clout.memberservice.clouter.application.command.UpdateClrCommand;
import com.mmm.clout.memberservice.clouter.application.reader.ClouterReader;
import com.mmm.clout.memberservice.clouter.domain.Clouter;
import lombok.AllArgsConstructor;
import lombok.Getter;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Getter
@AllArgsConstructor
@Service
public class ClouterFacade {

    private final CreateClouterProcessor createClouterProcessor;
    private final UpdateClouterProcessor updateClouterProcessor;
    private final SelectClouterProcessor selectClouterProcessor;
    private final SelectClouterForContractProcessor selectClouterForContractProcessor;
    private final SelectTop10ClouterProcessor selectTop10ClouterProcessor;
    private final SearchClouterListProcessor searchClouterListProcessor;

    public Clouter create(CreateClrCommand command) {
        return createClouterProcessor.execute(command);
    }

    public Clouter update(UpdateClrCommand command) { return updateClouterProcessor.execute(command); }

    public ClouterReader select(Long clouterId) { return selectClouterProcessor.execute(clouterId); }

    public ClouterReader selectForContract(Long clouterId) { return selectClouterForContractProcessor.execute(clouterId); }

    public List<ClouterReader> selectTop10() {
        return selectTop10ClouterProcessor.execute();
    }

    public Page<ClouterReader> search(Pageable pageable, SearchCondition condition) {
        return searchClouterListProcessor.execute(pageable, condition);
    }
}

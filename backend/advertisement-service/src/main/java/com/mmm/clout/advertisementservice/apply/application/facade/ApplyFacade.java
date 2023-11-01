package com.mmm.clout.advertisementservice.apply.application.facade;

import com.mmm.clout.advertisementservice.apply.application.CancelApplyProcessor;
import com.mmm.clout.advertisementservice.apply.application.CreateApplyProcessor;
import com.mmm.clout.advertisementservice.apply.application.ReadAllApplyProcessor;
import com.mmm.clout.advertisementservice.apply.application.command.CreateApplyCommand;
import com.mmm.clout.advertisementservice.apply.application.reader.ClouterApplyListReader;
import com.mmm.clout.advertisementservice.apply.domain.Apply;
import com.mmm.clout.advertisementservice.apply.domain.Apply.ApplyStatus;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ApplyFacade {

    private final CreateApplyProcessor createApplyProcessor;
    private final CancelApplyProcessor cancelApplyProcessor;
    private final ReadAllApplyProcessor readAllApplyProcessor;

    public Apply create(CreateApplyCommand command) {
        return createApplyProcessor.execute(command);
    }

    public void cancel(Long applyId) {
        cancelApplyProcessor.execute(applyId);
    }

    public List<ClouterApplyListReader> getAllByApplyStatus(Long clouterId, ApplyStatus type) {
        return readAllApplyProcessor.execute(clouterId, type);
    }
}

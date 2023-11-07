package com.mmm.clout.advertisementservice.apply.application.facade;

import com.mmm.clout.advertisementservice.apply.application.CancelApplyProcessor;
import com.mmm.clout.advertisementservice.apply.application.CreateApplyProcessor;
import com.mmm.clout.advertisementservice.apply.application.ReadAllApplyProcessor;
import com.mmm.clout.advertisementservice.apply.application.ReadApplicantsByCampaignProcessor;
import com.mmm.clout.advertisementservice.apply.application.GetApplyProcessor;
import com.mmm.clout.advertisementservice.apply.application.SelectApplyForContractProcessor;
import com.mmm.clout.advertisementservice.apply.application.command.CreateApplyCommand;
import com.mmm.clout.advertisementservice.apply.application.reader.ApplicantListByCampaignReader;
import com.mmm.clout.advertisementservice.apply.application.reader.ApplyListByClouterReader;
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
    private final ReadApplicantsByCampaignProcessor readApplicantsByCampaignProcessor;
    private final GetApplyProcessor getApplyProcessor;
    private final SelectApplyForContractProcessor selectApplyForContractProcessor;

    public Apply create(CreateApplyCommand command) {
        return createApplyProcessor.execute(command);
    }

    public void cancel(Long applyId) {
        cancelApplyProcessor.execute(applyId);
    }

    public List<ApplyListByClouterReader> getAllByApplyStatus(Long clouterId, String type) {
        return readAllApplyProcessor.execute(clouterId, type);
    }

    public List<ApplicantListByCampaignReader> getApplicantList(Long advertisementId) {
        return readApplicantsByCampaignProcessor.execute(advertisementId);
    }

    public String getMessage(Long applyId) {
        return getApplyProcessor.execute(applyId).getApplyMessage();
    }

    public void selectForContract(Long applyId) {
        selectApplyForContractProcessor.execute(applyId);
    }
}

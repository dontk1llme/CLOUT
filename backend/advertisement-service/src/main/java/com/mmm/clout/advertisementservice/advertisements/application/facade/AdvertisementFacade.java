package com.mmm.clout.advertisementservice.advertisements.application.facade;

import com.mmm.clout.advertisementservice.advertisements.application.CreateCampaignProcessor;
import com.mmm.clout.advertisementservice.advertisements.application.DeleteCampaignProcessor;
import com.mmm.clout.advertisementservice.advertisements.application.GetCampaignProcessor;
import com.mmm.clout.advertisementservice.advertisements.application.UpdateCampaignProcessor;
import com.mmm.clout.advertisementservice.advertisements.application.command.CreateCampaignCommand;
import com.mmm.clout.advertisementservice.advertisements.application.command.UpdateCampaignCommand;
import com.mmm.clout.advertisementservice.advertisements.application.reader.CampaignReader;
import com.mmm.clout.advertisementservice.advertisements.domain.Campaign;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AdvertisementFacade {

    private final CreateCampaignProcessor createCampaignProcessor;
    private final UpdateCampaignProcessor updateCampaignProcessor;
    private final DeleteCampaignProcessor deleteCampaignProcessor;
    private final GetCampaignProcessor getCampaignProcessor;


    public Campaign create(CreateCampaignCommand command) {
        return createCampaignProcessor.execute(command);
    }

    public Campaign update(Long advertisementId, UpdateCampaignCommand command) {
        return updateCampaignProcessor.execute(advertisementId, command);
    }

    public void delete(Long advertisementId) {
        deleteCampaignProcessor.execute(advertisementId);
    }

    public CampaignReader get(Long advertisementId) {
        return getCampaignProcessor.execute(advertisementId);
    }
}

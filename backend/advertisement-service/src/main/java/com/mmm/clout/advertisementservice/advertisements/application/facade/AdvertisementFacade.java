package com.mmm.clout.advertisementservice.advertisements.application.facade;

import com.mmm.clout.advertisementservice.advertisements.application.CreateCampaignProcessor;
import com.mmm.clout.advertisementservice.advertisements.application.DeleteCampaignProcessor;
import com.mmm.clout.advertisementservice.advertisements.application.EndCampaignProcessor;
import com.mmm.clout.advertisementservice.advertisements.application.GetCampaignListByAdvertiser;
import com.mmm.clout.advertisementservice.advertisements.application.GetCampaignProcessor;
import com.mmm.clout.advertisementservice.advertisements.application.GetTop10CampaignListProcessor;
import com.mmm.clout.advertisementservice.advertisements.application.SearchCampaignListProcessor;
import com.mmm.clout.advertisementservice.advertisements.application.UpdateCampaignProcessor;
import com.mmm.clout.advertisementservice.advertisements.application.command.CreateCampaignCommand;
import com.mmm.clout.advertisementservice.advertisements.application.command.UpdateCampaignCommand;
import com.mmm.clout.advertisementservice.advertisements.application.reader.CampaignDto;
import com.mmm.clout.advertisementservice.advertisements.application.reader.CampaignListReader;
import com.mmm.clout.advertisementservice.advertisements.application.reader.CampaignReader;
import com.mmm.clout.advertisementservice.advertisements.domain.Campaign;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AdvertisementFacade {

    private final CreateCampaignProcessor createCampaignProcessor;
    private final UpdateCampaignProcessor updateCampaignProcessor;
    private final DeleteCampaignProcessor deleteCampaignProcessor;
    private final GetCampaignProcessor getCampaignProcessor;
    private final GetTop10CampaignListProcessor getTop10CampaignListProcessor;
    private final GetCampaignListByAdvertiser getCampaignListByAdvertiserProcessor;
    private final EndCampaignProcessor endCampaignProcessor;
    private final SearchCampaignListProcessor searchCampaignListProcessor;

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

    public List<CampaignReader> getTop10() {
        return getTop10CampaignListProcessor.execute();
    }

    public CampaignListReader getAllCampaignsByAdvertisers(Long advertiserId, Pageable pageable) {
        return getCampaignListByAdvertiserProcessor.execute(advertiserId, pageable);
    }

    public Long end(Long advertisementId) {
        return endCampaignProcessor.execute(advertisementId);
    }


    public List<CampaignDto> search(Pageable pageable, List<String> category, List<String> platform, Integer minAge, Integer maxAge, Integer minFollower, Integer minPrice,
        Integer maxPrice, List<String> region, String keyword, String sort) {
        return searchCampaignListProcessor.execute(pageable, category, platform, minAge, maxAge, minFollower, minPrice, maxPrice, region, keyword, sort);
    }
}

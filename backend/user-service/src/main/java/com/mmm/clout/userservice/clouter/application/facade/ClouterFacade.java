package com.mmm.clout.userservice.clouter.application.facade;

import com.mmm.clout.userservice.clouter.application.CreateClouterProcessor;
import com.mmm.clout.userservice.clouter.application.SelectClouterProcessor;
import com.mmm.clout.userservice.clouter.application.UpdateClouterProcessor;
import com.mmm.clout.userservice.clouter.application.command.CreateClrCommand;
import com.mmm.clout.userservice.clouter.application.command.UpdateClrCommand;
import com.mmm.clout.userservice.clouter.domain.Clouter;
import com.mmm.clout.userservice.clouter.presentation.response.SelectClrResponse;
import lombok.AllArgsConstructor;
import lombok.Getter;
import org.springframework.stereotype.Service;

@Getter
@AllArgsConstructor
@Service
public class ClouterFacade {

    private final CreateClouterProcessor createClouterProcessor;
    private final UpdateClouterProcessor updateClouterProcessor;
    private final SelectClouterProcessor selectClouterProcessor;

    public Clouter create(CreateClrCommand command) {
        return createClouterProcessor.execute(command);
    }

    public Clouter update(UpdateClrCommand command) { return updateClouterProcessor.execute(command); }

    public Clouter select(Long clouterId) { return selectClouterProcessor.execute(clouterId); }
}

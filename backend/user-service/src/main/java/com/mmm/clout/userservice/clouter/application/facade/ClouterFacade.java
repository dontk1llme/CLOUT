package com.mmm.clout.userservice.clouter.application.facade;

import com.mmm.clout.userservice.clouter.application.CreateClouterProcessor;
import com.mmm.clout.userservice.clouter.application.UpdateClouterProcessor;
import com.mmm.clout.userservice.clouter.application.command.CreateClrCommand;
import com.mmm.clout.userservice.clouter.application.command.UpdateClrCommand;
import com.mmm.clout.userservice.clouter.domain.Clouter;
import lombok.AllArgsConstructor;
import lombok.Getter;
import org.springframework.stereotype.Service;

@Getter
@AllArgsConstructor
@Service
public class ClouterFacade {

    private final CreateClouterProcessor createClouterProcessor;
    private final UpdateClouterProcessor updateClouterProcessor;

    public Clouter create(CreateClrCommand command) {
        return createClouterProcessor.execute(command);
    }

    public Clouter update(UpdateClrCommand command) { return updateClouterProcessor.execute(command);
    }
}

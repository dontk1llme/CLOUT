package com.mmm.clout.advertisementservice.apply.application;

import com.mmm.clout.advertisementservice.apply.application.command.CreateApplyCommand;
import com.mmm.clout.advertisementservice.apply.domain.Apply;
import com.mmm.clout.advertisementservice.apply.domain.repository.ApplyRepository;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class CreateApplyProcessor {

    private final ApplyRepository applyRepository;

    public Apply execute(CreateApplyCommand command) {
        return null;
    }
}

package com.mmm.clout.memberservice.clouter.application;

import com.mmm.clout.memberservice.clouter.application.reader.ClouterReader;
import com.mmm.clout.memberservice.clouter.domain.Clouter;
import com.mmm.clout.memberservice.clouter.domain.repository.ClouterRepository;
import com.mmm.clout.memberservice.image.domain.Image;
import com.mmm.clout.memberservice.image.domain.repository.ImageRepository;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
public class SelectClouterProcessor {

    private final ClouterRepository clouterRepository;
    private final ImageRepository imageRepository;

    @Transactional
    public ClouterReader execute(Long clouterId) {
        Clouter clouter = clouterRepository.findById(clouterId);
        List<Image> images = imageRepository.findByMemberId(clouterId);
        ClouterReader reader = new ClouterReader(clouter, images);
        return reader;
    }
}

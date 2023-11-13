package com.mmm.clout.memberservice.clouter.application;

import com.mmm.clout.memberservice.advertiser.domain.Advertiser;
import com.mmm.clout.memberservice.clouter.application.command.CreateClrCommand;
import com.mmm.clout.memberservice.clouter.domain.Clouter;
import com.mmm.clout.memberservice.clouter.domain.repository.ClouterRepository;
import com.mmm.clout.memberservice.clouter.domain.exception.ClrIdDuplicateException;
import com.mmm.clout.memberservice.image.domain.FileUploader;
import com.mmm.clout.memberservice.image.domain.Image;
import com.mmm.clout.memberservice.image.domain.repository.ImageRepository;
import com.mmm.clout.memberservice.member.domain.Member;
import com.mmm.clout.memberservice.member.domain.info.CreatePointRequest;
import com.mmm.clout.memberservice.member.domain.provider.PointProvider;
import com.mmm.clout.memberservice.member.domain.repository.MemberRepository;
import com.mmm.clout.memberservice.star.domain.Star;
import com.mmm.clout.memberservice.star.domain.repository.StarRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RequiredArgsConstructor
public class CreateClouterProcessor {

    private final ClouterRepository clouterRepository;
    private final MemberRepository memberRepository;
    private final BCryptPasswordEncoder encoder;
    private final StarRepository starRepository;
    private final PointProvider pointProvider;
    private final FileUploader fileUploader;
    private final ImageRepository imageRepository;

    @Transactional
    public Clouter execute(CreateClrCommand command, List<MultipartFile> files) throws Exception {
        checkUserId(command.getUserId());
        Clouter clouter = command.toEntity();
        clouter.changePwd(encoder.encode(clouter.getPwd()));
        Clouter savedClouter = clouterRepository.save(clouter);
        initStar(savedClouter);
        initPoint(savedClouter);

        //file uploader
        for(MultipartFile multipartFile : files) {
            String originalName = multipartFile.getOriginalFilename();
            String uploadedPath = fileUploader.upload(multipartFile, savedClouter.getId());
            Image image = Image.create(
                    savedClouter,
                    originalName,
                    "https://yangkidsbucket.s3.ap-northeast-2.amazonaws.com/" + uploadedPath,
                    uploadedPath
            );
            imageRepository.save(image);
        }
        return savedClouter;
    }

    private void initPoint(Clouter savedClouter) {
        CreatePointRequest request = new CreatePointRequest(savedClouter.getId());
        pointProvider.create(request);
    }


    private Star initStar(Member member) {
        return starRepository.save(Star.init(member));
    }

    private boolean checkUserId(String userId) {
        Member findMember = memberRepository.findByUserId(userId).orElse(null);
        if (findMember == null) {
            return true;
        } else {
            throw new ClrIdDuplicateException();
        }
    }
}

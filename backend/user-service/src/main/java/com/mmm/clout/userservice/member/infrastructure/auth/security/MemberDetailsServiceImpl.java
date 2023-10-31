package com.mmm.clout.userservice.member.infrastructure.auth.security;
import com.mmm.clout.userservice.member.domain.Member;
import com.mmm.clout.userservice.member.domain.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class MemberDetailsServiceImpl implements UserDetailsService {

    private final MemberRepository memberRepository;

    @Override
    public MemberDetailsImpl loadUserByUsername(String userId) throws UsernameNotFoundException {
        Member findMember = memberRepository.findByUserId(userId)
                .orElseThrow(() -> new UsernameNotFoundException("Can't find user with this email. -> " + userId));

        if(findMember != null){
            MemberDetailsImpl userDetails = new MemberDetailsImpl(findMember);
            return  userDetails;
        }

        return null;
    }
}

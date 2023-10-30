package com.mmm.clout.userservice.user.domain.security;
import com.mmm.clout.userservice.member.domain.Member;
import com.mmm.clout.userservice.user.domain.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class UserDetailsServiceImpl implements UserDetailsService {

    private final UserRepository userRepository;

    @Override
    public UserDetailsImpl loadUserByUsername(String userId) throws UsernameNotFoundException {
        Member findMember = userRepository.findByUserId(userId)
                .orElseThrow(() -> new UsernameNotFoundException("Can't find user with this email. -> " + userId));

        if(findMember != null){
            UserDetailsImpl userDetails = new UserDetailsImpl(findMember);
            return  userDetails;
        }

        return null;
    }
}

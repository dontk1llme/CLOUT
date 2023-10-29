package com.mmm.clout.userservice.user.presentation;

import com.mmm.clout.userservice.user.domain.dto.RequestUserDto;
import com.mmm.clout.userservice.user.domain.dto.UserDTO;
import com.mmm.clout.userservice.user.domain.service.AuthService;
import com.mmm.clout.userservice.user.domain.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/users")
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;
    private final AuthService authService;

    @GetMapping
    public ResponseEntity<List<UserDTO>> getUsers() {
        List<UserDTO> users = userService.getUsers();
        return ResponseEntity.status(HttpStatus.OK).body(users);
    }

    @GetMapping("/user")
    public ResponseEntity<UserDTO> getUser(@RequestHeader("Authorization") String accessToken) {
        Long id = authService.extractID(accessToken);
        UserDTO findUser = userService.getUserById(id);
        return ResponseEntity.status(HttpStatus.OK).body(findUser);
    }

    @PostMapping("/password")
    public ResponseEntity updateUser(@RequestBody RequestUserDto dto) {
        userService.updateUser(dto);
        return ResponseEntity.ok().build();
    }
}

package com.hangout.user;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;
import java.util.UUID;

public interface UserRepository extends JpaRepository<User, UUID> {
    Optional<User> findByEmail(String email);
    Optional<User> findById(UUID id);
    Optional<User> findByOAuthProvider(String oAuthProvider, String oAuthProviderID);
    Boolean existsByEmail(String email);
}

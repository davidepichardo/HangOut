package com.hangout.user;

import jakarta.persistence.Entity;
import jakarta.persistence.Column; 
import jakarta.persistence.Id;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Table;

import java.time.Instant;
import java.time.LocalDate;
import java.util.UUID;

@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "id", nullable = false)
    private UUID id;

    @Column(name = "email", nullable = false, unique = true)
    private String email;

    @Column(name = "password_hash", nullable = false)
    private String passwordHash;

    @Column(name = "birth_date", nullable = false)
    private LocalDate birthDate;

    @Column(name = "is_verified", nullable = false)
    private boolean isVerified;

    @Column(name = "is_active", nullable = false)
    private boolean isActive;

    @Column(name = "created_at", nullable = false)
    private Instant creationDate; 

    @Column(name = "updated_at")
    private Instant updatedDate;


    public User() {
    }

    public User(String email, String passwordHash, LocalDate birthDate) {
        this.email = email;
        this.passwordHash = passwordHash;
        this.birthDate = birthDate;
    }

    public UUID getId() {
        return id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return passwordHash;
    }

    public void setPasswordHash(String passwordHash) {
        this.passwordHash = passwordHash;
    }

    public LocalDate getBirthDate() {
        return birthDate;
    }

    @PrePersist
    protected void onCreate() {
        this.creationDate = Instant.now();
    }

    public Instant getCreationDate() {
        return creationDate;
    }

    @PreUpdate
    protected void onUpdate() {
        this.updatedDate = Instant.now();
    }

    public Instant getUpdatedDate() {
        return updatedDate;
    }

    public Boolean getVerificationStatus() {
        return isVerified;
    }

    public void setVerificationStatus(boolean isVerified) {
        this.isVerified = isVerified;
    }

    public Boolean getActivityStatus() {
        return isActive;
    }

    public void setActivityStatus(boolean isActive) {
        this.isActive = isActive;
    }
}
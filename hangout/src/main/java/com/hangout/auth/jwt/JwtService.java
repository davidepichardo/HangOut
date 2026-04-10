package com.hangout.auth.jwt;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Value;


import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.security.Keys;

import java.time.Duration;
import java.time.Instant;

@Service
public class JwtService {

    private static final Duration JWT_TOKEN_VALIDITY = Duration.ofMinutes(30); 
    @Value("${jwt.secret}")
    private String secret; 

    public String generateToken(String email) {
        final Instant now = Instant.now(); 
        return Jwts.builder().subject(email)
                .issuedAt(java.util.Date.from(now))
                .expiration(java.util.Date.from(now.plus(JWT_TOKEN_VALIDITY)))
                .signWith(Keys.hmacShaKeyFor(secret.getBytes()))
                .compact();
    } 

    public String extractEmail(String token) {
        Claims claims = Jwts.parser()
        .verifyWith(Keys.hmacShaKeyFor(secret.getBytes()))
        .build().parseSignedClaims(token).getPayload();

        return claims.getSubject();
    }

    public Boolean validateToken(String email, String token) { 
        final String extractedEmail = extractEmail(token); 
        return (extractedEmail.equals(email));
    }
}
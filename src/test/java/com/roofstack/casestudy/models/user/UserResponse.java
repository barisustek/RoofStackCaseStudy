package com.roofstack.casestudy.models.user;
import java.util.UUID;
public record UserResponse(UUID id,
                           String username,
                           String firstName,
                           String lastName,
                           Boolean isActive) {
}

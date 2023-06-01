package com.roofstack.casestudy.models.user;

public record UserRequest(String firstName,
                          String lastName,
                          String username,
                          String password,
                          Boolean isActive) {
}

package com.roofstack.casestudy.models.user;

import io.cucumber.core.internal.com.fasterxml.jackson.databind.annotation.JsonSerialize;

@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
public record UserRequest(String firstName,
                          String lastName,
                          String username,
                          String password,
                          Boolean isActive) {
}

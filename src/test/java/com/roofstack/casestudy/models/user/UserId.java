package com.roofstack.casestudy.models.user;

import io.cucumber.core.internal.com.fasterxml.jackson.annotation.JsonInclude;
import io.cucumber.core.internal.com.fasterxml.jackson.databind.annotation.JsonSerialize;

import java.util.UUID;
@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
public record UserId(UUID userId, Boolean isActive) {

}

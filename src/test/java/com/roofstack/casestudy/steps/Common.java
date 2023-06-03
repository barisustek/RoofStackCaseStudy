package com.roofstack.casestudy.steps;

import com.roofstack.casestudy.models.user.UserId;
import com.roofstack.casestudy.models.user.UserRequest;
import com.roofstack.casestudy.models.user.UserResponse;
import io.cucumber.java.DataTableType;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import org.json.JSONException;
import org.junit.jupiter.api.Assertions;
import org.skyscreamer.jsonassert.JSONAssert;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import static com.roofstack.casestudy.handlers.CellHandler.cellTransform;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.fail;

public class Common {

    Settings settings;

    public Common(Settings settings) {

        this.settings = settings;

    }

    @DataTableType
    public UserRequest createUserRequest(Map<String, String> table) {

        return new UserRequest(cellTransform(table.get("firstName")),
                cellTransform(table.get("lastName")),
                cellTransform(table.get("username")),
                cellTransform(table.get("password")),
                table.get("isActive") != null ? Boolean.parseBoolean(table.get("isActive")) : null);

    }

    @DataTableType
    public UserResponse createUserResponse(Map<String, String> table) {

        return new UserResponse(UUID.fromString(table.get("id")),
                cellTransform(table.get("username")),
                cellTransform(table.get("firstName")),
                cellTransform(table.get("lastName")),
                Boolean.valueOf(cellTransform(String.valueOf(table.get("isActive") != null ?
                                              Boolean.parseBoolean(table.get("isActive")) : null))));

    }

    @DataTableType
    public UserId createUserId(Map<String, String> table) {

        return new UserId(UUID.fromString(table.get("userId")),
                Boolean.valueOf(cellTransform(String.valueOf(table.get("isActive") != null ?
                                              Boolean.parseBoolean(table.get("isActive")) : null))));

    }

    @Then("^Http status code should be ([1-5][0-9][0-9])$")
    public void statusCodeShouldBe(int statusCode) {

        assertEquals(settings.restHandler.getStatusCode(), statusCode);

    }

    @And("Users should return")
    public void inResponseBodyUserIdShouldBe(UserResponse userResponse) {

        try {

            JSONAssert.assertEquals(settings.restHandler.getResponseBody(),
                    settings.jsonHandler.serializeRecord(userResponse),
                    false);

        } catch (JSONException e) {

            fail("Assertion error in given JSON");

        }

    }

    @Then("^Http status code should be ([1-5][0-9][0-9]) and returns (.*) in responseBody$")
    public void httpStatusCodeShouldBeAndReturnsErrorMessagesInResponseBody(int statusCode, String errorMessage) {

        Assertions.assertEquals(errorMessage, settings.restHandler.getValueFromPath("errorMessages"), "Error message is different than expected");
        Assertions.assertEquals(statusCode, settings.restHandler.getStatusCode(), "Http status code is different than expected");

    }

    @And("Users List should return")
    public void usersListShouldReturn(List<UserResponse> userResponse) {

        try {

            JSONAssert.assertEquals(settings.restHandler.getResponseBody(),
                    settings.jsonHandler.serializeRecordList(userResponse),
                    false);

        } catch (JSONException e) {

            fail("Assertion error in given JSON");

        }

    }

    @And("UserId should return")
    public void useridShouldReturn(UserId userId) {

        try {

            JSONAssert.assertEquals(settings.restHandler.getResponseBody(),
                    settings.jsonHandler.serializeRecord(userId),
                    false);

        } catch (JSONException e) {

            fail("Assertion error in given JSON");

        }
    }
}
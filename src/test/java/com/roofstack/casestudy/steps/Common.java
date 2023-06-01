package com.roofstack.casestudy.steps;

import com.roofstack.casestudy.models.user.UserRequest;
import com.roofstack.casestudy.models.user.UserResponse;
import io.cucumber.java.DataTableType;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import org.json.JSONException;
import org.junit.jupiter.api.Assertions;
import org.skyscreamer.jsonassert.JSONAssert;

import java.util.Map;
import java.util.UUID;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.fail;

public class Common {

    Settings settings ;

    public Common(Settings settings){

        this.settings = settings ;

    }

    @DataTableType
    public UserRequest createUserRequest(Map<String,String> table){

        return new UserRequest(table.get("firstName"),
                table.get("lastName"),
                table.get("username"),
                table.get("password"),
                Boolean.parseBoolean(table.get("isActive")));

    }

    @DataTableType
    public UserResponse createUserResponse(Map<String,String> table){

        return new UserResponse(UUID.fromString(table.get("userId")),
                table.get("username"),
                table.get("firstName"),
                table.get("lastName"),
                Boolean.parseBoolean(table.get("isActive")));

    }

    @Then("^Http status code should be ([1-5][0-9][0-9])$")
    public void statusCodeShouldBe(int statusCode) {

        assertEquals(settings.requestHandler.getStatusCode(), statusCode);

    }

    @And("Users should return")
    public void inResponseBodyUserIdShouldBe(UserResponse userResponse) {

        try {

            JSONAssert.assertEquals(settings.requestHandler.getResponseBody(),
                    settings.jsonHandler.serializeRecord(userResponse),
                    true);

        }catch (JSONException e){

            fail("Assertion error in given JSON");

        }

    }

    @Then("^Http status code should be ([1-5][0-9][0-9]) and returns (.*) in responseBody$")
    public void httpStatusCodeShouldBeAndReturnsErrorMessagesInResponseBody(int statusCode, String errorMessage) {

        Assertions.assertEquals(errorMessage,settings.requestHandler.getValueFromPath("errorMessages"),"Error message is different than expected");
        Assertions.assertEquals(statusCode,settings.requestHandler.getStatusCode(),"Http status code is different than expected");

    }
}
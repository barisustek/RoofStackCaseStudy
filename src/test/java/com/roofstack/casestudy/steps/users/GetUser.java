package com.roofstack.casestudy.steps.users;

import com.roofstack.casestudy.steps.Settings;
import io.cucumber.java.en.When;

public class GetUser {

    Settings settings;

    public GetUser(Settings settings){

        this.settings = settings;

    }

    @When("^GET (.*) endpoint is called without parameters$")
    public void getEndpointCalledWithoutParameters(String endpoint){

        settings.requestHandler.get(endpoint);

    }

    @When("^GET (.*) endpoint is called$")
    public void getEndpointCalled(String endpoint){

        settings.requestHandler.get(endpoint);

    }

}

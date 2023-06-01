package com.roofstack.casestudy.steps.users;

import com.roofstack.casestudy.models.user.UserRequest;
import com.roofstack.casestudy.steps.Settings;
import io.cucumber.java.en.When;

public class SwitchUser {

    Settings settings;

    public SwitchUser(Settings settings){

        this.settings = settings;

    }

    @When("^PATCH (.*) endpoint is called with parameters$")
    public void postEndpointCalledWithParameters(String endpoint, UserRequest userRequest){

        settings.requestHandler.patch(endpoint,
                                      userRequest);

    }

}

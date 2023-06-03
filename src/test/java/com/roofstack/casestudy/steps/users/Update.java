package com.roofstack.casestudy.steps.users;

import com.roofstack.casestudy.models.user.UserRequest;
import com.roofstack.casestudy.steps.Settings;
import io.cucumber.java.en.When;

public class Update {

    Settings settings;

    public Update(Settings settings){

        this.settings = settings;

    }

    @When("^PUT (.*) endpoint is called with parameters$")
    public void putEndpointCalledWithParameters(String endpoint, UserRequest userRequest){

        settings.restHandler.put(endpoint,
                                    userRequest);

    }

}

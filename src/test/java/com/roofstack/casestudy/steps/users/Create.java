package com.roofstack.casestudy.steps.users;

import com.roofstack.casestudy.models.user.UserRequest;
import com.roofstack.casestudy.steps.Settings;
import io.cucumber.java.en.When;

public class Create {

    Settings settings ;

    public Create(Settings settings){

        this.settings = settings;

    }

    @When("^POST (.*) endpoint is called with parameters$")
    public void postEndpointCalledWithParameters(String endpoint,UserRequest userRequest){

        settings.requestHandler.post(endpoint,
                                     userRequest);

    }

}

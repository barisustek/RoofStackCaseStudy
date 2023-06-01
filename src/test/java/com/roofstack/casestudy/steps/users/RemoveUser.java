package com.roofstack.casestudy.steps.users;

import com.roofstack.casestudy.steps.Settings;
import io.cucumber.java.en.When;

public class RemoveUser {

    Settings settings ;

    public RemoveUser(Settings settings){

        this.settings = settings;

    }

    @When("^DELETE (.*) endpoint is called$")
    public void getEndpointCalled(String endpoint){

        settings.requestHandler.delete(endpoint);

    }

}

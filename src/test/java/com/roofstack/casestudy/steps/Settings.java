package com.roofstack.casestudy.steps;

import com.roofstack.casestudy.handlers.ConfigHandler;
import com.roofstack.casestudy.handlers.JsonHandler;
import com.roofstack.casestudy.handlers.RestHandler;

public class Settings {

    public ConfigHandler configHandler = new ConfigHandler();
    public JsonHandler jsonHandler = new JsonHandler();
    public RestHandler restHandler = new RestHandler(configHandler.getBaseUrl());

}

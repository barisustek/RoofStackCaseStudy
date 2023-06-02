package com.roofstack.casestudy;

import org.junit.platform.suite.api.ConfigurationParameter;
import org.junit.platform.suite.api.IncludeEngines;
import org.junit.platform.suite.api.SelectClasspathResource;
import org.junit.platform.suite.api.Suite;

import static io.cucumber.core.options.Constants.*;

@Suite
@IncludeEngines("cucumber")
@SelectClasspathResource("com.roofstack.casestudy")
@ConfigurationParameter(key = PLUGIN_PROPERTY_NAME,value = "pretty")
@ConfigurationParameter(key = PLUGIN_PROPERTY_NAME,value = "json:target/cucumber-report/cucumber.json, html:target/cucumber-report/cucumber.html")
@ConfigurationParameter(key = GLUE_PROPERTY_NAME, value = "com.roofstack.casestudy.steps")
@ConfigurationParameter(key = FEATURES_PROPERTY_NAME, value = "src/test/resources/user")
public class CucumberTest {
}

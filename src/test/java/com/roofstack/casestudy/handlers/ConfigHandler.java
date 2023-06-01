package com.roofstack.casestudy.handlers;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

public class ConfigHandler {

    private final Properties properties;

    public ConfigHandler() {

        BufferedReader reader;
        String propertyFilePath = "src/test/resources/config.properties";

        try{

            reader = new BufferedReader( new FileReader(propertyFilePath));
            properties = new Properties();
            try {

                properties.load(reader);
                reader.close();

            }catch (IOException e){
                e.printStackTrace();
            }

        }catch (FileNotFoundException e){

            throw new RuntimeException("Config file not found" + propertyFilePath);

        }

    }

    public String getBaseUrl() {

        return properties.getProperty("base.url");

    }

}

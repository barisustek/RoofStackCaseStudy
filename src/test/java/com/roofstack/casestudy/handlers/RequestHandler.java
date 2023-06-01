package com.roofstack.casestudy.handlers;

import io.restassured.RestAssured;
import io.restassured.path.json.JsonPath;
import io.restassured.response.ResponseOptions;

import java.util.List;
import java.util.Map;

public class RequestHandler {
    public static ResponseOptions responseOptions;

    public RequestHandler(String baseUrl){

        RestAssured.baseURI = baseUrl;

    }

    public void post(String endpoint, Record requestContent) {
        responseOptions = RestAssured
                .given()
                .log().all(true)
                .headers("Accept","application/json")
                .body(requestContent)
                .post(endpoint);
    }

    public void put(String endpoint, Record requestContent) {
        responseOptions = RestAssured
                .given()
                .log().all(true)
                .headers("Accept","application/json")
                .body(requestContent)
                .put(endpoint);
    }

    public void get(String endpoint) {
        responseOptions = RestAssured
                .given()
                .log().all(true)
                .header("Accept","application/json")
                .get(endpoint);
    }

    public void delete(String endpoint) {
        responseOptions = RestAssured
                .given()
                .log().all(true)
                .delete(endpoint);
    }

    public void patch(String endpoint, Record params){
        responseOptions = RestAssured
                .given()
                .log().all(true)
                .body(params)
                .patch(endpoint);
    }

    public int getStatusCode(){

        return responseOptions.statusCode();

    }

    public String getResponseBody(){

        return responseOptions.body().toString();

    }

    public String getValueFromPath(String path) {

        JsonPath jsonPath = responseOptions.body().jsonPath();
        return jsonPath.get(path);

    }

}

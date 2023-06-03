package com.roofstack.casestudy.handlers;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;

import java.lang.reflect.Type;
import java.util.List;

public class JsonHandler {

    private final Gson gson;

    public JsonHandler() {
        GsonBuilder gsonBuilder = new GsonBuilder();
        gson = gsonBuilder.serializeNulls().create();
    }

    public String serializeRecord(Record record) {
        return gson.toJson(record);
    }

    public Record deserializeRecord(String json) {
        return gson.fromJson(json, Record.class);
    }

    public String serializeRecordList(List<?> recordList) {
        return gson.toJson(recordList);
    }

    public List<Record> deserializeRecordList(String json) {
        Type listType = new TypeToken<List<Record>>(){}.getType();
        return gson.fromJson(json, listType);
    }

}

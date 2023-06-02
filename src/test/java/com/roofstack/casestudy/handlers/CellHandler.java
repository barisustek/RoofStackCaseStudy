package com.roofstack.casestudy.handlers;

public class CellHandler {

    public static String cellTransform(String field) {

        if (field != null) {

            switch (field) {
                case "[Null]" -> field = null;
                case "[EmptyString]" -> field = "";
                default -> { return field;
                }
            }

        }

        return field;

    }

}

package com.tw.edec.utils;

import org.springframework.web.client.HttpClientErrorException;

public class ErrorHandler {

    private String errorMessage;

    public ErrorHandler(HttpClientErrorException e) {

        System.out.println("HttpClientErrorException: "+e.getMessage());
        String responseBody=e.getResponseBodyAsString();
        System.out.println("GetResponseBodyAsString: "+responseBody);

        String messageError=responseBody.split("\"message\":")[1];
        messageError=messageError.substring(0,messageError.length()-1);

        setErrorMessage(messageError);
    }

    public String getErrorMessage() {
        return errorMessage;
    }

    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }
}

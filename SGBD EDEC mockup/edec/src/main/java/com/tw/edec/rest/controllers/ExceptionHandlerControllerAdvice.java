package com.tw.edec.rest.controllers;

import com.tw.edec.rest.models.ErrorMessage;
import org.springframework.http.HttpStatus;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

@ControllerAdvice
public class ExceptionHandlerControllerAdvice {

    @ExceptionHandler(AccessDeniedException.class)
    @ResponseStatus(HttpStatus.FORBIDDEN)
    @ResponseBody
    public ErrorMessage handleAccessDeniedException(AccessDeniedException e) {
        ErrorMessage errorMessage = new ErrorMessage();
        errorMessage.setStatusCode(403L);
        errorMessage.setError("FORBIDDEN");
        errorMessage.setMessage(e.getMessage());
        return errorMessage;
    }

    @ExceptionHandler(HttpMessageNotReadableException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ResponseBody
    public ErrorMessage handleBadRequest(HttpMessageNotReadableException e){
        ErrorMessage errorMessage = new ErrorMessage();
        errorMessage.setStatusCode(400L);
        errorMessage.setError("BAD_REQUEST");
        errorMessage.setMessage(e.getMessage());
        return errorMessage;
    }
}
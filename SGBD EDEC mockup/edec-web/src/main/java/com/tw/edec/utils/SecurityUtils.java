package com.tw.edec.utils;

import org.springframework.http.HttpHeaders;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;

import java.security.Principal;
import java.util.Base64;

public final class SecurityUtils {
    public static HttpHeaders getHttpHeadersWithBasicAuth(Principal principal){
        HttpHeaders httpHeaders = new HttpHeaders();
        if (principal instanceof UsernamePasswordAuthenticationToken) {
            String username = ((UsernamePasswordAuthenticationToken) principal).getName();
            String password = (String) ((UsernamePasswordAuthenticationToken) principal).getCredentials();
            httpHeaders.add("Authorization", "Basic " + Base64.getEncoder().encodeToString((username + ":" + password).getBytes()));
        }

        return httpHeaders;
    }
}
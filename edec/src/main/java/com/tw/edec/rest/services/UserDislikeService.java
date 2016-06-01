package com.tw.edec.rest.services;

import com.tw.edec.rest.models.Characteristic;
import com.tw.edec.rest.models.UserDislike;

import java.util.List;

public interface UserDislikeService {

    public UserDislike addUserDislike(String username,String characteristicName);

    public void removeUserDislike(String username, String characteristicName);

    public List<Characteristic> getAllUserDislikes(String username);

    public UserDislike getUserDislike(String username, String characteristicName);
}

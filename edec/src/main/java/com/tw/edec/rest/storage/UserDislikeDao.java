package com.tw.edec.rest.storage;

import com.tw.edec.rest.models.Characteristic;
import com.tw.edec.rest.models.UserDislike;

import java.util.List;

public interface UserDislikeDao {

    public void addUserDislike(String username,String characteristicName);

    public void removeUserDislike(String username,String characteristicName);

    public List<Characteristic> getUserDislikedCharacteristics(String username);

    public UserDislike getUserDislike(String username,String characteristicName);
}

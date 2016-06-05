package com.tw.edec.rest.storage;

import com.tw.edec.rest.models.Characteristic;
import com.tw.edec.rest.models.UserLike;

import java.util.List;

public interface UserLikeDao {

    public void addUserLike(String username,String characteristicName);

    public void removeUserLike(String username, String characteristicName);

    public List<Characteristic> getUserLikedCharacteristics(String username);

    public UserLike getUserLike(String username,String characteristicName);

}

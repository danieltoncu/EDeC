package com.tw.edec.rest.services;

import com.tw.edec.rest.models.Characteristic;
import com.tw.edec.rest.models.Product;
import com.tw.edec.rest.models.UserLike;

import java.util.List;

public interface UserLikeService {

    public UserLike addUserLike(String username, String characteristicName);

    public void removeUserLike(String username,String characteristicName);

    public List<Characteristic> getAllUserLikes(String username);

    public UserLike getUserLike(String username,String characteristicName);
}

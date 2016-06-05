package com.tw.edec.rest.services.imp;

import com.tw.edec.rest.models.Characteristic;
import com.tw.edec.rest.models.UserLike;
import com.tw.edec.rest.services.UserLikeService;
import com.tw.edec.rest.storage.UserLikeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserLikeServiceImpl implements UserLikeService {

    @Autowired
    private UserLikeDao userLikeDao;

    @Override
    public UserLike addUserLike(String username, String characteristicName) {
        userLikeDao.addUserLike(username,characteristicName);
        return getUserLike(username,characteristicName);
    }

    @Override
    public void removeUserLike(String username, String characteristicName) {
        userLikeDao.removeUserLike(username,characteristicName);
    }

    @Override
    public List<Characteristic> getAllUserLikes(String username) {
        return userLikeDao.getUserLikedCharacteristics(username);
    }

    @Override
    public UserLike getUserLike(String username, String characteristicName) {
        return userLikeDao.getUserLike(username,characteristicName);
    }
}

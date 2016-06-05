package com.tw.edec.rest.storage;

import com.tw.edec.rest.models.Characteristic;

import java.util.List;

public interface CharacteristicDao {

    void addCharacteristic(Characteristic characteristic);
    void removeCharacteristic(Characteristic characteristic);

    Characteristic getById(Long characteristicId);

    Characteristic getByName(String characteristicName);

    List<Characteristic> getAll();

    List<Characteristic> getWithPagination(String pag,int recordsPerPage);

    List<Characteristic> getTopLiked();

    List<Characteristic> getTopDisliked();


}

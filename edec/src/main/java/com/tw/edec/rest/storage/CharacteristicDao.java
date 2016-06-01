package com.tw.edec.rest.storage;

import com.tw.edec.rest.models.Characteristic;
import java.util.List;

public interface CharacteristicDao {

    public void addCharacteristic(Characteristic characteristic);
    public void removeCharacteristic(Characteristic characteristic);

    public Characteristic getById(Long characteristicId);

    public Characteristic getByName(String characteristicName);

    public List<Characteristic> getAll();


}

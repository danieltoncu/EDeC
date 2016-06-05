package com.tw.edec.rest.controllers;

import com.tw.edec.rest.models.Characteristic;
import com.tw.edec.rest.storage.CharacteristicDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/characteristics")
public class CharacteristicsController {

    @Autowired
    private CharacteristicDao characteristicDao;

    @RequestMapping(method = RequestMethod.GET)
    public List<Characteristic> getCharacteristics(@RequestParam(required = false) String pag){

        if(pag!=null)   return characteristicDao.getWithPagination(pag,5);
        return characteristicDao.getAll();
    }

    @RequestMapping(value="/{characteristicName}", method = RequestMethod.GET)
    public Characteristic getSingleCharacteristic(@PathVariable String characteristicName){
        return characteristicDao.getByName(characteristicName);
    }

    @RequestMapping(value="/{characteristicName}", method = RequestMethod.POST)
    public Characteristic addCharacteristic(@PathVariable String characteristicName){
        Characteristic characteristic=new Characteristic();
        characteristic.setName(characteristicName);
        characteristicDao.addCharacteristic(characteristic);
        return characteristicDao.getByName(characteristicName);
    }

    @RequestMapping(value="/top10liked",method = RequestMethod.GET)
    public List<Characteristic> getTopLikedCharacteristics(){
        return characteristicDao.getTopLiked();
    }

    @RequestMapping(value="/top10disliked",method = RequestMethod.GET)
    public List<Characteristic> getTopDislikedCharacteristics(){
        return characteristicDao.getTopDisliked();
    }
}

package com.tw.edec.rest.controllers;

import com.tw.edec.rest.storage.ExportDatabaseDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/export")
public class ExportDatabaseController {

    @Autowired
    ExportDatabaseDao exportDatabaseDao;

    @RequestMapping(method = RequestMethod.GET)
    public void exportDatabase(){
        exportDatabaseDao.exportDatabase();
    }
}

package com.tw.edec.rest.storage;

import com.tw.edec.rest.models.Brand;

public interface BrandDao {

    public void add(Brand brand);
    public Brand update(Brand brand);
    public void remove(Brand brand);
}

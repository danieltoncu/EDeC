package com.tw.edec.rest.storage;

import com.tw.edec.rest.models.Category;
import com.tw.edec.rest.models.Product;

import java.util.List;

public interface CategoryDao {

    public void addCategory(String categoryName);
    public void deleteCategory(String categoryName);
    public Category changeCategoryName(String oldCategoryName, String newCategoryName);

}

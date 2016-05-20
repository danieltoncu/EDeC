package com.tw.edec.rest.models;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name="category")
public class Category {

    @Id
    @GeneratedValue(strategy= GenerationType.TABLE)
    @Column(unique=true,nullable = false,name="category_id")
    private Long categoryId;

    @Column(unique = true,nullable = false,name="category_name")
    private String categoryName;

    @JsonIgnore
    @OneToMany(fetch = FetchType.LAZY , mappedBy = "category")
    private Set<Product> products;

    public Long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Long categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public Set<Product> getProducts() {
        return products;
    }

    public void setProducts(Set<Product> products) {
        this.products = products;
    }


}

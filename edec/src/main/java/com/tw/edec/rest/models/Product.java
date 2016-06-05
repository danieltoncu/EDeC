package com.tw.edec.rest.models;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.sql.Date;
import java.util.Calendar;
import java.util.Set;

@Entity
@Table(name="products")
public class Product {

    @Id
    //@GeneratedValue(strategy = GenerationType.TABLE)
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(unique=true,nullable = false,name="id")
    private Long id;

    @Column(unique=true,nullable = false,name="name")
    private String name;

    @Column(nullable = false,name="description")
    private String description;

    @Column(name="timestamp")
    private Date timestamp=new java.sql.Date(Calendar.getInstance().getTime().getTime());

    @Column(nullable = false,name="category")
    private String category;

    @Column(name="picture_url")
    private String pictureURL;

    @Column(name="health_score")
    private Double healthScore;

    @Column(name="environment_score")
    private Double environmentScore;

    @Column(name="society_score")
    private Double societyScore;

    @Column(name="overall_score")
    private Double overallScore;

    @JsonIgnore
    @OneToOne(mappedBy = "product")
    private ProductBrand productBrand;

    @JsonIgnore
    @OneToMany(mappedBy = "product")
    private Set<ProductCharacteristic> productCharacteristicSet;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public ProductBrand getProductBrand() {
        return productBrand;
    }

    public void setProductBrand(ProductBrand productBrand) {
        this.productBrand = productBrand;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public Date getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Date timestamp) {
        this.timestamp = timestamp;
    }

    public String getPictureURL() {
        return pictureURL;
    }

    public void setPictureURL(String pictureURL) {
        this.pictureURL = pictureURL;
    }

    public Double getHealthScore() {
        return healthScore;
    }

    public void setHealthScore(Double healthScore) {
        this.healthScore = healthScore;
    }

    public Double getEnvironmentScore() {
        return environmentScore;
    }

    public void setEnvironmentScore(Double environmentScore) {
        this.environmentScore = environmentScore;
    }

    public Double getSocietyScore() {
        return societyScore;
    }

    public void setSocietyScore(Double societyScore) {
        this.societyScore = societyScore;
    }

    public Double getOverallScore() {
        return overallScore;
    }

    public void setOverallScore(Double overallScore) {
        this.overallScore = overallScore;
    }

    public Set<ProductCharacteristic> getProductCharacteristicSet() {
        return productCharacteristicSet;
    }

    public void setProductCharacteristicSet(Set<ProductCharacteristic> productCharacteristicSet) {
        this.productCharacteristicSet = productCharacteristicSet;
    }
}

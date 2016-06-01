package com.tw.edec.web.models;

import java.sql.Date;

public class Product {

    private Long id;

    private String name;

    private String description;

    private Date timestamp;

    private String category;

    private String pictureURL;

    private Double healthScore;

    private Double environmentScore;

    private Double societyScore;

    private Double overallScore;

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

}

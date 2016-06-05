package com.tw.edec.web.models;

public class Characteristic {

    private Long id;

    private String name;

    private Long nrLikes;

    private Long nrDislikes;

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

    public Long getNrLikes() {
        return nrLikes;
    }

    public void setNrLikes(Long nrLikes) {
        this.nrLikes = nrLikes;
    }

    public Long getNrDislikes() {
        return nrDislikes;
    }

    public void setNrDislikes(Long nrDislikes) {
        this.nrDislikes = nrDislikes;
    }
}

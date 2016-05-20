package com.tw.edec.rest.models;

import javax.persistence.*;

@Entity
@Table(name="society")
public class ProductSocietyScore {

    @Id
    @GeneratedValue(strategy= GenerationType.TABLE)      //oracle
    @Column(unique=true,nullable = false,name="society_id")
    private Long productSocietyScoreId;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(unique=true,name="product_id")
    private Product product;

    @Column(nullable = false,name="society_score")
    private Double societyScore;

    @Column(nullable=false,name="society_score_text")
    private String societyScoreText;

    public Long getProductSocietyScoreId() {
        return productSocietyScoreId;
    }

    public void setProductSocietyScoreId(Long productSocietyScoreId) {
        this.productSocietyScoreId = productSocietyScoreId;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Double getSocietyScore() {
        return societyScore;
    }

    public void setSocietyScore(Double societyScore) {
        this.societyScore = societyScore;
    }

    public String getSocietyScoreText() {
        return societyScoreText;
    }

    public void setSocietyScoreText(String societyScoreText) {
        this.societyScoreText = societyScoreText;
    }
}

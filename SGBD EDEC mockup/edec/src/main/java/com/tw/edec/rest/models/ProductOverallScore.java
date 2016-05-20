package com.tw.edec.rest.models;

import javax.persistence.*;

@Entity
@Table(name="overall_score")
public class ProductOverallScore {

    @Id
    @GeneratedValue(strategy= GenerationType.TABLE)      //oracle
    @Column(unique=true,nullable = false,name="overall_score_id")
    private Long productOverallScoreId;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(unique=true,name="product_id")
    private Product product;

    @Column(nullable = false,name="overall_score")
    private Double overallScore;

    @Column(nullable=false,name="overall_score_text")
    private String overallScoreText;

    public Long getProductOverallScoreId() {
        return productOverallScoreId;
    }

    public void setProductOverallScoreId(Long productOverallScoreId) {
        this.productOverallScoreId = productOverallScoreId;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Double getOverallScore() {
        return overallScore;
    }

    public void setOverallScore(Double overallScore) {
        this.overallScore = overallScore;
    }

    public String getOverallScoreText() {
        return overallScoreText;
    }

    public void setOverallScoreText(String overallScoreText) {
        this.overallScoreText = overallScoreText;
    }
}

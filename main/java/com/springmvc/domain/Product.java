package com.springmvc.domain;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

public class Product implements Serializable
{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1925519282386830473L;
	
	private String productId;//상품아이디
	private String productName;//상품이름
	private int unitPrice;//가격
	private String description;//설명
	private String category;//종류
	private long unitsInStock;//재고수
	private String condition;//상태
	private int rating; // 평균 상품 평점
	private String modelName; //모델이름
	private String size; //상품사이즈
	private String position;//포지션 상품관련
	private String material; //소재 가죽 스킨
	private String web; //웹
	private String color; //색상
	private String manufacturCountry; //제조국
	private String handling; //주의사항
	private String briedfDescription; //짧은설명
	private String brand;
	
	/* 파일 업로드 */
	private MultipartFile productImage;
	private String fileName;
	
	
	
	public Product() {super();} // super은 생략되어도 상관은 없는데 그냥 적자
	
	public Product(String productId,String productName,int unitPrice )
	{
		super();
		this.productId = productId;
		this.productName = productName;
		this.setUnitPrice(unitPrice);
	
	}
	
	
	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public MultipartFile getProductImage() {
		return productImage;
	}

	public void setProductImage(MultipartFile productImage) {
		this.productImage = productImage;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
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
	public long getUnitsInStock() {
		return unitsInStock;
	}
	public void setUnitsInStock(long unitsInStock) {
		this.unitsInStock = unitsInStock;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}

	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}

	public int getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getModelName() {
		return modelName;
	}

	public void setModelName(String modelName) {
		this.modelName = modelName;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getMaterial() {
		return material;
	}

	public void setMaterial(String material) {
		this.material = material;
	}

	public String getWeb() {
		return web;
	}

	public void setWeb(String web) {
		this.web = web;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getManufacturCountry() {
		return manufacturCountry;
	}

	public void setManufacturCountry(String manufacturCountry) {
		this.manufacturCountry = manufacturCountry;
	}

	public String getHandling() {
		return handling;
	}

	public void setHandling(String handling) {
		this.handling = handling;
	}

	public String getBriedfDescription() {
		return briedfDescription;
	}

	public void setBriedfDescription(String briedfDescription) {
		this.briedfDescription = briedfDescription;
	}
	
	
	
}

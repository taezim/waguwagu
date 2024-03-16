package com.springmvc.domain;

import java.io.Serializable;

public class OrderHistory implements Serializable 
{
	/**
	 * 
	 */
	private static final long serialVersionUID = -6786742215422078968L;
	private long orderId;
	private String productId;
    private int quantity;
    private int totalPrice; // 총액
    private Product product;
    

	public OrderHistory() 
	{

	}
	public long getOrderId() {
		return orderId;
	}
	public void setOrderId(long orderId) {
		this.orderId = orderId;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
    
    
}

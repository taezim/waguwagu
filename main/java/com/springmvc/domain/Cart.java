package com.springmvc.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Cart  implements Serializable
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3277150909262977484L;
	
	private String cartId; // == memberId
	private List<CartItem> cartItems;
	private int grandTotal;
	
	public Cart(){};
	
	public Cart(String cartId) 
	{
		setCartItems(new ArrayList<CartItem>());
		grandTotal=0;
		this.cartId = cartId;
	}

	
	
	public String getCartId() {
		return cartId;
	}

	public void setCartId(String cartId) {
		this.cartId = cartId;
	}

	public int getGrandTotal() {
		return grandTotal;
	}

	public void setGrandTotal(int grandTotal) {
		this.grandTotal = grandTotal;
	}

	@Override
	public int hashCode() {
		final int prime =31;
		int result =1;
		result = prime*result+((cartId==null)? 0 : cartId.hashCode());
		return result; // 특정한 길이의 값을 만들어내는 것 // hashpotato = 으깨도 감자인건 변하지 않지
	}

	@Override
	public boolean equals(Object obj) 
	{
		if(this == obj)return true;
		if(obj == null)return false;
		if(getClass() != obj.getClass()) 
		{return false;}
		Cart other = (Cart) obj;
		if(cartId == null)
			if(other.cartId!=null)
			{
				return false; 
			}
		else if (!cartId.equals(other.cartId)) return false;
		return true;
	}

	public List<CartItem> getCartItems() {
		return cartItems;
	}

	public void setCartItems(List<CartItem> cartItems) {
		this.cartItems = cartItems;
	}

}

package com.springmvc.domain;

import java.io.Serializable;


/*수령인 정보*/
public class Shipping implements Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1493936227962677468L;
	
	private String customerId; // 주문자 아이디 - 상호 JOIN 용도
	private String phone; // 수령인 전화번호
	private Address address; // 수령인 주소
	
	public Shipping() 
	{
		this.address = new Address();
	}
	
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	
	
}

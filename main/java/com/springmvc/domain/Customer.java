package com.springmvc.domain;

import java.io.Serializable;
import java.util.Date;

/*주문자 정보*/
public class Customer implements Serializable 
{
	/**
	 * 
	 */
	private static final long serialVersionUID = -8923129427599533816L;

	private String customerId; // 주문Id = memberId
	private String name; // 이거무시하쇼 address에 합침 
	private String phone; // 구매자 전화번호
	private Address address; // 주소 객체
	private Date date; // 주문 날짜
	
	public Customer() 
	{
		this.address = new Address();
	}
	public Customer(String customerId, String name) 
	{
		this();
		this.customerId = customerId;
		this.name = name;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((customerId == null) ? 0 : customerId.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Customer other = (Customer) obj;
		if (customerId == null) {
			if (other.customerId != null)
				return false;
		} else if (!customerId.equals(other.customerId))
			return false;
		return true;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
}

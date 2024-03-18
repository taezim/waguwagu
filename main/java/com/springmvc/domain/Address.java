package com.springmvc.domain;

import java.io.Serializable;
import java.util.Objects;

public class Address implements Serializable
{

	/**
	 * 
	 */
	private static final long serialVersionUID = -824607634067469239L;

	private int addressId; //
	private String customerId; // 아이디 또는 식별값 = memberId
	private String recipientName; // 그냥 name -- db의 personName
	// 배송 받는 사람 - 아 변수명 아 실수해서 그냥 이 변수가 Customer과 shipping에서 각각 구매자와 수령인 이름으로 퉁쳐야함
	private String addressName; //주소명 - ex) 집 / 회사 등
	private String country; // 주소 - 상세주소까지 포함
	private String zipCode; // 우편번호
	public int getAddressId() {
		return addressId;
	}
	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getRecipientName() {
		return recipientName;
	}
	public void setRecipientName(String recipientName) {
		this.recipientName = recipientName;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	@Override
	public int hashCode() {
		return Objects.hash(addressId, country, recipientName, zipCode);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Address other = (Address) obj;
		return addressId == other.addressId && Objects.equals(country, other.country)
				&& Objects.equals(recipientName, other.recipientName) && Objects.equals(zipCode, other.zipCode);
	}
	public String getAddressName() {
		return addressName;
	}
	public void setAddressName(String addressName) {
		this.addressName = addressName;
	}

}

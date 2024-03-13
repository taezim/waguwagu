package com.springmvc.domain;

import java.io.Serializable;

public class Address implements Serializable {
	
	
    /**
	 * 
	 */
	private static final long serialVersionUID = -1126489558908019975L;
	
	private String zipcode;
    private String streetAddress;
    private String detaileAddress;
    private String extraAddress;
	
    
    // Address 객체를 문자열로 변환하는 메서드
    public String toString() {
    	
        return zipcode + " " + streetAddress + " " + detaileAddress + " " + extraAddress;
    }
    //Address 클래스에 toString 메서드가 정의되어 있는지 확인하세요. toString 메서드가 없으면 기본적으로 객체의 해시코드를 반환하기 때문에 의도한 결과가 나오지 않을 수 있습니다. Address 클래스에 다음과 같이 toString 메서드를 추가
    
    public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getStreetAddress() {
		return streetAddress;
	}
	public void setStreetAddress(String streetAddress) {
		this.streetAddress = streetAddress;
	}
	public String getDetaileAddress() {
		return detaileAddress;
	}
	public void setDetaileAddress(String detaileAddress) {
		this.detaileAddress = detaileAddress;
	}
	public String getExtraAddress() {
		return extraAddress;
	}
	public void setExtraAddress(String extraAddress) {
		this.extraAddress = extraAddress;
	}
	
	// isEmpty() 메서드 추가
    public boolean isEmpty() {
        return zipcode == null && streetAddress == null && detaileAddress == null && extraAddress == null;
    }
    
}

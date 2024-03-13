package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.Address;
import com.springmvc.domain.Member;

public class MemberRowMapper implements RowMapper<Member>{
	public Member mapRow(ResultSet rs, int rowNum) throws SQLException{
		Member member = new Member();
		member.setMemberId(rs.getString(1));
		member.setName(rs.getString(2));
		member.setPassword(rs.getString(3));
		member.setBirth(rs.getString(4));
		member.setTeam(rs.getString(5));
		member.setInjury(rs.getString(6));
		/* member.setAddress(rs.getString(7)); */
		
		/*
		 * // 주소 정보 설정 추가 Address address = new Address(); // Assuming that the address
		 * column contains both zipcode and streetAddress separated by a space String[]
		 * addressParts = rs.getString(7).split(" "); if (addressParts.length >= 2) {
		 * address.setZipcode(addressParts[0]);
		 * address.setStreetAddress(addressParts[1]+addressParts[2]+addressParts[3]+
		 * addressParts[4]); address.setDetaileAddress(addressParts[5]+addressParts[6]);
		 * address.setExtraAddress(addressParts[7]); // Set other address fields as
		 * needed }*/
		

		
		Address address = parseAddress(rs.getString(7)); // Assuming "address" is in column 7
        member.setAddress(address);
        //member.setAddress(address);
		member.setClassId(rs.getString(8));
		member.setTeacherId(rs.getString(9));
		member.setPersonalRecord(rs.getString(10));
		member.setSex(rs.getString(11));
		member.setFileName(rs.getString(12));
		
		return member;
	}
	
	private Address parseAddress(String addressColumnValue) {
	    if (addressColumnValue == null || addressColumnValue.trim().isEmpty()) {
	        return null; // 주소 정보가 없는 경우
	    }

	    Address address = new Address();

	    // Split the address value using a space as delimiter
	    String[] addressParts = addressColumnValue.split(" ");

	    // Set zipcode
	    if (addressParts.length > 0) {
	        address.setZipcode(addressParts[0]);
	    }

	    // Set streetAddress
	    if (addressParts.length > 1) {
	        StringBuilder streetAddressBuilder = new StringBuilder();
	        for (int i = 1; i < addressParts.length; i++) {
	            streetAddressBuilder.append(addressParts[i]).append(" ");
	        }
	        address.setStreetAddress(streetAddressBuilder.toString().trim());
	    }

	    // Set detailAddress and extraAddress if available
	    if (addressParts.length > 6) { // Assuming detailAddress and extraAddress are present
	        address.setDetaileAddress(addressParts[5] + " " + addressParts[6]);
	        if (addressParts.length > 8) {
	            address.setExtraAddress(addressParts[7] + " " + addressParts[8]);
	            // You can add more logic for additional address fields if needed
	        }
	    }

	    return address.isEmpty() ? null : address;
	}
}
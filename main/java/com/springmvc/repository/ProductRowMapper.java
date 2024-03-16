package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.Product;



public class ProductRowMapper implements RowMapper<Product>
{

	@Override
	public Product mapRow(ResultSet rs, int rowNum) throws SQLException 
	{
		Product pd = new Product();
		pd.setProductId(rs.getString(1));  //상품아이디
		pd.setProductName(rs.getString(2));  //상품이름
		pd.setUnitPrice(rs.getInt(3));  //가격
		pd.setDescription(rs.getString(4));  //설명긴거
		pd.setCategory(rs.getString(5));  //카테고리
		pd.setUnitsInStock(rs.getInt(6));  //재고수
		pd.setCondition(rs.getString(7));  //상태  
		pd.setRating(rs.getInt(8));
		pd.setFileName(rs.getString(9));
		pd.setModelName(rs.getString(10));
		pd.setSize(rs.getString(11));
		pd.setPosition(rs.getString(12));
		pd.setMaterial(rs.getString(13));
		pd.setWeb(rs.getString(14));
		pd.setColor(rs.getString(15));
		pd.setManufacturCountry(rs.getString(16));
		pd.setHandling(rs.getString(17));
		pd.setBriedfDescription(rs.getString(18));
		pd.setBrand(rs.getString(19));
		return pd;
	}

}

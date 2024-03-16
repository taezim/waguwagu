package com.springmvc.repository;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.Product;

@Repository
public class ProductRepositoryImpl implements ProductRepository
{
	
	private JdbcTemplate template;
	
	@Autowired
	public void setJdbcTemplate(DataSource dataSource) 
	{
		this.setTemplate(new JdbcTemplate(dataSource));
	}
	
	private List<Product> listOfProducts = new ArrayList<Product>();
	
	 public ProductRepositoryImpl() 
	 {
		 /*first DTO*/
		 Product product = new Product("ISBN1234", "야구 글러브", 10000);
		 product.setDescription("설명 : 야구 글러브");
		 product.setCategory("Gloves");
		 product.setUnitsInStock(10);
		 product.setCondition("Old");
		 
		 product.setRating(5);
		 
		 
		 /*second DTO*/
		 Product product2 = new Product("ISBN1235", "야구 배트", 20000);
		 product.setDescription("설명 : 야구 배트");
		 product.setCategory("Bat");
		 product.setUnitsInStock(20);
		 product.setCondition("New");
		 
		 product.setRating(0);
		
		 /*third DTO*/
		 Product product3 = new Product("ISBN1234", "야구공", 30000);
		 product.setDescription("설명 : 야구공");
		 product.setCategory("Ball");
		 product.setUnitsInStock(30);
		 product.setCondition("New");
		 
		 product.setRating(4);
		 
		 listOfProducts.add(product);
		 listOfProducts.add(product2);
		 listOfProducts.add(product3);
	 }
	
	@Override
	public List<Product> readAllProductList() 
	{
		String SQL = "SELECT * FROM product";
		List<Product> listOfProducts = template.query(SQL, new ProductRowMapper());
		return listOfProducts;
	}

	@Override
	public List<Product> readProductListByCategory(String category) 
	{ 	
		List<Product> productsByCategory = new ArrayList<Product>();
		
		String SQL = "SELECT * FROM product where p_category LIKE '%"+category+"%'";
		productsByCategory = template.query(SQL, new ProductRowMapper());
	
		return productsByCategory;
	}

	@Override
	public Product readProductById(String productId) 
	{
		
		Product productInfo = null;
		// 17단원 수정
		String SQL = "SELECT count(*) FROM product where p_id=?";
		int rowCount = template.queryForObject(SQL, Integer.class, productId);
			if(rowCount!=0) 
			{
				SQL = "SELECT * FROM product where p_id=?";
				productInfo = template.queryForObject(SQL, new Object[] {productId}, new ProductRowMapper());
			}
			if(productInfo==null) 
			{
				throw new IllegalArgumentException("도서 ID가 "+productId+"인 해당 도서를 찾을 수 없습니다.");
			
			}
			return productInfo;
		}
		

	@Override
	public void setNewProduct(Product pd) 
	{
		String SQL = "INSERT INTO product(p_id, p_name, p_unitPrice, p_description, p_category, p_unitsInStock, p_condition, p_rating, p_fileName, model_name, size, position, material, web, color, manufacturing_country, handling_instructions, brief_description, brand)" +
	             "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		template.update(SQL, pd.getProductId(), pd.getProductName(), pd.getUnitPrice(), pd.getDescription(),
	                pd.getCategory(), pd.getUnitsInStock(), pd.getCondition(), pd.getRating(), pd.getFileName(),
	                pd.getModelName(), pd.getSize(), pd.getPosition(), pd.getMaterial(), pd.getWeb(), pd.getColor(),
	                pd.getManufacturCountry(), pd.getHandling(), pd.getBriedfDescription(), pd.getBrand());

	}

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	@Override
	public void setUpdateProduct(Product pd) {
	    String SQL = "UPDATE product SET p_name=?, p_unitPrice=?, p_description=?, p_category=?, p_unitsInStock=?, p_condition=?, p_rating=?, p_fileName=?, model_name=?, size=?, position=?, material=?, web=?, color=?, manufacturing_country=?, handling_instructions=?, brief_description=?, brand=? WHERE p_id=?";
	    
	    template.update(SQL, pd.getProductName(), pd.getUnitPrice(), pd.getDescription(), pd.getCategory(), pd.getUnitsInStock(), pd.getCondition(), pd.getRating(), pd.getFileName(), pd.getModelName(), pd.getSize(), pd.getPosition(), pd.getMaterial(), pd.getWeb(), pd.getColor(), pd.getManufacturCountry(), pd.getHandling(), pd.getBriedfDescription(), pd.getBrand(), pd.getProductId());
	}


	@Override
	public void setDeleteProduct(String productId) 
	{
		//String SQL = "delete from Book where b_bookId=?";
		String SQL = "delete from product where p_id=?";
		this.template.update(SQL, productId);
		
	}


}

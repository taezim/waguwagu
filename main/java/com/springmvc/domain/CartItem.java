package com.springmvc.domain;

import java.io.Serializable;

import org.springframework.beans.factory.annotation.Autowired;

import com.springmvc.service.ProductService;

public class CartItem implements Serializable {
   
	private static final long serialVersionUID = -6160563150511606621L;
	private String cartId;
	private String productId;
    private int quantity;
    private int totalPrice;
    private Product product;
    
    private transient ProductService productService;
    
    public CartItem() 
    {
    	this.productService = productService;
    };
    
    public CartItem(ProductService productService, String productId, String cartId) {
        this.productService = productService;
        this.productId = productId;
        // 여기서 데이터베이스에서 해당 상품의 정보를 조회하고, 필요한 정보를 설정
        Product product = retrieveProductInfoFromDatabase(productId);
        this.quantity = 1;
        this.totalPrice = product.getUnitPrice();
        this.cartId = cartId;
        this.product = product;
        System.out.println("CartItems 생성자 실행, 상품아이디는"+ productId);
    }

    private Product retrieveProductInfoFromDatabase(String productId) {
        // 여기서 데이터베이스에서 productId를 기반으로 상품 정보를 조회하고 반환
        // 예: ProductService의 메서드를 호출하여 데이터베이스에서 정보를 가져올 수 있음
        return productService.readProductById(productId);
    }
    
    // getter & setter for productId

    // method
    public void updateTotalPrice(int unitPrice) 
    {
        totalPrice = unitPrice * this.quantity;
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

	// Overriding
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((productId == null) ? 0 : productId.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass()) {
            return false;
        }
        CartItem other = (CartItem) obj;
        if (productId == null)
            if (other.productId != null) {
                return false;
            } else if (!productId.equals(other.productId))
                return false;
        return true;
    }

	public String getCartId() {
		return cartId;
	}

	public void setCartId(String cartId) {
		this.cartId = cartId;
	}

	public Product getProduct() 
	{
		return product;
	}

	public void setProduct(Product product) 
	{
		this.product = product;
	}
}

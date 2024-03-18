package com.springmvc.controller;



import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.springmvc.domain.HospitalReview;
import com.springmvc.domain.Product;
import com.springmvc.domain.ProductReview;
import com.springmvc.domain.Productanswer;
import com.springmvc.domain.Productqna;
import com.springmvc.service.AnswerProductService;
import com.springmvc.service.ProductReviewService;
import com.springmvc.service.ProductService;
import com.springmvc.service.QnAProductService;


//1. 역할 지정
@Controller
@RequestMapping("/products")
public class ProductController 
{
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ProductReviewService productReviewService;
	
	 @Autowired
     private QnAProductService qnaproductservice;
     @Autowired
     private AnswerProductService answerproductservice;
	
	// READ
	@GetMapping
	public String requestProductList(Model model) 
	{
		List<Product> list = productService.readAllProductList(); // 호출하니까 이동해야지
		model.addAttribute("productList", list);
		return "/Product/products";
	}
	
	@GetMapping("/all")
	public String requestAllProducts(Model model) 
	{
		List<Product> list = productService.readAllProductList(); // 호출하니까 이동해야지
		model.addAttribute("productList", list);
		return "/Product/products";
	}
	
	@GetMapping("/product")
	public String requestProductById(@RequestParam("id") String productId, Model model,HttpSession session,@ModelAttribute("addReview")HospitalReview hospitalReview)
	{
		
		
		Product pdById = productService.readProductById(productId);
		model.addAttribute("pd", pdById); // product.jsp 에서 pd. 해서 꺼내쓰면됨

		String handling = pdById.getHandling();
		String[] handlingParts = handling.split("-");
		List<String> handlingList = new ArrayList<>();

		// 첫 번째 요소를 제외한 나머지를 리스트에 추가
		for (int i = 1; i < handlingParts.length; i++) {
		    handlingList.add(handlingParts[i].trim());
		}
		double avgScore = productReviewService.calculateAvgScore(productId);
		List<ProductReview> reviews = productReviewService.readProductAllReviewList(productId);
		System.out.println("ddd="+reviews);
		// 모델에 리스트를 담아서 뷰로 전달
		model.addAttribute("handling", handlingList);
		model.addAttribute("avgScore", avgScore);
		model.addAttribute("productId",productId);
		model.addAttribute("productReviews",reviews);
		
		String id = (String) session.getAttribute("memberId");
		model.addAttribute("id",id);
		
//		Product QnA객체 가져오기
		List<Productqna> qnaproductlist = qnaproductservice.readAllProductqnaList();
		model.addAttribute("qnaproductlistkey",qnaproductlist);
		List<Productanswer> productanslist = answerproductservice.readAllProductanswerList();
		model.addAttribute("productanslistkey",productanslist);
		
		
		return "/Product/product";
	}
	
	// CREATE

	@GetMapping("/add")
	public String requestAddProductForm(@ModelAttribute("addProduct")Product product) 
	{
		System.out.println("GetMapping 도착");
		return "/Product/addProduct";
		
	}

	@PostMapping("/add")
	public String submitAddNewProduct(@ModelAttribute("addProduct")Product product, HttpServletRequest request) 
	{
		MultipartFile img = product.getProductImage();
		
		String saveName = img.getOriginalFilename();
		String save = request.getSession().getServletContext().getRealPath("/resources/images");
		
		File saveFile = new File(save, saveName);
		if(img !=null&& ! img.isEmpty()) 
		{
			try {
				img.transferTo(saveFile);
				product.setFileName(saveName); // 17단원 추가
			} catch (Exception e) {
				// TODO Auto-generated catch block
				throw new RuntimeException("상품 이미지 업로드가 실패하였습니다.");
			}
		}
		System.out.println("PostMapping 도착");
		
		
		String pdId = generateProductId(10);
		System.out.println(pdId);
		product.setProductId(pdId);
		
		
		productService.setNewProduct(product);		//set은 입력해줄 값들 모두 가져온 후 해야지!!
		return "redirect:/products";
	}
	
	
	private String generateProductId(int length) {
	    if (length <= 0) {
	        throw new IllegalArgumentException("길이는 1이상이어야 합니다.");
	    }
	    
	    Random random = new Random();
	    StringBuilder stringBuilder = new StringBuilder();
	    
	    for (int i = 0; i < length; i++) {
	        int randomNumber = random.nextInt(10);
	        stringBuilder.append(randomNumber);
	    }
	    
	    return "P_" + stringBuilder.toString();
	}
	
	
	@GetMapping("/update")
	public String getUpdateBookForm(@ModelAttribute("updateProduct") Product pd, @RequestParam("id") String productId, Model model) 
	{
		Product pdById = productService.readProductById(productId);
		model.addAttribute("pd",pdById);
		
		return "/Product/updateProduct";		
	}
	
	@PostMapping("/update")
	public String submitUpdateBookForm(@ModelAttribute("updateProduct") Product pd, HttpServletRequest request) 
	{
		MultipartFile img = pd.getProductImage();
		String saveName = img.getOriginalFilename();
		String save = request.getSession().getServletContext().getRealPath("/resources/images");

		File saveFile = new File(save, saveName);
		if(img!=null && !img.isEmpty()) 
		{
			System.out.println("이미지는 null이 아님");
			try {
				img.transferTo(saveFile);
				pd.setFileName(saveName); // 17단원 추가
			} catch (Exception e) {
				// TODO Auto-generated catch block
				throw new RuntimeException("상품 이미지 업로드가 실패하였습니다.");
			}
		}
		productService.setUpdateBook(pd);
		return "redirect:/products";		
	}
	
	
	@RequestMapping(value="/delete")
	public String getDeleteBookForm(Model model, @RequestParam("id") String productId) 
	{
		productService.setDeleteBook(productId);
		return "redirect:/products";
	}
	

	   
}

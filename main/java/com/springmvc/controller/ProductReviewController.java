package com.springmvc.controller;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springmvc.domain.HospitalReview;
import com.springmvc.domain.Product;
import com.springmvc.domain.ProductReview;
import com.springmvc.repository.ProductRepository;
import com.springmvc.service.ProductReviewService;

@Controller
@RequestMapping("/products/review")
public class ProductReviewController {

	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private ProductReviewService productReviewService;
	
	
	@GetMapping
	public String requestReviewList(Model model) {
		List<ProductReview> list = productReviewService.readAllReviewList();
		model.addAttribute("reviewList",list);
		return "/Product/reviews";
	}
	
	@GetMapping("/all")
	public String requestAllReviews(@RequestParam("id")String reviewId, Model model) {
		List<ProductReview> list = productReviewService.readAllReviewList();
		model.addAttribute("reviewList",list);
		return "/Product/reviews";		
		
	}
	
	@GetMapping("/review")
	public String requestReviewById(@RequestParam("id")String reviewId, Model model) {
		ProductReview reviewById = productReviewService.readReviewById(reviewId);
		model.addAttribute("review",reviewById);
		return "/Product/review";
	}
	
	
	//productid에 따른 리뷰
	@GetMapping("/reviews")
	public String productReviewById(@RequestParam("id") String productId, Model model) {
		
		Product productById = productRepository.readProductById(productId);
		List<ProductReview> reviews = productReviewService.readProductAllReviewList(productId);
		double avgScore = productReviewService.calculateAvgScore(productId);
		
		model.addAttribute("productInfo",productById);
		model.addAttribute("reviews",reviews);
		model.addAttribute("avgScore",avgScore);
		model.addAttribute("id",productId);
		return "/Product/product";
	}
	
	
	@GetMapping("/add")
	public String requestAddReviewForm(@ModelAttribute("addReview")ProductReview productReview, Model model, @RequestParam("id")String id) {
		Product productById = productRepository.readProductById(id);
		model.addAttribute("product",productById);
		System.out.println("add하자");
		return "/Product/product";
	}
	
	
	@PostMapping("/add")
	public String submitAddNewReview(@ModelAttribute("addReview")ProductReview productReview, HttpServletRequest request) {
		
		String reviewId = generateReivewId(10);
		productReview.setReviewId(reviewId);
		System.out.println("리뷰 아이디 = "+reviewId);
		
		String productId = productReview.getProductId();
		productReview.setProductId(productId);
		
		productReviewService.setNewReview(productReview);
		System.out.println("add 포스트매핑하자");
		return "redirect:/products/product?id="+productId;
		
		
	}
	
	private String generateReivewId(int length) {
		
		if(length<=0) {
			throw new IllegalArgumentException("길이는 1이상이어야 합니다.");
		}
		Random random = new Random();
		StringBuilder stringBuilder = new StringBuilder();
		
		for(int i=0; i<length; i++) {
			int randomNumber = random.nextInt(10);
			stringBuilder.append(randomNumber);
		}
		return "PR_"+ stringBuilder.toString();
	}
	
	
	@GetMapping("/update")
	@ResponseBody
	public ProductReview getUpdateReviewForm(@ModelAttribute("updateReview")ProductReview productReview, @RequestParam("id")String reviewId, @RequestParam("productId")String productId, Model model) {
		
		ProductReview reviewById = productReviewService.readReviewById(reviewId);
		model.addAttribute("review",reviewById);
		System.out.println("겟매핑");
		
		return reviewById;
	}
	
	@PostMapping("/update")
	public String submitUpdateReviewForm(@ModelAttribute("updateReview")ProductReview productReview, HttpServletRequest request) {
		
		String productId = request.getParameter("productId");
		System.out.println("productId="+productId);
		System.out.println("업포스트매핑");
		
		productReviewService.setUpdateReview(productReview);
		
		return "redirect:/products/product?id="+productId;
	}
	
	@GetMapping(value="/delete")
	public String getDeleteForm(@RequestParam("id") String reviewId, @RequestParam("productId")String productId, Model model) {
		
		productReviewService.setDeleteReview(reviewId);
		return "redirect:/products/product?id="+productId;
	}
	
}

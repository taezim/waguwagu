package com.springmvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springmvc.domain.Product;
import com.springmvc.domain.Productanswer;
import com.springmvc.service.AnswerProductService;
import com.springmvc.service.ProductService;

@Controller
@RequestMapping("/productanswers")
public class AnswerProductController {

	@Autowired
	private AnswerProductService answerService;
	@Autowired
	private ProductService productService;

	
	
	//				Hospital	Controller Line				//
	
	//Read Line	
	//All Read
	
	@GetMapping
	public String showProductAllAnswer(Model model) {
	    List<Productanswer> list = answerService.readAllProductanswerList();
	    model.addAttribute("answerLists", list);
	    System.out.println("Controller: " + list);
	    return "/answer/productanswer/productanss";
	}

	@GetMapping("/productanswer")
	public String showProductAnswer(@RequestParam("an") String answerNumber, Model model) {
		Productanswer answer = answerService.readProductanswerBynumber(answerNumber);
	    model.addAttribute("answerlistone", answer);
	    System.out.println("Controller: " + answer);
	    return "/answer/productanswer/productans";
	}

	@GetMapping("/productadd")
	public String createProductGetQnA(@RequestParam("paramproductid")String productid,@ModelAttribute("productcreateanswer") Productanswer productnewanswer,Model model) {
		
		Product pdById = productService.readProductById(productid);
		model.addAttribute("pd", pdById); // product.jsp 에서 pd. 해서 꺼내쓰면됨
		
		System.out.println("나는 get productid : " + pdById.getProductId());
		
		productnewanswer.setProductid(productid);
		
	    return "/answer/productanswer/productcreateans";
	}

	@PostMapping("/productadd")
	public String createProductPostQnA(Productanswer productanswer, @RequestParam("productid") String productid) {
	    System.out.println("productid 나는 post : " + productid);
	    productanswer.setProductid(productid); // productid 설정
	    answerService.createProductlanswer(productanswer); // 서비스 계층에서 데이터 저장
	    return "redirect:/products/product?id=" + productid;
	}

	@GetMapping("/productupdate")
	public String updateProductForm(@ModelAttribute("productupdateanswer") Productanswer answerNumber,
	        @RequestParam("productUpdateAn") String number, Model model) {
		Productanswer productAnswer = answerService.readProductanswerBynumber(number);
	    model.addAttribute("productUpdateList", productAnswer);
	    return "/answer/productanswer/productupdateans";
	}

	@PostMapping("/productupdate")
	public String updateProductForm(@ModelAttribute("productupdateanswer") Productanswer answer) {
	    answerService.updateProductanswer(answer);
	    System.out.println("Controller: " + answer);
	    return "redirect:/productanswers";
	}

	@RequestMapping(value = "/productDelete")
	public String deleteProductAnswer(Model model, @RequestParam("answerJs") String questionNumber) {
	    System.out.println(questionNumber);
	    answerService.deleteProductanswer(questionNumber);
	    return "redirect:/productanswers";
	}
	
	
	//			Product		Controller Line				//
		
	
	
	
	//			Class		Controller Line				//
	
	
	
}

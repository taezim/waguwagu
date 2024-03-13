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

import com.springmvc.domain.Productanswer;
import com.springmvc.service.AnswerProductService;

@Controller
@RequestMapping("/productanswers")
public class AnswerProductController {

	@Autowired
	private AnswerProductService answerService;
	
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
	public String createProductGetQnA(@ModelAttribute("productcreateanswer") Productanswer productnewanswer) {
	    return "/answer/productanswer/productcreateans";
	}

	@PostMapping("/productadd")
	public String createProductPostQnA(@ModelAttribute("productcreateanswer") Productanswer productanswer) {
	    answerService.createProductlanswer(productanswer);
	    return "redirect:/productanswers";
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

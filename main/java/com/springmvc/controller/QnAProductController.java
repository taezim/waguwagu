package com.springmvc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springmvc.domain.Product;
import com.springmvc.domain.Productanswer;
import com.springmvc.domain.Productqna;
import com.springmvc.service.AnswerProductService;
import com.springmvc.service.ProductService;
import com.springmvc.service.QnAProductService;

@Controller
@RequestMapping("/productquestion")
public class QnAProductController {

	@Autowired
	private QnAProductService qnaService;
	@Autowired
	private HttpSession httpsession;
	@Autowired
	private AnswerProductService answerproductservice;
	@Autowired
	private ProductService productservice;
	
	// 처음 페이지 진입 시 productqnaList를 조회합니다.
	 @GetMapping
	    public String showAllproductqna( Model model, HttpSession httpsession) {
	        System.out.println("qna 객체 전체 조회 controller");

	        Productqna newqna = new Productqna();
	        model.addAttribute("productplus", newqna);
	        System.out.println("newqna : "+newqna);
	        
	        
	        List<Productqna> productlist = qnaService.readAllProductqnaList();
	        model.addAttribute("productqnaList", productlist);
	        System.out.println("productlist : "+productlist);
	        
	        String seprodcutid = (String) httpsession.getAttribute("productid");
	        model.addAttribute("seproductidkey",seprodcutid);
	        
	        List<Productanswer> productanslist = answerproductservice.readAllProductanswerList();
	        model.addAttribute("productanslistkey",productanslist);
	        
		    // productqna를 productupdateqna라는 모델 속성에 추가합니다.		    
	        return "/question/productQnA/productqnas";
	    }

	    // 추가
	    @PostMapping("/add")
	    public String createPostqna(@ModelAttribute("productplus") Productqna qna) {
	        System.out.println("add postMapping");
	        qnaService.createProductlqna(qna);
	        return "redirect:/products/product?id=" + qna.getProductid();
	    }
	
	  //하나조회
		@GetMapping("/productqna")
		public String showproductqna(@RequestParam("productnumber") String productnumber, Model model) {
		    Productqna productqnanumber = qnaService.readProductqnaBynumber(productnumber);
		    model.addAttribute("productqna", productqnanumber);
		    return "/question/productQnA/productqnas";
		}
	
	@PostMapping("/productadd")
	public String createPostqna(@ModelAttribute("productplus") Productqna qna, Model model) {
		System.out.println("add postMapping");
		qnaService.createProductlqna(qna);
		List<Productqna> productqnaList = qnaService.readAllProductqnaList();
		model.addAttribute("productqnaList", productqnaList);
	
		return "redirect:/productquestion";
	}	
	
	@GetMapping("/productupdate") // URL Mapping 수정
	@ResponseBody
	public Productqna Updateproductqnaget(@RequestParam("productid") String productid, Model model) {
	    Productqna productqna = qnaService.readProductqnaBynumber(productid);
	    model.addAttribute("product123", productqna);
//	    System.out.println("updateController ResponseBody : "+productqna); //가져옴
	    return productqna;
	}

	@PostMapping("/productupdate") // URL Mapping 수정
	public String UpdateqnaForm(@ModelAttribute("productupdateqna") Productqna productqna) {
	    qnaService.updateProductqna(productqna);
	    return "redirect:/products/product?id=" + productqna.getProductid(); // 수정 후 리다이렉트할 URL 지정
	}
	
	// 삭제 처리를 위한 컨트롤러 메서드
	@RequestMapping(value="/productdelete")
	public String deleteQnA(Model model, @RequestParam("productid") String productnumber, Productqna qna) {
	    
		Product pdById = productservice.readProductById(productnumber);
		model.addAttribute("pd", pdById); // product.jsp 에서 pd. 해서 꺼내쓰면됨
		// pd.productId와 productnumber가 일치하는지 확인
	    if (productnumber.equals(pdById.getProductId())) {
	        // 일치하는 경우, 상품 QnA 삭제 처리
	        qnaService.deleteProductqna(productnumber);
	    } else {
	        // 일치하지 않는 경우, 아무런 동작 없음 (이미 JavaScript에서 알림창을 통해 사용자에게 알려줌)
	        // 필요에 따라 예외 처리 등을 추가할 수 있음
	    }

	    // 삭제 후, 상품 페이지로 리다이렉트
	    return "redirect:/products";
	}
}
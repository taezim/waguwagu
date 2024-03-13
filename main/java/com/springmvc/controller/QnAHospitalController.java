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
import org.springframework.web.bind.annotation.ResponseBody;

import com.springmvc.domain.Hospitalqna;
import com.springmvc.service.QnAHospitalService;

@Controller
@RequestMapping("/hospitalquestion")
public class QnAHospitalController {

	@Autowired
	private QnAHospitalService qnaService;
	
	
	//Hospital
	
	//조회
	//전체조회
	@GetMapping //수정
	public String showAllhospitalqna(Model model)
	{
		
		Hospitalqna newqna = new Hospitalqna();
		model.addAttribute(newqna);
		
		System.out.println("qna 객체 전체 조회 controller");
		List<Hospitalqna> hospitallist = qnaService.readAllhospitalqnaList();
		model.addAttribute("hospitalqnaList", hospitallist);
		return "/question/hospitalQnA/hospitalqnas";
	}
	//하나조회
	@GetMapping("/hospitalqna")
	public String showhospitalqna(@RequestParam("hospitalnumber") String hospitalnumber, Model model) {
	    System.out.println("qna 조회 controller");
	    Hospitalqna hospitalqnanumber = qnaService.readHospitalqnaBynumber(hospitalnumber);
	    model.addAttribute("hospitalqna", hospitalqnanumber);
	    return "/question/hospitalQnA/hospitalqna";
	}
	//추가
	@GetMapping("/hospitaladd")
	public String createGetqna(@ModelAttribute("hospitalplus") Hospitalqna newqna)
	{
		System.out.println("add getMapping");
		return "/question/hospitalQnA/hospitaladdqna";
	}
	
	
	@PostMapping("/add")
	public String createPostqna(@ModelAttribute("hospitalplus") Hospitalqna qna) 
	{
		System.out.println("add postMapping");
	    
		qnaService.createHospitalqna(qna);
	    return "redirect:/hospitalquestion";
	}
	
	//수정
	@GetMapping("/hospitalupdate")
	@ResponseBody
	public Hospitalqna Updatehospitalqnaget(@RequestParam("hospitalparamid") String qnanumber, Model model) {
	     System.out.println("update getMapping");
	    Hospitalqna hospitalqna = qnaService.readHospitalqnaBynumber(qnanumber);
	    model.addAttribute("hospital123", hospitalqna);
	    System.out.println("hospitalqna Controller : "+hospitalqna);
	    return hospitalqna;
	}

	
	@PostMapping("/hospitalupdate")
	public String UpdateqnaForm(@ModelAttribute("hospitalupdateqna") Hospitalqna hospitalqna) {
	    System.out.println("qnA 객체 가져옴 : " + hospitalqna);
	    System.out.println("qnA의 Number: " + hospitalqna.getNumber());
	    System.out.println("update postMapping");

	    qnaService.updateHospital(hospitalqna);
	    return "redirect:/hospitalquestion";
	}
	
	//삭제
		@RequestMapping(value="/hospitaldelete")
		public String deleteQnA(Model model, @RequestParam("hospitalid") String hospitalnumber)
		{
			qnaService.deleteHospital(hospitalnumber);
			return "redirect:/hospitalquestion";
		}
	
	

}

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

import com.springmvc.domain.Classanswer;
import com.springmvc.domain.Classqna;
import com.springmvc.service.AnswerClassService;
import com.springmvc.service.QnAClassService;

@Controller
@RequestMapping("/classquestion")
public class QnAClassController {

	@Autowired
	private QnAClassService qnaService;
	@Autowired
	private HttpSession httpsession;
	@Autowired
	private AnswerClassService  answerclassservice;

	// 처음 페이지 진입 시 classqnaList를 조회합니다.
	@GetMapping
	public String showAllclassqna(@ModelAttribute("classview") Classqna classqna,Model model, HttpSession session) {
		System.out.println("qna 객체 전체 조회 controller");

		Classqna newqna = new Classqna();
		model.addAttribute("classplus", newqna);
		System.out.println("newqna : " + newqna);

		List<Classqna> classlist = qnaService.readAllClassqnaList();
		model.addAttribute("classqnaList", classlist);
		System.out.println("classlist : " + classlist);

		// 세션에서 classid를 가져와서 모델에 추가
		String classid = (String) session.getAttribute("classid");
		model.addAttribute("classidkey", classid);
		System.out.println("classid: " + classid);

		List<Classanswer> classanslist = answerclassservice.readAllclassanswerLists();
		model.addAttribute("classanslistkey", classanslist);
		System.out.println("classanslist : "+classanslist);

		// classqna를 classupdateqna라는 모델 속성에 추가합니다.
		return "/question/classQnA/classqnas";
	}
	

	// 추가
	@PostMapping("/add")
	public String createPostqna(@ModelAttribute("classplus") Classqna qna) {
		System.out.println("add postMapping");
		qnaService.createClassqna(qna);
		return "redirect:/classquestion";
	}

	// 하나조회
	@GetMapping("/classqna")
	public String showclassqna(@RequestParam("classnumber") String classnumber, Model model) {
		Classqna classqnanumber = qnaService.readClassqnaBynumber(classnumber);
		model.addAttribute("classqna", classqnanumber);
		return "/question/classQnA/classqnas";
	}

	@PostMapping("/classadd")
	public String createPostqna(@ModelAttribute("classplus") Classqna qna, Model model) {
		System.out.println("add postMapping");
		qnaService.createClassqna(qna);
		List<Classqna> classqnaList = qnaService.readAllClassqnaList();
		model.addAttribute("classqnaList", classqnaList);

		return "redirect:/classquestion";
	}

	@GetMapping("/classupdate") // URL Mapping 수정
	@ResponseBody
	public Classqna Updateclassqnaget(@RequestParam("classid") String classid, Model model) {
		Classqna classqna = qnaService.readClassqnaBynumber(classid);
		model.addAttribute("class123", classqna);
//	    System.out.println("updateController ResponseBody : "+classqna); //가져옴
		return classqna;
	}

	@PostMapping("/classupdate") // URL Mapping 수정
	public String UpdateqnaForm(@ModelAttribute("classupdateqna") Classqna classqna) {
		qnaService.updateClassqna(classqna);
		return "redirect:/lessons"; // 수정 후 리다이렉트할 URL 지정
	}

	// 삭제
	@RequestMapping(value = "/classdelete")
	public String deleteQnA(Model model, @RequestParam("classid") String classnumber) {
		qnaService.deleteClassqna(classnumber);
		return "redirect:/classquestion";
	}
}
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

import com.springmvc.domain.Hospitalanswer;
import com.springmvc.service.AnswerHospitalService;

@Controller
@RequestMapping("/hospitalanswers")
public class AnswerHospitalController {

	@Autowired
	private AnswerHospitalService answerService;
	
	//				Hospital	Controller Line				//
	
	//Read Line	
	//All Read
	
	@GetMapping
	public String showhospitalAllanswer(Model model)
	{
		List<Hospitalanswer> list = answerService.readAllhospitalanswerLists();
		model.addAttribute("answerlists", list);
		System.out.println("controller : " + list);
		return "/answer/hospitalanswer/hospitalanss";
	}
	//one Read
	
	@GetMapping("/hospitalanswer")
	public String showhospitalanswer(@RequestParam("an") String answernumber, Model model) {
		Hospitalanswer answer = answerService.readHospitalanswerBynumber(answernumber);
	    model.addAttribute("answerlistone", answer);
	    System.out.println("controller : " + answer);
	    return "/answer/hospitalanswer/hospitalans";
	}
	
	//Create
	
	@GetMapping("/hospitaladd")
	public String createhospitalGetQnA(@ModelAttribute("hospitalcreateanswer") Hospitalanswer hospitalnewanswer)
	{
		return "/answer/hospitalanswer/hospitalcreateans";
	}
	
	
	@PostMapping("/hospitaladd")
	public String createhospitalPostQnA(@ModelAttribute("hospitalcreateanswer") Hospitalanswer hospitalanswer) 
	{
	    
		answerService.createHospitalanswer(hospitalanswer);
	    return "redirect:/hospitalanswers";
	}
	
	//Update
	
	@GetMapping("/hospitalupdate")
	public String UpdatehospitalForm(@ModelAttribute("hospitalupdateanswer") Hospitalanswer qnanumber,
			@RequestParam("hospitalupdatean") String number, Model model) {
		Hospitalanswer hospitalansw = answerService.readHospitalanswerBynumber(number);
	    model.addAttribute("hospitalupdatelist", hospitalansw);
	    return "/answer/hospitalanswer/hospitalupdateans";
	}

	@PostMapping("/hospitalupdate")
	public String UpdatehospitalForm(@ModelAttribute("hospitalupdateanswer") Hospitalanswer ananswer) {
	    answerService.updateHospital(ananswer);
	    System.out.println("controller : " + ananswer);
	    return "redirect:/hospitalanswers";
	}
	
	//Delete
	
	@RequestMapping(value="/hospitaldelete")
	public String deletehospitalanswer(Model model, @RequestParam("answerjs") String questionnumber) {
	  System.out.println(questionnumber);
	  answerService.deleteHospital(questionnumber);
	  return "redirect:/hospitalanswers";
	}
	
	
	//			Product		Controller Line				//
		
	
	
	
	//			Class		Controller Line				//
	
	
	
}

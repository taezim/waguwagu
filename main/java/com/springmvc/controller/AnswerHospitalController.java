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

import com.springmvc.domain.HospitalInfo;
import com.springmvc.domain.Hospitalanswer;
import com.springmvc.repository.HospitalInfoRepository;
import com.springmvc.service.AnswerHospitalService;
import com.springmvc.service.QnAHospitalService;

@Controller
@RequestMapping("/hospitalanswers")
public class AnswerHospitalController {

	@Autowired
	private AnswerHospitalService answerService;
	@Autowired
	private HospitalInfoRepository hospitalinforepository;
	@Autowired
	private QnAHospitalService qnahospitalservice;
	
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
	public String createhospitalGetQnA(@ModelAttribute("hospitalcreateanswer") Hospitalanswer hospitalnewanswer,@RequestParam("hospitalid") String paramhospitalid, Model model)
	{
	    hospitalnewanswer.setHospitalid(paramhospitalid); // hospitalid를 설정해줍니다.
	    HospitalInfo hospitalInfoById = hospitalinforepository.readHospitalInfoById(paramhospitalid);
	    model.addAttribute("hospitalkey",hospitalInfoById);
	    System.out.println("hospitalid 난 get : "+hospitalInfoById.getId());
	    
	    return "/answer/hospitalanswer/hospitalcreateans";
	}
	
	
	@PostMapping("/hospitaladd")
	public String createhospitalPostQnA(@ModelAttribute("hospitalcreateanswer") Hospitalanswer hospitalanswer, Model model) 
	{
	    // 이미 hospitalid를 파라미터로 받았기 때문에 다시 설정할 필요가 없습니다.
	    answerService.createHospitalanswer(hospitalanswer);
	    
	    // hospitalanswer 객체의 hospitalid 필드를 사용합니다.
	    System.out.println("hospitalid 나는 post: "+hospitalanswer.getHospitalid());
	    
	    return "redirect:/hospitalinfo/hospital?id="+ hospitalanswer.getHospitalid(); // hospitalanswer에서 직접 hospitalid를 가져와서 사용합니다.
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

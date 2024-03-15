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

import com.springmvc.domain.Classanswer;
import com.springmvc.service.AnswerClassService;

@Controller
@RequestMapping("/classanswers")
public class AnswerClassController {

	@Autowired
	private AnswerClassService answerService;
	private HttpSession	httpsession;
		
//					Class	Controller Line	

	//Read Line	
	//All Read

	@GetMapping
	public String showClassAllanswer(@ModelAttribute("classplus") Classanswer classanswer,Model model)
	{
	    List<Classanswer> list = answerService.readAllclassanswerLists();
	    model.addAttribute("answerlists", list);
	    System.out.println("controller : " + list);
	    System.out.println("dsa");
	    return "/answer/classanswer/classanss";
	}

	@PostMapping
	public String viewClassAllanswer(@ModelAttribute("classplus") Classanswer classanswer, Model model)
	{

	    return null;
	}
	
	//One Read

	@GetMapping("/classanswer")
	public String showClassanswer(@RequestParam("an") String answernumber, Model model) {
	    Classanswer answer = answerService.readClassanswerBynumber(answernumber);
	    
	    model.addAttribute("answerlistone", answer);
	    System.out.println("controller : " + answer);
	    return "/answer/classanswer/classans";
	}

	//Create

	// GET 요청을 처리하는 메서드
    @GetMapping("/classadd")
    public String createClassGetQnA(@RequestParam("classid") String classid, @ModelAttribute("classcreateanswer") Classanswer classnewanswer) {
        return "/answer/classanswer/classcreateans";
    }

    // POST 요청을 처리하는 메서드
	    @PostMapping("/classadd")
	    public String createClassPostQnA( @ModelAttribute("classcreateanswer") Classanswer classanswer, Model model,HttpSession httpsession) {
        // answerService를 사용하여 객체를 가져옵니다.
        Classanswer classValue = answerService.createClassanswer(classanswer);

        // 답변에 대한 정보를 모델에 추가합니다.
        model.addAttribute("classkey", classValue);
        httpsession.setAttribute("classid", classanswer.getClassid());
        
        return "redirect:/classquestion";
    }


	//Update

	@GetMapping("/classupdate")
	public String UpdateClassForm(@ModelAttribute("classupdateanswer") Classanswer qnanumber,
	        @RequestParam("classupdatean") String number, Model model) {
	    Classanswer classansw = answerService.readClassanswerBynumber(number);
	    model.addAttribute("classupdatelist", classansw);
	    return "/answer/classanswer/classupdateans";
	}

	@PostMapping("/classupdate")
	public String UpdateClassForm(@ModelAttribute("classupdateanswer") Classanswer ananswer) {
	    answerService.updateClassanswer(ananswer);
	    System.out.println("controller : " + ananswer);
	    return "redirect:/classanswers";
	}

	//Delete

	@RequestMapping(value="/classdelete")
	public String deleteClassanswer(Model model, @RequestParam("answerjs") String questionnumber) {
	    System.out.println(questionnumber);
	    answerService.deleteClassanswer(questionnumber);
	    return "redirect:/classanswers";
	}
	
}

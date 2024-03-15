package com.springmvc.controller;

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

import com.springmvc.domain.HospitalInfo;
import com.springmvc.domain.Lesson;
import com.springmvc.domain.LessonReview;
import com.springmvc.service.LessonReviewService;
import com.springmvc.service.LessonService;

@Controller
@RequestMapping("/lessons")
public class LessonController 
{
	
      @Autowired
	  private LessonService lessonService;
	
      @Autowired
      private LessonService ls;
      
      @Autowired
      private LessonReviewService lessonReviewService;
      
   // READ
      @GetMapping
      public String requestLessonList(Model model, HttpSession session)
      {
         List<Lesson> list = ls.readAllClass(); // 호출하니까 이동해야지
         model.addAttribute("list", list); // list. 해서 lessons.jsp에서 꺼내기
         
         String team = (String) session.getAttribute("team");
         model.addAttribute("myteam",team);
         
         
         return "/Lesson/lessons";
      }
      
      
      
      @GetMapping("/all")
      public String requestAllLessons(Model model) 
      {
         List<Lesson> list = ls.readAllClass(); // 호출하니까 이동해야지
         model.addAttribute("list", list);
         return "/Lesson/lessons";
      }
      
      
      
      
      @GetMapping("/lesson")
      public String requestLessonById(@RequestParam("id") String classId, Model model, @ModelAttribute("review")LessonReview lessonReview,HttpSession session)
      {
         Lesson lsById = ls.readClassById(classId);
         double avgScore = lessonReviewService.calculateAvgScore(classId);
         model.addAttribute("ls", lsById); // product.jsp 에서 pd. 해서 꺼내쓰면됨
         model.addAttribute("avgScore",avgScore);

         System.out.println("avgScore : "+avgScore);
         
         List<LessonReview> list = lessonReviewService.readAllReviewList(classId);
 	    
         Lesson lessonById = lessonService.readClassById(classId);

 	    // lessonId를 모델에 추가
 	    model.addAttribute("lessonId", classId);

 	    model.addAttribute("reviewList", list);
 	    model.addAttribute("lesson", lessonById);


 	    System.out.println("lessonId : " + classId);
         
         
 	   // 세션에서 memberId 가져오기
	    String memberId = (String) session.getAttribute("memberId");
	    System.out.println("memberId=" + memberId);

	    // 기존에 사용되던 Member 객체를 사용하지 않음

	    model.addAttribute("id", memberId);
	    
	    
	    String team = (String) session.getAttribute("team");
	    model.addAttribute("myteam",team);
	    // 리뷰 추가와 마찬가지로 수정을 위한 객체도 모델에 추가
	    model.addAttribute("updateReview", new LessonReview());
	   /* 
	    String reviewId = lessonReview.getReviewId();
		 LessonReview reviewById = lessonReviewService.readReviewById(reviewId);
		 
		 model.addAttribute("review", reviewById);
		 System.out.println("x="+reviewById); System.out.println("아이디="+reviewId);
		 */
         return "/Lesson/lesson";
      }
      
      
      
      
    //location에 따른 뷰 보여주기
 	 @GetMapping("/position")
 	public String showHospitals(@RequestParam(name = "position", required = false) String position, @RequestParam(defaultValue = "1") int page,Model model, HttpSession session) {
 	// location 파라미터에 따라 필요한 데이터를 가져와서 모델에 추가
 	List<Lesson> lessons = lessonService.findByPosition(position);
 	// 예를 들어, location이 null이면 전체 데이터를 가져오고, 아니면 해당 지역의 데이터를 가져오도록 구현
 	
 	// 모델에 데이터 추가
     model.addAttribute("list", lessons);
     
     String team = (String) session.getAttribute("team");
     model.addAttribute("myteam",team);
     
 	
 	return "/Lesson/lessons"; // 실제 뷰 이름으로 수정
 	}
      
      
      @GetMapping("/add")
      public String requestAddLessonForm(@ModelAttribute("addLesson")Lesson lesson,HttpSession session,Model model) 
      {
    	  
         return "/Lesson/addLesson";
      }
      
      

      @PostMapping("/add")
      public String submitAddNewLesson(@ModelAttribute("addLesson")Lesson lesson,HttpSession session,Model model) 
      {
    	  
    	// 세션에서 memberId 가져오기
  	    String memberId = (String) session.getAttribute("memberId");
  	    System.out.println("memberId=" + memberId);

  	    // 기존에 사용되던 Member 객체를 사용하지 않음

  	    model.addAttribute("id", memberId);
    	 
    	 
    	 String lessonId = generateLessonId(10);
    	 System.out.println(lessonId);
    	 lesson.setClassId(lessonId);
         System.out.println("PostMapping 도착");
         ls.setNewClass(lesson);
         return "redirect:/lessons";
      }
      
      private String generateLessonId(int length) {
  		
  		if(length<=0) {
  			throw new IllegalArgumentException("길이는 1이상이어야 합니다.");
  		}
  		Random random = new Random();
  		StringBuilder stringBuilder = new StringBuilder();
  		
  		for(int i=0; i<length; i++) {
  			int randomNumber = random.nextInt(10);
  			stringBuilder.append(randomNumber);
  		}
  		return "L_"+ stringBuilder.toString();
  	}
      
      @GetMapping("/update")
      public String getUpdateLessonForm(@ModelAttribute("updateLesson") Lesson lesson, @RequestParam("id") String lessonId, Model model) 
      {
         Lesson lsById = ls.readClassById(lessonId);
         model.addAttribute("lesson",lsById); // lesson.해서 꺼내쓰기
         
         return "/Lesson/updateLesson";      
      }
      
      @PostMapping("/update")
      public String submitUpdateLessonForm(@ModelAttribute("updateLesson") Lesson lesson) 
      {
         ls.setUpdateClass(lesson);
         return "redirect:/lessons";      
      }
      
      @RequestMapping(value="/delete")
      public String getDeleteLessonForm(Model model, @RequestParam("id") String classId) 
      {
         ls.setDeleteClass(classId);
         return "redirect:/lessons";
      }
      
}
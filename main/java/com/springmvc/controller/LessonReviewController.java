package com.springmvc.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.springmvc.domain.HospitalInfo;
import com.springmvc.domain.HospitalReview;
import com.springmvc.domain.Lesson;
import com.springmvc.domain.LessonReview;
import com.springmvc.service.LessonReviewService;
import com.springmvc.service.LessonService;

@Controller
@RequestMapping("/lessons/review")
public class LessonReviewController {

	@Autowired
	private LessonReviewService lessonReviewService;

	@Autowired
	private LessonService lessonService;

	/*
	 * @Autowired private LessonReview lessonReview;
	 */

	@GetMapping()
	public String requestReviewList(@RequestParam("id") String lessonId, Model model, HttpSession session) {
		List<LessonReview> list = lessonReviewService.readAllReviewList(lessonId);
		double avgScore = lessonReviewService.calculateAvgScore(lessonId);
		Lesson lessonById = lessonService.readClassById(lessonId);

		// lessonId를 모델에 추가
		model.addAttribute("lessonId", lessonId);

		model.addAttribute("reviewList", list);
		model.addAttribute("lesson", lessonById);
		model.addAttribute("avgScore", avgScore);

		System.out.println("lessonId : " + lessonId);

		// 세션에서 memberId 가져오기
		String memberId = (String) session.getAttribute("memberId");
		System.out.println("memberId=" + memberId);

		// 기존에 사용되던 Member 객체를 사용하지 않음

		model.addAttribute("id", memberId);

		String team = (String) session.getAttribute("team");
		model.addAttribute("myteam", team);

		return "/Lesson/reviews";

	}

	@GetMapping("/all")
	public String requestAllReview(@RequestParam("id") String reviewId, @RequestParam("lessonId") String lessonId,
			Model model) {
		List<LessonReview> list = lessonReviewService.readAllReviewList(lessonId);
		model.addAttribute("reviewList", list);
		return "/Lesson/reviews";
	}

	@GetMapping("/detaile")
	public String requestReviewById(@RequestParam("id") String reviewId, Model model) {
		LessonReview reviewById = lessonReviewService.readReviewById(reviewId);
		model.addAttribute("review", reviewById);
		return "/Lesson/review";
	}

	// create
	@GetMapping("/add")
	public String requestAddReviewForm(@ModelAttribute("review") LessonReview lessonreview, Model model,
			@RequestParam("id") String lessonId) {
		Lesson lessonById = lessonService.readClassById(lessonId);
		model.addAttribute("lesson", lessonById);
		model.addAttribute("lessonId", lessonId);
		System.out.println("lessonId : " + lessonId);
		return "/Lesson/lesson";
	}

	@PostMapping("/add")
	public String submitAddNewReview(@ModelAttribute("review") LessonReview lessonReview, HttpServletRequest request) {

		String reviewId = generateLessonId(10);
		lessonReview.setReviewId(reviewId);

		// lessonId 저장
		String lessonId = lessonReview.getLessonId();
		lessonReview.setLessonId(lessonId);

		System.out.println("lessonId : " + lessonId);
		lessonReviewService.setNewReview(lessonReview);
		return "redirect:/lessons/lesson?id=" + lessonId;

	}

	private String generateLessonId(int length) {

		if (length <= 0) {
			throw new IllegalArgumentException("길이는 1이상이어야 합니다.");
		}
		Random random = new Random();
		StringBuilder stringBuilder = new StringBuilder();

		for (int i = 0; i < length; i++) {
			int randomNumber = random.nextInt(10);
			stringBuilder.append(randomNumber);
		}
		return "LR_" + stringBuilder.toString();
	}

	// update

	@GetMapping("/update")
	@ResponseBody
	public HashMap<String, LessonReview> getUpdateReviewForm(@ModelAttribute("updateReview") LessonReview lessonReview, @RequestParam("id") String reviewId, @RequestParam("lessonId") String lessonId, Model model) {

		/*
		 LessonReview reviewById = lessonReviewService.readReviewById(reviewId);
		 List<LessonReview> list = lessonReviewService.readAllReviewList(lessonId);
		 double avgScore = lessonReviewService.calculateAvgScore(lessonId); Lesson
		 lessonById = lessonService.readClassById(lessonId);
		 System.out.println("리뷰아아디"+reviewId);
		 
		 // lessonId를 모델에 추가 model.addAttribute("review",reviewById);
		 model.addAttribute("lessonId", lessonId);
		 System.out.println("레슨아이디="+lessonId); model.addAttribute("reviewList",
		 list); model.addAttribute("lesson", lessonById);
		 model.addAttribute("avgScore", avgScore);
		 model.addAttribute("reviewId",reviewId);
		 */
		System.out.println("getmapping 도착");
		LessonReview reviewById = lessonReviewService.readReviewById(reviewId);
		  
	  //model.addAttribute("review", reviewById); 
	  System.out.println("x="+reviewById);
	  System.out.println("아이디="+reviewId);
	  	HashMap<String, LessonReview> test = new HashMap<String, LessonReview>();
	  	
	  	test.put("review", reviewById);
		return test;
	}

	@PostMapping("/update")
	public String submitUpdateReviewForm(@ModelAttribute("updateReview") LessonReview lessonReview, Model model, HttpServletRequest request) {
		
		String reviewId = request.getParameter("id");
		model.addAttribute("reviewId", reviewId); // reviewId를 모델에 추가
		System.out.println("리뷰: " + reviewId);

		String lessonId = request.getParameter("lessonId");
		System.out.println("lessonId : " + lessonId);
		System.out.println("포스팅매핑");
		System.out.println("레슨리뷰="+lessonReview);
		lessonReviewService.setUpdateReview(lessonReview);
		
		return "redirect:/lessons/lesson?id=" + lessonId;
	}

	@GetMapping(value = "/delete")
	public String getDeleteForm(Model model, @RequestParam("id") String reviewId,@RequestParam("lessonId") String lessonId) {
		/* String reviewId = lessonReview.getReviewId(); */

		lessonReviewService.setDeleteReview(reviewId);
		model.addAttribute("reviewId", reviewId);
		return "redirect:/lessons/lesson?id=" + lessonId;
	}

//	@GetMapping("/avg")
//	public String getAvgScore(Model model){
//		double avgScore = lessonReviewService.calculateAvgScore();
//		model.addAttribute("avgScore",avgScore);
//		return "/Lesson/reviews";
//	}

}

package com.springmvc.controller;

import java.io.File;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.springmvc.domain.HospitalInfo;
import com.springmvc.domain.HospitalReview;
import com.springmvc.repository.HospitalInfoRepository;
import com.springmvc.service.HospitalReviewService;

@Controller
@RequestMapping("/hospital/review")
public class HospitalReviewController {
	
	@Autowired
	private HospitalInfoRepository hospitalInfoRepository;
	
	@Autowired
	private HospitalReviewService hospitalReviewService;
	
	@GetMapping
	public String requestReviewList(Model model) {
		List<HospitalReview> list = hospitalReviewService.readAllReviewList();
		model.addAttribute("reviewList",list);
		return "/Hospital/reviews";
	}
	
	@GetMapping("/all")
	public String requestAllReviews(@RequestParam("id") String reviewId, Model model) {
		List<HospitalReview> list = hospitalReviewService.readAllReviewList();
		model.addAttribute("reviewList",list);
		return "/Hospital/reviews";
	}
	
	@GetMapping("/review")
	public String requestReviewById(@RequestParam("id") String reviewId, Model model){
		HospitalReview reviewById = hospitalReviewService.readReviewById(reviewId);
		model.addAttribute("review",reviewById);
		return "/Hospital/review";
	}
	
	//병원id에 따라 리뷰 보여줌
	@GetMapping("/reviews")
    public String hospitalReviewById(@RequestParam("id") String id, Model model) {
		
        HospitalInfo hospitalById = hospitalInfoRepository.readHospitalInfoById(id);
        List<HospitalReview> reviews = hospitalReviewService.readHospitalAllReviewList(id);
        double avgScore = hospitalReviewService.calculateAvgScore(id);
        
        model.addAttribute("hospitalInfo", hospitalById);
        System.out.println("id"+hospitalById);
        
        model.addAttribute("hospitalReviews", reviews);
        model.addAttribute("avgScore",avgScore);
        
        System.out.println("평점:"+avgScore);
        
        return "/Hospital/hospital";
        
    }
	
	
	
	//create
	@GetMapping("/add")
	public String requestAddReviewForm(@ModelAttribute("addReview")HospitalReview hospitalReview,Model model, @RequestParam("id") String id) {
		HospitalInfo hospitalById = hospitalInfoRepository.readHospitalInfoById(id);
        model.addAttribute("hospital", hospitalById);
		return "/Hospital/hospital";
	}
	
	@PostMapping("/add")
	public String submitAddNewReview(@ModelAttribute("addReview")HospitalReview hospitalReview, HttpServletRequest request) {
		
		String reviewId = generateTeamId(10);
		hospitalReview.setReviewId(reviewId);
		System.out.println("등록된 병원리뷰 아이디 : "+ reviewId);
		
		
		// Set the hospital ID
        String hospitalId = hospitalReview.getHospitalId();
        hospitalReview.setHospitalId(hospitalId);
		
		
		hospitalReviewService.setNewReview(hospitalReview);
		return "redirect:/hospitalinfo/hospital?id=" + hospitalId;
	}
	
	
	private String generateTeamId(int length) {
		
		if(length<=0) {
			throw new IllegalArgumentException("길이는 1이상이어야 합니다.");
		}
		Random random = new Random();
		StringBuilder stringBuilder = new StringBuilder();
		
		for(int i=0; i<length; i++) {
			int randomNumber = random.nextInt(10);
			stringBuilder.append(randomNumber);
		}
		return "HR_"+ stringBuilder.toString();
	}
	
	
	@GetMapping("/update")
	public String getUpdateReviewForm(@ModelAttribute("updateReview")HospitalReview hospitalReview, @RequestParam("id") String reviewId, Model model) {
		HospitalReview reviewById = hospitalReviewService.readReviewById(reviewId);
		model.addAttribute("review",reviewById);
		return "/Hospital/updateForm";
	}
	
	@PostMapping("/update")
	public String submitUpdateReviewForm(@ModelAttribute("updateReview")HospitalReview hospitalReview, HttpServletRequest request) {
		
		hospitalReviewService.setUpdateReview(hospitalReview);
		return "redirect:/reviews";
		
	}
	
	@GetMapping(value="/delete")
	public String getDeleteForm(Model model, @RequestParam("id") String reviewId) {
		hospitalReviewService.setDeleteReview(reviewId);
		return "redirect:/reviews";
	}

}

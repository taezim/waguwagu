package com.springmvc.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

//import com.springmvc.domain.CartItem;
import com.springmvc.domain.Hospital;
import com.springmvc.domain.HospitalReservation;
import com.springmvc.domain.Lesson;
//import com.springmvc.repository.OrderRepositoryImpl;
import com.springmvc.service.HRService;
import com.springmvc.service.HospitalService;
import com.springmvc.service.LessonService;

@Controller
@RequestMapping("/hospital") 
public class HospitalReservationController // 클래스 수강 신청
{
	@Autowired 
	HospitalService hospitalService;
	

	@Autowired 
	HRService hospitalReservService;
	
	
	// 수강 신청 (C)
		@GetMapping("/reserve") 
		public String requestRegistForm(@ModelAttribute("reservation")HospitalReservation HR, @RequestParam String hospitalId, Model model, HttpServletRequest request) // 파라미터는 
		{
			System.out.println("@GetMapping reserve 도착" ); // 받아온 파라미터 값을 콘솔에서 확인
			String reserverId = request.getSession().getId();
			System.out.println("병원 ID:"+hospitalId); // 받아온 파라미터 값을 콘솔에서 확인
			Hospital hospital= hospitalService.readHospitalById(hospitalId);
			
			List<HospitalReservation> listOfReserv = hospitalReservService.readAllReservTime(hospitalId);
			dateTimeSeparation(listOfReserv);
			
			model.addAttribute("hospital",hospital);
			model.addAttribute("id",reserverId);
			return "/Hospital/HospitalReservForm"; // 수강 신청 form 페이지 리턴
		}
		
		@PostMapping("/reserve")
		public String confirmRegistForm(@ModelAttribute("reservation")HospitalReservation HR, Model model) 
		{
			System.out.println("레쓰나 : "+ HR.getHospitalId());
			System.out.println(HR.getReservationDate());
			model.addAttribute("hr",HR);
			return "/Hospital/ReservationConfirm";
		}

		@PostMapping("/confirm")
		public String submitReservationForm(@ModelAttribute("reservation")HospitalReservation HR, Model model) 
		{
			System.out.println("풋쓰나 : "+ HR.getHospitalId());
			//String insertDate = OrderRepositoryImpl.getTimeNow();
			//HR.setInsertDate(insertDate);
			hospitalReservService.setNewHR(HR);
			return "/Lesson/Thanks";
			
		}
		
		@GetMapping("/myReserve")
		public String readMyLessonRegistration(Model model, HttpServletRequest req) 
		{
			String sessionId = req.getSession().getId();
			List<HospitalReservation> listOfReserv = hospitalReservService.readAllReservation(sessionId);
			
			model.addAttribute("list",listOfReserv);
			return "/Hospital/ReservationList";
		}
		
		@GetMapping("/{registrationId}")
		public String readLessonById(@PathVariable String registrationId,Model model) 
		{
			System.out.println("수강신청번호"+registrationId);
			HospitalReservation HR = hospitalReservService.readHospitalReservation(registrationId);
			model.addAttribute("hr",HR);
			return "/Hospital/MyHospitalReserv";
		}
	
		String dateTimeSeparation(List<HospitalReservation> listOfReserv) 
		{
			List<String> listOfTime = new ArrayList<String>();
			
			for (HospitalReservation hr : listOfReserv) 
            {
				String reservationDate = hr.getReservationDate();
				listOfTime.add(reservationDate);
            }
			
			return "";
		}
		
		
		
}

package com.springmvc.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

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
import org.springframework.web.multipart.MultipartFile;

import com.springmvc.domain.Hospital;
import com.springmvc.service.HospitalService;

@Controller
@RequestMapping("/hospital")
public class HospitalController {
	
	@Autowired
	private HospitalService hospitalService;
	
	
	@GetMapping
	public String requestHospitalList(Model model,HttpSession session) {
		List<Hospital> list = hospitalService.readAllHospitalList();
		model.addAttribute("hospitalList",list);
		
		String team = (String) session.getAttribute("team");
		model.addAttribute("myteam",team);
		
		return "/Hospital/hospitals";
	}
	
	@GetMapping("/all")
	public String requestAllHospitals(@RequestParam("id") String hospitalId, Model model) {
		List<Hospital> list = hospitalService.readAllHospitalList();
		model.addAttribute("hospitalList", list);
		
		return "/Hospital/hospitals";
	}
	
	@GetMapping("/hospital")
	public String requestHospitalById(@RequestParam("id") String hospitalId, Model model,HttpSession session) {
		Hospital hospitalById = hospitalService.readHospitalById(hospitalId);
		model.addAttribute("hospital", hospitalById);
		
		// 세션에서 memberId 가져오기
	    String memberId = (String) session.getAttribute("memberId");
	    System.out.println("memberId=" + memberId);

	    // 기존에 사용되던 Member 객체를 사용하지 않음

	    model.addAttribute("id", memberId);
 	    
		String team = (String) session.getAttribute("team");
		model.addAttribute("myteam",team);
	    
		return "/Hospital/hospital";
		
	}
	
	
	//Create
	@GetMapping("/a")
	public String requestAddHospitalForm(@ModelAttribute("addHospital")Hospital hospital) {
		return "/Hospital/hadd";  //병원등록페이지.jsp
	}
	
	@PostMapping("/a")
	public String submitAddNewHospital(@ModelAttribute("addHospital")Hospital hospital, HttpServletRequest request) {
		
		MultipartFile img = hospital.getHospitalImage();
		
		String saveName = img.getOriginalFilename();
		String save = request.getSession().getServletContext().getRealPath("/resources/images");
		File saveFile = new File(save,saveName);
		
		if(img!=null&!img.isEmpty()) 
		{
			try 
			{
				img.transferTo(saveFile);
				hospital.setFileName(saveName);
			} 
			
			catch (Exception e) 
			{
				throw new RuntimeException("병원 이미지 업로드 실패");
			}
			
		}
		
		hospitalService.setNewHospital(hospital);
		return "redirect:/hospitals";
		
	}
	
	
	@GetMapping("/update")
	public String getUpdateHospitalForm(@ModelAttribute("updateHospital") Hospital hospital, @RequestParam("id") String hospitalId, Model model) {
		Hospital hospitalById = hospitalService.readHospitalById(hospitalId);
		model.addAttribute("hospital",hospitalById);
		return "/Hospital/hupdateForm";  //업데이트하는jsp호출함
	}
	
	@PostMapping("/update")
	public String submitUpdateHospitalForm(@ModelAttribute("updateHospital") Hospital hospital, HttpServletRequest request) {
		MultipartFile img = hospital.getHospitalImage();
		
		String saveName = img.getOriginalFilename();
		String save = request.getSession().getServletContext().getRealPath("/resources/images");
		
		File saveFile = new File(save,saveName);
		
		if(img!=null&&!img.isEmpty()) 
		{
			try 
			{
				img.transferTo(saveFile);
				hospital.setFileName(saveName);
			}
			
			catch (Exception e) 
			{
				throw new RuntimeException("이미지 업로드 실패");
			}
		}
		hospitalService.setUpdateHospital(hospital);
		return "redirect:/hospitals";   //url다시 발생하면 맼핑되니까
	}
	
	@GetMapping(value="/delete")
	public String getDeleteForm(Model model, @RequestParam("id") String hospitalId) {
		hospitalService.setDeleteHospital(hospitalId);
		return "redirect:/hospitals";
	}
	
//16일
}

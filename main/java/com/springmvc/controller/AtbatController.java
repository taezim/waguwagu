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

import com.springmvc.domain.Atbat;
import com.springmvc.service.AtbatService;

@Controller
@RequestMapping("/atbatstart")
public class AtbatController {

	@Autowired
	private AtbatService atbatService;
	
	// 모든 Atbat 데이터 조회
	@GetMapping
	public String showAllAtbat(Model model) {
		List<Atbat> atbats = atbatService.readAllAtbat();
		model.addAttribute("atbatList", atbats);
		return "/pspf/atbat/atbats";
	}
	
	// 특정 Atbat 데이터 조회
	@GetMapping("/atbat")
	public String showOneAtbat(@ModelAttribute("atbatmodell") Atbat atbbb, @RequestParam("atbatRequest") String atbatNumber, Model model) {
		Atbat atbatOne = atbatService.readAtbatByNumber(atbatNumber);
		model.addAttribute("atbatOne", atbatOne);
		return "/pspf/atbat/atbat";
	}
	
	// Atbat 데이터 생성 화면 이동
	@GetMapping("/createatbat")
	public String createAtbat(@ModelAttribute("atbatmodel") Atbat atbat) {
		return "/pspf/atbat/addatbat";
	}
	
	// Atbat 데이터 생성
	@PostMapping("/createatbat")
	public String createAtbat1(@ModelAttribute("atbatmodel") Atbat atbat) {
		atbatService.createAtbat(atbat);
		return "redirect:/atbatstart";
	}
	
	// Atbat 데이터 수정 화면 이동
	@GetMapping("/updateatbat")
	public String updateAtbatGet(@ModelAttribute("updateatbatmodel") Atbat atbatUpdate,
			@RequestParam("paramatbat") String atbatString, Model model) {
		Atbat atbat = atbatService.readAtbatByNumber(atbatString);
		model.addAttribute("atbat", atbat);
		return "/pspf/atbat/updateatbat";
	}
	
	// Atbat 데이터 수정
	@PostMapping("/updateatbat")
	public String updateAtbat(@ModelAttribute("updateatbatmodel") Atbat atbatUpdate) {
		atbatService.updateAtbat(atbatUpdate);
		return "redirect:/atbatstart";
	}
	
	// Atbat 데이터 삭제
	@RequestMapping(value="/atbatdelete")
	public String deleteAtbat(Model model, @RequestParam("atbatId") String atbatNumber) {
		atbatService.deleteAtbat(atbatNumber);
		return "redirect:/atbatstart";
	}
}

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

import com.springmvc.domain.Batter;
import com.springmvc.service.BatterService;

@Controller
@RequestMapping("/batterstart")
public class BatterController {

	@Autowired
	private BatterService batterService;
	
	//R
	//All(R)
	@GetMapping
	public String showAllBatters(Model model)
	{
		List<Batter> batters = batterService.readAllBatters();
		model.addAttribute("batterLists", batters);
		return "/pspf/batter/batters";
	}
	
	//one
	@GetMapping("batter")
	public String showOneBatter(@RequestParam("batterrequest") String pnumber, Model model)
	{
		Batter batterOne = batterService.readBatterByNumber(pnumber);
		model.addAttribute("batterOne", batterOne);
		return "/pspf/batter/batter";
	}
	
	//Create
	@GetMapping("/createbatter")
	public String createBatterGet(@ModelAttribute("battermodel") Batter batter)
	{
		return "/pspf/batter/addbatter";
	}
	
	@PostMapping("/createbatter")
	public String createBatterPost(@ModelAttribute("battermodel") Batter batter)
	{
		batterService.createBatter(batter);
		return "redirect:/batterstart";
	}
	
	//Update
	@GetMapping("/updatebatter")
	public String updateBatterGet(@ModelAttribute("updatebattermodel") Batter batterUp,
			@RequestParam("parambatter") String ppstring, Model model)
	{
		Batter batter = batterService.readBatterByNumber(ppstring);
		model.addAttribute("game12", batter);
		return "/pspf/batter/updatebatter";
	}
	
	@PostMapping("/updatebatter")
	public String updateBatterPost(@ModelAttribute("updatebattermodel") Batter batterUp)
	{
		batterService.updateBatter(batterUp);
		return "redirect:/batterstart";
	}
	
	//Delete
	@RequestMapping(value="/batterdelete")
	public String deleteBatter(Model model, @RequestParam("batterid") String batterNum)
	{
		batterService.deleteBatter(batterNum);
		return "redirect:/batterstart";
	}
	

}

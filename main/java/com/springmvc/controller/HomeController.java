package com.springmvc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springmvc.domain.Game;
import com.springmvc.domain.TeamWinning;
import com.springmvc.repository.TeamWinningRepository;
import com.springmvc.service.GameService;

@Controller
@RequestMapping("/home")
public class HomeController {
	
	
	@Autowired
	private GameService gameService;
	
	@Autowired
	private TeamWinningRepository teamWinningRepository;

	@GetMapping()
	public String home(Model model, HttpSession session) {
		System.out.println("홈페이지다!");
		
		List<Game> list = gameService.readAllGame();
		model.addAttribute("list",list);
		
		List<TeamWinning> sortedWinningList = teamWinningRepository.calAndSortWinningRate();
	    model.addAttribute("winningList", sortedWinningList);
	    String team = (String) session.getAttribute("team");
		model.addAttribute("myteam",team);
		return "realHome";
	}
}

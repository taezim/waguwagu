package com.springmvc.controller;

import java.io.File;

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

import com.springmvc.domain.Game;
import com.springmvc.domain.Match;
import com.springmvc.service.GameService;
import com.springmvc.service.MatchService;

@Controller
@RequestMapping("/match")
public class MatchController {

	@Autowired
	private GameService gameService;
	
	@Autowired
	private MatchService matchService;
	
	@GetMapping
	public String requestGameById(@RequestParam("id") String gameId, Model model,HttpServletRequest request, HttpSession session) {
		Game gameById = gameService.readGameById(gameId);
		model.addAttribute("game",gameById);
		
		String team = (String) session.getAttribute("team");
		model.addAttribute("myteam",team);
		return "Game/game";
	}
	
	
	@GetMapping("/add")
	public String requestAddMatchForm(@ModelAttribute("addMatch") Match match, @RequestParam("id") String gameId, Model model,HttpSession session) {
		
//		Game game = new Game();
//		String gameId = game.getGameId();
		//model.addAttribute("match",gameById);
		model.addAttribute("gameId", gameId);
		String memberId = (String)session.getId();
		return "/Game/addMatch";
	}
	
	@PostMapping("/add")
	public String submitAddMatch(@ModelAttribute("addMatch") Match match, @RequestParam("id") String gameId, Model model, HttpServletRequest request) {
		System.out.println("POSTMAPPING ADD 도착");
		System.out.println("Game ID from URL: " + gameId);
		
		//Game game = new Game();
		//String gameId = game.getGameId();
		match.setGameId(gameId);
		
		
		MultipartFile img = match.getGameImage();
		
		String saveName = img.getOriginalFilename();
		String save = request.getSession().getServletContext().getRealPath("/resources/images");
		File saveFile = new File(save,saveName);
		
		if(img!=null&&!img.isEmpty()) {
			try {
				img.transferTo(saveFile);
				match.setFileName(saveName);
			}
			catch(Exception e) {
				throw new RuntimeException("사진 등록 실패");
			}
		}
		System.out.println("filname="+match.getFileName());
		matchService.setNewMatch(match);
		return "redirect:/games";
	}
	
	@GetMapping("/update")
	public String getUpdateMatchForm(@ModelAttribute("updateMatch") Match match, @RequestParam("id")String gameId, Model model) {
		System.out.println("gameId = "+gameId);
		Match gameById = matchService.readMatchById(gameId);
		model.addAttribute("game",gameById);
		
		return "/Game/updateMatch";
	}
	
	@PostMapping("/update")
	public String submitUpdateMatchForm(@ModelAttribute("updateMatch") Match match, HttpServletRequest request, Model model) {
		
		MultipartFile img = match.getGameImage();
		String saveName = img.getOriginalFilename();
		String save = request.getSession().getServletContext().getRealPath("/resources/images");
		File saveFile = new File(save,saveName);
		
		if(img!=null&&img.isEmpty()) {
			try {
				img.transferTo(saveFile);
				match.setFileName(saveName);
			}
			catch(Exception e) {
				throw new RuntimeException("사진 등록 실패");
			}
		}
		
		matchService.setUpdateMatch(match);
		return "redirect:/games";
	}
	
	@RequestMapping("/delete")
	public String getDeleteForm(Model model, @RequestParam("id")String gameId) {
		System.out.println("delete시작");
		System.out.println(gameId+"삭제됨!!!");
		matchService.setDeletMatch(gameId);
		return "redirect:/games";
	}
}

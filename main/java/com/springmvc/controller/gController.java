package com.springmvc.controller;


import java.io.File;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.springmvc.domain.Game;
import com.springmvc.domain.Match;
import com.springmvc.domain.TeamWinning;
import com.springmvc.repository.TeamWinningRepository;
import com.springmvc.service.GameService;
import com.springmvc.service.MatchService;


@Controller
@RequestMapping("/gs")
public class gController {

	@Autowired
	private TeamWinningRepository teamWinningRepository;
	
	@Autowired
	private GameService gameService;

	@Autowired
	private MatchService matchService;
	
	@GetMapping
	public String requestGameList(Model model)
	{
		List<Game> list = gameService.readAllGame();
		model.addAttribute("list",list);
		return "/Game/allgames";
	}
	
	@GetMapping("/all")
	public String requestAllGames(Model model)
	{
		List<Game> list = gameService.readAllGame();
		model.addAttribute("list",list);
		return "/Game/allgames";
	}
	
	@GetMapping("/game")
	public String requestGameById(@RequestParam("id") String gameId, Model model) {
//		Match matchById = matchService.readMatchById(gameId);
//		model.addAttribute("match",matchById);
		
		Game gameById = gameService.readGameById(gameId);
		model.addAttribute("game",gameById);
		List<TeamWinning> sortedWinningList = teamWinningRepository.calAndSortWinningRate();
	    model.addAttribute("winningList", sortedWinningList);
		
		return "/Game/matches";
	}
	
	@GetMapping("/add")
	public String requestAddGameForm(@ModelAttribute("addGame")Game game, Model model) 
	{
		return "/Game/gameAdd";
	}
	
	
	@PostMapping("/add")
	public String submitAddNewGame(@ModelAttribute("addGame")Game game, Model model ,HttpServletRequest request) {
		System.out.println("POSTMAPPING 도착");
		String gameId = generateGameId(10);
		System.out.println(gameId);
		game.setGameId(gameId);
//		Match match = new Match();
//		match.setGameId(gameId);
		MultipartFile img = game.getGameImage();
		
		String saveName = img.getOriginalFilename();
		String save = request.getSession().getServletContext().getRealPath("/resources/images");
		File saveFile = new File(save,saveName);
		
		if(img!=null&&!img.isEmpty()) {
			try {
				img.transferTo(saveFile);
				game.setFileName(saveName);
			}
			catch(Exception e) {
				throw new RuntimeException("사진 등록 실패");
			}
		}
		gameService.setNewGame(game);
		return "redirect:/gs";
	}
	
	private String generateGameId(int length) {
		
		if(length<=0) {
			throw new IllegalArgumentException("길이는 1이상이어야 합니다.");
		}
		Random random = new Random();
		StringBuilder stringBuilder = new StringBuilder();
		
		for(int i=0; i<length; i++) {
			int randomNumber = random.nextInt(10);
			stringBuilder.append(randomNumber);
		}
		return "G_"+ stringBuilder.toString();
	}
	
	@GetMapping("/update")
	public String getUpdateGameForm(@ModelAttribute("UpdateGame") Game game, @RequestParam("id") String gameId, Model model) {
		System.out.println("game Id : " +gameId);
		Game gameById = gameService.readGameById(gameId);
		model.addAttribute("game",gameById);
		
		
		return "/Game/updateGame";
	}
	
	@PostMapping("/update")
	public String submitUpdateGameForm(@ModelAttribute("UpdateGame") Game game, HttpServletRequest request, Model model) {
		
		MultipartFile img = game.getGameImage();
		
		System.out.println("포스트맵핑");
		System.out.println("game Id : " +game.getTeamId1());
		System.out.println(game);
		String saveName = img.getOriginalFilename();
		String save = request.getSession().getServletContext().getRealPath("/resources/images");
		File saveFile = new File(save,saveName);
		
		if(img!=null&&!img.isEmpty()) {
			try {
				img.transferTo(saveFile);
				game.setFileName(saveName);
			}
			catch(Exception e) {
				throw new RuntimeException("사진 등록 실패");
			}
		}
		
		gameService.setUpdateGame(game);
		return "redirect:/gs";
		
	}
	
	@RequestMapping(value="/delete")
	public String getDeleteForm(Model model, @RequestParam("id")String gameId) {
		System.out.println("delete시작");
		System.out.println(gameId+"삭제됨!!!");
		gameService.setDeleteGame(gameId);
		return "redirect:/gs";
	}
	
	

}

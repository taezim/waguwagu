package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.Game;
import com.springmvc.repository.GameRepository;

@Service
public class GameServiceImpl implements GameService{

	@Autowired
	GameRepository gameRepository;
	
	@Override
	public List<Game> readAllGame() {
		// TODO Auto-generated method stub
		return gameRepository.readAllGame();
	}

	@Override
	public Game readGameById(String gameId) {
		Game gameById = gameRepository.readGameById(gameId);
		return gameById;
	}

	@Override
	public void setNewGame(Game game) {
		gameRepository.setNewGame(game);
		
	}

	@Override
	public void setUpdateGame(Game game) {
		gameRepository.setUpdateGame(game);
		
	}

	@Override
	public void setDeleteGame(String gameId) {
		gameRepository.setDeleteGame(gameId);
		
	}

}

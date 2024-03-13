package com.springmvc.service;

import java.util.List;

import com.springmvc.domain.Game;

public interface GameService {

	List<Game> readAllGame();
	Game readGameById(String gameId);
	
	void setNewGame(Game game);
	void setUpdateGame(Game game);
	void setDeleteGame(String gameId);
}

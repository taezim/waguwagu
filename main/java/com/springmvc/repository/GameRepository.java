package com.springmvc.repository;

import java.util.List;

import com.springmvc.domain.Game;

public interface GameRepository {

	List<Game> readAllGame();
	Game readGameById(String gameId);
	
	void setNewGame(Game game);
	void setUpdateGame(Game game);
	void setDeleteGame(String gameId);
}

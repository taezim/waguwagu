package com.springmvc.repository;

import java.util.List;

import com.springmvc.domain.Batter;

public interface BatterRepository {

List<Batter> readAllBatters();

Batter readBatterByNumber(String batterNumber);

List<Batter> readBatterListByCategory(String category);

void createBatter(Batter batter);

void updateBatter(Batter batter); 

void deleteBatter(String batterNumber);
}





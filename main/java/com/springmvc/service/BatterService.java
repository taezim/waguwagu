package com.springmvc.service;

import java.util.List;

import com.springmvc.domain.Batter;

public interface BatterService {

List<Batter> readAllBatters();

Batter readBatterByNumber(String batterNumber);

List<Batter> readBatterListByCategory(String category);

void createBatter(Batter batter);

void updateBatter(Batter batter); 

void deleteBatter(String batterNumber);

}
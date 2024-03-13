package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.Batter;
import com.springmvc.repository.BatterRepository;

@Service
public class BatterServiceImpl implements BatterService {

@Autowired
private BatterRepository batterRepository;

@Override
public List<Batter> readAllBatters() {
	return batterRepository.readAllBatters();
}

@Override
public Batter readBatterByNumber(String batterNumber) {
	return batterRepository.readBatterByNumber(batterNumber);
}

@Override
public List<Batter> readBatterListByCategory(String category) {
	return batterRepository.readBatterListByCategory(category);
}

@Override
public void createBatter(Batter batter) {
	batterRepository.createBatter(batter);
}

@Override
public void updateBatter(Batter batter) {
	batterRepository.updateBatter(batter);
}

@Override
public void deleteBatter(String batterNumber) {
	batterRepository.deleteBatter(batterNumber);
}
}
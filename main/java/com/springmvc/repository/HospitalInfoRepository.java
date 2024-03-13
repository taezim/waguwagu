package com.springmvc.repository;

import java.util.List;
import java.util.Map;

import com.springmvc.domain.HospitalInfo;

public interface HospitalInfoRepository {
	void saveDataToDB(List<Map<String, String>> dataList);
	List<HospitalInfo> findHospitalData(int limit, int offset);
	int getTotalItemCount();
	HospitalInfo readHospitalInfoById(String id);
	List<HospitalInfo> findByLocation(String location);
	
}

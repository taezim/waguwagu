package com.springmvc.repository;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.Product;
import com.springmvc.domain.Stadium;

@Repository
public class StadiumRepositoryImpl implements StadiumRepository
{ 

	private JdbcTemplate template;
	
	@Autowired
	public void setJdbcTemplate(DataSource dataSource) 
	{
		this.template = new JdbcTemplate(dataSource);
	}
	
	private List<Stadium> listOfStadiums = new ArrayList<Stadium>();
	
	 public StadiumRepositoryImpl() 
	 {
		 /*first STD*/
		 Stadium std = new Stadium("stadium1", "잠실 경기장", "서울");
		 std.setCountryside(null);
		 std.setOwnership(null);
		 std.setManager(null);
		 std.setSiteArea("0");
		 std.setBuildingArea("1");
		 std.setTotalArea("0");
		 std.setInfieldMaterial(null);
		 std.setOutfieldMaterial(null);
		 std.setCenterLength("1");
		 std.setBaseLength("0");
		 std.setSeatsNumber("0");
		 std.setCapacity("0");
		 std.setBuiltYear("2022-03-14");
		 std.setFileName("stadium1");
		 
		 /*second DTO*/
		 Stadium std2 = new Stadium("stadium2", "잠장", "경남");
		 std.setCountryside(null);
		 std.setOwnership(null);
		 std.setManager(null);
		 std.setSiteArea("0");
		 std.setBuildingArea("1");
		 std.setTotalArea("0");
		 std.setInfieldMaterial(null);
		 std.setOutfieldMaterial(null);
		 std.setCenterLength("1");
		 std.setBaseLength("0");
		 std.setSeatsNumber("0");
		 std.setCapacity("0");
		 std.setBuiltYear("2022-03-14");
		 std.setFileName("stadium2");
		
		 /*third DTO*/
		 Stadium std3 = new Stadium("stadium3", "실장", "부산");
		 std.setCountryside(null);
		 std.setOwnership(null);
		 std.setManager(null);
		 std.setSiteArea("0");
		 std.setBuildingArea("1");
		 std.setTotalArea("0");
		 std.setInfieldMaterial(null);
		 std.setOutfieldMaterial(null);
		 std.setCenterLength("1");
		 std.setBaseLength("0");
		 std.setSeatsNumber("0");
		 std.setCapacity("0");
		 std.setBuiltYear("2022-03-14");
		 std.setFileName("stadium3");
		 
		 listOfStadiums.add(std);
		 listOfStadiums.add(std2);
		 listOfStadiums.add(std3);
	 }

	@Override
	public List<Stadium> readAllStaidumList() 
	{
		String SQL = "SELECT * FROM stadium";
		List<Stadium> listOfStadiums = template.query(SQL, new StadiumRowMapper());
		return listOfStadiums;
	}

	@Override
	public List<Stadium> readStaidumListByCity(String city) {
		List<Stadium> stadiumsByCity = new ArrayList<Stadium>();
		for(int i=0; i<listOfStadiums.size(); i++) 
			{
				Stadium std = listOfStadiums.get(i);
				if(city.equalsIgnoreCase(std.getCity())) 
				{
					stadiumsByCity.add(std);
				}
			}
		return stadiumsByCity;
	}
	

	@Override
	public Stadium readStaidumById(String stadiumId) {
		Stadium stdInfo = null;
		// 17단원 수정
		String SQL = "SELECT count(*) FROM stadium where s_id=?";
		int rowCount = template.queryForObject(SQL, Integer.class, stadiumId);
			if(rowCount!=0) 
			{
				SQL = "SELECT * FROM stadium where s_id=?";
				stdInfo = template.queryForObject(SQL, new Object[] {stadiumId}, new StadiumRowMapper());
			}
			if(stdInfo==null) 
			{
				throw new IllegalArgumentException("도서 ID가 "+stadiumId+"인 해당 도서를 찾을 수 없습니다.");
			
			}
			return stdInfo;
		}

	@Override
	public void setNewStaidum(Stadium std) 
	{
		listOfStadiums.add(std);
		
	}

	@Override
	public void setUpdateStadium(Stadium std) 
	{

		if(std.getFileName()!=null) 
		{
			String SQL = "UPDATE stadium SET s_stdName=?, s_city=?, s_countryside=?, s_siteArea=?, s_buildingArea=?, s_totalArea=?, s_infieldMaterial=?, s_outfieldMaterial=?, s_centerLength=?, s_baseLength=?, s_seatsNumber=?, s_capacity=?, s_fileName=?, WHERE s_id=?";
			template.update(SQL,std.getStdName(), std.getCity(), std.getCountryside(), std.getSiteArea(), std.getBuildingArea(), std.getTotalArea(), std.getInfieldMaterial(), std.getCenterLength(), std.getBaseLength(), std.getSeatsNumber(), std.getFileName(), std.getStadiumId());	
	}
		else if(std.getFileName()==null) 
		{
			String SQL = "UPDATE stadium SET s_stdName=?, s_city=?, s_countryside=?, s_siteArea=?, s_buildingArea=?, s_totalArea=?, s_infieldMaterial=?, s_outfieldMaterial=?, s_centerLength=?, s_baseLength=?, s_seatsNumber=?, s_capacity=?, s_fileName=?, WHERE s_id=?";
			template.update(SQL,std.getStdName(), std.getCity(), std.getCountryside(), std.getSiteArea(), std.getBuildingArea(), std.getTotalArea(), std.getInfieldMaterial(), std.getCenterLength(), std.getBaseLength(), std.getSeatsNumber(), std.getFileName(), std.getStadiumId());	
		}
	}

	@Override
	public void setDeleteStadium(String stadiumId) 
	{

		String SQL = "delete from stadium where s_id=?";
		this.template.update(SQL, stadiumId);
		
	}



}

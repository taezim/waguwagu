package com.springmvc.api;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;
import org.json.JSONArray;
import org.json.JSONObject;

import com.springmvc.domain.Stadium;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

public class CsvToJsonConverter {

	public static List<Stadium> getContvertedStadium(String country)
	{
        // 상대 경로 사용
        String csvFilePath = "csv/stadiumInGN.csv"; // 프로젝트 루트 디렉토리에서 상대 경로
        List<Stadium> listOfStd = new ArrayList<Stadium>(); 
        try (InputStream inputStream = CsvToJsonConverter.class.getClassLoader().getResourceAsStream(csvFilePath);
        	 InputStreamReader reader = new InputStreamReader(inputStream, "EUC-KR");
             CSVParser csvParser = new CSVParser(reader, CSVFormat.DEFAULT.withFirstRecordAsHeader())) {
        	int i=0;
            JSONArray jsonArray = new JSONArray();           
            for (CSVRecord csvRecord : csvParser) 
            {	i++;
                JSONObject jsonObject = new JSONObject();
                csvRecord.toMap().forEach((key, value) -> jsonObject.put(key, value));
                jsonArray.put(jsonObject);
               
               isAllValuesEmpty(jsonObject);
        
             
               Stadium stadium = new Stadium();
               
               stadium.setBaseLength(jsonObject.getString("경기장 1,3루 길이"));
               stadium.setTotalArea(jsonObject.getString("연면적"));
               stadium.setOutfieldMaterial(jsonObject.getString("경기장 바닥재료(외야)"));
               stadium.setCountryside(jsonObject.getString("시군구"));
               stadium.setBuiltYear(jsonObject.getString("준공연도"));
               stadium.setSeatsNumber(jsonObject.getString("관람석 좌석수"));
               stadium.setStdName(jsonObject.getString("시설명"));
               stadium.setCity(jsonObject.getString("시도"));
               stadium.setBuildingArea(jsonObject.getString("건축면적"));
               stadium.setManager(jsonObject.getString("관리주체"));
               stadium.setInfieldMaterial(jsonObject.getString("경기장 바닥재료(내야)"));
               stadium.setCenterLength(jsonObject.getString("경기장 중앙 길이"));
               stadium.setOwnership(jsonObject.getString("소유기관"));
               stadium.setSiteArea(jsonObject.getString("경기장 면적"));
               stadium.setCapacity(jsonObject.getString("관람석 수용인원(명)"));
               
               listOfStd.add(stadium);          
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
		return listOfStd;
    }
    
	public static void isAllValuesEmpty(JSONObject jsonObject) 
    {
        // 모든 키에 대해 반복
        for (String key : jsonObject.keySet()) {
            // 해당 키의 값 가져오기
            Object value = jsonObject.get(key);
        	//System.out.println(key + value);
            // 값이 String 타입이고 ""와 같은지 검사
            if (value instanceof String && ((String) value).isEmpty()) 
            {
            	System.out.println("값 : "+value);
            	jsonObject.put(key, "null");
            }  
        }
    }
 
}

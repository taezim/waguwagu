package com.springmvc.repository;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.MapDTO;

@Repository
public class MapRepository {

    public MapDTO getByGeoDataByAddress(String addr) throws IOException {
        // Kakao API에서 받아올 키값
        String API_KEY = "4c85ed49b7c7e627d99656293e0e073a";
        String surl = "https://dapi.kakao.com/v2/local/search/address.json?query="
                + URLEncoder.encode(addr, "UTF-8");

        // HttpURLConnection 객체 생성
        HttpURLConnection con = (HttpURLConnection) new URL(surl).openConnection();
        con.setRequestMethod("GET");
        con.setRequestProperty("Authorization", "KakaoAK " + API_KEY);

        // url 접속하여 데이터 읽어오기
        InputStream is = con.getInputStream();
        BufferedReader streamReader = new BufferedReader(new InputStreamReader(is, "utf-8"));
        StringBuilder responseStrBuilder = new StringBuilder();
        String inputStr;

        // 받아온 데이터 읽어와서 값 strBuilder에 누적하기
        while ((inputStr = streamReader.readLine()) != null) {
            responseStrBuilder.append(inputStr);
        }

        // 받아온 문자열은 json 형식으로 되어 있음, 사용하기 위해 json 객체로 변환하기
        JSONObject jsonObj = new JSONObject(responseStrBuilder.toString());

        // 해당 json 객체는 documents라는 키에 모든 json 객체를 값(배열)으로 가지기 때문에,
        // documents 키의 값인 배열을 JSONArray로 만들어 각 배열 요소에 접근함
        JSONArray documents = jsonObj.getJSONArray("documents");

        if (documents.length() > 0) {
            JSONObject obj = documents.getJSONObject(0);
            Double lat = obj.getDouble("y");
            Double lng = obj.getDouble("x");
            String name = obj.getString("address_name");

            // 위치 값을 MapDTO에 set하고 리턴
            MapDTO dto = new MapDTO();
            dto.setX(lat);
            dto.setY(lng);
            dto.setName(name);
            return dto;
        }
        // if문 실행되지 않았을때 null 리턴
        return null;
    }

//    public List<MapDTO> getParkingByGeoDataByAddress(String addr) throws IOException {
//        List<MapDTO> parkingList = new ArrayList<MapDTO>();
//
//        // Kakao API에서 받아올 키값
//        String API_KEY = "4c85ed49b7c7e627d99656293e0e073a";
//        String surl = "https://dapi.kakao.com/v2/local/search/keyword.json?query="
//                + URLEncoder.encode(addr, "UTF-8") + "&category_group_code=PK6";
//
//        // HttpURLConnection 객체 생성
//        HttpURLConnection con = (HttpURLConnection) new URL(surl).openConnection();
//        con.setRequestMethod("GET");
//        con.setRequestProperty("Authorization", "KakaoAK " + API_KEY);
//
//        // url 접속하여 데이터 읽어오기
//        InputStream is = con.getInputStream();
//        BufferedReader streamReader = new BufferedReader(new InputStreamReader(is, "utf-8"));
//        StringBuilder responseStrBuilder = new StringBuilder();
//        String inputStr;
//
//        // 받아온 데이터 읽어와서 값 strBuilder에 누적하기
//        while ((inputStr = streamReader.readLine()) != null) {
//            responseStrBuilder.append(inputStr);
//        }
//
//        // 받아온 문자열은 json 형식으로 되어 있음, 사용하기 위해 json 객체로 변환하기
//        JSONObject jsonObj = new JSONObject(responseStrBuilder.toString());
//
//        // 해당 json 객체는 documents라는 키에 모든 json 객체를 값(배열)으로 가지기 때문에,
//        // documents 키의 값인 배열을 JSONArray로 만들어 각 배열 요소에 접근함
//        JSONArray documents = jsonObj.getJSONArray("documents");
//
//        // 검색 결과 중 주차장에 관련된 정보만 파싱하여 리스트에 저장
//        for (int i = 0; i < documents.length(); i++) {
//            JSONObject obj = documents.getJSONObject(i);
//            Double lat = obj.getDouble("y");
//            Double lng = obj.getDouble("x");
//            String name = obj.getString("place_name");
//
//            // 위치 값을 MapDTO에 set하고 리스트에 추가
//            MapDTO dto = new MapDTO();
//            dto.setX(lat);
//            dto.setY(lng);
//            dto.setName(name);
//            parkingList.add(dto);
//        }
//
//        return parkingList;
//    }
}
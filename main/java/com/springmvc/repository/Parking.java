package com.springmvc.repository;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONTokener;




public class Parking {
	
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		BufferedReader io = new BufferedReader(new InputStreamReader(System.in));
		try
		{
			System.out.println("주소를 입력하세요");
			String address=io.readLine();
			String addr=URLEncoder.encode(address, "UTF-8");
			String reqUrl = "https://api.odcloud.kr/api/3080074/v1/uddi:10cba857-b836-45cd-b961-f4fc25e54575_201711091443?page=1&perPage=10&serviceKey=%2BN69Bx7YrylMMMTuTz4M9TAqsbJfaO7lGGn3GXYDGuxcBigYTX%2B3p9C4U%2BDZqTqCNm%2Fs07A4I7kEpsq%2BtAzxUA%3D%3D"+addr;
			URL url = new URL(reqUrl);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
		
			
			BufferedReader br;
			int responseCode = con.getResponseCode();
			
			if(responseCode == 200)
			{
				br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
				
			}
			else
			{
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			
			//임시저장소
			String line;
			//StringBuffer 사용하는 이유는 String으로 사용한다면 기존껄 놔두고 새로 생성.
			//StringBuffer는 기존꺼에 계속 더해져서 만들어가기때문에 용량 공간낭비를 하지 않는다.
			StringBuffer response = new StringBuffer();
			
			while((line=br.readLine())!= null)
			{
				response.append(line);
			}
			br.close();
			
			//json을 문자열로 생성
			JSONTokener tokener = new JSONTokener(response.toString());
			JSONObject object = new JSONObject(tokener);
			System.out.println(object.toString());
			
			String x = null;
			String y = null;
			String z = null;
			JSONArray arr=object.getJSONArray("addresses");
			for(int i=0; i<arr.length(); i++)
			{
				JSONObject temp = (JSONObject) arr.get(i);
				System.out.println("address :" + temp.get("roadAddress"));
				System.out.println("jibunAddress :" + temp.get("jibunAddress"));
				System.out.println("경도 :" + temp.get("x"));
				System.out.println("위도 :" + temp.get("y"));
				
				x = (String) temp.get("x");
				y = (String) temp.get("y");
				z = (String) temp.get("roadAddress");
			}
			map_service(x,y,z);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

	private static void map_service(String x, String y, String z) {
		// TODO Auto-generated method stub
		
	}
	
 }
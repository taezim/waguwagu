package com.springmvc.service;
import org.jdom2.Element;
import org.springframework.stereotype.Service;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.jdom2.input.SAXBuilder;
@Service
public class Jdom {

	public List<Map<String, String>> readAllPages() throws Exception {
        List<Map<String, String>> dataList = new ArrayList<>();

        StringBuilder urlBuilder = new StringBuilder("https://apis.data.go.kr/B551182/hospInfoServicev2/getHospBasisList");
        urlBuilder.append("?ServiceKey=Pmd0DOMP25%2Fkt8tS3aQSPtuqLTAkvuFvLklQ87PL45It70JeIjZ1OyCBf0%2FhH4V6py%2BhCeLnpiwIfkCB7jLQ5w%3D%3D");
        urlBuilder.append("&numOfRows=5000");
        urlBuilder.append("&dgsbjtCd=05");
        urlBuilder.append("&page=3");

        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-Type", "application/xml");

        SAXBuilder builder = new SAXBuilder();
        org.jdom2.Document document = builder.build(conn.getInputStream());
        Element root = document.getRootElement();

        dataList.addAll(getDataForPage(root));

        return dataList;
    }

    private List<Map<String, String>> getDataForPage(Element root) {
        List<Map<String, String>> dataList = new ArrayList<>();
        Element itemsElement = root.getChild("body").getChild("items");

        if (itemsElement != null) {
            List<Element> itemsList = itemsElement.getChildren("item");

            for (Element item : itemsList) {
                Map<String, String> dataMap = new HashMap<>();
                for (Element itemElement : item.getChildren()) {
                    dataMap.put(itemElement.getName(), itemElement.getValue());
                }
                dataList.add(dataMap);
            }
        }

        return dataList;
    }
}

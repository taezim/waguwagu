package com.springmvc.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springmvc.domain.MapDTO;
import com.springmvc.repository.MapRepository;

@Controller
@RequestMapping("/map")
public class MapController {

    @Autowired
    private MapRepository maprepository;

    @GetMapping
    public String showMapForm() {
        return "map-form";
    }

    @GetMapping("/result")
    public String showMapDetails(@RequestParam String addr, Model model) throws IOException {
        MapDTO dto = maprepository.getByGeoDataByAddress(addr);
        dto.setName(addr); // 주소를 이름으로 설정합니다.
        model.addAttribute("mapInfo", dto);

//        // 여기서 다음 메소드 호출
//        List<MapDTO> parkingList = maprepository.getParkingByGeoDataByAddress(addr);
//        model.addAttribute("parkingList", parkingList);
//        model.addAttribute("parkingListString", new ObjectMapper().writeValueAsString(parkingList)); // 추가

        return "view";
    }

//   api연습 코드
    @GetMapping("/address")
    public String address() {
        System.out.println("카카오 API 테스트");
        return "address";
    }
}
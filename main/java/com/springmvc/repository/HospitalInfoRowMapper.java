package com.springmvc.repository;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.HospitalInfo;

import java.sql.ResultSet;
import java.sql.SQLException;

public class HospitalInfoRowMapper implements RowMapper<HospitalInfo> {

    @Override
    public HospitalInfo mapRow(ResultSet rs, int rowNum) throws SQLException {
        HospitalInfo hospitalInfo = new HospitalInfo();
        
        hospitalInfo.setId(rs.getInt("id"));
        hospitalInfo.setAddr(rs.getString("addr"));
        hospitalInfo.setClCd(rs.getString("clCd"));
        hospitalInfo.setClCdNm(rs.getString("clCdNm"));
        hospitalInfo.setCmdcGdrCnt(rs.getInt("cmdcGdrCnt"));
        hospitalInfo.setCmdcIntnCnt(rs.getInt("cmdcIntnCnt"));
        hospitalInfo.setCmdcResdntCnt(rs.getInt("cmdcResdntCnt"));
        hospitalInfo.setCmdcSdrCnt(rs.getInt("cmdcSdrCnt"));
        hospitalInfo.setDetyGdrCnt(rs.getInt("detyGdrCnt"));
        hospitalInfo.setDetyIntnCnt(rs.getInt("detyIntnCnt"));
        hospitalInfo.setDetyResdntCnt(rs.getInt("detyResdntCnt"));
        hospitalInfo.setDetySdrCnt(rs.getInt("detySdrCnt"));
        hospitalInfo.setDrTotCnt(rs.getInt("drTotCnt"));
        hospitalInfo.setEmdongNm(rs.getString("emdongNm"));
        hospitalInfo.setEstbDd(rs.getString("estbDd"));
        hospitalInfo.setHospUrl(rs.getString("hospUrl"));
        hospitalInfo.setMdeptGdrCnt(rs.getInt("mdeptGdrCnt"));
        hospitalInfo.setMdeptIntnCnt(rs.getInt("mdeptIntnCnt"));
        hospitalInfo.setMdeptResdntCnt(rs.getInt("mdeptResdntCnt"));
        hospitalInfo.setMdeptSdrCnt(rs.getInt("mdeptSdrCnt"));
        hospitalInfo.setPnursCnt(rs.getInt("pnursCnt"));
        hospitalInfo.setPostNo(rs.getString("postNo"));
        hospitalInfo.setSgguCd(rs.getString("sgguCd"));
        hospitalInfo.setSgguCdNm(rs.getString("sgguCdNm"));
        hospitalInfo.setSidoCd(rs.getString("sidoCd"));
        hospitalInfo.setSidoCdNm(rs.getString("sidoCdNm"));
        hospitalInfo.setTelno(rs.getString("telno"));
        hospitalInfo.setXPos(rs.getDouble("XPos"));
        hospitalInfo.setYPos(rs.getDouble("YPos"));
        hospitalInfo.setYadmNm(rs.getString("yadmNm"));
        hospitalInfo.setYkiho(rs.getString("ykiho"));
        
        return hospitalInfo;
    }
}

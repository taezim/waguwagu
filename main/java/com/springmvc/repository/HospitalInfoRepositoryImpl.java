package com.springmvc.repository;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.HospitalInfo;

@Repository
public class HospitalInfoRepositoryImpl implements HospitalInfoRepository{

	private JdbcTemplate template;
	
	@Autowired
	public void setJdbcTemplate(DataSource dataSource) {
		this.template = new JdbcTemplate(dataSource);
	}
	
	@Override
	public void saveDataToDB(List<Map<String, String>> dataList) {
		for (Map<String, String> dataMap : dataList) {
            String SQL = "INSERT INTO hospitalInfo (addr, clCd, clCdNm, cmdcGdrCnt, cmdcIntnCnt, cmdcResdntCnt, cmdcSdrCnt, "
                    + "detyGdrCnt, detyIntnCnt, detyResdntCnt, detySdrCnt, drTotCnt, emdongNm, estbDd, hospUrl, mdeptGdrCnt, "
                    + "mdeptIntnCnt, mdeptResdntCnt, mdeptSdrCnt, pnursCnt, postNo, sgguCd, sgguCdNm, sidoCd, sidoCdNm, telno, "
                    + "XPos, YPos, yadmNm, ykiho) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, "
                    + "?, ?, ?, ?, ?, ?, ?)";

            template.update(SQL,
                    dataMap.get("addr"),
                    dataMap.get("clCd"),
                    dataMap.get("clCdNm"),
                    dataMap.get("cmdcGdrCnt"),
                    dataMap.get("cmdcIntnCnt"),
                    dataMap.get("cmdcResdntCnt"),
                    dataMap.get("cmdcSdrCnt"),
                    dataMap.get("detyGdrCnt"),
                    dataMap.get("detyIntnCnt"),
                    dataMap.get("detyResdntCnt"),
                    dataMap.get("detySdrCnt"),
                    dataMap.get("drTotCnt"),
                    dataMap.get("emdongNm"),
                    dataMap.get("estbDd"),
                    dataMap.get("hospUrl"),
                    dataMap.get("mdeptGdrCnt"),
                    dataMap.get("mdeptIntnCnt"),
                    dataMap.get("mdeptResdntCnt"),
                    dataMap.get("mdeptSdrCnt"),
                    dataMap.get("pnursCnt"),
                    dataMap.get("postNo"),
                    dataMap.get("sgguCd"),
                    dataMap.get("sgguCdNm"),
                    dataMap.get("sidoCd"),
                    dataMap.get("sidoCdNm"),
                    dataMap.get("telno"),
                    dataMap.get("XPos"),
                    dataMap.get("YPos"),
                    dataMap.get("yadmNm"),
                    dataMap.get("ykiho"));
        }
		
	}

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	@Override
	public List<HospitalInfo> findHospitalData(int limit, int offset) {
		String SQL = "select * from hospitalInfo LIMIT ? OFFSET ?";
		
		return template.query(SQL, new Object[] {limit,offset}, new HospitalInfoRowMapper());
	}

	@Override
	public int getTotalItemCount() {
		String SQL = "select count(*) from hospitalInfo";
		return template.queryForObject(SQL, Integer.class);
	}

	@Override
	public HospitalInfo readHospitalInfoById(String id) {
		HospitalInfo hospitalInfo = null;
		
		String SQL = "select count(*) from hospitalInfo where id=?";
		int rowCount = template.queryForObject(SQL, Integer.class, id);
		
		if(rowCount!=0) {
			SQL="select * from hospitalInfo where id=?";
			hospitalInfo = template.queryForObject(SQL, new Object[] {id}, new HospitalInfoRowMapper());
		}
		if(hospitalInfo==null) {
			throw new IllegalArgumentException("일치하는 항목이 없습니다.");
		}
		return hospitalInfo;
	}

	@Override
	public List<HospitalInfo> findByLocation(String location) {
		if (StringUtils.isBlank(location)) {
	        // 빈 문자열이나 null이면 전체 조회
	        String SQL = "SELECT * FROM hospitalInfo";
	        return template.query(SQL, new HospitalInfoRowMapper());
	    } else {
	        // 아니면 지정된 지역을 조회
	        String SQL = "SELECT * FROM hospitalInfo WHERE sidoCdNm LIKE ?";
	        String parameter = "%" + location + "%";
	        return template.query(SQL, new Object[] {parameter}, new HospitalInfoRowMapper());
	    }
	}
}

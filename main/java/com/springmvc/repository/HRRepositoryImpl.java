package com.springmvc.repository;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.HospitalReservation;


@Repository
public class HRRepositoryImpl implements HRRepository
{

   private JdbcTemplate template;
   
   @Autowired
   public void setJdbcTemplate(DataSource dataSource) {
      this.template = new JdbcTemplate(dataSource);
   }

	@Override
	public List<HospitalReservation> readAllReservation(String memberId) 
	{
		String SQL = "SELECT * FROM hospital_reservation where reserver_id=?";
		List<HospitalReservation> listOfReservation = template.query(SQL, new Object[]{memberId}, new HRRowMapper());
		return listOfReservation;
	}

	@Override
	public HospitalReservation readHospitalReservation(String reservationId) 
	{
		HospitalReservation HRInfo = null;
		String SQL = "SELECT count(*) FROM hospital_reservation where reservation_id=?";
	    int rowCount = template.queryForObject(SQL, Integer.class, reservationId);
	    if(rowCount != 0) {
	       SQL = "SELECT * FROM hospital_reservation where reservation_id=?";
	       HRInfo = template.queryForObject(SQL, new Object[] {reservationId},new HRRowMapper());
	    }
	    if(HRInfo == null) {
	       throw new IllegalArgumentException("사용자 id가 " +reservationId+"인 예약정보를 찾을 수 없습니다.");
	    }
		return HRInfo;
	}

	@Override
	public void setNewHR(HospitalReservation HR) {
		 String SQL = "INSERT INTO hospital_reservation(h_id, h_name, h_filename, insert_date, reservation_date, reserver_id, reserver_name, reserver_phone, patient_name, patient_age, patient_phone, injuryType, notes) " +
"VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		 template.update(SQL, HR.getHospitalId(), HR.getHospitalName(), HR.getHospitalFileName(),
                    HR.getInsertDate(), HR.getReservationDate(), HR.getReserverId(),
                    HR.getReserverName(), HR.getReserverPhone(), HR.getPatientName(),
                    HR.getPatientAge(), HR.getPatientPhone(), HR.getInjuryType(),
                    HR.getNotes());
	}

	@Override
	public void setUpdateHR(HospitalReservation HR) {
		  String SQL = "UPDATE hospital_reservation SET notes = ? WHERE reservation_id = ?";
	        template.update(SQL, HR.getNotes(), HR.getReservationId());
	    
	}

	@Override
	public void setCancelHR(String reservationId) 
	{
		   String SQL = "DELETE FROM hospital_reservation WHERE reservation_id = ?";
	        template.update(SQL, reservationId);	
	}

	public List<HospitalReservation> readAllReservTime(String hospitalId) {
	    String SQL = "SELECT h_id, reservation_date, reserver_name FROM hospital_reservation WHERE h_id = ?";
	    List<HospitalReservation> listOfReservTime = template.query(SQL, new Object[]{hospitalId}, BeanPropertyRowMapper.newInstance(HospitalReservation.class));
	    return listOfReservTime;
	}

}

package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.HospitalReservation;

public class HRRowMapper implements RowMapper<HospitalReservation> {

    public HospitalReservation mapRow(ResultSet rs, int rowNum) throws SQLException {
        HospitalReservation reservation = new HospitalReservation();
        reservation.setReservationId(rs.getLong(1));
        reservation.setHospitalId(rs.getString(2));
        reservation.setHospitalName(rs.getString(3));
        reservation.setHospitalFileName(rs.getString(4));
        reservation.setInsertDate(rs.getString(5));
        reservation.setReservationDate(rs.getString(6));
        reservation.setReserverId(rs.getString(7));
        reservation.setReserverName(rs.getString(8));
        reservation.setReserverPhone(rs.getString(9));
        reservation.setPatientName(rs.getString(10));
        reservation.setPatientAge(rs.getInt(11));
        reservation.setPatientPhone(rs.getString(12));
        reservation.setInjuryType(rs.getString(13));
        reservation.setNotes(rs.getString(14));

        return reservation;
    }
}


package com.springmvc.domain;

import java.io.Serializable;

public class Lesson implements Serializable
{

   /**
    * 
    */
   private static final long serialVersionUID = 1130529844730031525L;
   
   /*변수 총 9개 !!! 9999
    * 근데 우리 사진은 안넣을란가?*/
   private String classId;
   private String className;
   private String coachId;
   private String subject;
   private String venue; // 개최 장소
   private String managerName; // 담당자 이름
   private String tel; // 담당자 전번
   private int auditors; // 청강 인원
   private int fees;
   private String description;
   
   public String getClassId() {
      return classId;
   }
   public void setClassId(String classId) {
      this.classId = classId;
   }
   public String getClassName() {
      return className;
   }
   public void setClassName(String className) {
      this.className = className;
   }
   public String getSubject() {
      return subject;
   }
   public void setSubject(String subject) {
      this.subject = subject;
   }
   public String getVenue() {
      return venue;
   }
   public void setVenue(String venue) {
      this.venue = venue;
   }
   public String getManagerName() {
      return managerName;
   }
   public void setManagerName(String managerName) {
      this.managerName = managerName;
   }
   public String getTel() {
      return tel;
   }
   public void setTel(String tel) {
      this.tel = tel;
   }
   public int getAuditors() {
      return auditors;
   }
   public void setAuditors(int auditors) {
      this.auditors = auditors;
   }
   public int getFees() {
      return fees;
   }
   public void setFees(int fees) {
      this.fees = fees;
   }
   public String getDescription() {
      return description;
   }
   public void setDescription(String description) {
      this.description = description;
   }
   public String getCoachId() {
      return coachId;
   }
   public void setCoachId(String coachId) {
      this.coachId = coachId;
   }
   

}
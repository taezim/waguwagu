package com.springmvc.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.springmvc.domain.Member;
import com.springmvc.repository.MemberRepository;


@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberRepository memberRepository;
	
	@Autowired
    private JdbcTemplate template;

	@Override
	public void createNewMember(Member member) {
		memberRepository.createNewMember(member);
		
	}

	@Override
	public List<Member> readAllMemberList() {
		// TODO Auto-generated method stub
		return memberRepository.readAllMemberList();
	}
	
	@Override
	public Member getMemberById(String memberId) {
		Member memberById = memberRepository.getMemberbyId(memberId);
		return memberById;
	}
	
	@Override
	public void setUpdateMemeber(Member member) {
		memberRepository.setUpdateMember(member);
		
	}

	@Override
	public void setDeleteMember(String memberId) {
		memberRepository.setDeleteMember(memberId);
	}

	@Override
	public Member authenticate(String memberId, String password) {
		// TODO Auto-generated method stub
		return memberRepository.authenticate(memberId, password);
	}

	@Override
	public boolean isMemberId(String memberId) {
		// TODO Auto-generated method stub
		return memberRepository.isMemberId(memberId);
	}

	@Override
	public int countByMemberId(String memberId) {
		 String sql = "select count(*) from member where m_id=?";
	     return template.queryForObject(sql, Integer.class, memberId);
	}

	
}

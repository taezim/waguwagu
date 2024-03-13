package com.springmvc.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.springmvc.domain.Member;

public interface MemberService {
	//private final MemberRepository MemberRepository;

	void createNewMember(Member member);
	List<Member> readAllMemberList();
	Member getMemberById(String memberId);
	Member authenticate(String memberId, String password); //로그인
	void setUpdateMemeber(Member member);
	void setDeleteMember(String memberId);
	
	boolean isMemberId(String memberId);
}

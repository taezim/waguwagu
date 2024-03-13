package com.springmvc.repository;

import java.util.List;


import com.springmvc.domain.Member;

public interface MemberRepository {
	List<Member> readAllMemberList();
	void createNewMember(Member member);
	void setUpdateMember(Member member);
	void setDeleteMember(String memberId);
	Member authenticate(String memberId, String password);
	Member getMemberbyId(String memberId);
	boolean isMemberId(String memberId);
}


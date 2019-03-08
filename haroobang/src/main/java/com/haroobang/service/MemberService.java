package com.haroobang.service;

import java.util.List;

import com.haroobang.vo.AccountVO;

public interface MemberService {

	List<AccountVO> findAllMembers();

	int findAllMemberCount();

	AccountVO findMember(int memberNo);

}

package com.haroobang.mapper;

import java.util.List;

import com.haroobang.vo.AccountVO;

public interface MemberMapper {

	List<AccountVO> selectAllMembers();

	int selectAllMemberCount();

	AccountVO selectMember(int memberNo);

}

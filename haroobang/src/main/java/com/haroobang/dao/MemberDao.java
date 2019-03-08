package com.haroobang.dao;

import java.util.List;

import com.haroobang.vo.AccountVO;

public interface MemberDao {

	List<AccountVO> selectAllMembers();

	int selectAllMemberCount();

	AccountVO selectMember(int memberNo);

}

package com.haroobang.dao;

import java.util.List;

import com.haroobang.mapper.MemberMapper;
import com.haroobang.vo.AccountVO;

public class OracleMemberDao implements MemberDao {

	private MemberMapper memberMapper;

	public void setMemberMapper(MemberMapper memberMapper) {
		this.memberMapper = memberMapper;
	}

	@Override
	public List<AccountVO> selectAllMembers() {
		List<AccountVO> members = memberMapper.selectAllMembers();
		return members;
	}

	@Override
	public int selectAllMemberCount() {
		int count = memberMapper.selectAllMemberCount();
		return count;
	}
}

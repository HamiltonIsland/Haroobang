package com.haroobang.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.haroobang.dao.MemberDao;
import com.haroobang.vo.AccountVO;

@Service("MemberService")
public class MemberServiceImpl implements MemberService {
	private MemberDao memberDao;

	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	@Override
	public List<AccountVO> findAllMembers() {
		List<AccountVO> members = memberDao.selectAllMembers();

		return members;
	}

	@Override
	public int findAllMemberCount() {
		int count = memberDao.selectAllMemberCount();
		return count;
	}

	@Override
	public AccountVO findMember(int memberNo) {
		AccountVO member = memberDao.selectMember(memberNo);


		return member;
	}

}

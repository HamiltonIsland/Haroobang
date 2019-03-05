package com.haroobang.mapper;

import java.util.List;

import com.haroobang.vo.AccountVO;

public interface AccountMapper {

	void insertAccount(AccountVO vo);

	List<AccountVO> login(AccountVO vo);

	void updateProfile(AccountVO vo);

}

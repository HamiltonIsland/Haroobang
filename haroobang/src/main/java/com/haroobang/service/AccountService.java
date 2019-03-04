package com.haroobang.service;

import java.util.List;

import com.haroobang.vo.AccountVO;

public interface AccountService {

	void insertAccountService(AccountVO vo);

	List<AccountVO> loginService(AccountVO vo);

}

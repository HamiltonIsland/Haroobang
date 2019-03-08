package com.haroobang.dao;

import java.util.List;

import com.haroobang.vo.AccountVO;

public interface AccountDao {

	void insertAccountDao(AccountVO vo);

	List<AccountVO> loginDao(AccountVO vo);

	void updateProfileDao(AccountVO vo);

	AccountVO getAccountDao(AccountVO vo);

	void updatePasswordDao(AccountVO vo);

}

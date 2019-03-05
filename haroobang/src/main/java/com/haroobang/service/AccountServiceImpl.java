package com.haroobang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.haroobang.common.Util;
import com.haroobang.dao.AccountDao;
import com.haroobang.vo.AccountVO;

@Service("AccountService")
public class AccountServiceImpl implements AccountService{
	
	@Autowired
	@Qualifier("AccountDao")
	private AccountDao accountDao;

	@Override
	public void insertAccountService(AccountVO vo) {
		String password = Util.getHashedString(vo.getPassword(),"SHA-256");
		vo.setPassword(password);
		accountDao.insertAccountDao(vo);
		
	}

	@Override
	public List<AccountVO> loginService(AccountVO vo) {
		String password = Util.getHashedString(vo.getPassword(),"SHA-256");
		vo.setPassword(password);
		List<AccountVO> login = accountDao.loginDao(vo);
		return login;
	}

	@Override
	public void updateProfileService(AccountVO vo) {
		accountDao.updateProfileDao(vo);		
	}

	@Override
	public List<AccountVO> loginServices(AccountVO vo) {
		List<AccountVO> login = accountDao.loginDao(vo);
		return login;
	}
	

}

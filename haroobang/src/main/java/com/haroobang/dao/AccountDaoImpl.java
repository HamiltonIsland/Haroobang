package com.haroobang.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.haroobang.mapper.AccountMapper;
import com.haroobang.vo.AccountVO;

@Repository("AccountDao")
public class AccountDaoImpl implements AccountDao{
	
	@Autowired
	@Qualifier("AccountMapper")
	private AccountMapper accountMapper;

	@Override
	public void insertAccountDao(AccountVO vo) {
		accountMapper.insertAccount(vo);
		
	}

}

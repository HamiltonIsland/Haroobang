package com.haroobang.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.haroobang.mapper.AccountMapper;

@Repository("AccountDao")
public class AccountDaoImpl implements AccountDao{
	
//	@Autowired
//	@Qualifier("AccountMapper")
//	private AccountMapper accountMapper;

}

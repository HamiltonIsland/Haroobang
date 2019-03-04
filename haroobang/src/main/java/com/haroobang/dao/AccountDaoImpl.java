package com.haroobang.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.haroobang.mapper.AccountMapper;

public class AccountDaoImpl implements AccountDao{
	
	@Autowired
	@Qualifier("AccountMapper")
	private AccountMapper accountMapper;

}

package com.haroobang.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.haroobang.dao.AccountDao;

public class AccountServiceImpl implements AccountService{
	
	@Autowired
	@Qualifier("AccountDao")
	private AccountDao accountDao;
	

}

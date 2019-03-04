package com.haroobang.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.haroobang.dao.AccountDao;

@Service("AccountService")
public class AccountServiceImpl implements AccountService{
	
	@Autowired
	@Qualifier("AccountDao")
	private AccountDao accountDao;
	

}

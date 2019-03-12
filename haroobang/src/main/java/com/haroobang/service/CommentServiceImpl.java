package com.haroobang.service;

import com.haroobang.dao.CommentDao;
import com.haroobang.vo.CommentVO;


public class CommentServiceImpl implements CommentService {

	private CommentDao commentDao;// = new BoardDao();
	
	public void setCommentDao(CommentDao commentDao) {
		this.commentDao = commentDao;
	}

	@Override
	public void writeComment(CommentVO comment) {
		commentDao.insertComment(comment);
		
	}
	
	
}

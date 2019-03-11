package com.haroobang.service;

import com.haroobang.dao.CommentDao;


public class CommentServiceImpl implements CommentService {

	private CommentDao commentDao;// = new BoardDao();
	
	public void setCommentDao(CommentDao commentDao) {
		this.commentDao = commentDao;
	}
	
	
}

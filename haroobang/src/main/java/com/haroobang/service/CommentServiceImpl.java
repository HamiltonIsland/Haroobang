package com.haroobang.service;

import java.util.List;

import com.haroobang.dao.CommentDao;
import com.haroobang.vo.CommentVO;
import com.haroobang.vo.ReservationVO;


public class CommentServiceImpl implements CommentService {

	private CommentDao commentDao;// = new BoardDao();
	
	public void setCommentDao(CommentDao commentDao) {
		this.commentDao = commentDao;
	}

	@Override
	public void writeComment(CommentVO comment) {
		commentDao.insertComment(comment);
		
	}

	@Override
	public List<CommentVO> findMycomment(int memberNo) {
		List<CommentVO> mycomments = commentDao.selectAllMycomments(memberNo);
		return mycomments;
	}
	
	
}

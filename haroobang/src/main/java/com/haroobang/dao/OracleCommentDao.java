package com.haroobang.dao;

import com.haroobang.mapper.CommentMapper;
import com.haroobang.vo.CommentVO;

public class OracleCommentDao implements CommentDao {
	
	private CommentMapper commentMapper;

	public void setCommentMapper(CommentMapper commentMapper) {
		this.commentMapper = commentMapper;
	}

	@Override
	public void insertComment(CommentVO comment) {
		commentMapper.insertComment(comment);
	}
	
}

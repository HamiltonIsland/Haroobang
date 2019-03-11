package com.haroobang.dao;

import com.haroobang.mapper.CommentMapper;

public class OracleCommentDao implements CommentDao {
	
	private CommentMapper commentMapper;

	public void setCommentMapper(CommentMapper commentMapper) {
		this.commentMapper = commentMapper;
	}
	
}

package com.haroobang.dao;

import java.util.List;

import com.haroobang.vo.CommentVO;

public interface CommentDao {

	void insertComment(CommentVO comment);

	List<CommentVO> selectAllMycomments(int memberNo);


}

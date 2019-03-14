package com.haroobang.mapper;

import java.util.List;

import com.haroobang.vo.CommentVO;

public interface CommentMapper {

	void insertComment(CommentVO comment);

	List<CommentVO> selectAllMycomments(int memberNo);
	
}

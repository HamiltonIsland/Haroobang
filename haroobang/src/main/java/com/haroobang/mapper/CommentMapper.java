package com.haroobang.mapper;

import java.util.HashMap;
import java.util.List;

import com.haroobang.vo.CommentVO;
import com.haroobang.vo.RoomAttachVO;

public interface CommentMapper {

	void insertComment(CommentVO comment);

	//List<CommentVO> selectAllMycomments(int memberNo);

	List<RoomAttachVO> selectRoomAttachByRoomNo(int roomNo);

	int selectCommentCount(int memberNo);

	List<CommentVO> selectAllMycommentsByPage(HashMap<String, Object> params);
	
}

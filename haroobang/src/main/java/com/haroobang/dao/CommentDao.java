package com.haroobang.dao;

import java.util.List;

import com.haroobang.vo.CommentVO;
import com.haroobang.vo.RoomAttachVO;

public interface CommentDao {

	void insertComment(CommentVO comment);

	//List<CommentVO> selectAllMycomments(int memberNo);

	List<RoomAttachVO> selectRoomAttachByRoomNo(int roomNo);

	List<CommentVO> selectAllMycommentsByPage(int memberNo, int from, int to);

	int selectCommentCount(int memberNo);


}

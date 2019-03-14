package com.haroobang.dao;

import java.util.List;

import com.haroobang.vo.CommentVO;
import com.haroobang.vo.RoomAttachVO;

public interface CommentDao {

	void insertComment(CommentVO comment);

	List<CommentVO> selectAllMycomments(int memberNo);

	List<RoomAttachVO> selectRoomAttachByRoomNo(int roomNo);


}

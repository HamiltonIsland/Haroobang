package com.haroobang.service;

import java.util.List;

import com.haroobang.dao.CommentDao;
import com.haroobang.vo.CommentVO;
import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.RoomAttachVO;


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
		for(CommentVO mycomment : mycomments) {
			List<RoomAttachVO> attachments = commentDao.selectRoomAttachByRoomNo(mycomment.getRoomNo());
			mycomment.setRoomAttachList(attachments);
		}
		return mycomments;
	}
	
	
}

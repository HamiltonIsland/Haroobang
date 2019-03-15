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

	/*@Override
	public List<CommentVO> findMycomment(int memberNo) {
		List<CommentVO> mycomments = commentDao.selectAllMycomments(memberNo);
		for(CommentVO mycomment : mycomments) {
			List<RoomAttachVO> attachments = commentDao.selectRoomAttachByRoomNo(mycomment.getRoomNo());
			mycomment.setRoomAttachList(attachments);
		}
		return mycomments;
	}*/

	@Override
	public List<CommentVO> findMycommentByPage(int memberNo, int from, int to) {
		List<CommentVO> mycomments = commentDao.selectAllMycommentsByPage(memberNo, from, to);
		for(int i=0; i<mycomments.size(); i++) {
			List<RoomAttachVO> attachments = commentDao.selectRoomAttachByRoomNo(mycomments.get(i).getRoomNo());
			mycomments.get(i).setRoomAttachList(attachments);
		}
		return mycomments;
	}

	@Override
	public int findcommentCount(int memberNo) {
		int count = commentDao.selectCommentCount(memberNo);
		return count;
	}
	
	
}

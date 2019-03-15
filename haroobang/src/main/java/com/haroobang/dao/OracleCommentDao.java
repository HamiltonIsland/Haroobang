package com.haroobang.dao;

import java.util.HashMap;
import java.util.List;

import com.haroobang.mapper.CommentMapper;
import com.haroobang.vo.CommentVO;
import com.haroobang.vo.RoomAttachVO;

public class OracleCommentDao implements CommentDao {
	
	private CommentMapper commentMapper;

	public void setCommentMapper(CommentMapper commentMapper) {
		this.commentMapper = commentMapper;
	}

	@Override
	public void insertComment(CommentVO comment) {
		commentMapper.insertComment(comment);
	}

	/*@Override
	public List<CommentVO> selectAllMycomments(int memberNo) {
		List<CommentVO> mycomments = commentMapper.selectAllMycomments(memberNo);
		return mycomments;
	}*/

	@Override
	public List<RoomAttachVO> selectRoomAttachByRoomNo(int roomNo) {
		List<RoomAttachVO> attachs = commentMapper.selectRoomAttachByRoomNo(roomNo);
		return attachs;
	}


	@Override
	public int selectCommentCount(int memberNo) {
		int count = commentMapper.selectCommentCount(memberNo);
		return count;
	}

	@Override
	public List<CommentVO> selectAllMycommentsByPage(int memberNo, int from, int to) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("memberNo", memberNo);
		params.put("first", from);
		params.put("last", to);
		
		List<CommentVO> mycomments = commentMapper.selectAllMycommentsByPage(params);
		return mycomments;
	}
	
}

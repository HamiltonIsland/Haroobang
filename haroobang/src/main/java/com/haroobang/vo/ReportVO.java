package com.haroobang.vo;

public class ReportVO {
	
	private int commentNo;
	private int memberNo;
	private String regDate;
	private String content;
	private CommentVO commentVO;
	

	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public CommentVO getCommentVO() {
		return commentVO;
	}
	public void setCommentVO(CommentVO commentVO) {
		this.commentVO = commentVO;
	}
	
	
	
}

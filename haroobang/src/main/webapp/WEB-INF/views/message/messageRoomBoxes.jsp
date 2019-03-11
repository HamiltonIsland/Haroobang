<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div id="frame">
						<div id="sidepanel">
							<div id="profile">
								<div class="wrap">
									<img id="profile-img"
										src="/haroobang/resources/upload/${login.savedFileName}"
										class="online" alt="" />
									<p>${login.name }</p>
									<div id="status-options">
										<ul>
											<li id="status-online" class="active"><span
												class="status-circle"></span>
												<p>Online</p></li>
											<li id="status-away"><span class="status-circle"></span>
												<p>Away</p></li>
											<li id="status-busy"><span class="status-circle"></span>
												<p>Busy</p></li>
											<li id="status-offline"><span class="status-circle"></span>
												<p>Offline</p></li>
										</ul>
									</div>

								</div>
							</div>
							<div id="contacts">
								<ul>
									<c:forEach var="messageRoomList" items="${messageRoomList}">
										<c:forEach var="list" items="${messageRoomList.memberList}">
											<c:choose>
												<c:when
													test="${messageRoomList.messageRoomNo==messageRoomNo}">
													<li class="contact active"
														data-memberNo="${list.memberNo }" data-loginMemberNo="${login.memberNo }">
												</c:when>
												<c:otherwise>
													<li class="contact"
														data-memberNo="${list.memberNo }" data-loginMemberNo="${login.memberNo }">
												</c:otherwise>
											</c:choose>
											<!-- <li class="contact active"> -->
											<div class="wrap">
												<span class="contact-status"></span> <img
													src="/haroobang/resources/upload/${list.savedFileName}"
													alt="" />
												<div class="meta">
													<p class="name">${list.name}</p>
													<c:forEach var="lists" items="${messageRoomList.messagesList}"
														varStatus="index">
														<c:if test="${index.last}">
															<p class="preview">
															<c:if test="${lists.messageRoomNo==messageRoomList.messageRoomNo }">
																<c:if test="${lists.memberNo==login.memberNo}"><span>You: </span></c:if>
																${lists.content}
															</c:if>															
															</p>
														</c:if>
												</c:forEach>
												</div>
											</div>
											</li>

										</c:forEach>
									</c:forEach>

								</ul>
							</div>
						</div>
						<div class="content">
							<div class="contact-profile">
								<c:forEach var="messageRoomList" items="${messageRoomList}">
									<c:forEach var="list" items="${messageRoomList.memberList}">
										<c:if test="${messageRoomList.messageRoomNo==messageRoomNo}">
											<img src="/haroobang/resources/upload/${list.savedFileName }" />
											<p>${list.name }</p>
										</c:if>
									</c:forEach>
								</c:forEach>
								<div class="social-media">
									<i class="fa fa-facebook" aria-hidden="true"></i> <i
										class="fa fa-twitter" aria-hidden="true"></i> <i
										class="fa fa-instagram" aria-hidden="true"></i>
								</div>
							</div>
							<div class="messages" style="width: 100%">
								<ul>
									<c:forEach var="list" items="${messageList}">
										<c:choose>
											<c:when test="${list.memberNo == login.memberNo}">
												<li class="replies">
													<p>${list.content }</p>
												</li>
											</c:when>
											<c:otherwise>
												<li class="sent">
												<c:forEach var="messageRoomList"
														items="${messageRoomList}">
														<c:forEach var="lists"
															items="${messageRoomList.memberList}">
															<c:if
																test="${messageRoomList.messageRoomNo==messageRoomNo}">
																<img
																	src="/haroobang/resources/upload/${lists.savedFileName}"
																	alt="" />
															</c:if>
														</c:forEach>
													</c:forEach>
													<p>${list.content}</p></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</ul>
							</div>
							<div class="message-input">
								<div class="wrap">
									<input type="hidden" id="messageRoomNo" name="messageRoomNo"
										value="${messageRoomNo }"> <input type="hidden"
										id="memberNo" name="memberNo" value="${login.memberNo }">
									<input type="text" id="text" name="content"
										placeholder="Write your message..." /> <i
										class="fa fa-paperclip attachment" aria-hidden="true"></i>

									<button class="submit">
										<i class="fa fa-paper-plane" aria-hidden="true"></i>
									</button>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div> 
		<script src="/haroobang/resources/js/chat.js"></script>
	
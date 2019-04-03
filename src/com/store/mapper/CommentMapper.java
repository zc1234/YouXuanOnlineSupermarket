package com.store.mapper;

import java.util.List;

import com.store.pojo.Comment;

public interface CommentMapper {
	public int insertComment(Comment comment);
	public List<Comment> findCommentByGoodsID(int goodsID);
	public List<Comment> findCommentByUserID(int userID);
}

package com.hao.demo.dao;

import com.hao.demo.entity.Message;

import java.util.List;

public interface MessageMapper {
    //根据类别号获得该类别下的所有信息
    public List<Message> getMessageByCatory(int catoryId);
    //根据问题号获得答案
    public String getAnswerById(int messageId);
}

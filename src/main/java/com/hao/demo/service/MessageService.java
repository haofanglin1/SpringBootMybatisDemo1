package com.hao.demo.service;

import com.hao.demo.entity.Message;
import com.hao.demo.entity.MessageCatory;
import com.hao.demo.entity.User;

import java.util.List;

public interface MessageService {

    public List<MessageCatory> getallMessageCatory();
    public List<Message> getMessageByCatory(int catoryId);
    //根据问题号获得答案
    public String getAnswerById(int messageId);
}

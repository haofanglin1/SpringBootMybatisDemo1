package com.hao.demo.service;

import com.hao.demo.dao.MessageCatoryMapper;
import com.hao.demo.dao.MessageMapper;
import com.hao.demo.entity.Message;
import com.hao.demo.entity.MessageCatory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class MessageServiceImpl implements MessageService {
    @Autowired
    private MessageCatoryMapper messageCatoryMapper;
    @Autowired
    private MessageMapper messageMapper;
    @Override
    public List<MessageCatory> getallMessageCatory() {
        return messageCatoryMapper.getallMessageCatory();
    }

    @Override
    public List<Message> getMessageByCatory(int catoryId) {
        return messageMapper.getMessageByCatory(catoryId);
    }

    @Override
    public String getAnswerById(int messageId) {
        return messageMapper.getAnswerById(messageId);
    }
}

package com.rush.service.Impl;

import com.rush.dao.OnlineDAO;
import com.rush.entity.Online;
import com.rush.service.OnlineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OnlineServiceImpl implements OnlineService {

    @Autowired
    private OnlineDAO onlineDAO;

    @Override
    public Online getOnlineQuestionByOnlineid(Integer onlineid) {
        Online online = onlineDAO.selectByPrimaryKey(onlineid);
        return online;
    }
}

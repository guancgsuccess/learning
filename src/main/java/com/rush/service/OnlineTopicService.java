package com.rush.service;

import com.rush.util.OnlineQuestion;

import java.util.List;
import java.util.Map;

public interface OnlineTopicService {
    Map<String, Object> showOnlineTopic();

    List<OnlineQuestion> showOnlineTopicV2();
}

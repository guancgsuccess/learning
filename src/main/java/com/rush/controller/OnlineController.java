package com.rush.controller;

import com.rush.entity.Online;
import com.rush.service.OnlineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/online")
public class OnlineController {

    @Autowired
    private OnlineService onlineService;

    @RequestMapping("exercise/{onlineid}")
    public ModelAndView getOnlineQuestion(@PathVariable Integer onlineid){
        ModelAndView mav = new ModelAndView();
        Online online = onlineService.getOnlineQuestionByOnlineid(onlineid);
        mav.addObject("online",online);
        mav.setViewName("online");
        return mav;
    }
}

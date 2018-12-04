package com.rush.util;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.rush.entity.QuestionBank;

public class JasonResult {
    public static String  objToJson(Object obj){
        ObjectMapper mapper = new ObjectMapper();
        String mapJakcson = null;
        try {
            mapJakcson = mapper.writeValueAsString(obj);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return mapJakcson;
    }


    public static void main(String[] args){
        PageModel<QuestionBank> p =   new PageModel<QuestionBank>() ;
        p.setEndRecord(30);
        p.setEndRecord(4);
        System.out.println(objToJson(p));
    }

}

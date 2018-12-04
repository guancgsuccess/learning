package com.rush.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;


public class IdentificationCardUtil {
    /**
     * requestGet
     * @param strUrl
     * @param param
     * @param appcode
     * @return
     */
    public static String requestGet(String strUrl, String param, String appcode) {
        String returnStr = null; // 返回结果定义
        URL url = null;
        HttpURLConnection httpURLConnection = null;
        try {
            url = new URL(strUrl + "?" + param);
            httpURLConnection = (HttpURLConnection) url.openConnection();
            httpURLConnection.setRequestProperty("Accept-Charset","utf-8");
            httpURLConnection.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
            httpURLConnection.setRequestProperty("Authorization","APPCODE" + appcode);
            httpURLConnection.setDoOutput(true);
            httpURLConnection.setDoInput(true);
            httpURLConnection.setRequestMethod("GET"); // get方式
            httpURLConnection.setUseCaches(false); // 不用缓存
            httpURLConnection.connect();
            BufferedReader reader = new BufferedReader(
                    new InputStreamReader(httpURLConnection.getInputStream(),"utf-8"));
            StringBuffer buffer = new StringBuffer();
            String line = "";
            while ((line = reader.readLine()) != null) {
                buffer.append(line);
            }
            reader.close();
            returnStr = buffer.toString();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (httpURLConnection != null) {
                httpURLConnection.disconnect();
            }
        }
        return returnStr;
    }

    /**
     * return
     *
     * @param args
     */
    public static void main(String[] args) {
        //请正确填写appcode,如果填写错误阿里云会返回错误
        //appcode查看地址 https://market.console.aliyun.com/imageconsole/
        String appcode = "41cbcd54027b8df44b5937047018deed";
        //请求地址
        String url = "https://way.jd.com/youhuoBeijing/test";
        //需要请求的内容
        String param = "cardNo=340827199610107116&realName=戴俊";
        //执行请求
        String returnStr = IdentificationCardUtil.requestGet(url, param, appcode);
        //输出结果
        System.out.println(returnStr);
    }
}

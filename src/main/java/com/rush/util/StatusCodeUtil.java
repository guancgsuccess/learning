package com.rush.util;

public class StatusCodeUtil {
    public static final int PHONE_STATUS=0;//手机方式
    public static final int EMAIL_STATUS=1;//邮箱方式
    public static final int ERROR_STATUS=2;//错误的账号


    /**
     * url前半部分
     */
    public static final String BASE_URL = "https://api.miaodiyun.com/20150822/industrySMS/sendSMS";

    /**
     * 开发者注册后系统自动生成的账号，可在官网登录后查看
     */
    public static final String ACCOUNT_SID = "733b0196a75f456d8c850ad1d66266f3";

    /**
     * 开发者注册后系统自动生成的TOKEN，可在官网登录后查看
     */
    public static final String AUTH_TOKEN = "33e2510ac33a4c498a8b88fe5858ae21";

    /**
     * 响应数据类型, JSON或XML
     */
    public static final String RESP_DATA_TYPE = "json";
}

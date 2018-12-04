package com.rush.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class JudgePhoneOrEmailUtil {
    public static boolean isMobileNO(String mobiles){
        if(mobiles.length()!=11){
            return false;
        }else {
            String reg = "^((13[0-9])|(14[5,7,9])|(15([0-3]|[5-9]))|(166)|(17[0,1,3,5,6,7,8])|(18[0-9])|(19[8|9]))\\d{8}$";
            Pattern p = Pattern.compile(reg);
            Matcher m = p.matcher(mobiles);
            return m.matches();
        }
    }

    public static boolean isEmailNO(String emails){
        String reg = "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$";
        Pattern p = Pattern.compile(reg);
        Matcher m = p.matcher(emails);
        return m.matches();
    }

}

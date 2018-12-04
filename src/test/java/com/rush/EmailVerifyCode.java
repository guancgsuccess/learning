package com.rush;

import com.rush.util.AchieveCode;
import org.junit.Test;

public class EmailVerifyCode {
    @Test
    public void codeTest() {
        AchieveCode achieveCode = new AchieveCode();
        System.out.println(achieveCode.sendEmailCode("2461629979@qq.com"));
    }
}

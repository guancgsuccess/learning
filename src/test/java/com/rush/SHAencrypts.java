package com.rush;

import com.rush.util.SHAencrypt;

public class SHAencrypts {
    public static void main(String[] args) throws Exception {
        String data = "abc123";
        String data1 = SHAencrypt.encryptSHA(data);
        System.out.println(data1);
    }
}

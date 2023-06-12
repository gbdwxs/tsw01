package com.tsw.utils;

import java.math.BigInteger;
import java.security.MessageDigest;

public class StringUtils {
    /**
     * 在字符串前填充0，使得字符串满足指定长度
     *
     * @param in
     * @param length
     * @return
     */
    public static String fillZreo(String in, int length) {
        return fill(in, length, "0");
    }

    /**
     * 在字符串前填充fill，使得字符串满足指定长度
     *
     * @param in
     * @param length
     * @param fill
     * @return
     */
    private static String fill(String in, int length, String fill) {
        if (in.length() >= length)
            return in;
        StringBuilder result = new StringBuilder();
        for (int i = 0; i < length - in.length(); i++) {
            result.append(fill);
        }
        result.append(in);
        return result.toString();
    }

    /**
     * MD5加密
     * @param in
     * @return
     */
    public static String MD5(String in){
        String out = "";
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(in.getBytes());
            out = new BigInteger(1, md.digest()).toString(16).toUpperCase();
            System.out.println("加密后：" + out);
        }catch (Exception e){
            System.out.println("加密失败！");
        }
        return out;
    }
}

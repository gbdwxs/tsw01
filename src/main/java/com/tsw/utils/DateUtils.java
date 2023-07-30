package com.tsw.utils;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class DateUtils {

    public static final String FORMAT8 = "yyyyMMdd";
    public static final String FORMAT6 = "HHmmss";
    public static final String FORMAT14 = "yyyyMMddHHmmss";
    public static final String FORMAT17 = "yyyyMMddHHmmssSSS";

    public static final DateTimeFormatter DF8 = DateTimeFormatter.ofPattern(FORMAT8);
    public static final DateTimeFormatter DF6 = DateTimeFormatter.ofPattern(FORMAT6);
    public static final DateTimeFormatter DF14 = DateTimeFormatter.ofPattern(FORMAT14);
    public static final DateTimeFormatter DF17 = DateTimeFormatter.ofPattern(FORMAT17);

    /**
     * 获取系统当前14位时间
     */
    public static String getNowDateTime14() {
        return LocalDateTime.now().format(DF14);
    }

    /**
     * 获取系统当前17位时间
     */
    public static String getNowDateTime17() {
        return LocalDateTime.now().format(DF17);
    }

    /**
     * 根据传进来的时间增加天数
     */
    public static String addDays(String in, int days) {
        return LocalDate.parse(in, DF8).plusDays(days).format(DF8);
    }

    /**
     * 获取当前日期
     */
    public static String getNowDate() {
        return LocalDateTime.now().format(DF8);
    }

    /**
     * 获取当前时间
     */
    public static String getNowTime() {
        return LocalDateTime.now().format(DF6);
    }

    /**
     * 获取两个日期之间的天数
     * @return
     */
    public static int between(String start, String end) {
        return (int) (LocalDate.parse(end,DF8).toEpochDay() - LocalDate.parse(start,DF8).toEpochDay());
    }

    /**
     * 获取传入时间所在月的最后一天
     */
    public static String getLastDateOfMonth(String in) {
        in = in.substring(0,6) + "01";
        LocalDate date = LocalDate.parse(in,DF8);
        date = date.plusMonths(1);
        date = date.minusDays(1);
        return date.format(DF8);
    }
}

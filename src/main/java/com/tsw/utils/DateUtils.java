package com.tsw.utils;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class DateUtils {
    /**
     * 获取系统当前14位时间
     * @return yyyyMMddHHmmss
     */
    public static String getNowDateTime14() {
        return LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss"));
    }

    /**
     * 获取系统当前17位时间
     * @return yyyyMMddHHmmssSSS
     */
    public static String getNowDateTime17() {
        return LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmssSSS"));
    }

    /**
     * 根据传进来的时间增加天数
     * @param in   yyyyMMdd
     * @param days
     * @return
     */
    public static String addDays(String in, int days) {
        return LocalDate.parse(in, DateTimeFormatter.ofPattern("yyyyMMdd")).plusDays(days).format(DateTimeFormatter.ofPattern("yyyyMMdd"));
    }

    /**
     * 获取当前日期
     * @return yyyyMMdd
     */
    public static String getNowDate() {
        return LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));
    }

    /**
     * 获取当前时间
     * @return HHmmss
     */
    public static String getNowTime() {
        return LocalDateTime.now().format(DateTimeFormatter.ofPattern("HHmmss"));
    }

    /**
     * 获取两个日期之间的天数
     * @param start yyyyMMdd
     * @param end   yyyyMMdd
     * @return
     */
    public static int between(String start, String end) {
        return (int) (LocalDate.parse(end, DateTimeFormatter.ofPattern("yyyyMMdd")).toEpochDay() - LocalDate.parse(start, DateTimeFormatter.ofPattern("yyyyMMdd")).toEpochDay());
    }

    /**
     * 获取传入时间所在月的最后一天
     * @param in yyyyMMdd
     * @return yyyyMMdd
     */
    public static String getLastDateOfMonth(String in) {
        return LocalDate.parse(LocalDate.parse(in, DateTimeFormatter.ofPattern("yyyyMMdd"))
                        .plusMonths(1).format(DateTimeFormatter.ofPattern("yyyyMMdd")).substring(0, 6) + "01", DateTimeFormatter.ofPattern("yyyyMMdd"))
                .minusDays(1).format(DateTimeFormatter.ofPattern("yyyyMMdd"));
    }
}

package com.tsw.annotion;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * sql执行自定义注解
 * @author LZK
 * @time 2023/6/4 11:08
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface LogAnnotion {
    String type() default "query";
}

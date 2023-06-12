package com.tsw.aop;

import com.tsw.annotion.LogAnnotion;
import com.tsw.contast.SysContast;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;

/**
 * AOP 日志实行
 * @author LZK
 * @time 2023/6/4 11:05
 */
@Aspect
@Component
@Slf4j
public class LogAop {

    @Before("@annotation(com.tsw.annotion.LogAnnotion)")
    public void before(JoinPoint joinPoint){
        String type = getType(joinPoint);
        if(SysContast.QUERY.equals(type)){
            System.out.println("开始执行查询！");
        }else if(SysContast.INSERT.equals(type)){
            System.out.println("开始执行新增！");
        }
    }

    private String getType(JoinPoint joinPoint){
        Method method = ((MethodSignature) joinPoint.getSignature()).getMethod();
        LogAnnotion logAnnotion = method.getAnnotation(LogAnnotion.class);
        return logAnnotion.type();
    }
}

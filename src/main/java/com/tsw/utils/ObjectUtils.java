package com.tsw.utils;

import java.lang.reflect.Field;

public class ObjectUtils {
    /**
     * 克隆
     * @param o
     * @return
     */
    public static Object Clone(Object o) {
        Object ro;
        try {
            Class c1 = o.getClass();// 获取字节码文件对象
            ro = c1.newInstance();// 使用无参构造创建对象
            Field[] f = c1.getDeclaredFields();// 获取所有的属性，包含私有属性
            for (Field a : f) {
                a.setAccessible(true);// true表示给私有属性强行赋值
                a.set(ro, a.get(o));// 赋值
            }
        } catch (Exception e) {
            return null;
        }
        return ro;
    }

    /**
     * 复制
     */
    public static void CopyFrom(Object target,Object source){
        Class c1 = target.getClass();
        Class c2 = source.getClass();
        Field[] f1 = c1.getDeclaredFields();
        Field[] f2 = c2.getDeclaredFields();
        for(Field t : f1){
            for(Field s : f2){
                if(t.getName().equals(s.getName())){
                    t.setAccessible(true);
                    s.setAccessible(true);
                    try{
                        t.set(target,s.get(source));
                    }catch (Exception e){
                        continue;
                    }
                }
            }
        }
    }
}

package com.wb.dbtool.web.framework.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * LogUtil - 日志记录工具类
 *
 * @author wangbing
 * @version 0.0.1
 * @since 2017-01-01
 */
public class LogUtil {

    //定义一个全局的记录器，通过LoggerFactory获取
    private final static Logger logger = LoggerFactory.getLogger(LogUtil.class);

    /**
     * 输出info日志
     * @param context 日志内容
     */
    public static void i(String context){
        logger.info(context);
    }

    /**
     * 输出debug日志
     * @param context 日志内容
     */
    public static void d(String context){
        logger.debug(context);
    }

    /**
     * 输出warn日志
     * @param context 日志内容
     */
    public static void w(String context){
        logger.warn(context);
    }

    /**
     * 输出error日志
     * @param context 日志内容
     */
    public static void e(String context){
        logger.error(context);
    }

    /**
     * 获取异常详细堆栈信息
     */
    public static void dumpException(Throwable e){
        StringBuffer msg = new StringBuffer("null");
        if (e != null) {
            msg = new StringBuffer("");
            String message = e.toString();
            int length = e.getStackTrace().length;
            if (length > 0) {
                msg.append(message).append("\n");
                for (int i = 0; i < length; i++) {
                    msg.append("\t").append(e.getStackTrace()[i]).append("\n");
                }
            } else {
                msg.append(message);
            }
        }
        logger.error(msg.toString());
    }
}

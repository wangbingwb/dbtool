package com.wb.dbtool.web.framework;


/**
 * Message - 基本消息类
 *
 * @author wangbing
 * @version 0.0.1
 * @since 2017-01-01
 */
public class Message {
    public static final String ERROR_500 = "服务器走了下神，稍后再试一次";
    public static final String NOT_EXIST_METHOD = "调用的方法不存在";

    public static String CREATE_FAILURE = "创建失败，请刷新后重新尝试";
    public static String DELETE_FAILURE = "删除失败，请刷新后重新尝试";
    public static String UPDATE_FAILURE = "更新失败，请刷新后重新尝试";
    public static String FIND_FAILURE = "查询失败，请刷新后重新尝试";
    public static String GET_FAILURE = "未获取相应内容";
    public static String INSERT_DUPLICATE = "已经存在相同数据，返回列表页面确认";
}

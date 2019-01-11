<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper
        PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${basePackage}.${moduleName}.mpr.${table.getCName()}Mapper">


<#if dataBase == 'ORACLE'>
    <sql id="table">"${module.modulePrefix?default("")}${table.tableName}"</sql>
<#elseif dataBase='MYSQL'>
    <sql id="table">`${module.modulePrefix?default("")}${table.tableName}`</sql>
</#if>

    <sql id="entityColumnList">
    <#if dataBase == 'ORACLE'>
        <#list table.fields as f>"${f.fieldName}"<#if f_has_next>,</#if></#list>
    <#elseif dataBase='MYSQL'>
        <#list table.fields as f>`${f.fieldName}`<#if f_has_next>,</#if></#list>
    </#if>
    </sql>

    <resultMap id="${table.getFName()}" type="${basePackage}.${moduleName}.ent.${table.getCName()}">
    <#list table.fields as f>
        <result column="${f.fieldName}"  jdbcType="${f.fieldType.jdbcType()}" property="${f.getFName()}"/>
    </#list>
    </resultMap>

    <select id="find" resultMap="${table.getFName()}">
        SELECT
        <include refid="entityColumnList"/>
        FROM
        <include refid="table"/>
        WHERE
    <#if dataBase == 'ORACLE'>
        "IS_DELETED" = 0
    <#elseif dataBase='MYSQL'>
        `IS_DELETED` = 0
    </#if>
<#list table.fields as f>
<#if f.isQuery>
<#if dataBase == 'ORACLE'>
<#if f.fieldType?contains("String")>
        <if test="request.${f.getFName()} != null and request.${f.getFName()} != ''">
            AND "${f.fieldName}" = ${r"#{"}request.${f.getFName()}}
        </if>
</#if>
<#if f.fieldType?contains("Boolean")>
        <if test="request.${f.getFName()} != null">
            AND "${f.fieldName}" = ${r"#{"}request.${f.getFName()}}
        </if>
</#if>
<#elseif dataBase='MYSQL'>
<#if f.fieldType?contains("String")>
        <if test="request.${f.getFName()} != null and request.${f.getFName()} != ''">
            AND `${f.fieldName}` = ${r"#{"}request.${f.getFName()}}
        </if>
</#if>
<#if f.fieldType?contains("Boolean")>
        <if test="request.${f.getFName()} != null">
            AND `${f.fieldName}` = ${r"#{"}request.${f.getFName()}}
        </if>
</#if>
</#if>
</#if>
</#list>
    </select>

    <select id="search" resultMap="${table.getFName()}">
        SELECT
        <include refid="entityColumnList"/>
        FROM
        <include refid="table"/>
        WHERE
    <#if dataBase == 'ORACLE'>
        "IS_DELETED" = 0
    <#elseif dataBase='MYSQL'>
        `IS_DELETED` = 0
    </#if>
        <if test="request.keyword != null and request.keyword != ''">
            1 = 2
<#list table.fields as f>
<#if f.isSearch>
<#if dataBase == 'ORACLE'>
            OR "${f.fieldName}" LIKE CONCAT(CONCAT('%',${r"#{"}request.keyword}),'%')
<#elseif dataBase='MYSQL'>
            OR `${f.fieldName}` LIKE CONCAT('%',${r"#{request.keyword}"},'%')
</#if>
</#if>
</#list>
        </if>
    </select>

    <insert id="insert">
        INSERT INTO
        <include refid="table"/>
        (
        <include refid="entityColumnList"/>
        )
        VALUES
        (
        ${r"#{"}request.id},
        <#list table.fields as f>
            <#if !f.isSystem>
        ${r"#{"}request.${f.getFName()},jdbcType=${f.fieldType.jdbcType()}},
            </#if>
        </#list>
        0,
        0,
        ${r"#{"}token.userId,jdbcType=NUMERIC},
        <#if dataBase == 'ORACLE'>sysdate<#elseif dataBase == 'MYSQL'>sysdate()</#if>,
        NULL,
        NULL
        )
    </insert>

    <update id="delete">
        UPDATE
        <include refid="table"/>
    <#if dataBase == 'ORACLE'>
        SET "IS_DELETED" = 1
        WHERE "IS_DELETED" = 0
        AND "ID" = ${r"#{"}request.id}
    <#elseif dataBase='MYSQL'>
        SET `IS_DELETED` = 1
        WHERE `IS_DELETED` = 0
        AND `ID` = ${r"#{"}request.id}
    </#if>
    </update>

    <update id="update">
        UPDATE
        <include refid="table"/>
        SET
    <#if dataBase == 'ORACLE'>
        <#list table.fields as f>
            <#if !f.isPrimaryKey>
                <#if !f.isSystem || f.fieldName == 'ID'>
        ${f.fieldName} = ${r"#{"}request.${f.getFName()},jdbcType=${f.fieldType.jdbcType()}},
                </#if>
            </#if>
        </#list>
        "ROW_VERSION" = "ROW_VERSION" + 1,
        "LAST_UPDATE_BY" = ${r"#{"}token.userId},
        "LAST_UPDATE_TIME" = sysdate
    <#elseif dataBase='MYSQL'>
        <#list table.fields as f>
            <#if !f.isPrimaryKey>
                <#if !f.isSystem || f.fieldName == 'ID'>
        ${f.fieldName} = ${r"#{"}request.${f.getFName()},jdbcType=${f.fieldType.jdbcType()}},
                </#if>
            </#if>
        </#list>
        `ROW_VERSION` = `ROW_VERSION` + 1,
        `LAST_UPDATE_BY` = ${r"#{"}token.userId},
        `LAST_UPDATE_TIME` = sysdate()
    </#if>

        WHERE
    <#if dataBase == 'ORACLE'>
        "IS_DELETED" = 0
        AND "ID" = ${r"#{"}request.id}
        AND "ROW_VERSION" = ${r"#{"}request.rowVersion}
    <#elseif dataBase='MYSQL'>
        `IS_DELETED` = 0
        AND `ID` = ${r"#{"}request.id}
        AND `ROW_VERSION` = ${r"#{"}request.rowVersion}
    </#if>
    </update>

    <select id="getAll" resultMap="${table.getFName()}">
        SELECT
        <include refid="entityColumnList"/>
        FROM
        <include refid="table"/>
        WHERE
    <#if dataBase == 'ORACLE'>
        "IS_DELETED" = 0
    <#elseif dataBase='MYSQL'>
        `IS_DELETED` = 0
    </#if>
    </select>

    <select id="get" resultMap="${table.getFName()}">
        SELECT
        <include refid="entityColumnList"/>
        FROM
        <include refid="table"/>
        WHERE
    <#if dataBase == 'ORACLE'>
        "IS_DELETED" = 0
        AND "ID" = ${r"#{request.id}"}
    <#elseif dataBase='MYSQL'>
        `IS_DELETED` = 0
        AND `ID` = ${r"#{request.id}"}
    </#if>
    </select>
</mapper>
<#if dataBase == 'ORACLE'>
<#list module.tables as table>
-- ----------------------------
-- Table structure for ${table.tableName} - ${table.tableComment?default("")}
-- ----------------------------
CREATE TABLE "${module.modulePrefix?default("")}${table.tableName}" (
<#list table.fields as field>
${dBmapper.getFieldSql(field)}<#if field_has_next>,</#if>
</#list>
);
COMMENT ON TABLE ${module.modulePrefix?default("")}${table.tableName} is '${table.tableComment?default("")}';
    <#list table.fields as field>
COMMENT ON COLUMN ${module.modulePrefix?default("")}${table.tableName}.${field.fieldName?default("")} is '${field.fieldComment?default("")}';
    </#list>

</#list>
</#if>

<#if dataBase == 'MYSQL'>
<#list module.tables as table>
-- ----------------------------
-- Table structure for ${table.tableName} - ${table.tableComment?default("")}
-- ----------------------------
CREATE TABLE `${module.modulePrefix?default("")}${table.tableName}` (
<#list table.fields as field>
    ${dBmapper.getFieldSql(field)},
</#list>
PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='${table.tableComment?default("")}';

</#list>
</#if>

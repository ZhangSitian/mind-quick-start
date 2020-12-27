# Create Database
# ------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS test DEFAULT CHARACTER SET = utf8mb4;
Use test;

CREATE TABLE IF NOT EXISTS `mr_tbl_touch` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '唯一主键',
  `data_key` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '测试key',
	`data_value` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '测试value',
	`operator` VARCHAR(10) NOT NULL DEFAULT '' COMMENT '测试人员',
	`gmt_created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`gmt_modified` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
	PRIMARY KEY (`id`),
	UNIQUE INDEX `uniq_operator_key_prefix` (`operator`,`data_key`) USING BTREE
)
COMMENT='测试消息表'
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
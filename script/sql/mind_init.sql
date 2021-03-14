# Create Database
# ------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS mind DEFAULT CHARACTER SET = utf8mb4;
Use mind;

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

CREATE TABLE `mt_tbl_user_info` (
	`id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
	`user_id` VARCHAR(20) NOT NULL COMMENT '客户号',
	`phone_number` VARCHAR(11) NOT NULL DEFAULT '' COMMENT '手机号',
	`wx_open_id` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '微信openId',
	`user_email` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '邮箱',
	`nick_name` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '昵称',
	`head_url` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '头像',
	`user_pwd` VARCHAR(32) NOT NULL DEFAULT '' COMMENT '密码串的MD5',
	`register_channel` VARCHAR(10) NOT NULL COMMENT '注册渠道',
	`login_channel` VARCHAR(10) NOT NULL COMMENT '登录渠道',
	`register_type` VARCHAR(10) NOT NULL COMMENT '注册方式',
	`first_token` VARCHAR(60) NOT NULL COMMENT '第一个token，用于判断是否是新用户',
	`last_token` VARCHAR(60) NOT NULL COMMENT '最近一个token',
	`last_device` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '最近一个设备',
	`gmt_created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`gmt_modified` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
	PRIMARY KEY (`id`),
	UNIQUE INDEX `idx_user_id` (`user_id`) USING BTREE,
	INDEX `idx_email` (`user_email`) USING BTREE,
	INDEX `idx_phone` (`phone_number`) USING BTREE
)
COMMENT='用户信息表'
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
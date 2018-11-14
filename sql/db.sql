create table sys_area
(
	id bigint auto_increment comment '编号'
		primary key,
	parent_id bigint not null comment '父级编号',
	parent_ids varchar(2000) not null comment '所有父级编号',
	name varchar(100) not null comment '名称',
	sort decimal not null comment '排序',
	code varchar(100) null comment '区域编码',
	type char null comment '区域类型',
	create_by varchar(64) not null comment '创建者',
	create_date datetime not null comment '创建时间',
	update_by varchar(64) not null comment '更新者',
	update_date datetime not null comment '更新时间',
	remarks varchar(255) null comment '备注信息',
	del_flag char default '0' not null comment '删除标记'
)
comment '区域表' collate=utf8_bin
;

create index sys_area_del_flag
	on sys_area (del_flag)
;

create index sys_area_parent_id
	on sys_area (parent_id)
;

create table sys_column_hide
(
	id bigint auto_increment comment 'ID'
		primary key,
	column_hide_arr varchar(100) null comment '页面上要隐藏的列索引,使用逗号分隔',
	page_name varchar(50) null comment '页面名称',
	class_name varchar(50) null comment '所属类名,唯一标识'
)
comment '列隐藏' collate=utf8mb4_bin
;

create table sys_dict
(
	id bigint null,
	value tinytext null,
	label tinytext null,
	type tinytext null,
	description tinytext null,
	sort decimal null,
	parent_id bigint null,
	create_by tinytext null,
	create_date timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
	update_by tinytext null,
	update_date timestamp default '0000-00-00 00:00:00' not null,
	remarks varchar(255) null,
	del_flag char null
)
comment '字典表'
;

create table sys_log
(
	id bigint auto_increment comment '编号'
		primary key,
	type char default '1' null comment '日志类型',
	title varchar(255) default '' null comment '日志标题',
	create_by varchar(64) null comment '创建者',
	create_date datetime null comment '创建时间',
	remote_addr varchar(255) null comment '操作IP地址',
	user_agent varchar(255) null comment '用户代理',
	request_uri varchar(255) null comment '请求URI',
	method varchar(5) null comment '操作方式',
	params text null comment '操作提交的数据',
	exception text null comment '异常信息'
)
comment '日志表' collate=utf8_bin
;

create index sys_log_create_by
	on sys_log (create_by)
;

create index sys_log_create_date
	on sys_log (create_date)
;

create index sys_log_request_uri
	on sys_log (request_uri)
;

create index sys_log_type
	on sys_log (type)
;

create table sys_menu
(
	id bigint auto_increment comment '编号'
		primary key,
	parent_id bigint not null comment '父级编号',
	parent_ids varchar(2000) not null comment '所有父级编号',
	name varchar(100) not null comment '名称',
	sort decimal not null comment '排序',
	href varchar(2000) null comment '链接',
	target varchar(20) null comment '目标',
	icon varchar(100) null comment '图标',
	is_show char not null comment '是否在菜单中显示',
	permission varchar(200) null comment '权限标识',
	create_by varchar(64) not null comment '创建者',
	create_date datetime not null comment '创建时间',
	update_by varchar(64) not null comment '更新者',
	update_date datetime not null comment '更新时间',
	remarks varchar(255) null comment '备注信息',
	del_flag char default '0' not null comment '删除标记'
)
comment '菜单表' collate=utf8_bin
;

create index sys_menu_del_flag
	on sys_menu (del_flag)
;

create index sys_menu_parent_id
	on sys_menu (parent_id)
;

create table sys_office
(
	id bigint auto_increment comment '编号'
		primary key,
	parent_id bigint not null comment '父级编号',
	parent_ids varchar(2000) not null comment '所有父级编号',
	name varchar(100) not null comment '名称',
	sort decimal not null comment '排序',
	area_id varchar(64) not null comment '归属区域',
	code varchar(100) null comment '区域编码',
	type char not null comment '机构类型',
	grade char not null comment '机构等级',
	address varchar(255) null comment '联系地址',
	zip_code varchar(100) null comment '邮政编码',
	master varchar(100) null comment '负责人',
	phone varchar(200) null comment '电话',
	fax varchar(200) null comment '传真',
	email varchar(200) null comment '邮箱',
	USEABLE varchar(64) null comment '是否启用',
	PRIMARY_PERSON varchar(64) null comment '主负责人',
	DEPUTY_PERSON varchar(64) null comment '副负责人',
	create_by varchar(64) not null comment '创建者',
	create_date datetime not null comment '创建时间',
	update_by varchar(64) not null comment '更新者',
	update_date datetime not null comment '更新时间',
	remarks varchar(255) null comment '备注信息',
	del_flag char default '0' not null comment '删除标记'
)
comment '机构表' collate=utf8_bin
;

create index sys_office_del_flag
	on sys_office (del_flag)
;

create index sys_office_parent_id
	on sys_office (parent_id)
;

create index sys_office_type
	on sys_office (type)
;

create table sys_role
(
	id bigint auto_increment comment '编号'
		primary key,
	office_id bigint null comment '归属机构',
	name varchar(100) not null comment '角色名称',
	enname varchar(255) null comment '英文名称',
	role_type varchar(255) null comment '角色类型',
	data_scope char null comment '数据范围',
	is_sys varchar(64) null comment '是否系统数据',
	useable varchar(64) null comment '是否可用',
	create_by varchar(64) not null comment '创建者',
	create_date datetime not null comment '创建时间',
	update_by varchar(64) not null comment '更新者',
	update_date datetime not null comment '更新时间',
	remarks varchar(255) null comment '备注信息',
	del_flag char default '0' not null comment '删除标记'
)
comment '角色表' collate=utf8_bin
;

create index sys_role_del_flag
	on sys_role (del_flag)
;

create index sys_role_enname
	on sys_role (enname)
;

create table sys_role_menu
(
	role_id bigint not null comment '角色编号',
	menu_id bigint not null comment '菜单编号',
	primary key (role_id, menu_id)
)
comment '角色-菜单' collate=utf8_bin
;

create table sys_role_office
(
	role_id bigint not null comment '角色编号',
	office_id bigint not null comment '机构编号',
	primary key (role_id, office_id)
)
comment '角色-机构' collate=utf8_bin
;

create table sys_user
(
	id bigint auto_increment comment '编号'
		primary key,
	company_id bigint not null comment '归属公司',
	office_id bigint not null comment '归属部门',
	login_name varchar(100) not null comment '登录名',
	password varchar(100) not null comment '密码',
	no varchar(100) null comment '工号',
	name varchar(100) not null comment '姓名',
	email varchar(200) null comment '邮箱',
	phone varchar(200) null comment '电话',
	mobile varchar(200) null comment '手机',
	user_type char null comment '用户类型',
	photo varchar(1000) null comment '用户头像',
	login_ip varchar(100) null comment '最后登陆IP',
	login_date datetime null comment '最后登陆时间',
	login_flag varchar(64) null comment '是否可登录',
	create_by varchar(64) not null comment '创建者',
	create_date datetime not null comment '创建时间',
	update_by varchar(64) not null comment '更新者',
	update_date datetime not null comment '更新时间',
	remarks varchar(255) null comment '备注信息',
	del_flag char default '0' not null comment '删除标记'
)
comment '用户表' collate=utf8_bin
;

create index sys_user_company_id
	on sys_user (company_id)
;

create index sys_user_del_flag
	on sys_user (del_flag)
;

create index sys_user_login_name
	on sys_user (login_name)
;

create index sys_user_office_id
	on sys_user (office_id)
;

create index sys_user_update_date
	on sys_user (update_date)
;

create table sys_user_role
(
	user_id bigint not null comment '用户编号',
	role_id bigint not null comment '角色编号',
	primary key (user_id, role_id)
)
comment '用户-角色' collate=utf8_bin
;

create table if not exists redis_cluster
(
	id bigint auto_increment comment '编号'
		primary key,
	redis_host_name varchar(100) not null comment 'redis主机名',
	redis_port int(20) null comment 'redis端口',
	create_by varchar(64) not null comment '创建者',
	create_date datetime not null comment '创建时间',
	update_by varchar(64) not null comment '更新者',
	update_date datetime not null comment '更新时间',
	remarks varchar(255) null comment '备注信息',
	del_flag char default '0' not null comment '删除标记'
)
comment 'redis集群信息' collate=utf8_bin
;

INSERT INTO `x-redis-admin`.redis_cluster (id, redis_host_name, redis_port, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (1, '127.0.0.1', 7000, '1', '2018-11-14 20:23:58', '1', '2018-11-14 20:23:58', '', '0');
INSERT INTO `x-redis-admin`.redis_cluster (id, redis_host_name, redis_port, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (2, '127.0.0.1', 7001, '1', '2018-11-14 20:23:59', '1', '2018-11-14 20:24:09', '', '0');
INSERT INTO `x-redis-admin`.redis_cluster (id, redis_host_name, redis_port, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (3, '127.0.0.1', 7002, '1', '2018-11-14 20:24:16', '1', '2018-11-14 20:24:16', '', '0');
INSERT INTO `x-redis-admin`.redis_cluster (id, redis_host_name, redis_port, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (4, '127.0.0.1', 7003, '1', '2018-11-14 20:24:22', '1', '2018-11-14 20:24:22', '', '0');
INSERT INTO `x-redis-admin`.redis_cluster (id, redis_host_name, redis_port, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (5, '127.0.0.1', 7004, '1', '2018-11-14 20:24:28', '1', '2018-11-14 20:24:28', '', '0');
INSERT INTO `x-redis-admin`.redis_cluster (id, redis_host_name, redis_port, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (6, '127.0.0.1', 7005, '1', '2018-11-14 20:24:33', '1', '2018-11-14 20:24:33', '', '0');

INSERT INTO `x-redis-admin`.sys_area (id, parent_id, parent_ids, name, sort, code, type, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (1, 0, '0,', '中国', 10, '100000', '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_area (id, parent_id, parent_ids, name, sort, code, type, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (2, 1, '0,1,', '北京', 20, '110000', '2', '1', '2013-05-27 08:00:00', '1', '2018-10-11 14:23:48', '', '0');
INSERT INTO `x-redis-admin`.sys_area (id, parent_id, parent_ids, name, sort, code, type, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (3, 2, '0,1,2,', '北京市', 30, '110101', '3', '1', '2013-05-27 08:00:00', '1', '2018-10-11 17:34:38', '', '0');
INSERT INTO `x-redis-admin`.sys_area (id, parent_id, parent_ids, name, sort, code, type, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (4, 3, '0,1,2,3,', '海淀区', 40, '110102', '4', '1', '2013-05-27 08:00:00', '1', '2018-10-15 21:10:41', '', '0');
INSERT INTO `x-redis-admin`.sys_area (id, parent_id, parent_ids, name, sort, code, type, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (5, 3, '0,1,2,3,', '东城区', 30, '100005', '4', '1', '2018-10-11 17:36:40', '1', '2018-10-11 18:04:41', '', '1');

INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (1, '0', '正常', 'del_flag', '删除标记', 10, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (2, '1', '删除', 'del_flag', '删除标记', 20, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (3, '1', '显示', 'show_hide', '显示/隐藏', 10, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (4, '0', '隐藏', 'show_hide', '显示/隐藏', 20, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (5, '1', '是', 'yes_no', '是/否', 10, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (6, '0', '否', 'yes_no', '是/否', 20, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (7, 'red', '红色', 'color', '颜色值', 10, 0, '1', '2013-05-27 08:00:00', '1', '2018-10-15 21:11:08', '', '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (8, 'green', '绿色', 'color', '颜色值', 20, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (9, 'blue', '蓝色', 'color', '颜色值', 30, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (10, 'yellow', '黄色', 'color', '颜色值', 40, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (11, 'orange', '橙色', 'color', '颜色值', 50, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (12, 'default', '默认主题', 'theme', '主题方案', 10, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (13, 'cerulean', '天蓝主题', 'theme', '主题方案', 20, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (14, 'readable', '橙色主题', 'theme', '主题方案', 30, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (15, 'united', '红色主题', 'theme', '主题方案', 40, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (16, 'flat', 'Flat主题', 'theme', '主题方案', 60, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (17, '1', '国家', 'sys_area_type', '区域类型', 10, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (18, '2', '省份、直辖市', 'sys_area_type', '区域类型', 20, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (19, '3', '地市', 'sys_area_type', '区域类型', 30, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (20, '4', '区县', 'sys_area_type', '区域类型', 40, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (21, '1', '公司', 'sys_office_type', '机构类型', 60, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (22, '2', '部门', 'sys_office_type', '机构类型', 70, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (23, '3', '小组', 'sys_office_type', '机构类型', 80, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (24, '4', '其它', 'sys_office_type', '机构类型', 90, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (25, '1', '综合部', 'sys_office_common', '快捷通用部门', 30, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (26, '2', '开发部', 'sys_office_common', '快捷通用部门', 40, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (27, '3', '人力部', 'sys_office_common', '快捷通用部门', 50, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (28, '1', '一级', 'sys_office_grade', '机构等级', 10, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (29, '2', '二级', 'sys_office_grade', '机构等级', 20, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (30, '3', '三级', 'sys_office_grade', '机构等级', 30, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (31, '4', '四级', 'sys_office_grade', '机构等级', 40, 0, '1', '2013-05-27 08:00:00', '1', '2018-10-11 18:49:44', '', '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (32, '1', '所有数据', 'sys_data_scope', '数据范围', 10, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (33, '2', '所在公司及以下数据', 'sys_data_scope', '数据范围', 20, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (34, '3', '所在公司数据', 'sys_data_scope', '数据范围', 30, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (35, '4', '所在部门及以下数据', 'sys_data_scope', '数据范围', 40, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (36, '5', '所在部门数据', 'sys_data_scope', '数据范围', 50, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (37, '8', '仅本人数据', 'sys_data_scope', '数据范围', 90, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (38, '9', '按明细设置', 'sys_data_scope', '数据范围', 100, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (39, '1', '系统管理', 'sys_user_type', '用户类型', 10, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (41, '2', '普通用户', 'sys_user_type', '用户类型', 30, 0, '1', '2013-05-27 08:00:00', '1', '2018-10-11 15:05:47', '', '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (67, '1', '接入日志', 'sys_log_type', '日志类型', 30, 0, '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (68, '2', '异常日志', 'sys_log_type', '日志类型', 40, 0, '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (96, '1', '男', 'sex', '性别', 10, 0, '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (97, '2', '女', 'sex', '性别', 20, 0, '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (98, '22222', '红色2222', 'color2222', '颜色值2222', 10, 0, '1', '2018-10-11 17:24:41', '1', '2018-10-11 17:24:41', '', '1');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (99, '1', 'pass', 'user_type', '用户类型', 10, 0, '1', '2018-10-16 13:21:57', '1', '2018-10-16 13:24:25', '用户类型', '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (100, '0', 'uc', 'user_type', '用户类型', 20, 0, '1', '2018-10-16 13:22:47', '1', '2018-10-16 13:24:28', '用户类型', '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (101, '1', '可用', 'ps_user_status_code', '是否可用', 20, 0, '1', '2018-10-16 13:27:59', '1', '2018-10-16 20:34:16', '是否可用', '1');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (102, '0', '隐藏', 'studio_status_code', '是否显示', 10, 0, '1', '2018-10-16 13:28:20', '1', '2018-10-18 16:39:28', '', '1');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (103, '0', '普通用户', 'is_employee', '是否为员工', 10, 0, '1', '2018-11-14 20:45:07', '1', '2018-10-16 13:30:50', '是否为员工', '1');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (104, '1', '百度账号', 'is_employee', '是否为员工', 20, 0, '1', '2018-11-14 20:45:13', '1', '2018-10-16 13:30:52', '是否为员工', '1');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (105, '0', '是', 'capacity', '是否', 10, 0, '1', '2018-10-16 13:35:59', '1', '2018-10-16 13:35:59', '是否', '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (106, '1', '否', 'capacity', '是否', 20, 0, '1', '2018-10-16 13:36:15', '1', '2018-10-16 13:36:15', '是否', '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (107, '1', '提交', 'ps_match_submit_status_code', '提交状态', 10, 0, '1', '2018-10-16 13:58:43', '1', '2018-10-18 16:42:50', '1:提交2:对比中3:对比完成4:异常5:下载完成', '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (108, '2', '对比中', 'ps_match_submit_status_code', '提交状态', 20, 0, '1', '2018-10-16 13:59:22', '1', '2018-10-18 16:43:03', '1:提交2:对比中3:对比完成4:异常5:下载完成', '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (109, '3', '对比完成', 'ps_match_submit_status_code', '提交状态', 30, 0, '1', '2018-10-16 13:59:57', '1', '2018-10-18 16:43:10', '1:提交2:对比中3:对比完成4:异常5:下载完成', '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (110, '4', '异常', 'ps_match_submit_status_code', '提交状态', 40, 0, '1', '2018-10-16 14:00:29', '1', '2018-10-18 16:43:22', '1:提交2:对比中3:对比完成4:异常5:下载完成', '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (111, '5', '下载完成', 'ps_match_submit_status_code', '提交状态', 50, 0, '1', '2018-10-16 14:00:54', '1', '2018-10-18 16:43:35', '1:提交2:对比中3:对比完成4:异常5:下载完成', '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (112, '1', '匿名', 'anonymous', '是否匿名', 10, 0, '1', '2018-10-16 14:01:57', '1', '2018-10-16 14:01:57', '是否匿名:1匿名，0不匿名', '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (113, '0', '不匿名', 'anonymous', '是否匿名', 20, 0, '1', '2018-10-16 14:02:22', '1', '2018-10-16 14:02:22', '是否匿名:1匿名，0不匿名', '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (114, '1', '通过', 'routine_pass', '常规赛是否通过', 10, 0, '1', '2018-10-16 15:24:56', '1', '2018-10-16 15:24:56', '常规赛是否通过', '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (115, '0', '未通过', 'routine_pass', '常规赛是否通过', 20, 0, '1', '2018-10-16 15:25:28', '1', '2018-10-20 19:30:02', '常规赛是否通过', '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (116, '0', '否', 'ps_match_routine', '是否为常规赛', 10, 0, '1', '2018-10-16 16:16:26', '1', '2018-10-17 19:15:11', '是否为常规赛', '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (117, '1', '是', 'ps_match_routine', '是否为常规赛', 20, 0, '1', '2018-10-16 16:17:00', '1', '2018-10-17 19:15:25', '是否为常规赛', '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (118, '1', '是', 'has_leaderboard', '是否有排行版', 20, 0, '1', '2018-10-16 16:43:27', '1', '2018-10-16 16:48:47', '是否有排行版', '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (119, '0', '否', 'has_leaderboard', '是否有排行版', 10, 0, '1', '2018-10-16 16:43:55', '1', '2018-10-16 16:43:55', '是否有排行版', '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (120, '0', '否', 'self_signup', '是否可自己报名', 10, 0, '1', '2018-10-16 16:44:25', '1', '2018-10-16 16:44:25', '是否可自己报名', '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (121, '1', '是', 'self_signup', '是否可自己报名', 20, 0, '1', '2018-10-16 16:44:53', '1', '2018-10-16 16:48:37', '是否可自己报名', '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (122, '1', '显示', 'ps_match_status_code', '比赛状态', 10, 0, '1', '2018-10-16 20:22:28', '1', '2018-10-20 19:30:40', '软删除标识:0不显示,1显示', '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (123, '0', '不显示', 'ps_match_status_code', '比赛状态', 20, 0, '1', '2018-10-16 20:23:48', '1', '2018-10-20 19:30:48', '软删除标识:0不显示,1显示', '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (124, '1', '北京gpu', 'active_notebook_cluster', '0cpu集群', 10, 0, '1', '2018-11-14 20:45:46', '1', '2018-10-18 15:05:48', '0cpu集群  1北京gpu  2苏州gpu', '1');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (125, '2', '苏州gpu', 'active_notebook_cluster', '0cpu集群', 10, 0, '1', '2018-11-14 20:45:43', '1', '2018-10-18 15:06:17', '0cpu集群  1北京gpu  2苏州gpu', '1');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (126, '0', '隐藏', 'ps_project_status_code', '状态', 10, 0, '1', '2018-10-18 15:11:52', '1', '2018-10-18 15:14:14', '项目状态1显示0隐藏', '1');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (127, '1', '显示', 'ps_project_status_code', '项目状态', 10, 0, '1', '2018-10-18 15:13:59', '1', '2018-10-18 15:14:07', '项目状态1显示0隐藏', '1');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (128, '0', '隐藏', 'studio_status_code', '是否显示', 10, 0, '1', '2018-10-18 16:38:37', '1', '2018-10-18 16:38:37', '', '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (129, '1', '显示', 'studio_status_code', '是否显示', 10, 0, '1', '2018-10-18 16:38:52', '1', '2018-10-18 16:38:52', '', '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (130, '1', '状态1', 'ps_project_project_type', '项目状态', 10, 0, '1', '2018-10-18 16:56:04', '1', '2018-10-18 16:57:05', '', '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (131, '2', '状态2', 'ps_project_project_type', '项目状态', 20, 0, '1', '2018-10-18 16:56:19', '1', '2018-10-18 16:57:12', '', '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (132, '3', '状态3', 'ps_project_project_type', '项目状态', 30, 0, '1', '2018-10-18 16:56:36', '1', '2018-10-18 16:57:19', '', '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (133, '0', '隐藏', 'sys_column_hide_show_type', '是否隐藏列', 20, 0, '1', '2018-10-22 10:34:12', '1', '2018-10-22 10:34:12', '', '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (134, '1', '显示', 'sys_column_hide_show_type', '是否隐藏列', 10, 0, '1', '2018-10-22 10:34:25', '1', '2018-10-22 10:34:25', '', '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (135, 'dev', '开发环境', 'sys_config_env_type', '环境参数', 10, 0, '1', '2018-10-23 14:18:51', '1', '2018-10-23 15:06:13', 'dev开发环境，test测试环境，prod生产环境，local本地环境', '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (136, 'test', '测试环境', 'sys_config_env_type', '环境参数', 20, 0, '1', '2018-10-23 14:19:10', '1', '2018-10-23 15:06:40', 'dev开发环境，test测试环境，prod生产环境，local本地环境', '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (137, 'prod', '生产环境', 'sys_config_env_type', '环境参数', 30, 0, '1', '2018-10-23 14:19:26', '1', '2018-10-23 15:06:53', 'dev开发环境，test测试环境，prod生产环境，local本地环境', '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (138, 'local', '本地环境', 'sys_config_env_type', '环境参数', 20, 0, '1', '2018-10-23 15:05:20', '1', '2018-10-23 15:06:27', 'dev开发环境，test测试环境，prod生产环境，local本地环境', '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (139, 'string', 'string', 'redis_data_type', 'String类型', 10, 0, '1', '2018-10-29 15:13:42', '1', '2018-10-29 15:14:56', '', '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (140, 'list', 'list', 'redis_data_type', 'List类型', 20, 0, '1', '2018-10-29 15:13:53', '1', '2018-10-29 15:15:05', '', '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (141, 'set', 'set', 'redis_data_type', 'Set类型', 30, 0, '1', '2018-10-29 15:14:06', '1', '2018-10-29 15:15:21', '', '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (142, 'zset', 'zset', 'redis_data_type', 'ZSet类型', 40, 0, '1', '2018-10-29 15:14:27', '1', '2018-10-29 15:15:13', '', '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (143, 'hash', 'hash', 'redis_data_type', 'Hash类型', 50, 0, '1', '2018-10-29 15:14:50', '1', '2018-10-29 15:14:50', '', '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (144, '0', '右侧(尾部)', 'redis_list_from_left', 'redis缓存list是否从左侧添加', 10, 0, '1', '2018-10-30 17:08:58', '1', '2018-11-03 10:32:54', '', '0');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (145, 'right', '从右侧添加', 'redis_list_left_or_right', 'redis缓存list从左侧还是右侧添加', 20, 0, '1', '2018-10-30 17:09:15', '1', '2018-10-30 17:09:15', '', '1');
INSERT INTO `x-redis-admin`.sys_dict (id, value, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (146, '1', '左侧(头部)', 'redis_list_from_left', 'redis缓存list是否从左侧添加', 20, 0, '1', '2018-10-30 17:11:12', '1', '2018-11-03 10:32:41', '', '0');

INSERT INTO `x-redis-admin`.sys_menu (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (1, 0, '0,', '功能菜单', 0, null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_menu (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (2, 1, '0,1,', '系统设置', 10, null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_menu (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (3, 2, '0,1,2,', '系统设置', 40, null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_menu (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (4, 3, '0,1,2,3,', '菜单管理', 30, '/sys/menu/', '', 'list-alt', '1', '', '1', '2013-05-27 08:00:00', '1', '2018-10-15 14:39:45', '', '0');
INSERT INTO `x-redis-admin`.sys_menu (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (5, 4, '0,1,2,3,4,', '查看', 30, null, null, null, '0', 'sys:menu:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_menu (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (6, 4, '0,1,2,3,4,', '修改', 40, null, null, null, '0', 'sys:menu:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_menu (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (7, 3, '0,1,2,3,', '角色管理', 50, '/sys/role/', null, 'lock', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_menu (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (8, 7, '0,1,2,3,7,', '查看', 30, null, null, null, '0', 'sys:role:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_menu (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (9, 7, '0,1,2,3,7,', '修改', 40, null, null, null, '0', 'sys:role:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_menu (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (10, 3, '0,1,2,3,', '字典管理', 60, '/sys/dict/', null, 'th-list', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_menu (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (11, 10, '0,1,2,3,10,', '查看', 30, null, null, null, '0', 'sys:dict:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_menu (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (12, 10, '0,1,2,3,10,', '修改', 40, null, null, null, '0', 'sys:dict:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_menu (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (13, 2, '0,1,2,', '机构用户', 30, null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_menu (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (14, 13, '0,1,2,13,', '区域管理', 50, '/sys/area/', null, 'th', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_menu (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (15, 14, '0,1,2,13,14,', '查看', 30, null, null, null, '0', 'sys:area:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_menu (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (16, 14, '0,1,2,13,14,', '修改', 40, null, null, null, '0', 'sys:area:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_menu (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (17, 13, '0,1,2,13,', '机构管理', 40, '/sys/office/', null, 'th-large', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_menu (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (18, 17, '0,1,2,13,17,', '查看', 30, null, null, null, '0', 'sys:office:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_menu (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (19, 17, '0,1,2,13,17,', '修改', 40, null, null, null, '0', 'sys:office:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_menu (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (20, 13, '0,1,2,13,', '用户管理', 30, '/sys/user/index', '', 'user', '1', '', '1', '2013-05-27 08:00:00', '1', '2018-10-11 18:04:51', '', '0');
INSERT INTO `x-redis-admin`.sys_menu (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (21, 20, '0,1,2,13,20,', '查看', 30, '', '', '', '0', 'sys:user:view', '1', '2013-05-27 08:00:00', '1', '2018-10-07 19:35:28', '', '0');
INSERT INTO `x-redis-admin`.sys_menu (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (22, 20, '0,1,2,13,20,', '修改', 40, null, null, null, '0', 'sys:user:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_menu (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (27, 2, '0,1,2,', '我的面板', 20, '', '', '', '0', '', '1', '2013-05-27 08:00:00', '1', '2018-10-11 16:17:24', '', '0');
INSERT INTO `x-redis-admin`.sys_menu (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (28, 27, '0,1,2,27,', '个人信息', 30, '', '', '', '1', '', '1', '2013-05-27 08:00:00', '1', '2018-10-11 18:49:24', '', '0');
INSERT INTO `x-redis-admin`.sys_menu (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (29, 28, '0,1,2,27,28,', '个人信息', 30, '/sys/user/info', null, 'user', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_menu (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (30, 28, '0,1,2,27,28,', '修改密码', 40, '/sys/user/modifyPwd', null, 'lock', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_menu (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (57, 56, '0,1,2,27,40,56,', '查看', 30, null, null, null, '0', 'cms:ckfinder:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_menu (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (58, 56, '0,1,2,27,40,56,', '上传', 40, null, null, null, '0', 'cms:ckfinder:upload', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_menu (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (59, 56, '0,1,2,27,40,56,', '修改', 50, null, null, null, '0', 'cms:ckfinder:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `x-redis-admin`.sys_menu (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (80, 2, '0,1,2,', '开发工具', 10, '', '', '', '1', '', '1', '2013-10-16 08:00:00', '1', '2018-10-16 09:56:09', '仅供研发人员使用！', '0');
INSERT INTO `x-redis-admin`.sys_menu (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (149, 80, '0,1,2,80,', '缓存管理', 10, '/redis/sysRedis', '', '', '1', '', '1', '2018-10-20 16:40:30', '1', '2018-10-20 17:46:09', '', '0');
INSERT INTO `x-redis-admin`.sys_menu (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (150, 149, '0,1,2,80,149,', '查看', 30, null, null, null, '0', 'redis:sysRedis:view', '1', '2018-10-20 16:40:30', '1', '2018-10-20 16:40:30', null, '0');
INSERT INTO `x-redis-admin`.sys_menu (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (151, 149, '0,1,2,80,149,', '修改', 30, null, null, null, '0', 'redis:sysRedis:edit', '1', '2018-10-20 16:40:30', '1', '2018-10-20 16:40:30', null, '0');
INSERT INTO `x-redis-admin`.sys_menu (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (160, 80, '0,1,2,80,', '集群配置', 40, '/redis/redisCluster', '', '', '1', '', '1', '2018-11-14 20:21:33', '1', '2018-11-14 20:21:43', '', '0');
INSERT INTO `x-redis-admin`.sys_menu (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (161, 160, '0,1,2,80,160,', '查看', 30, '', '', '', '0', 'redis:redisCluster:view', '1', '2018-11-14 20:22:13', '1', '2018-11-14 20:22:13', '', '0');
INSERT INTO `x-redis-admin`.sys_menu (id, parent_id, parent_ids, name, sort, href, target, icon, is_show, permission, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (162, 160, '0,1,2,80,160,', '修改', 60, '', '', '', '0', 'redis:redisCluster:edit', '1', '2018-11-14 20:22:29', '1', '2018-11-14 20:22:29', '', '0');

INSERT INTO `x-redis-admin`.sys_office (id, parent_id, parent_ids, name, sort, area_id, code, type, grade, address, zip_code, master, phone, fax, email, USEABLE, PRIMARY_PERSON, DEPUTY_PERSON, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (1, 0, '0,', '总部', 10, '2', '100000', '1', '1', '', '', '', '', '', '', '1', '', '', '1', '2013-05-27 08:00:00', '1', '2018-11-14 20:43:56', '', '0');
INSERT INTO `x-redis-admin`.sys_office (id, parent_id, parent_ids, name, sort, area_id, code, type, grade, address, zip_code, master, phone, fax, email, USEABLE, PRIMARY_PERSON, DEPUTY_PERSON, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (2, 1, '0,1,', '研发部', 30, '4', '100000001', '2', '1', '', '', '', '', '', '', '1', '', '', '1', '2018-10-11 14:23:13', '1', '2018-11-14 20:44:08', '', '0');

INSERT INTO `x-redis-admin`.sys_role_menu (role_id, menu_id) VALUES (1, 1);
INSERT INTO `x-redis-admin`.sys_role_menu (role_id, menu_id) VALUES (1, 2);
INSERT INTO `x-redis-admin`.sys_role_menu (role_id, menu_id) VALUES (1, 3);
INSERT INTO `x-redis-admin`.sys_role_menu (role_id, menu_id) VALUES (1, 4);
INSERT INTO `x-redis-admin`.sys_role_menu (role_id, menu_id) VALUES (1, 5);
INSERT INTO `x-redis-admin`.sys_role_menu (role_id, menu_id) VALUES (1, 6);
INSERT INTO `x-redis-admin`.sys_role_menu (role_id, menu_id) VALUES (1, 7);
INSERT INTO `x-redis-admin`.sys_role_menu (role_id, menu_id) VALUES (1, 8);
INSERT INTO `x-redis-admin`.sys_role_menu (role_id, menu_id) VALUES (1, 9);
INSERT INTO `x-redis-admin`.sys_role_menu (role_id, menu_id) VALUES (1, 10);
INSERT INTO `x-redis-admin`.sys_role_menu (role_id, menu_id) VALUES (1, 11);
INSERT INTO `x-redis-admin`.sys_role_menu (role_id, menu_id) VALUES (1, 12);
INSERT INTO `x-redis-admin`.sys_role_menu (role_id, menu_id) VALUES (1, 13);
INSERT INTO `x-redis-admin`.sys_role_menu (role_id, menu_id) VALUES (1, 14);
INSERT INTO `x-redis-admin`.sys_role_menu (role_id, menu_id) VALUES (1, 15);
INSERT INTO `x-redis-admin`.sys_role_menu (role_id, menu_id) VALUES (1, 16);
INSERT INTO `x-redis-admin`.sys_role_menu (role_id, menu_id) VALUES (1, 17);
INSERT INTO `x-redis-admin`.sys_role_menu (role_id, menu_id) VALUES (1, 18);
INSERT INTO `x-redis-admin`.sys_role_menu (role_id, menu_id) VALUES (1, 19);
INSERT INTO `x-redis-admin`.sys_role_menu (role_id, menu_id) VALUES (1, 20);
INSERT INTO `x-redis-admin`.sys_role_menu (role_id, menu_id) VALUES (1, 21);
INSERT INTO `x-redis-admin`.sys_role_menu (role_id, menu_id) VALUES (1, 22);
INSERT INTO `x-redis-admin`.sys_role_menu (role_id, menu_id) VALUES (1, 27);
INSERT INTO `x-redis-admin`.sys_role_menu (role_id, menu_id) VALUES (1, 28);
INSERT INTO `x-redis-admin`.sys_role_menu (role_id, menu_id) VALUES (1, 29);
INSERT INTO `x-redis-admin`.sys_role_menu (role_id, menu_id) VALUES (1, 30);
INSERT INTO `x-redis-admin`.sys_role_menu (role_id, menu_id) VALUES (1, 57);
INSERT INTO `x-redis-admin`.sys_role_menu (role_id, menu_id) VALUES (1, 58);
INSERT INTO `x-redis-admin`.sys_role_menu (role_id, menu_id) VALUES (1, 59);
INSERT INTO `x-redis-admin`.sys_role_menu (role_id, menu_id) VALUES (1, 80);
INSERT INTO `x-redis-admin`.sys_role_menu (role_id, menu_id) VALUES (1, 149);
INSERT INTO `x-redis-admin`.sys_role_menu (role_id, menu_id) VALUES (1, 150);
INSERT INTO `x-redis-admin`.sys_role_menu (role_id, menu_id) VALUES (1, 151);
INSERT INTO `x-redis-admin`.sys_role_menu (role_id, menu_id) VALUES (1, 160);
INSERT INTO `x-redis-admin`.sys_role_menu (role_id, menu_id) VALUES (1, 161);
INSERT INTO `x-redis-admin`.sys_role_menu (role_id, menu_id) VALUES (1, 162);
INSERT INTO `x-redis-admin`.sys_role_menu (role_id, menu_id) VALUES (8, 1);

INSERT INTO `x-redis-admin`.sys_role_office (role_id, office_id) VALUES (1, 1);

INSERT INTO `x-redis-admin`.sys_role (id, office_id, name, enname, role_type, data_scope, is_sys, useable, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (1, 2, '系统管理员', 'dept', 'assignment', '1', '1', '1', '1', '2013-05-27 08:00:00', '1', '2018-11-14 20:22:39', '', '0');
INSERT INTO `x-redis-admin`.sys_role (id, office_id, name, enname, role_type, data_scope, is_sys, useable, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (8, 2, '普通用户', 'ordinaryuser', 'user', '8', '1', '1', '1', '2018-10-17 10:14:40', '1', '2018-10-17 10:14:40', '', '1');

INSERT INTO `x-redis-admin`.sys_user_role (user_id, role_id) VALUES (1, 1);
INSERT INTO `x-redis-admin`.sys_user_role (user_id, role_id) VALUES (8, 8);

INSERT INTO `x-redis-admin`.sys_user (id, company_id, office_id, login_name, password, no, name, email, phone, mobile, user_type, photo, login_ip, login_date, login_flag, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (1, 1, 2, 'admin', 'a5eaa537ee49eeb81ddeb7b4d327f98fcef83943b0cd442f06b6e3a2', '0001', '系统管理员', 'xbs1019@126.com', '17610639158', '17610639158', '1', '/userfiles/1/images/photo/2018/10/05de1b07.jpeg', '0:0:0:0:0:0:0:1', '2018-11-14 20:48:26', '1', '1', '2013-05-27 08:00:00', '1', '2018-11-14 20:44:32', '最高管理员', '0');
INSERT INTO `x-redis-admin`.sys_user (id, company_id, office_id, login_name, password, no, name, email, phone, mobile, user_type, photo, login_ip, login_date, login_flag, create_by, create_date, update_by, update_date, remarks, del_flag) VALUES (8, 1, 2, 'user', 'bb4589fdb5f226c0bd35f37b0d69748ff361d6e23c4ef7d53d5abd1c', '10010', 'user', '', '', '', '2', '/userfiles/8/images/photo/2018/10/93a27ccc.jpeg', '0:0:0:0:0:0:0:1', '2018-10-17 10:16:02', '1', '1', '2018-10-17 10:15:47', '1', '2018-10-17 16:34:02', '', '1');


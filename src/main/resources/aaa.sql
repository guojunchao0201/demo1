
/*
多帧报文共用一张表时，表字段data_sources为报文名
 */
-- 资产表
CREATE TABLE sc_assetmanagement (
  `id` bigint UNSIGNED auto_increment PRIMARY KEY  NOT NULL comment '自增ID',
  charge_socket_id varchar(80) NOT NULL UNIQUE comment '充电桩编号',
  charger_num smallint(3) DEFAULT 0 comment '',
  name varchar(100) DEFAULT '' comment '充电桩名称',
  manageorg_code varchar(100) DEFAULT '' comment '管理组织编码',
  manageorg_name varchar(255) DEFAULT '' comment '管理组织的名称',
  station_code varchar(100) DEFAULT '' comment '所关联充电站编号',
  station_name varchar(100) DEFAULT '' comment '所关联充电站名称',
  city_code varchar(100) DEFAULT '' comment '城市编码',
  city_name varchar(100) DEFAULT '' comment '城市名称',
  province_code varchar(100) DEFAULT '' comment '省编码',
  province_name varchar(100) DEFAULT '' comment '省份名称',
  gs_code varchar(100) DEFAULT '' comment '高速路编码',
  gs_name varchar(100) DEFAULT '' comment '高速路名称',
  country_code varchar(100) DEFAULT '' comment '国家代码',
  equip_id varchar(100) DEFAULT '' comment '资产编码',
  pile_type smallint(3) DEFAULT 0 comment '充电桩类型',
  stake_status smallint(3) DEFAULT 0 comment '充电桩状态',
  is_hisstore smallint(3) DEFAULT 0 comment '是否全量存储历史',
  master_flag smallint(5) DEFAULT 0 comment '主备状态',
  frequency_id smallint(5) DEFAULT 0 comment '采集频率方案ID',
  operation_no varchar(15) DEFAULT '' comment '运营商',
  master_version smallint(3) DEFAULT 0 comment '主版本号',
  slave_version smallint(3) DEFAULT 0 comment '次版本号',
  branch_version smallint(3) DEFAULT 0 comment '分支版本号',
  vendor_name varchar(255) DEFAULT '' comment '充电桩的生产厂家',
  connect_id smallint(3) DEFAULT 0 comment '充电接口标识',
  district_code varchar(100) DEFAULT '' comment '区域编号',
  uuid varchar(100) DEFAULT '' comment '资产主键',

  `create_time` datetime DEFAULT CURRENT_TIMESTAMP comment '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP comment '修改时间',
  `create_user` varchar(100) DEFAULT '' comment '创建人',
  `update_user` varchar(100) DEFAULT '' comment '修改人',
  `data_sources` varchar(100) DEFAULT '' comment '数据来源',
  `device_access_mode` varchar(100) DEFAULT '' comment '设备接入方式',
  remain varchar(50) DEFAULT '' comment '备用1',
  INDEX `auto_shard_key_charge_socket_id` (`charge_socket_id`) USING BTREE
) comment '资产表' ENGINE=InnoDB DEFAULT CHARSET=utf8 ;


-- 认证数据
CREATE TABLE `sc_authdata` (
  `id` bigint UNSIGNED auto_increment PRIMARY KEY  NOT NULL comment '自增ID',
  `charge_socket_id` varchar(64) DEFAULT '' comment '充电桩编号',
  `connect_id` tinyint(3) DEFAULT 0 comment '接口标识（IN）',
  `time_stamp` bigint(20) DEFAULT 0 comment '参照时间戳定义',
  `snno` int(50) DEFAULT 0 comment '序列号',
  `pile_type` tinyint(3) DEFAULT 0 comment '设备类型',
  `soft_ver` varchar(100) DEFAULT '' comment '软件协议版本号',
  `errcode` tinyint(3) DEFAULT 0 comment '失败原因',
  `ip` varchar(100) DEFAULT '' comment 'IP 地址',
  `hard_ver` varchar(100) DEFAULT '' comment '硬件版本号',
  `date_version` varchar(100) DEFAULT '' comment '接入单元软件日期版本号',
  `hard_finger` varchar(100) DEFAULT '' comment '硬件指纹',
  `esam_id` varchar(100) DEFAULT '' comment 'ESAM序列号',
  `hard_asset_code` varchar(100) DEFAULT '' comment '硬件资产码',
  `auth_code` varchar(64) DEFAULT 0 comment '授权码',
  `model_no` varchar(100) DEFAULT '' comment '计量模型编号',
  `model_id` varchar(100) DEFAULT '' comment '计量模型编号',
  `is_have_model` tinyint(3) DEFAULT 0 comment '充电桩是否有计费模型',
  `succ_fail` tinyint(3) DEFAULT 0 comment '成功与否',
  `result` tinyint(3) DEFAULT 0 comment '成功标识',
  `need_apply_model` tinyint(3) DEFAULT 0 comment '充电桩是否需要申请计费模型',
  `heartbeat` int(50) DEFAULT 0 comment '充电桩应用层心跳报文上传频率',
  `elec_freq` int(50) DEFAULT 0 comment '充电桩实时监测数据频率（充电过程中）',
  `non_elec_freq` int(50) DEFAULT 0 comment '充电桩实时监测数据频率（非充电过程中）',
  `fault_warnings` int(50) DEFAULT 0 comment '故障告警全信息上传频率',
  `network` int(50) DEFAULT 0 comment '网络信息上传频率',
  `non_elecmeter` int(50) DEFAULT 0 comment '非充电表底值上送频率',
  `elec_meter` int(50) DEFAULT 0 comment '充电表底值上送频率',

  `create_time` datetime DEFAULT CURRENT_TIMESTAMP comment '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP comment '修改时间',
  `create_user` varchar(100) DEFAULT '' comment '创建人',
  `update_user` varchar(100) DEFAULT '' comment '修改人',
  `data_sources` varchar(100) DEFAULT '' comment '数据来源',
  `device_access_mode` varchar(100) DEFAULT '' comment '设备接入方式',

  `remain` varchar(100) DEFAULT '' comment '备用',
  INDEX `auto_shard_key_charge_socket_id` (`charge_socket_id`) USING BTREE,
  INDEX `auto_shard_key_time_stamp` (`time_stamp`) USING BTREE
) comment 'A2/A3/A5/A6/A7/A8/A9'ENGINE=InnoDB DEFAULT CHARSET=utf8  ;

-- 时钟对时数据(A10/A11)
CREATE TABLE `sc_same_time` (
  `charge_socket_id` varchar(64) NOT NULL comment '充电桩编号',
  `connect_id` tinyint(3) DEFAULT 0 comment '接口标识（IN）',
  `time_stamp` bigint(20) NOT NULL comment '参照时间戳定义',
  `snno` int(50) DEFAULT 0 comment '序列号',
  `pile_type` tinyint(3) DEFAULT 0 comment '设备类型',

  `opera_sn` int(50) DEFAULT 0 comment '操作流水号',
  `sys_time` bigint(100) DEFAULT 0 comment '车联网平台下发时间',
  `euip_time` bigint(100) DEFAULT 0 comment '设备修改后时间',

  `id` bigint UNSIGNED auto_increment PRIMARY KEY  NOT NULL comment '自增ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP comment '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP comment '修改时间',
  `create_user` varchar(100) DEFAULT '' comment '创建人',
  `update_user` varchar(100) DEFAULT '' comment '修改人',
  `data_sources` varchar(100) DEFAULT '' comment '数据来源',
  `device_access_mode` varchar(100) DEFAULT '' comment '设备接入方式',

  `remain` varchar(100) DEFAULT '' comment '备用',
  
  
  INDEX `auto_shard_key_charge_socket_id` (`charge_socket_id`) USING BTREE,
  INDEX `auto_shard_key_time_stamp` (`time_stamp`) USING BTREE
)comment 'A10/A11' ENGINE=InnoDB DEFAULT CHARSET=utf8  ;


--  交易取随机数数据(A12/A13)
CREATE TABLE `sc_trade_random` (
  `charge_socket_id` varchar(64) NOT NULL comment '充电桩编号',
  `connect_id` tinyint(3) DEFAULT 0 comment '接口标识（IN）',
  `time_stamp` bigint(20) NOT NULL comment '参照时间戳定义',
  `snno` int(50) DEFAULT 0 comment '序列号',
  `pile_type` tinyint(3) DEFAULT 0 comment '设备类型',

  `equip_no` varchar(100) DEFAULT '' comment '终端流水号',
  `esam_radom` varchar(100) DEFAULT '' comment 'ESAM随机数',
  `oper_no` varchar(100) DEFAULT '' comment '流水号',
  `plat_random` varchar(100) DEFAULT '' comment '车联网平台随机数',

  `id` bigint UNSIGNED auto_increment PRIMARY KEY  NOT NULL comment '自增ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP comment '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP comment '修改时间',
  `create_user` varchar(100) DEFAULT '' comment '创建人',
  `update_user` varchar(100) DEFAULT '' comment '修改人',
  `data_sources` varchar(100) DEFAULT '' comment '数据来源',
  `device_access_mode` varchar(100) DEFAULT '' comment '设备接入方式',

  `remain` varchar(100) DEFAULT '' comment '备用',
  
  
  INDEX `auto_shard_key_charge_socket_id` (`charge_socket_id`) USING BTREE,
  INDEX `auto_shard_key_time_stamp` (`time_stamp`) USING BTREE
)comment 'A12/A13' ENGINE=InnoDB DEFAULT CHARSET=utf8  ;



-- 计量模型数据(A14/A15/A16/A17)

CREATE TABLE `sc_billing_model` (
  `charge_socket_id` varchar(64) NOT NULL comment '充电桩编号',
  `connect_id` tinyint(3) DEFAULT 0 comment '接口标识（IN）',
  `time_stamp` bigint(20) NOT NULL comment '参照时间戳定义',
  `snno` int(50) DEFAULT 0 comment '序列号',
  `pile_type` tinyint(3) DEFAULT 0 comment '设备类型',

  `opera_sn` varchar(100) DEFAULT '' comment '操作流水号',
  `s_type` tinyint(3) DEFAULT 0 comment '请求类型',
  `model_id` varchar(100) DEFAULT '' comment '当前计量模型编号',
  `apply_model_id` varchar(100) DEFAULT 0 comment '申请计量模型编号',
  `notarize_resu` tinyint(3) DEFAULT 0 comment '确认结果',
  `succ` tinyint(3) DEFAULT 0 comment '成功标识',
  `fail_reason` tinyint(3) DEFAULT 0 comment '失败原因',
  `time_start` bigint(100) DEFAULT 0 comment '生效时间',
  `time_stop` bigint(100) DEFAULT 0 comment '失效时间',
  `exec_state` tinyint(3) DEFAULT 0 comment '执行状态',
  `messure_type` tinyint(3) DEFAULT 0 comment '计量类型',
  `time_num` int(50) DEFAULT 0 comment '时段数N',
  `time_info` varchar(1000) DEFAULT '' comment '时段信息',

  `id` bigint UNSIGNED auto_increment PRIMARY KEY  NOT NULL comment '自增ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP comment '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP comment '修改时间',
  `create_user` varchar(100) DEFAULT '' comment '创建人',
  `update_user` varchar(100) DEFAULT '' comment '修改人',
  `data_sources` varchar(100) DEFAULT '' comment '数据来源',
  `device_access_mode` varchar(100) DEFAULT '' comment '设备接入方式',


  `remain` varchar(100) DEFAULT '' comment '备用',
  INDEX `auto_shard_key_charge_socket_id` (`charge_socket_id`) USING BTREE,
  INDEX `auto_shard_key_time_stamp` (`time_stamp`) USING BTREE
) comment 'A14/A15/A16/A17'ENGINE=InnoDB DEFAULT CHARSET=utf8  ;



--  充电启动停止数据(A18/A19/A20/A21)
CREATE TABLE `sc_qr_charge` (
  `charge_socket_id` varchar(64) NOT NULL comment '充电桩编号',
  `connect_id` tinyint(3) DEFAULT 0 comment '接口标识（IN）',
  `time_stamp` bigint(20) NOT NULL comment '参照时间戳定义',
  `snno` int(50) DEFAULT 0 comment '序列号',
  `pile_type` tinyint(3) DEFAULT 0 comment '设备类型',

  `swift_no` varchar(100) DEFAULT '' comment '车联网平台交易流 水号',
  `user_no` varchar(100) DEFAULT '' comment '用户编号',
  `charge_mode` tinyint(3) DEFAULT 0 comment '充电模式',
  `limit_data` int(50) DEFAULT 0 comment '限制值',
  `start_type` tinyint(3) DEFAULT 0 comment '启动方式',
  `equip_swift_no` varchar(100) DEFAULT '' comment '终端交易流水号',
  `is_succ` tinyint(3) DEFAULT 0 comment '启动成功标志',
  `result` tinyint(3) DEFAULT 0 comment '启动失败原因',
  `stop_reason` tinyint(3) DEFAULT 0 comment '停机原因',
  `user_id` varchar(100) DEFAULT '' comment '用户编号',
  `succ_fail` tinyint(3) DEFAULT 0 comment '成功标识',

  `id` bigint UNSIGNED auto_increment PRIMARY KEY  NOT NULL comment '自增ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP comment '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP comment '修改时间',
  `create_user` varchar(100) DEFAULT '' comment '创建人',
  `update_user` varchar(100) DEFAULT '' comment '修改人',
  `data_sources` varchar(100) DEFAULT '' comment '数据来源',
  `device_access_mode` varchar(100) DEFAULT '' comment '设备接入方式',

  `remain` varchar(100) DEFAULT '' comment '备用',
  INDEX `auto_shard_key_charge_socket_id` (`charge_socket_id`) USING BTREE,
  INDEX `auto_shard_key_connect_id` (`connect_id`) USING BTREE,
  INDEX `auto_shard_key_time_stamp` (`time_stamp`) USING BTREE
) comment 'A18/A19/A20/A21' ENGINE=InnoDB DEFAULT CHARSET=utf8  ;


--  A22充电交易记录上行数据
CREATE TABLE `sc_charge_trans_list_up` (
  `charge_socket_id` varchar(64) NOT NULL comment '充电桩编号',
  `connect_id` tinyint(3) DEFAULT 0 comment '接口标识（IN）',
  `time_stamp` bigint(20) NOT NULL comment '参照时间戳定义',
  `snno` int(50) DEFAULT 0 comment '序列号',
  `pile_type` tinyint(3) DEFAULT 0 comment '设备类型',

  `user_id` varchar(100) DEFAULT '' comment '用户编号',
  `equip_swift_no` varchar(100) DEFAULT '' comment '终端交易流水号',
  `measure_type` tinyint(3) DEFAULT 0 comment '计量类型',
  `time_div_type` tinyint(3) DEFAULT 0 comment '分时标识',
  `charge_start_time` bigint(100) DEFAULT 0 comment '开始充电时间',
  `charge_end_time` bigint(100) DEFAULT 0 comment '结束充电时间',
  `start_soc` int(50) DEFAULT 0 comment '启动时SOC',
  `end_soc` int(50) DEFAULT 0 comment '停止时SOC',
  `reason` int(50) DEFAULT 0 comment '停止充电原因',
  `meter_address` varchar(100) DEFAULT '' comment '电表地址',
  `model_no` varchar(100) DEFAULT '' comment '计量模型编号',
  `sum_start` decimal(18,3) DEFAULT 0 comment '总起示值',
  `sum_end` decimal(18,3) DEFAULT 0 comment '总止示值',
  `total_elect` decimal(18,3) DEFAULT 0 comment '总电量',
  `sharp_elect` decimal(18,3) DEFAULT 0 comment '尖电量',
  `peak_elect` decimal(18,3) DEFAULT 0 comment '峰电量',
  `flat_elect` decimal(18,3) DEFAULT 0 comment '平电量',
  `valley_elect` decimal(18,3) DEFAULT 0 comment '谷电量',
  `vin_no` varchar(100) DEFAULT '' comment 'VIN码',
  `boot_type` tinyint(3) DEFAULT 0 comment '启动方式',

  `id` bigint UNSIGNED auto_increment PRIMARY KEY  NOT NULL comment '自增ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP comment '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP comment '修改时间',
  `create_user` varchar(100) DEFAULT '' comment '创建人',
  `update_user` varchar(100) DEFAULT '' comment '修改人',
  `data_sources` varchar(100) DEFAULT '' comment '数据来源',
  `device_access_mode` varchar(100) DEFAULT '' comment '设备接入方式',

  `remain` varchar(100) DEFAULT '' comment '备用',
  INDEX `auto_shard_key_charge_socket_id` (`charge_socket_id`) USING BTREE,
  INDEX `auto_shard_key_connect_id` (`connect_id`) USING BTREE,
  INDEX `auto_shard_key_time_stamp` (`time_stamp`) USING BTREE
) comment 'A22' ENGINE=InnoDB DEFAULT CHARSET=utf8  ;


--  A23充电交易记录下行数据
CREATE TABLE `sc_charge_trans_list_down` (
  `charge_socket_id` varchar(64) NOT NULL comment '充电桩编号',
  `connect_id` tinyint(3) DEFAULT 0 comment '接口标识（IN）',
  `time_stamp` bigint(20) NOT NULL comment '参照时间戳定义',
  `snno` int(50) DEFAULT 0 comment '序列号',
  `pile_type` tinyint(3) DEFAULT 0 comment '设备类型',

  `user_id` varchar(100) DEFAULT '' comment '用户编号',
  `equip_swift_no` varchar(100) DEFAULT '' comment '终端交易流水号',
  `charge_fee` decimal(18,3) DEFAULT 0 comment '扣款金额',
  `result` tinyint(3) DEFAULT 0 comment '是否成功',
  `errcode` tinyint(3) DEFAULT 0 comment '失败原因',

  `id` bigint UNSIGNED auto_increment PRIMARY KEY  NOT NULL comment '自增ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP comment '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP comment '修改时间',
  `create_user` varchar(100) DEFAULT '' comment '创建人',
  `update_user` varchar(100) DEFAULT '' comment '修改人',
  `data_sources` varchar(100) DEFAULT '' comment '数据来源',
  `device_access_mode` varchar(100) DEFAULT '' comment '设备接入方式',

  `remain` varchar(100) DEFAULT '' comment '备用',
  INDEX `auto_shard_key_charge_socket_id` (`charge_socket_id`) USING BTREE,
  INDEX `auto_shard_key_connect_id` (`connect_id`) USING BTREE,
  INDEX `auto_shard_key_time_stamp` (`time_stamp`) USING BTREE
)comment 'A23' ENGINE=InnoDB DEFAULT CHARSET=utf8  ;


--  软件升级数据(A24/A25/A26)
CREATE TABLE `sc_soft_up_grade` (
  `charge_socket_id` varchar(64) NOT NULL comment '充电桩编号',
  `connect_id` tinyint(3) DEFAULT 0 comment '接口标识（IN）',
  `time_stamp` bigint(20) NOT NULL comment '参照时间戳定义',
  `snno` int(50) DEFAULT 0 comment '序列号',
  `pile_type` tinyint(3) DEFAULT 0 comment '设备类型',

  `opera_sn` varchar(100) DEFAULT '' comment '操作流水号',
  `sf_ver` varchar(100) DEFAULT '' comment '软件版本号',
  `sf_date_ver` varchar(100) DEFAULT '' comment '软件日期版本号',
  `md5check` varchar(100) DEFAULT '' comment 'MD5校验码',
  `protocol` tinyint(3) DEFAULT 0 comment '下载协议类型',
  `ip1` varchar(100) DEFAULT '' comment 'IP地址及端口',
  `file_name` varchar(100) DEFAULT '' comment '文件名',
  `user_name` varchar(100) DEFAULT '' comment '登录用户名',
  `pass_word` varchar(100) DEFAULT '' comment '登录密码',
  `confirm` tinyint(3) DEFAULT 0 comment '确认信息',

  `id` bigint UNSIGNED auto_increment PRIMARY KEY  NOT NULL comment '自增ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP comment '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP comment '修改时间',
  `create_user` varchar(100) DEFAULT '' comment '创建人',
  `update_user` varchar(100) DEFAULT '' comment '修改人',
  `data_sources` varchar(100) DEFAULT '' comment '数据来源',
  `device_access_mode` varchar(100) DEFAULT '' comment '设备接入方式',

  `remain` varchar(100) DEFAULT '' comment '备用',
  
  
  INDEX `auto_shard_key_charge_socket_id` (`charge_socket_id`) USING BTREE,
  INDEX `auto_shard_key_time_stamp` (`time_stamp`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8  ;



--  充电桩维护指令、交易记录召测、文件召测指令、电表底值召测指令(A27/A28/A31/A32/A33/A34/A35)
CREATE TABLE `sc_maintenance` (
  `charge_socket_id` varchar(64) NOT NULL comment '充电桩编号',
  `connect_id` tinyint(3) DEFAULT 0 comment '接口标识（IN）',
  `time_stamp` bigint(20) NOT NULL comment '参照时间戳定义',
  `snno` int(50) DEFAULT 0 comment '序列号',
  `pile_type` tinyint(3) DEFAULT 0 comment '设备类型',

  `opera_sn` varchar(100) DEFAULT '' comment '操作流水号',
  `control_type` tinyint(3) DEFAULT 0 comment '控制类型',
  `control_state` tinyint(3) DEFAULT 0 comment '控制状态',
  `fail_reason` tinyint(3) DEFAULT 0 comment '失败原因',
  `call_mode` tinyint(3) DEFAULT 0 comment '召测方式',
  `filename` varchar(100) DEFAULT '' comment '文件名',
  `call_file_type` tinyint(3) DEFAULT 0 comment '召测文件类型',
  `trans_mode` tinyint(3) DEFAULT 0 comment '文件传输方式',
  `ip1` varchar(100) DEFAULT '' comment 'IP地址及端口',
  `file_name` varchar(100) DEFAULT '' comment '文件名',
  `user_name` varchar(100) DEFAULT '' comment '登录用户名',
  `pass_word` varchar(100) DEFAULT '' comment '登录密码',
  `confirm` tinyint(3) DEFAULT 0 comment '文件名',
  `control` tinyint(3) DEFAULT 0 comment '控制字节',
  `monitor_time` varchar(100) DEFAULT '' comment '采集时间点',
  `call_date` varchar(100) DEFAULT '' comment '召测日期',
  `call_type` tinyint(3) DEFAULT 0 comment '召测类型',
  `charge_no` int(50) DEFAULT 0 comment '充电序号',
  `find_result` int(50) DEFAULT 0 comment '查询结果',

  `id` bigint UNSIGNED auto_increment PRIMARY KEY  NOT NULL comment '自增ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP comment '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP comment '修改时间',
  `create_user` varchar(100) DEFAULT '' comment '创建人',
  `update_user` varchar(100) DEFAULT '' comment '修改人',
  `data_sources` varchar(100) DEFAULT '' comment '数据来源',
  `device_access_mode` varchar(100) DEFAULT '' comment '设备接入方式',


  `remain` varchar(100) DEFAULT '' comment '备用',
  
  
  INDEX `auto_shard_key_charge_socket_id` (`charge_socket_id`) USING BTREE,
  INDEX `auto_shard_key_time_stamp` (`time_stamp`) USING BTREE
)comment 'A27/A28/A31/A32/A33/A34/A35'ENGINE=InnoDB DEFAULT CHARSET=utf8  ;


--  功率调节数据、监测数据频率设置数据(A29/A30/A36/A37)
CREATE TABLE `sc_power_control` (
  `charge_socket_id` varchar(64) NOT NULL comment '充电桩编号',
  `connect_id` tinyint(3) DEFAULT 0 comment '接口标识（IN）',
  `time_stamp` bigint(20) NOT NULL comment '参照时间戳定义',
  `snno` int(50) DEFAULT 0 comment '序列号',
  `pile_type` tinyint(3) DEFAULT 0 comment '设备类型',

  `opera_sn` varchar(100) DEFAULT '' comment '操作流水号',
  `pw_mode` tinyint(3) DEFAULT 0 comment '功率调节方式',
  `pw_type` tinyint(3) DEFAULT 0 comment '功率调节指令类型',
  `pw_control` decimal(18,2) DEFAULT 0 comment '功率控制',
  `result` tinyint(3) DEFAULT 0 comment '控制执行结果',
  `parameters` decimal(18,2) DEFAULT 0 comment '调节后功率',
  `heartbeat` int(50) DEFAULT 0 comment '充电桩应用层心报文上传频率',
  `elec_freq` int(50) DEFAULT 0 comment '充电桩实时监测数据频率（充电过程中）',
  `non_elec_freq` int(50) DEFAULT 0 comment '充电桩实时监测数据频率（非充电过程中）',
  `fault_warnings` int(50) DEFAULT 0 comment '故障告警全信息上传频率',
  `network` int(50) DEFAULT 0 comment '网络信息上传频率',
  `non_elecmeter` int(50) DEFAULT 0 comment '非充电中表底值上送频率',
  `elec_meter` int(50) DEFAULT 0 comment '充电中表底值上送频率',
  `succ` tinyint(3) DEFAULT 0 comment '设置结果',
  `fail_reason` tinyint(3) DEFAULT 0 comment '失败原因',

  `id` bigint UNSIGNED auto_increment PRIMARY KEY  NOT NULL comment '自增ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP comment '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP comment '修改时间',
  `create_user` varchar(100) DEFAULT '' comment '创建人',
  `update_user` varchar(100) DEFAULT '' comment '修改人',
  `data_sources` varchar(100) DEFAULT '' comment '数据来源',
  `device_access_mode` varchar(100) DEFAULT '' comment '设备接入方式',

  `remain` varchar(100) DEFAULT '' comment '备用',
  
  
  INDEX `auto_shard_key_charge_socket_id` (`charge_socket_id`) USING BTREE,
  INDEX `auto_shard_key_time_stamp` (`time_stamp`) USING BTREE
) comment 'A29/A30/A36/A37'ENGINE=InnoDB DEFAULT CHARSET=utf8  ;



--  A38充电桩充电过程实时监测数据
CREATE TABLE `sc_a_charging_pile_monitor` (
  `charge_socket_id` varchar(64) NOT NULL comment '充电桩编号',
  `connect_id` tinyint(3) DEFAULT 0 comment '接口标识（IN）',
  `time_stamp` bigint(20) NOT NULL comment '参照时间戳定义',
  `snno` int(50) DEFAULT 0 comment '序列号',
  `pile_type` tinyint(3) DEFAULT 0 comment '设备类型',

  `equip_work_status` tinyint(3) DEFAULT 0 comment '设备工作状态',
  `equip_run_status` tinyint(3) DEFAULT 0 comment '设备运行状态',
  `switch_status` tinyint(3) DEFAULT 0 comment '连接确认开关状态',
  `relay_status` tinyint(3) DEFAULT 0 comment ' 输出继电器状态',
  `ele_lock_status` tinyint(3) DEFAULT 0 comment '充电接口电子锁状态',
  `link_cc_status` tinyint(3) DEFAULT 0 comment '充电连接状态CC',
  `link_cp_status` tinyint(3) DEFAULT 0 comment '充电控制状态CP',
  `lock_status` tinyint(3) DEFAULT 0 comment '地锁状态',
  `voltage_a` decimal(18,2) DEFAULT 0 comment '充电输出A相电压',
  `current_a` decimal(18,2) DEFAULT 0 comment '充电输出A相电流',
  `voltage_b` decimal(18,2) DEFAULT 0 comment '充电输出B相电压',
  `current_b` decimal(18,2) DEFAULT 0 comment '充电输出B相电流',
  `voltage_c` decimal(18,2) DEFAULT 0 comment '充电输出C相电压',
  `current_c` decimal(18,2) DEFAULT 0 comment '充电输出C相电流',
  `vguide` decimal(18,2) DEFAULT 0 comment '充电导引电压',
  `pwm_duty` decimal(18,2) DEFAULT 0 comment '输出PWM占空比',
  `chg_type` tinyint(3) DEFAULT 0 comment '充电类型',
  `order_sn` varchar(100) DEFAULT '' comment '设备交易流水号',
  `chg_time` int(50) DEFAULT 0 comment '累计充电时间',
  `connector_temp1` decimal(18,2) DEFAULT 0 comment '充电接口温度1',
  `connector_temp2` decimal(18,2) DEFAULT 0 comment '充电接口温度2',
  `connector_temp3` decimal(18,2) DEFAULT 0 comment '充电接口温度3',
  `connector_temp4` decimal(18,2) DEFAULT 0 comment '充电接口温度4',
  `total_elect` decimal(18,3) DEFAULT 0 comment '总电量',
  `sharp_elect` decimal(18,3) DEFAULT 0 comment '尖电量',
  `peak_elect` decimal(18,3) DEFAULT 0 comment '峰电量',
  `flat_elect` decimal(18,3) DEFAULT 0 comment '平电量',
  `valley_elect` decimal(18,3) DEFAULT 0 comment '谷电量',
  `model_id` varchar(100) DEFAULT '' comment '计量模型编号',
  `req_power` decimal(18,2) DEFAULT 0 comment '充电需求功率',
  `real_power` decimal(18,2) DEFAULT 0 comment '充电实际功率',
  `bat_con_status` tinyint(3) DEFAULT 0 comment '是否连接电池',
  `lock_bat` decimal(18,2) DEFAULT 0 comment '地锁电量状态',
  `sc_a_charging_pile_monitor.order` tinyint(3) DEFAULT 0 comment '充电预约状态',

  `id` bigint UNSIGNED auto_increment PRIMARY KEY  NOT NULL comment '自增ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP comment '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP comment '修改时间',
  `create_user` varchar(100) DEFAULT '' comment '创建人',
  `update_user` varchar(100) DEFAULT '' comment '修改人',
  `data_sources` varchar(100) DEFAULT '' comment '数据来源',
  `device_access_mode` varchar(100) DEFAULT '' comment '设备接入方式',

  `remain` varchar(100) DEFAULT '' comment '备用',
  
  
  INDEX `auto_shard_key_charge_socket_id` (`charge_socket_id`) USING BTREE,
  INDEX `auto_shard_key_connect_id` (`connect_id`) USING BTREE,
  INDEX `auto_shard_key_time_stamp` (`time_stamp`) USING BTREE
)comment 'A38'ENGINE=InnoDB DEFAULT CHARSET=utf8  ;



--  A39充电桩非充电过程实时监测数据
CREATE TABLE `sc_a_charging_pile_un_monitor` (
  `charge_socket_id` varchar(64) NOT NULL comment '充电桩编号',
  `connect_id` tinyint(3) DEFAULT 0 comment '接口标识（IN）',
  `time_stamp` bigint(20) NOT NULL comment '参照时间戳定义',
  `snno` int(50) DEFAULT 0 comment '序列号',
  `pile_type` tinyint(3) DEFAULT 0 comment '设备类型',

  `equip_work_status` tinyint(3) DEFAULT 0 comment '设备工作状态',
  `equip_run_status` tinyint(3) DEFAULT 0 comment '设备运行状态',
  `switch_status` tinyint(3) DEFAULT 0 comment '连接确认开关状态',
  `relay_status` tinyint(3) DEFAULT 0 comment '输出继电器状态',
  `ele_lock_status` tinyint(3) DEFAULT 0 comment '充电接口电子锁状态',
  `link_cc_status` tinyint(3) DEFAULT 0 comment '充电连接状态CC',
  `link_cp_status` tinyint(3) DEFAULT 0 comment '充电控制状态CP',
  `lock_status` tinyint(3) DEFAULT 0 comment '地锁状态',
  `voltage_a` decimal(18,2) DEFAULT 0 comment '充电输出相电压',
  `current_a` decimal(18,2) DEFAULT 0 comment '充电输出相电流',
  `voltage_b` decimal(18,2) DEFAULT 0 comment '充电输出相电压',
  `current_b` decimal(18,2) DEFAULT 0 comment '充电输出相电流',
  `voltage_c` decimal(18,2) DEFAULT 0 comment '充电输出相电压',
  `current_c` decimal(18,2) DEFAULT 0 comment '充电输出相电流',
  `vguide` decimal(18,2) DEFAULT 0 comment '充电导引电压',
  `model_id` varchar(100) DEFAULT '' comment '计量模型编号',
  `bat_con_status` tinyint(3) DEFAULT 0 comment '是否连接电池',
  `lock_bat` decimal(18,2) DEFAULT 0 comment '地锁电量状态',
  `sc_a_charging_pile_un_monitor.order` tinyint(3) DEFAULT 0 comment '充电预约状态',

  `id` bigint UNSIGNED auto_increment PRIMARY KEY  NOT NULL comment '自增ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP comment '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP comment '修改时间',
  `create_user` varchar(100) DEFAULT '' comment '创建人',
  `update_user` varchar(100) DEFAULT '' comment '修改人',
  `data_sources` varchar(100) DEFAULT '' comment '数据来源',
  `device_access_mode` varchar(100) DEFAULT '' comment '设备接入方式',

  `remain` varchar(100) DEFAULT '' comment '备用',
  
  
  INDEX `auto_shard_key_charge_socket_id` (`charge_socket_id`) USING BTREE,
  INDEX `auto_shard_key_connect_id` (`connect_id`) USING BTREE,
  INDEX `auto_shard_key_time_stamp` (`time_stamp`) USING BTREE
)comment 'A39'ENGINE=InnoDB DEFAULT CHARSET=utf8  ;



--  A40表底值监测数据
CREATE TABLE `sc_table_bottom_value` (
  `charge_socket_id` varchar(64) NOT NULL comment '充电桩编号',
  `connect_id` tinyint(3) DEFAULT 0 comment '接口标识（IN）',
  `time_stamp` bigint(20) NOT NULL comment '参照时间戳定义',
  `snno` int(50) DEFAULT 0 comment '序列号',
  `pile_type` tinyint(3) DEFAULT 0 comment '设备类型',

  `acq_time` varchar(100) DEFAULT '' comment '采集时间',
  `acq_type` tinyint(3) DEFAULT 0 comment '采集方式',
  `mail_addr` varchar(100) DEFAULT '' comment '通信地址',
  `surface_code` varchar(100) DEFAULT '' comment '表号',
  `ammeter_code` varchar(100) DEFAULT '' comment '电表资产编码',
  `sum_meter` decimal(18,3) DEFAULT 0 comment '电表底值/电量-总',
  `sharp_meter` decimal(18,3) DEFAULT 0 comment '电表底值/电量-尖',
  `peak_meter` decimal(18,3) DEFAULT 0 comment '电表底值/电量-峰',
  `flat_meter` decimal(18,3) DEFAULT 0 comment '电表底值/电量-平',
  `valley_meter` decimal(18,3) DEFAULT 0 comment '电表底值/电量-谷',
  `ammeter_ratio` decimal(18,2) DEFAULT 0 comment '电度表变比',
  `last_chg_sn` varchar(100) DEFAULT '' comment '最后交易流水',
  `charged_quantity` decimal(18,3) DEFAULT 0 comment '充电中订单的已充电量',

  `id` bigint UNSIGNED auto_increment PRIMARY KEY  NOT NULL comment '自增ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP comment '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP comment '修改时间',
  `create_user` varchar(100) DEFAULT '' comment '创建人',
  `update_user` varchar(100) DEFAULT '' comment '修改人',
  `data_sources` varchar(100) DEFAULT '' comment '数据来源',
  `device_access_mode` varchar(100) DEFAULT '' comment '设备接入方式',

  `remain` varchar(100) DEFAULT '' comment '备用',
  
  
  INDEX `auto_shard_key_charge_socket_id` (`charge_socket_id`) USING BTREE,
  INDEX `auto_shard_key_connect_id` (`connect_id`) USING BTREE,
  INDEX `auto_shard_key_time_stamp` (`time_stamp`) USING BTREE
)comment 'A40' ENGINE=InnoDB DEFAULT CHARSET=utf8  ;



--  A41网络信息监测数据
CREATE TABLE `sc_network_information` (
  `charge_socket_id` varchar(64) NOT NULL comment '充电桩编号',
  `connect_id` tinyint(3) DEFAULT 0 comment '接口标识（IN）',
  `time_stamp` bigint(20) NOT NULL comment '参照时间戳定义',
  `snno` int(50) DEFAULT 0 comment '序列号',
  `pile_type` tinyint(3) DEFAULT 0 comment '设备类型',

  `net_type` tinyint(3) DEFAULT 0 comment '网络类型',
  `net_stage` int(50) DEFAULT 0 comment '网络信号等级',
  `net_ld` tinyint(3) DEFAULT 0 comment '网络运营商',
  `sim_card` varchar(100) DEFAULT '' comment 'SIM卡号',
  `model_cor` tinyint(3) DEFAULT 0 comment '通讯模块厂家',
  `imei` varchar(100) DEFAULT '' comment '通讯模块IMEI编码',
  `mac` varchar(100) DEFAULT '' comment 'MAC地址',
  `Sim_mount` int(50) DEFAULT 0 comment 'SIM卡数量',
  `sim_1` varchar(100) DEFAULT '' comment 'SIM卡号1',
  `sim_n` varchar(100) DEFAULT '' comment 'SIM卡号N',

  `id` bigint UNSIGNED auto_increment PRIMARY KEY  NOT NULL comment '自增ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP comment '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP comment '修改时间',
  `create_user` varchar(100) DEFAULT '' comment '创建人',
  `update_user` varchar(100) DEFAULT '' comment '修改人',
  `data_sources` varchar(100) DEFAULT '' comment '数据来源',
  `device_access_mode` varchar(100) DEFAULT '' comment '设备接入方式',

  `remain` varchar(100) DEFAULT '' comment '备用',
  
  
  INDEX `auto_shard_key_charge_socket_id` (`charge_socket_id`) USING BTREE,
  INDEX `auto_shard_key_time_stamp` (`time_stamp`) USING BTREE
)comment 'A41'ENGINE=InnoDB DEFAULT CHARSET=utf8  ;



--  A42充电桩故障、告警全量数据
CREATE TABLE `sc_fault_and_alarm_data` (
  `charge_socket_id` varchar(64) NOT NULL comment '充电桩编号',
  `connect_id` tinyint(3) DEFAULT 0 comment '接口标识（IN）',
  `time_stamp` bigint(20) NOT NULL comment '参照时间戳定义',
  `snno` int(50) DEFAULT 0 comment '序列号',
  `pile_type` tinyint(3) DEFAULT 0 comment '设备类型',

  `fault_warn_sum` int(50) DEFAULT 0 comment '故障告警点总数',
  `fault_sum` int(50) DEFAULT 0 comment '故障总',
  `warn_sum` varchar(100) DEFAULT '' comment '告警总',
  `fault_warn_value` int(50) DEFAULT 0 comment '故障告警点数据',

  `id` bigint UNSIGNED auto_increment PRIMARY KEY  NOT NULL comment '自增ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP comment '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP comment '修改时间',
  `create_user` varchar(100) DEFAULT '' comment '创建人',
  `update_user` varchar(100) DEFAULT '' comment '修改人',
  `data_sources` varchar(100) DEFAULT '' comment '数据来源',
  `device_access_mode` varchar(100) DEFAULT '' comment '设备接入方式',

  `remain` varchar(100) DEFAULT '' comment '备用',
  
  
 INDEX `auto_shard_key_charge_socket_id` (`charge_socket_id`) USING BTREE,
  INDEX `auto_shard_key_time_stamp` (`time_stamp`) USING BTREE
)comment 'A42' ENGINE=InnoDB DEFAULT CHARSET=utf8  ;



--  A43充电桩点单遥信遥测数据(A43/A44)
CREATE TABLE `sc_single_remote` (
  `charge_socket_id` varchar(64) NOT NULL comment '充电桩编号',
  `connect_id` tinyint(3) DEFAULT 0 comment '接口标识（IN）',
  `time_stamp` bigint(20) NOT NULL comment '参照时间戳定义',
  `snno` int(50) DEFAULT 0 comment '序列号',
  `pile_type` tinyint(3) DEFAULT 0 comment '设备类型',

  `yx_point_sum` int(50) DEFAULT 0 comment '变化遥信点总数',
  `yx_occur_time` bigint(100) DEFAULT 0 comment '发生时刻',
  `yx_value` varchar(100) DEFAULT '' comment '变化遥信点数据',
  `yc_point_sum` int(50) DEFAULT 0 comment '变化遥测点总数',
  `yc_occur_time` bigint(100) DEFAULT 0 comment '发生时刻',
  `yc_value` varchar(100) DEFAULT '' comment '变化遥测点数据',

  `id` bigint UNSIGNED auto_increment PRIMARY KEY  NOT NULL comment '自增ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP comment '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP comment '修改时间',
  `create_user` varchar(100) DEFAULT '' comment '创建人',
  `update_user` varchar(100) DEFAULT '' comment '修改人',
  `data_sources` varchar(100) DEFAULT '' comment '数据来源',
  `device_access_mode` varchar(100) DEFAULT '' comment '设备接入方式',

  `remain` varchar(100) DEFAULT '' comment '备用',
  
  
 INDEX `auto_shard_key_charge_socket_id` (`charge_socket_id`) USING BTREE,
  INDEX `auto_shard_key_time_stamp` (`time_stamp`) USING BTREE
) comment 'A43/A44' ENGINE=InnoDB DEFAULT CHARSET=utf8  ;


--  新ESAM会话密钥协商数据、设置ESAM数据数据、
--  终端证书更新数据、新 ESAM 密钥更新文件传输数据(A45/A46/A47/A48/A49/A50/A51/A52/A53/A54/A55/A56)
CREATE TABLE `sc_esam_data` (
  `charge_socket_id` varchar(64) NOT NULL comment '充电桩编号',
  `connect_id` tinyint(3) DEFAULT 0 comment '接口标识（IN）',
  `time_stamp` bigint(20) NOT NULL comment '参照时间戳定义',
  `snno` int(50) DEFAULT 0 comment '序列号',
  `pile_type` tinyint(3) DEFAULT 0 comment '设备类型',

  `esam_id` varchar(100) DEFAULT '' comment 'ESAM序列号',
  `esam_count` int(50) DEFAULT 0 comment 'ESAM当前计数器',
  `symmetric_key_ver` varchar(200) DEFAULT '' comment '对称密钥版本',
  `author_data` varchar(100) DEFAULT '' comment '身份认证数据',
  `author_signature` varchar(100) DEFAULT '' comment '身份认证签名',
  `additional_infor` tinyint(3) DEFAULT 0 comment '附加信息',
  `esam_author_data` varchar(100) DEFAULT '' comment 'ESAM认证数据',
  `esam_signature` varchar(100) DEFAULT '' comment 'ESAM签名信息',
  `certificate_len` int(10) DEFAULT 0 comment '终端证书长度',
  `certificate` varchar(3000) DEFAULT '' comment '终端证书',
  `parameter_type` tinyint(3) DEFAULT 0 comment '参数类型',
  `set_data_len` int(50) DEFAULT 0 comment '设置数据长度',
  `set_data` varchar(100) DEFAULT '' comment '设置数据',
  `is_succ` tinyint(3) DEFAULT 0 comment '成功标识',
  `failure_reason` tinyint(3) DEFAULT 0 comment '失败原因',
  `cipher_type` varchar(100) DEFAULT '' comment '密钥版本号',
  `cipther_len` int(50) DEFAULT 0 comment '预埋密钥数据长度',
  `cipher_data` varchar(100) DEFAULT '' comment '预埋密钥数据',
  `cipher_result` tinyint(3) DEFAULT 0 comment '密钥更新结果',
  `public_key_source` tinyint(3) DEFAULT 0 comment '公钥来源',
  `public_key_data` varchar(1000) DEFAULT '' comment '公钥数据',
  `oper_no` varchar(100) DEFAULT '' comment '操作流水号',
  `terminal_certi_type` varchar(100) DEFAULT '' comment '终端证书版本号',
  `certi_type` tinyint(3) DEFAULT 0 comment '证书类型',
  `terminal_certi_len` int(50) DEFAULT 0 comment '终端证书长度',
  `certi_data` varchar(100) DEFAULT '' comment '终端证书',
  `update_result` tinyint(3) DEFAULT 0 comment '终端证书更新结果',


  `id` bigint UNSIGNED auto_increment PRIMARY KEY  NOT NULL comment '自增ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP comment '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP comment '修改时间',
  `create_user` varchar(100) DEFAULT '' comment '创建人',
  `update_user` varchar(100) DEFAULT '' comment '修改人',
  `data_sources` varchar(100) DEFAULT '' comment '数据来源',
  `device_access_mode` varchar(100) DEFAULT '' comment '设备接入方式',

  `remain` varchar(100) DEFAULT '' comment '备用',
  
  
  INDEX `auto_shard_key_charge_socket_id` (`charge_socket_id`) USING BTREE,
  INDEX `auto_shard_key_time_stamp` (`time_stamp`) USING BTREE
) comment 'A45/A46/A47/A48/A49/A50/A51/A52/A53/A54/A55/A56' ENGINE=InnoDB DEFAULT CHARSET=utf8  ;

--  固件信息数据(A57/A58)
CREATE TABLE `sc_firmware` (
  `charge_socket_id` varchar(64) NOT NULL comment '充电桩编号',
  `connect_id` tinyint(3) DEFAULT 0 comment '接口标识（IN）',
  `time_stamp` bigint(20) NOT NULL comment '参照时间戳定义',
  `snno` int(50) DEFAULT 0 comment '序列号',
  `pile_type` tinyint(3) DEFAULT 0 comment '设备类型',

  `esam_id` varchar(32) DEFAULT '' comment 'ESAM 序列号',
  `dfu_id` varchar(50) default '' comment '固件桩编号',
  `stake_no` varchar(100) DEFAULT '' comment '充电桩型号',
  `manufacturers` varchar(50) DEFAULT '' comment '生产厂家',
  `vendor_code` varchar(100) DEFAULT '' comment ' 资产厂商编码',
  `hard_finger` varchar(100) DEFAULT '' comment '硬件指纹',
  `soft_ver` varchar(100) DEFAULT '' comment '软件版本号',
  `hard_ver` varchar(100) DEFAULT '' comment '硬件版本号',
  `cbc` int(50) DEFAULT 0 comment ' 软件CRC32校验和',
  `soft_date_ver` varchar(100) DEFAULT '' comment '软件日期版本号',
  `connet_num` int(50) DEFAULT 0 comment '接口数量',
  `mac` varchar(100) DEFAULT '' comment '网卡MAC地址',
  `longitude` decimal(18,6) DEFAULT 0 comment '经度',
  `latitude` decimal(18,6) DEFAULT 0 comment '纬度',
  `height` decimal(18,2) DEFAULT 0 comment '高度',
  `grid_type` tinyint(3) DEFAULT 0 comment '坐标类型',
  `sign_type` tinyint(3) DEFAULT 0 comment '注册情况',
  `is_succ` tinyint(3) DEFAULT 0 comment '是否成功',
  `fail_reason` tinyint(3) DEFAULT 0 comment '失败原因',

  `id` bigint UNSIGNED auto_increment PRIMARY KEY  NOT NULL comment '自增ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP comment '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP comment '修改时间',
  `create_user` varchar(100) DEFAULT '' comment '创建人',
  `update_user` varchar(100) DEFAULT '' comment '修改人',
  `data_sources` varchar(100) DEFAULT '' comment '数据来源',
  `device_access_mode` varchar(100) DEFAULT '' comment '设备接入方式',

  `remain` varchar(100) DEFAULT '' comment '备用',
  
  
  INDEX `auto_shard_key_dfu_id` (`dfu_id`) USING BTREE,
  INDEX `auto_shard_key_time_stamp` (`time_stamp`) USING BTREE
)comment 'A57/A58'ENGINE=InnoDB DEFAULT CHARSET=utf8 ;


--  VIN 码模式即插即充启动鉴权数据(A59/A60/A61)
CREATE TABLE `sc_vin_startert` (
  `charge_socket_id` varchar(64) NOT NULL comment '充电桩编号',
  `connect_id` tinyint(3) DEFAULT 0 comment '接口标识（IN）',
  `time_stamp` bigint(20) NOT NULL comment '参照时间戳定义',
  `snno` int(50) DEFAULT 0 comment '序列号',
  `pile_type` tinyint(3) DEFAULT 0 comment '设备类型',

  `equip_swift_no` varchar(100) DEFAULT '' comment '终端交易流水号',
  `vin_code` varchar(100) DEFAULT '' comment 'VIN码',
  `battery_soc` int(50) DEFAULT 0 comment '电池SOC',
  `charge_times` int(50) DEFAULT 0 comment '已充电次数',
  `longitude` decimal(18,6) DEFAULT 0 comment '车辆位置经度',
  `latitude` decimal(18,6) DEFAULT 0 comment '车辆位置纬度',
  `csys_type` tinyint(3) DEFAULT 0 comment '车辆坐标类型',

  `swift_no` varchar(100) DEFAULT '' comment '平台交易流水号',
  `stop_code` varchar(100) DEFAULT '' comment '停机码',
  `charge_mode` tinyint(3) DEFAULT 0 comment '充电限额模式',
  `limit_data` decimal(18,3) DEFAULT 0 comment '充电限额值',
  `start_type` tinyint(3) DEFAULT 0 comment '启动方式',

  `user_no` varchar(100) DEFAULT '' comment '账户编号',
  `is_succ` tinyint(3) DEFAULT 0 comment '启动成功标识',
  `fail_reason` tinyint(3) DEFAULT 0 comment '启动失败原因',


  `id` bigint UNSIGNED auto_increment PRIMARY KEY  NOT NULL comment '自增ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP comment '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP comment '修改时间',
  `create_user` varchar(100) DEFAULT '' comment '创建人',
  `update_user` varchar(100) DEFAULT '' comment '修改人',
  `data_sources` varchar(100) DEFAULT '' comment '数据来源',
  `device_access_mode` varchar(100) DEFAULT '' comment '设备接入方式',

  `remain` varchar(100) DEFAULT '' comment '备用',
  
  
  INDEX `auto_shard_key_charge_socket_id` (`charge_socket_id`) USING BTREE,
  INDEX `auto_shard_key_time_stamp` (`time_stamp`) USING BTREE
) comment 'A59/A60/A61' ENGINE=InnoDB DEFAULT CHARSET=utf8  ;

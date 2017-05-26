
alter table WX_Member add COLUMN isPwd TINYINT DEFAULT 0 COMMENT '是否需要密码';
alter table TA_OrderMx add COLUMN isOk TINYINT DEFAULT 0 COMMENT '0:没问题   1: 有问题';

create table TA_OrderMxChangeLog(
  id int not null,
  storeId varchar(100),
  orderId varchar(100) COMMENT '外卖订单号',
  errName varchar(100),
  errPrice DOUBLE DEFAULT 0,
  errUnit varchar(100),
  sucName varchar(100),
  sucPrice DOUBLE DEFAULT 0,
  sucUnit varchar(100),
  sucMenuId varchar(100),
  createTime DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外卖订单明细修改日志';


create table WX_QRCodeDowLog(
  id int not null,
  storeId varchar(100),
  payAmount int,
  remark varchar(500),
  createTime DATETIME,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='固定金额二维码下载记录';

alter table WX_MemberConsume add COLUMN orderId varchar(100);

------------------------------已升级   03.29

create table SE_CashApplyErrorLog(
	id int not null,
	storeId varchar(100),
	orderId varchar(100),
	payAmount DOUBLE DEFAULT 0,
	createPeople varchar(100),
	createTime DATETIME,
	PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='提现错误日志记录';

alter table SE_CashApplyErrorLog add remark varchar(500);

------------------------------已升级   04.11

alter table wx_PayOrderInfo add COLUMN realPayAmount int DEFAULT 0 COMMENT '实际支付金额';

ALTER table SE_CashApplyErrorLog add COLUMN errorType int DEFAULT 0;

------------------------------已升级   04.12

ALTER TABLE SM_InterfaceLog MODIFY className varchar(200);
ALTER TABLE SM_InterfaceLog MODIFY methodName varchar(200);

ALTER TABLE WX_Member ADD COLUMN unionId varchar(100) COMMENT '微信平台唯一凭证';


ALTER TABLE WX_MemberConsume MODIFY COLUMN serialNO INT AUTO_INCREMENT;
ALTER TABLE WX_Member MODIFY COLUMN memberId INT AUTO_INCREMENT;
ALTER TABLE WX_Member add COLUMN memberCardId INTEGER DEFAULT 0;

alter table wx_PayOrderInfo add COLUMN formId varchar(500) COMMENT '微信模版id';

ALTER TABLE wx_PayOrderInfo ADD COLUMN favAmount INT DEFAULT 0 COMMENT '优惠后的金额';

ALTER TABLE mn_MenuType MODIFY DiscRate DOUBLE DEFAULT 0;
ALTER TABLE mn_Menu MODIFY HighAmount DOUBLE DEFAULT 0;
ALTER TABLE mn_Menu MODIFY LowAmount DOUBLE DEFAULT 0;
ALTER TABLE mn_Menu MODIFY CostPrice DOUBLE DEFAULT 0;
ALTER TABLE mn_Menu MODIFY MenuPrice4 DOUBLE DEFAULT 0;
ALTER TABLE mn_Menu MODIFY MenuPrice3 DOUBLE DEFAULT 0;
ALTER TABLE mn_Menu MODIFY MenuPrice2 DOUBLE DEFAULT 0;

update mn_Menu set HighAmount=0 where HighAmount is null or HighAmount='';
update mn_Menu set LowAmount=0 where LowAmount is null or LowAmount='';
update mn_Menu set CostPrice=0 where CostPrice is null or CostPrice='';
update mn_Menu set MenuPrice4=0 where MenuPrice4 is null or MenuPrice4='';
update mn_Menu set MenuPrice3=0 where MenuPrice3 is null or MenuPrice3='';
update mn_Menu set MenuPrice2=0 where MenuPrice2 is null or MenuPrice2='';

create table WX_HWMember(
	unionId varchar(200) COMMENT ''
)



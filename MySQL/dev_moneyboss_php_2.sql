/*
SQLyog Community Edition- MySQL GUI v7.12 
MySQL - 5.6.22-log : Database - dev_moneyboss_php_2
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`dev_moneyboss_php_2` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `dev_moneyboss_php_2`;

/*Table structure for table `_defaultColumns` */

DROP TABLE IF EXISTS `_defaultColumns`;

CREATE TABLE `_defaultColumns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_corporation_guid` varchar(40) NOT NULL COMMENT '公司別索引',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='基本欄位';

/*Data for the table `_defaultColumns` */

/*Table structure for table `b_agents` */

DROP TABLE IF EXISTS `b_agents`;

CREATE TABLE `b_agents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_agents_guid` varchar(40) DEFAULT NULL COMMENT '總代理索引 NULL為總代理',
  `account` varchar(50) NOT NULL COMMENT '代理商帳號',
  `passwd` varchar(64) NOT NULL COMMENT '代理商密碼',
  `serial_no` varchar(20) NOT NULL COMMENT '代理商識別碼',
  `uniform_number` varchar(20) NOT NULL COMMENT '統一編號',
  `company_name` varchar(50) NOT NULL COMMENT '公司名稱',
  `company_phone` varchar(20) NOT NULL COMMENT '公司電話',
  `company_address` varchar(255) NOT NULL COMMENT '公司地址',
  `contact_name` varchar(20) NOT NULL COMMENT '聯絡人姓名',
  `contact_mobile` varchar(20) NOT NULL COMMENT '聯絡人行動電話',
  `contact_email` varchar(255) NOT NULL COMMENT '聯絡人電子郵件',
  `remittance_bank` varchar(40) NOT NULL COMMENT '匯款銀行',
  `remittance_account` varchar(40) NOT NULL COMMENT '匯款帳號',
  `remittance_name` varchar(20) NOT NULL COMMENT '匯款名稱',
  `remark` text NOT NULL COMMENT '備註',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `account` (`account`),
  KEY `b_agents_guid` (`b_agents_guid`),
  CONSTRAINT `b_agents_ibfk_1` FOREIGN KEY (`b_agents_guid`) REFERENCES `b_agents` (`guid`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=COMPACT COMMENT='代理商';

/*Data for the table `b_agents` */

insert  into `b_agents`(`id`,`guid`,`b_agents_guid`,`account`,`passwd`,`serial_no`,`uniform_number`,`company_name`,`company_phone`,`company_address`,`contact_name`,`contact_mobile`,`contact_email`,`remittance_bank`,`remittance_account`,`remittance_name`,`remark`,`is_invalid`,`creator_guid`,`creator_name`,`creator_date`,`modifier_guid`,`modifier_name`,`modifier_date`,`invalid_guid`,`invalid_name`,`invalid_date`) values (5,'9371e836-2312-11e6-a4ac-d275b9d5831f',NULL,'everywhere','mD7XfFjJ23/iAnlj9LRX3kZdPtFjVRbb/7Z6IMyvSBs=','ew','80246456','詮通','80246456','','詮通','80246456','','','','','',1,'系統初始值','系統初始值','2016-06-27 15:32:21','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00');

/*Table structure for table `b_cash_flow` */

DROP TABLE IF EXISTS `b_cash_flow`;

CREATE TABLE `b_cash_flow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_corporation_guid` varchar(40) NOT NULL COMMENT '公司別代碼',
  `title` varchar(50) NOT NULL COMMENT '金流名稱',
  `payment_method` int(2) NOT NULL DEFAULT '1' COMMENT '付款方式 EnumCashFlowPaymentMethod',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='金流';

/*Data for the table `b_cash_flow` */

insert  into `b_cash_flow`(`id`,`guid`,`b_corporation_guid`,`title`,`payment_method`,`is_invalid`,`creator_guid`,`creator_name`,`creator_date`,`modifier_guid`,`modifier_name`,`modifier_date`,`invalid_guid`,`invalid_name`,`invalid_date`) values (1,'b28df686-3c37-11e6-8274-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42','貨到付款',2,1,'系統初始值','系統初始值','2016-06-27 15:20:59','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(2,'b28df7a8-3c37-11e6-8274-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42','線上刷卡',1,1,'系統初始值','系統初始值','2016-06-27 15:20:59','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00');

/*Table structure for table `b_corporation` */

DROP TABLE IF EXISTS `b_corporation`;

CREATE TABLE `b_corporation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `name` varchar(20) NOT NULL COMMENT '公司名稱',
  `remark` text NOT NULL COMMENT '摘要',
  `sort_no` int(11) NOT NULL COMMENT '排序',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='公司別';

/*Data for the table `b_corporation` */

/*Table structure for table `b_corporation_branch` */

DROP TABLE IF EXISTS `b_corporation_branch`;

CREATE TABLE `b_corporation_branch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_corporation_guid` varchar(40) DEFAULT NULL COMMENT '公司別索引',
  `name` varchar(20) NOT NULL COMMENT '分店名稱',
  `remark` text NOT NULL COMMENT '摘要',
  `sort_no` int(11) NOT NULL COMMENT '排序',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`),
  KEY `b_corporation_guid` (`b_corporation_guid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='分店';

/*Data for the table `b_corporation_branch` */

insert  into `b_corporation_branch`(`id`,`guid`,`b_corporation_guid`,`name`,`remark`,`sort_no`,`is_invalid`,`creator_guid`,`creator_name`,`creator_date`,`modifier_guid`,`modifier_name`,`modifier_date`,`invalid_guid`,`invalid_name`,`invalid_date`) values (1,'6a0c3536-3c40-11e6-8274-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42','sub分店1','摘要',20,1,'7ca53f13-ce02-422c-a755-15ac9c945334','subadmin','2016-06-27 16:23:23','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(2,'8a0215c8-3c44-11e6-8274-d275b9d5831f','3f9c7e9b-56e0-4d0f-9372-156510c99aff','台中進化店','',0,1,'f0ff27bb-062d-468a-aa15-bb3d2fe0caf7','ew18473','2016-06-27 16:52:55','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(3,'987b417e-3c44-11e6-8274-d275b9d5831f','3f9c7e9b-56e0-4d0f-9372-156510c99aff','台北信義店','',0,1,'f0ff27bb-062d-468a-aa15-bb3d2fe0caf7','ew18473','2016-06-27 16:53:19','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00');

/*Table structure for table `b_customer` */

DROP TABLE IF EXISTS `b_customer`;

CREATE TABLE `b_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_corporation_guid` varchar(40) NOT NULL COMMENT '公司別索引',
  `identity_client` int(1) NOT NULL COMMENT '客戶0:否 1:是',
  `identity_company` int(1) NOT NULL COMMENT '廠商0:否 1:是',
  `serial_no` varchar(40) NOT NULL COMMENT '客廠編號',
  `uniform_number` varchar(8) NOT NULL COMMENT '統一編號',
  `name` varchar(50) NOT NULL COMMENT '公司名稱',
  `address` text NOT NULL COMMENT '公司地址',
  `contact_address` text NOT NULL COMMENT '聯絡地址',
  `phone_prefix` varchar(5) NOT NULL COMMENT '公司電話-區碼',
  `phone_number` varchar(10) NOT NULL COMMENT '公司電話-號碼',
  `phone_extension` varchar(10) NOT NULL COMMENT '公司電話-分機',
  `email` varchar(100) NOT NULL COMMENT '電子郵件',
  `remark` text NOT NULL COMMENT '備註',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `serial_no` (`serial_no`,`b_corporation_guid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='客廠基本資料';

/*Data for the table `b_customer` */

insert  into `b_customer`(`id`,`guid`,`b_corporation_guid`,`identity_client`,`identity_company`,`serial_no`,`uniform_number`,`name`,`address`,`contact_address`,`phone_prefix`,`phone_number`,`phone_extension`,`email`,`remark`,`is_invalid`,`creator_guid`,`creator_name`,`creator_date`,`modifier_guid`,`modifier_name`,`modifier_date`,`invalid_guid`,`invalid_name`,`invalid_date`) values (1,'d0ea06c0-3c40-11e6-8274-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42',1,0,'sub客廠001','20160627','sub客廠公司','sub公司地址','聯絡地址','02','27653205','11','a809252002@gmail.com','',1,'7ca53f13-ce02-422c-a755-15ac9c945334','subadmin','2016-06-27 16:26:16','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00');

/*Table structure for table `b_customer_branch` */

DROP TABLE IF EXISTS `b_customer_branch`;

CREATE TABLE `b_customer_branch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_corporation_guid` varchar(40) NOT NULL COMMENT '公司別索引',
  `b_customer_guid` varchar(40) NOT NULL COMMENT '客廠索引',
  `name` varchar(50) NOT NULL COMMENT '公司名稱',
  `address` text NOT NULL COMMENT '公司地址',
  `phone` varchar(50) NOT NULL COMMENT '公司電話',
  `principal_contact_name` varchar(50) NOT NULL COMMENT '主要聯絡人名稱',
  `principal_contact_title` varchar(50) NOT NULL COMMENT '主要聯絡人抬頭',
  `principal_contact_nickname` varchar(50) NOT NULL COMMENT '主要聯絡人暱稱',
  `principal_contact_cellphone` varchar(50) NOT NULL COMMENT '主要聯絡人手機號碼',
  `principal_contact_email` varchar(100) NOT NULL COMMENT '主要聯絡人電子郵件',
  `contact_name` varchar(50) NOT NULL COMMENT '名稱',
  `contact_title` varchar(50) NOT NULL COMMENT '抬頭',
  `contact_nickname` varchar(50) NOT NULL COMMENT '暱稱',
  `contact_cellphone` varchar(50) NOT NULL COMMENT '手機號碼',
  `contact_email` varchar(100) NOT NULL COMMENT '電子郵件',
  `remark` text NOT NULL COMMENT '備註',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`),
  KEY `b_customer_guid` (`b_customer_guid`),
  CONSTRAINT `b_customer_branch_ibfk_1` FOREIGN KEY (`b_customer_guid`) REFERENCES `b_customer` (`guid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='客廠店別基本資料';

/*Data for the table `b_customer_branch` */

insert  into `b_customer_branch`(`id`,`guid`,`b_corporation_guid`,`b_customer_guid`,`name`,`address`,`phone`,`principal_contact_name`,`principal_contact_title`,`principal_contact_nickname`,`principal_contact_cellphone`,`principal_contact_email`,`contact_name`,`contact_title`,`contact_nickname`,`contact_cellphone`,`contact_email`,`remark`,`is_invalid`,`creator_guid`,`creator_name`,`creator_date`,`modifier_guid`,`modifier_name`,`modifier_date`,`invalid_guid`,`invalid_name`,`invalid_date`) values (1,'d0f3248a-3c40-11e6-8274-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42','d0ea06c0-3c40-11e6-8274-d275b9d5831f','sub台北店','sub台北店','0227653205','rd17','rd17','rd17','0988955980','a809252002@gmail.com','aaa','','','','','',1,'7ca53f13-ce02-422c-a755-15ac9c945334','subadmin','2016-06-27 16:26:16','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00');

/*Table structure for table `b_customer_contact` */

DROP TABLE IF EXISTS `b_customer_contact`;

CREATE TABLE `b_customer_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_corporation_guid` varchar(40) NOT NULL COMMENT '公司別索引',
  `b_customer_guid` varchar(40) NOT NULL COMMENT '客廠基本資料索引',
  `is_principal` int(1) NOT NULL DEFAULT '1' COMMENT '是否為主要聯絡人 1:否 2:是',
  `name` varchar(50) NOT NULL COMMENT '名稱',
  `title` varchar(50) NOT NULL COMMENT '抬頭',
  `nickname` varchar(50) NOT NULL COMMENT '暱稱',
  `phone` varchar(50) NOT NULL COMMENT '聯絡電話',
  `cellphone` varchar(50) NOT NULL COMMENT '手機號碼',
  `email` varchar(100) NOT NULL COMMENT '電子郵件',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`),
  KEY `b_customer_guid` (`b_customer_guid`),
  CONSTRAINT `b_customer_contact_ibfk_1` FOREIGN KEY (`b_customer_guid`) REFERENCES `b_customer` (`guid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='客廠聯絡人資料';

/*Data for the table `b_customer_contact` */

insert  into `b_customer_contact`(`id`,`guid`,`b_corporation_guid`,`b_customer_guid`,`is_principal`,`name`,`title`,`nickname`,`phone`,`cellphone`,`email`,`is_invalid`,`creator_guid`,`creator_name`,`creator_date`,`modifier_guid`,`modifier_name`,`modifier_date`,`invalid_guid`,`invalid_name`,`invalid_date`) values (1,'d0f187f6-3c40-11e6-8274-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42','d0ea06c0-3c40-11e6-8274-d275b9d5831f',2,'aa','aa','aa','27653205','0988955980','a809252002@gmail.com',1,'7ca53f13-ce02-422c-a755-15ac9c945334','subadmin','2016-06-27 16:26:16','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00');

/*Table structure for table `b_ec_product` */

DROP TABLE IF EXISTS `b_ec_product`;

CREATE TABLE `b_ec_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_corporation_guid` varchar(40) NOT NULL COMMENT '公司別索引',
  `barcode` varchar(13) NOT NULL COMMENT '商品條碼',
  `title` varchar(50) NOT NULL COMMENT '標題',
  `share_title` varchar(50) NOT NULL COMMENT '分享標題',
  `description` text NOT NULL COMMENT '商品簡介',
  `price` int(11) NOT NULL COMMENT '價格',
  `member_price` int(11) NOT NULL COMMENT '會員價格',
  `youtube` text NOT NULL COMMENT 'youtube連結',
  `feature` text NOT NULL COMMENT '商品特色',
  `specification` text NOT NULL COMMENT '商品規格',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `barcode` (`b_corporation_guid`,`barcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='電子商務商品資料';

/*Data for the table `b_ec_product` */

/*Table structure for table `b_ec_product_category` */

DROP TABLE IF EXISTS `b_ec_product_category`;

CREATE TABLE `b_ec_product_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_corporation_guid` varchar(40) NOT NULL COMMENT '公司別索引',
  `b_ec_product_category_guid` varchar(40) DEFAULT NULL COMMENT '上層分類索引，null為主分類',
  `name` varchar(50) NOT NULL COMMENT '分類名稱',
  `sort_no` int(11) NOT NULL COMMENT '排序',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`),
  KEY `b_product_category_guid` (`b_ec_product_category_guid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='電子商務商品分類';

/*Data for the table `b_ec_product_category` */

insert  into `b_ec_product_category`(`id`,`guid`,`b_corporation_guid`,`b_ec_product_category_guid`,`name`,`sort_no`,`is_invalid`,`creator_guid`,`creator_name`,`creator_date`,`modifier_guid`,`modifier_name`,`modifier_date`,`invalid_guid`,`invalid_name`,`invalid_date`) values (1,'b428a8f8-3c44-11e6-8274-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42',NULL,'subec主',50,1,'7ca53f13-ce02-422c-a755-15ac9c945334','subadmin','2016-06-27 16:54:05','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(2,'bbba1af2-3c44-11e6-8274-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42','b428a8f8-3c44-11e6-8274-d275b9d5831f','subec子',0,1,'7ca53f13-ce02-422c-a755-15ac9c945334','subadmin','2016-06-27 16:54:18','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00');

/*Table structure for table `b_ec_product_image` */

DROP TABLE IF EXISTS `b_ec_product_image`;

CREATE TABLE `b_ec_product_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_corporation_guid` varchar(40) NOT NULL COMMENT '公司別索引',
  `main` int(1) NOT NULL DEFAULT '0' COMMENT '代表圖 0:否 1:是',
  `b_ec_product_guid` varchar(40) NOT NULL COMMENT '電子商務商品索引',
  `file_path` text NOT NULL COMMENT '圖片路徑',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`),
  KEY `b_product_guid` (`b_ec_product_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='電子商務商品圖片';

/*Data for the table `b_ec_product_image` */

/*Table structure for table `b_ec_product_mapping_category` */

DROP TABLE IF EXISTS `b_ec_product_mapping_category`;

CREATE TABLE `b_ec_product_mapping_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_corporation_guid` varchar(40) NOT NULL COMMENT '公司別索引',
  `b_ec_product_guid` varchar(40) NOT NULL COMMENT '電子商務商品索引',
  `b_ec_product_category_guid` varchar(40) NOT NULL COMMENT '電子商務商品分類索引',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`),
  KEY `b_product_guid` (`b_ec_product_guid`),
  KEY `b_product_category_guid` (`b_ec_product_category_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='電子商務商品與電子商務商品分類關聯';

/*Data for the table `b_ec_product_mapping_category` */

/*Table structure for table `b_ec_product_mapping_tag` */

DROP TABLE IF EXISTS `b_ec_product_mapping_tag`;

CREATE TABLE `b_ec_product_mapping_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_corporation_guid` varchar(40) NOT NULL COMMENT '公司別索引',
  `b_ec_product_tag_guid` varchar(40) NOT NULL COMMENT '電子商務標籤索引',
  `b_ec_product_guid` varchar(40) NOT NULL COMMENT '電子商務商品索引',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`),
  KEY `b_product_guid` (`b_ec_product_guid`),
  KEY `b_product_attribute_guid` (`b_ec_product_tag_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='電子商務商品與電子商務商品標籤關聯';

/*Data for the table `b_ec_product_mapping_tag` */

/*Table structure for table `b_ec_product_specification` */

DROP TABLE IF EXISTS `b_ec_product_specification`;

CREATE TABLE `b_ec_product_specification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_corporation_guid` varchar(40) NOT NULL COMMENT '公司別索引',
  `b_ec_product_guid` varchar(40) NOT NULL COMMENT '電子商務商品索引',
  `b_product_guid` varchar(40) NOT NULL COMMENT '商品規格索引',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='電子商務商品規格';

/*Data for the table `b_ec_product_specification` */

/*Table structure for table `b_ec_product_tag` */

DROP TABLE IF EXISTS `b_ec_product_tag`;

CREATE TABLE `b_ec_product_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_corporation_guid` varchar(40) NOT NULL COMMENT '公司別索引',
  `name` varchar(20) NOT NULL COMMENT '屬性名稱',
  `sort_no` int(11) NOT NULL COMMENT '排序',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='電子商務商品標籤';

/*Data for the table `b_ec_product_tag` */

insert  into `b_ec_product_tag`(`id`,`guid`,`b_corporation_guid`,`name`,`sort_no`,`is_invalid`,`creator_guid`,`creator_name`,`creator_date`,`modifier_guid`,`modifier_name`,`modifier_date`,`invalid_guid`,`invalid_name`,`invalid_date`) values (1,'5d085cc6-3c44-11e6-8274-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42','subEC標籤1',20,1,'7ca53f13-ce02-422c-a755-15ac9c945334','subadmin','2016-06-27 16:51:39','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00');

/*Table structure for table `b_enterprise` */

DROP TABLE IF EXISTS `b_enterprise`;

CREATE TABLE `b_enterprise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `store_no` varchar(40) DEFAULT 'null' COMMENT '特店編號',
  `b_agents_guid` varchar(40) NOT NULL COMMENT '代理商索引',
  `account` varchar(50) NOT NULL COMMENT '企業帳號',
  `b_industry_guid` varchar(40) NOT NULL COMMENT '業別索引',
  `uniform_number` varchar(20) NOT NULL COMMENT '統一編號',
  `company_name` varchar(50) NOT NULL COMMENT '公司名稱',
  `company_phone` varchar(20) NOT NULL COMMENT '公司電話',
  `company_address` varchar(255) NOT NULL COMMENT '公司地址',
  `applicant_name` varchar(20) NOT NULL COMMENT '聯絡人姓名',
  `applicant_mobile` varchar(20) NOT NULL COMMENT '聯絡人行動電話',
  `applicant_email` varchar(255) NOT NULL COMMENT '聯絡人電子郵件',
  `email` varchar(255) NOT NULL COMMENT '企業電子郵件',
  `email_validate` int(42) NOT NULL DEFAULT '1' COMMENT 'E-Mail認證 1：未驗證 50：驗證通過',
  `number_of_employees` int(3) NOT NULL DEFAULT '5' COMMENT '可建立子帳號數量',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '帳號狀態 1：未使用 10：審核中 20：不通過 30：試用 40：無效 50：停權 60：有效',
  `remark` text NOT NULL COMMENT '備註',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`),
  KEY `b_agents_guid` (`b_agents_guid`),
  CONSTRAINT `b_enterprise_ibfk_1` FOREIGN KEY (`b_agents_guid`) REFERENCES `b_agents` (`guid`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='企業帳號';

/*Data for the table `b_enterprise` */

insert  into `b_enterprise`(`id`,`guid`,`store_no`,`b_agents_guid`,`account`,`b_industry_guid`,`uniform_number`,`company_name`,`company_phone`,`company_address`,`applicant_name`,`applicant_mobile`,`applicant_email`,`email`,`email_validate`,`number_of_employees`,`status`,`remark`,`is_invalid`,`creator_guid`,`creator_name`,`creator_date`,`modifier_guid`,`modifier_name`,`modifier_date`,`invalid_guid`,`invalid_name`,`invalid_date`) values (9,'28a5bc5c-6bb6-4a74-b146-9facd85c379f','ew1879','9371e836-2312-11e6-a4ac-d275b9d5831f','','19f3c6d8-231b-11e6-a4ac-d275b9d5831f','99999999','通通補習班','0227653205','信義區','張學友','0988753951','','rd21@everywhere.com.tw',1,5,10,'',1,'28a5bc5c-6bb6-4a74-b146-9facd85c379f','Adam','2016-06-27 17:20:28','','','2016-06-27 17:20:28','','','2016-06-27 17:20:28'),(6,'3f9c7e9b-56e0-4d0f-9372-156510c99aff','ew1847','9371e836-2312-11e6-a4ac-d275b9d5831f','ew1847','2d3915fe-231b-11e6-a4ac-d275b9d5831f','80246456','長榮桂冠酒店','0422318398','台中市台灣大道二段614號','張小明','0912111222','','liu19851205@gmail.com',1,5,30,'',1,'3f9c7e9b-56e0-4d0f-9372-156510c99aff','Adam','2016-06-27 16:46:29','','','2016-06-27 16:46:29','','','2016-06-27 16:46:29'),(8,'6f7a8086-e8ae-42bb-a16b-af9d3cc6e88d','ew1908','9371e836-2312-11e6-a4ac-d275b9d5831f','','19f3c6d8-231b-11e6-a4ac-d275b9d5831f','99999999','通通補習班','0227653205','信義區','劉德華','0988753951','','rd21@everywhere.com.tw',1,5,10,'',1,'6f7a8086-e8ae-42bb-a16b-af9d3cc6e88d','Adam','2016-06-27 17:20:13','','','2016-06-27 17:20:13','','','2016-06-27 17:20:13'),(5,'aec64ec6-2949-4dd5-a013-e7102f110d42','ew9999','9371e836-2312-11e6-a4ac-d275b9d5831f','admin','4b5c9b3c-231b-11e6-a4ac-d275b9d5831f','44786513','詮通電腦','0227653205','和平西路三段34巷4號2樓','姿利 葉','0988955980','','a809252002@gmail.com',1,5,60,'',1,'系統初始值','系統初始值','2016-06-27 15:32:21','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(7,'dbffa256-8888-41c1-91ea-7c2a4e7e1ea0','ew1278','9371e836-2312-11e6-a4ac-d275b9d5831f','','19f3c6d8-231b-11e6-a4ac-d275b9d5831f','99999999','通通補習班','0227653205','信義區','郭富城','0988753951','','rd21@everywhere.com.tw',1,5,10,'',1,'dbffa256-8888-41c1-91ea-7c2a4e7e1ea0','Adam','2016-06-27 17:19:51','','','2016-06-27 17:19:51','','','2016-06-27 17:19:51');

/*Table structure for table `b_enterprise_employee` */

DROP TABLE IF EXISTS `b_enterprise_employee`;

CREATE TABLE `b_enterprise_employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_enterprise_guid` varchar(40) NOT NULL COMMENT '企業帳號索引',
  `account` varchar(50) NOT NULL COMMENT '子帳號',
  `email` varchar(255) NOT NULL COMMENT '子帳號電子郵件',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '子帳號狀態 1：關閉 10：停權 50：開啟',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `account` (`account`),
  KEY `b_enterprise_guid` (`b_enterprise_guid`),
  CONSTRAINT `b_enterprise_employee_ibfk_1` FOREIGN KEY (`b_enterprise_guid`) REFERENCES `b_enterprise` (`guid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='子帳號';

/*Data for the table `b_enterprise_employee` */

insert  into `b_enterprise_employee`(`id`,`guid`,`b_enterprise_guid`,`account`,`email`,`status`,`is_invalid`,`creator_guid`,`creator_name`,`creator_date`,`modifier_guid`,`modifier_name`,`modifier_date`,`invalid_guid`,`invalid_name`,`invalid_date`) values (7,'13d93b47-0fbf-4192-9a87-7538af7147cb','3f9c7e9b-56e0-4d0f-9372-156510c99aff','ew18472','ew18472@everywhere.com.tw',50,1,'13d93b47-0fbf-4192-9a87-7538af7147cb','Adam','2016-06-27 16:48:34','','','2016-06-27 16:48:34','','','2016-06-27 16:48:34'),(5,'7ca53f13-ce02-422c-a755-15ac9c945334','aec64ec6-2949-4dd5-a013-e7102f110d42','subadmin','rd17@everywhere.com.tw',50,1,'系統初始值','系統初始值','2016-06-27 15:32:21','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(6,'d154f613-242e-4a48-8567-c0e841046cfe','3f9c7e9b-56e0-4d0f-9372-156510c99aff','ew18471','ew18471@everywhere.com.tw',50,1,'d154f613-242e-4a48-8567-c0e841046cfe','Adam','2016-06-27 16:49:01','','','2016-06-27 16:49:01','','','2016-06-27 16:49:01'),(8,'f0ff27bb-062d-468a-aa15-bb3d2fe0caf7','3f9c7e9b-56e0-4d0f-9372-156510c99aff','ew18473','ew18473@everywhere.com.tw',50,1,'f0ff27bb-062d-468a-aa15-bb3d2fe0caf7','Adam','2016-06-27 16:48:54','','','2016-06-27 16:48:54','','','2016-06-27 16:48:54');

/*Table structure for table `b_industry` */

DROP TABLE IF EXISTS `b_industry`;

CREATE TABLE `b_industry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `serial_no` varchar(20) NOT NULL COMMENT '業別代碼',
  `name` varchar(50) NOT NULL COMMENT '業別名稱',
  `sort_no` int(11) NOT NULL COMMENT '排序',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COMMENT='業別';

/*Data for the table `b_industry` */

insert  into `b_industry`(`id`,`guid`,`serial_no`,`name`,`sort_no`,`is_invalid`,`creator_guid`,`creator_name`,`creator_date`,`modifier_guid`,`modifier_name`,`modifier_date`,`invalid_guid`,`invalid_name`,`invalid_date`) values (1,'0166a35c-286f-11e6-b02c-d275b9d5831f','P','教育業',16,1,'系統初始值','系統初始值','2016-06-02 00:00:00','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(2,'19f3c6d8-231b-11e6-a4ac-d275b9d5831f','H','運輸及倉儲業',8,1,'系統初始值','系統初始值','2016-05-26 00:00:00','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(3,'1a385722-231a-11e6-a4ac-d275b9d5831f','A','農、林、漁、牧業',1,1,'系統初始值','系統初始值','2016-05-26 00:00:00','','','2016-05-26 00:00:00','','','1899-12-31 00:00:00'),(4,'1a5f5a34-286f-11e6-b02c-d275b9d5831f','Q','醫療保健及社會工作服務業',17,1,'系統初始值','系統初始值','2016-06-02 00:00:00','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(5,'2d3915fe-231b-11e6-a4ac-d275b9d5831f','I','住宿及餐飲業',9,1,'系統初始值','系統初始值','2016-05-26 00:00:00','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(6,'4b5c9b3c-231b-11e6-a4ac-d275b9d5831f','J','出版、影音製作、傳播及資通訊服務業',10,1,'系統初始值','系統初始值','2016-05-26 00:00:00','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(7,'4f5dc252-286f-11e6-b02c-d275b9d5831f','R','藝術、娛樂及休閒服務業',18,1,'系統初始值','系統初始值','2016-06-02 00:00:00','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(8,'6082291a-231a-11e6-a4ac-d275b9d5831f','B','礦業及土石採取業',2,1,'系統初始值','系統初始值','2016-05-26 00:00:00','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(9,'79a4664c-231a-11e6-a4ac-d275b9d5831f','C','製造業',3,1,'系統初始值','系統初始值','2016-05-26 00:00:00','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(10,'7cd61168-286e-11e6-b02c-d275b9d5831f','L','不動產業',12,1,'系統初始值','系統初始值','2016-06-02 00:00:00','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(11,'860d5484-286f-11e6-b02c-d275b9d5831f','S','其他服務業',19,1,'系統初始值','系統初始值','2016-06-02 00:00:00','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(12,'9f4665ae-286e-11e6-b02c-d275b9d5831f','M','專業、科學及技術服務業',13,1,'系統初始值','系統初始值','2016-06-02 00:00:00','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(13,'9fab3a82-231a-11e6-a4ac-d275b9d5831f','D','電力及燃氣供應業',4,1,'系統初始值','系統初始值','2016-05-26 00:00:00','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(14,'b367358e-231b-11e6-a4ac-d275b9d5831f','K','金融及保險業',11,1,'系統初始值','系統初始值','2016-05-26 00:00:00','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(15,'ca28a74a-286f-11e6-b02c-d275b9d5831f','O','公共行政及國防；強制性社會安全',15,1,'系統初始值','系統初始值','2016-06-02 00:00:00','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(16,'cbd00020-231a-11e6-a4ac-d275b9d5831f','E','用水供應及污染整治業',5,1,'系統初始值','系統初始值','2016-05-26 00:00:00','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(17,'ce0376fc-286e-11e6-b02c-d275b9d5831f','N','支援服務業',14,1,'系統初始值','系統初始值','2016-06-02 00:00:00','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(18,'dd4fab2a-231a-11e6-a4ac-d275b9d5831f','F','營建工程業',6,1,'系統初始值','系統初始值','2016-05-26 00:00:00','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(19,'f84e5868-231a-11e6-a4ac-d275b9d5831f','G','批發及零售業',7,1,'系統初始值','系統初始值','2016-05-26 00:00:00','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00');

/*Table structure for table `b_logistics` */

DROP TABLE IF EXISTS `b_logistics`;

CREATE TABLE `b_logistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_corporation_guid` varchar(40) NOT NULL COMMENT '公司別索引',
  `title` varchar(50) NOT NULL COMMENT '物流名稱',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='物流';

/*Data for the table `b_logistics` */

insert  into `b_logistics`(`id`,`guid`,`b_corporation_guid`,`title`,`is_invalid`,`creator_guid`,`creator_name`,`creator_date`,`modifier_guid`,`modifier_name`,`modifier_date`,`invalid_guid`,`invalid_name`,`invalid_date`) values (1,'b28e0e78-3c37-11e6-8274-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42','黑貓宅急便',1,'系統初始值','系統初始值','2016-06-27 15:20:59','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(2,'b28e0fae-3c37-11e6-8274-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42','新竹貨運',1,'系統初始值','系統初始值','2016-06-27 15:20:59','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00');

/*Table structure for table `b_member` */

DROP TABLE IF EXISTS `b_member`;

CREATE TABLE `b_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_corporation_guid` varchar(40) NOT NULL COMMENT '公司別索引',
  `account` varchar(20) NOT NULL COMMENT '會員帳號',
  `title` varchar(50) NOT NULL COMMENT '會員名稱',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='會員';

/*Data for the table `b_member` */

insert  into `b_member`(`id`,`guid`,`b_corporation_guid`,`account`,`title`,`is_invalid`,`creator_guid`,`creator_name`,`creator_date`,`modifier_guid`,`modifier_name`,`modifier_date`,`invalid_guid`,`invalid_name`,`invalid_date`) values (1,'b28dccd8-3c37-11e6-8274-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42','rd11','恰吉',1,'系統初始值','系統初始值','2016-06-27 15:20:59','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00');

/*Table structure for table `b_product` */

DROP TABLE IF EXISTS `b_product`;

CREATE TABLE `b_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_corporation_guid` varchar(40) NOT NULL COMMENT '公司別索引',
  `serial_no` varchar(40) NOT NULL COMMENT '商品編號',
  `name` varchar(40) NOT NULL COMMENT '品名',
  `specification` varchar(50) NOT NULL COMMENT '規格',
  `b_product_stock_unit_guid` varchar(40) NOT NULL COMMENT '庫存單位索引',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `serial_no` (`b_corporation_guid`,`serial_no`),
  KEY `b_product_stock_unit_guid` (`b_product_stock_unit_guid`),
  CONSTRAINT `b_product_ibfk_1` FOREIGN KEY (`b_product_stock_unit_guid`) REFERENCES `b_product_stock_unit` (`guid`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='商品基本資料';

/*Data for the table `b_product` */

insert  into `b_product`(`id`,`guid`,`b_corporation_guid`,`serial_no`,`name`,`specification`,`b_product_stock_unit_guid`,`is_invalid`,`creator_guid`,`creator_name`,`creator_date`,`modifier_guid`,`modifier_name`,`modifier_date`,`invalid_guid`,`invalid_name`,`invalid_date`) values (1,'14fa1102-3c41-11e6-8274-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42','subproduct001','subproduct','紅','052c6126-3c41-11e6-8274-d275b9d5831f',1,'7ca53f13-ce02-422c-a755-15ac9c945334','subadmin','2016-06-27 16:28:10','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00');

/*Table structure for table `b_product_attribute` */

DROP TABLE IF EXISTS `b_product_attribute`;

CREATE TABLE `b_product_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_corporation_guid` varchar(40) NOT NULL COMMENT '公司別索引',
  `name` varchar(20) NOT NULL COMMENT '屬性名稱',
  `sort_no` int(11) NOT NULL COMMENT '排序',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='商品屬性';

/*Data for the table `b_product_attribute` */

insert  into `b_product_attribute`(`id`,`guid`,`b_corporation_guid`,`name`,`sort_no`,`is_invalid`,`creator_guid`,`creator_name`,`creator_date`,`modifier_guid`,`modifier_name`,`modifier_date`,`invalid_guid`,`invalid_name`,`invalid_date`) values (1,'db25b026-3c40-11e6-8274-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42','sub標籤1',0,1,'7ca53f13-ce02-422c-a755-15ac9c945334','subadmin','2016-06-27 16:26:33','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00');

/*Table structure for table `b_product_category` */

DROP TABLE IF EXISTS `b_product_category`;

CREATE TABLE `b_product_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_corporation_guid` varchar(40) NOT NULL COMMENT '公司別索引',
  `b_product_category_guid` varchar(40) DEFAULT NULL COMMENT '上層分類索引，null為主分類',
  `name` varchar(50) NOT NULL COMMENT '分類名稱',
  `sort_no` int(11) NOT NULL COMMENT '排序',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`),
  KEY `b_product_category_guid` (`b_product_category_guid`),
  CONSTRAINT `b_product_category_ibfk_1` FOREIGN KEY (`b_product_category_guid`) REFERENCES `b_product_category` (`guid`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='基本商品分類';

/*Data for the table `b_product_category` */

insert  into `b_product_category`(`id`,`guid`,`b_corporation_guid`,`b_product_category_guid`,`name`,`sort_no`,`is_invalid`,`creator_guid`,`creator_name`,`creator_date`,`modifier_guid`,`modifier_name`,`modifier_date`,`invalid_guid`,`invalid_name`,`invalid_date`) values (1,'e578cb26-3c40-11e6-8274-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42',NULL,'sub1主1',50,1,'7ca53f13-ce02-422c-a755-15ac9c945334','subadmin','2016-06-27 16:26:50','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(2,'f14897ba-3c40-11e6-8274-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42','e578cb26-3c40-11e6-8274-d275b9d5831f','sub子分',50,1,'7ca53f13-ce02-422c-a755-15ac9c945334','subadmin','2016-06-27 16:27:10','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00');

/*Table structure for table `b_product_image` */

DROP TABLE IF EXISTS `b_product_image`;

CREATE TABLE `b_product_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_corporation_guid` varchar(40) NOT NULL COMMENT '公司別索引',
  `b_product_guid` varchar(40) NOT NULL COMMENT '商品索引',
  `file_path` text NOT NULL COMMENT '圖片路徑',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`),
  KEY `b_product_guid` (`b_product_guid`),
  CONSTRAINT `b_product_image_ibfk_1` FOREIGN KEY (`b_product_guid`) REFERENCES `b_product` (`guid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='商品圖片';

/*Data for the table `b_product_image` */

insert  into `b_product_image`(`id`,`guid`,`b_corporation_guid`,`b_product_guid`,`file_path`,`is_invalid`,`creator_guid`,`creator_name`,`creator_date`,`modifier_guid`,`modifier_name`,`modifier_date`,`invalid_guid`,`invalid_name`,`invalid_date`) values (1,'14fc7dfc-3c41-11e6-8274-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42','14fa1102-3c41-11e6-8274-d275b9d5831f','upload/Product/1/4/f/a/1/1/0/2/3/c/4/1/1/1/e/6/8/2/7/4/d/2/7/5/b/9/d/5/8/3/1/f/14fc7dfc-3c41-11e6-8274-d275b9d5831f.jpg',1,'7ca53f13-ce02-422c-a755-15ac9c945334','subadmin','2016-06-27 16:28:10','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00');

/*Table structure for table `b_product_mapping_attribute` */

DROP TABLE IF EXISTS `b_product_mapping_attribute`;

CREATE TABLE `b_product_mapping_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_corporation_guid` varchar(40) NOT NULL COMMENT '公司別索引',
  `b_product_attribute_guid` varchar(40) NOT NULL COMMENT '屬性索引',
  `b_product_guid` varchar(40) NOT NULL COMMENT '商品索引',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`),
  KEY `b_product_guid` (`b_product_guid`),
  KEY `b_product_attribute_guid` (`b_product_attribute_guid`),
  CONSTRAINT `b_product_mapping_attribute_ibfk_1` FOREIGN KEY (`b_product_guid`) REFERENCES `b_product` (`guid`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `b_product_mapping_attribute_ibfk_2` FOREIGN KEY (`b_product_attribute_guid`) REFERENCES `b_product_attribute` (`guid`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品與商品屬性關聯';

/*Data for the table `b_product_mapping_attribute` */

/*Table structure for table `b_product_mapping_category` */

DROP TABLE IF EXISTS `b_product_mapping_category`;

CREATE TABLE `b_product_mapping_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_corporation_guid` varchar(40) NOT NULL COMMENT '公司別索引',
  `b_product_guid` varchar(40) NOT NULL COMMENT '商品索引',
  `b_product_category_guid` varchar(40) NOT NULL COMMENT '商品分類索引',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`),
  KEY `b_product_guid` (`b_product_guid`),
  KEY `b_product_category_guid` (`b_product_category_guid`),
  CONSTRAINT `b_product_mapping_category_ibfk_1` FOREIGN KEY (`b_product_guid`) REFERENCES `b_product` (`guid`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `b_product_mapping_category_ibfk_2` FOREIGN KEY (`b_product_category_guid`) REFERENCES `b_product_category` (`guid`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='基本商品分類';

/*Data for the table `b_product_mapping_category` */

/*Table structure for table `b_product_stock_unit` */

DROP TABLE IF EXISTS `b_product_stock_unit`;

CREATE TABLE `b_product_stock_unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_corporation_guid` varchar(40) NOT NULL COMMENT '公司別索引',
  `name` varchar(20) NOT NULL COMMENT '單位',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='商品庫存單位';

/*Data for the table `b_product_stock_unit` */

insert  into `b_product_stock_unit`(`id`,`guid`,`b_corporation_guid`,`name`,`is_invalid`,`creator_guid`,`creator_name`,`creator_date`,`modifier_guid`,`modifier_name`,`modifier_date`,`invalid_guid`,`invalid_name`,`invalid_date`) values (1,'052c6126-3c41-11e6-8274-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42','sub_包',1,'7ca53f13-ce02-422c-a755-15ac9c945334','subadmin','2016-06-27 16:27:43','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00');

/*Table structure for table `b_service` */

DROP TABLE IF EXISTS `b_service`;

CREATE TABLE `b_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_service_category_guid` varchar(40) NOT NULL COMMENT '服務類別索引',
  `serial_no` varchar(20) NOT NULL COMMENT '服務代碼',
  `title` varchar(50) NOT NULL COMMENT '服務標題',
  `sort_no` int(11) NOT NULL COMMENT '排序',
  `url` text NOT NULL COMMENT '預設服務連結位置',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`),
  KEY `b_service_category_gui d` (`b_service_category_guid`),
  CONSTRAINT `b_service_ibfk_1` FOREIGN KEY (`b_service_category_guid`) REFERENCES `b_service_category` (`guid`) ON DELETE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='系統服務清單';

/*Data for the table `b_service` */

insert  into `b_service`(`id`,`guid`,`b_service_category_guid`,`serial_no`,`title`,`sort_no`,`url`,`is_invalid`,`creator_guid`,`creator_name`,`creator_date`,`modifier_guid`,`modifier_name`,`modifier_date`,`invalid_guid`,`invalid_name`,`invalid_date`) values (1,'14172c48-2bd9-11e6-8d29-d275b9d5831f','dcc0b982-2bd6-11e6-8d29-d275b9d5831f','001_9','業務人脈系統',1,'http://122.116.238.166:8080/MB_Sociality/sociality/api/menuTree',1,'','','2016-06-06 00:00:00','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(2,'18031350-2bd7-11e6-8d29-d275b9d5831f','dcc0b982-2bd6-11e6-8d29-d275b9d5831f','001_2','客廠管理系統',8,'http://122.116.238.166:8083/rd17/dev_moneyBoss_php/src/backend.php/zh_tw/Customer/Customer/Index',1,'','','2016-06-06 00:00:00','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(3,'2fdb7472-2bd7-11e6-8d29-d275b9d5831f','dcc0b982-2bd6-11e6-8d29-d275b9d5831f','001_3','商品管理系統',7,'http://122.116.238.166:8083/rd17/dev_moneyBoss_php/src/backend.php/zh_tw/Product/Product/Index',1,'','','2016-06-06 00:00:00','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(4,'4bf68732-2bd7-11e6-8d29-d275b9d5831f','dcc0b982-2bd6-11e6-8d29-d275b9d5831f','001_4','庫存管理系統',6,'http://122.116.238.166:8083/rd17/dev_moneyBoss_php/src/backend.php/zh_tw/Inventory/Warehouse/Index',1,'','','2016-06-06 00:00:00','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(5,'64cd150a-2bd7-11e6-8d29-d275b9d5831f','dcc0b982-2bd6-11e6-8d29-d275b9d5831f','001_5','訂單管理系統',5,'http://122.116.238.166:8083/rd17/dev_moneyBoss_php/src/backend.php/zh_tw/Order/Order/Index',1,'','','2016-06-06 00:00:00','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(6,'93bbf20a-2bd7-11e6-8d29-d275b9d5831f','dcc0b982-2bd6-11e6-8d29-d275b9d5831f','001_6','進貨管理系統',4,'http://122.116.238.166:8083/rd17/dev_moneyBoss_php/src/backend.php/zh_tw/Purchase/Purchase/Index',1,'','','2016-06-06 00:00:00','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(7,'a5d36752-2bd7-11e6-8d29-d275b9d5831f','dcc0b982-2bd6-11e6-8d29-d275b9d5831f','001_7','出貨管理系統',3,'http://122.116.238.166:8083/rd17/dev_moneyBoss_php/src/backend.php/zh_tw/Shipments/Shipments/Index',1,'','','2016-06-06 00:00:00','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(8,'dd6dd44a-2bd7-11e6-8d29-d275b9d5831f','dcc0b982-2bd6-11e6-8d29-d275b9d5831f','001_8','EC網站管理系統',2,'http://122.116.238.166:8083/rd17/dev_moneyBoss_php/src/backend.php/zh_tw/Content/Content/Index',1,'','','2016-06-06 00:00:00','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(9,'f73d31aa-2bd6-11e6-8d29-d275b9d5831f','dcc0b982-2bd6-11e6-8d29-d275b9d5831f','001_1','店別管理系統',9,'http://122.116.238.166:8083/rd17/dev_moneyBoss_php/src/backend.php/zh_tw/Corporation/Corporation/Index',1,'','','2016-06-06 00:00:00','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00');

/*Table structure for table `b_service_advance` */

DROP TABLE IF EXISTS `b_service_advance`;

CREATE TABLE `b_service_advance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_service_guid` varchar(40) NOT NULL COMMENT '系統服務索引',
  `serial_no` varchar(20) NOT NULL COMMENT '進階服務代碼',
  `title` varchar(50) NOT NULL COMMENT '進階服務標題',
  `sort_no` int(11) NOT NULL COMMENT '排序',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系統進階服務清單';

/*Data for the table `b_service_advance` */

/*Table structure for table `b_service_category` */

DROP TABLE IF EXISTS `b_service_category`;

CREATE TABLE `b_service_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `serial_no` varchar(20) NOT NULL COMMENT '服務類別代碼',
  `title` varchar(50) NOT NULL COMMENT '服務類別標題',
  `sort_no` int(11) NOT NULL COMMENT '排序',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='系統服務類別';

/*Data for the table `b_service_category` */

insert  into `b_service_category`(`id`,`guid`,`serial_no`,`title`,`sort_no`,`is_invalid`,`creator_guid`,`creator_name`,`creator_date`,`modifier_guid`,`modifier_name`,`modifier_date`,`invalid_guid`,`invalid_name`,`invalid_date`) values (3,'dcc0b982-2bd6-11e6-8d29-d275b9d5831f','001','進銷存',1,1,'系統初始值','系統初始值','2016-06-27 15:32:21','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00');

/*Table structure for table `b_warehouse` */

DROP TABLE IF EXISTS `b_warehouse`;

CREATE TABLE `b_warehouse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_corporation_guid` varchar(40) NOT NULL COMMENT '公司別索引',
  `name` varchar(20) NOT NULL COMMENT '倉庫名稱',
  `serial_no` varchar(20) NOT NULL COMMENT '倉庫編號',
  `is_enable` int(1) NOT NULL DEFAULT '1' COMMENT '是否啟用 1：停用 2：啟用',
  `remark` text NOT NULL COMMENT '備註',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `b_corporation_guid` (`b_corporation_guid`,`serial_no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='倉庫';

/*Data for the table `b_warehouse` */

insert  into `b_warehouse`(`id`,`guid`,`b_corporation_guid`,`name`,`serial_no`,`is_enable`,`remark`,`is_invalid`,`creator_guid`,`creator_name`,`creator_date`,`modifier_guid`,`modifier_name`,`modifier_date`,`invalid_guid`,`invalid_name`,`invalid_date`) values (1,'2a258426-3c41-11e6-8274-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42','sub倉庫1','subwarehouse001',2,'',1,'7ca53f13-ce02-422c-a755-15ac9c945334','subadmin','2016-06-27 16:28:45','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00');

/*Table structure for table `d_advertisement` */

DROP TABLE IF EXISTS `d_advertisement`;

CREATE TABLE `d_advertisement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_corporation_guid` varchar(40) NOT NULL COMMENT '公司別索引',
  `type` int(1) NOT NULL COMMENT '廣告類型',
  `file_path` text NOT NULL COMMENT '檔案路徑',
  `file_name` varchar(50) NOT NULL COMMENT '檔案名稱',
  `link` text NOT NULL COMMENT '連結',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='廣告';

/*Data for the table `d_advertisement` */

insert  into `d_advertisement`(`id`,`guid`,`b_corporation_guid`,`type`,`file_path`,`file_name`,`link`,`is_invalid`,`creator_guid`,`creator_name`,`creator_date`,`modifier_guid`,`modifier_name`,`modifier_date`,`invalid_guid`,`invalid_name`,`invalid_date`) values (1,'2a65d208-3c44-11e6-8274-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42',1,'upload/Advertisement/2a65d208-3c44-11e6-8274-d275b9d5831f/w863h323.jpg','1.jpg','',1,'7ca53f13-ce02-422c-a755-15ac9c945334','subadmin','2016-06-27 16:50:14','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(2,'341aa33c-3c44-11e6-8274-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42',2,'upload/Advertisement/341aa33c-3c44-11e6-8274-d275b9d5831f/w416h63.jpg','3.jpg','',1,'7ca53f13-ce02-422c-a755-15ac9c945334','subadmin','2016-06-27 16:50:31','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(3,'396731de-3c44-11e6-8274-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42',4,'upload/Advertisement/396731de-3c44-11e6-8274-d275b9d5831f/w270h105.jpg','1.jpg','',1,'7ca53f13-ce02-422c-a755-15ac9c945334','subadmin','2016-06-27 16:50:39','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00');

/*Table structure for table `d_carry_item` */

DROP TABLE IF EXISTS `d_carry_item`;

CREATE TABLE `d_carry_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_corporation_guid` varchar(40) NOT NULL COMMENT '公司別索引',
  `d_carry_list_guid` varchar(40) NOT NULL COMMENT '進貨單索引',
  `b_product_guid` varchar(40) NOT NULL COMMENT '商品規格索引',
  `quantity` double NOT NULL COMMENT '進貨數量',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`),
  KEY `d_carry_list_guid` (`d_carry_list_guid`),
  CONSTRAINT `d_carry_item_ibfk_1` FOREIGN KEY (`d_carry_list_guid`) REFERENCES `d_carry_list` (`guid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='進貨明細';

/*Data for the table `d_carry_item` */

insert  into `d_carry_item`(`id`,`guid`,`b_corporation_guid`,`d_carry_list_guid`,`b_product_guid`,`quantity`,`is_invalid`,`creator_guid`,`creator_name`,`creator_date`,`modifier_guid`,`modifier_name`,`modifier_date`,`invalid_guid`,`invalid_name`,`invalid_date`) values (1,'5b26ec3e-3c43-11e6-8274-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42','5b2134c4-3c43-11e6-8274-d275b9d5831f','14fa1102-3c41-11e6-8274-d275b9d5831f',5,1,'7ca53f13-ce02-422c-a755-15ac9c945334','subadmin','2016-06-27 16:44:27','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00');

/*Table structure for table `d_carry_list` */

DROP TABLE IF EXISTS `d_carry_list`;

CREATE TABLE `d_carry_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_corporation_guid` varchar(40) NOT NULL COMMENT '公司別索引',
  `bill_date` date NOT NULL COMMENT '進貨日期',
  `bill_serial_no` varchar(40) NOT NULL COMMENT '進貨單號',
  `b_supplier_guid` varchar(40) NOT NULL COMMENT '客廠索引',
  `b_supplier_branch_guid` varchar(40) NOT NULL COMMENT '客廠店別索引',
  `b_warehouse_guid` varchar(40) NOT NULL COMMENT '進貨倉庫',
  `remark` text NOT NULL COMMENT '備註',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '單據狀態 1：新單據 50：進貨完成',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `bill_serial_no` (`bill_serial_no`,`b_corporation_guid`),
  KEY `b_supplier_guid` (`b_supplier_guid`),
  KEY `b_warehouse_guid` (`b_warehouse_guid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='進貨單';

/*Data for the table `d_carry_list` */

insert  into `d_carry_list`(`id`,`guid`,`b_corporation_guid`,`bill_date`,`bill_serial_no`,`b_supplier_guid`,`b_supplier_branch_guid`,`b_warehouse_guid`,`remark`,`status`,`is_invalid`,`creator_guid`,`creator_name`,`creator_date`,`modifier_guid`,`modifier_name`,`modifier_date`,`invalid_guid`,`invalid_name`,`invalid_date`) values (1,'5b2134c4-3c43-11e6-8274-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42','2016-06-27','subcarry001','d0ea06c0-3c40-11e6-8274-d275b9d5831f','d0f3248a-3c40-11e6-8274-d275b9d5831f','2a258426-3c41-11e6-8274-d275b9d5831f','',50,1,'7ca53f13-ce02-422c-a755-15ac9c945334','subadmin','2016-06-27 16:44:27','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00');

/*Table structure for table `d_carry_return_item` */

DROP TABLE IF EXISTS `d_carry_return_item`;

CREATE TABLE `d_carry_return_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_corporation_guid` varchar(40) NOT NULL COMMENT '公司別索引',
  `d_carry_return_list_guid` varchar(40) NOT NULL COMMENT '進貨退出單索引',
  `b_product_guid` varchar(40) NOT NULL COMMENT '商品索引',
  `quantity` double NOT NULL COMMENT '退出數量',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`),
  KEY `d_carry_return_list_guid` (`d_carry_return_list_guid`),
  CONSTRAINT `d_carry_return_item_ibfk_1` FOREIGN KEY (`d_carry_return_list_guid`) REFERENCES `d_carry_return_list` (`guid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='進貨退出明細';

/*Data for the table `d_carry_return_item` */

insert  into `d_carry_return_item`(`id`,`guid`,`b_corporation_guid`,`d_carry_return_list_guid`,`b_product_guid`,`quantity`,`is_invalid`,`creator_guid`,`creator_name`,`creator_date`,`modifier_guid`,`modifier_name`,`modifier_date`,`invalid_guid`,`invalid_name`,`invalid_date`) values (1,'7714f076-3c43-11e6-8274-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42','7710909e-3c43-11e6-8274-d275b9d5831f','14fa1102-3c41-11e6-8274-d275b9d5831f',20,1,'7ca53f13-ce02-422c-a755-15ac9c945334','subadmin','2016-06-27 16:45:13','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00');

/*Table structure for table `d_carry_return_list` */

DROP TABLE IF EXISTS `d_carry_return_list`;

CREATE TABLE `d_carry_return_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_corporation_guid` varchar(40) NOT NULL COMMENT '公司別索引',
  `bill_date` date NOT NULL COMMENT '進貨退出日期',
  `bill_serial_no` varchar(40) NOT NULL COMMENT '進貨退出單號',
  `b_supplier_guid` varchar(40) NOT NULL COMMENT '客廠索引',
  `b_supplier_branch_guid` varchar(40) NOT NULL COMMENT '客廠店別索引',
  `b_warehouse_guid` varchar(40) NOT NULL COMMENT '進貨退出貨倉庫',
  `remark` text NOT NULL COMMENT '備註',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '轉出狀態 1：新單據 50：退出完成',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `bill_serial_no` (`bill_serial_no`,`b_corporation_guid`),
  KEY `b_supplier_guid` (`b_supplier_guid`),
  KEY `b_warehouse_guid` (`b_warehouse_guid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='進貨退出單';

/*Data for the table `d_carry_return_list` */

insert  into `d_carry_return_list`(`id`,`guid`,`b_corporation_guid`,`bill_date`,`bill_serial_no`,`b_supplier_guid`,`b_supplier_branch_guid`,`b_warehouse_guid`,`remark`,`status`,`is_invalid`,`creator_guid`,`creator_name`,`creator_date`,`modifier_guid`,`modifier_name`,`modifier_date`,`invalid_guid`,`invalid_name`,`invalid_date`) values (1,'7710909e-3c43-11e6-8274-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42','2016-06-27','subre001','d0ea06c0-3c40-11e6-8274-d275b9d5831f','d0f3248a-3c40-11e6-8274-d275b9d5831f','2a258426-3c41-11e6-8274-d275b9d5831f','',50,1,'7ca53f13-ce02-422c-a755-15ac9c945334','subadmin','2016-06-27 16:45:13','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00');

/*Table structure for table `d_enterprise_service` */

DROP TABLE IF EXISTS `d_enterprise_service`;

CREATE TABLE `d_enterprise_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_service_guid` varchar(40) NOT NULL COMMENT '系統服務索引',
  `b_enterprise_guid` varchar(40) NOT NULL COMMENT '企業帳號索引',
  `url` text NOT NULL COMMENT '服務連結位置',
  `start_time` datetime NOT NULL COMMENT '服務啟用日期',
  `end_time` datetime NOT NULL COMMENT '服務停用日期',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`),
  KEY `b_service_guid` (`b_service_guid`),
  KEY `b_enterprise_guid` (`b_enterprise_guid`),
  CONSTRAINT `d_enterprise_service_ibfk_1` FOREIGN KEY (`b_service_guid`) REFERENCES `b_service` (`guid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `d_enterprise_service_ibfk_2` FOREIGN KEY (`b_enterprise_guid`) REFERENCES `b_enterprise` (`guid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COMMENT='企業帳號開啟服務';

/*Data for the table `d_enterprise_service` */

insert  into `d_enterprise_service`(`id`,`guid`,`b_service_guid`,`b_enterprise_guid`,`url`,`start_time`,`end_time`,`is_invalid`,`creator_guid`,`creator_name`,`creator_date`,`modifier_guid`,`modifier_name`,`modifier_date`,`invalid_guid`,`invalid_name`,`invalid_date`) values (26,'1a10bca3-380b-47ee-82b4-cb042c56a002','dd6dd44a-2bd7-11e6-8d29-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42','','2016-06-07 16:27:41','2016-06-07 16:27:41',1,'系統初始值','系統初始值','2016-06-27 15:32:21','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(25,'1ef5c309-c75a-4c3f-b9ac-32d4cce6e329','a5d36752-2bd7-11e6-8d29-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42','','2016-06-07 16:27:41','2016-06-07 16:27:41',1,'系統初始值','系統初始值','2016-06-27 15:32:21','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(29,'2c6996c0-584f-4133-b108-dced7a883c84','18031350-2bd7-11e6-8d29-d275b9d5831f','3f9c7e9b-56e0-4d0f-9372-156510c99aff','','2016-06-27 16:46:34','2016-06-27 16:46:34',1,'2c6996c0-584f-4133-b108-dced7a883c84','Adam','2016-06-27 16:46:34','','','2016-06-27 16:46:34','','','2016-06-27 16:46:34'),(30,'57364014-8e68-4b61-b0aa-da44970e36e5','2fdb7472-2bd7-11e6-8d29-d275b9d5831f','3f9c7e9b-56e0-4d0f-9372-156510c99aff','','2016-06-27 16:46:34','2016-06-27 16:46:34',1,'57364014-8e68-4b61-b0aa-da44970e36e5','Adam','2016-06-27 16:46:34','','','2016-06-27 16:46:34','','','2016-06-27 16:46:34'),(24,'87bbd362-fae7-4423-9831-6b5713ffe64d','93bbf20a-2bd7-11e6-8d29-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42','','2016-06-07 16:27:39','2016-06-07 16:27:39',1,'系統初始值','系統初始值','2016-06-27 15:32:21','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(23,'88e5ce78-eaf6-4fcc-a6fc-2d343584b45b','64cd150a-2bd7-11e6-8d29-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42','','2016-06-07 16:27:38','2016-06-07 16:27:38',1,'系統初始值','系統初始值','2016-06-27 15:32:21','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(19,'976318b5-cf7d-4e5a-be57-760ef8ec47ca','14172c48-2bd9-11e6-8d29-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42','','2016-06-07 16:27:38','2016-06-07 16:27:38',1,'系統初始值','系統初始值','2016-06-27 15:32:21','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(36,'b1633471-f599-4dc0-b9d5-2e06838c1813','f73d31aa-2bd6-11e6-8d29-d275b9d5831f','3f9c7e9b-56e0-4d0f-9372-156510c99aff','','2016-06-27 16:46:34','2016-06-27 16:46:34',1,'b1633471-f599-4dc0-b9d5-2e06838c1813','Adam','2016-06-27 16:46:34','','','2016-06-27 16:46:34','','','2016-06-27 16:46:34'),(21,'b4297215-98ed-4a2d-a87f-beb4514dd7e0','2fdb7472-2bd7-11e6-8d29-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42','','2016-06-07 16:27:38','2016-06-07 16:27:38',1,'系統初始值','系統初始值','2016-06-27 15:32:21','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(22,'bdfb5b8c-99a9-46a4-8b94-2d89310d2784','4bf68732-2bd7-11e6-8d29-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42','','2016-06-07 16:27:38','2016-06-07 16:27:38',1,'系統初始值','系統初始值','2016-06-27 15:32:21','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(33,'c7bca6f2-21b7-4b7c-9f32-fef577355a80','93bbf20a-2bd7-11e6-8d29-d275b9d5831f','3f9c7e9b-56e0-4d0f-9372-156510c99aff','','2016-06-27 16:46:34','2016-06-27 16:46:34',1,'c7bca6f2-21b7-4b7c-9f32-fef577355a80','Adam','2016-06-27 16:46:34','','','2016-06-27 16:46:34','','','2016-06-27 16:46:34'),(31,'c99bb75b-f030-4ae0-a9ea-744aba55da37','4bf68732-2bd7-11e6-8d29-d275b9d5831f','3f9c7e9b-56e0-4d0f-9372-156510c99aff','','2016-06-27 16:46:34','2016-06-27 16:46:34',1,'c99bb75b-f030-4ae0-a9ea-744aba55da37','Adam','2016-06-27 16:46:34','','','2016-06-27 16:46:34','','','2016-06-27 16:46:34'),(35,'dce0d093-8758-4064-aede-9401eb3300be','dd6dd44a-2bd7-11e6-8d29-d275b9d5831f','3f9c7e9b-56e0-4d0f-9372-156510c99aff','','2016-06-27 16:46:34','2016-06-27 16:46:34',1,'dce0d093-8758-4064-aede-9401eb3300be','Adam','2016-06-27 16:46:34','','','2016-06-27 16:46:34','','','2016-06-27 16:46:34'),(20,'e4865ec7-d6c6-4675-a5c6-3f16203b6186','18031350-2bd7-11e6-8d29-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42','','2016-06-07 16:27:38','2016-06-07 16:27:38',1,'系統初始值','系統初始值','2016-06-27 15:32:21','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(34,'ed0f0f0f-308a-4b2a-91bf-b6b44029a8ff','a5d36752-2bd7-11e6-8d29-d275b9d5831f','3f9c7e9b-56e0-4d0f-9372-156510c99aff','','2016-06-27 16:46:34','2016-06-27 16:46:34',1,'ed0f0f0f-308a-4b2a-91bf-b6b44029a8ff','Adam','2016-06-27 16:46:34','','','2016-06-27 16:46:34','','','2016-06-27 16:46:34'),(32,'f34965d5-b799-4db2-b0da-caf8aa355304','64cd150a-2bd7-11e6-8d29-d275b9d5831f','3f9c7e9b-56e0-4d0f-9372-156510c99aff','','2016-06-27 16:46:34','2016-06-27 16:46:34',1,'f34965d5-b799-4db2-b0da-caf8aa355304','Adam','2016-06-27 16:46:34','','','2016-06-27 16:46:34','','','2016-06-27 16:46:34'),(28,'f72c3c98-9312-4110-8ef2-033bbbeff626','14172c48-2bd9-11e6-8d29-d275b9d5831f','3f9c7e9b-56e0-4d0f-9372-156510c99aff','','2016-06-27 16:46:34','2016-06-27 16:46:34',1,'f72c3c98-9312-4110-8ef2-033bbbeff626','Adam','2016-06-27 16:46:34','','','2016-06-27 16:46:34','','','2016-06-27 16:46:34'),(27,'fa8a600c-852a-4dc9-b121-e1d1b5a29200','f73d31aa-2bd6-11e6-8d29-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42','','2016-06-07 16:27:41','2016-06-07 16:27:41',1,'系統初始值','系統初始值','2016-06-27 15:32:21','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00');

/*Table structure for table `d_enterprise_service_advance` */

DROP TABLE IF EXISTS `d_enterprise_service_advance`;

CREATE TABLE `d_enterprise_service_advance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_service_advance_gui d` varchar(40) NOT NULL COMMENT '系統進階服務索引',
  `b_enterprise_guid` varchar(40) NOT NULL COMMENT '企業帳號索引',
  `start_time` datetime NOT NULL COMMENT '服務啟用日期',
  `end_time` datetime NOT NULL COMMENT '服務停用日期',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`),
  KEY `b_service_advance_gui d` (`b_service_advance_gui d`),
  KEY `b_enterprise_guid` (`b_enterprise_guid`),
  CONSTRAINT `d_enterprise_service_advance_ibfk_1` FOREIGN KEY (`b_service_advance_gui d`) REFERENCES `b_service_advance` (`guid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `d_enterprise_service_advance_ibfk_2` FOREIGN KEY (`b_enterprise_guid`) REFERENCES `b_enterprise` (`guid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='企業帳號開啟進階服務';

/*Data for the table `d_enterprise_service_advance` */

/*Table structure for table `d_enterprise_try_out` */

DROP TABLE IF EXISTS `d_enterprise_try_out`;

CREATE TABLE `d_enterprise_try_out` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_enterprise_guid` varchar(40) NOT NULL COMMENT '企業帳號索引',
  `start_date` date NOT NULL DEFAULT '1988-12-31' COMMENT '試用開始日期',
  `end_date` date NOT NULL DEFAULT '1988-12-31' COMMENT '試用結束日期',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`),
  KEY `b_enterprise_guid` (`b_enterprise_guid`),
  CONSTRAINT `d_enterprise_try_out_ibfk_1` FOREIGN KEY (`b_enterprise_guid`) REFERENCES `b_enterprise` (`guid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='企業帳號試用區間';

/*Data for the table `d_enterprise_try_out` */

/*Table structure for table `d_html_editors` */

DROP TABLE IF EXISTS `d_html_editors`;

CREATE TABLE `d_html_editors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_corporation_guid` varchar(40) NOT NULL COMMENT '公司別索引',
  `type` int(1) NOT NULL COMMENT '說明類型',
  `content` text NOT NULL COMMENT '內容',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `type` (`type`,`b_corporation_guid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='網站公告';

/*Data for the table `d_html_editors` */

insert  into `d_html_editors`(`id`,`guid`,`b_corporation_guid`,`type`,`content`,`is_invalid`,`creator_guid`,`creator_name`,`creator_date`,`modifier_guid`,`modifier_name`,`modifier_date`,`invalid_guid`,`invalid_name`,`invalid_date`) values (1,'dc44e6b8-3c43-11e6-8274-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42',1,'<p>sub關於我們</p>\r\n',1,'7ca53f13-ce02-422c-a755-15ac9c945334','subadmin','2016-06-27 16:48:03','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(2,'e7ee9040-3c43-11e6-8274-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42',2,'<p>sub購物說明</p>\r\n\r\n<p>&nbsp;</p>\r\n',1,'7ca53f13-ce02-422c-a755-15ac9c945334','subadmin','2016-06-27 16:48:23','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(3,'f5d719c0-3c43-11e6-8274-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42',3,'<p>sub隱私權</p>\r\n',1,'7ca53f13-ce02-422c-a755-15ac9c945334','subadmin','2016-06-27 16:48:46','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00');

/*Table structure for table `d_inventory_documents_item` */

DROP TABLE IF EXISTS `d_inventory_documents_item`;

CREATE TABLE `d_inventory_documents_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_corporation_guid` varchar(40) NOT NULL COMMENT '公司別索引',
  `d_inventory_list_guid` varchar(40) NOT NULL COMMENT '盤點單索引',
  `b_stock_guid` varchar(40) DEFAULT NULL COMMENT '庫存索引',
  `b_product_specification_guid` varchar(40) NOT NULL COMMENT '商品規格索引',
  `origin_quantity` double NOT NULL COMMENT '帳上數量',
  `inventory_quantity` double NOT NULL COMMENT '盤點數量',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`),
  KEY `d_inventory_list_guid` (`d_inventory_list_guid`),
  CONSTRAINT `d_inventory_documents_item_ibfk_1` FOREIGN KEY (`d_inventory_list_guid`) REFERENCES `d_inventory_documents_list` (`guid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='盤點明細';

/*Data for the table `d_inventory_documents_item` */

insert  into `d_inventory_documents_item`(`id`,`guid`,`b_corporation_guid`,`d_inventory_list_guid`,`b_stock_guid`,`b_product_specification_guid`,`origin_quantity`,`inventory_quantity`,`is_invalid`,`creator_guid`,`creator_name`,`creator_date`,`modifier_guid`,`modifier_name`,`modifier_date`,`invalid_guid`,`invalid_name`,`invalid_date`) values (1,'43973aee-3c41-11e6-8274-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42','4394a4b4-3c41-11e6-8274-d275b9d5831f',NULL,'',0,0,1,'7ca53f13-ce02-422c-a755-15ac9c945334','subadmin','2016-06-27 16:29:28','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00');

/*Table structure for table `d_inventory_documents_list` */

DROP TABLE IF EXISTS `d_inventory_documents_list`;

CREATE TABLE `d_inventory_documents_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_corporation_guid` varchar(40) NOT NULL COMMENT '公司別索引',
  `bill_date` date NOT NULL COMMENT '盤點日期',
  `bill_serial_no` varchar(40) NOT NULL COMMENT '盤點單號',
  `b_warehouse_guid` varchar(40) NOT NULL COMMENT '倉庫索引',
  `remark` text NOT NULL COMMENT '備註',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '轉出狀態 1：待處理 50：盤點完成',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `b_corporation_guid` (`b_corporation_guid`,`bill_serial_no`),
  KEY `b_warehouse_guid` (`b_warehouse_guid`),
  CONSTRAINT `d_inventory_documents_list_ibfk_1` FOREIGN KEY (`b_warehouse_guid`) REFERENCES `b_warehouse` (`guid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='盤點單';

/*Data for the table `d_inventory_documents_list` */

insert  into `d_inventory_documents_list`(`id`,`guid`,`b_corporation_guid`,`bill_date`,`bill_serial_no`,`b_warehouse_guid`,`remark`,`status`,`is_invalid`,`creator_guid`,`creator_name`,`creator_date`,`modifier_guid`,`modifier_name`,`modifier_date`,`invalid_guid`,`invalid_name`,`invalid_date`) values (1,'4394a4b4-3c41-11e6-8274-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42','2016-06-27','sub001','2a258426-3c41-11e6-8274-d275b9d5831f','',50,1,'7ca53f13-ce02-422c-a755-15ac9c945334','subadmin','2016-06-27 16:29:28','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00');

/*Table structure for table `d_order` */

DROP TABLE IF EXISTS `d_order`;

CREATE TABLE `d_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_corporation_guid` varchar(40) NOT NULL COMMENT '公司別索引',
  `type` int(2) NOT NULL DEFAULT '1' COMMENT '訂單類型 EnumOrderType',
  `b_member_guid` varchar(36) NOT NULL COMMENT '相關會員',
  `serial_no` varchar(25) NOT NULL COMMENT '訂單編號',
  `date` date NOT NULL COMMENT '訂單日期',
  `shipping_costs` double NOT NULL COMMENT '運費',
  `fee` double NOT NULL COMMENT '手續費',
  `total` double NOT NULL COMMENT '訂單總計',
  `b_cash_flow_guid` varchar(36) NOT NULL COMMENT '相關金流',
  `cash_flow_title` varchar(50) NOT NULL COMMENT '金流名稱',
  `cash_flow_payment_method` int(2) NOT NULL DEFAULT '1' COMMENT '金流付款方式 EnumOrderPaymentMethod',
  `cash_flow_trade_code` varchar(50) NOT NULL COMMENT '交易代碼',
  `confirm_member_payment` int(2) NOT NULL DEFAULT '1' COMMENT '確認會員付款 EnumOrderConfirmMemberPayment',
  `b_logistics_guid` varchar(36) NOT NULL COMMENT '相關物流',
  `logistics_title` varchar(50) NOT NULL COMMENT '物流名稱',
  `logistics_serial` varchar(30) NOT NULL COMMENT '物流單號',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '訂單狀態 EnumOrderStatus',
  `cancel_remark` text NOT NULL COMMENT '取消訂單備註',
  `remark` text NOT NULL COMMENT '備註',
  `recipient_name` varchar(20) NOT NULL COMMENT '收件人姓名',
  `recipient_email` varchar(255) NOT NULL COMMENT '收件人信箱',
  `recipient_phone1` varchar(20) NOT NULL COMMENT '收件人聯絡電話(日)',
  `recipient_phone2` varchar(20) NOT NULL COMMENT '收件人聯絡電話(夜)',
  `recipient_cellphone` varchar(20) NOT NULL COMMENT '收件人行動電話',
  `recipient_address` text NOT NULL COMMENT '收件地址',
  `delivery_time` int(2) NOT NULL DEFAULT '1' COMMENT '送達時間 EnumOrderDeliveryTime',
  `invoice_type` int(2) NOT NULL DEFAULT '1' COMMENT '發票類型 EnumOrderInvoiceType',
  `invoice_uniform_numbers` varchar(10) NOT NULL COMMENT '發票統編',
  `invoice_title` varchar(255) NOT NULL COMMENT '發票抬頭',
  `invoice_address` text NOT NULL COMMENT '發票地址',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`),
  KEY `b_cash_flow_guid` (`b_cash_flow_guid`),
  KEY `b_member_guid` (`b_member_guid`),
  KEY `b_logistics_guid` (`b_logistics_guid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='訂單';

/*Data for the table `d_order` */

insert  into `d_order`(`id`,`guid`,`b_corporation_guid`,`type`,`b_member_guid`,`serial_no`,`date`,`shipping_costs`,`fee`,`total`,`b_cash_flow_guid`,`cash_flow_title`,`cash_flow_payment_method`,`cash_flow_trade_code`,`confirm_member_payment`,`b_logistics_guid`,`logistics_title`,`logistics_serial`,`status`,`cancel_remark`,`remark`,`recipient_name`,`recipient_email`,`recipient_phone1`,`recipient_phone2`,`recipient_cellphone`,`recipient_address`,`delivery_time`,`invoice_type`,`invoice_uniform_numbers`,`invoice_title`,`invoice_address`,`is_invalid`,`creator_guid`,`creator_name`,`creator_date`,`modifier_guid`,`modifier_name`,`modifier_date`,`invalid_guid`,`invalid_name`,`invalid_date`) values (1,'dbf0ca1c-3c41-11e6-8274-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42',1,'b28dccd8-3c37-11e6-8274-d275b9d5831f','sub001','2016-06-27',100,20,140,'b28df7a8-3c37-11e6-8274-d275b9d5831f','線上刷卡',1,'',1,'b28e0e78-3c37-11e6-8274-d275b9d5831f','黑貓宅急便','',1,'','','rd17','a809252002@gmail.com','+886988955980','+886988955980','+886988955980','和平西路三段34巷4號2樓',1,1,'','','和平西路三段34巷4號2樓',1,'7ca53f13-ce02-422c-a755-15ac9c945334','subadmin','2016-06-27 16:33:44','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00');

/*Table structure for table `d_order_item` */

DROP TABLE IF EXISTS `d_order_item`;

CREATE TABLE `d_order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_corporation_guid` varchar(40) NOT NULL COMMENT '公司別索引',
  `d_order_guid` varchar(36) NOT NULL COMMENT '相關訂單',
  `b_product_guid` varchar(36) NOT NULL COMMENT '相關商品',
  `price` double NOT NULL COMMENT '單價',
  `quantity` double NOT NULL COMMENT '數量',
  `subtotal` double NOT NULL COMMENT '小計',
  `remark` text NOT NULL COMMENT '備註',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`),
  KEY `d_order_guid` (`d_order_guid`),
  KEY `b_product_guid` (`b_product_guid`),
  CONSTRAINT `d_order_item_ibfk_1` FOREIGN KEY (`d_order_guid`) REFERENCES `d_order` (`guid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='訂單明細';

/*Data for the table `d_order_item` */

insert  into `d_order_item`(`id`,`guid`,`b_corporation_guid`,`d_order_guid`,`b_product_guid`,`price`,`quantity`,`subtotal`,`remark`,`is_invalid`,`creator_guid`,`creator_name`,`creator_date`,`modifier_guid`,`modifier_name`,`modifier_date`,`invalid_guid`,`invalid_name`,`invalid_date`) values (1,'dbf244dc-3c41-11e6-8274-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42','dbf0ca1c-3c41-11e6-8274-d275b9d5831f','14fa1102-3c41-11e6-8274-d275b9d5831f',20,1,20,'',1,'7ca53f13-ce02-422c-a755-15ac9c945334','subadmin','2016-06-27 16:33:44','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00');

/*Table structure for table `d_order_yahoo` */

DROP TABLE IF EXISTS `d_order_yahoo`;

CREATE TABLE `d_order_yahoo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_corporation_guid` varchar(40) NOT NULL COMMENT '公司別索引',
  `product_serial_no` varchar(50) NOT NULL COMMENT '商品編號(庫存商品)',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '處理狀態 EnumOrderYahooStatus',
  `failure_reasons_last` varchar(255) NOT NULL COMMENT '失敗原因(最後一次)',
  `failure_reasons` text NOT NULL COMMENT '失敗原因(全部)',
  `yahoo_order_datetime` varchar(255) NOT NULL COMMENT '訂單成立時間',
  `yahoo_payment_datetime` varchar(255) NOT NULL COMMENT '付款時間',
  `yahoo_order_serial_no` varchar(255) NOT NULL COMMENT '訂單編號',
  `yahoo_easy_payment_bill_serial_no` varchar(255) NOT NULL COMMENT '輕鬆付帳單編號',
  `yahoo_product_serial_no` varchar(255) NOT NULL COMMENT '商品編號',
  `yahoo_product_name` varchar(255) NOT NULL COMMENT '商品名稱',
  `yahoo_goods_serial_no1` varchar(255) NOT NULL COMMENT '第一組貨號',
  `yahoo_goods_serial_no2` varchar(255) NOT NULL COMMENT '第二組貨號',
  `yahoo_product_barcode` varchar(255) NOT NULL COMMENT '商品條碼',
  `yahoo_product_specification1` varchar(255) NOT NULL COMMENT '規格1',
  `yahoo_product_specification2` varchar(255) NOT NULL COMMENT '規格2',
  `yahoo_buyer_auction_code` varchar(255) NOT NULL COMMENT '買家拍賣代號',
  `yahoo_buyer_nickname` varchar(255) NOT NULL COMMENT '買家暱稱',
  `yahoo_buy_amount` varchar(255) NOT NULL COMMENT '購買金額',
  `yahoo_buy_quantity` varchar(255) NOT NULL COMMENT '購買數量',
  `yahoo_buy_total` varchar(255) NOT NULL COMMENT '購買總額',
  `yahoo_discount_total` varchar(255) NOT NULL COMMENT '折扣活動總金額',
  `yahoo_original_shipping_costs` varchar(255) NOT NULL COMMENT '原運費',
  `yahoo_shipping_costs` varchar(255) NOT NULL COMMENT '運費',
  `yahoo_receivable_amount` varchar(255) NOT NULL COMMENT '應收金額',
  `yahoo_actually_received_amount` varchar(255) NOT NULL COMMENT '實收金額',
  `yahoo_pickup_name` varchar(255) NOT NULL COMMENT '取件人姓名',
  `yahoo_phone` varchar(255) NOT NULL COMMENT '電話',
  `yahoo_cellphone` varchar(255) NOT NULL COMMENT '手機',
  `yahoo_zip_code` varchar(255) NOT NULL COMMENT '郵遞區號',
  `yahoo_recipient_address` varchar(255) NOT NULL COMMENT '收件人住址',
  `yahoo_invoice_uniform_numbers` varchar(255) NOT NULL COMMENT '發票統編',
  `yahoo_invoice_title` varchar(255) NOT NULL COMMENT '發票抬頭',
  `yahoo_invoice_address` varchar(255) NOT NULL COMMENT '發票寄送地址',
  `yahoo_payment_method` varchar(255) NOT NULL COMMENT '付款方式',
  `yahoo_shipping_method` varchar(255) NOT NULL COMMENT '運送方式',
  `yahoo_ship_date` varchar(255) NOT NULL COMMENT '出貨日期',
  `yahoo_logistics_serial` varchar(255) NOT NULL COMMENT '物流查件單號',
  `yahoo_buyer_pickup_store_no` varchar(255) NOT NULL COMMENT '買家取貨門市店號',
  `yahoo_buyer_pickup_store_name` varchar(255) NOT NULL COMMENT '買家取貨門市名稱',
  `yahoo_order_status` varchar(255) NOT NULL COMMENT '訂單狀態',
  `yahoo_payment_status` varchar(255) NOT NULL COMMENT '付款狀態',
  `yahoo_fee_balance` varchar(255) NOT NULL COMMENT '多退少補',
  `yahoo_ship_status` varchar(255) NOT NULL COMMENT '出貨狀態',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='Yahoo訂單';

/*Data for the table `d_order_yahoo` */

insert  into `d_order_yahoo`(`id`,`guid`,`b_corporation_guid`,`product_serial_no`,`status`,`failure_reasons_last`,`failure_reasons`,`yahoo_order_datetime`,`yahoo_payment_datetime`,`yahoo_order_serial_no`,`yahoo_easy_payment_bill_serial_no`,`yahoo_product_serial_no`,`yahoo_product_name`,`yahoo_goods_serial_no1`,`yahoo_goods_serial_no2`,`yahoo_product_barcode`,`yahoo_product_specification1`,`yahoo_product_specification2`,`yahoo_buyer_auction_code`,`yahoo_buyer_nickname`,`yahoo_buy_amount`,`yahoo_buy_quantity`,`yahoo_buy_total`,`yahoo_discount_total`,`yahoo_original_shipping_costs`,`yahoo_shipping_costs`,`yahoo_receivable_amount`,`yahoo_actually_received_amount`,`yahoo_pickup_name`,`yahoo_phone`,`yahoo_cellphone`,`yahoo_zip_code`,`yahoo_recipient_address`,`yahoo_invoice_uniform_numbers`,`yahoo_invoice_title`,`yahoo_invoice_address`,`yahoo_payment_method`,`yahoo_shipping_method`,`yahoo_ship_date`,`yahoo_logistics_serial`,`yahoo_buyer_pickup_store_no`,`yahoo_buyer_pickup_store_name`,`yahoo_order_status`,`yahoo_payment_status`,`yahoo_fee_balance`,`yahoo_ship_status`,`is_invalid`,`creator_guid`,`creator_name`,`creator_date`,`modifier_guid`,`modifier_name`,`modifier_date`,`invalid_guid`,`invalid_name`,`invalid_date`) values (1,'eb62f452-3c41-11e6-8274-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42','',3,'商品編號 不可為空白.','2016-06-27 16:34:10 商品編號 不可為空白.','2016/06/01 21:46:11','','10001062030911','B070322696','100217526070','淑女遮陽裙 - 透氣防曬 - 全館399免運費 - 專售台灣製造 - 全部商品價格含稅 § My咕咚 - 企業福利社 §','','','','---,---','','Y3597037327','Y3597037327','75.00','1','75.00','0.00','70.00','70.00','145.00','','黃*涵','','0953****2','','','','','','7-ELEVEN取貨付款','7-ELEVEN取貨付款','','','1****0','瑞****市','已取消','尚未付款','','尚未出貨',1,'7ca53f13-ce02-422c-a755-15ac9c945334','subadmin','2016-06-27 16:34:10','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(2,'eb6499e2-3c41-11e6-8274-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42','',3,'商品編號 不可為空白.','2016-06-27 16:34:10 商品編號 不可為空白.','2016/06/01 14:35:43','','10001243410772','B070298347','100216566769','辦公桌墊 - A4切割墊 - 全館399免運費 - 專售台灣製造 - 全部商品價格含稅 § My咕咚 - 企業福利社 §','','','','---,---','','Y7390886181','鈴雅 曾','20.00','1','20.00','0.00','70.00','70.00','90.00','','曾鈴雅','','0930065336','','','','','','全家取貨付款','全家取貨付款','2016/06/02 16:54:35','0001633714857','0****2','全****店','有效','尚未付款','','出貨檔上傳成功，待寄貨',1,'7ca53f13-ce02-422c-a755-15ac9c945334','subadmin','2016-06-27 16:34:10','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(3,'eb6634b4-3c41-11e6-8274-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42','',3,'商品編號 不可為空白.','2016-06-27 16:34:10 商品編號 不可為空白.','2016/06/01 14:34:07','','10000868190471','B070298240','100216555628','環保垃圾袋5入一包 - 全館399免運費 - 專售台灣製造 - 全部商品價格含稅 § My咕咚 - 企業福利社 §','','','','---,---','','Y7390886181','鈴雅 曾','35.00','1','35.00','0.00','70.00','70.00','105.00','','曾鈴雅','','0930065336','','','','','','7-ELEVEN取貨付款','7-ELEVEN取貨付款','2016/06/02 16:53:31','E85439240827','8****9','育****市','有效','尚未付款','','出貨檔上傳成功，待寄貨',1,'7ca53f13-ce02-422c-a755-15ac9c945334','subadmin','2016-06-27 16:34:10','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(4,'eb676258-3c41-11e6-8274-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42','',3,'商品編號 不可為空白.','2016-06-27 16:34:10 商品編號 不可為空白.','2016/05/26 11:55:13','','10000433540812','B069959392','100212051140','錢老闆微型企業雲端平台','','','','---,---','','Y7390886181','鈴雅 曾','5.00','2','10.00','0.00','0.00','0.00','10.00','','','','','404','','','','','輕鬆付實體ATM','郵寄掛號','','','','','已取消','尚未付款','','尚未出貨',1,'7ca53f13-ce02-422c-a755-15ac9c945334','subadmin','2016-06-27 16:34:10','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(5,'eb6a793e-3c41-11e6-8274-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42','',3,'商品編號 不可為空白.','2016-06-27 16:34:10 商品編號 不可為空白.','2016/05/25 15:07:27','','10000656150433','B069911169','100211146963','錢老闆微型企業雲端平台','123','456','4713760048392','---,---','','Y7390886181','鈴雅 曾','5.00','1','5.00','0.00','25.00','25.00','30.00','','','','','404','','','','','輕鬆付實體ATM','郵寄掛號','','','','','已取消','尚未付款','','尚未出貨',1,'7ca53f13-ce02-422c-a755-15ac9c945334','subadmin','2016-06-27 16:34:10','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(6,'eb6bd658-3c41-11e6-8274-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42','',3,'商品編號 不可為空白.','2016-06-27 16:34:10 商品編號 不可為空白.','2016/05/19 17:00:13','2016/05/19 17:01:05','10001217170847','B069580822','100205836327','錢老闆微型企業雲端平台','','','123','白色','XL','Y7390886181','鈴雅 曾','50.00','1','50.00','0.00','0.00','0.00','50.00','50','曾*雅','0422****8','0930****6','','-','','','','輕鬆付信用卡','面交/自取/不寄送','2016/05/20 09:02:01','','','','有效','已付款','','已出貨',1,'7ca53f13-ce02-422c-a755-15ac9c945334','subadmin','2016-06-27 16:34:10','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00');

/*Table structure for table `d_purchase_item` */

DROP TABLE IF EXISTS `d_purchase_item`;

CREATE TABLE `d_purchase_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_corporation_guid` varchar(40) NOT NULL COMMENT '公司別索引',
  `d_purchase_list_guid` varchar(40) NOT NULL COMMENT '採購單索引',
  `b_product_guid` varchar(40) NOT NULL COMMENT '商品規格索引',
  `quantity` double NOT NULL COMMENT '採購數量',
  `carry_status` int(2) NOT NULL DEFAULT '1' COMMENT '進貨狀態 1：進貨中 50：進貨完成 60：強制結案',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`),
  KEY `d_purchase_list_guid` (`d_purchase_list_guid`),
  CONSTRAINT `d_purchase_item_ibfk_1` FOREIGN KEY (`d_purchase_list_guid`) REFERENCES `d_purchase_list` (`guid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='採購明細';

/*Data for the table `d_purchase_item` */

insert  into `d_purchase_item`(`id`,`guid`,`b_corporation_guid`,`d_purchase_list_guid`,`b_product_guid`,`quantity`,`carry_status`,`is_invalid`,`creator_guid`,`creator_name`,`creator_date`,`modifier_guid`,`modifier_name`,`modifier_date`,`invalid_guid`,`invalid_name`,`invalid_date`) values (1,'332bbe9e-3c43-11e6-8274-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42','3328eae8-3c43-11e6-8274-d275b9d5831f','14fa1102-3c41-11e6-8274-d275b9d5831f',1,1,1,'7ca53f13-ce02-422c-a755-15ac9c945334','subadmin','2016-06-27 16:43:20','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00');

/*Table structure for table `d_purchase_item_carry_history` */

DROP TABLE IF EXISTS `d_purchase_item_carry_history`;

CREATE TABLE `d_purchase_item_carry_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_corporation_guid` varchar(40) NOT NULL COMMENT '公司別索引',
  `d_purchase_item_guid` varchar(40) NOT NULL COMMENT '採購明細索引',
  `d_carry_item_guid` varchar(40) NOT NULL COMMENT '進貨明細索引',
  `quantity` double NOT NULL COMMENT '進貨數量',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`),
  KEY `d_purchase_item_guid` (`d_purchase_item_guid`),
  CONSTRAINT `d_purchase_item_carry_history_ibfk_1` FOREIGN KEY (`d_purchase_item_guid`) REFERENCES `d_purchase_item` (`guid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='採購進貨記錄明細';

/*Data for the table `d_purchase_item_carry_history` */

/*Table structure for table `d_purchase_list` */

DROP TABLE IF EXISTS `d_purchase_list`;

CREATE TABLE `d_purchase_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_corporation_guid` varchar(40) NOT NULL COMMENT '公司別索引',
  `bill_date` date NOT NULL COMMENT '採購日期',
  `bill_serial_no` varchar(40) NOT NULL COMMENT '採購單號',
  `b_supplier_guid` varchar(40) NOT NULL COMMENT '客廠索引',
  `b_supplier_branch_guid` varchar(40) NOT NULL COMMENT '客廠店別索引',
  `remark` text NOT NULL COMMENT '備註',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '採購狀態 1：新單據 50：採購完成',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `bill_serial_no` (`bill_serial_no`,`b_corporation_guid`),
  KEY `b_supplier_guid` (`b_supplier_guid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='採購單';

/*Data for the table `d_purchase_list` */

insert  into `d_purchase_list`(`id`,`guid`,`b_corporation_guid`,`bill_date`,`bill_serial_no`,`b_supplier_guid`,`b_supplier_branch_guid`,`remark`,`status`,`is_invalid`,`creator_guid`,`creator_name`,`creator_date`,`modifier_guid`,`modifier_name`,`modifier_date`,`invalid_guid`,`invalid_name`,`invalid_date`) values (1,'3328eae8-3c43-11e6-8274-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42','2016-06-27','subpur001','d0ea06c0-3c40-11e6-8274-d275b9d5831f','d0f3248a-3c40-11e6-8274-d275b9d5831f','',50,1,'7ca53f13-ce02-422c-a755-15ac9c945334','subadmin','2016-06-27 16:43:20','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00');

/*Table structure for table `d_shipments_item` */

DROP TABLE IF EXISTS `d_shipments_item`;

CREATE TABLE `d_shipments_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_corporation_guid` varchar(40) NOT NULL COMMENT '公司別索引',
  `d_shipments_list_guid` varchar(40) NOT NULL COMMENT '出貨單索引',
  `b_product_guid` varchar(40) NOT NULL COMMENT '商品規格索引',
  `quantity` double NOT NULL COMMENT '進貨數量',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`),
  KEY `d_carry_list_guid` (`d_shipments_list_guid`),
  CONSTRAINT `d_shipments_item_ibfk_1` FOREIGN KEY (`d_shipments_list_guid`) REFERENCES `d_shipments_list` (`guid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='出貨明細';

/*Data for the table `d_shipments_item` */

/*Table structure for table `d_shipments_list` */

DROP TABLE IF EXISTS `d_shipments_list`;

CREATE TABLE `d_shipments_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_corporation_guid` varchar(40) NOT NULL COMMENT '公司別索引',
  `bill_date` date NOT NULL COMMENT '進貨日期',
  `bill_serial_no` varchar(40) NOT NULL COMMENT '進貨單號',
  `b_customer_guid` varchar(40) NOT NULL COMMENT '客廠索引',
  `b_warehouse_guid` varchar(40) NOT NULL COMMENT '進貨倉庫',
  `remark` text NOT NULL COMMENT '備註',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '單據狀態 1：新單據 50：出貨完成',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `bill_serial_no` (`bill_serial_no`,`b_corporation_guid`),
  KEY `b_supplier_guid` (`b_customer_guid`),
  KEY `b_warehouse_guid` (`b_warehouse_guid`),
  CONSTRAINT `d_shipments_list_ibfk_1` FOREIGN KEY (`b_customer_guid`) REFERENCES `b_customer` (`guid`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `d_shipments_list_ibfk_2` FOREIGN KEY (`b_warehouse_guid`) REFERENCES `b_warehouse` (`guid`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='出貨單';

/*Data for the table `d_shipments_list` */

/*Table structure for table `d_shipments_return_item` */

DROP TABLE IF EXISTS `d_shipments_return_item`;

CREATE TABLE `d_shipments_return_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_corporation_guid` varchar(40) NOT NULL COMMENT '公司別索引',
  `d_shipments_return_list_guid` varchar(40) NOT NULL COMMENT '退貨單索引',
  `b_product_guid` varchar(40) NOT NULL COMMENT '商品索引',
  `quantity` double NOT NULL COMMENT '退出數量',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`),
  KEY `d_carry_return_list_guid` (`d_shipments_return_list_guid`),
  CONSTRAINT `d_shipments_return_item_ibfk_1` FOREIGN KEY (`d_shipments_return_list_guid`) REFERENCES `d_shipments_return_list` (`guid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='出貨退回明細';

/*Data for the table `d_shipments_return_item` */

insert  into `d_shipments_return_item`(`id`,`guid`,`b_corporation_guid`,`d_shipments_return_list_guid`,`b_product_guid`,`quantity`,`is_invalid`,`creator_guid`,`creator_name`,`creator_date`,`modifier_guid`,`modifier_name`,`modifier_date`,`invalid_guid`,`invalid_name`,`invalid_date`) values (1,'c20ebf26-3c43-11e6-8274-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42','c20c15aa-3c43-11e6-8274-d275b9d5831f','14fa1102-3c41-11e6-8274-d275b9d5831f',20,1,'7ca53f13-ce02-422c-a755-15ac9c945334','subadmin','2016-06-27 16:47:19','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00');

/*Table structure for table `d_shipments_return_list` */

DROP TABLE IF EXISTS `d_shipments_return_list`;

CREATE TABLE `d_shipments_return_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_corporation_guid` varchar(40) NOT NULL COMMENT '公司別索引',
  `bill_date` date NOT NULL COMMENT '出貨退回日期',
  `bill_serial_no` varchar(40) NOT NULL COMMENT '出貨退回單號',
  `b_customer_guid` varchar(40) NOT NULL COMMENT '客廠索引',
  `b_warehouse_guid` varchar(40) NOT NULL COMMENT '進貨退出貨倉庫',
  `remark` text NOT NULL COMMENT '備註',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '出貨退回狀態 1：新單據 50：退貨完成',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `bill_serial_no` (`bill_serial_no`,`b_corporation_guid`),
  KEY `b_supplier_guid` (`b_customer_guid`),
  KEY `b_warehouse_guid` (`b_warehouse_guid`),
  CONSTRAINT `d_shipments_return_list_ibfk_1` FOREIGN KEY (`b_customer_guid`) REFERENCES `b_customer` (`guid`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `d_shipments_return_list_ibfk_2` FOREIGN KEY (`b_warehouse_guid`) REFERENCES `b_warehouse` (`guid`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='出貨退回單';

/*Data for the table `d_shipments_return_list` */

insert  into `d_shipments_return_list`(`id`,`guid`,`b_corporation_guid`,`bill_date`,`bill_serial_no`,`b_customer_guid`,`b_warehouse_guid`,`remark`,`status`,`is_invalid`,`creator_guid`,`creator_name`,`creator_date`,`modifier_guid`,`modifier_name`,`modifier_date`,`invalid_guid`,`invalid_name`,`invalid_date`) values (1,'c20c15aa-3c43-11e6-8274-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42','2016-06-27','sub','d0ea06c0-3c40-11e6-8274-d275b9d5831f','2a258426-3c41-11e6-8274-d275b9d5831f','',50,1,'7ca53f13-ce02-422c-a755-15ac9c945334','subadmin','2016-06-27 16:47:19','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00');

/*Table structure for table `d_stock` */

DROP TABLE IF EXISTS `d_stock`;

CREATE TABLE `d_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_corporation_guid` varchar(40) NOT NULL COMMENT '公司別索引',
  `b_warehouse_guid` varchar(40) NOT NULL COMMENT '庫位索引',
  `b_product_guid` varchar(40) NOT NULL COMMENT '商品規格索引',
  `quantity` double NOT NULL COMMENT '庫存數量',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`),
  KEY `b_warehouse_guid` (`b_warehouse_guid`),
  CONSTRAINT `d_stock_ibfk_1` FOREIGN KEY (`b_warehouse_guid`) REFERENCES `b_warehouse` (`guid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='庫存';

/*Data for the table `d_stock` */

insert  into `d_stock`(`id`,`guid`,`b_corporation_guid`,`b_warehouse_guid`,`b_product_guid`,`quantity`,`is_invalid`,`creator_guid`,`creator_name`,`creator_date`,`modifier_guid`,`modifier_name`,`modifier_date`,`invalid_guid`,`invalid_name`,`invalid_date`) values (1,'43abca2c-3c41-11e6-8274-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42','2a258426-3c41-11e6-8274-d275b9d5831f','14fa1102-3c41-11e6-8274-d275b9d5831f',0,1,'7ca53f13-ce02-422c-a755-15ac9c945334','subadmin','2016-06-27 16:29:28','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(2,'5dce897e-3c43-11e6-8274-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42','2a258426-3c41-11e6-8274-d275b9d5831f','14fa1102-3c41-11e6-8274-d275b9d5831f',5,1,'7ca53f13-ce02-422c-a755-15ac9c945334','subadmin','2016-06-27 16:44:31','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00');

/*Table structure for table `d_stock_allocation` */

DROP TABLE IF EXISTS `d_stock_allocation`;

CREATE TABLE `d_stock_allocation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_corporation_guid` varchar(40) NOT NULL COMMENT '公司別索引',
  `bill_date` date NOT NULL COMMENT '轉庫日期',
  `bill_serial_no` varchar(40) NOT NULL COMMENT '轉庫單號',
  `export_b_warehouse_guid` varchar(40) NOT NULL COMMENT '出庫倉索引',
  `export_d_stock_guid` varchar(40) DEFAULT NULL COMMENT '轉出庫存索引',
  `import_b_warehouse_guid` varchar(40) NOT NULL COMMENT '入庫倉索引',
  `import_d_stock_guid` varchar(40) DEFAULT NULL COMMENT '轉入庫存索引',
  `b_product_specification_guid` varchar(40) NOT NULL COMMENT '商品規格索引',
  `export_quantity` double NOT NULL COMMENT '轉出數量',
  `import_quantity` double NOT NULL COMMENT '轉入數量',
  `remark` text NOT NULL COMMENT '備註',
  `status` int(2) NOT NULL COMMENT '轉出狀態 1：待處理 10：轉出完成 20：轉入完成',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `b_corporation_guid` (`b_corporation_guid`,`bill_serial_no`),
  KEY `export_d_stock_guid` (`export_d_stock_guid`),
  KEY `import_d_stock_guid` (`import_d_stock_guid`),
  KEY `export_b_warehouse_guid` (`export_b_warehouse_guid`),
  KEY `import_b_warehouse_guid` (`import_b_warehouse_guid`),
  CONSTRAINT `d_stock_allocation_ibfk_1` FOREIGN KEY (`export_b_warehouse_guid`) REFERENCES `b_warehouse` (`guid`),
  CONSTRAINT `d_stock_allocation_ibfk_2` FOREIGN KEY (`export_d_stock_guid`) REFERENCES `d_stock` (`guid`),
  CONSTRAINT `d_stock_allocation_ibfk_3` FOREIGN KEY (`import_b_warehouse_guid`) REFERENCES `b_warehouse` (`guid`),
  CONSTRAINT `d_stock_allocation_ibfk_4` FOREIGN KEY (`import_d_stock_guid`) REFERENCES `d_stock` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='轉庫單';

/*Data for the table `d_stock_allocation` */

/*Table structure for table `d_stock_booking` */

DROP TABLE IF EXISTS `d_stock_booking`;

CREATE TABLE `d_stock_booking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_corporation_guid` varchar(40) NOT NULL COMMENT '公司別索引',
  `b_warehouse_guid` varchar(40) NOT NULL COMMENT '出庫索引',
  `d_stock_guid` varchar(40) DEFAULT NULL COMMENT '庫存索引',
  `b_product_specification_guid` varchar(40) NOT NULL COMMENT '商品規格索引',
  `booking_bill_guid` varchar(40) NOT NULL COMMENT '預約單據索引',
  `booking_bill_type` int(2) NOT NULL COMMENT '預約單據類別 1：銷貨單 2：採購單',
  `booking_type` int(1) NOT NULL COMMENT '預約類型 1：出庫 2：入庫',
  `booking_quantity` double NOT NULL COMMENT '預約數量',
  `moving_quantity` double NOT NULL COMMENT '實際異動數量',
  `status` int(1) NOT NULL COMMENT '預約狀態 1：已預約 2：異動完成 3：取消預約',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`),
  KEY `b_stock_guid` (`d_stock_guid`),
  KEY `b_warehouse_guid` (`b_warehouse_guid`),
  CONSTRAINT `d_stock_booking_ibfk_1` FOREIGN KEY (`d_stock_guid`) REFERENCES `d_stock` (`guid`),
  CONSTRAINT `d_stock_booking_ibfk_2` FOREIGN KEY (`b_warehouse_guid`) REFERENCES `b_warehouse` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='庫存預約';

/*Data for the table `d_stock_booking` */

/*Table structure for table `d_stock_history` */

DROP TABLE IF EXISTS `d_stock_history`;

CREATE TABLE `d_stock_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_corporation_guid` varchar(40) NOT NULL COMMENT '公司別索引',
  `d_stock_guid` varchar(40) NOT NULL COMMENT '庫存索引',
  `origin_bill_guid` varchar(40) NOT NULL COMMENT '來源單據索引',
  `origin_bill_type` int(3) NOT NULL COMMENT '單據類別 1：期初庫存 2：出貨單 3：入庫單 4：轉庫單 5：盤點單',
  `moving_type` int(1) NOT NULL COMMENT '異動類型 1：出庫 2：入庫 3：直接異動',
  `moving_quantity` double NOT NULL COMMENT '異動數量',
  `inventory_quantity` double NOT NULL COMMENT '結餘庫存數量',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`),
  KEY `d_stock_guid` (`d_stock_guid`),
  CONSTRAINT `d_stock_history_ibfk_1` FOREIGN KEY (`d_stock_guid`) REFERENCES `d_stock` (`guid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='出入庫紀錄';

/*Data for the table `d_stock_history` */

insert  into `d_stock_history`(`id`,`guid`,`b_corporation_guid`,`d_stock_guid`,`origin_bill_guid`,`origin_bill_type`,`moving_type`,`moving_quantity`,`inventory_quantity`,`is_invalid`,`creator_guid`,`creator_name`,`creator_date`,`modifier_guid`,`modifier_name`,`modifier_date`,`invalid_guid`,`invalid_name`,`invalid_date`) values (1,'43b1258a-3c41-11e6-8274-d275b9d5831f','','43abca2c-3c41-11e6-8274-d275b9d5831f','4394a4b4-3c41-11e6-8274-d275b9d5831f',5,3,0,0,1,'7ca53f13-ce02-422c-a755-15ac9c945334','subadmin','2016-06-27 16:29:28','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00'),(2,'5dd5c996-3c43-11e6-8274-d275b9d5831f','','5dce897e-3c43-11e6-8274-d275b9d5831f','5b2134c4-3c43-11e6-8274-d275b9d5831f',3,2,5,5,1,'7ca53f13-ce02-422c-a755-15ac9c945334','subadmin','2016-06-27 16:44:31','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00');

/*Table structure for table `d_web_announcement` */

DROP TABLE IF EXISTS `d_web_announcement`;

CREATE TABLE `d_web_announcement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_corporation_guid` varchar(40) NOT NULL COMMENT '公司別索引',
  `content` text NOT NULL COMMENT '內容',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='網頁編輯器內容';

/*Data for the table `d_web_announcement` */

insert  into `d_web_announcement`(`id`,`guid`,`b_corporation_guid`,`content`,`is_invalid`,`creator_guid`,`creator_name`,`creator_date`,`modifier_guid`,`modifier_name`,`modifier_date`,`invalid_guid`,`invalid_name`,`invalid_date`) values (1,'cfde7fec-3c43-11e6-8274-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42','sub網站公告',1,'7ca53f13-ce02-422c-a755-15ac9c945334','subadmin','2016-06-27 16:47:42','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00');

/*Table structure for table `r_bo_history` */

DROP TABLE IF EXISTS `r_bo_history`;

CREATE TABLE `r_bo_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `origin_bo` varchar(50) NOT NULL COMMENT '來源Bo',
  `record_guid` varchar(40) NOT NULL COMMENT '異動資料索引',
  `method` int(1) NOT NULL COMMENT '異動類別, 0:新增 1:維護 2:作廢 3:刪除: 結案',
  `summary` text NOT NULL COMMENT '異動概要',
  `contents` text NOT NULL COMMENT '異動內容',
  `raw_data` text NOT NULL COMMENT '原始資料',
  `target_data` text NOT NULL COMMENT '目標資料',
  `b_user_guid` varchar(40) NOT NULL COMMENT '使用者索引',
  `b_staff_guid` varchar(40) NOT NULL COMMENT '員工資料索引',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`),
  KEY `b_user_guid` (`b_user_guid`),
  KEY `b_staff_guid` (`b_staff_guid`),
  KEY `record_guid` (`record_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='資料歷程';

/*Data for the table `r_bo_history` */

/*Table structure for table `r_employee_login_history` */

DROP TABLE IF EXISTS `r_employee_login_history`;

CREATE TABLE `r_employee_login_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_enterprise_employee_guid` varchar(40) NOT NULL COMMENT '子帳號索引',
  `store_no` varchar(40) NOT NULL COMMENT '特店編號',
  `account` varchar(50) NOT NULL COMMENT '帳號',
  `token` varchar(255) DEFAULT NULL COMMENT 'TOKEN',
  `retry_times` int(11) NOT NULL DEFAULT '0' COMMENT '連續登入失敗次數',
  `unblock_date` datetime DEFAULT NULL COMMENT '解除封鎖日期',
  `force_block` int(2) NOT NULL DEFAULT '1' COMMENT '強制開通 1：否 50：是',
  `status` varchar(2) NOT NULL DEFAULT '1' COMMENT '登入狀態 1：帳號不存在 10：特店編號不存在 20：密碼錯誤 30：帳號停權 40：封鎖中拒絕登入 50：登入成功',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`),
  KEY `b_enterprise_employee_ guid` (`b_enterprise_employee_guid`),
  CONSTRAINT `r_employee_login_history_ibfk_1` FOREIGN KEY (`b_enterprise_employee_guid`) REFERENCES `b_enterprise_employee` (`guid`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='子帳號登入紀錄';

/*Data for the table `r_employee_login_history` */

insert  into `r_employee_login_history`(`id`,`guid`,`b_enterprise_employee_guid`,`store_no`,`account`,`token`,`retry_times`,`unblock_date`,`force_block`,`status`,`is_invalid`,`creator_guid`,`creator_name`,`creator_date`,`modifier_guid`,`modifier_name`,`modifier_date`,`invalid_guid`,`invalid_name`,`invalid_date`) values (6,'1bf13825-3e6b-4774-ad09-723b7d869d04','7ca53f13-ce02-422c-a755-15ac9c945334','ew9999','subadmin','{\"pk\":\"7ca53f13-ce02-422c-a755-15ac9c945334\",\"name\":\"subadmin\",\"type\":\"employee\",\"loginHistory\":\"1bf13825-3e6b-4774-ad09-723b7d869d04\",\"corporation\":\"aec64ec6-2949-4dd5-a013-e7102f110d42\"}',0,NULL,1,'50',1,'1bf13825-3e6b-4774-ad09-723b7d869d04','Adam','2016-06-27 17:18:33','','','2016-06-27 17:18:33','','','2016-06-27 17:18:33'),(1,'464e67b8-f013-4106-a002-019f2c412c2d','7ca53f13-ce02-422c-a755-15ac9c945334','ew9999','subadmin','{\"pk\":\"7ca53f13-ce02-422c-a755-15ac9c945334\",\"name\":\"subadmin\",\"type\":\"employee\",\"loginHistory\":\"464e67b8-f013-4106-a002-019f2c412c2d\",\"corporation\":\"aec64ec6-2949-4dd5-a013-e7102f110d42\"}',0,NULL,1,'50',1,'464e67b8-f013-4106-a002-019f2c412c2d','Adam','2016-06-27 16:02:39','','','2016-06-27 16:02:39','','','2016-06-27 16:02:39'),(2,'562629c3-6c68-4ec8-bc4b-4d0c8e3a22d6','7ca53f13-ce02-422c-a755-15ac9c945334','ew9999','subadmin','{\"pk\":\"7ca53f13-ce02-422c-a755-15ac9c945334\",\"name\":\"subadmin\",\"type\":\"employee\",\"loginHistory\":\"562629c3-6c68-4ec8-bc4b-4d0c8e3a22d6\",\"corporation\":\"aec64ec6-2949-4dd5-a013-e7102f110d42\"}',0,NULL,1,'50',1,'562629c3-6c68-4ec8-bc4b-4d0c8e3a22d6','Adam','2016-06-27 16:13:41','','','2016-06-27 16:13:41','','','2016-06-27 16:13:41'),(4,'6114994a-2bf7-439c-ba09-ca875548b8c0','f0ff27bb-062d-468a-aa15-bb3d2fe0caf7','ew1847','ew18473','',0,NULL,1,'20',1,'6114994a-2bf7-439c-ba09-ca875548b8c0','Adam','2016-06-27 16:50:04','','','2016-06-27 16:50:04','','','2016-06-27 16:50:04'),(3,'7563c49f-1b7e-49b4-aebf-d215d517be8e','7ca53f13-ce02-422c-a755-15ac9c945334','ew9999','subadmin','{\"pk\":\"7ca53f13-ce02-422c-a755-15ac9c945334\",\"name\":\"subadmin\",\"type\":\"employee\",\"loginHistory\":\"7563c49f-1b7e-49b4-aebf-d215d517be8e\",\"corporation\":\"aec64ec6-2949-4dd5-a013-e7102f110d42\"}',0,NULL,1,'50',1,'7563c49f-1b7e-49b4-aebf-d215d517be8e','Adam','2016-06-27 16:17:58','','','2016-06-27 16:17:58','','','2016-06-27 16:17:58'),(5,'f3edbd06-8a2f-414f-ac4a-ef7146b4fe21','f0ff27bb-062d-468a-aa15-bb3d2fe0caf7','ew1847','ew18473','{\"pk\":\"f0ff27bb-062d-468a-aa15-bb3d2fe0caf7\",\"name\":\"ew18473\",\"type\":\"employee\",\"loginHistory\":\"f3edbd06-8a2f-414f-ac4a-ef7146b4fe21\",\"corporation\":\"3f9c7e9b-56e0-4d0f-9372-156510c99aff\"}',0,NULL,1,'50',1,'f3edbd06-8a2f-414f-ac4a-ef7146b4fe21','Adam','2016-06-27 16:50:19','','','2016-06-27 16:50:19','','','2016-06-27 16:50:19');

/*Table structure for table `r_enterprise_employee_password_history` */

DROP TABLE IF EXISTS `r_enterprise_employee_password_history`;

CREATE TABLE `r_enterprise_employee_password_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_enterprise_employee_guid` varchar(40) NOT NULL COMMENT '子帳號索引',
  `passwd` varchar(64) NOT NULL COMMENT '子帳號密碼',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`),
  KEY `b_enterprise_employee_guid` (`b_enterprise_employee_guid`) USING BTREE,
  CONSTRAINT `r_enterprise_employee_password_history_ibfk_1` FOREIGN KEY (`b_enterprise_employee_guid`) REFERENCES `b_enterprise_employee` (`guid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='子帳號密碼更新紀錄';

/*Data for the table `r_enterprise_employee_password_history` */

insert  into `r_enterprise_employee_password_history`(`id`,`guid`,`b_enterprise_employee_guid`,`passwd`,`is_invalid`,`creator_guid`,`creator_name`,`creator_date`,`modifier_guid`,`modifier_name`,`modifier_date`,`invalid_guid`,`invalid_name`,`invalid_date`) values (2,'23262e35-7b3d-4514-b83f-f570cca683cc','d154f613-242e-4a48-8567-c0e841046cfe','HPtJxT+kV/OIED4CPTkpug==',1,'23262e35-7b3d-4514-b83f-f570cca683cc','Adam','2016-06-27 16:48:13','','','2016-06-27 16:48:13','','','2016-06-27 16:48:13'),(4,'33971355-8a50-4e2e-b6a5-63162d6791d8','f0ff27bb-062d-468a-aa15-bb3d2fe0caf7','/RXV+AHu95CypxJqLpbkXw==',1,'33971355-8a50-4e2e-b6a5-63162d6791d8','Adam','2016-06-27 16:48:54','','','2016-06-27 16:48:54','','','2016-06-27 16:48:54'),(3,'b913e896-8bdf-4850-9381-b124b6df7804','13d93b47-0fbf-4192-9a87-7538af7147cb','aTLX+YE9PgHI+P8/HCXefA==',1,'b913e896-8bdf-4850-9381-b124b6df7804','Adam','2016-06-27 16:48:34','','','2016-06-27 16:48:34','','','2016-06-27 16:48:34'),(1,'bce4acc9-b31f-4dcd-836e-238f68d663ed','7ca53f13-ce02-422c-a755-15ac9c945334','YP9OcuYv56RGxCG1VC3Oww==',1,'系統初始值','系統初始值','2016-06-27 15:32:21','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00');

/*Table structure for table `r_enterprise_login_history` */

DROP TABLE IF EXISTS `r_enterprise_login_history`;

CREATE TABLE `r_enterprise_login_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_enterprise_guid` varchar(40) DEFAULT NULL COMMENT '企業帳號索引',
  `store_no` varchar(40) NOT NULL COMMENT '特店編號',
  `account` varchar(50) NOT NULL COMMENT '帳號',
  `token` varchar(255) DEFAULT NULL COMMENT 'TOKEN',
  `retry_times` int(11) NOT NULL DEFAULT '0' COMMENT '連續登入失敗次數',
  `unblock_date` datetime DEFAULT NULL COMMENT '解除封鎖日期',
  `force_block` int(2) NOT NULL DEFAULT '1' COMMENT '強制開通 1：否 50：是',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '登入狀態 1：帳號不存在 10：特店編號不存在 20：密碼錯誤 30：帳號停權 40：封鎖中拒絕登入 50：登入成功',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`),
  KEY `b_enterprise_guid` (`b_enterprise_guid`),
  CONSTRAINT `r_enterprise_login_history_ibfk_1` FOREIGN KEY (`b_enterprise_guid`) REFERENCES `b_enterprise` (`guid`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='企業帳號登入紀錄';

/*Data for the table `r_enterprise_login_history` */

insert  into `r_enterprise_login_history`(`id`,`guid`,`b_enterprise_guid`,`store_no`,`account`,`token`,`retry_times`,`unblock_date`,`force_block`,`status`,`is_invalid`,`creator_guid`,`creator_name`,`creator_date`,`modifier_guid`,`modifier_name`,`modifier_date`,`invalid_guid`,`invalid_name`,`invalid_date`) values (1,'87f85d68-099f-4dfc-8a06-47f727144f08','3f9c7e9b-56e0-4d0f-9372-156510c99aff','ew1847','ew1847','{\"pk\":\"3f9c7e9b-56e0-4d0f-9372-156510c99aff\",\"name\":\"ew1847\",\"type\":\"enterprise\",\"loginHistory\":\"87f85d68-099f-4dfc-8a06-47f727144f08\",\"corporation\":\"3f9c7e9b-56e0-4d0f-9372-156510c99aff\"}',0,NULL,1,50,1,'87f85d68-099f-4dfc-8a06-47f727144f08','Adam','2016-06-27 16:47:01','','','2016-06-27 16:47:01','','','2016-06-27 16:47:01'),(2,'eb389ecf-c677-43c2-9c6f-630037e60839',NULL,'ew18473','ew18473','',0,NULL,1,10,1,'eb389ecf-c677-43c2-9c6f-630037e60839','Adam','2016-06-27 16:49:32','','','2016-06-27 16:49:32','','','2016-06-27 16:49:32');

/*Table structure for table `r_enterprise_password_history` */

DROP TABLE IF EXISTS `r_enterprise_password_history`;

CREATE TABLE `r_enterprise_password_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_enterprise_guid` varchar(40) NOT NULL COMMENT '企業帳號索引',
  `passwd` varchar(64) NOT NULL COMMENT '企業密碼',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`),
  KEY `b_enterprise_guid` (`b_enterprise_guid`),
  CONSTRAINT `r_enterprise_password_history_ibfk_1` FOREIGN KEY (`b_enterprise_guid`) REFERENCES `b_enterprise` (`guid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='企業帳號密碼更新紀錄';

/*Data for the table `r_enterprise_password_history` */

insert  into `r_enterprise_password_history`(`id`,`guid`,`b_enterprise_guid`,`passwd`,`is_invalid`,`creator_guid`,`creator_name`,`creator_date`,`modifier_guid`,`modifier_name`,`modifier_date`,`invalid_guid`,`invalid_name`,`invalid_date`) values (5,'3f9474b2-1576-4632-b6a0-f66ebe9d4d96','6f7a8086-e8ae-42bb-a16b-af9d3cc6e88d','vlIei3WtZmSuffoCk4i2uQVw0TIeaHqtdZGnEffgKKE=',1,'3f9474b2-1576-4632-b6a0-f66ebe9d4d96','Adam','2016-06-27 17:20:13','','','2016-06-27 17:20:13','','','2016-06-27 17:20:13'),(3,'5296cee1-6d33-45dd-aa8c-dc217ac4e3e8','3f9c7e9b-56e0-4d0f-9372-156510c99aff','8HXpxT+1f0CyZNMDry9Oxg==',1,'5296cee1-6d33-45dd-aa8c-dc217ac4e3e8','Adam','2016-06-27 16:45:15','','','2016-06-27 16:45:15','','','2016-06-27 16:45:15'),(6,'8820e555-0658-4cc1-9510-4be0518f1ac7','28a5bc5c-6bb6-4a74-b146-9facd85c379f','vlIei3WtZmSuffoCk4i2uQVw0TIeaHqtdZGnEffgKKE=',1,'8820e555-0658-4cc1-9510-4be0518f1ac7','Adam','2016-06-27 17:20:28','','','2016-06-27 17:20:28','','','2016-06-27 17:20:28'),(4,'eebb53ee-1cd9-45f3-b4e3-5aa22f7e07aa','dbffa256-8888-41c1-91ea-7c2a4e7e1ea0','vlIei3WtZmSuffoCk4i2uQVw0TIeaHqtdZGnEffgKKE=',1,'eebb53ee-1cd9-45f3-b4e3-5aa22f7e07aa','Adam','2016-06-27 17:19:52','','','2016-06-27 17:19:52','','','2016-06-27 17:19:52'),(2,'f6435ba4-335a-11e6-bd74-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42','Hzl4yHW1HUxa9my7ef62Kg==',1,'系統初始值','系統初始值','2016-06-27 15:32:21','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00');

/*Table structure for table `r_industry_generate_history` */

DROP TABLE IF EXISTS `r_industry_generate_history`;

CREATE TABLE `r_industry_generate_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_agents_guid` varchar(40) NOT NULL COMMENT '代理商索引',
  `quantity` varchar(50) NOT NULL COMMENT '產生數量',
  `store_no_list` text NOT NULL COMMENT '特店編號清單，以json 格式儲存',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`),
  KEY `b_agents_guid` (`b_agents_guid`),
  CONSTRAINT `r_industry_generate_history_ibfk_1` FOREIGN KEY (`b_agents_guid`) REFERENCES `b_agents` (`guid`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='代理商特店編號產生紀錄';

/*Data for the table `r_industry_generate_history` */

/*Table structure for table `r_operating_log` */

DROP TABLE IF EXISTS `r_operating_log`;

CREATE TABLE `r_operating_log` (
  `id` int(11) NOT NULL,
  `guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `b_corporation_guid` varchar(40) NOT NULL COMMENT '公司別索引',
  `b_enterprise_employee_guid` varchar(40) NOT NULL COMMENT '企業帳號索引',
  `system_name` varchar(40) NOT NULL DEFAULT '' COMMENT '系統名稱',
  `features_name` varchar(40) NOT NULL DEFAULT '' COMMENT '功能名稱',
  `action` varchar(20) NOT NULL DEFAULT '' COMMENT '動作',
  `origin_device` varchar(20) NOT NULL DEFAULT '' COMMENT '來源裝置',
  `is_invalid` int(1) NOT NULL DEFAULT '1' COMMENT '資料是否作廢 1：否 2：是',
  `creator_guid` varchar(40) NOT NULL COMMENT '資料建立人員索引',
  `creator_name` varchar(50) NOT NULL COMMENT '資料建立人員名稱',
  `creator_date` datetime NOT NULL COMMENT '資料建立時間',
  `modifier_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '最後修改人員索引',
  `modifier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最後修改人員名稱',
  `modifier_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料最後修改時間',
  `invalid_guid` varchar(40) NOT NULL DEFAULT '' COMMENT '資料作廢人員索引',
  `invalid_name` varchar(50) NOT NULL DEFAULT '' COMMENT '資料作廢人員名稱',
  `invalid_date` datetime NOT NULL DEFAULT '1899-12-31 00:00:00' COMMENT '資料作廢時間',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='操作紀錄';

/*Data for the table `r_operating_log` */

insert  into `r_operating_log`(`id`,`guid`,`b_corporation_guid`,`b_enterprise_employee_guid`,`system_name`,`features_name`,`action`,`origin_device`,`is_invalid`,`creator_guid`,`creator_name`,`creator_date`,`modifier_guid`,`modifier_name`,`modifier_date`,`invalid_guid`,`invalid_name`,`invalid_date`) values (0,'aacc0250-3c3f-11e6-8274-d275b9d5831f','aec64ec6-2949-4dd5-a013-e7102f110d42','7ca53f13-ce02-422c-a755-15ac9c945334','公司別管理系統','分店管理','','pc',1,'7ca53f13-ce02-422c-a755-15ac9c945334','subadmin','2016-06-27 16:18:02','','','1899-12-31 00:00:00','','','1899-12-31 00:00:00');

/* Function  structure for function  `FN_EC_PRODUCT_CATEGORY_HIERARCHICAL_LEVEL` */

/*!50003 DROP FUNCTION IF EXISTS `FN_EC_PRODUCT_CATEGORY_HIERARCHICAL_LEVEL` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`admin`@`127.0.0.1` FUNCTION `FN_EC_PRODUCT_CATEGORY_HIERARCHICAL_LEVEL`(PK VARCHAR(40), Separated VARCHAR(3)) RETURNS varchar(1024) CHARSET utf8mb4
BEGIN
    DECLARE ancestry VARCHAR(1024); -- 層級
    DECLARE parentPk varchar(40);   -- 父分類索引
    DECLARE title varchar(50) CHARSET utf8mb4;      -- 分類名稱
    DECLARE cm VARCHAR(3) DEFAULT '';   -- 分隔符號

    SET ancestry = '';
    SET parentPk = PK;
    WHILE parentPk IS NOT NULL DO
        SELECT `b_ec_product_category_guid`, `name` INTO parentPk, title FROM
        (SELECT b_ec_product_category_guid, `name` FROM b_ec_product_category WHERE guid = parentPk) A;
        IF title IS NOT NULL THEN
            SET ancestry = CONCAT(title, cm, ancestry);
            SET cm = Separated;
        END IF;
    END WHILE;
    RETURN ancestry;
END */$$
DELIMITER ;

/* Function  structure for function  `FN_PRODUCT_CATEGORY_HIERARCHICAL_LEVEL` */

/*!50003 DROP FUNCTION IF EXISTS `FN_PRODUCT_CATEGORY_HIERARCHICAL_LEVEL` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`admin`@`127.0.0.1` FUNCTION `FN_PRODUCT_CATEGORY_HIERARCHICAL_LEVEL`(PK VARCHAR(40), Separated VARCHAR(3)) RETURNS varchar(1024) CHARSET utf8mb4
BEGIN
    DECLARE ancestry VARCHAR(1024); -- 層級
    DECLARE parentPk varchar(40);   -- 父分類索引
    DECLARE title varchar(50) CHARSET utf8mb4;      -- 分類名稱
    DECLARE cm VARCHAR(3) DEFAULT '';   -- 分隔符號

    SET ancestry = '';
    SET parentPk = PK;
    WHILE parentPk IS NOT NULL DO
        SELECT `b_product_category_guid`, `name` INTO parentPk, title FROM
        (SELECT b_product_category_guid, `name` FROM b_product_category WHERE guid = parentPk) A;
        IF title IS NOT NULL THEN
            SET ancestry = CONCAT(title, cm, ancestry);
            SET cm = Separated;
        END IF;
    END WHILE;
    RETURN ancestry;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_GET_EC_PRODUCT_CATEGORY_TREE` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_GET_EC_PRODUCT_CATEGORY_TREE` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`admin`@`127.0.0.1` PROCEDURE `SP_GET_EC_PRODUCT_CATEGORY_TREE`(IN `SkipPk` VARCHAR(40), IN `Separated` VARCHAR(3), IN `Level` INT(2))
BEGIN
    DECLARE done INT;
    DECLARE cid INT;
    DECLARE pk VARCHAR(40);
    DECLARE parentPk VARCHAR(40);
    DECLARE title VARCHAR(50) CHARSET utf8mb4;
    DECLARE tmp CURSOR FOR SELECT id, guid, b_ec_product_category_guid, `name` FROM `b_ec_product_category` WHERE `b_ec_product_category_guid` IS NULL ORDER BY sort_no DESC, id ASC;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    CREATE TEMPORARY TABLE IF NOT EXISTS tempCategory (
        `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        `guid` VARCHAR(40),
        `name` VARCHAR(50) CHARSET utf8mb4,
        `structure` TEXT CHARSET utf8mb4,
        `treeLevel` INT NOT NULL DEFAULT 0,
        `categoryId` INT
    );
    SET done = 0;
    OPEN tmp;
    treeLoop:REPEAT
        FETCH tmp INTO cid, pk, parentPk, title;
        IF done=0 THEN
            INSERT INTO tempCategory (`categoryId`, `guid`, `name`, `structure`) VALUES (cid, pk, title, title);
            IF pk <> IFNULL(SkipPk, '') THEN
                CALL SP_RECURSIVE_EC_PRODUCT_CATEGORY_TREE(pk, title, SkipPk, Separated, 0);
            END IF;
        END IF;
    UNTIL done
    END REPEAT treeLoop;
    CLOSE tmp;
	IF Level > -1 THEN
    	SELECT * FROM tempCategory WHERE treeLevel <= Level ORDER BY id ASC;
	ELSE
		SELECT * FROM tempCategory ORDER BY id ASC;
	END IF;
    DROP TABLE tempCategory;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_GET_PRODUCT_CATEGORY_TREE` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_GET_PRODUCT_CATEGORY_TREE` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`admin`@`127.0.0.1` PROCEDURE `SP_GET_PRODUCT_CATEGORY_TREE`(IN SkipPk VARCHAR(40), IN Separated VARCHAR(3))
BEGIN
    DECLARE done INT;
    DECLARE pk VARCHAR(40);
    DECLARE parentPk VARCHAR(40);
    DECLARE title VARCHAR(50) CHARSET utf8mb4;
    DECLARE tmp CURSOR FOR SELECT guid, b_product_category_guid, `name` FROM `b_product_category` WHERE `b_product_category_guid` IS NULL ORDER BY sort_no DESC, id ASC;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    CREATE TEMPORARY TABLE IF NOT EXISTS tempCategory (
        `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        `guid` VARCHAR(40),
        `name` VARCHAR(50),
        `structure` TEXT
    );
    SET done = 0;
    OPEN tmp;
    treeLoop:REPEAT
        FETCH tmp INTO pk, parentPk, title;
        IF done=0 THEN
            INSERT INTO tempCategory (`guid`, `name`, `structure`) VALUES (pk, title, title);
            IF pk <> IFNULL(SkipPk, '') THEN
                CALL SP_RECURSIVE_PRODUCT_CATEGORY_TREE(pk, title, SkipPk, Separated);
            END IF;
        END IF;
    UNTIL done
    END REPEAT treeLoop;
    CLOSE tmp;
    SELECT * FROM tempCategory ORDER BY id ASC;
    DROP TABLE tempCategory;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_RECURSIVE_EC_PRODUCT_CATEGORY_TREE` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_RECURSIVE_EC_PRODUCT_CATEGORY_TREE` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`admin`@`127.0.0.1` PROCEDURE `SP_RECURSIVE_EC_PRODUCT_CATEGORY_TREE`(IN `mainGuid` VARCHAR(40), IN `structure` TEXT CHARSET utf8mb4, IN `SkipPk` VARCHAR(40), IN `Separated` VARCHAR(3), IN `Level` INT(2))
BEGIN
    DECLARE done INT;
    DECLARE cid INT;
    DECLARE pk VARCHAR(40);
    DECLARE parentPk VARCHAR(40);
    DECLARE title VARCHAR(50) CHARSET utf8mb4;
    DECLARE tree TEXT;
    DECLARE selfLevel INT;
    DECLARE tmp CURSOR FOR SELECT id, guid, b_ec_product_category_guid, `name` FROM `b_ec_product_category` WHERE `b_ec_product_category_guid` = mainGuid  ORDER BY sort_no DESC, id ASC;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    SET done = 0;
    SET selfLevel = Level+1;
    OPEN tmp;
    treeLoop:REPEAT
        FETCH tmp INTO cid, pk, parentPk, title;
            IF done=0 THEN
                SET tree = CONCAT(structure, Separated, title);
                INSERT INTO tempCategory (`categoryId`, `guid`, `name`, `structure`, `treeLevel`) VALUES (cid, pk, title, tree, selfLevel);
                IF pk <> IFNULL(SkipPk, '') THEN
                    CALL SP_RECURSIVE_EC_PRODUCT_CATEGORY_TREE(pk, tree, SkipPk, Separated, selfLevel);
                END IF;
            END IF;
        UNTIL done
        END REPEAT treeLoop;
    CLOSE tmp;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_RECURSIVE_PRODUCT_CATEGORY_TREE` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_RECURSIVE_PRODUCT_CATEGORY_TREE` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`admin`@`127.0.0.1` PROCEDURE `SP_RECURSIVE_PRODUCT_CATEGORY_TREE`(IN mainGuid VARCHAR(40), IN structure TEXT, IN SkipPk VARCHAR(40), IN Separated VARCHAR(3))
BEGIN
    DECLARE done INT;
    DECLARE pk VARCHAR(40);
    DECLARE parentPk VARCHAR(40);
    DECLARE title VARCHAR(50) CHARSET utf8mb4;
    DECLARE tree TEXT;
    DECLARE tmp CURSOR FOR SELECT guid, b_product_category_guid, `name` FROM `b_product_category` WHERE `b_product_category_guid` = mainGuid  ORDER BY sort_no DESC, id ASC;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    SET done = 0;
    OPEN tmp;
    treeLoop:REPEAT
        FETCH tmp INTO pk, parentPk, title;
            IF done=0 THEN
                SET tree = CONCAT(structure, Separated, title);
                INSERT INTO tempCategory (`guid`, `name`, `structure`) VALUES (pk, title, tree);
                IF pk <> IFNULL(SkipPk, '') THEN
                    CALL SP_RECURSIVE_PRODUCT_CATEGORY_TREE(pk, tree, SkipPk, Separated);
                END IF;
            END IF;
        UNTIL done
        END REPEAT treeLoop;
    CLOSE tmp;
END */$$
DELIMITER ;

/*Table structure for table `v_enterprise_disable_service` */

DROP TABLE IF EXISTS `v_enterprise_disable_service`;

/*!50001 DROP VIEW IF EXISTS `v_enterprise_disable_service` */;
/*!50001 DROP TABLE IF EXISTS `v_enterprise_disable_service` */;

/*!50001 CREATE TABLE `v_enterprise_disable_service` (
  `b_service_guid` varchar(50) NOT NULL COMMENT '服務標題',
  `b_enterprise_guid` varchar(40) NOT NULL COMMENT '資料識別碼',
  `serial_no` varchar(20) NOT NULL COMMENT '服務代碼',
  `title` varchar(50) NOT NULL COMMENT '服務標題'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 */;

/*Table structure for table `v_enterprise_login` */

DROP TABLE IF EXISTS `v_enterprise_login`;

/*!50001 DROP VIEW IF EXISTS `v_enterprise_login` */;
/*!50001 DROP TABLE IF EXISTS `v_enterprise_login` */;

/*!50001 CREATE TABLE `v_enterprise_login` (
  `pk` varchar(40) NOT NULL DEFAULT '',
  `store_no` varchar(40) DEFAULT NULL,
  `account` varchar(50) NOT NULL DEFAULT '',
  `passwd` varchar(64) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `status` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 */;

/*View structure for view v_enterprise_disable_service */

/*!50001 DROP TABLE IF EXISTS `v_enterprise_disable_service` */;
/*!50001 DROP VIEW IF EXISTS `v_enterprise_disable_service` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`admin`@`127.0.0.1` SQL SECURITY DEFINER VIEW `v_enterprise_disable_service` AS (select `b_service`.`title` AS `b_service_guid`,`b_enterprise`.`guid` AS `b_enterprise_guid`,`b_service`.`serial_no` AS `serial_no`,`b_service`.`title` AS `title` from ((`b_enterprise` join `b_service`) left join `d_enterprise_service` on(((`b_service`.`guid` = `d_enterprise_service`.`b_service_guid`) and (`b_enterprise`.`guid` = `d_enterprise_service`.`b_enterprise_guid`) and (`d_enterprise_service`.`end_time` > now())))) where isnull(`d_enterprise_service`.`guid`)) */;

/*View structure for view v_enterprise_login */

/*!50001 DROP TABLE IF EXISTS `v_enterprise_login` */;
/*!50001 DROP VIEW IF EXISTS `v_enterprise_login` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`admin`@`127.0.0.1` SQL SECURITY DEFINER VIEW `v_enterprise_login` AS (select `b_enterprise`.`guid` AS `pk`,`b_enterprise`.`store_no` AS `store_no`,`b_enterprise`.`account` AS `account`,(select `r_enterprise_password_history`.`passwd` from `r_enterprise_password_history` where (`r_enterprise_password_history`.`b_enterprise_guid` = `b_enterprise`.`guid`) order by `r_enterprise_password_history`.`id` desc limit 0,1) AS `passwd`,(select `r_enterprise_login_history`.`token` from `r_enterprise_login_history` where ((`r_enterprise_login_history`.`b_enterprise_guid` = `b_enterprise`.`guid`) and (`r_enterprise_login_history`.`status` = 50)) order by `r_enterprise_login_history`.`id` desc limit 0,1) AS `token`,'enterprise' AS `type`,if(((select `r_enterprise_login_history`.`status` from `r_enterprise_login_history` where ((`r_enterprise_login_history`.`b_enterprise_guid` = `b_enterprise`.`guid`) and ((`r_enterprise_login_history`.`status` = 50) or ((`r_enterprise_login_history`.`status` = 40) and (`r_enterprise_login_history`.`unblock_date` > now()) and (`r_enterprise_login_history`.`force_block` = 50)))) order by `r_enterprise_login_history`.`id` desc limit 0,1) = 40),20,(case `b_enterprise`.`status` when 10 then 1 when 20 then 30 when 30 then 50 when 40 then 30 when 50 then 10 when 60 then 50 else 30 end)) AS `status` from `b_enterprise` where (`b_enterprise`.`status` in (10,20,30,40,50,60))) union all (select `b_enterprise_employee`.`guid` AS `pk`,`b_enterprise`.`store_no` AS `store_no`,`b_enterprise_employee`.`account` AS `account`,(select `r_enterprise_employee_password_history`.`passwd` from `r_enterprise_employee_password_history` where (`r_enterprise_employee_password_history`.`b_enterprise_employee_guid` = `b_enterprise_employee`.`guid`) order by `r_enterprise_employee_password_history`.`id` desc limit 0,1) AS `passwd`,(select `r_employee_login_history`.`token` from `r_employee_login_history` where ((`r_employee_login_history`.`b_enterprise_employee_guid` = `b_enterprise_employee`.`guid`) and ((`r_employee_login_history`.`status` = 50) or ((`r_employee_login_history`.`status` = 40) and (`r_employee_login_history`.`unblock_date` > now()) and (`r_employee_login_history`.`force_block` = 1)))) order by `r_employee_login_history`.`id` desc limit 0,1) AS `token`,'employee' AS `type`,if(((select `r_employee_login_history`.`status` from `r_employee_login_history` where ((`r_employee_login_history`.`b_enterprise_employee_guid` = `b_enterprise_employee`.`guid`) and ((`r_employee_login_history`.`status` = 50) or ((`r_employee_login_history`.`status` = 40) and (`r_employee_login_history`.`unblock_date` > now()) and (`r_employee_login_history`.`force_block` = 1)))) order by `r_employee_login_history`.`id` desc limit 0,1) = 40),20,(case `b_enterprise_employee`.`status` when 1 then 30 when 10 then 10 when 50 then 50 else 30 end)) AS `status` from (`b_enterprise_employee` left join `b_enterprise` on((`b_enterprise_employee`.`b_enterprise_guid` = `b_enterprise`.`guid`)))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

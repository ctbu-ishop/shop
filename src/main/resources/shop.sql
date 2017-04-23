/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;

/*!40101 SET SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;

/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;

/*!40103 SET SQL_NOTES='ON' */;


SET FOREIGN_KEY_CHECKS = 0;

DROP DATABASE
IF EXISTS `shop`;

CREATE DATABASE `shop` DEFAULT
CHARSET utf8;
USE shop;

-- ����customer�� �ͻ���
DROP TABLE
IF EXISTS `customer`;

CREATE TABLE `customer` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`username` VARCHAR (64) NOT NULL,
	`password` VARCHAR (32) NOT NULL,
	`email` VARCHAR (32) NULL DEFAULT NULL,
	`tel` CHAR (20) NULL DEFAULT NULL,
	`sex` enum ('��', 'Ů', '����') NOT NULL DEFAULT '����',
	`level` TINYINT (4) NULL DEFAULT 1,
	`score` INT (11) NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	UNIQUE KEY `username` (`username`)
) ENGINE = INNODB AUTO_INCREMENT = 10000 DEFAULT CHARACTER
SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- customer��Ĳ�������
INSERT INTO `customer`
VALUES
	(
		10000,
		'����ƽ',
		'litao',
		'litao@shop.com',
		'15959787657',
		'��',
		1,
		50
	),
	(
		10002,
		'test',
		'test',
		'litao@shop.com',
		'15959787657',
		'��',
		1,
		50
	),
	(
		10003,
		'haha',
		'haha',
		'litao@shop.com',
		'15959787657',
		'��',
		1,
		50
	);

-- ����kind�� ��Ʒ����
DROP TABLE
IF EXISTS `kind`;

CREATE TABLE kind (
	`id` INT AUTO_INCREMENT NOT NULL,
	`kName` VARCHAR (16),
	PRIMARY KEY (`id`),
	UNIQUE KEY `kname` (`kname`)
) ENGINE = INNODB AUTO_INCREMENT = 1 DEFAULT CHARACTER
SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

INSERT INTO `kind`
VALUES
	(1, '�ֻ�����'),
	(2, '���԰칫'),
	(3, 'ͼ����Ƶ'),
	(4, '��װ');

-- ����product��
DROP TABLE
IF EXISTS `product`;

CREATE TABLE `product` (
	`id` INT AUTO_INCREMENT NOT NULL,
	`pName` VARCHAR (64) NULL,
	`pDesc` text,
	`pNum` INT NULL,
	`pubTime` varchar(32) NULL,
	`pKeepTime` int NULL,
	`pImage` VARCHAR (255) NULL,
	`kId` INT NOT NULL,
	`iPrice` NUMERIC (7, 2) NULL,
	`mPrice` NUMERIC (7, 2) NULL,
	`isHot` enum ('��', '��') NOT NULL DEFAULT '��',
	`isShow` enum ('��', '��') NOT NULL DEFAULT '��',
	PRIMARY KEY (`id`),
	CONSTRAINT `fk_kid` FOREIGN KEY (`kId`) REFERENCES `kind` (`id`),
	UNIQUE KEY `pName` (`pName`)
) ENGINE = INNODB AUTO_INCREMENT = 10000 DEFAULT CHARACTER
SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- product��Ĳ�������
INSERT INTO `product`
VALUES
	(
		10000,
		'С��note3',
		'С��note3ȫ��ͨ',
		1000,
		'2015-12-11 00:00:00',
		360,
		'img/hot/xiaomi.jpg',
		1,
		999,
		1199,
		'��',
		'��'
	),
	(
		10001,
		'����',
		'����metal',
		1000,
		'2015-12-11 00:00:00',
		360,
		'img/hot/meizu.jpg',
		1,
		999,
		1199,
		'��',
		'��'
	),
	(
		10002,
		'����pro6',
		'����pro6 С�ô�һ��',
		1000,
		'2015-12-11 00:00:00',
		360,
		'img/hot/meizu2.png',
		1,
		999,
		1199,
		'��',
		'��'
	),
	(
		10003,
		'����',
		'ȫ���ؼ�',
		1000,
		'2015-12-11 00:00:00',
		360,
		'img/hot/shuma.jpg',
		1,
		9.9,
		1199,
		'��',
		'��'
	),
	(
		10004,
		'�����ֻ�',
		'�����ֻ���ǰ�ż�',
		1000,
		'2015-12-11 00:00:00',
		360,
		'img/hot/shuma2.jpg',
		1,
		999,
		1199,
		'��',
		'��'
	),
	(
		10005,
		'С��max',
		'С��maxȫ��ͨ',
		1000,
		'2015-12-11 00:00:00',
		360,
		'img/hot/xiaomi1.jpg',
		1,
		1499,
		1500,
		'��',
		'��'
	),
	(
		10006,
		'ipad2',
		'ipad2',
		1000,
		'2015-12-11 00:00:00',
		360,
		'img/show/ipad.jpg',
		1,
		999,
		1199,
		'��',
		'��'
	),
(
		10007,
		'opp7',
		'opp7',
		1000,
		'2015-12-11 00:00:00',
		360,
		'img/show/oppor7.png',
		1,
		999,
		1199,
		'��',
		'��'
	),
(
		10008,
		'����s7',
		'����s7',
		1000,
		'2015-12-11 00:00:00',
		360,
		'img/show/sanxing.jpg',
		1,
		999,
		1199,
		'��',
		'��'
	),
(
		10009,
		'ifff',
		'ipad2',
		1000,
		'2015-12-11 00:00:00',
		360,
		'img/show/ipad.jpg',
		1,
		999,
		1199,
		'��',
		'��'
	),
(
		10010,
		'dfasdf',
		'opp7',
		1000,
		'2015-12-11 00:00:00',
		360,
		'img/show/oppor7.png',
		1,
		999,
		1199,
		'��',
		'��'
	),
(
		10011,
		'fsdfddsf',
		'��fdsf7',
		1000,
		'2015-12-11 00:00:00',
		360,
		'img/show/sanxing.jpg',
		1,
		999,
		1199,
		'��',
		'��'
	),
(
		100012,
		'idfffdsf',
		'ipad2',
		1000,
		'2015-12-11 00:00:00',
		360,
		'img/show/ipad.jpg',
		1,
		999,
		1199,
		'��',
		'��'
	),
(
		100013,
		'fdsdssf',
		'opp7',
		1000,
		'2015-12-11 00:00:00',
		360,
		'img/show/oppor7.png',
		1,
		999,
		1199,
		'��',
		'��'
	),
(
		100014,
		'fdsdsf',
		'����s7',
		1000,
		'2015-12-11 00:00:00',
		360,
		'img/show/sanxing.jpg',
		1,
		999,
		1199,
		'��',
		'��'
	),
(
		100015,
		'fasddsaf',
		'ipad2',
		1000,
		'2015-12-11 00:00:00',
		360,
		'img/show/ipad.jpg',
		1,
		999,
		1199,
		'��',
		'��'
	),
(
		10016,
		'dsafdsafsd',
		'opp7',
		1000,
		'2015-12-11 00:00:00',
		360,
		'img/show/oppor7.png',
		1,
		999,
		1199,
		'��',
		'��'
	),
(
		100017,
		'fsdffsdsdf',
		'����s7',
		1000,
		'2015-12-11 00:00:00',
		360,
		'img/show/sanxing.jpg',
		1,
		999,
		1199,
		'��',
		'��'
	),(
		10018,
		'fsdfsdrsdaf',
		'ipad2',
		1000,
		'2015-12-11 00:00:00',
		360,
		'img/show/ipad.jpg',
		1,
		999,
		1199,
		'��',
		'��'
	),
(
		10019,
		'fdsfsrwedsvc',
		'opp7',
		1000,
		'2015-12-11 00:00:00',
		360,
		'img/show/oppor7.png',
		1,
		999,
		1199,
		'��',
		'��'
	),
(
		10020,
		'fdsfvczs',
		'����s7',
		1000,
		'2015-12-11 00:00:00',
		360,
		'img/show/sanxing.jpg',
		1,
		999,
		1199,
		'��',
		'��'
	),
(
		10021,
		'iffsfdsdf',
		'ipad2',
		1000,
		'2015-12-11 00:00:00',
		360,
		'img/show/ipad.jpg',
		1,
		999,
		1199,
		'��',
		'��'
	),
(
		10022,
		'dfdfasff',
		'opp7',
		1000,
		'2015-12-11 00:00:00',
		360,
		'img/show/oppor7.png',
		1,
		999,
		1199,
		'��',
		'��'
	),
(
		10023,
		'fsfsadfdfsf',
		'��fdsf7',
		1000,
		'2015-12-11 00:00:00',
		360,
		'img/show/sanxing.jpg',
		1,
		999,
		1199,
		'��',
		'��'
	),
(
		100024,
		'idfffsdffdsf',
		'ipad2',
		1000,
		'2015-12-11 00:00:00',
		360,
		'img/show/ipad.jpg',
		1,
		999,
		1199,
		'��',
		'��'
	),
(
		100025,
		'fdfdsfsf',
		'opp7',
		1000,
		'2015-12-11 00:00:00',
		360,
		'img/show/oppor7.png',
		1,
		999,
		1199,
		'��',
		'��'
	),
(
		100026,
		'fdfasdsf',
		'����s7',
		1000,
		'2015-12-11 00:00:00',
		360,
		'img/show/sanxing.jpg',
		1,
		999,
		1199,
		'��',
		'��'
	),
(
		100027,
		'fdsfsdfaf',
		'ipad2',
		1000,
		'2015-12-11 00:00:00',
		360,
		'img/show/ipad.jpg',
		1,
		999,
		1199,
		'��',
		'��'
	),
(
		10028,
		'dsafdsfsd',
		'opp7',
		1000,
		'2015-12-11 00:00:00',
		360,
		'img/show/oppor7.png',
		1,
		999,
		1199,
		'��',
		'��'
	),
(
		100029,
		'fsdfsdadf',
		'����s7',
		1000,
		'2015-12-11 00:00:00',
		360,
		'img/show/sanxing.jpg',
		1,
		999,
		1199,
		'��',
		'��'
	);

DROP TABLE
IF EXISTS `sales`;

-- ����sales��
CREATE TABLE sales (
	`id` BIGINT AUTO_INCREMENT,
	`cId` INT NOT NULL,
	`pId` INT NOT NULL,
	`count` INT NULL,
	`totalPrice` NUMERIC (7, 2) NULL UNIQUE,
	`orderDate` DATETIME NULL,
	`invoiceNo` CHAR (15) NULL,
	`orderStatus` VARCHAR (10) NULL,
	`delivDate` DATETIME NULL,
	PRIMARY KEY (`id`),
	CONSTRAINT `fk_cid` FOREIGN KEY (`cId`) REFERENCES `customer` (`id`),
	CONSTRAINT `fk_pid` FOREIGN KEY (`pId`) REFERENCES `product` (`id`)
) ENGINE = INNODB AUTO_INCREMENT = 1000000000 DEFAULT CHARACTER
SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- sales��������
INSERT INTO sales
VALUES
	(
		1000000000,
		10000,
		10000,
		2,
		1998,
		'2015-12-21 00:00:00',
		'987657898787897',
		'�ѷ���',
		'2015-12-22 00:00:00'
	);

DROP TABLE
IF EXISTS `shopcart`;

-- ����shopcart��
CREATE TABLE shopcart (
	`id` INT NOT NULL AUTO_INCREMENT,
	`cId` INT NOT NULL,
	`pId` INT NOT NULL,
	`count` INT NULL,
	`isBuy` enum ('��', '��') NOT NULL DEFAULT '��',
	`totalPrice` NUMERIC (7, 2) NULL,
	PRIMARY KEY (`id`)
) ENGINE = INNODB AUTO_INCREMENT = 1 DEFAULT CHARACTER
SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ����admin�� �ͻ���
DROP TABLE
IF EXISTS `admin`;

CREATE TABLE `admin` (
	`username` VARCHAR (64) NOT NULL,
	`password` VARCHAR (32) NOT NULL,
	`email` VARCHAR (32) NULL DEFAULT NULL,
	`level` TINYINT (4) NULL DEFAULT 1,
	PRIMARY KEY (`username`)
) ENGINE = INNODB DEFAULT CHARACTER
SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- customer��Ĳ�������
INSERT INTO `admin`
VALUES
	(
		'root',
		'root',
		'root@shop.com',
		1
	),
	(
		'admin',
		'admin',
		'admin@shop.com',
		2
	);


/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 8.0.12 : Database - db_boot_base
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_boot_base` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `db_boot_base`;

/*Table structure for table `ylrc_article` */

DROP TABLE IF EXISTS `ylrc_article`;

CREATE TABLE `ylrc_article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `contents` text COLLATE utf8_unicode_ci NOT NULL,
  `head_pic` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `star` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ys835lsrjcc7hr6xtcfcarw1` (`title`),
  KEY `FKif6uli6grd36ablf4l3p76xr5` (`user_id`),
  CONSTRAINT `FKif6uli6grd36ablf4l3p76xr5` FOREIGN KEY (`user_id`) REFERENCES `ylrc_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `ylrc_article` */

insert  into `ylrc_article`(`id`,`create_time`,`update_time`,`contents`,`head_pic`,`status`,`title`,`user_id`,`star`) values (1,'2025-03-31 20:35:44','2025-03-31 20:35:44','222222','',1,'111111',1,1),(2,'2025-03-31 20:36:20','2025-03-31 20:36:20','333333','20250331/1743424572098.png',1,'222222',5,1),(3,'2025-03-31 20:51:08','2025-03-31 20:51:08','6666666','',1,'5555555',1,3),(4,'2025-03-31 20:52:35','2025-03-31 20:52:35','深深的埋在泥土之中','20250331/1743425524773.jpg',1,'我是一颗小小的石头啊',1,4),(5,'2025-03-31 20:53:22','2025-03-31 20:53:22','33333','',1,'33333',1,5),(6,'2025-03-31 20:53:32','2025-03-31 20:53:32','444444','',1,'44444222',5,6),(7,'2025-03-31 20:53:42','2025-03-31 20:53:42','55555555','',1,'555555555555',5,7),(8,'2025-03-31 20:53:52','2025-03-31 20:53:52','6666666','',1,'666666',2,8),(9,'2025-03-31 20:54:37','2025-03-31 20:54:37','进项清洁','',1,'我的乡愁',1,9),(10,'2025-03-31 20:55:01','2025-03-31 20:55:01','是那么的不同','',1,'你的世界',1,3),(11,'2025-03-31 20:55:17','2025-03-31 20:55:17','冲出镜湖','',1,'提灯定损',1,4),(12,'2025-04-01 10:31:20','2025-04-01 10:31:20','aaaaa','',1,'aaaaa',1,0),(13,'2025-04-01 10:31:29','2025-04-01 10:31:29','bbbbb','',1,'bbbbbb',1,0),(14,'2025-04-01 10:31:36','2025-04-01 10:31:36','ccccc','',1,'ccccc',1,0),(15,'2025-04-01 10:31:43','2025-04-01 10:31:43','dddddd','',1,'ddddd',1,0),(16,'2025-04-01 10:31:50','2025-04-01 10:31:50','eeeeee','',1,'eeeee',1,0),(17,'2025-04-01 10:31:59','2025-04-01 10:31:59','fffff','',1,'fffff',1,0),(18,'2025-04-01 10:32:05','2025-04-01 10:32:05','gggggg','',1,'ggggg',1,0),(19,'2025-04-01 10:32:12','2025-04-01 10:32:12','hhhhhh','',1,'hhhhhh',1,0),(20,'2025-04-01 10:32:26','2025-04-01 10:32:26','jjjjjj','',1,'jjjjjj',1,0),(21,'2025-04-01 10:32:36','2025-04-01 10:32:36','kkkkkkkk','',1,'kkkkkkk',1,0),(22,'2025-04-01 10:32:44','2025-04-01 10:32:44','mmmmmmm','',1,'mmmmm',1,0),(29,'2025-04-01 20:23:40','2025-04-01 20:23:40','ghghgh',NULL,1,'三月三的三',5,1),(30,'2025-04-01 20:23:40','2025-04-01 20:23:40','THIS IS A TEST',NULL,1,'五月无所谓无',2,2);

/*Table structure for table `ylrc_database_bak` */

DROP TABLE IF EXISTS `ylrc_database_bak`;

CREATE TABLE `ylrc_database_bak` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `filename` varchar(32) NOT NULL,
  `filepath` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

/*Data for the table `ylrc_database_bak` */

insert  into `ylrc_database_bak`(`id`,`create_time`,`update_time`,`filename`,`filepath`) values (10,'2020-03-22 19:36:47','2020-03-22 19:36:47','db_boot_base_20200322193647.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),(11,'2020-03-22 19:37:54','2020-03-22 19:37:54','db_boot_base_20200322193754.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),(12,'2020-03-22 19:40:04','2020-03-22 19:40:04','db_boot_base_20200322194004.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),(14,'2020-03-22 19:40:14','2020-03-22 19:40:14','db_boot_base_20200322194014.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),(15,'2020-03-22 19:40:19','2020-03-22 19:40:19','db_boot_base_20200322194019.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),(17,'2020-03-22 19:43:34','2020-03-22 19:43:34','db_boot_base_20200322194334.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),(18,'2020-03-22 19:43:39','2020-03-22 19:43:39','db_boot_base_20200322194339.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),(20,'2020-03-22 19:43:49','2020-03-22 19:43:49','db_boot_base_20200322194349.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),(21,'2020-03-22 19:43:54','2020-03-22 19:43:54','db_boot_base_20200322194354.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),(22,'2020-03-22 19:43:59','2020-03-22 19:43:59','db_boot_base_20200322194359.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),(23,'2020-03-22 19:44:04','2020-03-22 19:44:04','db_boot_base_20200322194404.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),(24,'2020-03-22 19:44:09','2020-03-22 19:44:09','db_boot_base_20200322194409.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),(25,'2020-03-22 19:44:14','2020-03-22 19:44:14','db_boot_base_20200322194414.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),(26,'2020-03-22 19:44:19','2020-03-22 19:44:19','db_boot_base_20200322194419.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),(27,'2020-03-22 19:44:24','2020-03-22 19:44:24','db_boot_base_20200322194424.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),(28,'2020-03-22 19:44:29','2020-03-22 19:44:29','db_boot_base_20200322194429.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),(29,'2020-03-22 19:44:34','2020-03-22 19:44:34','db_boot_base_20200322194434.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),(30,'2020-03-22 19:44:39','2020-03-22 19:44:39','db_boot_base_20200322194439.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),(31,'2020-03-23 17:46:49','2020-03-23 17:46:49','db_boot_base_20200323174649.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/');

/*Table structure for table `ylrc_menu` */

DROP TABLE IF EXISTS `ylrc_menu`;

CREATE TABLE `ylrc_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `name` varchar(18) NOT NULL,
  `url` varchar(128) DEFAULT NULL,
  `icon` varchar(32) DEFAULT NULL,
  `sort` int(11) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `is_bitton` bit(1) NOT NULL,
  `is_show` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsbtnjocfrq29e8taxdwo21gic` (`parent_id`),
  CONSTRAINT `FKsbtnjocfrq29e8taxdwo21gic` FOREIGN KEY (`parent_id`) REFERENCES `ylrc_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

/*Data for the table `ylrc_menu` */

insert  into `ylrc_menu`(`id`,`create_time`,`update_time`,`name`,`url`,`icon`,`sort`,`parent_id`,`is_bitton`,`is_show`) values (2,'2020-03-14 14:26:03','2020-03-14 18:24:53','系统设置','','mdi-settings',0,NULL,'\0',''),(3,'2020-03-14 16:58:55','2020-03-14 18:26:02','菜单管理','/menu/list','mdi-view-list',1,2,'\0',''),(5,'2020-03-14 17:04:44','2020-03-14 18:27:53','新增','/menu/add','mdi-plus',2,3,'\0',''),(7,'2020-03-14 17:07:43','2020-03-15 12:11:25','角色管理','/role/list','mdi-account-settings-variant',5,2,'\0',''),(8,'2020-03-14 18:28:48','2020-03-21 22:04:45','编辑','edit(\'/menu/edit\')','mdi-grease-pencil',3,3,'',''),(9,'2020-03-14 18:30:00','2020-03-21 22:08:20','删除','del(\'/menu/delete\')','mdi-close',4,3,'',''),(10,'2020-03-15 12:12:00','2020-03-15 12:12:00','添加','/role/add','mdi-account-plus',6,7,'\0',''),(11,'2020-03-15 12:12:36','2020-03-21 22:10:45','编辑','edit(\'/role/edit\')','mdi-account-edit',7,7,'',''),(12,'2020-03-15 12:13:19','2020-03-21 22:15:27','删除','del(\'/role/delete\')','mdi-account-remove',8,7,'',''),(13,'2020-03-15 12:14:52','2020-03-15 12:17:00','用户管理','/user/list','mdi-account-multiple',9,2,'\0',''),(14,'2020-03-15 12:15:22','2020-03-15 12:17:27','添加','/user/add','mdi-account-plus',10,13,'\0',''),(15,'2020-03-16 17:18:14','2020-03-21 22:11:19','编辑','edit(\'/user/edit\')','mdi-account-edit',11,13,'',''),(16,'2020-03-16 17:19:01','2020-03-21 22:15:36','删除','del(\'/user/delete\')','mdi-account-remove',12,13,'',''),(19,'2020-03-22 11:24:36','2020-03-22 11:26:00','上传图片','/upload/upload_photo','mdi-arrow-up-bold-circle',0,13,'\0','\0'),(20,'2020-03-22 14:09:35','2020-03-22 14:09:47','日志管理','/system/operator_log_list','mdi-tag-multiple',13,2,'\0',''),(21,'2020-03-22 14:11:39','2020-03-22 14:11:39','删除','del(\'/system/delete_operator_log\')','mdi-tag-remove',14,20,'',''),(22,'2020-03-22 14:12:57','2020-03-22 14:46:55','清空日志','delAll(\'/system/delete_all_operator_log\')','mdi-delete-circle',15,20,'',''),(23,'2020-03-22 14:46:40','2020-03-22 14:47:09','数据备份','/database_bak/list','mdi-database',16,2,'\0',''),(24,'2020-03-22 14:48:07','2020-03-22 15:13:41','备份','add(\'/database_bak/add\')','mdi-database-plus',17,23,'',''),(25,'2020-03-22 14:49:03','2020-03-22 14:49:03','删除','del(\'/database_bak/delete\')','mdi-database-minus',18,23,'',''),(26,'2020-03-22 19:36:20','2020-03-22 19:36:20','还原','restore(\'/database_bak/restore\')','mdi-database-minus',19,23,'',''),(28,'2025-03-31 19:43:05','2025-03-31 19:43:05','文章管理','','mdi-marker',0,NULL,'\0',''),(29,'2025-03-31 19:44:37','2025-03-31 19:44:37','文章列表','/article/index','mdi-arrange-send-backward',0,28,'\0',''),(30,'2025-03-31 19:50:09','2025-03-31 19:50:09','新增','/article/add','mdi-account',0,29,'\0',''),(31,'2025-04-01 14:04:05','2025-04-01 20:30:41','导出','exportt(\'/article/export\')','mdi-arrow-collapse-down',0,29,'','');

/*Table structure for table `ylrc_operater_log` */

DROP TABLE IF EXISTS `ylrc_operater_log`;

CREATE TABLE `ylrc_operater_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `content` varchar(1024) NOT NULL,
  `operator` varchar(18) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=317 DEFAULT CHARSET=utf8;

/*Data for the table `ylrc_operater_log` */

insert  into `ylrc_operater_log`(`id`,`create_time`,`update_time`,`content`,`operator`) values (172,'2020-03-22 14:49:22','2020-03-22 14:49:22','编辑角色【超级管理员】','猿来入此'),(173,'2020-03-22 14:58:14','2020-03-22 14:58:14','用户【猿来入此】于【2020-03-22 14:58:13】登录系统！','猿来入此'),(174,'2020-03-22 15:09:49','2020-03-22 15:09:49','用户【猿来入此】于【2020-03-22 15:09:49】登录系统！','猿来入此'),(175,'2020-03-22 15:11:09','2020-03-22 15:11:09','用户【猿来入此】于【2020-03-22 15:11:08】登录系统！','猿来入此'),(176,'2020-03-22 15:13:41','2020-03-22 15:13:41','编辑菜单信息【Menu [name=备份, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=add(\'/database_bak/add\'), icon=mdi-database-plus, sort=17, isButton=true, isShow=true]】','猿来入此'),(177,'2020-03-22 16:16:31','2020-03-22 16:16:31','用户【猿来入此】于【2020-03-22 16:16:31】登录系统！','猿来入此'),(178,'2020-03-22 16:31:23','2020-03-22 16:31:23','用户【猿来入此】于【2020-03-22 16:31:23】登录系统！','猿来入此'),(179,'2020-03-22 16:56:25','2020-03-22 16:56:25','用户【猿来入此】于【2020-03-22 16:56:25】登录系统！','猿来入此'),(180,'2020-03-22 17:00:42','2020-03-22 17:00:42','用户【猿来入此】于【2020-03-22 17:00:42】登录系统！','猿来入此'),(181,'2020-03-22 17:13:01','2020-03-22 17:13:01','数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','猿来入此'),(182,'2020-03-22 17:15:04','2020-03-22 17:15:04','数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322171504.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','猿来入此'),(183,'2020-03-22 17:15:14','2020-03-22 17:15:14','数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322171514.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','猿来入此'),(184,'2020-03-22 17:21:02','2020-03-22 17:21:02','用户【猿来入此】于【2020-03-22 17:21:02】登录系统！','猿来入此'),(185,'2020-03-22 17:21:15','2020-03-22 17:21:15','添加角色【dsadsasadsa】','猿来入此'),(186,'2020-03-22 18:09:55','2020-03-22 18:09:55','数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322180955.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','猿来入此'),(187,'2020-03-22 18:59:16','2020-03-22 18:59:16','数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322185916.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','猿来入此'),(188,'2020-03-22 18:59:41','2020-03-22 18:59:41','数据库成功还原，还原文件信息：DatabaseBak [filename=db_boot_base_20200322180955.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','猿来入此'),(189,'2020-03-22 19:12:03','2020-03-22 19:12:03','数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322191203.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','猿来入此'),(190,'2020-03-22 19:12:59','2020-03-22 19:12:59','数据库成功还原，还原文件信息：DatabaseBak [filename=db_boot_base_20200322191203.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','猿来入此'),(191,'2020-03-22 19:35:07','2020-03-22 19:35:07','用户【猿来入此】于【2020-03-22 19:35:07】登录系统！','猿来入此'),(192,'2020-03-22 19:35:21','2020-03-22 19:35:21','数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322193521.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','猿来入此'),(193,'2020-03-22 19:36:20','2020-03-22 19:36:20','添加菜单信息【Menu [name=还原, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=restore(\'/database_bak/restore\'), icon=mdi-database-minus, sort=19, isButton=true, isShow=true]】','猿来入此'),(194,'2020-03-22 19:36:34','2020-03-22 19:36:34','编辑角色【超级管理员】','猿来入此'),(195,'2020-03-22 19:36:47','2020-03-22 19:36:47','数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322193647.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','猿来入此'),(196,'2020-03-22 19:37:21','2020-03-22 19:37:21','数据库成功还原，还原文件信息：DatabaseBak [filename=db_boot_base_20200322193647.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','猿来入此'),(197,'2020-03-22 19:37:54','2020-03-22 19:37:54','数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322193754.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','猿来入此'),(198,'2020-03-22 19:38:15','2020-03-22 19:38:15','数据库成功还原，还原文件信息：DatabaseBak [filename=db_boot_base_20200322193754.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','猿来入此'),(199,'2020-03-22 19:43:34','2020-03-22 19:43:34','数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194334.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','未知(获取登录用户失败)'),(200,'2020-03-22 19:43:39','2020-03-22 19:43:39','数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194339.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','未知(获取登录用户失败)'),(201,'2020-03-22 19:43:44','2020-03-22 19:43:44','数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194344.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','未知(获取登录用户失败)'),(202,'2020-03-22 19:43:49','2020-03-22 19:43:49','数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194349.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','未知(获取登录用户失败)'),(203,'2020-03-22 19:43:52','2020-03-22 19:43:52','用户【猿来入此】于【2020-03-22 19:43:52】登录系统！','猿来入此'),(204,'2020-03-22 19:43:54','2020-03-22 19:43:54','数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194354.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','未知(获取登录用户失败)'),(205,'2020-03-22 19:43:59','2020-03-22 19:43:59','数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194359.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','未知(获取登录用户失败)'),(206,'2020-03-22 19:44:04','2020-03-22 19:44:04','数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194404.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','未知(获取登录用户失败)'),(207,'2020-03-22 19:44:09','2020-03-22 19:44:09','数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194409.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','未知(获取登录用户失败)'),(208,'2020-03-22 19:44:14','2020-03-22 19:44:14','数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194414.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','未知(获取登录用户失败)'),(209,'2020-03-22 19:44:19','2020-03-22 19:44:19','数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194419.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','未知(获取登录用户失败)'),(210,'2020-03-22 19:44:24','2020-03-22 19:44:24','数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194424.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','未知(获取登录用户失败)'),(211,'2020-03-22 19:44:29','2020-03-22 19:44:29','数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194429.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','未知(获取登录用户失败)'),(212,'2020-03-22 19:44:34','2020-03-22 19:44:34','数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194434.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','未知(获取登录用户失败)'),(213,'2020-03-22 19:44:39','2020-03-22 19:44:39','数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194439.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','未知(获取登录用户失败)'),(214,'2020-03-22 21:11:19','2020-03-22 21:11:19','用户【猿来入此】于【2020-03-22 21:11:19】登录系统！','猿来入此'),(215,'2020-03-22 21:18:12','2020-03-22 21:18:12','用户【猿来入此】于【2020-03-22 21:18:11】登录系统！','猿来入此'),(216,'2020-03-22 21:36:47','2020-03-22 21:36:47','用户【猿来入此】于【2020-03-22 21:36:47】登录系统！','猿来入此'),(217,'2020-03-22 21:43:51','2020-03-22 21:43:51','用户【猿来入此】于【2020-03-22 21:43:51】登录系统！','猿来入此'),(218,'2020-03-23 17:41:23','2020-03-23 17:41:23','用户【猿来入此】于【2020-03-23 17:41:23】登录系统！','猿来入此'),(219,'2020-03-23 17:41:49','2020-03-23 17:41:49','添加菜单信息【Menu [name=sdadsa递四方速递, parent=null, url=https://www.yuanlrc.com/, icon=mdi-alarm-snooze, sort=0, isButton=false, isShow=true]】','猿来入此'),(220,'2020-03-23 17:42:02','2020-03-23 17:42:02','编辑菜单信息【Menu [name=sdadsa递四方速递, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=https://www.yuanlrc.com/, icon=mdi-alarm-snooze, sort=3, isButton=false, isShow=false]】','猿来入此'),(221,'2020-03-23 17:42:09','2020-03-23 17:42:09','删除菜单信息，菜单ID【27】','猿来入此'),(222,'2020-03-23 17:42:32','2020-03-23 17:42:32','编辑角色【sdfds水电费多少】','猿来入此'),(223,'2020-03-23 17:42:45','2020-03-23 17:42:45','编辑角色【sdfds水电费多少】','猿来入此'),(224,'2020-03-23 17:42:56','2020-03-23 17:42:56','删除角色ID【7】','猿来入此'),(225,'2020-03-23 17:43:16','2020-03-23 17:43:16','添加角色【撒旦撒】','猿来入此'),(226,'2020-03-23 17:43:29','2020-03-23 17:43:29','删除角色ID【8】','猿来入此'),(227,'2020-03-23 17:44:11','2020-03-23 17:44:11','添加用户，用户名：打撒大撒','猿来入此'),(228,'2020-03-23 17:44:29','2020-03-23 17:44:29','编辑用户，用户名：打撒大撒22','猿来入此'),(229,'2020-03-23 17:44:37','2020-03-23 17:44:37','添加用户，用户ID：6','猿来入此'),(230,'2020-03-23 17:44:55','2020-03-23 17:44:55','添加用户，用户ID：4','猿来入此'),(231,'2020-03-23 17:45:47','2020-03-23 17:45:47','编辑用户，用户名：小刘同志','猿来入此'),(232,'2020-03-23 17:46:49','2020-03-23 17:46:49','数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200323174649.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','猿来入此'),(233,'2020-03-23 17:47:16','2020-03-23 17:47:16','数据库成功还原，还原文件信息：DatabaseBak [filename=db_boot_base_20200323174649.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','猿来入此'),(234,'2020-03-23 17:48:15','2020-03-23 17:48:15','用户【测试账号】于【2020-03-23 17:48:15】登录系统！','测试账号'),(235,'2020-03-23 17:49:00','2020-03-23 17:49:00','编辑角色【测试角色】','测试账号'),(236,'2020-03-23 17:49:50','2020-03-23 17:49:50','用户【猿来入此】于【2020-03-23 17:49:50】登录系统！','猿来入此'),(237,'2020-03-23 17:50:03','2020-03-23 17:50:03','编辑用户，用户名：小刘同志','猿来入此'),(238,'2020-03-23 17:50:19','2020-03-23 17:50:19','编辑用户，用户名：小刘同志','猿来入此'),(239,'2020-03-23 17:50:56','2020-03-23 17:50:56','用户【猿来入此】于【2020-03-23 17:50:56】登录系统！','猿来入此'),(240,'2025-03-29 09:58:05','2025-03-29 09:58:05','用户【测试账号】于【2025-03-29 09:58:05】登录系统！','测试账号'),(241,'2025-03-29 09:59:18','2025-03-29 09:59:18','用户【猿来入此】于【2025-03-29 09:59:17】登录系统！','猿来入此'),(242,'2025-03-29 10:00:13','2025-03-29 10:00:13','编辑用户，用户名：测试账号2','猿来入此'),(243,'2025-03-31 12:05:49','2025-03-31 12:05:49','用户【测试账号2】于【2025-03-31 12:05:48】登录系统！','测试账号2'),(244,'2025-03-31 12:06:28','2025-03-31 12:06:28','用户【猿来入此】于【2025-03-31 12:06:27】登录系统！','猿来入此'),(245,'2025-03-31 12:07:03','2025-03-31 12:07:03','编辑用户，用户名：猿来入此','猿来入此'),(246,'2025-03-31 13:16:14','2025-03-31 13:16:14','用户【猿来入此】于【2025-03-31 13:16:13】登录系统！','猿来入此'),(247,'2025-03-31 19:41:38','2025-03-31 19:41:38','用户【猿来入此】于【2025-03-31 19:41:37】登录系统！','猿来入此'),(248,'2025-03-31 19:43:05','2025-03-31 19:43:05','添加菜单信息【Menu [name=文章管理, parent=null, url=, icon=mdi-marker, sort=0, isButton=false, isShow=true]】','猿来入此'),(249,'2025-03-31 19:43:41','2025-03-31 19:43:41','编辑角色【超级管理员】','猿来入此'),(250,'2025-03-31 19:44:37','2025-03-31 19:44:37','添加菜单信息【Menu [name=文章列表, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=/article/index, icon=mdi-arrange-send-backward, sort=0, isButton=false, isShow=true]】','猿来入此'),(251,'2025-03-31 19:44:54','2025-03-31 19:44:54','用户【猿来入此】于【2025-03-31 19:44:54】登录系统！','猿来入此'),(252,'2025-03-31 19:45:44','2025-03-31 19:45:44','编辑角色【超级管理员】','猿来入此'),(253,'2025-03-31 19:46:16','2025-03-31 19:46:16','用户【猿来入此】于【2025-03-31 19:46:15】登录系统！','猿来入此'),(254,'2025-03-31 19:48:15','2025-03-31 19:48:15','用户【猿来入此】于【2025-03-31 19:48:14】登录系统！','猿来入此'),(255,'2025-03-31 19:50:09','2025-03-31 19:50:09','添加菜单信息【Menu [name=新增, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=/article/add, icon=mdi-account, sort=0, isButton=false, isShow=true]】','猿来入此'),(256,'2025-03-31 19:50:23','2025-03-31 19:50:23','编辑角色【超级管理员】','猿来入此'),(257,'2025-03-31 19:51:37','2025-03-31 19:51:37','用户【猿来入此】于【2025-03-31 19:51:36】登录系统！','猿来入此'),(258,'2025-03-31 20:16:42','2025-03-31 20:16:42','用户【猿来入此】于【2025-03-31 20:16:41】登录系统！','猿来入此'),(259,'2025-03-31 20:22:06','2025-03-31 20:22:06','用户【猿来入此】于【2025-03-31 20:22:05】登录系统！','猿来入此'),(260,'2025-03-31 20:29:27','2025-03-31 20:29:27','添加用户，用户名：111111','猿来入此'),(261,'2025-03-31 20:30:03','2025-03-31 20:30:03','编辑用户，用户名：111111','猿来入此'),(262,'2025-03-31 20:35:44','2025-03-31 20:35:44','添加文章，标题为：111111','猿来入此'),(263,'2025-03-31 20:36:21','2025-03-31 20:36:21','添加文章，标题为：222222','猿来入此'),(264,'2025-03-31 20:45:08','2025-03-31 20:45:08','用户【猿来入此】于【2025-03-31 20:45:08】登录系统！','猿来入此'),(265,'2025-03-31 20:51:08','2025-03-31 20:51:08','添加文章，标题为：5555555','猿来入此'),(266,'2025-03-31 20:52:35','2025-03-31 20:52:35','添加文章，标题为：我是一颗小小的石头啊','猿来入此'),(267,'2025-03-31 20:53:22','2025-03-31 20:53:22','添加文章，标题为：33333','猿来入此'),(268,'2025-03-31 20:53:32','2025-03-31 20:53:32','添加文章，标题为：44444','猿来入此'),(269,'2025-03-31 20:53:42','2025-03-31 20:53:42','添加文章，标题为：555555555555','猿来入此'),(270,'2025-03-31 20:53:52','2025-03-31 20:53:52','添加文章，标题为：666666','猿来入此'),(271,'2025-03-31 20:54:37','2025-03-31 20:54:37','添加文章，标题为：我的乡愁','猿来入此'),(272,'2025-03-31 20:55:02','2025-03-31 20:55:02','添加文章，标题为：你的世界','猿来入此'),(273,'2025-03-31 20:55:17','2025-03-31 20:55:17','添加文章，标题为：提灯定损','猿来入此'),(274,'2025-03-31 23:35:49','2025-03-31 23:35:49','用户【猿来入此】于【2025-03-31 23:35:49】登录系统！','猿来入此'),(275,'2025-04-01 09:33:22','2025-04-01 09:33:22','用户【猿来入此】于【2025-04-01 09:33:21】登录系统！','猿来入此'),(276,'2025-04-01 09:49:39','2025-04-01 09:49:39','用户【猿来入此】于【2025-04-01 09:49:38】登录系统！','猿来入此'),(277,'2025-04-01 10:31:20','2025-04-01 10:31:20','添加文章，标题为：aaaaa','猿来入此'),(278,'2025-04-01 10:31:29','2025-04-01 10:31:29','添加文章，标题为：bbbbbb','猿来入此'),(279,'2025-04-01 10:31:36','2025-04-01 10:31:36','添加文章，标题为：ccccc','猿来入此'),(280,'2025-04-01 10:31:44','2025-04-01 10:31:44','添加文章，标题为：ddddd','猿来入此'),(281,'2025-04-01 10:31:50','2025-04-01 10:31:50','添加文章，标题为：eeeee','猿来入此'),(282,'2025-04-01 10:31:59','2025-04-01 10:31:59','添加文章，标题为：fffff','猿来入此'),(283,'2025-04-01 10:32:05','2025-04-01 10:32:05','添加文章，标题为：ggggg','猿来入此'),(284,'2025-04-01 10:32:12','2025-04-01 10:32:12','添加文章，标题为：hhhhhh','猿来入此'),(285,'2025-04-01 10:32:27','2025-04-01 10:32:27','添加文章，标题为：jjjjjj','猿来入此'),(286,'2025-04-01 10:32:36','2025-04-01 10:32:36','添加文章，标题为：kkkkkkk','猿来入此'),(287,'2025-04-01 10:32:44','2025-04-01 10:32:44','添加文章，标题为：mmmmm','猿来入此'),(288,'2025-04-01 11:10:09','2025-04-01 11:10:09','用户【猿来入此】于【2025-04-01 11:10:09】登录系统！','猿来入此'),(289,'2025-04-01 12:06:47','2025-04-01 12:06:47','用户【猿来入此】于【2025-04-01 12:06:47】登录系统！','猿来入此'),(290,'2025-04-01 12:53:07','2025-04-01 12:53:07','用户【猿来入此】于【2025-04-01 12:53:06】登录系统！','猿来入此'),(291,'2025-04-01 13:40:30','2025-04-01 13:40:30','用户【猿来入此】于【2025-04-01 13:40:29】登录系统！','猿来入此'),(292,'2025-04-01 14:04:06','2025-04-01 14:04:06','添加菜单信息【Menu [name=导出, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=/article/export, icon=mdi-arrow-collapse-down, sort=0, isButton=false, isShow=true]】','猿来入此'),(293,'2025-04-01 14:04:32','2025-04-01 14:04:32','用户【猿来入此】于【2025-04-01 14:04:31】登录系统！','猿来入此'),(294,'2025-04-01 14:04:46','2025-04-01 14:04:46','编辑角色【超级管理员】','猿来入此'),(295,'2025-04-01 14:05:03','2025-04-01 14:05:03','用户【猿来入此】于【2025-04-01 14:05:03】登录系统！','猿来入此'),(296,'2025-04-01 14:16:56','2025-04-01 14:16:56','用户【猿来入此】于【2025-04-01 14:16:56】登录系统！','猿来入此'),(297,'2025-04-01 14:54:33','2025-04-01 14:54:33','用户【猿来入此】于【2025-04-01 14:54:32】登录系统！','猿来入此'),(298,'2025-04-01 15:37:49','2025-04-01 15:37:49','用户【猿来入此】于【2025-04-01 15:37:49】登录系统！','猿来入此'),(299,'2025-04-01 15:44:30','2025-04-01 15:44:30','用户【猿来入此】于【2025-04-01 15:44:30】登录系统！','猿来入此'),(300,'2025-04-01 16:08:34','2025-04-01 16:08:34','用户【猿来入此】于【2025-04-01 16:08:33】登录系统！','猿来入此'),(301,'2025-04-01 16:43:08','2025-04-01 16:43:08','用户【猿来入此】于【2025-04-01 16:43:08】登录系统！','猿来入此'),(302,'2025-04-01 17:04:19','2025-04-01 17:04:19','用户【猿来入此】于【2025-04-01 17:04:18】登录系统！','猿来入此'),(303,'2025-04-01 17:34:21','2025-04-01 17:34:21','编辑角色【超级管理员】','猿来入此'),(304,'2025-04-01 17:34:58','2025-04-01 17:34:58','用户【猿来入此】于【2025-04-01 17:34:58】登录系统！','猿来入此'),(305,'2025-04-01 17:39:19','2025-04-01 17:39:19','编辑角色【超级管理员】','猿来入此'),(306,'2025-04-01 17:39:59','2025-04-01 17:39:59','用户【猿来入此】于【2025-04-01 17:39:59】登录系统！','猿来入此'),(307,'2025-04-01 18:21:44','2025-04-01 18:21:44','用户【猿来入此】于【2025-04-01 18:21:43】登录系统！','猿来入此'),(308,'2025-04-01 20:03:06','2025-04-01 20:03:06','用户【猿来入此】于【2025-04-01 20:03:06】登录系统！','猿来入此'),(309,'2025-04-01 20:30:41','2025-04-01 20:30:41','编辑菜单信息【Menu [name=导出, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=export(\"/article/export\"), icon=mdi-arrow-collapse-down, sort=0, isButton=true, isShow=true]】','猿来入此'),(310,'2025-04-01 20:33:04','2025-04-01 20:33:04','用户【猿来入此】于【2025-04-01 20:33:03】登录系统！','猿来入此'),(311,'2025-04-01 20:38:04','2025-04-01 20:38:04','用户【猿来入此】于【2025-04-01 20:38:04】登录系统！','猿来入此'),(312,'2025-04-01 20:38:22','2025-04-01 20:38:22','编辑角色【超级管理员】','猿来入此'),(313,'2025-04-01 20:38:33','2025-04-01 20:38:33','编辑角色【超级管理员】','猿来入此'),(314,'2025-04-01 20:38:59','2025-04-01 20:38:59','用户【猿来入此】于【2025-04-01 20:38:59】登录系统！','猿来入此'),(315,'2025-04-01 21:53:24','2025-04-01 21:53:24','用户【猿来入此】于【2025-04-01 21:53:23】登录系统！','猿来入此'),(316,'2025-04-01 22:16:47','2025-04-01 22:16:47','用户【猿来入此】于【2025-04-01 22:16:47】登录系统！','猿来入此');

/*Table structure for table `ylrc_role` */

DROP TABLE IF EXISTS `ylrc_role`;

CREATE TABLE `ylrc_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `name` varchar(18) NOT NULL,
  `remark` varchar(128) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `ylrc_role` */

insert  into `ylrc_role`(`id`,`create_time`,`update_time`,`name`,`remark`,`status`) values (1,'2020-03-15 13:16:38','2025-04-01 20:38:33','超级管理员','超级管理员拥有最高权限。',1),(2,'2020-03-15 13:18:57','2020-03-21 22:18:43','普通管理员','普通管理员只有部分权限',1),(4,'2020-03-21 20:11:00','2020-03-23 17:49:00','测试角色','sadsa',0);

/*Table structure for table `ylrc_role_authorities` */

DROP TABLE IF EXISTS `ylrc_role_authorities`;

CREATE TABLE `ylrc_role_authorities` (
  `role_id` bigint(20) NOT NULL,
  `authorities_id` bigint(20) NOT NULL,
  KEY `FKhj7ap1o1cjrl7enr9arf5f2qp` (`authorities_id`),
  KEY `FKg3xdaexmr0x1qx8omhvjtk46d` (`role_id`),
  CONSTRAINT `FKg3xdaexmr0x1qx8omhvjtk46d` FOREIGN KEY (`role_id`) REFERENCES `ylrc_role` (`id`),
  CONSTRAINT `FKhj7ap1o1cjrl7enr9arf5f2qp` FOREIGN KEY (`authorities_id`) REFERENCES `ylrc_menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ylrc_role_authorities` */

insert  into `ylrc_role_authorities`(`role_id`,`authorities_id`) values (2,2),(2,3),(2,5),(2,7),(2,11),(2,13),(2,16),(4,2),(4,13),(4,15),(1,2),(1,3),(1,5),(1,8),(1,9),(1,7),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,19),(1,20),(1,21),(1,22),(1,23),(1,24),(1,25),(1,26),(1,28),(1,29),(1,30),(1,31);

/*Table structure for table `ylrc_user` */

DROP TABLE IF EXISTS `ylrc_user`;

CREATE TABLE `ylrc_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `email` varchar(32) DEFAULT NULL,
  `head_pic` varchar(128) DEFAULT NULL,
  `mobile` varchar(12) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `sex` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `username` varchar(18) NOT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_btsosjytrl4hu7fnm1intcpo8` (`username`),
  KEY `FKg09b8o67eu61st68rv6nk8npj` (`role_id`),
  CONSTRAINT `FKg09b8o67eu61st68rv6nk8npj` FOREIGN KEY (`role_id`) REFERENCES `ylrc_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `ylrc_user` */

insert  into `ylrc_user`(`id`,`create_time`,`update_time`,`email`,`head_pic`,`mobile`,`password`,`sex`,`status`,`username`,`role_id`) values (1,'2020-03-18 19:18:53','2025-03-31 12:07:02','ylrc@qq.com','20250331/1743394009514.png','13356565656','123456',1,1,'猿来入此',1),(2,'2020-03-18 19:20:36','2025-03-29 10:00:13','llq@qq.com','20200318/1584530412075.jpg','13918655656','123456',1,1,'测试账号2',2),(5,'2020-03-20 20:42:19','2020-03-23 17:50:19','yw@qq.com','20200323/1584956702094.png','13356565656','123456',1,1,'小刘同志',4),(7,'2025-03-31 20:29:27','2025-03-31 20:30:03','','20250331/1743424200180.png','11111111111','123456',1,1,'111111',2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

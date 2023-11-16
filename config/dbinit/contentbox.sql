# ************************************************************
# Sequel Ace SQL dump
# Version 20058
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: localhost (MySQL 8.0.23)
# Database: contentbox
# Generation Time: 2023-11-16 21:39:14 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table cb_author
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_author`;

CREATE TABLE `cb_author` (
  `authorID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `firstName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `lastLogin` datetime DEFAULT NULL,
  `biography` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `preferences` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `isPasswordReset` tinyint(1) NOT NULL DEFAULT '0',
  `is2FactorAuth` tinyint(1) NOT NULL DEFAULT '0',
  `FK_roleID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`authorID`),
  UNIQUE KEY `username` (`username`),
  KEY `fk_cb_author_FK_roleID` (`FK_roleID`),
  KEY `idx_email` (`email`),
  KEY `idx_deleted` (`isDeleted`),
  KEY `idx_activeAuthor` (`isActive`),
  KEY `idx_passwordReset` (`isPasswordReset`),
  KEY `idx_2factorauth` (`is2FactorAuth`),
  KEY `idx_login` (`username`,`password`,`isActive`),
  CONSTRAINT `fk_cb_author_FK_roleID` FOREIGN KEY (`FK_roleID`) REFERENCES `cb_role` (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cb_author` WRITE;
/*!40000 ALTER TABLE `cb_author` DISABLE KEYS */;

INSERT INTO `cb_author` (`authorID`, `createdDate`, `modifiedDate`, `isDeleted`, `firstName`, `lastName`, `email`, `username`, `password`, `isActive`, `lastLogin`, `biography`, `preferences`, `isPasswordReset`, `is2FactorAuth`, `FK_roleID`)
VALUES
	('2c9480838309dc9c018309dfb3be0092','2022-09-04 18:59:59','2023-11-10 10:48:01',0,'Esme','Acevedo','esme@ortussolutions.com','esme','$2a$12$i9q6kijCMV5yKMAF4BWAseRbAixCoQGXjPhCt2AX9bJ/nQw4EPDpS',1,'2023-11-10 10:48:01','','{\"editor\":\"simplemde\",\"sidebarstate\":\"true\",\"sidemenuCollapse\":\"no\"}',0,0,'2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('2c9480838309dc9c01830b56c6d20133','2022-09-05 01:49:39','2023-11-16 21:35:48',0,'API','User','esme+api@ortussolutions.com','apiuser','$2a$12$grfWZi6L5ZOfjDnBSrme2.8jxaR0eiUMKbRyETjliZyWwXD2GS6UK',1,'2023-11-16 21:35:48','','{}',0,0,'2c9480838bb8cfb2018bb8dd975900d1'),
	('2c9480838bb8cfb2018bb8d8e7b000cf','2023-11-10 10:48:24','2023-11-13 21:55:14',0,'Luis','Majano','lmajano@ortussolutions.com','lmajano','$2a$12$/34934.S7cg/JaFEFBw6Mexdh9sd8So6SLVGyzu86OoTGhbUd531G',1,'2023-11-13 21:55:14','','{\"editor\":\"simplemde\"}',0,0,'2D385E92-8555-49BC-ADA8C8ADAF15D250');

/*!40000 ALTER TABLE `cb_author` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cb_authorPermissionGroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_authorPermissionGroups`;

CREATE TABLE `cb_authorPermissionGroups` (
  `FK_permissionGroupID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FK_authorID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `fk_cb_authorPermissionGroups_FK_permissionGroupID` (`FK_permissionGroupID`),
  KEY `fk_cb_authorPermissionGroups_FK_authorID` (`FK_authorID`),
  CONSTRAINT `fk_cb_authorPermissionGroups_FK_authorID` FOREIGN KEY (`FK_authorID`) REFERENCES `cb_author` (`authorID`),
  CONSTRAINT `fk_cb_authorPermissionGroups_FK_permissionGroupID` FOREIGN KEY (`FK_permissionGroupID`) REFERENCES `cb_permissionGroup` (`permissionGroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table cb_authorPermissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_authorPermissions`;

CREATE TABLE `cb_authorPermissions` (
  `FK_permissionID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FK_authorID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `fk_cb_authorPermissions_FK_permissionID` (`FK_permissionID`),
  KEY `fk_cb_authorPermissions_FK_authorID` (`FK_authorID`),
  CONSTRAINT `fk_cb_authorPermissions_FK_authorID` FOREIGN KEY (`FK_authorID`) REFERENCES `cb_author` (`authorID`),
  CONSTRAINT `fk_cb_authorPermissions_FK_permissionID` FOREIGN KEY (`FK_permissionID`) REFERENCES `cb_permission` (`permissionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table cb_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_category`;

CREATE TABLE `cb_category` (
  `categoryID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT '1',
  `FK_siteID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`categoryID`),
  KEY `fk_cb_category_FK_siteID` (`FK_siteID`),
  KEY `idx_isPublic` (`isPublic`),
  KEY `idx_categorySlug` (`slug`),
  KEY `idx_categoryName` (`category`),
  KEY `idx_deleted` (`isDeleted`),
  CONSTRAINT `fk_cb_category_FK_siteID` FOREIGN KEY (`FK_siteID`) REFERENCES `cb_site` (`siteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cb_category` WRITE;
/*!40000 ALTER TABLE `cb_category` DISABLE KEYS */;

INSERT INTO `cb_category` (`categoryID`, `createdDate`, `modifiedDate`, `isDeleted`, `slug`, `category`, `isPublic`, `FK_siteID`)
VALUES
	('2c9480838309dc9c018309dfc5b900e1','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'news','News',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838309dc9c018309dfc5ba00e2','2022-09-04 19:00:04','2022-09-04 19:00:04',0,'coldfusion',' ColdFusion',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838309dc9c018309dfc5bc00e3','2022-09-04 19:00:04','2022-09-04 19:00:04',0,'coldbox',' ColdBox',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838309dc9c018309dfc5be00e4','2022-09-04 19:00:04','2022-09-04 19:00:04',0,'contentbox',' ContentBox',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838309dc9c018309dfcf190123','2022-09-04 19:00:06','2022-09-04 19:00:06',0,'news','News',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838309dc9c018309dfcf1a0124','2022-09-04 19:00:06','2022-09-04 19:00:06',0,'coldfusion',' ColdFusion',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838309dc9c018309dfcf1b0125','2022-09-04 19:00:06','2022-09-04 19:00:06',0,'coldbox',' ColdBox',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838309dc9c018309dfcf1d0126','2022-09-04 19:00:06','2022-09-04 19:00:06',0,'contentbox',' ContentBox',1,'2c9480838309dc9c018309dfcbbe0109');

/*!40000 ALTER TABLE `cb_category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cb_comment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_comment`;

CREATE TABLE `cb_comment` (
  `commentID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `authorIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `authorEmail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `authorURL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isApproved` tinyint(1) NOT NULL DEFAULT '0',
  `FK_contentID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`commentID`),
  KEY `fk_cb_comment_FK_contentID` (`FK_contentID`),
  KEY `idx_contentComment` (`isApproved`,`FK_contentID`),
  KEY `idx_approved` (`isApproved`),
  KEY `idx_deleted` (`isDeleted`),
  CONSTRAINT `fk_cb_comment_FK_contentID` FOREIGN KEY (`FK_contentID`) REFERENCES `cb_content` (`contentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cb_comment` WRITE;
/*!40000 ALTER TABLE `cb_comment` DISABLE KEYS */;

INSERT INTO `cb_comment` (`commentID`, `createdDate`, `modifiedDate`, `isDeleted`, `content`, `author`, `authorIP`, `authorEmail`, `authorURL`, `isApproved`, `FK_contentID`)
VALUES
	('2c9480838309dc9c018309dfc73500e6','2022-09-04 19:00:04','2022-09-04 19:00:04',0,'What an amazing blog entry, congratulations!','Awesome Joe','172.20.0.1','awesomejoe@contentbox.org','www.ortussolutions.com',1,'2c9480838309dc9c018309dfc73400e5'),
	('2c9480838309dc9c018309dfcf8e0128','2022-09-04 19:00:06','2022-09-04 19:00:06',0,'What an amazing blog entry, congratulations!','Awesome Joe','172.20.0.1','awesomejoe@contentbox.org','www.ortussolutions.com',1,'2c9480838309dc9c018309dfcf8d0127');

/*!40000 ALTER TABLE `cb_comment` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cb_commentSubscriptions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_commentSubscriptions`;

CREATE TABLE `cb_commentSubscriptions` (
  `subscriptionID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FK_contentID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `fk_cb_commentSubscriptions_subscriptionID` (`subscriptionID`),
  KEY `fk_cb_commentSubscriptions_FK_contentID` (`FK_contentID`),
  CONSTRAINT `fk_cb_commentSubscriptions_FK_contentID` FOREIGN KEY (`FK_contentID`) REFERENCES `cb_content` (`contentID`),
  CONSTRAINT `fk_cb_commentSubscriptions_subscriptionID` FOREIGN KEY (`subscriptionID`) REFERENCES `cb_subscriptions` (`subscriptionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table cb_content
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_content`;

CREATE TABLE `cb_content` (
  `contentID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `contentType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `publishedDate` datetime DEFAULT NULL,
  `expireDate` datetime DEFAULT NULL,
  `isPublished` tinyint(1) NOT NULL DEFAULT '1',
  `allowComments` tinyint(1) NOT NULL DEFAULT '1',
  `passwordProtection` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `HTMLKeywords` varchar(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `HTMLDescription` varchar(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `HTMLTitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cache` tinyint(1) NOT NULL DEFAULT '1',
  `cacheTimeout` int NOT NULL DEFAULT '0',
  `cacheLastAccessTimeout` int NOT NULL DEFAULT '0',
  `markup` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'HTML',
  `showInSearch` tinyint(1) NOT NULL DEFAULT '1',
  `featuredImage` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FK_siteID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FK_authorID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FK_parentID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FK_contentTemplateID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FK_childContentTemplateID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`contentID`),
  KEY `fk_cb_content_FK_siteID` (`FK_siteID`),
  KEY `fk_cb_content_FK_authorID` (`FK_authorID`),
  KEY `fk_cb_content_FK_parentID` (`FK_parentID`),
  KEY `idx_discriminator` (`contentType`),
  KEY `idx_published` (`isPublished`,`contentType`),
  KEY `idx_slug` (`slug`),
  KEY `idx_publishedSlug` (`slug`,`isPublished`),
  KEY `idx_publishedDate` (`publishedDate`),
  KEY `idx_expireDate` (`expireDate`),
  KEY `idx_search` (`title`,`isPublished`),
  KEY `idx_cache` (`cache`),
  KEY `idx_cachetimeout` (`cacheTimeout`),
  KEY `idx_cachelastaccesstimeout` (`cacheLastAccessTimeout`),
  KEY `idx_showInSearch` (`showInSearch`),
  CONSTRAINT `fk_cb_content_FK_authorID` FOREIGN KEY (`FK_authorID`) REFERENCES `cb_author` (`authorID`),
  CONSTRAINT `fk_cb_content_FK_parentID` FOREIGN KEY (`FK_parentID`) REFERENCES `cb_content` (`contentID`),
  CONSTRAINT `fk_cb_content_FK_siteID` FOREIGN KEY (`FK_siteID`) REFERENCES `cb_site` (`siteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cb_content` WRITE;
/*!40000 ALTER TABLE `cb_content` DISABLE KEYS */;

INSERT INTO `cb_content` (`contentID`, `createdDate`, `modifiedDate`, `isDeleted`, `contentType`, `title`, `slug`, `publishedDate`, `expireDate`, `isPublished`, `allowComments`, `passwordProtection`, `HTMLKeywords`, `HTMLDescription`, `HTMLTitle`, `cache`, `cacheTimeout`, `cacheLastAccessTimeout`, `markup`, `showInSearch`, `featuredImage`, `FK_siteID`, `FK_authorID`, `FK_parentID`, `FK_contentTemplateID`, `FK_childContentTemplateID`)
VALUES
	('2c9480838309dc9c018309dfc73400e5','2022-09-04 19:00:04','2022-09-04 19:00:04',0,'Entry','My first entry','my-first-entry','2022-09-04 19:00:04',NULL,1,1,'','cool,first entry, contentbox','The most amazing ContentBox blog entry in the world','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092',NULL,NULL,NULL),
	('2c9480838309dc9c018309dfc80400e9','2022-09-04 19:00:04','2022-12-05 23:11:00',0,'Page','About','about','2022-09-04 19:00:00',NULL,1,0,'','about, contentbox,coldfusion,coldbox','The most amazing ContentBox page in the world','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092',NULL,NULL,NULL),
	('2c9480838309dc9c018309dfc8c300eb','2022-09-04 19:00:04','2022-09-04 19:00:04',0,'ContentStore','Contact Info','contentbox','2022-09-04 19:00:04',NULL,1,0,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092',NULL,NULL,NULL),
	('2c9480838309dc9c018309dfcf8d0127','2022-09-04 19:00:06','2022-09-04 19:00:06',0,'Entry','My first entry','my-first-entry','2022-09-04 19:00:06',NULL,1,1,'','cool,first entry, contentbox','The most amazing ContentBox blog entry in the world','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfcbbe0109','2c9480838309dc9c018309dfb3be0092',NULL,NULL,NULL),
	('2c9480838309dc9c018309dfcfd6012b','2022-09-04 19:00:06','2022-09-04 19:00:06',0,'Page','About','about','2022-09-04 19:00:06',NULL,1,0,'','about, contentbox,coldfusion,coldbox','The most amazing ContentBox page in the world','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfcbbe0109','2c9480838309dc9c018309dfb3be0092',NULL,NULL,NULL),
	('2c9480838309dc9c018309dfd024012d','2022-09-04 19:00:06','2022-09-04 19:00:06',0,'ContentStore','Contact Info','contentbox','2022-09-04 19:00:06',NULL,1,0,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfcbbe0109','2c9480838309dc9c018309dfb3be0092',NULL,NULL,NULL),
	('2c9480838309dc9c01830b73c1330134','2022-09-05 02:21:19','2022-09-05 02:21:19',0,'Page','contact','contact','2022-09-05 02:20:00',NULL,1,0,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092',NULL,NULL,NULL),
	('2c9480838309dc9c01830cc4b42f013b','2022-09-05 08:29:21','2023-11-13 21:29:07',0,'ContentStore','WeyWeyWeb - Headless CMS','headlesscb-slides','2022-09-05 08:28:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092',NULL,NULL,NULL),
	('2c9480838309dc9c01830cc8468c013d','2022-09-05 08:33:15','2022-09-08 04:03:50',0,'ContentStore','Cover','headlesscb-slides/cover','2022-09-05 08:29:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc4b42f013b',NULL,NULL),
	('2c9480838309dc9c01830ccb4a9f0140','2022-09-05 08:36:33','2022-09-08 04:03:55',0,'ContentStore','Speaking','headlesscb-slides/speaking','2022-09-05 08:34:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc4b42f013b',NULL,NULL),
	('2c9480838309dc9c01830cd4eeac0143','2022-09-05 08:47:05','2022-09-08 04:04:00',0,'ContentStore','What is a headless CMS?','headlesscb-slides/what-is-a-headless-cms','2022-09-05 08:37:00',NULL,1,1,'','','','',1,0,0,'Markdown',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc4b42f013b',NULL,NULL),
	('2c9480838309dc9c0183137ea0ff017e','2022-09-06 15:50:09','2022-09-08 04:04:05',0,'ContentStore','Traditional vs Headless','headlesscb-slides/traditional-vs-headless','2022-09-06 06:59:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc4b42f013b',NULL,NULL),
	('2c9480838309dc9c01831413ac24018d','2022-09-06 18:32:57','2022-09-08 04:04:11',0,'ContentStore','Body','headlesscb-slides/body','2022-09-06 18:22:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc4b42f013b',NULL,NULL),
	('2c9480838309dc9c01831419faff0190','2022-09-06 18:39:50','2022-09-08 04:04:15',0,'ContentStore','The Head','headlesscb-slides/the-head','2022-09-06 18:33:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc4b42f013b',NULL,NULL),
	('2c9480838309dc9c0183147a2be70198','2022-09-06 20:24:54','2023-11-13 21:34:04',0,'ContentStore','Advantages - Content Centralization','headlesscb-slides/advantages-content-centralization','2022-09-06 20:21:00',NULL,1,1,'','','','',1,0,0,'Markdown',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc4b42f013b',NULL,NULL),
	('2c9480838309dc9c018314edf62201b0','2022-09-06 22:31:22','2022-09-08 04:04:36',0,'ContentStore','Thanks','headlesscb-slides/thanks','2022-09-06 22:29:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc4b42f013b',NULL,NULL),
	('2c9480838309dc9c01831b144f3d01c9','2022-09-06 18:42:57','2023-11-13 21:32:12',0,'ContentStore','Advantages','headlesscb-slides/advantages','2022-09-06 18:43:00',NULL,1,1,'','','','',1,0,0,'Markdown',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc4b42f013b',NULL,NULL),
	('2c9480838309dc9c01831d5f04b801d0','2022-09-08 13:51:50','2022-09-08 13:53:31',0,'ContentStore','Headlesscb Slides SP','headlesscb-slides-sp','2022-09-08 13:51:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092',NULL,NULL,NULL),
	('2c9480838309dc9c01831d5f0ebf01d2','2022-09-08 13:51:50','2022-12-04 02:19:49',0,'ContentStore','Cover','headlesscb-slides-sp/cover','2022-09-08 13:51:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f04b801d0',NULL,NULL),
	('2c9480838309dc9c01831d5f0f4d01d6','2022-09-08 13:51:53','2022-12-04 02:20:42',0,'ContentStore','Speaking','headlesscb-slides-sp/speaking','2022-09-08 13:51:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f04b801d0',NULL,NULL),
	('2c9480838309dc9c01831d5f0fd501d9','2022-09-08 13:51:53','2022-12-04 02:22:57',0,'ContentStore','What is a headless CMS?','headlesscb-slides-sp/what-is-a-headless-cms','2022-09-08 13:51:00',NULL,1,1,'','','','',1,0,0,'Markdown',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f04b801d0',NULL,NULL),
	('2c9480838309dc9c01831d5f109601dc','2022-09-08 13:51:53','2022-12-04 02:24:37',0,'ContentStore','Traditional vs Headless','headlesscb-slides-sp/traditional-vs-headless','2022-09-08 13:51:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f04b801d0',NULL,NULL),
	('2c9480838309dc9c01831d5f112001e0','2022-09-08 13:51:53','2022-12-04 02:26:44',0,'ContentStore','Body','headlesscb-slides-sp/body','2022-09-08 13:51:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f04b801d0',NULL,NULL),
	('2c9480838309dc9c01831d5f11b701e3','2022-09-08 13:51:53','2022-12-04 02:28:33',0,'ContentStore','The Head','headlesscb-slides-sp/the-head','2022-09-08 13:51:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f04b801d0',NULL,NULL),
	('2c9480838309dc9c01831d5f124001e6','2022-09-08 13:51:53','2022-12-04 02:50:01',0,'ContentStore','Advantages','headlesscb-slides-sp/advantages','2022-09-08 13:51:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f04b801d0',NULL,NULL),
	('2c9480838309dc9c01831d5f12c201e9','2022-09-08 13:51:53','2022-12-04 02:50:40',0,'ContentStore','ContentBox 5','headlesscb-slides-sp/contentbox-5','2022-09-08 13:51:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f04b801d0',NULL,NULL),
	('2c9480838309dc9c01831d5f131901ec','2022-09-08 13:51:54','2022-12-04 02:58:51',0,'ContentStore','ContentStore','headlesscb-slides-sp/contentstore','2022-09-08 13:51:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f04b801d0',NULL,NULL),
	('2c9480838309dc9c01831d5f137101ee','2022-09-08 13:51:54','2022-12-04 03:04:56',0,'ContentStore','Headless CMS','headlesscb-slides-sp/headless-cms','2022-09-08 13:51:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f04b801d0',NULL,NULL),
	('2c9480838309dc9c01831d5f13fe01f0','2022-09-08 13:51:54','2022-12-04 03:21:29',0,'ContentStore','Sponsors','headlesscb-slides-sp/sponsors','2022-09-08 13:51:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f04b801d0',NULL,NULL),
	('2c9480838309dc9c01831d5f14c101f3','2022-09-08 13:51:54','2022-12-04 03:05:22',0,'ContentStore','Thanks','headlesscb-slides-sp/thanks','2022-09-08 13:51:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f04b801d0',NULL,NULL),
	('2c94808384e113b20184e4856a790005','2022-12-05 23:00:59','2022-12-05 23:00:59',0,'Page','Home','home','2022-12-05 23:00:00',NULL,1,0,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092',NULL,NULL,NULL),
	('2c94808384e113b20184e48d35dd0007','2022-12-05 23:09:30','2022-12-05 23:09:30',0,'Page','Services','services','2022-12-05 23:09:00',NULL,1,0,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092',NULL,NULL,NULL),
	('2c9480838bc85d85018bc96696ad001f','2023-11-13 15:57:06','2023-11-13 15:57:06',0,'ContentStore','Traditional CMS','headlesscb-slides/traditional-cms','2023-11-13 15:56:00',NULL,1,1,'','','','',1,0,0,'Markdown',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838309dc9c01830cc4b42f013b',NULL,NULL),
	('2c9480838bc85d85018bc97bbf27002d','2023-11-13 16:20:12','2023-11-13 16:20:34',0,'ContentStore','Headless CMS','headlesscb-slides/headless-cms','2023-11-13 16:10:00',NULL,1,1,'','','','',1,0,0,'Markdown',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838309dc9c01830cc4b42f013b',NULL,NULL),
	('2c9480838bc85d85018bc9865e660034','2023-11-13 16:31:48','2023-11-13 16:32:26',0,'ContentStore','Forms of Communication','headlesscb-slides/forms-of-communication','2023-11-13 16:26:00',NULL,1,1,'','','','',1,0,0,'Markdown',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838309dc9c01830cc4b42f013b',NULL,NULL),
	('2c9480838bca8a35018bca9d2c180007','2023-11-13 21:36:20','2023-11-13 21:36:20',0,'ContentStore','Advantages - Ominchannel Publishing','headlesscb-slides/omnichannel-publishing','2023-11-13 21:34:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838309dc9c01830cc4b42f013b',NULL,NULL),
	('2c9480838bca8a35018bca9eccd0000a','2023-11-13 21:38:07','2023-11-13 21:41:08',0,'ContentStore','Advantages - Scalability & Performance','headlesscb-slides/scalability-performance','2023-11-13 21:36:00',NULL,1,1,'','','','',1,0,0,'Markdown',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838309dc9c01830cc4b42f013b',NULL,NULL),
	('2c9480838bca8a35018bcaa0053a000d','2023-11-13 21:39:27','2023-11-13 21:41:12',0,'ContentStore','Advantages - Developer Flexibility & Freedom','headlesscb-slides/developer-flexibility-freedom','2023-11-13 21:38:00',NULL,1,1,'','','','',1,0,0,'Markdown',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838309dc9c01830cc4b42f013b',NULL,NULL),
	('2c9480838bca8a35018bcaa0bcee0010','2023-11-13 21:40:14','2023-11-13 21:40:14',0,'ContentStore','Advantages - Improved Security','headlesscb-slides/improved-security','2023-11-13 21:39:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838309dc9c01830cc4b42f013b',NULL,NULL),
	('2c9480838bca8a35018bcaa16e020012','2023-11-13 21:40:59','2023-11-13 21:40:59',0,'ContentStore','Advantages - Content Store','headlesscb-slides/content-store','2023-11-13 21:40:00',NULL,1,1,'','','','',1,0,0,'Markdown',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838309dc9c01830cc4b42f013b',NULL,NULL),
	('2c9480838bca8a35018bcaa2ab0c0018','2023-11-13 21:42:20','2023-11-13 21:42:20',0,'ContentStore','How do I chose one?','headlesscb-slides/how-do-i-chose-one','2023-11-13 21:41:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838309dc9c01830cc4b42f013b',NULL,NULL),
	('2c9480838bca8a35018bcaa4ab80001d','2023-11-13 21:44:32','2023-11-13 21:44:32',0,'ContentStore','I have a secret to tell?','headlesscb-slides/i-have-a-secret-to-tell','2023-11-13 21:43:00',NULL,1,1,'','','','',1,0,0,'Markdown',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838309dc9c01830cc4b42f013b',NULL,NULL),
	('2c9580838811b6930188126d88e60003','2023-05-13 00:05:48','2023-05-13 00:05:48',0,'ContentStore','Headlesscb 100 mins slides','headlesscb-100-mins-slides','2023-05-13 00:04:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092',NULL,NULL,NULL),
	('2c9580838811b6930188126f67210005','2023-05-13 00:07:51','2023-05-17 19:34:10',0,'ContentStore','Cover','headlesscb-100-mins-slides/cover','2023-05-13 00:07:00',NULL,1,1,'','','','',0,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126d88e60003',NULL,NULL),
	('2c9580838811b69301881271d1c60015','2023-05-13 00:10:29','2023-05-17 19:34:10',0,'ContentStore','Speaking','headlesscb-100-mins-slides/speaking','2023-05-13 00:10:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126d88e60003',NULL,NULL),
	('2c9580838811b693018817c3db100062','2023-05-14 00:58:12','2023-05-17 19:34:28',0,'ContentStore','What is a headless CMS?','headlesscb-100-mins-slides/what-is-a-headless-cms','2023-05-14 00:58:00',NULL,1,1,'','','','',1,0,0,'Markdown',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126d88e60003',NULL,NULL),
	('2c9580838811b693018817c7f7f30069','2023-05-14 01:02:41','2023-05-17 19:34:28',0,'ContentStore','Traditional vs Headless','headlesscb-100-mins-slides/traditional-vs-headless','2023-05-14 01:02:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126d88e60003',NULL,NULL),
	('2c9580838811b693018817eba4570079','2023-05-14 01:41:39','2023-05-17 19:34:12',0,'ContentStore','Body','headlesscb-100-mins-slides/body','2023-05-14 01:41:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126d88e60003',NULL,NULL),
	('2c9580838811b693018817ec68280080','2023-05-14 01:42:29','2023-05-17 19:34:12',0,'ContentStore','The Head','headlesscb-100-mins-slides/the-head','2023-05-14 01:42:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126d88e60003',NULL,NULL),
	('2c9580838811b693018817edd97b0087','2023-05-14 01:44:04','2023-05-17 19:34:16',0,'ContentStore','Advantages','headlesscb-100-mins-slides/advantages','2023-05-14 01:44:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126d88e60003',NULL,NULL),
	('2c9580838811b693018817f25baa008e','2023-05-14 01:48:59','2023-05-17 19:34:16',0,'ContentStore','ContentBox 5','headlesscb-100-mins-slides/contentbox-5','2023-05-14 01:48:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126d88e60003',NULL,NULL),
	('2c9580838811b69301881835c08a0095','2023-05-14 03:02:36','2023-05-17 19:34:16',0,'ContentStore','Headless CMS','headlesscb-100-mins-slides/headless-cms','2023-05-14 03:02:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126d88e60003',NULL,NULL),
	('2c9580838811b693018827cd2ce0009b','2023-05-17 03:42:18','2023-05-17 21:00:56',0,'ContentStore','Thanks','headlesscb-100-mins-slides/thanks','2023-05-17 03:42:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126d88e60003',NULL,NULL),
	('2c9580838811b69301882b27c30800b7','2023-05-17 19:20:06','2023-05-17 19:20:06',0,'Entry','ColdBox 7.0.0 Released','coldbox-700-released','2023-05-17 19:04:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092',NULL,NULL,NULL),
	('2c9580838811b69301882b34086b00ba','2023-05-17 19:33:30','2023-05-17 21:00:56',0,'ContentStore','Rate','headlesscb-100-mins-slides/rate','2023-05-17 19:31:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126d88e60003',NULL,NULL),
	('2c9580838811b69301882b83c5a800c8','2023-05-17 21:00:36','2023-05-17 21:00:56',0,'ContentStore','Files','headlesscb-100-mins-slides/files','2023-05-17 20:58:00',NULL,1,1,'','','','',1,0,0,'HTML',1,'','2c9480838309dc9c018309dfb74e00af','2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126d88e60003',NULL,NULL);

/*!40000 ALTER TABLE `cb_content` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cb_contentCategories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_contentCategories`;

CREATE TABLE `cb_contentCategories` (
  `FK_contentID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FK_categoryID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `fk_cb_contentCategories_FK_contentID` (`FK_contentID`),
  KEY `fk_cb_contentCategories_FK_categoryID` (`FK_categoryID`),
  CONSTRAINT `fk_cb_contentCategories_FK_categoryID` FOREIGN KEY (`FK_categoryID`) REFERENCES `cb_category` (`categoryID`),
  CONSTRAINT `fk_cb_contentCategories_FK_contentID` FOREIGN KEY (`FK_contentID`) REFERENCES `cb_content` (`contentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cb_contentCategories` WRITE;
/*!40000 ALTER TABLE `cb_contentCategories` DISABLE KEYS */;

INSERT INTO `cb_contentCategories` (`FK_contentID`, `FK_categoryID`)
VALUES
	('2c9580838811b69301882b27c30800b7','2c9480838309dc9c018309dfc5bc00e3');

/*!40000 ALTER TABLE `cb_contentCategories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cb_contentStore
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_contentStore`;

CREATE TABLE `cb_contentStore` (
  `contentID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int DEFAULT '0',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`contentID`),
  CONSTRAINT `fk_cb_contentStore_contentID` FOREIGN KEY (`contentID`) REFERENCES `cb_content` (`contentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cb_contentStore` WRITE;
/*!40000 ALTER TABLE `cb_contentStore` DISABLE KEYS */;

INSERT INTO `cb_contentStore` (`contentID`, `order`, `description`)
VALUES
	('2c9480838309dc9c018309dfc8c300eb',0,'Our contact information'),
	('2c9480838309dc9c018309dfd024012d',0,'Our contact information'),
	('2c9480838309dc9c01830cc4b42f013b',0,''),
	('2c9480838309dc9c01830cc8468c013d',1,''),
	('2c9480838309dc9c01830ccb4a9f0140',2,''),
	('2c9480838309dc9c01830cd4eeac0143',3,''),
	('2c9480838309dc9c0183137ea0ff017e',7,''),
	('2c9480838309dc9c01831413ac24018d',8,''),
	('2c9480838309dc9c01831419faff0190',9,''),
	('2c9480838309dc9c0183147a2be70198',11,''),
	('2c9480838309dc9c018314edf62201b0',19,''),
	('2c9480838309dc9c01831b144f3d01c9',10,''),
	('2c9480838309dc9c01831d5f04b801d0',1,''),
	('2c9480838309dc9c01831d5f0ebf01d2',2,''),
	('2c9480838309dc9c01831d5f0f4d01d6',3,''),
	('2c9480838309dc9c01831d5f0fd501d9',4,''),
	('2c9480838309dc9c01831d5f109601dc',5,''),
	('2c9480838309dc9c01831d5f112001e0',6,''),
	('2c9480838309dc9c01831d5f11b701e3',7,''),
	('2c9480838309dc9c01831d5f124001e6',8,''),
	('2c9480838309dc9c01831d5f12c201e9',9,''),
	('2c9480838309dc9c01831d5f131901ec',10,''),
	('2c9480838309dc9c01831d5f137101ee',11,''),
	('2c9480838309dc9c01831d5f13fe01f0',12,''),
	('2c9480838309dc9c01831d5f14c101f3',13,''),
	('2c9480838bc85d85018bc96696ad001f',4,''),
	('2c9480838bc85d85018bc97bbf27002d',5,''),
	('2c9480838bc85d85018bc9865e660034',6,''),
	('2c9480838bca8a35018bca9d2c180007',12,''),
	('2c9480838bca8a35018bca9eccd0000a',13,''),
	('2c9480838bca8a35018bcaa0053a000d',14,''),
	('2c9480838bca8a35018bcaa0bcee0010',15,''),
	('2c9480838bca8a35018bcaa16e020012',16,''),
	('2c9480838bca8a35018bcaa2ab0c0018',17,''),
	('2c9480838bca8a35018bcaa4ab80001d',18,''),
	('2c9580838811b6930188126d88e60003',0,''),
	('2c9580838811b6930188126f67210005',1,''),
	('2c9580838811b69301881271d1c60015',2,''),
	('2c9580838811b693018817c3db100062',3,''),
	('2c9580838811b693018817c7f7f30069',4,''),
	('2c9580838811b693018817eba4570079',5,''),
	('2c9580838811b693018817ec68280080',6,''),
	('2c9580838811b693018817edd97b0087',7,''),
	('2c9580838811b693018817f25baa008e',8,''),
	('2c9580838811b69301881835c08a0095',9,''),
	('2c9580838811b693018827cd2ce0009b',12,''),
	('2c9580838811b69301882b34086b00ba',11,''),
	('2c9580838811b69301882b83c5a800c8',10,'');

/*!40000 ALTER TABLE `cb_contentStore` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cb_contentTemplate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_contentTemplate`;

CREATE TABLE `cb_contentTemplate` (
  `templateID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `isGlobal` tinyint(1) NOT NULL DEFAULT '0',
  `contentType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `definition` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FK_authorID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FK_siteID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`templateID`),
  KEY `fk_cb_contentTemplate_FK_authorID` (`FK_authorID`),
  KEY `fk_cb_contentTemplate_FK_siteID` (`FK_siteID`),
  KEY `idx_contentType` (`contentType`),
  CONSTRAINT `fk_cb_contentTemplate_FK_authorID` FOREIGN KEY (`FK_authorID`) REFERENCES `cb_author` (`authorID`),
  CONSTRAINT `fk_cb_contentTemplate_FK_siteID` FOREIGN KEY (`FK_siteID`) REFERENCES `cb_site` (`siteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table cb_contentVersion
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_contentVersion`;

CREATE TABLE `cb_contentVersion` (
  `contentVersionID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `changelog` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `version` int NOT NULL DEFAULT '1',
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `FK_authorID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FK_contentID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`contentVersionID`),
  KEY `fk_cb_contentVersion_FK_authorID` (`FK_authorID`),
  KEY `idx_version` (`version`),
  KEY `idx_activeContentVersion` (`isActive`),
  KEY `idx_contentVersions` (`FK_contentID`,`isActive`),
  KEY `idx_content_isActive` (`isActive`),
  CONSTRAINT `fk_cb_contentVersion_FK_authorID` FOREIGN KEY (`FK_authorID`) REFERENCES `cb_author` (`authorID`),
  CONSTRAINT `fk_cb_contentVersion_FK_contentID` FOREIGN KEY (`FK_contentID`) REFERENCES `cb_content` (`contentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cb_contentVersion` WRITE;
/*!40000 ALTER TABLE `cb_contentVersion` DISABLE KEYS */;

INSERT INTO `cb_contentVersion` (`contentVersionID`, `createdDate`, `modifiedDate`, `isDeleted`, `content`, `changelog`, `version`, `isActive`, `FK_authorID`, `FK_contentID`)
VALUES
	('2c9380838bd37fc3018bd40f75a40006','2023-11-15 17:37:45','2023-11-15 17:38:06',0,'<h2>Manage content easily and deliver it to any device.</h2>\r\n\r\n<p>CONTENTBOX is a powerful open-source headless CMS. 100% fully Customizable.</p>\r\n\r\n<div>\r\n	<img src=\"/__media/sites/default/headless-cb.png\">\r\n</div>','',7,0,'2c9480838bb8cfb2018bb8d8e7b000cf','2c94808384e113b20184e4856a790005'),
	('2c9380838bd37fc3018bd40fc6d90007','2023-11-15 17:38:06','2023-11-15 17:38:19',0,'<h2>Manage content easily and deliver it to any device.</h2>\r\n\r\n<p>CONTENTBOX is a powerful open-source headless CMS. 100% fully Customizable.</p>\r\n\r\n<div>\r\n	<img src=\"/__media/sites/default/headless-cb.png\">\r\n</div>','',8,0,'2c9480838bb8cfb2018bb8d8e7b000cf','2c94808384e113b20184e4856a790005'),
	('2c9380838bd37fc3018bd40ffc400008','2023-11-15 17:38:19','2023-11-15 17:51:56',0,'<h2>Manage content easily and deliver it to any device.</h2>\r\n\r\n<p>CONTENTBOX is a powerful open-source headless CMS. 100% fully Customizable.</p>\r\n\r\n<div>\r\n	<img src=\"/__media/sites/default/headless-cb.png\">\r\n</div>','',9,0,'2c9480838bb8cfb2018bb8d8e7b000cf','2c94808384e113b20184e4856a790005'),
	('2c9380838bd37fc3018bd41c71da0009','2023-11-15 17:51:56','2023-11-15 17:51:56',0,'<h2>Manage content easily and deliver it to any device.</h2>\r\n\r\n<p>CONTENTBOX is a powerful open-source headless CMS. 100% fully Customizable.</p>\r\n\r\n<div>\r\n	<img src=\"/__media/sites/default/headless-cb.png\">\r\n</div>','',10,1,'2c9480838bb8cfb2018bb8d8e7b000cf','2c94808384e113b20184e4856a790005'),
	('2c9480838309dc9c018309dfc73600e8','2022-09-04 19:00:04','2022-09-04 19:00:04',0,'Hey everybody, this is my first blog entry made from ContentBox.  Isn\'t this amazing!\'','Initial creation',1,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c018309dfc73400e5'),
	('2c9480838309dc9c018309dfc80500ea','2022-09-04 19:00:04','2022-12-05 23:11:00',0,'<p>Hey welcome to my about page for ContentBox, isn\'t this great!</p><p>{{{ContentStore slug=\'contentbox\'}}}</p>','First creation',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c018309dfc80400e9'),
	('2c9480838309dc9c018309dfc8c400ec','2022-09-04 19:00:04','2022-09-04 19:00:04',0,'<p style=\"text-align: center;\">\n	<a href=\"https://www.ortussolutions.com/products/contentbox\"><img alt=\"\" src=\"/index.cfm/__media/ContentBox_300.png\" /></a></p>\n<p style=\"text-align: center;\">\n	Created by <a href=\"https://www.ortussolutions.com\">Ortus Solutions, Corp</a> and powered by <a href=\"http://coldbox.org\">ColdBox Platform</a>.</p>','First creation',1,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c018309dfc8c300eb'),
	('2c9480838309dc9c018309dfcf8f012a','2022-09-04 19:00:06','2022-09-04 19:00:06',0,'Hey everybody, this is my first blog entry made from ContentBox.  Isn\'t this amazing!\'','Initial creation',1,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c018309dfcf8d0127'),
	('2c9480838309dc9c018309dfcfd7012c','2022-09-04 19:00:06','2022-09-04 19:00:06',0,'<p>Hey welcome to my about page for ContentBox, isn\'t this great!</p><p>{{{ContentStore slug=\'contentbox\'}}}</p>','First creation',1,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c018309dfcfd6012b'),
	('2c9480838309dc9c018309dfd025012e','2022-09-04 19:00:06','2022-09-04 19:00:06',0,'<p style=\"text-align: center;\">\n	<a href=\"https://www.ortussolutions.com/products/contentbox\"><img alt=\"\" src=\"/index.cfm/__media/ContentBox_300.png\" /></a></p>\n<p style=\"text-align: center;\">\n	Created by <a href=\"https://www.ortussolutions.com\">Ortus Solutions, Corp</a> and powered by <a href=\"http://coldbox.org\">ColdBox Platform</a>.</p>','First creation',1,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c018309dfd024012d'),
	('2c9480838309dc9c01830b73c1340135','2022-09-05 02:21:19','2022-09-05 02:21:19',0,'<p>contact page</p>\r\n','',1,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830b73c1330134'),
	('2c9480838309dc9c01830cc4b430013c','2022-09-05 08:29:21','2023-11-13 21:29:07',0,'<p>These are the presentation slides.</p>\r\n','',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc4b42f013b'),
	('2c9480838309dc9c01830cc8468d013e','2022-09-05 08:33:16','2022-09-05 08:33:48',0,'<p>&lt;h1&gt;Off with their heads &lt;span&gt;ContentBox 5 : Headless CMS&nbsp;&lt;/span&gt;&lt;/h1&gt;</p>\r\n','',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc8468c013d'),
	('2c9480838309dc9c01830cc8c4e5013f','2022-09-05 08:33:48','2022-09-05 15:50:18',0,'<p>&lt;h1&gt;Off with their heads &lt;span&gt;ContentBox 5 : Headless CMS&nbsp;&lt;/span&gt;&lt;/h1&gt;</p>\r\n','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc8468c013d'),
	('2c9480838309dc9c01830ccb4aa00141','2022-09-05 08:36:33','2022-09-05 08:36:51',0,'<p>Esme and Javi</p>\r\n','',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830ccb4a9f0140'),
	('2c9480838309dc9c01830ccb90270142','2022-09-05 08:36:51','2022-09-05 23:40:35',0,'<p>Esme and Javi</p>\r\n','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830ccb4a9f0140'),
	('2c9480838309dc9c01830cd4eead0144','2022-09-05 08:47:05','2022-09-05 08:47:23',0,'<p>&lt;h2&gt;What is a Headless CMS?&lt;/h2&gt;</p>\r\n\r\n<p>&lt;p&gt;lorem ipsum&lt;/p&gt;</p>\r\n','',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cd4eeac0143'),
	('2c9480838309dc9c01830cd536fc0145','2022-09-05 08:47:23','2022-09-05 15:52:41',0,'<p>&lt;h2&gt;What is a Headless CMS?&lt;/h2&gt;</p>\r\n\r\n<p>&lt;p&gt;lorem ipsum&lt;/p&gt;</p>\r\n','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cd4eeac0143'),
	('2c9480838309dc9c01830e58660d0148','2022-09-05 15:50:18','2022-09-05 15:50:44',0,'<h1>Off with their heads <span>ContentBox 5 : Headless CMS&nbsp;</span></h1>\r\n','',3,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc8468c013d'),
	('2c9480838309dc9c01830e58cc2d0149','2022-09-05 15:50:44','2022-09-05 15:55:12',0,'<h1>Off with their heads <span>ContentBox 5 : Headless CMS</span></h1>\r\n','',4,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc8468c013d'),
	('2c9480838309dc9c01830e5a9601014a','2022-09-05 15:52:41','2022-09-06 04:38:47',0,'<h2>What is a Headless CMS</h2>\r\n\r\n<p>lorem ipsum</p>\r\n','',3,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cd4eeac0143'),
	('2c9480838309dc9c01830e5ce38d014c','2022-09-05 15:55:12','2022-09-05 16:11:03',0,'<h1>Off with their heads <span>ContentBox 5 : Headless CMS</span></h1>\r\n','',5,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc8468c013d'),
	('2c9480838309dc9c01830e6b66dc014e','2022-09-05 16:11:03','2022-09-05 16:36:11',0,'<h1>Off with their heads <span>ContentBox 5 : Headless CMS</span></h1>\r\n','',6,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc8468c013d'),
	('2c9480838309dc9c01830e82673e0150','2022-09-05 16:36:10','2022-09-05 16:38:07',0,'<img src=\"/__media/sites/default/logo-ITB-2022.svg\" alt=\"\"ITB 2022 logo\"/>\r\n<h1>Off with their heads <span>ContentBox 5 : Headless CMS</span></h1>\r\n','',7,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc8468c013d'),
	('2c9480838309dc9c01830e842e490152','2022-09-05 16:38:07','2022-09-05 16:38:20',0,'<img src=\"/__media/sites/default/logo-ITB-2022.svg\" alt=\"\"ITB 2022 logo\"/>\r\n<h1>Off with their heads <span>ContentBox 5 : Headless CMS</span></h1>\r\n','Editor Change Quick Save',8,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc8468c013d'),
	('2c9480838309dc9c01830e8460b70154','2022-09-05 16:38:20','2022-09-05 16:38:38',0,'<p><img 2022=\"\" alt=\"\" itb=\"\" logo=\"\" src=\"/__media/sites/default/logo-ITB-2022.svg\" /></p>\r\n\r\n<h1>Off with their heads <span>ContentBox 5 : Headless CMS</span></h1>\r\n','Editor Change Quick Save',9,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc8468c013d'),
	('2c9480838309dc9c01830e84a7710156','2022-09-05 16:38:38','2022-09-05 16:40:32',0,'<img 2022=\"\" alt=\"\" itb=\"\" logo=\"\" src=\"/__media/sites/default/logo-ITB-2022.svg\" />\r\n<h1>Off with their heads <span>ContentBox 5 : Headless CMS</span></h1>\r\n','',10,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc8468c013d'),
	('2c9480838309dc9c01830e8664d40158','2022-09-05 16:40:32','2022-09-05 16:48:50',0,'<img src=\"/__media/sites/default/logo-ITB-2022.svg\" />\r\n<h1>Off with their heads <span>ContentBox 5 : Headless CMS</span></h1>\r\n','',11,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc8468c013d'),
	('2c9480838309dc9c01830e8dfc78015a','2022-09-05 16:48:49','2022-09-05 16:53:08',0,'<img src=\"http://127.0.0.1:61670/__media/sites/default/logo-ITB-2022.svg\" />\r\n<h1>Off with their heads <span>ContentBox 5 : Headless CMS</span></h1>\r\n','',12,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc8468c013d'),
	('2c9480838309dc9c01830e91ecf3015c','2022-09-05 16:53:08','2022-09-05 16:54:17',0,'<img src=\"http://127.0.0.1:61670/__media/sites/default/cover-no-logo.png\" />\r\n<h1>Off with their heads <span>ContentBox 5 : Headless CMS</span></h1>\r\n','',13,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc8468c013d'),
	('2c9480838309dc9c01830e92fbd7015e','2022-09-05 16:54:17','2022-09-05 16:56:00',0,'<h1>Off with their heads <span>ContentBox 5 : Headless CMS</span></h1>\r\n','',14,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc8468c013d'),
	('2c9480838309dc9c01830e948d250160','2022-09-05 16:56:00','2022-09-05 16:57:51',0,'<h1>Off with their heads <span>ContentBox 5 : Headless CMS</span></h1>\r\n','',15,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc8468c013d'),
	('2c9480838309dc9c01830e963cd80162','2022-09-05 16:57:50','2022-09-05 18:21:40',0,'<h1>Off with their heads <span>ContentBox 5 : Headless CMS</span></h1>\r\n','',16,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc8468c013d'),
	('2c9480838309dc9c01830ee2fc900165','2022-09-05 18:21:40','2022-09-05 23:13:08',0,'<h1>Off with their heads <span>ContentBox 5 : Headless CMS</span></h1>\r\n','',17,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc8468c013d'),
	('2c9480838309dc9c01830fedd1440169','2022-09-05 23:13:07','2023-11-13 11:09:34',0,'<h1>Off with their heads <span>ContentBox 5 : Headless CMS</span></h1>\r\n','',18,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cc8468c013d'),
	('2c9480838309dc9c01831006f40c016a','2022-09-05 23:40:35','2022-09-05 23:46:00',0,'<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2>Esmeralda Acevedo</h2>\r\n		<p>Senior Software Developer</p>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2>Javier Quintero</h2>\r\n		<p>Developer</p>\r\n	</div>\r\n</div>\r\n\r\n','',3,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830ccb4a9f0140'),
	('2c9480838309dc9c0183100be858016c','2022-09-05 23:45:59','2022-09-05 23:50:12',0,'<div class=\"row\">\r\n	<div class=\"col\"></div>\r\n	<div class=\"col\"></div>\r\n</div>\r\n<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2>Esmeralda Acevedo</h2>\r\n		<p>Senior Software Developer</p>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2>Javier Quintero</h2>\r\n		<p>Developer</p>\r\n	</div>\r\n</div>\r\n\r\n','',4,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830ccb4a9f0140'),
	('2c9480838309dc9c0183100fc382016e','2022-09-05 23:50:12','2022-09-05 23:51:47',0,'<div class=\"row\">\r\n	<div class=\"col\"><img src=\"http://127.0.0.1:61670/odules_app/contentbox-custom/_content/sites/default/Eacevedo.png\" /></div>\r\n	<div class=\"col\"><img src=\"http://127.0.0.1:61670/odules_app/contentbox-custom/_content/sites/default/Jquintero.png\" /></div>\r\n</div>\r\n<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2>Esmeralda Acevedo</h2>\r\n		<p>Senior Software Developer</p>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2>Javier Quintero</h2>\r\n		<p>Developer</p>\r\n	</div>\r\n</div>\r\n\r\n','',5,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830ccb4a9f0140'),
	('2c9480838309dc9c0183101136040170','2022-09-05 23:51:47','2022-09-05 23:53:14',0,'<div class=\"row\">\r\n	<div class=\"col\"><img src=\"http://127.0.0.1:61670/_media/sites/default/Eacevedo.png\" /></div>\r\n	<div class=\"col\"><img src=\"http://127.0.0.1:61670/_media//sites/default/Jquintero.png\" /></div>\r\n</div>\r\n<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2>Esmeralda Acevedo</h2>\r\n		<p>Senior Software Developer</p>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2>Javier Quintero</h2>\r\n		<p>Developer</p>\r\n	</div>\r\n</div>\r\n\r\n','',6,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830ccb4a9f0140'),
	('2c9480838309dc9c018310128b210172','2022-09-05 23:53:14','2022-09-06 03:07:40',0,'<div class=\"row\">\r\n	<div class=\"col\"><img src=\"http://127.0.0.1:61670/__media/sites/default/Eacevedo.png\" /></div>\r\n	<div class=\"col\"><img src=\"http://127.0.0.1:61670/__media//sites/default/Jquintero.png\" /></div>\r\n</div>\r\n<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2>Esmeralda Acevedo</h2>\r\n		<p>Senior Software Developer</p>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2>Javier Quintero</h2>\r\n		<p>Developer</p>\r\n	</div>\r\n</div>\r\n\r\n','',7,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830ccb4a9f0140'),
	('2c9480838309dc9c018310c48cba0174','2022-09-06 03:07:40','2022-09-06 21:29:13',0,'<div class=\"row\">\r\n	<div class=\"col\"><img src=\"http://127.0.0.1:61670/__media/sites/default/Eacevedo.png\" /></div>\r\n	<div class=\"col\"><img src=\"http://127.0.0.1:61670/__media//sites/default/Jquintero.png\" /></div>\r\n</div>\r\n<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2>Esmeralda Acevedo</h2>\r\n		<p>Senior Software Developer</p>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2>Javier Quintero</h2>\r\n		<p> Software Developer</p>\r\n	</div>\r\n</div>\r\n\r\n','',8,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830ccb4a9f0140'),
	('2c9480838309dc9c01831117f7960175','2022-09-06 04:38:47','2022-09-06 06:01:35',0,'<h2>What is a Headless CMS?</h2>\r\n\r\n<p>lorem ipsum</p>\r\n','',4,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cd4eeac0143'),
	('2c9480838309dc9c01831163c6cf0177','2022-09-06 06:01:35','2022-09-06 06:09:29',0,'<h2>What is a Headless CMS?</h2>\r\n\r\n<p>lorem ipsum</p>\r\n','',5,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cd4eeac0143'),
	('2c9480838309dc9c0183116b017d0179','2022-09-06 06:09:29','2022-09-06 06:38:59',0,'<h2>What is a Headless CMS?</h2>\r\n\r\n<p>lorem ipsum</p>\r\n','',6,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cd4eeac0143'),
	('2c9480838309dc9c01831186016e017b','2022-09-06 06:38:58','2022-09-06 06:57:08',0,'<h2>What is a Headless CMS?</h2>\r\n\r\n<p>Acontent management system that has been decoupled from its presentation layer.</p>\r\n','',7,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cd4eeac0143'),
	('2c9480838309dc9c01831196a275017d','2022-09-06 06:57:08','2022-09-07 09:03:45',0,'<h2>What is a Headless CMS?</h2>\r\n\r\n<p>A content management system that has been decoupled from its presentation layer.</p>\r\n','',8,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cd4eeac0143'),
	('2c9480838309dc9c0183137ea0ff017f','2022-09-06 15:50:09','2022-09-06 15:50:43',0,'<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2> Traditional CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/backend-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/system-trad.svg\"/>\r\n		</div>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2> headless CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/backend-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/systems-hless.svg\"/>\r\n		</div>\r\n	</div>\r\n</div>','',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c0183137ea0ff017e'),
	('2c9480838309dc9c0183137f25cc0180','2022-09-06 15:50:43','2022-09-06 15:54:16',0,'<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2> Traditional CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/backend-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/system-trad.svg\"/>\r\n		</div>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2> headless CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/backend-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/systems-hless.svg\"/>\r\n		</div>\r\n	</div>\r\n</div>','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c0183137ea0ff017e'),
	('2c9480838309dc9c01831382648d0181','2022-09-06 15:54:16','2022-09-06 15:59:56',0,'<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2> Traditional CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/backend-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/system-trad.svg\"/>\r\n		</div>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2> headless CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/backend-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/systems-hless.svg\"/>\r\n		</div>\r\n	</div>\r\n</div>','',3,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c0183137ea0ff017e'),
	('2c9480838309dc9c01831387932e0183','2022-09-06 15:59:55','2022-09-06 16:06:31',0,'<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2> Traditional CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/backend-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/system-trad.svg\"/>\r\n		</div>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2> headless CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/backend-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/systems-hless.svg\"/>\r\n		</div>\r\n	</div>\r\n</div>','',4,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c0183137ea0ff017e'),
	('2c9480838309dc9c0183138d9a6a0186','2022-09-06 16:06:31','2022-09-06 16:20:56',0,'<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2> Traditional CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/backend-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/system-trad.svg\"/>\r\n		</div>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2> headless CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/backend-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/systems-hless.svg\"/>\r\n		</div>\r\n	</div>\r\n</div>','',5,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c0183137ea0ff017e'),
	('2c9480838309dc9c0183139ace0f0189','2022-09-06 16:20:55','2022-09-06 16:38:31',0,'<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2> Traditional CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/backend-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/system-trad.svg\"/>\r\n		</div>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2> headless CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/backend-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/systems-hless.svg\"/>\r\n		</div>\r\n	</div>\r\n</div>','',6,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c0183137ea0ff017e'),
	('2c9480838309dc9c018313aae5f0018c','2022-09-06 16:38:30','2022-09-07 08:59:57',0,'<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2> Traditional CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/backend-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/system-trad.svg\"/>\r\n		</div>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2>Headless CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/backend-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/systems-hless.svg\"/>\r\n		</div>\r\n	</div>\r\n</div>','',7,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c0183137ea0ff017e'),
	('2c9480838309dc9c01831413ac24018e','2022-09-06 18:32:57','2022-09-06 18:33:29',0,'<h2>The Body</h2>\r\n<p>Where your content is stored and authored:  the backend</p>','',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831413ac24018d'),
	('2c9480838309dc9c0183141427c0018f','2022-09-06 18:33:29','2022-09-06 20:05:36',0,'<h2>The Body</h2>\r\n<p>Where your content is stored and authored:  the backend</p>','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831413ac24018d'),
	('2c9480838309dc9c01831419fb000191','2022-09-06 18:39:50','2022-09-06 18:40:27',0,'<h2>The Head</h2>\r\n<p>The visual presentation of the content at a digital location ( e.g. website, mobile app, video channels etc ).</p>','',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831419faff0190'),
	('2c9480838309dc9c0183141a89030192','2022-09-06 18:40:27','2022-09-06 18:42:41',0,'<h2>The Head</h2>\r\n<p>The visual presentation of the content at a digital location ( e.g. website, mobile app, video channels etc ).</p>','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831419faff0190'),
	('2c9480838309dc9c0183141c94390193','2022-09-06 18:42:41','2022-09-06 18:46:04',0,'<h2>The Head</h2>\r\n<p>The visual presentation of the content at a digital location ( e.g. website, mobile app, video channels etc ).</p>\r\n','',3,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831419faff0190'),
	('2c9480838309dc9c0183141fadae0194','2022-09-06 18:46:04','2022-09-06 18:57:21',0,'<h2>The Head</h2>\r\n<p>The visual presentation of the content at a digital location ( e.g. website, mobile app, video channels etc ).</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/heads.svg\" />\r\n','',4,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831419faff0190'),
	('2c9480838309dc9c0183142a01100196','2022-09-06 18:57:20','2022-09-06 18:57:20',0,'<h2>The Head</h2>\r\n<p>The visual presentation of the content at a digital location ( e.g. website, mobile app, video channels etc ).</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/heads.svg\" />\r\n','',5,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831419faff0190'),
	('2c9480838309dc9c018314687d9f0197','2022-09-06 20:05:36','2022-09-07 01:39:52',0,'<h2>The Body</h2>\r\n<p>Where your content is stored and authored:  the backend</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/cms-body.svg\"/>','',3,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831413ac24018d'),
	('2c9480838309dc9c0183147a2be80199','2022-09-06 20:24:55','2022-09-06 20:25:12',0,'<img src=\"http://127.0.0.1:61670/__media/ContentBox_300.png\">','',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c0183147a2be70198'),
	('2c9480838309dc9c0183147a6ead019a','2022-09-06 20:25:12','2022-09-06 20:40:20',0,'<img src=\"http://127.0.0.1:61670/__media/ContentBox_300.png\">','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c0183147a2be70198'),
	('2c9480838309dc9c018314884b3101a1','2022-09-06 20:40:20','2022-09-06 21:22:48',0,'<h2><img src=\"http://127.0.0.1:61670/__media/ContentBox_300.png\"></h2>','',3,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c0183147a2be70198'),
	('2c9480838309dc9c018314af2be601a2','2022-09-06 21:22:48','2022-09-06 21:30:29',0,'<h2><img src=\"http://127.0.0.1:61670/__media/sites/default/contentbox5-3.png\"></h2>','',4,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c0183147a2be70198'),
	('2c9480838309dc9c018314b50a5201a4','2022-09-06 21:29:12','2023-11-13 11:56:14',0,'<div class=\"row\">\r\n	<div class=\"col\"><img src=\"http://127.0.0.1:61670/__media/sites/default/Eacevedo.png\" /></div>\r\n	<div class=\"col\"><img src=\"http://127.0.0.1:61670/__media//sites/default/Jquintero.png\" /></div>\r\n</div>\r\n<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2>Esmeralda Acevedo</h2>\r\n		<p>Senior Software Developer</p>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2>Javier Quintero</h2>\r\n		<p> Software Developer</p>\r\n	</div>\r\n</div>\r\n\r\n','',9,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830ccb4a9f0140'),
	('2c9480838309dc9c018314b6343501a6','2022-09-06 21:30:29','2023-11-13 21:34:04',0,'<h2><img src=\"http://127.0.0.1:61670/__media/sites/default/contentbox5-3.png\"></h2>','',5,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c0183147a2be70198'),
	('2c9480838309dc9c018314edf62301b2','2022-09-06 22:31:23','2022-09-06 22:31:50',0,'<h2>Thanks</h2>','',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c018314edf62201b0'),
	('2c9480838309dc9c018314ee601801b4','2022-09-06 22:31:50','2022-09-06 22:31:50',0,'<h2>Thanks</h2>','',2,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c018314edf62201b0'),
	('2c9480838309dc9c0183159a848201b6','2022-09-07 01:39:51','2022-09-07 01:51:37',0,'<h2>The Body</h2>\r\n<p>Where your content is stored and authored:  the backend</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/cms-body.svg\"/>','',4,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831413ac24018d'),
	('2c9480838309dc9c018315a5472a01b8','2022-09-07 01:51:36','2022-09-07 06:59:55',0,'<h2>The Body</h2>\r\n<p>Where your content is stored and authored:  the backend</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/cms-body.svg\"/>','',5,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831413ac24018d'),
	('2c9480838309dc9c018316bf8b6a01ba','2022-09-07 06:59:55','2022-09-07 07:06:09',0,'<h2>The Body</h2>\r\n<p>Where your content is stored and authored:  the backend</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/cmsbody.svg\"/>','',6,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831413ac24018d'),
	('2c9480838309dc9c018316c5407c01bc','2022-09-07 07:06:09','2022-09-07 07:07:36',0,'<h2>The Body</h2>\r\n<p>Where your content is stored and authored:  the backend</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/cms-body.svg\"/>','',7,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831413ac24018d'),
	('2c9480838309dc9c018316c6940b01be','2022-09-07 07:07:36','2022-09-07 17:20:04',0,'<h2>The Body</h2>\r\n<p>Where your content is stored and authored:  the backend</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/hless-body.svg\"/>','',8,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831413ac24018d'),
	('2c9480838309dc9c0183172d6ed601c1','2022-09-07 08:59:57','2022-09-07 08:59:57',0,'<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2> Traditional CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/backend-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/system-trad.svg\"/>\r\n		</div>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2>Headless CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/api-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/systems-hless.svg\"/>\r\n		</div>\r\n	</div>\r\n</div>','',8,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c0183137ea0ff017e'),
	('2c9480838309dc9c01831730e98001c3','2022-09-07 09:03:45','2022-09-07 15:24:46',0,'<h2>What is a Headless CMS?</h2>\r\n\r\n<p>A content management system that has is decoupled from the presentation layer.</p>\r\n','',9,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cd4eeac0143'),
	('2c9480838309dc9c0183188dbcf601c6','2022-09-07 15:24:45','2023-11-13 15:35:13',0,'<h2>What is a Headless CMS?</h2>\r\n\r\n<p>A content management system that is decoupled from the presentation layer.</p>\r\n','',10,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01830cd4eeac0143'),
	('2c9480838309dc9c018318f74ce401c8','2022-09-07 17:20:03','2022-09-07 17:20:03',0,'<h2>The Body</h2>\r\n<p>Where your content is stored and authored:  the backend</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/cmsBody.svg\"/>','',9,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831413ac24018d'),
	('2c9480838309dc9c01831b144f3e01ca','2022-09-06 03:10:59','2022-09-06 03:23:46',0,'<h2>Advantages</h2>','',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831b144f3d01c9'),
	('2c9480838309dc9c01831b20004c01cb','2022-09-06 18:43:57','2022-09-08 08:11:53',0,'<h2>Headless CMS Advantages</h2>\r\n<ul>\r\n		<li>Reusable content</li>\r\n		<li>Provides flexibility to the front-end developers </li>\r\n		<li>Scalability</li>\r\n		<li>Omnichannel experience </li>\r\n		<li>Better security</li>\r\n		<li>Future Proof</li>\r\n</ul>','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831b144f3d01c9'),
	('2c9480838309dc9c01831c27c8e601cd','2022-09-08 08:11:53','2023-11-13 21:32:12',0,'<h2>Headless CMS Advantages</h2>\r\n<ul>\r\n		<li>Reusable content</li>\r\n		<li>Provides flexibility to the front-end developers </li>\r\n		<li>Scalability</li>\r\n		<li>Omnichannel experience </li>\r\n		<li>Better security</li>\r\n		<li>Future Proof</li>\r\n</ul>','',3,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831b144f3d01c9'),
	('2c9480838309dc9c01831d5f04b901d1','2022-09-08 13:51:50','2022-09-08 13:53:31',0,'<p>These are the presentation slides.</p>\r\n','Content Cloned!',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f04b801d0'),
	('2c9480838309dc9c01831d5f0ec001d5','2022-09-08 13:51:52','2022-12-04 02:19:49',0,'<h1>Off with their heads <span>ContentBox 5 : Headless CMS</span></h1>\r\n','Content Cloned!',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f0ebf01d2'),
	('2c9480838309dc9c01831d5f0f4e01d8','2022-09-08 13:51:53','2022-12-04 02:20:42',0,'<div class=\"row\">\r\n	<div class=\"col\"><img src=\"http://127.0.0.1:61670/__media/sites/default/Eacevedo.png\" /></div>\r\n	<div class=\"col\"><img src=\"http://127.0.0.1:61670/__media//sites/default/Jquintero.png\" /></div>\r\n</div>\r\n<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2>Esmeralda Acevedo</h2>\r\n		<p>Senior Software Developer</p>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2>Javier Quintero</h2>\r\n		<p> Software Developer</p>\r\n	</div>\r\n</div>\r\n\r\n','Content Cloned!',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f0f4d01d6'),
	('2c9480838309dc9c01831d5f0fd601db','2022-09-08 13:51:53','2022-12-04 02:22:57',0,'<h2>What is a Headless CMS?</h2>\r\n\r\n<p>A content management system that is decoupled from the presentation layer.</p>\r\n','Content Cloned!',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f0fd501d9'),
	('2c9480838309dc9c01831d5f109801df','2022-09-08 13:51:53','2022-12-04 02:24:37',0,'<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2> Traditional CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/backend-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/system-trad.svg\"/>\r\n		</div>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2>Headless CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/api-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/systems-hless.svg\"/>\r\n		</div>\r\n	</div>\r\n</div>','Content Cloned!',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f109601dc'),
	('2c9480838309dc9c01831d5f112101e2','2022-09-08 13:51:53','2022-12-04 02:26:44',0,'<h2>The Body</h2>\r\n<p>Where your content is stored and authored:  the backend</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/cmsBody.svg\"/>','Content Cloned!',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f112001e0'),
	('2c9480838309dc9c01831d5f11b801e5','2022-09-08 13:51:53','2022-12-04 02:28:33',0,'<h2>The Head</h2>\r\n<p>The visual presentation of the content at a digital location ( e.g. website, mobile app, video channels etc ).</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/heads.svg\" />\r\n','Content Cloned!',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f11b701e3'),
	('2c9480838309dc9c01831d5f124101e8','2022-09-08 13:51:53','2022-12-04 02:50:01',0,'<h2>Headless CMS Advantages</h2>\r\n<ul>\r\n		<li>Reusable content</li>\r\n		<li>Provides flexibility to the front-end developers </li>\r\n		<li>Scalability</li>\r\n		<li>Omnichannel experience </li>\r\n		<li>Better security</li>\r\n		<li>Future Proof</li>\r\n</ul>','Content Cloned!',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f124001e6'),
	('2c9480838309dc9c01831d5f12c301eb','2022-09-08 13:51:53','2022-12-04 02:50:40',0,'<h2><img src=\"http://127.0.0.1:61670/__media/sites/default/contentbox5-3.png\"></h2>','Content Cloned!',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f12c201e9'),
	('2c9480838309dc9c01831d5f131901ed','2022-09-08 13:51:54','2022-12-04 02:58:51',0,'<h2>Hierarchical Headless Content Store</h2>\r\n<div class=\"row\">\r\n	<div class=\"col\">\r\n		<ul>\r\n			<li>More than pages and blogs</li>\r\n			<li>Hierarchical content store</li>\r\n			<li>Core for headless operations</li>\r\n			<li>Multiple publishing techniques</li>\r\n			<li>Expressive API for consumption</li>\r\n			<li>Power any web app</li>\r\n			</ul>\r\n	</div>\r\n	<div class=\"col\">\r\n		<img src=\"http://127.0.0.1:61670/__media/sites/default/screenshot-contentstore.png\"/>\r\n	</div>\r\n</div>','Content Cloned!',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f131901ec'),
	('2c9480838309dc9c01831d5f137201ef','2022-09-08 13:51:54','2022-12-04 03:04:56',0,'<h2>Headless ContentBox</h2>\r\n<div class=\"row\">\r\n<div class=\"col\">\r\n<ul>\r\n<li>Expressive RESTFul API</li>\r\n<li>Secure JWT Clients</li>\r\n<li>Powered by ColdBox Security (PBAC)<br/>\r\n-- Permission Based Access Control\r\n</li>\r\n<li>Completely Documented</li>\r\n<li>Connect to pages, blog or the content store</li>\r\n<li>Deploy as a single module</li>\r\n<li>Consume from ANY language</li>\r\n</ul>\r\n</div>\r\n<div class=\"col\">\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/screenshot-headless-cb.png\"/>\r\n</div>\r\n</div>','Content Cloned!',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f137101ee'),
	('2c9480838309dc9c01831d5f13ff01f2','2022-09-08 13:51:54','2022-12-04 03:21:29',0,'<h2>Thank Our Sponsors</h2>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/sponsors.png\"/>','Content Cloned!',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f13fe01f0'),
	('2c9480838309dc9c01831d5f14c201f5','2022-09-08 13:51:54','2022-12-04 03:05:22',0,'<h2>Thanks</h2>','Content Cloned!',1,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f14c101f3'),
	('2c9480838309dc9c01831d60901301f6','2022-09-08 13:53:31','2022-09-08 13:53:31',0,'<p>These are the presentation slides.</p>\r\n','',2,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f04b801d0'),
	('2c94808384da81f00184daeeb8920004','2022-12-04 02:19:48','2022-12-04 03:07:12',0,'<h1>ContentBox: El CMS sin Cabeza</h1>\r\n','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f0ebf01d2'),
	('2c94808384da81f00184daef871e0006','2022-12-04 02:20:42','2022-12-04 02:20:42',0,'<div class=\"row\">\r\n	<div class=\"col\"><img src=\"http://127.0.0.1:61670/__media/sites/default/Eacevedo.png\" /></div>\r\n</div>\r\n<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2>Esmeralda Acevedo</h2>\r\n		<p>Senior Software Developer</p>\r\n	</div>\r\n</div>\r\n\r\n','',2,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f0f4d01d6'),
	('2c94808384da81f00184daf197960008','2022-12-04 02:22:57','2022-12-06 00:26:42',0,'<h2>Qué es un CMS sin Cabeza ( Headless CMS)?</h2>\r\n\r\n<p>Es un sistema que administra contenido y que ha sido desacoplado de la capa de presentación.</p>\r\n','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f0fd501d9'),
	('2c94808384da81f00184daf31dbf000b','2022-12-04 02:24:37','2022-12-04 02:24:37',0,'<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2> Tradicional CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/backend-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/system-trad.svg\"/>\r\n		</div>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2>Headless CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/api-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/systems-hless.svg\"/>\r\n		</div>\r\n	</div>\r\n</div>','',2,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f109601dc'),
	('2c94808384da81f00184daf50e8b000d','2022-12-04 02:26:44','2022-12-04 02:26:44',0,'<h2>El Cuerpo</h2>\r\n<p>Donde su contenido es creado y guardado:  the backend</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/cmsBody.svg\"/>','',2,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f112001e0'),
	('2c94808384da81f00184daf6b93d000f','2022-12-04 02:28:33','2022-12-04 03:11:23',0,'<h2>La Cabeza</h2>\r\n<p>La representación visual del contenido en la cocalización digital  ( e.g. website, app mobil, canales de video, etc ).</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/heads.svg\" />\r\n','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f11b701e3'),
	('2c94808384da81f00184db0a5f980011','2022-12-04 02:50:01','2022-12-04 03:12:31',0,'<h2>Ventajas de un Headless CMS</h2>\r\n<ul>\r\n		<li>El contenido es reusable</li>\r\n		<li>Da flexibilidad a los desarrolladores del front-end</li>\r\n		<li>Scalabilidad</li>\r\n		<li>Experiencia de omnichannel </li>\r\n		<li>Mejor securidad</li>\r\n		<li>Asegurado para el futuro</li>\r\n</ul>','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f124001e6'),
	('2c94808384da81f00184db0af9440013','2022-12-04 02:50:40','2022-12-04 02:50:40',0,'<h2><img src=\"http://127.0.0.1:61670/__media/sites/default/contentbox5-3.png\"></h2>','',2,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f12c201e9'),
	('2c94808384da81f00184db1273b90014','2022-12-04 02:58:50','2022-12-04 03:14:04',0,'<h2>Jerárquico Content Store sin Cabeza</h2>\r\n<div class=\"row\">\r\n	<div class=\"col\">\r\n		<ul>\r\n			<li>Más de paginas y blogs</li>\r\n			<li>Jerárquico almacen de contenido</li>\r\n			<li>Centro de operaciones sin cabeza</li>\r\n			<li>Multiple técnicas de publicación</li>\r\n			<li>API expresiva para el consumo</li>\r\n			<li>Alimenta cualquier web app</li>\r\n			</ul>\r\n	</div>\r\n	<div class=\"col\">\r\n		<img src=\"http://127.0.0.1:61670/__media/sites/default/screenshot-contentstore.png\"/>\r\n	</div>\r\n</div>','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f131901ec'),
	('2c94808384da81f00184db1806220015','2022-12-04 03:04:56','2022-12-04 17:20:30',0,'<h2>ContentBox sin Cabeza</h2>\r\n<div class=\"row\">\r\n<div class=\"col\">\r\n<ul>\r\n<li>Expressive RESTFul API</li>\r\n<li>Seguros JWT Clients</li>\r\n<li>Powered by ColdBox Security (PBAC)<br/>\r\n-- Permission Based Access Control\r\n</li>\r\n<li>Completa Documentación</li>\r\n<li>Conecte a paginas, blog o Content Store</li>\r\n<li>Despleje como unico módulo</li>\r\n<li>Consume de cualquier lenguaje de programación</li>\r\n</ul>\r\n</div>\r\n<div class=\"col\">\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/screenshot-headless-cb.png\"/>\r\n</div>\r\n</div>','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f137101ee'),
	('2c94808384da81f00184db186b0a0017','2022-12-04 03:05:21','2022-12-04 03:05:21',0,'<h2>Gracias</h2>','',2,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f14c101f3'),
	('2c94808384da81f00184db1a1c5f001a','2022-12-04 03:07:12','2022-12-04 03:07:12',0,'<h1>ContentBox: <span>El CMS sin Cabeza</span></h1>\r\n','',3,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f0ebf01d2'),
	('2c94808384da81f00184db1df0a1001c','2022-12-04 03:11:23','2022-12-04 03:11:23',0,'<h2>La Cabeza</h2>\r\n<p>La representación visual del contenido en la localización digital  ( e.g. website, app mobil, canales de video, etc ).</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/heads.svg\" />\r\n','',3,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f11b701e3'),
	('2c94808384da81f00184db1ef7aa001e','2022-12-04 03:12:31','2022-12-07 00:06:58',0,'<h2>Ventajas de un Headless CMS</h2>\r\n<ul>\r\n		<li>El contenido es reusable</li>\r\n		<li>Da flexibilidad a los desarrolladores del front-end</li>\r\n		<li>Scalabilidad</li>\r\n		<li>Experiencia de omnichannel </li>\r\n		<li>Mejor seguridad</li>\r\n		<li>Asegurado para el futuro</li>\r\n</ul>','',3,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f124001e6'),
	('2c94808384da81f00184db206304001f','2022-12-04 03:14:04','2022-12-04 06:55:32',0,'<h2>Jerárquico Content Store sin Cabeza</h2>\r\n<div class=\"row\">\r\n	<div class=\"col\">\r\n		<ul>\r\n			<li>Es más que paginas y blogs</li>\r\n			<li>Jerárquico almacen de contenido</li>\r\n			<li>Centro de operaciones sin cabeza</li>\r\n			<li>Multiple técnicas de publicación</li>\r\n			<li>API expresiva para el consumo</li>\r\n			<li>Alimenta cualquier web app</li>\r\n			</ul>\r\n	</div>\r\n	<div class=\"col\">\r\n		<img src=\"http://127.0.0.1:61670/__media/sites/default/screenshot-contentstore.png\"/>\r\n	</div>\r\n</div>','',3,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f131901ec'),
	('2c94808384da81f00184db272d590021','2022-12-04 03:21:28','2022-12-06 00:15:04',0,'<h2>Thank Our Sponsors</h2>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/Digicel_business_white.svg\"/>','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f13fe01f0'),
	('2c94808384da81f00184dbeb27eb0023','2022-12-04 06:55:32','2022-12-04 07:08:58',0,'<h2>Jerárquico Content Store sin Cabeza</h2>\r\n<div class=\"row\">\r\n	<div class=\"col\">\r\n		<ul>\r\n			<li>Es más que páginas y blogs</li>\r\n			<li>Jerárquico almacen de contenido</li>\r\n			<li>Centro de operaciones sin cabeza</li>\r\n			<li>Multiple técnicas de publicación</li>\r\n			<li>API expresiva para el consumo</li>\r\n			<li>Alimenta cualquier web app</li>\r\n			</ul>\r\n	</div>\r\n	<div class=\"col\">\r\n		<img src=\"http://127.0.0.1:61670/__media/sites/default/screenshot-contentstore.png\"/>\r\n	</div>\r\n</div>','',4,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f131901ec'),
	('2c94808384da81f00184dbf773450024','2022-12-04 07:08:58','2022-12-04 17:21:02',0,'<h2>Jerárquico Content Store sin Cabeza</h2>\r\n<div class=\"row\">\r\n	<div class=\"col\">\r\n		<ul>\r\n			<li>Es más que páginas y blogs</li>\r\n			<li>Jerárquico almacen de contenido</li>\r\n			<li>Centro de operaciones sin cabeza</li>\r\n			<li>Múltiple técnicas de publicación</li>\r\n			<li>API expresiva para el consumo</li>\r\n			<li>Alimenta cualquier web app</li>\r\n			</ul>\r\n	</div>\r\n	<div class=\"col\">\r\n		<img src=\"http://127.0.0.1:61670/__media/sites/default/screenshot-contentstore.png\"/>\r\n	</div>\r\n</div>','',5,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f131901ec'),
	('2c94808384da81f00184de2756a60026','2022-12-04 17:20:30','2022-12-07 00:10:58',0,'<h2>ContentBox sin Cabeza</h2>\r\n<div class=\"row\">\r\n<div class=\"col\">\r\n<ul>\r\n<li>Expressive RESTFul API</li>\r\n<li>Seguros JWT Clients</li>\r\n<li>Impulsado por ColdBox Security (PBAC)<br/>\r\n-- Permission Based Access Control\r\n</li>\r\n<li>Completa Documentación</li>\r\n<li>Conecte a paginas, blog o Content Store</li>\r\n<li>Despleje como unico módulo</li>\r\n<li>Consume de cualquier lenguaje de programación</li>\r\n</ul>\r\n</div>\r\n<div class=\"col\">\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/screenshot-headless-cb.png\"/>\r\n</div>\r\n</div>','',3,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f137101ee'),
	('2c94808384da81f00184de27d4bb0027','2022-12-04 17:21:02','2022-12-07 00:08:26',0,'<h2>Jerárquico Content Store sin Cabeza</h2>\r\n<div class=\"row\">\r\n	<div class=\"col\">\r\n		<ul>\r\n			<li>Es más que páginas y blogs</li>\r\n			<li>Jerárquico almacen de contenido</li>\r\n			<li>Centro de operaciones sin cabeza</li>\r\n			<li>Múltiple técnicas de publicación</li>\r\n			<li>API expresiva para el consumo</li>\r\n			<li>Impulsa cualquier web app</li>\r\n			</ul>\r\n	</div>\r\n	<div class=\"col\">\r\n		<img src=\"http://127.0.0.1:61670/__media/sites/default/screenshot-contentstore.png\"/>\r\n	</div>\r\n</div>','',6,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f131901ec'),
	('2c94808384e113b20184e4856a7a0006','2022-12-05 23:01:00','2022-12-05 23:18:57',0,'This is my homepage','',1,0,'2c9480838309dc9c018309dfb3be0092','2c94808384e113b20184e4856a790005'),
	('2c94808384e113b20184e48d35de0008','2022-12-05 23:09:30','2022-12-07 00:29:44',0,'Services page','',1,0,'2c9480838309dc9c018309dfb3be0092','2c94808384e113b20184e48d35dd0007'),
	('2c94808384e113b20184e48e92490009','2022-12-05 23:11:00','2022-12-05 23:25:59',0,'<p>Hey welcome to my about page for ContentBox, isn\'t this great!</p>','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c018309dfc80400e9'),
	('2c94808384e113b20184e495d820000a','2022-12-05 23:18:57','2022-12-05 23:20:31',0,'Ortus Solutions is a minority-owned Christian business founded by Luis Majano in 2006 with the vision of empowering developers with great open source tools and empowering clients with scalable and robust applications. We have a proven track record of successful web application development from small scale to mission critical applications, software architecture, website design, training and support services.\r\n\r\nWe know how difficult it is to do everything all by yourself therefore we are here to help you out. Our focus is to make your business more efficient without having to pay high consulting rates which leaves you wanting more. We are at our core, developers who know the value of time and money and we have seen firsthand how our products and services can help you save those two invaluable things.','',2,0,'2c9480838309dc9c018309dfb3be0092','2c94808384e113b20184e4856a790005'),
	('2c94808384e113b20184e49749a1000b','2022-12-05 23:20:31','2022-12-05 23:25:43',0,'<p>Ortus Solutions is a minority-owned Christian business founded by Luis Majano in 2006 with the vision of empowering developers with great open source tools and empowering clients with scalable and robust applications. We have a proven track record of successful web application development from small scale to mission critical applications, software architecture, website design, training and support services.</p>\r\n\r\n<p>We know how difficult it is to do everything all by yourself therefore we are here to help you out. Our focus is to make your business more efficient without having to pay high consulting rates which leaves you wanting more. We are at our core, developers who know the value of time and money and we have seen firsthand how our products and services can help you save those two invaluable things.</p>','',3,0,'2c9480838309dc9c018309dfb3be0092','2c94808384e113b20184e4856a790005'),
	('2c94808384e113b20184e49c0c68000c','2022-12-05 23:25:43','2022-12-05 23:26:43',0,'<div class=\"row\"><div class=\"col-sm-10 col-sm-offset-1 margintop25\"><h4 class=\"margin10\">We\'re a <strong>product</strong> and <strong>services</strong> company that focuses on building <span class=\"bold-txt\">professional open source</span> tools and <span class=\"bold-txt\">web application solutions.</span></h4> <div></div> <div class=\"row\"><div class=\"col-sm-12\"><div class=\"row margintop30 glow-bg\"><div class=\"col-xs-6 col-sm-3 margintop15\"><a href=\"/products/coldbox\" title=\"\" data-original-title=\"ColdBox HMVC\"><img src=\"/http://127.0.0.1:61670__media/products/coldbox-white.png\" alt=\"coldbox\" class=\"img-fluid\"></a></div> <div class=\"col-xs-6 col-sm-3 margintop15\"><a href=\"/products/commandbox\" title=\"\" data-original-title=\"CommandBox CLI\"><img src=\"http://127.0.0.1:61670/__media/products/commandbox-white.png\" alt=\"commandbox\" class=\"img-fluid\"></a></div> <div class=\"col-xs-6 col-sm-3 margintop15\"><a href=\"/products/contentbox\" title=\"\" data-original-title=\"ContentBox Modular CMS\"><img src=\"http://127.0.0.1:61670/__media/products/contentbox-white.png\" alt=\"contentbox\" class=\"img-fluid\"></a></div> <div class=\"col-xs-6 col-sm-3 margintop15\"><a href=\"/products/testbox\" title=\"\" data-original-title=\"TestBox Behavior Driven Development\"><img src=\"http://127.0.0.1:61670/__media/products/testbox-white.png\" alt=\"testbox\" class=\"img-fluid\"></a></div></div></div></div> <div><p class=\" margintop30\">We\'re the team behind <a href=\"/products/coldbox\"><span class=\"textOrtus\">ColdBox</span></a>, the de-facto enterprise ColdFusion MVC Framework, <a href=\"/products/testbox\"><span class=\"textOrtus\">TestBox</span></a>, a Testing and Behavior Driven Development (BDD) Framework, <a href=\"/products/contentbox\"><span class=\"textOrtus\">ContentBox Modular CMS</span></a>, a highly modular and scalable Content Management System, <a href=\"/products/commandbox\"><span class=\"textOrtus\">CommandBox</span></a>, the ColdFusion (CFML) CLI, package manager, etc, and many more.</p> <p>&nbsp;</p></div></div></div>','',4,0,'2c9480838309dc9c018309dfb3be0092','2c94808384e113b20184e4856a790005'),
	('2c94808384e113b20184e49c4b7f000d','2022-12-05 23:25:59','2022-12-07 03:38:28',0,'<p>Ortus Solutions is a minority-owned Christian business founded by Luis Majano in 2006 with the vision of empowering developers with great open source tools and empowering clients with scalable and robust applications. We have a proven track record of successful web application development from small scale to mission critical applications, software architecture, website design, training and support services.</p>\r\n\r\n<p>We know how difficult it is to do everything all by yourself therefore we are here to help you out. Our focus is to make your business more efficient without having to pay high consulting rates which leaves you wanting more. We are at our core, developers who know the value of time and money and we have seen firsthand how our products and services can help you save those two invaluable things.</p>','',3,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c018309dfc80400e9'),
	('2c94808384e113b20184e49cf730000e','2022-12-05 23:26:43','2022-12-07 00:24:27',0,'<div class=\"row\"><div class=\"col-sm-10 col-sm-offset-1 margintop25\"><h4 class=\"margin10\">We\'re a <strong>product</strong> and <strong>services</strong> company that focuses on building <span class=\"bold-txt\">professional open source</span> tools and <span class=\"bold-txt\">web application solutions.</span></h4> <div></div> <div class=\"row\"><div class=\"col-sm-12\"><div class=\"row margintop30 glow-bg\"><div class=\"col-xs-6 col-sm-3 margintop15\"><a href=\"/products/coldbox\" title=\"\" data-original-title=\"ColdBox HMVC\"><img src=\"http://127.0.0.1:61670/__media/products/coldbox-white.png\" alt=\"coldbox\" class=\"img-fluid\"></a></div> <div class=\"col-xs-6 col-sm-3 margintop15\"><a href=\"/products/commandbox\" title=\"\" data-original-title=\"CommandBox CLI\"><img src=\"http://127.0.0.1:61670/__media/products/commandbox-white.png\" alt=\"commandbox\" class=\"img-fluid\"></a></div> <div class=\"col-xs-6 col-sm-3 margintop15\"><a href=\"/products/contentbox\" title=\"\" data-original-title=\"ContentBox Modular CMS\"><img src=\"http://127.0.0.1:61670/__media/products/contentbox-white.png\" alt=\"contentbox\" class=\"img-fluid\"></a></div> <div class=\"col-xs-6 col-sm-3 margintop15\"><a href=\"/products/testbox\" title=\"\" data-original-title=\"TestBox Behavior Driven Development\"><img src=\"http://127.0.0.1:61670/__media/products/testbox-white.png\" alt=\"testbox\" class=\"img-fluid\"></a></div></div></div></div> <div><p class=\" margintop30\">We\'re the team behind <a href=\"/products/coldbox\"><span class=\"textOrtus\">ColdBox</span></a>, the de-facto enterprise ColdFusion MVC Framework, <a href=\"/products/testbox\"><span class=\"textOrtus\">TestBox</span></a>, a Testing and Behavior Driven Development (BDD) Framework, <a href=\"/products/contentbox\"><span class=\"textOrtus\">ContentBox Modular CMS</span></a>, a highly modular and scalable Content Management System, <a href=\"/products/commandbox\"><span class=\"textOrtus\">CommandBox</span></a>, the ColdFusion (CFML) CLI, package manager, etc, and many more.</p> <p>&nbsp;</p></div></div></div>','',5,0,'2c9480838309dc9c018309dfb3be0092','2c94808384e113b20184e4856a790005'),
	('2c94808384e113b20184e4c9387b0011','2022-12-06 00:15:03','2022-12-06 00:25:01',0,'<h2>Thank Our Sponsors</h2>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/Digicel_business_white.svg\"/>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/Sistema_Fedecredito.png\"/>\r\n\r\n','',3,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f13fe01f0'),
	('2c94808384e113b20184e4d258bb0013','2022-12-06 00:25:01','2022-12-06 00:25:01',0,'<h2>Gracias a nuestros Patrocindores</h2>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/Digicel_business_white.svg\"/>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/Sistema_Fedecredito.png\"/>\r\n\r\n','',4,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f13fe01f0'),
	('2c94808384e113b20184e4d3dff00015','2022-12-06 00:26:41','2022-12-06 00:26:41',0,'<h2>Qué es un CMS sin Cabeza <span>( Headless CMS)?</span></h2>\r\n\r\n<p>Es un sistema que administra contenido y que ha sido desacoplado de la capa de presentación.</p>\r\n','',3,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f0fd501d9'),
	('2c94808384e113b20184e9e82a0b0017','2022-12-07 00:06:57','2022-12-07 00:06:57',0,'<h2>Ventajas de un Headless CMS</h2>\r\n<ul>\r\n		<li>El contenido es reusable</li>\r\n		<li>Da flexibilidad a los desarrolladores del front-end</li>\r\n		<li>Escalabilidad</li>\r\n		<li>Experiencia de omnichannel </li>\r\n		<li>Mejor seguridad</li>\r\n		<li>Asegurado para el futuro</li>\r\n</ul>','',4,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f124001e6'),
	('2c94808384e113b20184e9e984200018','2022-12-07 00:08:26','2022-12-07 00:09:07',0,'<h2>Jerárquico Content Store sin Cabeza</h2>\r\n<div class=\"row\">\r\n	<div class=\"col\">\r\n		<ul>\r\n			<li>Es más que páginas y blogs</li>\r\n			<li>Jerárquico almacén de contenido</li>\r\n			<li>Centro de operaciones sin cabeza</li>\r\n			<li>Múltiples técnicas de publicación</li>\r\n			<li>API expresiva para el consumo</li>\r\n			<li>Impulsa cualquier web app</li>\r\n			</ul>\r\n	</div>\r\n	<div class=\"col\">\r\n		<img src=\"http://127.0.0.1:61670/__media/sites/default/screenshot-contentstore.png\"/>\r\n	</div>\r\n</div>','',7,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f131901ec'),
	('2c94808384e113b20184e9ea24c90019','2022-12-07 00:09:07','2022-12-07 00:09:07',0,'<h2>Jerárquico Content Store sin Cabeza</h2>\r\n<div class=\"row\">\r\n	<div class=\"col\">\r\n		<ul>\r\n			<li>Es más que páginas y blogs</li>\r\n			<li>Jerárquico almacén de contenido</li>\r\n			<li>Centro de operaciones sin cabeza</li>\r\n			<li>Múltiples técnicas de publicación</li>\r\n			<li>API expresiva para el consumo</li>\r\n			<li>Impulsa cualquier aplicación web</li>\r\n			</ul>\r\n	</div>\r\n	<div class=\"col\">\r\n		<img src=\"http://127.0.0.1:61670/__media/sites/default/screenshot-contentstore.png\"/>\r\n	</div>\r\n</div>','',8,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f131901ec'),
	('2c94808384e113b20184e9ebd430001a','2022-12-07 00:10:58','2022-12-07 00:10:58',0,'<h2>ContentBox sin Cabeza</h2>\r\n<div class=\"row\">\r\n<div class=\"col\">\r\n<ul>\r\n<li>Expressive RESTFul API</li>\r\n<li>Seguros JWT Clients</li>\r\n<li>Impulsado por ColdBox Security (PBAC)<br/>\r\n-- Permission Based Access Control\r\n</li>\r\n<li>Completa documentación</li>\r\n<li>Conecta páginas, blog o Content Store</li>\r\n<li>Desplega como único módulo</li>\r\n<li>Consume cualquier lenguaje de programación</li>\r\n</ul>\r\n</div>\r\n<div class=\"col\">\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/screenshot-headless-cb.png\"/>\r\n</div>\r\n</div>','',4,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c01831d5f137101ee'),
	('2c94808384e113b20184e9f82cc8001b','2022-12-07 00:24:27','2023-11-15 17:37:45',0,'<h2>Manage content easily and deliver it to any device.</h2>\r\n<p>CONTENTBOX is a powerful open-source headless CMS. 100% fully Customizable.</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/contentbox-5-dark.png\" alt=\"ContentBox\">','',6,0,'2c9480838309dc9c018309dfb3be0092','2c94808384e113b20184e4856a790005'),
	('2c94808384e113b20184e9fd0269001c','2022-12-07 00:29:44','2022-12-07 00:53:32',0,'<div class=\"container serv-container tw-mx-auto tw-max-w-6xl\"><div class=\"serv-boxes-container tw-mt-12 sm:tw-grid md:tw-grid-cols-3 tw-gap-8 sm:tw-grid-cols-2 tw-flex tw-flex-wrap tw-justify-between\"><div class=\"serv-box tw-flex tw-flex-col tw-justify-center tw-text-center div-support\"><a href=\"./services/support\" class=\"hover:tw-no-underline\"><div class=\"serv-ico ico-dev tw-flex\"><i aria-hidden=\"true\" class=\"icon\"></i></div> <p class=\"serv-box-ttl tw-leading-none\">\r\nSupport &amp; Consulting\r\n</p> <div class=\"serv-box-desc serv-box-desc-short\">\r\nGet help when needed.\r\n</div> <p>\r\nRead More\r\n<i aria-hidden=\"true\" class=\"fa fa-chevron-right\"></i></p></a></div> <div class=\"serv-box tw-flex tw-flex-col tw-justify-center tw-text-center div-web-development\"><a href=\"./services/web-development\" class=\"hover:tw-no-underline\"><div class=\"serv-ico ico-dev tw-flex\"><i aria-hidden=\"true\" class=\"icon\"></i></div> <p class=\"serv-box-ttl tw-leading-none\">\r\nCustom Web Development\r\n</p> <div class=\"serv-box-desc serv-box-desc-short\">\r\nLet us help you with your next project.\r\n</div> <p>\r\nRead More\r\n<i aria-hidden=\"true\" class=\"fa fa-chevron-right\"></i></p></a></div> <div class=\"serv-box tw-flex tw-flex-col tw-justify-center tw-text-center div-uxui\"><a href=\"./services/uxui\" class=\"hover:tw-no-underline\"><div class=\"serv-ico ico-dev tw-flex\"><i aria-hidden=\"true\" class=\"icon\"></i></div> <p class=\"serv-box-ttl\">UX/UI Design</p> <div class=\"serv-box-desc\">\r\nImplement web design carefully crafted to meet your user needs.\r\n</div> <p>\r\nRead More\r\n<i aria-hidden=\"true\" class=\"fa fa-chevron-right\"></i></p></a></div> <div class=\"serv-box tw-flex tw-flex-col tw-justify-center tw-text-center div-mobile-app\"><a href=\"./services/mobile-app\" class=\"hover:tw-no-underline\"><div class=\"serv-ico ico-dev tw-flex\"><i aria-hidden=\"true\" class=\"icon\"></i></div> <p class=\"serv-box-ttl\">Mobile App</p> <div class=\"serv-box-desc\">\r\nCreate fully-responsive websites, progressive apps and hybrid mobile apps.\r\n</div> <p>\r\nRead More\r\n<i aria-hidden=\"true\" class=\"fa fa-chevron-right\"></i></p></a></div> <div class=\"serv-box tw-flex tw-flex-col tw-justify-center tw-text-center div-legacy-migration\"><a href=\"./services/legacy-web-application-migration-strategy\" class=\"hover:tw-no-underline\"><div class=\"serv-ico ico-dev tw-flex\"><i aria-hidden=\"true\" class=\"icon\"></i></div> <p class=\"serv-box-ttl\">\r\nLegacy Migration\r\n</p> <div class=\"serv-box-desc\">\r\nModernize your code, infrastructure and code deployment pipeline.\r\n</div> <p>\r\nRead More\r\n<i aria-hidden=\"true\" class=\"fa fa-chevron-right\"></i></p></a></div> <div class=\"serv-box tw-flex tw-flex-col tw-justify-center tw-text-center div-quality-assurance\"><a href=\"./services/quality-assurance\" class=\"hover:tw-no-underline\"><div class=\"serv-ico ico-dev tw-flex\"><i aria-hidden=\"true\" class=\"icon\"></i></div> <p class=\"serv-box-ttl\">\r\nQuality Assurance\r\n</p> <div class=\"serv-box-desc\">\r\nModernize your code, infrastructure and code deployment pipeline.\r\n</div> <p>\r\nRead More\r\n<i aria-hidden=\"true\" class=\"fa fa-chevron-right\"></i></p></a></div> <div class=\"serv-box tw-flex tw-flex-col tw-justify-center tw-text-center div-BI\"><a href=\"./services/business-intelligence\" class=\"hover:tw-no-underline\"><div class=\"serv-ico ico-dev tw-flex\"><i aria-hidden=\"true\" class=\"icon\"></i></div> <p class=\"serv-box-ttl\">\r\nBusiness Intelligence\r\n</p> <div class=\"serv-box-desc\">\r\nA real time business intelligence dashboard.\r\n</div> <p>\r\nRead More\r\n<i aria-hidden=\"true\" class=\"fa fa-chevron-right\"></i></p></a></div> <div class=\"serv-box tw-flex tw-flex-col tw-justify-center tw-text-center div-infrastructure\"><a href=\"./services/servers\" class=\"hover:tw-no-underline\"><div class=\"serv-ico ico-dev tw-flex\"><i aria-hidden=\"true\" class=\"icon\"></i></div> <p class=\"serv-box-ttl\">\r\nServer Infrastructure\r\n</p> <div class=\"serv-box-desc\">\r\nDesign scalable and secure infrastructure for the cloud or for on-premise.\r\n</div> <p>\r\nRead More\r\n<i aria-hidden=\"true\" class=\"fa fa-chevron-right\"></i></p></a></div> <div class=\"serv-box tw-flex tw-flex-col tw-justify-center tw-text-center div-security\"><a href=\"./services/security-performance\" class=\"hover:tw-no-underline\"><div class=\"serv-ico ico-dev tw-flex\"><i aria-hidden=\"true\" class=\"icon\"></i></div> <p class=\"serv-box-ttl\">\r\nPerformance &amp; Security\r\n</p> <div class=\"serv-box-desc\">\r\nOptimize performance for your web apps, detect and remediate security vulnerabilities.\r\n</div> <p>\r\nRead More\r\n<i aria-hidden=\"true\" class=\"fa fa-chevron-right\"></i></p></a></div> <div class=\"serv-box tw-flex tw-flex-col tw-justify-center tw-text-center div-training\"><a href=\"./services/training\" class=\"hover:tw-no-underline\"><div class=\"serv-ico ico-dev tw-flex\"><i aria-hidden=\"true\" class=\"icon\"></i></div> <p class=\"serv-box-ttl\">\r\nExpert Training\r\n</p> <div class=\"serv-box-desc\">\r\nAccelerate your learning process of new technologies and get trained by experts.\r\n</div> <p>\r\nRead More\r\n<i aria-hidden=\"true\" class=\"fa fa-chevron-right\"></i></p></a></div> <div class=\"serv-box tw-flex tw-flex-col tw-justify-center tw-text-center div-government\"><a href=\"./services/government\" class=\"hover:tw-no-underline\"><div class=\"serv-ico ico-dev tw-flex\"><i aria-hidden=\"true\" class=\"icon\"></i></div> <p class=\"serv-box-ttl\">Government</p> <div class=\"serv-box-desc\">\r\nWe are skilled, experienced and ready to Serve!\r\n</div> <p>\r\nRead More\r\n<i aria-hidden=\"true\" class=\"fa fa-chevron-right\"></i></p></a></div></div></div>','',2,0,'2c9480838309dc9c018309dfb3be0092','2c94808384e113b20184e48d35dd0007'),
	('2c94808384e113b20184ea12cfc0001d','2022-12-07 00:53:32','2022-12-07 00:53:32',0,'<div class=\"services\">\r\n	<div class=\"card\">\r\n		<h2>Support &amp; Consulting</h2>\r\n		<p>Get help when needed.</p>\r\n		<a href=\"#\">Read More</a>\r\n	</div>\r\n	\r\n	<div class=\"card\">\r\n		<h2>Custom Web Development</h2>\r\n		<p>Let us help you with your next project.</p>\r\n		<a href=\"#\">Read More</a>\r\n	</div>\r\n	\r\n	<div class=\"card\">\r\n		<h2>UX/UI Design</h2>\r\n		<p>Implement web design carefully crafted to meet your user needs.</p>\r\n		<a href=\"#\">Read More</a>\r\n	</div>\r\n	\r\n	<div class=\"card\">\r\n		<h2>Mobile App</h2>\r\n		<p>Create fully-responsive websites, progressive apps and hybrid mobile apps.</p>\r\n		<a href=\"#\">Read More</a>\r\n	</div>\r\n	<div class=\"card\">\r\n		<h2>Legacy Migration</h2>\r\n		<p>Modernize your code, infrastructure and code deployment pipeline.</p>\r\n		<a href=\"#\">Read More</a>\r\n	</div>\r\n	<div class=\"card\">\r\n		<h2>Quality Assurance</h2>\r\n		<p>Modernize your code, infrastructure and code deployment pipeline.</p>\r\n		<a href=\"#\">Read More</a>\r\n	</div>\r\n</div>\r\n','',3,1,'2c9480838309dc9c018309dfb3be0092','2c94808384e113b20184e48d35dd0007'),
	('2c94808384e113b20184eaa9cc6b001f','2022-12-07 03:38:27','2022-12-07 03:39:25',0,'<p>Ortus Solutions is a minority-owned Christian business founded by Luis Majano in 2006 with the vision of empowering developers with great open source tools and empowering clients with scalable and robust applications. We have a proven track record of successful web application development from small scale to mission critical applications, software architecture, website design, training and support services.</p>\r\n\r\n<p>We know how difficult it is to do everything all by yourself therefore we are here to help you out. Our focus is to make your business more efficient without having to pay high consulting rates which leaves you wanting more. We are at our core, developers who know the value of time and money and we have seen firsthand how our products and services can help you save those two invaluable things.</p>\r\n\r\n<h2>Revolutionaries needed!</h2>\r\n<p>We build open source projects for the ColdFusion (CFML) community such as ColdBox, CommandBox, ContentBox.</p>\r\n\r\n<p>Are you looking for freedom from the same boring 9-5 job? Freedom to work with inspiration, creativity, purpose and a team of very motivated and passionate individuals? If so, then we’re looking for you!</p>','',4,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c018309dfc80400e9'),
	('2c94808384e113b20184eaaaab3f0020','2022-12-07 03:39:24','2022-12-07 03:42:23',0,'<p>Ortus Solutions is a minority-owned Christian business founded by Luis Majano in 2006 with the vision of empowering developers with great open source tools and empowering clients with scalable and robust applications. We have a proven track record of successful web application development from small scale to mission critical applications, software architecture, website design, training and support services.</p><br/><br/>\r\n\r\n<p>We know how difficult it is to do everything all by yourself therefore we are here to help you out. Our focus is to make your business more efficient without having to pay high consulting rates which leaves you wanting more. We are at our core, developers who know the value of time and money and we have seen firsthand how our products and services can help you save those two invaluable things.</p><br/><br/>\r\n\r\n<h2>Revolutionaries needed!</h2>\r\n<p>We build open source projects for the ColdFusion (CFML) community such as ColdBox, CommandBox, ContentBox.</p>\r\n<br/><br/>\r\n<p>Are you looking for freedom from the same boring 9-5 job? Freedom to work with inspiration, creativity, purpose and a team of very motivated and passionate individuals? If so, then we’re looking for you!</p>','',5,0,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c018309dfc80400e9'),
	('2c94808384e113b20184eaad62b60021','2022-12-07 03:42:22','2022-12-07 03:42:22',0,'<h2>Get to know us</h2>\r\n\r\n<p>Ortus Solutions is a minority-owned Christian business founded by Luis Majano in 2006 with the vision of empowering developers with great open source tools and empowering clients with scalable and robust applications. We have a proven track record of successful web application development from small scale to mission critical applications, software architecture, website design, training and support services.</p><br/><br/>\r\n\r\n<p>We know how difficult it is to do everything all by yourself therefore we are here to help you out. Our focus is to make your business more efficient without having to pay high consulting rates which leaves you wanting more. We are at our core, developers who know the value of time and money and we have seen firsthand how our products and services can help you save those two invaluable things.</p><br/><br/>\r\n\r\n<h2>Revolutionaries needed!</h2>\r\n<p>We build open source projects for the ColdFusion (CFML) community such as ColdBox, CommandBox, ContentBox.</p>\r\n<br/><br/>\r\n<p>Are you looking for freedom from the same boring 9-5 job? Freedom to work with inspiration, creativity, purpose and a team of very motivated and passionate individuals? If so, then we’re looking for you!</p>','',6,1,'2c9480838309dc9c018309dfb3be0092','2c9480838309dc9c018309dfc80400e9'),
	('2c9480838bc85d85018bc85f578a0002','2023-11-13 11:09:34','2023-11-13 11:21:21',0,'<h1>Discover the power of a <span>Headless CMS (HCMS)</span></h1>\r\n','',19,0,'2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838309dc9c01830cc8468c013d'),
	('2c9480838bc85d85018bc86a21370005','2023-11-13 11:21:20','2023-11-13 11:22:09',0,'<h1>Wey Wey Web</h1>\r\n<h1>Discover the power of a <span>Headless CMS (HCMS)</span></h1>\r\n','',20,0,'2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838309dc9c01830cc8468c013d'),
	('2c9480838bc85d85018bc86ae0240008','2023-11-13 11:22:09','2023-11-13 12:20:37',0,'<h1><img alt=\"Weyweyweb logo\" src=\"https://pub-8af9b25226f545c8ba0eec15e6ac4d4d.r2.dev/logo_www_dark.webp\" /></h1>\r\n\r\n<h1>Discover the power of a <span>Headless CMS (HCMS)</span></h1>\r\n','',21,0,'2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838309dc9c01830cc8468c013d'),
	('2c9480838bc85d85018bc88a12a2000a','2023-11-13 11:56:14','2023-11-13 12:02:21',0,'<div class=\"row\">\r\n<div class=\"col\"><img alt=\"\" src=\"/__media/sites/default/luis-majano-bio.jpeg\" /></div>\r\n\r\n<div class=\"col\">\r\n<h2>Luis Majano</h2>\r\n\r\n<ul>\r\n	<li>Computer Engineer</li>\r\n	<li>Salvadorean Born</li>\r\n	<li>Imported to the USA in 2009</li>\r\n	<li>On-loan to Spain!</li>\r\n</ul>\r\n</div>\r\n</div>\r\n','',10,0,'2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838309dc9c01830ccb4a9f0140'),
	('2c9480838bc85d85018bc88faac2000c','2023-11-13 12:02:21','2023-11-13 12:06:16',0,'<div class=\"row\">\r\n<div class=\"col\"><img alt=\"\" src=\"/__media/sites/default/luis-majano-bio.jpeg\" /></div>\r\n\r\n<div class=\"col\">\r\n<h2>Luis Majano</h2>\r\n\r\n<ul>\r\n	<li>Computer Engineer</li>\r\n	<li>Salvadorean Born</li>\r\n	<li>Gringo since&nbsp;2009</li>\r\n	<li>On-loan to Spain!</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img src=\"data:image/png;base64,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\" /></p>\r\n</div>\r\n</div>\r\n','',11,0,'2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838309dc9c01830ccb4a9f0140'),
	('2c9480838bc85d85018bc89341bf000e','2023-11-13 12:06:16','2023-11-13 12:06:16',0,'<div class=\"row\">\r\n<div class=\"col\"><img alt=\"\" src=\"/__media/sites/default/luis-majano-bio.jpeg\" /></div>\r\n\r\n<div class=\"col\">\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Computer Engineer</li>\r\n	<li>Salvadorean Born</li>\r\n	<li>Gringo since&nbsp;2009</li>\r\n	<li>On-loan to Spain!</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img src=\"data:image/png;base64,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\" /></p>\r\n</div>\r\n</div>\r\n','',12,1,'2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838309dc9c01830ccb4a9f0140'),
	('2c9480838bc85d85018bc8a066c50011','2023-11-13 12:20:37','2023-11-13 12:20:37',0,'<h1>\r\n<img alt=\"Weyweyweb logo\" src=\"https://pub-8af9b25226f545c8ba0eec15e6ac4d4d.r2.dev/logo_www_dark.webp\" />\r\n</h1>\r\n\r\n<h1>Discover the power of a <span>Headless CMS (HCMS)</span></h1>\r\n','',22,1,'2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838309dc9c01830cc8468c013d'),
	('2c9480838bc85d85018bc9528f380013','2023-11-13 15:35:13','2023-11-13 15:35:45',0,'<h2>What is a Headless CMS?</h2>\r\n\r\n<p>A content management system that is decoupled from the presentation layer.</p>\r\n','',11,0,'2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838309dc9c01830cd4eeac0143'),
	('2c9480838bc85d85018bc9530bb90015','2023-11-13 15:35:45','2023-11-13 15:38:40',0,'<h2>What is a Headless CMS?</h2>\r\n\r\n<p>A content management system that is decoupled from the presentation layer.</p>\r\n','',12,0,'2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838309dc9c01830cd4eeac0143'),
	('2c9480838bc85d85018bc955b79c0017','2023-11-13 15:38:40','2023-11-13 15:38:40',0,'<h2>What is a Headless CMS?</h2>\r\n\r\n<p>Wait, but what is a traditional CMS?</p>\r\n','',13,1,'2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838309dc9c01830cd4eeac0143'),
	('2c9480838bc85d85018bc96696ae0021','2023-11-13 15:57:06','2023-11-13 15:58:23',0,'<img src=\"/__media/sites/default/traditional-cms.png\" >\r\n\r\n<h2>\r\nWhat is a Traditional CMS?\r\n</h2>\r\n\r\n<p>\r\n* Content Management System\r\n* Includes the presentation layer\r\n* Includes the admin layer (backend)\r\n* Both tightly coupled\r\n* One-to-one \r\n</p>\r\n','',1,0,'2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838bc85d85018bc96696ad001f'),
	('2c9480838bc85d85018bc967c5830023','2023-11-13 15:58:23','2023-11-13 15:58:56',0,'<h2>\r\nWhat is a Traditional CMS?\r\n<img src=\"/__media/sites/default/traditional-cms.png\" >\r\n</h2>\r\n\r\n<p>\r\n* Content Management System\r\n* Includes the presentation layer\r\n* Includes the admin layer (backend)\r\n* Both tightly coupled\r\n* One-to-one \r\n</p>\r\n','',2,0,'2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838bc85d85018bc96696ad001f'),
	('2c9480838bc85d85018bc96845a40024','2023-11-13 15:58:56','2023-11-13 15:59:54',0,'<h2>\r\nWhat is a Traditional CMS?\r\n<img src=\"/__media/sites/default/traditional-cms.png\" >\r\n</h2>\r\n\r\n<p>\r\n* Content Management System\r\n* Includes the presentation layer\r\n* Includes the admin layer (backend)\r\n* Both tightly coupled\r\n* One-to-one \r\n</p>\r\n','',3,0,'2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838bc85d85018bc96696ad001f'),
	('2c9480838bc85d85018bc969290d0025','2023-11-13 15:59:54','2023-11-13 16:00:34',0,'<h2>\r\nWhat is a Traditional CMS?\r\n<img src=\"/__media/sites/default/traditional-cms.png\" >\r\n</h2>\r\n\r\n<div>\r\n* Content Management System\r\n* Includes the presentation layer\r\n* Includes the admin layer (backend)\r\n* Both tightly coupled\r\n* One-to-one \r\n</div>\r\n','',4,0,'2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838bc85d85018bc96696ad001f'),
	('2c9480838bc85d85018bc969c5c50026','2023-11-13 16:00:34','2023-11-13 16:03:42',0,'<h2>\r\nWhat is a Traditional CMS?\r\n</h2>\r\n\r\n<div>\r\n\r\n<img src=\"/__media/sites/default/traditional-cms.png\" width=\"50%\">\r\n\r\n* Content Management System\r\n* Includes the presentation layer\r\n* Includes the admin layer (backend)\r\n* Both tightly coupled\r\n* One-to-one \r\n* \r\n</div>\r\n','',5,0,'2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838bc85d85018bc96696ad001f'),
	('2c9480838bc85d85018bc96ca4750027','2023-11-13 16:03:42','2023-11-13 16:05:35',0,'<h2>\r\nWhat is a Traditional CMS?\r\n<img src=\"/__media/sites/default/traditional-cms.png\" width=\"50%\">\r\n</h2>\r\n\r\n<div class=\"row\">\r\n	<div class=\"col\">\r\n		* Content Management System\r\n		* Includes the presentation layer\r\n		* Includes the admin layer (backend)\r\n		* Both tightly coupled\r\n		* One-to-one \r\n	</div>\r\n</div>\r\n','',6,0,'2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838bc85d85018bc96696ad001f'),
	('2c9480838bc85d85018bc96e5bdd0028','2023-11-13 16:05:35','2023-11-13 16:07:49',0,'<h2>\r\nWhat is a Traditional CMS?\r\n	<div>\r\n		<img src=\"/__media/sites/default/traditional-cms.png\" width=\"50%\">\r\n	</div>\r\n</h2>\r\n\r\n<div class=\"row\">\r\n	<div class=\"col\">\r\n* Content Management System\r\n* Includes the presentation layer\r\n* Includes the admin layer (backend)\r\n* Both tightly coupled\r\n* One-to-one \r\n	</div>\r\n</div>\r\n','',7,0,'2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838bc85d85018bc96696ad001f'),
	('2c9480838bc85d85018bc97068f20029','2023-11-13 16:07:49','2023-11-13 16:08:54',0,'<h2>\r\nWhat is a Traditional CMS?\r\n	<div>\r\n		<img \r\n			src=\"/__media/sites/default/traditional-cms.png\" \r\n			width=\"35%\"\r\n		>\r\n	</div>\r\n</h2>\r\n\r\n<div class=\"row\">\r\n	<div class=\"col\">\r\n	\r\n* Content Management System\r\n* Includes the presentation layer\r\n* Includes the admin layer (backend)\r\n* Both tightly coupled\r\n* One-to-one \r\n\r\n	</div>\r\n</div>\r\n','',8,0,'2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838bc85d85018bc96696ad001f'),
	('2c9480838bc85d85018bc9716616002a','2023-11-13 16:08:54','2023-11-13 16:09:31',0,'<h2>\r\nWhat is a Traditional CMS?\r\n	<div>\r\n		<img \r\n			src=\"/__media/sites/default/traditional-cms.png\" \r\n			width=\"60%\"\r\n		>\r\n	</div>\r\n</h2>\r\n\r\n<div class=\"row\">\r\n	<div class=\"col\">\r\n	\r\n* Content Management System\r\n* Includes the presentation layer\r\n* Includes the admin layer (backend)\r\n* Both tightly coupled\r\n* One-to-one \r\n\r\n	</div>\r\n</div>\r\n','',9,0,'2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838bc85d85018bc96696ad001f'),
	('2c9480838bc85d85018bc971f6df002b','2023-11-13 16:09:31','2023-11-13 16:12:44',0,'<h2>\r\nWhat is a Traditional CMS?\r\n	<div>\r\n		<img \r\n			src=\"/__media/sites/default/traditional-cms.png\" \r\n			width=\"60%\"\r\n		>\r\n	</div>\r\n</h2>\r\n\r\n<div class=\"row\">\r\n	<div class=\"col\">\r\n	\r\n* Usually Monolithic\r\n* Includes the presentation layer\r\n* Includes the admin layer (backend)\r\n* Both tightly coupled\r\n* One-to-one \r\n\r\n	</div>\r\n</div>\r\n','',10,0,'2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838bc85d85018bc96696ad001f'),
	('2c9480838bc85d85018bc974e817002c','2023-11-13 16:12:44','2023-11-13 16:12:44',0,'<h2>\r\nWhat is a Traditional CMS?\r\n	<div>\r\n		<img \r\n			src=\"/__media/sites/default/traditional-cms.png\" \r\n			width=\"60%\"\r\n		>\r\n	</div>\r\n</h2>\r\n\r\n<div class=\"row\">\r\n	<div class=\"col\">\r\n	\r\n* Usually Monolithic\r\n* Includes the presentation layer\r\n* Includes the admin layer (backend)\r\n* Both tightly coupled\r\n* <code>one-to-one </code> reach\r\n\r\n	</div>\r\n</div>\r\n','',11,1,'2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838bc85d85018bc96696ad001f'),
	('2c9480838bc85d85018bc97bbf28002f','2023-11-13 16:20:12','2023-11-13 16:20:34',0,'<h2>\r\n	What is a Headless CMS?\r\n	<div>\r\n		<img src=\"/__media/sites/default/headless-cms.png\">\r\n	</div>\r\n</h2>\r\n\r\n<div class=\"row\">\r\n<div class=\"col\">\r\n\r\n* Separation of Concerns\r\n* Admin layer : Content Repository\r\n* UI Layer : In any UI technology\r\n* <code>One-To-Many</code> Reach\r\n* Deployed together or separate\r\n\r\n</div>\r\n</div>\r\n','',1,0,'2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838bc85d85018bc97bbf27002d'),
	('2c9480838bc85d85018bc97c146f0031','2023-11-13 16:20:34','2023-11-13 16:21:57',0,'<h2>\r\n	What is a Headless CMS?\r\n	<div>\r\n		<img src=\"/__media/sites/default/headless-cms.png\">\r\n	</div>\r\n</h2>\r\n\r\n<div class=\"row\">\r\n<div class=\"col\">\r\n\r\n* Separation of Concerns\r\n* Admin layer : Content Repository\r\n* UI Layer : In any UI technology\r\n* <code>One-To-Many</code> Reach\r\n* Deployed together or separate\r\n\r\n</div>\r\n</div>\r\n','',2,0,'2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838bc85d85018bc97bbf27002d'),
	('2c9480838bc85d85018bc97d568c0033','2023-11-13 16:21:57','2023-11-13 16:21:57',0,'<h2>\r\n	What is a Headless CMS?\r\n	<div>\r\n		<img src=\"/__media/sites/default/headless-cms.png\" width=\"40%\">\r\n	</div>\r\n</h2>\r\n\r\n<div class=\"row\">\r\n	<div class=\"col\">\r\n\r\n* Separation of Concerns\r\n* Admin layer : Content Repository\r\n* UI Layer : In any UI technology\r\n* <code>One-To-Many</code> Reach\r\n* Deployed together or separate\r\n\r\n	</div>\r\n</div>\r\n','',3,1,'2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838bc85d85018bc97bbf27002d'),
	('2c9480838bc85d85018bc9865e670036','2023-11-13 16:31:48','2023-11-13 16:32:26',0,'<h2>\r\nForms of Communication\r\n</h2>\r\n\r\n<div class=\"row\">\r\n<div class=\"col\">\r\n\r\n* API Calls\r\n* Usually REST or GraphQL\r\n* Literally ANYBODY/ANYTHING can be a client\r\n* You have the power!\r\n\r\n</div>\r\n</div>','',1,0,'2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838bc85d85018bc9865e660034'),
	('2c9480838bc85d85018bc986f2600038','2023-11-13 16:32:26','2023-11-13 16:36:13',0,'<h2>\r\nForms of Communication\r\n</h2>\r\n\r\n<div class=\"row\">\r\n<div class=\"col\">\r\n\r\n* API Calls\r\n* Usually REST or GraphQL\r\n* Literally ANYBODY/ANYTHING can be a client\r\n* You have the power!\r\n\r\n</div>\r\n</div>','',2,0,'2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838bc85d85018bc9865e660034'),
	('2c9480838bc85d85018bc98a6642003a','2023-11-13 16:36:13','2023-11-13 21:43:36',0,'<h2>\r\nForms of Communication\r\n</h2>\r\n\r\n<div class=\"row\">\r\n<div class=\"col\">\r\n\r\n* API Calls\r\n* Usually REST or GraphQL\r\n* Literally ANYBODY/ANYTHING can be a client\r\n* You have the power!\r\n\r\n</div>\r\n</div>','',3,0,'2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838bc85d85018bc9865e660034'),
	('2c9480838bca8a35018bca968ed80002','2023-11-13 21:29:07','2023-11-13 21:29:07',0,'<p>These are the presentation slides.</p>\r\n','',2,1,'2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838309dc9c01830cc4b42f013b'),
	('2c9480838bca8a35018bca9961f40004','2023-11-13 21:32:12','2023-11-13 21:32:12',0,'<h2>Headless CMS Advantages</h2>\r\n\r\n* Content Centralization & Reuse\r\n* Omnichannel Publishing\r\n* Scalability & Performance\r\n* Developer Flexibility & Freedom\r\n* Improved Security\r\n* Native Content Store\r\n','',4,1,'2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838309dc9c01831b144f3d01c9'),
	('2c9480838bca8a35018bca9b18600006','2023-11-13 21:34:04','2023-11-13 21:34:04',0,'## Content Centralization & Reuse\r\n\r\n* One way/system/workflow to manage content\r\n* Reuse content\r\n* Create a CDN\r\n* Conistency\r\n* Focus\r\n* No more <code>rogue</code> Wordpress sites','',6,1,'2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838309dc9c0183147a2be70198'),
	('2c9480838bca8a35018bca9d2c190009','2023-11-13 21:36:20','2023-11-13 21:36:20',0,'## Omnichannel Publishing\r\n\r\n- You are <code>FREE!</code>\r\n- Content can be delivered to any device or platform via APIs\r\n- You can control the publishing delivery or expiration\r\n- You can monetize your content\r\n- Target multiple devices\r\n  - Websites\r\n  - Partners\r\n  - Mobile Apps\r\n  - Digital Displays\r\n  - Social Media','',1,1,'2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838bca8a35018bca9d2c180007'),
	('2c9480838bca8a35018bca9eccd1000c','2023-11-13 21:38:07','2023-11-13 21:41:08',0,'## Scalability and Performance\r\n\r\n- Separation allows you to scale UI / Backend separately\r\n- Leverage microservices and containers\r\n- Geo locate your UI or Backend\r\n- Add different caching strategies','',1,0,'2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838bca8a35018bca9eccd0000a'),
	('2c9480838bca8a35018bcaa0053b000f','2023-11-13 21:39:27','2023-11-13 21:41:12',0,'## Developer Flexibility & Freedom\r\n\r\n- Leverage any front-end technology to deliver your content\r\n- AB Testing\r\n- Try new technologies for delivery\r\n- Integrate your content with ANY system that can talk to APIs\r\n- Increase Developer / Designer Happiness!','',1,0,'2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838bca8a35018bcaa0053a000d'),
	('2c9480838bca8a35018bcaa0bcef0011','2023-11-13 21:40:14','2023-11-13 21:40:14',0,'## Improved Security\r\n\r\n- UI can be static\r\n- No admin to attack\r\n- Check your logs, you will be suprised what you see\r\n- Admin can be deployed securely\r\n- Separation of Concerns','',1,1,'2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838bca8a35018bcaa0bcee0010'),
	('2c9480838bca8a35018bcaa16e020013','2023-11-13 21:40:59','2023-11-13 21:42:59',0,'## Content Store\r\n\r\n- More than pages and a blog or an API for pages and a blog\r\n- A structured content that can literally represent anything\r\n  - Pages\r\n  - Blogs\r\n  - Movies\r\n  - Events \r\n  - Slides\r\n- Addressable via a unique slug\r\n- Can be hierarchical\r\n- Can have attached metadata (custom fields) \r\n- Can have published / expiration dates\r\n- Much more\r\n- Cornerstone of a HCMS, all addressable via the API','',1,0,'2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838bca8a35018bcaa16e020012'),
	('2c9480838bca8a35018bcaa190e70015','2023-11-13 21:41:08','2023-11-13 21:41:08',0,'## Scalability and Performance\r\n\r\n- Separation allows you to scale UI / Backend separately\r\n- Leverage microservices and containers\r\n- Geo locate your UI or Backend\r\n- Add different caching strategies','',2,1,'2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838bca8a35018bca9eccd0000a'),
	('2c9480838bca8a35018bcaa1a0200017','2023-11-13 21:41:12','2023-11-13 21:41:12',0,'## Developer Flexibility & Freedom\r\n\r\n- Leverage any front-end technology to deliver your content\r\n- AB Testing\r\n- Try new technologies for delivery\r\n- Integrate your content with ANY system that can talk to APIs\r\n- Increase Developer / Designer Happiness!','',2,1,'2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838bca8a35018bcaa0053a000d'),
	('2c9480838bca8a35018bcaa2ab0c0019','2023-11-13 21:42:20','2023-11-13 21:42:20',0,'## How do I chose one?\r\n\r\n- There are 10000s of CMS out there\r\n- All claiming to be the best\r\n- Some are, some are not\r\n- Test them, to see what fits your needs best\r\n- All are unique and have key benefits\r\n- Make sure they address the benefits we saw\r\n- Make sure they have a real content store\r\n- I am biased; **ContentBox HCMS**','',1,1,'2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838bca8a35018bcaa2ab0c0018'),
	('2c9480838bca8a35018bcaa34134001a','2023-11-13 21:42:59','2023-11-13 21:42:59',0,'## Content Store\r\n\r\n- More than pages and a blog or an API for pages and a blog\r\n- A structured content that can literally represent anything\r\n  - Pages\r\n  - Blogs\r\n  - Movies\r\n  - Events \r\n  - Slides\r\n- Addressable via a unique slug\r\n- Can be hierarchical\r\n- Can have attached metadata (custom fields) \r\n- Can have published / expiration dates\r\n- Much more\r\n- Cornerstone of a HCMS, all addressable via the API\r\n\r\n<div class=\"col\">\r\n		<img src=\"http://127.0.0.1:61670/__media/sites/default/screenshot-contentstore.png\"/>\r\n</div>','',2,1,'2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838bca8a35018bcaa16e020012'),
	('2c9480838bca8a35018bcaa3d14e001c','2023-11-13 21:43:36','2023-11-13 21:43:36',0,'<h2>\r\nForms of Communication\r\n</h2>\r\n\r\n<div class=\"row\">\r\n<div class=\"col\">\r\n\r\n* API Calls\r\n* Usually REST or GraphQL\r\n* Literally ANYBODY/ANYTHING can be a client\r\n* You have the power!\r\n\r\n</div>\r\n\r\n<div class=\"col\">\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/screenshot-headless-cb.png\"/>\r\n</div>\r\n</div>','',4,1,'2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838bc85d85018bc9865e660034'),
	('2c9480838bca8a35018bcaa4ab81001e','2023-11-13 21:44:32','2023-11-13 21:44:32',0,'## I have a secret to tell?\r\n\r\n- This entire presentation is built with a HCMS\r\n- This is a Vue.js app connected to ContentBox\r\n- So let\'s explore it!','',1,1,'2c9480838bb8cfb2018bb8d8e7b000cf','2c9480838bca8a35018bcaa4ab80001d'),
	('2c9580838811b6930188126d88e70004','2023-05-13 00:05:48','2023-05-13 00:05:48',0,'Headless ContentBox in 100 Minutes','',1,1,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126d88e60003'),
	('2c9580838811b6930188126f67220008','2023-05-13 00:07:51','2023-05-13 00:08:24',0,'<h1>Off with their heads <span>ContentBox 5 : Headless CMS</span></h1>\r\n','Content Cloned!',1,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b6930188126fe82e000b','2023-05-13 00:08:24','2023-05-13 00:08:37',0,'<h1>Off with their heads <span>ContentBox 5 : Headless CMS</span></h1>\r\n','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b693018812701cad000e','2023-05-13 00:08:37','2023-05-13 00:08:51',0,'<h1>Off with their heads <span>ContentBox 5 : Headless CMS</span></h1>\r\n','',3,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b6930188127050b80011','2023-05-13 00:08:51','2023-05-13 00:10:16',0,'<h1>Off with their heads <span>ContentBox 5 : Headless CMS</span></h1>\r\n','',4,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b693018812719d530014','2023-05-13 00:10:16','2023-05-13 18:58:26',0,'<h1>ContentBox Headless CMS  <span>in 100 minutes</span></h1>\r\n','',5,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b69301881271d1c70017','2023-05-13 00:10:29','2023-05-13 00:10:43',0,'<div class=\"row\">\r\n	<div class=\"col\"><img src=\"http://127.0.0.1:61670/__media/sites/default/Eacevedo.png\" /></div>\r\n	<div class=\"col\"><img src=\"http://127.0.0.1:61670/__media//sites/default/Jquintero.png\" /></div>\r\n</div>\r\n<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2>Esmeralda Acevedo</h2>\r\n		<p>Senior Software Developer</p>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2>Javier Quintero</h2>\r\n		<p> Software Developer</p>\r\n	</div>\r\n</div>\r\n\r\n','Content Cloned!',1,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b69301881271d1c60015'),
	('2c9580838811b69301881272081b0019','2023-05-13 00:10:43','2023-05-14 00:57:06',0,'<div class=\"row\">\r\n	<div class=\"col\"><img src=\"http://127.0.0.1:61670/__media/sites/default/Eacevedo.png\" /></div>\r\n	<div class=\"col\"><img src=\"http://127.0.0.1:61670/__media//sites/default/Jquintero.png\" /></div>\r\n</div>\r\n<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2>Esmeralda Acevedo</h2>\r\n		<p>Senior Software Developer</p>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2>Javier Quintero</h2>\r\n		<p> Software Developer</p>\r\n	</div>\r\n</div>\r\n\r\n','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b69301881271d1c60015'),
	('2c9580838811b6930188167a7c2c001e','2023-05-13 18:58:26','2023-05-13 20:04:28',0,'<h1>ContentBox Headless CMS  <span>in 100 minutes</span></h1>\r\n','',6,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b693018816b6f0570021','2023-05-13 20:04:28','2023-05-13 20:07:41',0,'<h1><span class=\"title-label\">Hands-On</span> ContentBox Headless CMS  <span>in 100 minutes</span></h1>\r\n<div class=\"slide-footer\">\r\n<p>LED BY</p>\r\n	<ul>\r\n		<li>Esmeralda Acevedo</li>\r\n		<li>Javier Quintero</li>\r\n	</ul>\r\n	![](/_content/sites/default/sponsor-logos/sponsors-main.png)\r\n</div>','',7,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b693018816b9e4380024','2023-05-13 20:07:41','2023-05-13 20:08:40',0,'<h1><span class=\"title-label\">Hands-On</span> ContentBox Headless CMS  <span>in 100 minutes</span></h1>\r\n<div class=\"slide-footer\">\r\n<p>LED BY</p>\r\n	<ul>\r\n		<li>Esmeralda Acevedo</li>\r\n		<li>Javier Quintero</li>\r\n	</ul>\r\n	<img src\"http://127.0.0.1:61670/__media/sites/default/default/sponsor-logos/sponsors-main.png\" alt=\"Sponsored by Ortus Solutions and Adobe\">\r\n</div>','',8,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b693018816baca350027','2023-05-13 20:08:40','2023-05-13 20:09:14',0,'<h1><span class=\"title-label\">Hands-On</span> ContentBox Headless CMS  <span>in 100 minutes</span></h1>\r\n<div class=\"slide-footer\">\r\n<p>LED BY</p>\r\n	<ul>\r\n		<li>Esmeralda Acevedo</li>\r\n		<li>Javier Quintero</li>\r\n	</ul>\r\n	<img src=\"http://127.0.0.1:61670/__media/sites/default/default/sponsor-logos/sponsors-main.png\" alt=\"Sponsored by Ortus Solutions and Adobe\">\r\n</div>','',9,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b693018816bb4c00002a','2023-05-13 20:09:13','2023-05-13 20:34:01',0,'<h1><span class=\"title-label\">Hands-On</span> ContentBox Headless CMS  <span>in 100 minutes</span></h1>\r\n<div class=\"slide-footer\">\r\n<p>LED BY</p>\r\n	<ul>\r\n		<li>Esmeralda Acevedo</li>\r\n		<li>Javier Quintero</li>\r\n	</ul>\r\n	<img src=\"http://127.0.0.1:61670/__media/sites/default/sponsor-logos/sponsors-main.png\" alt=\"Sponsored by Ortus Solutions and Adobe\">\r\n</div>','',10,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b693018816d1ff59002d','2023-05-13 20:34:01','2023-05-13 21:31:39',0,'<h1><span class=\"title-label\">Hands-On</span> CONTENTBOX HEADLESS CMS  <span>in 100 minutes</span></h1>\r\n<div class=\"slide-footer\">\r\n<p>LED BY</p>\r\n	<ul>\r\n		<li>Esmeralda Acevedo</li>\r\n		<li>Javier Quintero</li>\r\n	</ul>\r\n	<img src=\"http://127.0.0.1:61670/__media/sites/default/sponsor-logos/sponsors-main.png\" alt=\"Sponsored by Ortus Solutions and Adobe\">\r\n</div>','',11,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b69301881706c0d30030','2023-05-13 21:31:39','2023-05-13 21:33:43',0,'<h1><span class=\"title-label\">Hands-On</span> CONTENTBOX HEADLESS CMS  <span>in 100 minutes</span></h1>\r\n<div class=\"slide-footer\">\r\n<p>LED BY\r\n	<ul>\r\n		<li>Esmeralda Acevedo</li>\r\n		<li>Javier Quintero</li>\r\n	</ul>\r\n</p>\r\n	<img src=\"http://127.0.0.1:61670/__media/sites/default/sponsor-logos/sponsors-main.png\" alt=\"Sponsored by Ortus Solutions and Adobe\">\r\n</div>','',12,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b69301881708a5980033','2023-05-13 21:33:43','2023-05-13 22:38:11',0,'<h1><span class=\"title-label\">Hands-On</span> CONTENTBOX HEADLESS CMS  <span>in 100 minutes</span></h1>\r\n<div class=\"slide-footer\">\r\n<span>LED BY<span>\r\n	<ul>\r\n		<li>Esmeralda Acevedo</li>\r\n		<li>Javier Quintero</li>\r\n	</ul>\r\n\r\n	<img src=\"http://127.0.0.1:61670/__media/sites/default/sponsor-logos/sponsors-main.png\" alt=\"Sponsored by Ortus Solutions and Adobe\">\r\n</div>','',13,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b69301881743ac6c0036','2023-05-13 22:38:11','2023-05-13 22:40:09',0,'<h1><span class=\"title-label\">Hands-On</span> CONTENTBOX HEADLESS CMS  <span>in 100 minutes</span></h1>\r\n<div class=\"slide-footer\">\r\n<span>LED BY<span>\r\n	<ul>\r\n		<li>Esmeralda Acevedo</li>\r\n		<li>Javier Quintero</li>\r\n	</ul>\r\n	\r\n	<svg id=\"Layer_2\" data-name=\"Layer 2\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" viewBox=\"0 0 568.4 6.42\">\r\n	  <defs>\r\n		<linearGradient id=\"linear-gradient\" x1=\"0\" y1=\"3.21\" x2=\"568.4\" y2=\"3.21\" gradientUnits=\"userSpaceOnUse\">\r\n		  <stop offset=\"0\" stop-color=\"#74bf44\"/>\r\n		  <stop offset=\"1\" stop-color=\"#ccdc29\"/>\r\n		</linearGradient>\r\n	  </defs>\r\n	  <g id=\"Layer_1-2\" data-name=\"Layer 1\">\r\n		<rect fill=\"url(#linear-gradient)\" width=\"150%\" height=\"3.0\"/>\r\n	  </g>\r\n</svg>\r\n\r\n	<img src=\"http://127.0.0.1:61670/__media/sites/default/sponsor-logos/sponsors-main.png\" alt=\"Sponsored by Ortus Solutions and Adobe\">\r\n</div>','',14,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b693018817457a070039','2023-05-13 22:40:09','2023-05-13 22:55:02',0,'<h1><span class=\"title-label\">Hands-On</span> CONTENTBOX HEADLESS CMS  <span>in 100 minutes</span></h1>\r\n<div class=\"slide-footer\">\r\n<span>LED BY<span>\r\n	<ul>\r\n		<li>Esmeralda Acevedo</li>\r\n		<li>Javier Quintero</li>\r\n	</ul>\r\n	\r\n	<svg id=\"Layer_2\" data-name=\"Layer 2\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" viewBox=\"0 0 568.4 6.42\">\r\n	  <defs>\r\n		<linearGradient id=\"linear-gradient\" x1=\"0\" y1=\"3.21\" x2=\"568.4\" y2=\"3.21\" gradientUnits=\"userSpaceOnUse\">\r\n		  <stop offset=\"0\" stop-color=\"#74bf44\"/>\r\n		  <stop offset=\"1\" stop-color=\"#ccdc29\"/>\r\n		</linearGradient>\r\n	  </defs>\r\n	  <g id=\"Layer_1-2\" data-name=\"Layer 1\">\r\n		<rect fill=\"url(#linear-gradient)\" width=\"150%\" height=\"3.0\"/>\r\n	  </g>\r\n</svg>\r\n</br>\r\n	<img src=\"http://127.0.0.1:61670/__media/sites/default/sponsor-logos/sponsors-main.png\" alt=\"Sponsored by Ortus Solutions and Adobe\">\r\n</div>','',15,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b6930188175318c9003d','2023-05-13 22:55:02','2023-05-13 23:08:09',0,'<h1><span class=\"title-label\">Hands-On</span> CONTENTBOX HEADLESS CMS  <span>in 100 minutes</span></h1>\r\n<div class=\"slide-footer\">\r\n<span>LED BY<span>\r\n	<ul>\r\n		<li>Esmeralda Acevedo</li>\r\n		<li>Javier Quintero</li>\r\n	</ul>\r\n	\r\n	<svg id=\"Layer_2\" data-name=\"Layer 2\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" viewBox=\"0 0 568.4 6.42\">\r\n	  <defs>\r\n		<linearGradient id=\"linear-gradient\" x1=\"0\" y1=\"3.21\" x2=\"568.4\" y2=\"3.21\" gradientUnits=\"userSpaceOnUse\">\r\n		  <stop offset=\"0\" stop-color=\"#74bf44\"/>\r\n		  <stop offset=\"1\" stop-color=\"#ccdc29\"/>\r\n		</linearGradient>\r\n	  </defs>\r\n	  <g id=\"Layer_1-2\" data-name=\"Layer 1\">\r\n		<rect fill=\"url(#linear-gradient)\" width=\"150%\" height=\"3.0\"/>\r\n	  </g>\r\n</svg>\r\n</br>\r\n	<img src=\"http://127.0.0.1:61670/__media/sites/default/sponsor-logos/sponsors-main.png\" alt=\"Sponsored by Ortus Solutions and Adobe\">\r\n</div>','',16,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b6930188175f1a4c0041','2023-05-13 23:08:09','2023-05-13 23:08:27',0,'<h1><span class=\"title-label\">Hands-On</span> CONTENTBOX HEADLESS CMS  <span>in 100 minutes</span></h1>\r\n<div class=\"slide-footer\">\r\n<span>LED BY<span>\r\n	<ul>\r\n		<li>Esmeralda Acevedo</li>\r\n		<li>Javier Quintero</li>\r\n	</ul>\r\n	\r\n	<svg id=\"Layer_2\" data-name=\"Layer 2\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" viewBox=\"0 0 568.4 6.42\">\r\n	  <defs>\r\n		<linearGradient id=\"linear-gradient\" x1=\"0\" y1=\"3.21\" x2=\"568.4\" y2=\"3.21\" gradientUnits=\"userSpaceOnUse\">\r\n		  <stop offset=\"0\" stop-color=\"#74bf44\"/>\r\n		  <stop offset=\"1\" stop-color=\"#ccdc29\"/>\r\n		</linearGradient>\r\n	  </defs>\r\n	  <g id=\"Layer_1-2\" data-name=\"Layer 1\">\r\n		<rect fill=\"url(#linear-gradient)\" width=\"150%\" height=\"3.0\"/>\r\n	  </g>\r\n</svg>\r\n</br>\r\n	<img src=\"http://127.0.0.1:61670/__media/sites/default/sponsor-logos/sponsors-main.png\" alt=\"Sponsored by Ortus Solutions and Adobe\">\r\n</div>','',17,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b6930188175f60c30044','2023-05-13 23:08:27','2023-05-13 23:17:58',0,'<h1><span class=\"title-label\">Hands-On</span> CONTENTBOX HEADLESS CMS  <span>in 100 minutes</span></h1>\r\n<div class=\"slide-footer\">\r\n<span>LED BY<span>\r\n	<ul>\r\n		<li>Esmeralda Acevedo</li>\r\n		<li>Javier Quintero</li>\r\n	</ul>\r\n	\r\n	<svg id=\"Layer_2\" data-name=\"Layer 2\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" viewBox=\"0 0 568.4 6.42\">\r\n	  <defs>\r\n		<linearGradient id=\"linear-gradient\" x1=\"0\" y1=\"3.21\" x2=\"568.4\" y2=\"3.21\" gradientUnits=\"userSpaceOnUse\">\r\n		  <stop offset=\"0\" stop-color=\"#74bf44\"/>\r\n		  <stop offset=\"1\" stop-color=\"#ccdc29\"/>\r\n		</linearGradient>\r\n	  </defs>\r\n	  <g id=\"Layer_1-2\" data-name=\"Layer 1\">\r\n		<rect fill=\"url(#linear-gradient)\" width=\"150%\" height=\"3.0\"/>\r\n	  </g>\r\n</svg>\r\n</br>\r\n	<img src=\"http://127.0.0.1:61670/__media/sites/default/sponsor-logos/sponsors-main.png\" alt=\"Sponsored by Ortus Solutions and Adobe\">\r\n</div>','',18,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b69301881768191b0047','2023-05-13 23:17:58','2023-05-13 23:36:31',0,'<h1><span class=\"title-label\">Hands-On</span> CONTENTBOX HEADLESS CMS  <span>in 100 minutes</span></h1>\r\n<div class=\"slide-footer\">\r\n<span>LED BY<span>\r\n	<ul>\r\n		<li>Esmeralda Acevedo</li>\r\n		<li>Javier Quintero</li>\r\n	</ul>\r\n	\r\n	<svg id=\"Layer_2\" data-name=\"Layer 2\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" viewBox=\"0 0 568.4 6.42\">\r\n	  <defs>\r\n		<linearGradient id=\"linear-gradient\" x1=\"0\" y1=\"3.21\" x2=\"568.4\" y2=\"3.21\" gradientUnits=\"userSpaceOnUse\">\r\n		  <stop offset=\"0\" stop-color=\"#74bf44\"/>\r\n		  <stop offset=\"1\" stop-color=\"#ccdc29\"/>\r\n		</linearGradient>\r\n	  </defs>\r\n	  <g id=\"Layer_1-2\" data-name=\"Layer 1\">\r\n		<rect fill=\"url(#linear-gradient)\" width=\"150%\" height=\"3.0\"/>\r\n	  </g>\r\n</svg>\r\n</br>\r\n	<img src=\"http://127.0.0.1:61670/__media/sites/default/sponsor-logos/sponsors-main.png\" alt=\"Sponsored by Ortus Solutions and Adobe\">\r\n</div>','',19,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b6930188177915be004a','2023-05-13 23:36:31','2023-05-13 23:37:30',0,'<h1><span class=\"title-label\">Hands-On</span> CONTENTBOX HEADLESS CMS  <span>in 100 minutes</span></h1>\r\n<div class=\"slide-footer\">\r\n<span>LED BY<span>\r\n	<ul>\r\n		<li>Esmeralda Acevedo</li>\r\n		<li>Javier Quintero</li>\r\n	</ul>\r\n	\r\n	<svg id=\"Layer_2\" data-name=\"Layer 2\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" viewBox=\"0 0 568.4 6.42\">\r\n	  <defs>\r\n		<linearGradient id=\"linear-gradient\" x1=\"0\" y1=\"3.21\" x2=\"568.4\" y2=\"3.21\" gradientUnits=\"userSpaceOnUse\">\r\n		  <stop offset=\"0\" stop-color=\"#74bf44\"/>\r\n		  <stop offset=\"1\" stop-color=\"#ccdc29\"/>\r\n		</linearGradient>\r\n	  </defs>\r\n	  <g id=\"Layer_1-2\" data-name=\"Layer 1\">\r\n		<rect fill=\"url(#linear-gradient)\" width=\"150%\" height=\"3.0\"/>\r\n	  </g>\r\n</svg>\r\n</br>\r\n	<img src=\"http://127.0.0.1:61670/__media/sites/default/sponsor-logos/sponsors-main.png\" alt=\"Sponsored by Ortus Solutions and Adobe\">\r\n</div>','',20,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b69301881779fa8a004d','2023-05-13 23:37:30','2023-05-13 23:39:48',0,'<h1><span class=\"title-label\">Hands-On</span> CONTENTBOX HEADLESS CMS  <span>in 100 minutes</span></h1>\r\n<div class=\"slide-footer\">\r\n<span>LED BY<span>\r\n	<ul>\r\n		<li>Esmeralda Acevedo</li>\r\n		<li>Javier Quintero</li>\r\n	</ul>\r\n	\r\n	<svg id=\"Layer_2\" data-name=\"Layer 2\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" viewBox=\"0 0 568.4 6.42\">\r\n	  <defs>\r\n		<linearGradient id=\"linear-gradient\" x1=\"0\" y1=\"3.21\" x2=\"568.4\" y2=\"3.21\" gradientUnits=\"userSpaceOnUse\">\r\n		  <stop offset=\"0\" stop-color=\"#74bf44\"/>\r\n		  <stop offset=\"1\" stop-color=\"#ccdc29\"/>\r\n		</linearGradient>\r\n	  </defs>\r\n	  <g id=\"Layer_1-2\" data-name=\"Layer 1\">\r\n		<rect fill=\"url(#linear-gradient)\" width=\"150%\" height=\"3.0\"/>\r\n	  </g>\r\n</svg>\r\n</br>\r\n	<img src=\"http://127.0.0.1:61670/__media/sites/default/sponsor-logos/sponsors-main.png\" alt=\"Sponsored by Ortus Solutions and Adobe\">\r\n</div>','',21,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b6930188177c15b40050','2023-05-13 23:39:48','2023-05-13 23:41:09',0,'<h1><span class=\"title-label\">Hands-On</span> CONTENTBOX HEADLESS CMS  <span>in 100 minutes</span></h1>\r\n<div class=\"slide-footer\">\r\n<span>LED BY<span>\r\n	<ul>\r\n		<li>Esmeralda Acevedo</li>\r\n		<li>Javier Quintero</li>\r\n	</ul>\r\n	\r\n	<svg id=\"Layer_2\" data-name=\"Layer 2\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" viewBox=\"0 0 568.4 6.42\">\r\n	  <defs>\r\n		<linearGradient id=\"linear-gradient\" x1=\"0\" y1=\"3.21\" x2=\"568.4\" y2=\"3.21\" gradientUnits=\"userSpaceOnUse\">\r\n		  <stop offset=\"0\" stop-color=\"#74bf44\"/>\r\n		  <stop offset=\"1\" stop-color=\"#ccdc29\"/>\r\n		</linearGradient>\r\n	  </defs>\r\n	  <g id=\"Layer_1-2\" data-name=\"Layer 1\">\r\n		<rect fill=\"url(#linear-gradient)\" width=\"150%\" height=\"3.0\"/>\r\n	  </g>\r\n</svg>\r\n</br>\r\n	<img src=\"http://127.0.0.1:61670/__media/sites/default/sponsor-logos/sponsors-main.png\" alt=\"Sponsored by Ortus Solutions and Adobe\">\r\n</div>','',22,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b6930188177d50b00053','2023-05-13 23:41:09','2023-05-13 23:47:36',0,'<h1><span class=\"title-label\">Hands-On</span> CONTENTBOX HEADLESS CMS  <span>in 100 minutes</span></h1>\r\n<div class=\"slide-footer\">\r\n<span>LED BY<span>\r\n	<ul>\r\n		<li>Esmeralda Acevedo</li>\r\n		<li>Javier Quintero</li>\r\n	</ul>\r\n	\r\n	<svg id=\"Layer_2\" data-name=\"Layer 2\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" viewBox=\"0 0 568.4 6.42\">\r\n	  <defs>\r\n		<linearGradient id=\"linear-gradient\" x1=\"0\" y1=\"3.21\" x2=\"568.4\" y2=\"3.21\" gradientUnits=\"userSpaceOnUse\">\r\n		  <stop offset=\"0\" stop-color=\"#74bf44\"/>\r\n		  <stop offset=\"1\" stop-color=\"#ccdc29\"/>\r\n		</linearGradient>\r\n	  </defs>\r\n	  <g id=\"Layer_1-2\" data-name=\"Layer 1\">\r\n		<rect fill=\"url(#linear-gradient)\" width=\"150%\" height=\"3.0\"/>\r\n	  </g>\r\n</svg>\r\n</br>\r\n	<img src=\"http://127.0.0.1:61670/__media/sites/default/sponsor-logos/sponsors-main.png\" alt=\"Sponsored by Ortus Solutions and Adobe\">\r\n</div>','',23,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b6930188178338400056','2023-05-13 23:47:36','2023-05-13 23:48:54',0,'<h1><span class=\"title-label\">Hands-On</span> CONTENTBOX HEADLESS CMS  <span>in 100 minutes</span></h1>\r\n<div class=\"slide-footer\">\r\n<span>LED BY<span>\r\n	<ul>\r\n		<li>Esmeralda Acevedo</li>\r\n		<li>Javier Quintero</li>\r\n	</ul>\r\n	\r\n	<svg id=\"Layer_2\" data-name=\"Layer 2\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" viewBox=\"0 0 568.4 6.42\">\r\n	  <defs>\r\n		<linearGradient id=\"linear-gradient\" x1=\"0\" y1=\"3.21\" x2=\"568.4\" y2=\"3.21\" gradientUnits=\"userSpaceOnUse\">\r\n		  <stop offset=\"0\" stop-color=\"#74bf44\"/>\r\n		  <stop offset=\"1\" stop-color=\"#ccdc29\"/>\r\n		</linearGradient>\r\n	  </defs>\r\n	  <g id=\"Layer_1-2\" data-name=\"Layer 1\">\r\n		<rect fill=\"url(#linear-gradient)\" width=\"150%\" height=\"3.0\"/>\r\n	  </g>\r\n</svg>\r\n</br>\r\n	<img src=\"http://127.0.0.1:61670/__media/sites/default/sponsor-logos/sponsors-main.png\" alt=\"Sponsored by Ortus Solutions and Adobe\">\r\n</div>','',24,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b693018817846a080059','2023-05-13 23:48:54','2023-05-13 23:49:48',0,'<h1><span class=\"title-label\">Hands-On</span> CONTENTBOX HEADLESS CMS  <span>in 100 minutes</span></h1>\r\n<div class=\"slide-footer\">\r\n<span>LED BY<span>\r\n	<ul>\r\n		<li>Esmeralda Acevedo</li>\r\n		<li>Javier Quintero</li>\r\n	</ul>\r\n	\r\n	<svg id=\"Layer_2\" data-name=\"Layer 2\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" viewBox=\"0 0 568.4 6.42\">\r\n	  <defs>\r\n		<linearGradient id=\"linear-gradient\" x1=\"0\" y1=\"3.21\" x2=\"568.4\" y2=\"3.21\" gradientUnits=\"userSpaceOnUse\">\r\n		  <stop offset=\"0\" stop-color=\"#74bf44\"/>\r\n		  <stop offset=\"1\" stop-color=\"#ccdc29\"/>\r\n		</linearGradient>\r\n	  </defs>\r\n	  <g id=\"Layer_1-2\" data-name=\"Layer 1\">\r\n		<rect fill=\"url(#linear-gradient)\" width=\"150%\" height=\"3.0\"/>\r\n	  </g>\r\n</svg>\r\n</br>\r\n	<img src=\"http://127.0.0.1:61670/__media/sites/default/sponsor-logos/sponsors-main.png\" alt=\"Sponsored by Ortus Solutions and Adobe\">\r\n</div>','',25,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b693018817853f11005c','2023-05-13 23:49:48','2023-05-14 00:17:43',0,'<h1><span class=\"title-label\">Hands-On</span> CONTENTBOX HEADLESS CMS  <span>in 100 minutes</span></h1>\r\n<div class=\"slide-footer\">\r\n<span>LED BY<span>\r\n	<ul>\r\n		<li>Esmeralda Acevedo</li>\r\n		<li>Javier Quintero</li>\r\n	</ul>\r\n	\r\n	<svg id=\"Layer_2\" data-name=\"Layer 2\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" viewBox=\"0 0 568.4 6.42\">\r\n	  <defs>\r\n		<linearGradient id=\"linear-gradient\" x1=\"0\" y1=\"3.21\" x2=\"568.4\" y2=\"3.21\" gradientUnits=\"userSpaceOnUse\">\r\n		  <stop offset=\"0\" stop-color=\"#74bf44\"/>\r\n		  <stop offset=\"1\" stop-color=\"#ccdc29\"/>\r\n		</linearGradient>\r\n	  </defs>\r\n	  <g id=\"Layer_1-2\" data-name=\"Layer 1\">\r\n		<rect fill=\"url(#linear-gradient)\" width=\"150%\" height=\"3.0\"/>\r\n	  </g>\r\n</svg>\r\n</br>\r\n	<img src=\"http://127.0.0.1:61670/__media/sites/default/sponsor-logos/sponsors-main.png\" alt=\"Sponsored by Ortus Solutions and Adobe\">\r\n</div>','',26,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b6930188179ecdc7005f','2023-05-14 00:17:43','2023-05-14 00:17:43',0,'<h1><span class=\"title-label\">Hands-On</span> CONTENTBOX HEADLESS CMS  <span>in 100 minutes</span></h1>\r\n<div class=\"slide-footer\">\r\n<span>LED BY</span>\r\n	<ul>\r\n		<li>Esmeralda Acevedo</li>\r\n		<li>Javier Quintero</li>\r\n	</ul>\r\n	\r\n	<svg id=\"Layer_2\" data-name=\"Layer 2\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" viewBox=\"0 0 568.4 6.42\">\r\n	  <defs>\r\n		<linearGradient id=\"linear-gradient\" x1=\"0\" y1=\"3.21\" x2=\"568.4\" y2=\"3.21\" gradientUnits=\"userSpaceOnUse\">\r\n		  <stop offset=\"0\" stop-color=\"#74bf44\"/>\r\n		  <stop offset=\"1\" stop-color=\"#ccdc29\"/>\r\n		</linearGradient>\r\n	  </defs>\r\n	  <g id=\"Layer_1-2\" data-name=\"Layer 1\">\r\n		<rect fill=\"url(#linear-gradient)\" width=\"150%\" height=\"3.0\"/>\r\n	  </g>\r\n</svg>\r\n</br>\r\n	<img src=\"http://127.0.0.1:61670/__media/sites/default/sponsor-logos/sponsors-main.png\" alt=\"Sponsored by Ortus Solutions and Adobe\">\r\n</div>','',27,1,'2c9480838309dc9c018309dfb3be0092','2c9580838811b6930188126f67210005'),
	('2c9580838811b693018817c2dc5e0061','2023-05-14 00:57:06','2023-05-18 05:23:01',0,'<div class=\"row\">\r\n	<div class=\"col\"><img src=\"http://127.0.0.1:61670/__media/sites/default/Eacevedo.png\" /></div>\r\n	<div class=\"col\"><img src=\"http://127.0.0.1:61670/__media//sites/default/Jquintero.png\" /></div>\r\n</div>\r\n<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2>Esmeralda Acevedo</h2>\r\n		<p>Senior Software Developer</p>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2>Javier Quintero</h2>\r\n		<p> Software Developer</p>\r\n	</div>\r\n</div>\r\n\r\n','',3,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b69301881271d1c60015'),
	('2c9580838811b693018817c3db110064','2023-05-14 00:58:12','2023-05-14 00:58:31',0,'<h2>Qué es un CMS sin Cabeza <span>( Headless CMS)?</span></h2>\r\n\r\n<p>Es un sistema que administra contenido y que ha sido desacoplado de la capa de presentación.</p>\r\n','Content Cloned!',1,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018817c3db100062'),
	('2c9580838811b693018817c428420066','2023-05-14 00:58:31','2023-05-14 00:59:56',0,'<h2>Qué es un CMS sin Cabeza <span>( Headless CMS)?</span></h2>\r\n\r\n<p>Es un sistema que administra contenido y que ha sido desacoplado de la capa de presentación.</p>\r\n','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018817c3db100062'),
	('2c9580838811b693018817c572920068','2023-05-14 00:59:56','2023-05-14 00:59:56',0,'<h2>What is a Headless CMS?</h2>\r\n\r\n<p>A content management system that is decoupled from the presentation layer.</p>\r\n\r\n','',3,1,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018817c3db100062'),
	('2c9580838811b693018817c7f7f4006c','2023-05-14 01:02:41','2023-05-14 01:02:52',0,'<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2> Traditional CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/backend-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/system-trad.svg\"/>\r\n		</div>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2>Headless CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/api-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/systems-hless.svg\"/>\r\n		</div>\r\n	</div>\r\n</div>','Content Cloned!',1,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018817c7f7f30069'),
	('2c9580838811b693018817c8229a006f','2023-05-14 01:02:52','2023-05-14 01:03:14',0,'<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2> Traditional CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/backend-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/system-trad.svg\"/>\r\n		</div>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2>Headless CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/api-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/systems-hless.svg\"/>\r\n		</div>\r\n	</div>\r\n</div>','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018817c7f7f30069'),
	('2c9580838811b693018817c876920072','2023-05-14 01:03:14','2023-05-14 01:18:51',0,'<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2> Traditional CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/backend-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/system-trad.svg\"/>\r\n		</div>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2>Headless CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/api-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/systems-hless.svg\"/>\r\n		</div>\r\n	</div>\r\n</div>','',3,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018817c7f7f30069'),
	('2c9580838811b693018817d6c23b0075','2023-05-14 01:18:51','2023-05-14 01:19:40',0,'<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2> Traditional CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/backend-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/system-trad.svg\"/>\r\n		</div>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2>Headless CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/api-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/systems-hless.svg\"/>\r\n		</div>\r\n	</div>\r\n</div>','',4,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018817c7f7f30069'),
	('2c9580838811b693018817d783840078','2023-05-14 01:19:40','2023-05-14 01:19:40',0,'<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2> Traditional CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/backend-trad.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/system-trad.svg\"/>\r\n		</div>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2>Headless CMS</h2>\r\n		<div class=\"sequence\">\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/content-admin-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/api-hless.svg\"/>\r\n			<img src=\"http://127.0.0.1:61670/__media/sites/default/systems-hless.svg\"/>\r\n		</div>\r\n	</div>\r\n</div>','',5,1,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018817c7f7f30069'),
	('2c9580838811b693018817eba458007b','2023-05-14 01:41:39','2023-05-14 01:41:52',0,'<h2>The Body</h2>\r\n<p>Where your content is stored and authored:  the backend</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/cmsBody.svg\"/>','Content Cloned!',1,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018817eba4570079'),
	('2c9580838811b693018817ebd463007d','2023-05-14 01:41:51','2023-05-14 01:42:16',0,'<h2>The Body</h2>\r\n<p>Where your content is stored and authored:  the backend</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/cmsBody.svg\"/>','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018817eba4570079'),
	('2c9580838811b693018817ec34b8007f','2023-05-14 01:42:16','2023-05-14 01:42:16',0,'<h2>The Body</h2>\r\n<p>Where your content is stored and authored:  the backend</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/cmsBody.svg\"/>','',3,1,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018817eba4570079'),
	('2c9580838811b693018817ec68280082','2023-05-14 01:42:29','2023-05-14 01:43:14',0,'<h2>The Head</h2>\r\n<p>The visual presentation of the content at a digital location ( e.g. website, mobile app, video channels etc ).</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/heads.svg\" />\r\n','Content Cloned!',1,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018817ec68280080'),
	('2c9580838811b693018817ed18060084','2023-05-14 01:43:14','2023-05-14 01:43:41',0,'<h2>The Head</h2>\r\n<p>The visual presentation of the content at a digital location ( e.g. website, mobile app, video channels etc ).</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/heads.svg\" />\r\n','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018817ec68280080'),
	('2c9580838811b693018817ed7f2e0086','2023-05-14 01:43:41','2023-05-14 01:43:41',0,'<h2>The Head</h2>\r\n<p>The visual presentation of the content at a digital location ( e.g. website, mobile app, video channels etc ).</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/heads.svg\" />\r\n','',3,1,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018817ec68280080'),
	('2c9580838811b693018817edd97c0089','2023-05-14 01:44:04','2023-05-14 01:44:18',0,'<h2>Headless CMS Advantages</h2>\r\n<ul>\r\n		<li>Reusable content</li>\r\n		<li>Provides flexibility to the front-end developers </li>\r\n		<li>Scalability</li>\r\n		<li>Omnichannel experience </li>\r\n		<li>Better security</li>\r\n		<li>Future Proof</li>\r\n</ul>','Content Cloned!',1,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018817edd97b0087'),
	('2c9580838811b693018817ee0ece008b','2023-05-14 01:44:18','2023-05-14 01:44:39',0,'<h2>Headless CMS Advantages</h2>\r\n<ul>\r\n		<li>Reusable content</li>\r\n		<li>Provides flexibility to the front-end developers </li>\r\n		<li>Scalability</li>\r\n		<li>Omnichannel experience </li>\r\n		<li>Better security</li>\r\n		<li>Future Proof</li>\r\n</ul>','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018817edd97b0087'),
	('2c9580838811b693018817ee62a0008d','2023-05-14 01:44:39','2023-05-14 01:44:39',0,'<h2>Headless CMS Advantages</h2>\r\n<ul>\r\n		<li>Reusable content</li>\r\n		<li>Provides flexibility to the front-end developers </li>\r\n		<li>Scalability</li>\r\n		<li>Omnichannel experience </li>\r\n		<li>Better security</li>\r\n		<li>Future Proof</li>\r\n</ul>','',3,1,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018817edd97b0087'),
	('2c9580838811b693018817f25baa0090','2023-05-14 01:48:59','2023-05-14 01:49:19',0,'<h2><img src=\"http://127.0.0.1:61670/__media/sites/default/contentbox5-3.png\"></h2>','Content Cloned!',1,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018817f25baa008e'),
	('2c9580838811b693018817f2a8ff0092','2023-05-14 01:49:19','2023-05-14 01:49:44',0,'<h2><img src=\"http://127.0.0.1:61670/__media/sites/default/contentbox5-3.png\"></h2>','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018817f25baa008e'),
	('2c9580838811b693018817f309700094','2023-05-14 01:49:44','2023-05-14 01:49:44',0,'<h2><img src=\"http://127.0.0.1:61670/__media/sites/default/contentbox5-3.png\"></h2>','',3,1,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018817f25baa008e'),
	('2c9580838811b69301881835c08a0096','2023-05-14 03:02:36','2023-05-14 03:02:50',0,'<h2>Headless ContentBox</h2>\r\n<div class=\"row\">\r\n<div class=\"col\">\r\n<ul>\r\n<li>Expressive RESTFul API</li>\r\n<li>Secure JWT Clients</li>\r\n<li>Powered by ColdBox Security (PBAC)<br/>\r\n-- Permission Based Access Control\r\n</li>\r\n<li>Completely Documented</li>\r\n<li>Connect to pages, blog or the content store</li>\r\n<li>Deploy as a single module</li>\r\n<li>Consume from ANY language</li>\r\n</ul>\r\n</div>\r\n<div class=\"col\">\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/screenshot-headless-cb.png\"/>\r\n</div>\r\n</div>','Content Cloned!',1,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b69301881835c08a0095'),
	('2c9580838811b69301881835f6370097','2023-05-14 03:02:50','2023-05-14 03:03:57',0,'<h2>Headless ContentBox</h2>\r\n<div class=\"row\">\r\n<div class=\"col\">\r\n<ul>\r\n<li>Expressive RESTFul API</li>\r\n<li>Secure JWT Clients</li>\r\n<li>Powered by ColdBox Security (PBAC)<br/>\r\n-- Permission Based Access Control\r\n</li>\r\n<li>Completely Documented</li>\r\n<li>Connect to pages, blog or the content store</li>\r\n<li>Deploy as a single module</li>\r\n<li>Consume from ANY language</li>\r\n</ul>\r\n</div>\r\n<div class=\"col\">\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/screenshot-headless-cb.png\"/>\r\n</div>\r\n</div>','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b69301881835c08a0095'),
	('2c9580838811b69301881836fcda0098','2023-05-14 03:03:57','2023-05-14 18:39:53',0,'<h2>Headless ContentBox</h2>\r\n<div class=\"row\">\r\n<div class=\"col\">\r\n<ul>\r\n<li>Expressive RESTFul API</li>\r\n<li>Secure JWT Clients</li>\r\n<li>Powered by ColdBox Security (PBAC)<br/>\r\n-- Permission Based Access Control\r\n</li>\r\n<li>Completely Documented</li>\r\n<li>Connect to pages, blog or the content store</li>\r\n<li>Deploy as a single module</li>\r\n<li>Consume from ANY language</li>\r\n</ul>\r\n</div>\r\n<div class=\"col\">\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/screenshot-headless-cb.png\"/>\r\n</div>\r\n</div>','',3,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b69301881835c08a0095'),
	('2c9580838811b69301881b8fddca009a','2023-05-14 18:39:53','2023-05-14 18:39:53',0,'<h2>Headless ContentBox</h2>\r\n<div class=\"row\">\r\n<div class=\"col\">\r\n<ul>\r\n<li>Expressive RESTFul API</li>\r\n<li>Secure JWT Clients</li>\r\n<li>Powered by ColdBox Security (PBAC)<br/>\r\n-- Permission Based Access Control\r\n</li>\r\n<li>Completely Documented</li>\r\n<li>Connect to pages, blog or the content store</li>\r\n<li>Deploy as a single module</li>\r\n<li>Consume from ANY language</li>\r\n</ul>\r\n</div>\r\n<div class=\"col\">\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/screenshot-headless-cb.png\"/>\r\n</div>\r\n</div>','',4,1,'2c9480838309dc9c018309dfb3be0092','2c9580838811b69301881835c08a0095'),
	('2c9580838811b693018827cd2ce1009d','2023-05-17 03:42:18','2023-05-17 03:42:32',0,'<h2>Thanks</h2>','Content Cloned!',1,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018827cd2ce0009b'),
	('2c9580838811b693018827cd631f009f','2023-05-17 03:42:32','2023-05-17 03:42:59',0,'<h2>Thanks</h2>','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018827cd2ce0009b'),
	('2c9580838811b693018827cdcc8700a1','2023-05-17 03:42:59','2023-05-17 03:47:23',0,'<h2>Thanks</h2>','',3,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018827cd2ce0009b'),
	('2c9580838811b693018827d1d47000a3','2023-05-17 03:47:23','2023-05-17 03:54:40',0,'<h2>Thanks</h2>','',4,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018827cd2ce0009b'),
	('2c9580838811b693018827d87ff800a5','2023-05-17 03:54:40','2023-05-17 03:55:35',0,'<h2>THANK YOU</h2>\r\n<div class=\"slide-footer\">\r\n<p>Thanks to our sponsors</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/itb-2023/sponsors.jpg\" alt=\"Sponsors\">\r\n</div>','',5,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018827cd2ce0009b'),
	('2c9580838811b693018827d9576c00a7','2023-05-17 03:55:35','2023-05-17 04:02:46',0,'<h2>THANK YOU</h2>\r\n<div class=\"slide-footer\">\r\n<p>Thanks to our sponsors</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/itb-2023/sponsors.jpg\" alt=\"Sponsors\"/>\r\n</div>','',6,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018827cd2ce0009b'),
	('2c9580838811b693018827dfebc400a9','2023-05-17 04:02:46','2023-05-17 04:04:04',0,'<h1>THANK YOU</h1>\r\n<div class=\"slide-footer\">\r\n<p>Thanks to our sponsors</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/itb-2023/sponsors.jpg\" alt=\"Sponsors\"/>\r\n</div>','',7,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018827cd2ce0009b'),
	('2c9580838811b693018827e11ae900ab','2023-05-17 04:04:04','2023-05-17 04:05:25',0,'<h2>THANK YOU</h2>\r\n<div class=\"slide-footer\">\r\n<p>Thanks to our sponsors</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/itb-2023/sponsors.jpg\" alt=\"Sponsors\"/>\r\n</div>','',8,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018827cd2ce0009b'),
	('2c9580838811b693018827e2588900ae','2023-05-17 04:05:25','2023-05-17 04:06:11',0,'<h2>THANK YOU</h2>\r\n<div class=\"slide-footer\">\r\n<p>Thanks to our sponsors</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/itb-2023/sponsors.jpg\" alt=\"Sponsors\"/>\r\n</div>','',9,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018827cd2ce0009b'),
	('2c9580838811b693018827e30c6c00b0','2023-05-17 04:06:11','2023-05-17 04:07:39',0,'<h2>THANK YOU</h2>\r\n<div class=\"slide-footer\">\r\n<p>Thanks to our sponsors</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/itb-2023/sponsors.jpg\" alt=\"Sponsors\"/>\r\n</div>','',10,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018827cd2ce0009b'),
	('2c9580838811b693018827e4624900b2','2023-05-17 04:07:39','2023-05-17 04:10:06',0,'<h2>THANK YOU</h2>\r\n<div class=\"slide-footer\">\r\n<p>Thanks to our sponsors</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/itb-2023/sponsors.png\" alt=\"Sponsors\"/>\r\n</div>','',11,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018827cd2ce0009b'),
	('2c9580838811b693018827e6a18000b4','2023-05-17 04:10:06','2023-05-17 04:11:15',0,'<h2>THANK YOU</h2>\r\n<svg id=\"Layer_2\" data-name=\"Layer 2\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" viewBox=\"0 0 568.4 6.42\">\r\n	  <defs>\r\n		<linearGradient id=\"linear-gradient\" x1=\"0\" y1=\"3.21\" x2=\"568.4\" y2=\"3.21\" gradientUnits=\"userSpaceOnUse\">\r\n		  <stop offset=\"0\" stop-color=\"#74bf44\"/>\r\n		  <stop offset=\"1\" stop-color=\"#ccdc29\"/>\r\n		</linearGradient>\r\n	  </defs>\r\n	  <g id=\"Layer_1-2\" data-name=\"Layer 1\">\r\n		<rect fill=\"url(#linear-gradient)\" width=\"150%\" height=\"3.0\"/>\r\n	  </g>\r\n</svg>\r\n</br>\r\n<div class=\"slide-footer\">\r\n<p>Thanks to our sponsors</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/itb-2023/sponsors.png\" alt=\"Sponsors\"/>\r\n</div>','',12,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018827cd2ce0009b'),
	('2c9580838811b693018827e7ae8900b6','2023-05-17 04:11:15','2023-05-17 04:11:15',0,'<h2>THANK YOU</h2>\r\n</br>\r\n<div class=\"slide-footer\">\r\n<p>Thanks to our sponsors</p>\r\n<img src=\"http://127.0.0.1:61670/__media/sites/default/itb-2023/sponsors.png\" alt=\"Sponsors\"/>\r\n</div>','',13,1,'2c9480838309dc9c018309dfb3be0092','2c9580838811b693018827cd2ce0009b'),
	('2c9580838811b69301882b27c30900b8','2023-05-17 19:20:06','2023-05-17 19:31:58',0,'We are thrilled to announce the highly anticipated release of ColdBox 7, the latest version of the acclaimed web development HMVC framework for ColdFusion (CFML). ColdBox 7 introduces groundbreaking features and advancements, elevating the development experience to new heights and empowering developers to create exceptional web applications and APIs.','',1,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b69301882b27c30800b7'),
	('2c9580838811b69301882b32a09200b9','2023-05-17 19:31:58','2023-05-17 19:31:58',0,'We are thrilled to announce the highly anticipated release of ColdBox 7, the latest version of the acclaimed web development HMVC framework for ColdFusion (CFML). ColdBox 7 introduces groundbreaking features and advancements, elevating the development experience to new heights and empowering developers to create exceptional web applications and APIs.','',2,1,'2c9480838309dc9c018309dfb3be0092','2c9580838811b69301882b27c30800b7'),
	('2c9580838811b69301882b34086c00bb','2023-05-17 19:33:30','2023-05-17 19:34:04',0,'<div><img src=\"http://127.0.0.1:61670/__media//sites/default/Jquintero.png\" /></div>','',1,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b69301882b34086b00ba'),
	('2c9580838811b69301882b348a8000bc','2023-05-17 19:34:04','2023-05-17 19:36:47',0,'<div><img src=\"http://127.0.0.1:61670/__media//sites/default/Jquintero.png\" /></div>','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b69301882b34086b00ba'),
	('2c9580838811b69301882b37083e00bd','2023-05-17 19:36:47','2023-05-17 19:37:23',0,'<h2>Review This Session</h2>\r\n<div><img src=\"http://127.0.0.1:61670/__media//sites/default/Jquintero.png\" /></div>','',3,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b69301882b34086b00ba'),
	('2c9580838811b69301882b37938f00bf','2023-05-17 19:37:23','2023-05-17 19:38:22',0,'<h2>Review This Session</h2>\r\n<div><img src=\"http://127.0.0.1:61670/__media//sites/default/Jquintero.png\" /></div>','',4,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b69301882b34086b00ba'),
	('2c9580838811b69301882b387c8c00c1','2023-05-17 19:38:22','2023-05-17 19:39:59',0,'<h2>Review This Session</h2>\r\n<div><img src=\"http://127.0.0.1:61670/__media/sites/default/itb-2023/qrCode.png\" /></div>','',5,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b69301882b34086b00ba'),
	('2c9580838811b69301882b39f57500c3','2023-05-17 19:39:59','2023-05-17 19:40:50',0,'<h2>Review This Session</h2>\r\n<div><img src=\"http://127.0.0.1:61670/__media/sites/default/itb-2023/qrCode.png\" /></div>','',6,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b69301882b34086b00ba'),
	('2c9580838811b69301882b3abe2900c5','2023-05-17 19:40:50','2023-05-17 19:41:38',0,'<h2>Review This Session</h2>\r\n','',7,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b69301882b34086b00ba'),
	('2c9580838811b69301882b3b7ae200c7','2023-05-17 19:41:38','2023-05-17 19:41:38',0,'<h2>Review This Session</h2>\r\n<div><img src=\"http://127.0.0.1:61670/__media/sites/default/itb-2023/qrCode.png\" style=\"width:200px\" /></div>','',8,1,'2c9480838309dc9c018309dfb3be0092','2c9580838811b69301882b34086b00ba'),
	('2c9580838811b69301882b83c5a900c9','2023-05-17 21:00:36','2023-05-17 21:00:46',0,'<h2>Session Resources</h2>\r\n<a href=\"https://github.com/esmeace/contentbox-headless-cms-hands-on\" target=\"_blank\">https://github.com/esmeace/contentbox-headless-cms-hands-on </a>','',1,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b69301882b83c5a800c8'),
	('2c9580838811b69301882b83edd600ca','2023-05-17 21:00:46','2023-05-17 21:01:49',0,'<h2>Session Resources</h2>\r\n<a href=\"https://github.com/esmeace/contentbox-headless-cms-hands-on\" target=\"_blank\">https://github.com/esmeace/contentbox-headless-cms-hands-on </a>','',2,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b69301882b83c5a800c8'),
	('2c9580838811b69301882b84e29100cb','2023-05-17 21:01:49','2023-05-17 21:02:18',0,'<h2>Session Files</h2>\r\n<a href=\"https://github.com/esmeace/contentbox-headless-cms-hands-on\" target=\"_blank\">https://github.com/esmeace/contentbox-headless-cms-hands-on </a>','',3,0,'2c9480838309dc9c018309dfb3be0092','2c9580838811b69301882b83c5a800c8'),
	('2c9580838811b69301882b85546600cd','2023-05-17 21:02:18','2023-05-17 21:02:18',0,'<h2>Session Files</h2>\r\n<a href=\"https://github.com/esmeace/contentbox-headless-cms-hands-on\" target=\"_blank\">https://github.com/esmeace/contentbox-headless-cms-hands-on </a>','',4,1,'2c9480838309dc9c018309dfb3be0092','2c9580838811b69301882b83c5a800c8'),
	('2c9580838811b69301882d4fbd5b00cf','2023-05-18 05:23:00','2023-05-18 05:23:00',0,'<div class=\"row\">\r\n	<div class=\"col\"><img src=\"http://127.0.0.1:61670/__media/sites/default/Eacevedo.png\" /></div>\r\n	<div class=\"col\"><img src=\"http://127.0.0.1:61670/__media//sites/default/Jquintero.png\" /></div>\r\n</div>\r\n<div class=\"row\">\r\n	<div class=\"col\">\r\n		<h2>Esmeralda Acevedo</h2>\r\n		<p>Senior  Developer</p>\r\n	</div>\r\n	<div class=\"col\">\r\n		<h2>Javier Quintero</h2>\r\n		<p>Developer</p>\r\n	</div>\r\n</div>\r\n\r\n','',4,1,'2c9480838309dc9c018309dfb3be0092','2c9580838811b69301881271d1c60015');

/*!40000 ALTER TABLE `cb_contentVersion` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cb_customfield
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_customfield`;

CREATE TABLE `cb_customfield` (
  `customFieldID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FK_contentID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`customFieldID`),
  KEY `fk_cb_customfield_FK_contentID` (`FK_contentID`),
  CONSTRAINT `fk_cb_customfield_FK_contentID` FOREIGN KEY (`FK_contentID`) REFERENCES `cb_content` (`contentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cb_customfield` WRITE;
/*!40000 ALTER TABLE `cb_customfield` DISABLE KEYS */;

INSERT INTO `cb_customfield` (`customFieldID`, `createdDate`, `modifiedDate`, `isDeleted`, `key`, `value`, `FK_contentID`)
VALUES
	('2c9480838309dc9c0183142a01100195','2022-09-06 18:57:21','2022-09-06 18:57:21',0,'bgImage','/__media/sites/default/space-03.png','2c9480838309dc9c01831419faff0190'),
	('2c9480838309dc9c018314ee601801b3','2022-09-06 22:31:50','2022-09-06 22:31:50',0,'bgImage','/__media/sites/default/space-01.png','2c9480838309dc9c018314edf62201b0'),
	('2c9480838309dc9c0183172d6ed501bf','2022-09-07 08:59:57','2022-09-07 08:59:57',0,'type','sequence','2c9480838309dc9c0183137ea0ff017e'),
	('2c9480838309dc9c0183172d6ed601c0','2022-09-07 08:59:57','2022-09-07 08:59:57',0,'bgImage','__media/sites/default/space-02.png','2c9480838309dc9c0183137ea0ff017e'),
	('2c9480838309dc9c018318f74ce401c7','2022-09-07 17:20:04','2022-09-07 17:20:04',0,'bgImage','/__media/sites/default/space-05.png','2c9480838309dc9c01831413ac24018d'),
	('2c94808384da81f00184daef871d0005','2022-12-04 02:20:42','2022-12-04 02:20:42',0,'type','video','2c9480838309dc9c01831d5f0f4d01d6'),
	('2c94808384da81f00184daf31dbe0009','2022-12-04 02:24:37','2022-12-04 02:24:37',0,'type','sequence','2c9480838309dc9c01831d5f109601dc'),
	('2c94808384da81f00184daf31dbe000a','2022-12-04 02:24:37','2022-12-04 02:24:37',0,'bgImage','__media/sites/default/space-02.png','2c9480838309dc9c01831d5f109601dc'),
	('2c94808384da81f00184daf50e8a000c','2022-12-04 02:26:44','2022-12-04 02:26:44',0,'bgImage','/__media/sites/default/space-05.png','2c9480838309dc9c01831d5f112001e0'),
	('2c94808384da81f00184db0af9440012','2022-12-04 02:50:40','2022-12-04 02:50:40',0,'type','video','2c9480838309dc9c01831d5f12c201e9'),
	('2c94808384da81f00184db186b090016','2022-12-04 03:05:21','2022-12-04 03:05:21',0,'bgImage','/__media/sites/default/space-01.png','2c9480838309dc9c01831d5f14c101f3'),
	('2c94808384da81f00184db1a1c5e0018','2022-12-04 03:07:12','2022-12-04 03:07:12',0,'bgImage','__media/sites/default/space-01.png','2c9480838309dc9c01831d5f0ebf01d2'),
	('2c94808384da81f00184db1a1c5e0019','2022-12-04 03:07:12','2022-12-04 03:07:12',0,'type','cover','2c9480838309dc9c01831d5f0ebf01d2'),
	('2c94808384da81f00184db1df0a1001b','2022-12-04 03:11:23','2022-12-04 03:11:23',0,'bgImage','/__media/sites/default/space-03.png','2c9480838309dc9c01831d5f11b701e3'),
	('2c94808384e113b20184e4d258ba0012','2022-12-06 00:25:01','2022-12-06 00:25:01',0,'bgImage','/__media/sites/default/space-02.png','2c9480838309dc9c01831d5f13fe01f0'),
	('2c94808384e113b20184e4d3dff00014','2022-12-06 00:26:41','2022-12-06 00:26:41',0,'bgImage','/__media/sites/default/headlessBg.png','2c9480838309dc9c01831d5f0fd501d9'),
	('2c94808384e113b20184e9e82a0a0016','2022-12-07 00:06:57','2022-12-07 00:06:57',0,'bgImage','/__media/sites/default/advantages.png','2c9480838309dc9c01831d5f124001e6'),
	('2c9480838bc85d85018bc89341bf000d','2023-11-13 12:06:16','2023-11-13 12:06:16',0,'type','video','2c9480838309dc9c01830ccb4a9f0140'),
	('2c9480838bc85d85018bc8a066c5000f','2023-11-13 12:20:37','2023-11-13 12:20:37',0,'bgImage','__media/sites/default/space-01.png','2c9480838309dc9c01830cc8468c013d'),
	('2c9480838bc85d85018bc8a066c50010','2023-11-13 12:20:37','2023-11-13 12:20:37',0,'type','cover','2c9480838309dc9c01830cc8468c013d'),
	('2c9480838bc85d85018bc955b79c0016','2023-11-13 15:38:40','2023-11-13 15:38:40',0,'bgImage','/__media/sites/default/headless-background.png','2c9480838309dc9c01830cd4eeac0143'),
	('2c9480838bc85d85018bc97d568b0032','2023-11-13 16:21:57','2023-11-13 16:21:57',0,'bgImage','/__media/sites/default/headless-background.png','2c9480838bc85d85018bc97bbf27002d'),
	('2c9480838bca8a35018bca9961f40003','2023-11-13 21:32:12','2023-11-13 21:32:12',0,'bgImage','/__media/sites/default/advantages.png','2c9480838309dc9c01831b144f3d01c9'),
	('2c9480838bca8a35018bca9b18600005','2023-11-13 21:34:04','2023-11-13 21:34:04',0,'type','video','2c9480838309dc9c0183147a2be70198'),
	('2c9480838bca8a35018bca9d2c190008','2023-11-13 21:36:20','2023-11-13 21:36:20',0,'bgImage','/__media/sites/default/itb-2023/bg-astronauta.jpg','2c9480838bca8a35018bca9d2c180007'),
	('2c9480838bca8a35018bcaa190e70014','2023-11-13 21:41:08','2023-11-13 21:41:08',0,'bgImage','/__media/sites/default/space-04.png','2c9480838bca8a35018bca9eccd0000a'),
	('2c9480838bca8a35018bcaa1a0200016','2023-11-13 21:41:12','2023-11-13 21:41:12',0,'bgImage','/__media/sites/default/itb-2023/bg-main.png','2c9480838bca8a35018bcaa0053a000d'),
	('2c9480838bca8a35018bcaa3d14e001b','2023-11-13 21:43:36','2023-11-13 21:43:36',0,'bgImage','/__media/sites/default/space-03.png','2c9480838bc85d85018bc9865e660034'),
	('2c9580838811b6930188179ecdc7005d','2023-05-14 00:17:43','2023-05-14 00:17:43',0,'bgImage','__media/sites/default/itb-2023/bgcover.png','2c9580838811b6930188126f67210005'),
	('2c9580838811b6930188179ecdc7005e','2023-05-14 00:17:43','2023-05-14 00:17:43',0,'type','cover','2c9580838811b6930188126f67210005'),
	('2c9580838811b693018817c572920067','2023-05-14 00:59:56','2023-05-14 00:59:56',0,'bgImage','/__media/sites/default/headlessBg.png','2c9580838811b693018817c3db100062'),
	('2c9580838811b693018817d783840076','2023-05-14 01:19:40','2023-05-14 01:19:40',0,'type','sequence','2c9580838811b693018817c7f7f30069'),
	('2c9580838811b693018817d783840077','2023-05-14 01:19:40','2023-05-14 01:19:40',0,'bgImage','__media/sites/default/itb-2023/bg-slides.png','2c9580838811b693018817c7f7f30069'),
	('2c9580838811b693018817ec34b7007e','2023-05-14 01:42:16','2023-05-14 01:42:16',0,'bgImage','/__media/sites/default/space-05.png','2c9580838811b693018817eba4570079'),
	('2c9580838811b693018817ed7f2e0085','2023-05-14 01:43:41','2023-05-14 01:43:41',0,'bgImage','/__media/sites/default/space-03.png','2c9580838811b693018817ec68280080'),
	('2c9580838811b693018817ee62a0008c','2023-05-14 01:44:39','2023-05-14 01:44:39',0,'bgImage','/__media/sites/default/advantages.png','2c9580838811b693018817edd97b0087'),
	('2c9580838811b693018817f309700093','2023-05-14 01:49:44','2023-05-14 01:49:44',0,'type','video','2c9580838811b693018817f25baa008e'),
	('2c9580838811b69301881b8fddca0099','2023-05-14 18:39:53','2023-05-14 18:39:53',0,'bgImage','__media/sites/default/itb-2023/bg-slides.png','2c9580838811b69301881835c08a0095'),
	('2c9580838811b693018827e7ae8800b5','2023-05-17 04:11:15','2023-05-17 04:11:15',0,'bgImage','/__media/sites/default/itb-2023/bg-astronauta.jpg','2c9580838811b693018827cd2ce0009b'),
	('2c9580838811b69301882b3b7ae200c6','2023-05-17 19:41:38','2023-05-17 19:41:38',0,'bgImage','__media/sites/default/itb-2023/bg-slides.png','2c9580838811b69301882b34086b00ba'),
	('2c9580838811b69301882b85546600cc','2023-05-17 21:02:18','2023-05-17 21:02:18',0,'bgImage','__media/sites/default/itb-2023/bg-slides.png','2c9580838811b69301882b83c5a800c8'),
	('2c9580838811b69301882d4fbd5b00ce','2023-05-18 05:23:01','2023-05-18 05:23:01',0,'type','video','2c9580838811b69301881271d1c60015');

/*!40000 ALTER TABLE `cb_customfield` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cb_entry
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_entry`;

CREATE TABLE `cb_entry` (
  `contentID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`contentID`),
  CONSTRAINT `fk_cb_entry_contentID` FOREIGN KEY (`contentID`) REFERENCES `cb_content` (`contentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cb_entry` WRITE;
/*!40000 ALTER TABLE `cb_entry` DISABLE KEYS */;

INSERT INTO `cb_entry` (`contentID`, `excerpt`)
VALUES
	('2c9480838309dc9c018309dfc73400e5',''),
	('2c9480838309dc9c018309dfcf8d0127',''),
	('2c9580838811b69301882b27c30800b7','Introducing ColdBox 7: Revolutionizing Web Development with Cutting-Edge Features and Unparalleled Performance');

/*!40000 ALTER TABLE `cb_entry` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cb_groupPermissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_groupPermissions`;

CREATE TABLE `cb_groupPermissions` (
  `FK_permissionGroupID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FK_permissionID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `fk_cb_groupPermissions_FK_permissionGroupID` (`FK_permissionGroupID`),
  KEY `fk_cb_groupPermissions_FK_permissionID` (`FK_permissionID`),
  CONSTRAINT `fk_cb_groupPermissions_FK_permissionGroupID` FOREIGN KEY (`FK_permissionGroupID`) REFERENCES `cb_permissionGroup` (`permissionGroupID`),
  CONSTRAINT `fk_cb_groupPermissions_FK_permissionID` FOREIGN KEY (`FK_permissionID`) REFERENCES `cb_permission` (`permissionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table cb_jwt
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_jwt`;

CREATE TABLE `cb_jwt` (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` datetime NOT NULL,
  `issued` datetime NOT NULL,
  `token` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cacheKey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cacheKey` (`cacheKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table cb_loginAttempts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_loginAttempts`;

CREATE TABLE `cb_loginAttempts` (
  `loginAttemptsID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` bigint NOT NULL,
  `lastLoginSuccessIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`loginAttemptsID`),
  KEY `idx_values` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cb_loginAttempts` WRITE;
/*!40000 ALTER TABLE `cb_loginAttempts` DISABLE KEYS */;

INSERT INTO `cb_loginAttempts` (`loginAttemptsID`, `createdDate`, `modifiedDate`, `isDeleted`, `value`, `attempts`, `lastLoginSuccessIP`)
VALUES
	('2c9380838bd37fc3018bd383693f0002','2023-11-15 15:04:47','2023-11-15 15:04:46',0,'',1,NULL),
	('2c9380838bd37fc3018bd383694f0003','2023-11-15 15:04:47','2023-11-15 15:04:46',0,'',1,NULL);

/*!40000 ALTER TABLE `cb_loginAttempts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cb_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_menu`;

CREATE TABLE `cb_menu` (
  `menuID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `menuClass` varchar(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `listClass` varchar(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `listType` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FK_siteID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`menuID`),
  KEY `fk_cb_menu_FK_siteID` (`FK_siteID`),
  KEY `idx_menutitle` (`title`),
  KEY `idx_menuslug` (`slug`),
  CONSTRAINT `fk_cb_menu_FK_siteID` FOREIGN KEY (`FK_siteID`) REFERENCES `cb_site` (`siteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table cb_menuItem
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_menuItem`;

CREATE TABLE `cb_menuItem` (
  `menuItemID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itemClass` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menuType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `menuSlug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contentSlug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `js` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `urlClass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mediaPath` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FK_menuID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FK_parentID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`menuItemID`),
  KEY `fk_cb_menuItem_FK_menuID` (`FK_menuID`),
  KEY `fk_cb_menuItem_FK_parentID` (`FK_parentID`),
  KEY `idx_menuItemTitle` (`title`),
  KEY `idx_deleted` (`isDeleted`),
  CONSTRAINT `fk_cb_menuItem_FK_menuID` FOREIGN KEY (`FK_menuID`) REFERENCES `cb_menu` (`menuID`),
  CONSTRAINT `fk_cb_menuItem_FK_parentID` FOREIGN KEY (`FK_parentID`) REFERENCES `cb_menuItem` (`menuItemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table cb_module
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_module`;

CREATE TABLE `cb_module` (
  `moduleID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entryPoint` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `webURL` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `forgeBoxSlug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `isActive` tinyint(1) NOT NULL DEFAULT '0',
  `moduleType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`moduleID`),
  KEY `idx_moduleName` (`name`),
  KEY `idx_entryPoint` (`entryPoint`),
  KEY `idx_activeModule` (`isActive`),
  KEY `idx_moduleType` (`moduleType`),
  KEY `idx_deleted` (`isDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cb_module` WRITE;
/*!40000 ALTER TABLE `cb_module` DISABLE KEYS */;

INSERT INTO `cb_module` (`moduleID`, `createdDate`, `modifiedDate`, `isDeleted`, `name`, `title`, `version`, `entryPoint`, `author`, `webURL`, `forgeBoxSlug`, `description`, `isActive`, `moduleType`)
VALUES
	('2c9480838bb8cfb2018bb8d03ad3009a','2023-11-10 10:38:56','2023-11-10 10:38:56',0,'Hello','HelloContentBox','','HelloContentBox','Ortus Solutions, Corp','https://www.ortussolutions.com','','This is an awesome hello world module',0,'core');

/*!40000 ALTER TABLE `cb_module` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cb_page
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_page`;

CREATE TABLE `cb_page` (
  `contentID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `showInMenu` tinyint(1) NOT NULL DEFAULT '1',
  `order` int DEFAULT '0',
  `excerpt` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `layout` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`contentID`),
  CONSTRAINT `fk_cb_page_contentID` FOREIGN KEY (`contentID`) REFERENCES `cb_content` (`contentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cb_page` WRITE;
/*!40000 ALTER TABLE `cb_page` DISABLE KEYS */;

INSERT INTO `cb_page` (`contentID`, `showInMenu`, `order`, `excerpt`, `layout`)
VALUES
	('2c9480838309dc9c018309dfc80400e9',1,4,'','pages'),
	('2c9480838309dc9c018309dfcfd6012b',1,0,'','pages'),
	('2c9480838309dc9c01830b73c1330134',1,3,'','pages'),
	('2c94808384e113b20184e4856a790005',1,1,'','pages'),
	('2c94808384e113b20184e48d35dd0007',1,2,'','pages');

/*!40000 ALTER TABLE `cb_page` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cb_permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_permission`;

CREATE TABLE `cb_permission` (
  `permissionID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`permissionID`),
  UNIQUE KEY `permission` (`permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cb_permission` WRITE;
/*!40000 ALTER TABLE `cb_permission` DISABLE KEYS */;

INSERT INTO `cb_permission` (`permissionID`, `createdDate`, `modifiedDate`, `isDeleted`, `permission`, `description`)
VALUES
	('019970DE-3AC3-4BF4-96923B73D6511922','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'CONTENTSTORE_EDITOR','Ability to create, edit and publish content store elements'),
	('0D70D9F0-BF55-4445-9B5D92269062369E','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'WIDGET_ADMIN','Ability to manage widgets, default is view only'),
	('0F8A07DC-F5F0-4BE2-B63CE8DE2199E6BA','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'ROLES_ADMIN','Ability to manage roles, default is view only'),
	('1005FC1B-50AF-40CC-A65F51B053CEA59B','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'CONTENTSTORE_ADMIN','Ability to manage the content store, default is view only'),
	('111B0F37-84D3-44E8-B4F19DC26C09B30D','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'EDITORS_CUSTOM_FIELDS','Ability to manage custom fields in any content editors'),
	('14013F22-472B-4CAA-9988AB93BDFBA8F8','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'CONTENTBOX_ADMIN','Access to the enter the ContentBox administrator console'),
	('15034A0E-7520-4C98-BBA38A5132717FCA','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'TOOLS_EXPORT','Ability to export data from ContentBox'),
	('183D9D15-0C9C-4B90-98109B3835587DC4','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'THEME_ADMIN','Ability to manage layouts, default is view only'),
	('3E7FD8DE-B74C-4966-8B5E41C299B5B068','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'SYSTEM_TAB','Access to the ContentBox System tools'),
	('45A2E08B-5678-49D3-AC814B772FE885E6','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'ENTRIES_ADMIN','Ability to manage blog entries, default is view only'),
	('463E7F3D-698D-47E0-9260163CDCECA29F','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'SYSTEM_AUTH_LOGS','Access to the system auth logs'),
	('4A2AB9D4-5447-4A34-8AAD968F93CDB4BC','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'EDITORS_CACHING','Ability to view the content caching panel'),
	('4F8BF901-1005-48B2-837F44164A8F7DC8','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'EDITORS_FEATURED_IMAGE','Ability to view the featured image panel'),
	('5B4A3907-30AD-4CCF-BA3B634DD73BDAAC','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'VERSIONS_ROLLBACK','Ability to rollback content versions'),
	('5BAE1583-39B1-437A-8B8E4828402A0B81','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'EDITORS_LINKED_CONTENT','Ability to view the linked content panel'),
	('63914F72-5E6E-493C-B9482E5DB654F3A0','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'SYSTEM_RAW_SETTINGS','Access to the ContentBox raw geek settings panel'),
	('6408968E-F2FD-4595-9413D7992F8FB61E','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'AUTHOR_ADMIN','Ability to manage authors, default is view only'),
	('662D50A3-29F1-48FC-B27241665FFF0CD5','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'ENTRIES_EDITOR','Ability to create, edit and publish blog entries'),
	('691AB1AB-6CD3-4C99-BF3103B2E46FBFD0','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'EDITORS_CATEGORIES','Ability to view the content categories panel'),
	('6AD47B8E-B1D3-4A86-B37E0310298E5E76','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'EDITORS_EDITOR_SELECTOR','Ability to change the editor to another registered online editor'),
	('6EAE7398-A04B-4D9F-B87D701A4E6DB804','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'SYSTEM_UPDATES','Ability to view and apply ContentBox updates'),
	('786DE5B9-B9B3-41C3-B765845BC178EB46','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'EDITORS_RELATED_CONTENT','Ability to view the related content panel'),
	('817DDE94-12F9-4AC2-AE0CEBA3908EB901','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'PAGES_EDITOR','Ability to create, edit and publish pages'),
	('83D5A7EF-6884-4323-A48E115F8CDD13CE','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'RELOAD_MODULES','Ability to reload modules'),
	('89A7A9A9-583B-4B6E-88AC3E7F7765272C','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'EDITORS_MODIFIERS','Ability to view the content modifiers panel'),
	('8CE00003-7044-4439-85EEF0BDBE903338','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'EMAIL_TEMPLATE_ADMIN','Ability to admin and preview email templates'),
	('9C5446DF-F069-4FC7-B9826EEE327F703F','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'GLOBALHTML_ADMIN','Ability to manage the system\'s global HTML content used on layouts'),
	('A0B48578-6CDF-47F2-B39830D977121E96','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'SYSTEM_SAVE_CONFIGURATION','Ability to update global configuration data'),
	('AECA5EA3-4425-49A2-BCAA767B22A538E7','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'SITES_ADMIN','Ability to manage sites'),
	('BCA9BD9C-21D8-472C-97F4F9367F1B6253','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'CATEGORIES_ADMIN','Ability to manage categories, default is view only'),
	('BF06F9E3-6455-47FF-933E20A1A2B96526','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'MEDIAMANAGER_ADMIN','Ability to manage the system\'s media manager'),
	('C335019F-0E59-41FB-A225E9DE930B90D3','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'MODULES_ADMIN','Ability to manage ContentBox Modules'),
	('CB16CFBB-773F-40CA-8943D7378DF34077','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'VERSIONS_DELETE','Ability to delete past content versions'),
	('D0F6F981-67B9-42FB-A26E8575ADAA59E3','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'MEDIAMANAGER_LIBRARY_SWITCHER','Ability to switch media manager libraries for management'),
	('D13B72F2-8E14-430A-B42014ADE2893E7B','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'FORGEBOX_ADMIN','Ability to manage ForgeBox installations and connectivity.'),
	('D5B7BF72-485C-4A67-B134FDDCE5CAB228','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'MENUS_ADMIN','Ability to manage the menu builder'),
	('D932693F-94D5-46DC-86A50A209366ADC2','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'EDITORS_DISPLAY_OPTIONS','Ability to view the content display options panel'),
	('DE162397-F4B7-4E7D-B88EBEEB2BE1D738','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'GLOBAL_SEARCH','Ability to do global searches in the ContentBox Admin'),
	('DE6EC9EE-F497-41CE-B965C2198A5C5125','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'COMMENTS_ADMIN','Ability to manage comments, default is view only'),
	('E5A8C2DB-51BC-4B54-9A764C1EACDF3D87','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'PAGES_ADMIN','Ability to manage content pages, default is view only'),
	('E71FB230-E10D-42BE-92BCC390E734E9D7','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'PERMISSIONS_ADMIN','Ability to manage permissions, default is view only'),
	('EA3CD59D-DBA8-4356-970712840D1F05D4','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'EDITORS_HTML_ATTRIBUTES','Ability to view the content HTML attributes panel'),
	('F0B2AD4D-85ED-4CF0-90F729ED0F58E117','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'SECURITYRULES_ADMIN','Ability to manage the system\'s security rules, default is view only'),
	('FF62B28C-D446-4D92-B38248CEFAC7FEB3','2023-11-10 11:29:23','2023-11-10 11:29:23',0,'TOOLS_IMPORT','Ability to import data into ContentBox');

/*!40000 ALTER TABLE `cb_permission` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cb_permissionGroup
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_permissionGroup`;

CREATE TABLE `cb_permissionGroup` (
  `permissionGroupID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`permissionGroupID`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table cb_relatedContent
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_relatedContent`;

CREATE TABLE `cb_relatedContent` (
  `FK_contentID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FK_relatedContentID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `fk_cb_relatedContent_FK_contentID` (`FK_contentID`),
  KEY `fk_cb_relatedContent_FK_relatedContentID` (`FK_relatedContentID`),
  CONSTRAINT `fk_cb_relatedContent_FK_contentID` FOREIGN KEY (`FK_contentID`) REFERENCES `cb_content` (`contentID`),
  CONSTRAINT `fk_cb_relatedContent_FK_relatedContentID` FOREIGN KEY (`FK_relatedContentID`) REFERENCES `cb_content` (`contentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table cb_relocations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_relocations`;

CREATE TABLE `cb_relocations` (
  `relocationID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `slug` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FK_siteID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FK_contentID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`relocationID`),
  UNIQUE KEY `unq_cb_relocations_slug_FK_siteID` (`slug`,`FK_siteID`),
  KEY `fk_cb_relocations_FK_siteID` (`FK_siteID`),
  KEY `fk_cb_relocations_FK_contentID` (`FK_contentID`),
  CONSTRAINT `fk_cb_relocations_FK_contentID` FOREIGN KEY (`FK_contentID`) REFERENCES `cb_content` (`contentID`),
  CONSTRAINT `fk_cb_relocations_FK_siteID` FOREIGN KEY (`FK_siteID`) REFERENCES `cb_site` (`siteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cb_relocations` WRITE;
/*!40000 ALTER TABLE `cb_relocations` DISABLE KEYS */;

INSERT INTO `cb_relocations` (`relocationID`, `createdDate`, `modifiedDate`, `isDeleted`, `slug`, `target`, `FK_siteID`, `FK_contentID`)
VALUES
	('2c9380838bd37fc3018bd40f759d0005','2023-11-15 17:37:45','2023-11-15 17:38:06',0,'home',NULL,'2c9480838309dc9c018309dfb74e00af','2c94808384e113b20184e4856a790005');

/*!40000 ALTER TABLE `cb_relocations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cb_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_role`;

CREATE TABLE `cb_role` (
  `roleID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`roleID`),
  UNIQUE KEY `role` (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cb_role` WRITE;
/*!40000 ALTER TABLE `cb_role` DISABLE KEYS */;

INSERT INTO `cb_role` (`roleID`, `createdDate`, `modifiedDate`, `isDeleted`, `role`, `description`)
VALUES
	('2c9480838bb8cfb2018bb8dd975900d1','2023-11-10 10:53:32','2023-11-10 10:53:32',0,'API Content Viewer','API Content Viewer'),
	('2D385E92-8555-49BC-ADA8C8ADAF15D250','2023-11-10 11:29:24','2023-11-10 11:29:24',0,'Administrator','A ContentBox Administrator'),
	('439F57E4-877E-4104-A52E647E3B1F63A8','2023-11-10 11:29:24','2023-11-10 11:29:24',0,'Editor','A ContentBox Editor');

/*!40000 ALTER TABLE `cb_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cb_rolePermissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_rolePermissions`;

CREATE TABLE `cb_rolePermissions` (
  `FK_permissionID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FK_roleID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `fk_cb_rolePermissions_FK_permissionID` (`FK_permissionID`),
  KEY `fk_cb_rolePermissions_FK_roleID` (`FK_roleID`),
  CONSTRAINT `fk_cb_rolePermissions_FK_permissionID` FOREIGN KEY (`FK_permissionID`) REFERENCES `cb_permission` (`permissionID`),
  CONSTRAINT `fk_cb_rolePermissions_FK_roleID` FOREIGN KEY (`FK_roleID`) REFERENCES `cb_role` (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cb_rolePermissions` WRITE;
/*!40000 ALTER TABLE `cb_rolePermissions` DISABLE KEYS */;

INSERT INTO `cb_rolePermissions` (`FK_permissionID`, `FK_roleID`)
VALUES
	('019970DE-3AC3-4BF4-96923B73D6511922','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('0D70D9F0-BF55-4445-9B5D92269062369E','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('0F8A07DC-F5F0-4BE2-B63CE8DE2199E6BA','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('1005FC1B-50AF-40CC-A65F51B053CEA59B','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('111B0F37-84D3-44E8-B4F19DC26C09B30D','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('14013F22-472B-4CAA-9988AB93BDFBA8F8','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('15034A0E-7520-4C98-BBA38A5132717FCA','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('183D9D15-0C9C-4B90-98109B3835587DC4','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('3E7FD8DE-B74C-4966-8B5E41C299B5B068','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('45A2E08B-5678-49D3-AC814B772FE885E6','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('463E7F3D-698D-47E0-9260163CDCECA29F','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('4A2AB9D4-5447-4A34-8AAD968F93CDB4BC','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('4F8BF901-1005-48B2-837F44164A8F7DC8','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('5B4A3907-30AD-4CCF-BA3B634DD73BDAAC','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('5BAE1583-39B1-437A-8B8E4828402A0B81','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('63914F72-5E6E-493C-B9482E5DB654F3A0','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('6408968E-F2FD-4595-9413D7992F8FB61E','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('662D50A3-29F1-48FC-B27241665FFF0CD5','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('691AB1AB-6CD3-4C99-BF3103B2E46FBFD0','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('6AD47B8E-B1D3-4A86-B37E0310298E5E76','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('6EAE7398-A04B-4D9F-B87D701A4E6DB804','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('786DE5B9-B9B3-41C3-B765845BC178EB46','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('817DDE94-12F9-4AC2-AE0CEBA3908EB901','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('83D5A7EF-6884-4323-A48E115F8CDD13CE','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('89A7A9A9-583B-4B6E-88AC3E7F7765272C','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('8CE00003-7044-4439-85EEF0BDBE903338','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('9C5446DF-F069-4FC7-B9826EEE327F703F','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('A0B48578-6CDF-47F2-B39830D977121E96','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('AECA5EA3-4425-49A2-BCAA767B22A538E7','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('BCA9BD9C-21D8-472C-97F4F9367F1B6253','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('BF06F9E3-6455-47FF-933E20A1A2B96526','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('C335019F-0E59-41FB-A225E9DE930B90D3','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('CB16CFBB-773F-40CA-8943D7378DF34077','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('D0F6F981-67B9-42FB-A26E8575ADAA59E3','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('D13B72F2-8E14-430A-B42014ADE2893E7B','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('D5B7BF72-485C-4A67-B134FDDCE5CAB228','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('D932693F-94D5-46DC-86A50A209366ADC2','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('DE162397-F4B7-4E7D-B88EBEEB2BE1D738','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('DE6EC9EE-F497-41CE-B965C2198A5C5125','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('E5A8C2DB-51BC-4B54-9A764C1EACDF3D87','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('E71FB230-E10D-42BE-92BCC390E734E9D7','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('EA3CD59D-DBA8-4356-970712840D1F05D4','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('F0B2AD4D-85ED-4CF0-90F729ED0F58E117','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('FF62B28C-D446-4D92-B38248CEFAC7FEB3','2D385E92-8555-49BC-ADA8C8ADAF15D250'),
	('019970DE-3AC3-4BF4-96923B73D6511922','439F57E4-877E-4104-A52E647E3B1F63A8'),
	('111B0F37-84D3-44E8-B4F19DC26C09B30D','439F57E4-877E-4104-A52E647E3B1F63A8'),
	('14013F22-472B-4CAA-9988AB93BDFBA8F8','439F57E4-877E-4104-A52E647E3B1F63A8'),
	('183D9D15-0C9C-4B90-98109B3835587DC4','439F57E4-877E-4104-A52E647E3B1F63A8'),
	('4A2AB9D4-5447-4A34-8AAD968F93CDB4BC','439F57E4-877E-4104-A52E647E3B1F63A8'),
	('4F8BF901-1005-48B2-837F44164A8F7DC8','439F57E4-877E-4104-A52E647E3B1F63A8'),
	('5B4A3907-30AD-4CCF-BA3B634DD73BDAAC','439F57E4-877E-4104-A52E647E3B1F63A8'),
	('5BAE1583-39B1-437A-8B8E4828402A0B81','439F57E4-877E-4104-A52E647E3B1F63A8'),
	('662D50A3-29F1-48FC-B27241665FFF0CD5','439F57E4-877E-4104-A52E647E3B1F63A8'),
	('691AB1AB-6CD3-4C99-BF3103B2E46FBFD0','439F57E4-877E-4104-A52E647E3B1F63A8'),
	('6AD47B8E-B1D3-4A86-B37E0310298E5E76','439F57E4-877E-4104-A52E647E3B1F63A8'),
	('786DE5B9-B9B3-41C3-B765845BC178EB46','439F57E4-877E-4104-A52E647E3B1F63A8'),
	('817DDE94-12F9-4AC2-AE0CEBA3908EB901','439F57E4-877E-4104-A52E647E3B1F63A8'),
	('89A7A9A9-583B-4B6E-88AC3E7F7765272C','439F57E4-877E-4104-A52E647E3B1F63A8'),
	('8CE00003-7044-4439-85EEF0BDBE903338','439F57E4-877E-4104-A52E647E3B1F63A8'),
	('9C5446DF-F069-4FC7-B9826EEE327F703F','439F57E4-877E-4104-A52E647E3B1F63A8'),
	('BCA9BD9C-21D8-472C-97F4F9367F1B6253','439F57E4-877E-4104-A52E647E3B1F63A8'),
	('BF06F9E3-6455-47FF-933E20A1A2B96526','439F57E4-877E-4104-A52E647E3B1F63A8'),
	('D5B7BF72-485C-4A67-B134FDDCE5CAB228','439F57E4-877E-4104-A52E647E3B1F63A8'),
	('D932693F-94D5-46DC-86A50A209366ADC2','439F57E4-877E-4104-A52E647E3B1F63A8'),
	('DE162397-F4B7-4E7D-B88EBEEB2BE1D738','439F57E4-877E-4104-A52E647E3B1F63A8'),
	('DE6EC9EE-F497-41CE-B965C2198A5C5125','439F57E4-877E-4104-A52E647E3B1F63A8'),
	('EA3CD59D-DBA8-4356-970712840D1F05D4','439F57E4-877E-4104-A52E647E3B1F63A8'),
	('662D50A3-29F1-48FC-B27241665FFF0CD5','2c9480838bb8cfb2018bb8dd975900d1'),
	('019970DE-3AC3-4BF4-96923B73D6511922','2c9480838bb8cfb2018bb8dd975900d1'),
	('DE6EC9EE-F497-41CE-B965C2198A5C5125','2c9480838bb8cfb2018bb8dd975900d1'),
	('691AB1AB-6CD3-4C99-BF3103B2E46FBFD0','2c9480838bb8cfb2018bb8dd975900d1'),
	('817DDE94-12F9-4AC2-AE0CEBA3908EB901','2c9480838bb8cfb2018bb8dd975900d1');

/*!40000 ALTER TABLE `cb_rolePermissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cb_securityRule
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_securityRule`;

CREATE TABLE `cb_securityRule` (
  `ruleID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `whitelist` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `securelist` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `match` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `roles` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `overrideEvent` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `useSSL` tinyint(1) NOT NULL DEFAULT '0',
  `action` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'redirect',
  `module` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `httpMethods` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '*',
  `allowedIPs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '*',
  `order` int NOT NULL DEFAULT '0',
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `messageType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'info',
  PRIMARY KEY (`ruleID`),
  KEY `idx_deleted` (`isDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cb_securityRule` WRITE;
/*!40000 ALTER TABLE `cb_securityRule` DISABLE KEYS */;

INSERT INTO `cb_securityRule` (`ruleID`, `createdDate`, `modifiedDate`, `isDeleted`, `whitelist`, `securelist`, `match`, `roles`, `permissions`, `redirect`, `overrideEvent`, `useSSL`, `action`, `module`, `httpMethods`, `allowedIPs`, `order`, `message`, `messageType`)
VALUES
	('2c9480838309dc9c018309dfc2dd00c9','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'','^contentbox-admin:modules\\..*','event','','MODULES_ADMIN','cbadmin/security/login','',0,'redirect','contentbox','*','*',1,'','info'),
	('2c9480838309dc9c018309dfc2f100ca','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'','^contentbox-admin:mediamanager\\..*','event','','MEDIAMANAGER_ADMIN','cbadmin/security/login','',0,'redirect','contentbox','*','*',1,'','info'),
	('2c9480838309dc9c018309dfc30500cb','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'','^contentbox-admin:versions\\.(remove)','event','','VERSIONS_DELETE','cbadmin/security/login','',0,'redirect','contentbox','*','*',1,'','info'),
	('2c9480838309dc9c018309dfc31c00cc','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'','^contentbox-admin:versions\\.(rollback)','event','','VERSIONS_ROLLBACK','cbadmin/security/login','',0,'redirect','contentbox','*','*',1,'','info'),
	('2c9480838309dc9c018309dfc32e00cd','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'','^contentbox-admin:widgets\\.(remove|upload|edit|save|create|doCreate)$','event','','WIDGET_ADMIN','cbadmin/security/login','',0,'redirect','contentbox','*','*',2,'','info'),
	('2c9480838309dc9c018309dfc34100ce','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'','^contentbox-admin:tools\\.(importer|doImport)','event','','TOOLS_IMPORT','cbadmin/security/login','',0,'redirect','contentbox','*','*',3,'','info'),
	('2c9480838309dc9c018309dfc35400cf','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'','^contentbox-admin:(settings|permissions|roles|securityRules)\\..*','event','','SYSTEM_TAB','cbadmin/security/login','',0,'redirect','contentbox','*','*',4,'','info'),
	('2c9480838309dc9c018309dfc36700d0','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'','^contentbox-admin:settings\\.save','event','','SYSTEM_SAVE_CONFIGURATION','cbadmin/security/login','',0,'redirect','contentbox','*','*',5,'','info'),
	('2c9480838309dc9c018309dfc37b00d1','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'','^contentbox-admin:settings\\.(raw|saveRaw|flushCache|flushSingletons|mappingDump|viewCached|remove)','event','','SYSTEM_RAW_SETTINGS','cbadmin/security/login','',0,'redirect','contentbox','*','*',6,'','info'),
	('2c9480838309dc9c018309dfc39000d2','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'','^contentbox-admin:securityRules\\.(remove|save|changeOrder|apply)','event','','SECURITYRULES_ADMIN','cbadmin/security/login','',0,'redirect','contentbox','*','*',7,'','info'),
	('2c9480838309dc9c018309dfc3a300d3','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'','^contentbox-admin:roles\\.(remove|removePermission|save|savePermission)','event','','ROLES_ADMIN','cbadmin/security/login','',0,'redirect','contentbox','*','*',8,'','info'),
	('2c9480838309dc9c018309dfc3b600d4','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'','^contentbox-admin:permissions\\.(remove|save)','event','','PERMISSIONS_ADMIN','cbadmin/security/login','',0,'redirect','contentbox','*','*',9,'','info'),
	('2c9480838309dc9c018309dfc3ca00d5','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'','^contentbox-admin:dashboard\\.reload','event','','RELOAD_MODULES','cbadmin/security/login','',0,'redirect','contentbox','*','*',10,'','info'),
	('2c9480838309dc9c018309dfc3dd00d6','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'','^contentbox-admin:pages\\.(changeOrder|remove)','event','','PAGES_ADMIN','cbadmin/security/login','',0,'redirect','contentbox','*','*',11,'','info'),
	('2c9480838309dc9c018309dfc3f000d7','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'','^contentbox-admin:themes\\.(remove|upload|rebuildRegistry|activate)','event','','THEME_ADMIN','cbadmin/security/login','',0,'redirect','contentbox','*','*',12,'','info'),
	('2c9480838309dc9c018309dfc40400d8','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'','^contentbox-admin:entries\\.(quickPost|remove)','event','','ENTRIES_ADMIN','cbadmin/security/login','',0,'redirect','contentbox','*','*',13,'','info'),
	('2c9480838309dc9c018309dfc41600d9','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'','^contentbox-admin:contentStore\\.(editor|remove|save)','event','','CONTENTSTORE_ADMIN','cbadmin/security/login','',0,'redirect','contentbox','*','*',14,'','info'),
	('2c9480838309dc9c018309dfc42b00da','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'','^contentbox-admin:comments\\.(doStatusUpdate|editor|moderate|remove|save|saveSettings)','event','','COMMENTS_ADMIN','cbadmin/security/login','',0,'redirect','contentbox','*','*',15,'','info'),
	('2c9480838309dc9c018309dfc43e00db','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'','^contentbox-admin:categories\\.(remove|save)','event','','CATEGORIES_ADMIN','cbadmin/security/login','',0,'redirect','contentbox','*','*',16,'','info'),
	('2c9480838309dc9c018309dfc45200dc','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'','^contentbox-admin:authors\\.(remove|removePermission|savePermission|doPasswordReset|new|doNew)','event','','AUTHOR_ADMIN','cbadmin/security/login','',0,'redirect','contentbox','*','*',17,'','info'),
	('2c9480838309dc9c018309dfc46700dd','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'^contentbox-admin:security\\.','^contentbox-admin:.*','event','','CONTENTBOX_ADMIN','cbadmin/security/login','',0,'redirect','contentbox','*','*',18,'','info'),
	('2c9480838309dc9c018309dfc47c00de','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'','^contentbox-filebrowser:.*','event','','MEDIAMANAGER_ADMIN','cbadmin/security/login','',0,'redirect','contentbox','*','*',19,'','info'),
	('2c9480838309dc9c018309dfc49200df','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'','^contentbox-admin:(authors|categories|permissions|roles|settings|pages|entries|contentStore|securityrules)\\.importAll$','event','','TOOLS_IMPORT','cbadmin/security/login','',0,'redirect','contentbox','*','*',20,'','info'),
	('2c9480838309dc9c018309dfc4a900e0','2022-09-04 19:00:03','2022-09-04 19:00:03',0,'','^contentbox-admin:(authors|categories|permissions|roles|settings|pages|entries|contentStore|securityrules)\\.(export|exportAll)$','event','','TOOLS_EXPORT','cbadmin/security/login','',0,'redirect','contentbox','*','*',20,'','info');

/*!40000 ALTER TABLE `cb_securityRule` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cb_setting
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_setting`;

CREATE TABLE `cb_setting` (
  `settingID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `isCore` tinyint(1) NOT NULL DEFAULT '0',
  `FK_siteID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`settingID`),
  KEY `fk_cb_setting_FK_siteID` (`FK_siteID`),
  KEY `idx_core` (`isCore`),
  KEY `idx_deleted` (`isDeleted`),
  CONSTRAINT `fk_cb_setting_FK_siteID` FOREIGN KEY (`FK_siteID`) REFERENCES `cb_site` (`siteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cb_setting` WRITE;
/*!40000 ALTER TABLE `cb_setting` DISABLE KEYS */;

INSERT INTO `cb_setting` (`settingID`, `createdDate`, `modifiedDate`, `isDeleted`, `name`, `value`, `isCore`, `FK_siteID`)
VALUES
	('2c9480838309dc9c018309dfd04d012f','2022-09-04 19:00:06','2022-09-04 19:00:06',0,'cb_active','true',0,NULL),
	('2c9480838bb8cfb2018bb8d0278a0000','2023-11-10 10:38:51','2023-11-10 10:38:51',0,'cb_security_login_blocker','true',1,NULL),
	('2c9480838bb8cfb2018bb8d027c20001','2023-11-10 10:38:51','2023-11-10 10:38:51',0,'cb_media_allowDelete','true',1,NULL),
	('2c9480838bb8cfb2018bb8d027d50002','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_security_login_signin_text','',1,NULL),
	('2c9480838bb8cfb2018bb8d027de0003','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_versions_max_history','',1,NULL),
	('2c9480838bb8cfb2018bb8d027e60004','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_security_rate_limiter_duration','1',1,NULL),
	('2c9480838bb8cfb2018bb8d027f10005','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_rss_description','ContentBox RSS Feed',1,NULL),
	('2c9480838bb8cfb2018bb8d027f80006','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_media_html5uploads_maxFiles','25',1,NULL),
	('2c9480838bb8cfb2018bb8d028030007','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_site_mail_password','',1,NULL),
	('2c9480838bb8cfb2018bb8d0280d0008','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_rss_cacheName','Template',1,NULL),
	('2c9480838bb8cfb2018bb8d028150009','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_editors_markup','HTML',1,NULL),
	('2c9480838bb8cfb2018bb8d02820000a','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_content_cacheName','Template',1,NULL),
	('2c9480838bb8cfb2018bb8d02832000b','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_editors_ckeditor_toolbar','[\n		{ \"name\": \"document\",    \"items\" : [ \"Source\",\"-\",\"Maximize\",\"ShowBlocks\" ] },\n		{ \"name\": \"clipboard\",   \"items\" : [ \"Cut\",\"Copy\",\"Paste\",\"PasteText\",\"PasteFromWord\",\"-\",\"Undo\",\"Redo\" ] },\n		{ \"name\": \"editing\",     \"items\" : [ \"Find\",\"Replace\",\"SpellChecker\"] },\n		{ \"name\": \"forms\",       \"items\" : [ \"Form\", \"Checkbox\", \"Radio\", \"TextField\", \"Textarea\", \"Select\", \"Button\",\"HiddenField\" ] },\n		\"/\",\n		{ \"name\": \"basicstyles\", \"items\" : [ \"Bold\",\"Italic\",\"Underline\",\"Strike\",\"Subscript\",\"Superscript\",\"-\",\"RemoveFormat\" ] },\n		{ \"name\": \"paragraph\",   \"items\" : [ \"NumberedList\",\"BulletedList\",\"-\",\"Outdent\",\"Indent\",\"-\",\"Blockquote\",\"CreateDiv\",\"-\",\"JustifyLeft\",\"JustifyCenter\",\"JustifyRight\",\"JustifyBlock\",\"-\",\"BidiLtr\",\"BidiRtl\" ] },\n		{ \"name\": \"links\",       \"items\" : [ \"Link\",\"Unlink\",\"Anchor\" ] },\n		\"/\",\n		{ \"name\": \"styles\",      \"items\" : [ \"Styles\",\"Format\" ] },\n		{ \"name\": \"colors\",      \"items\" : [ \"TextColor\",\"BGColor\" ] },\n		{ \"name\": \"insert\",      \"items\" : [ \"Image\",\"Table\",\"HorizontalRule\",\"Smiley\",\"SpecialChar\",\"Iframe\",\"InsertPre\"] },\n		{ \"name\": \"contentbox\",  \"items\" : [ \"MediaEmbed\",\"cbIpsumLorem\",\"cbWidgets\",\"cbContentStore\",\"cbLinks\",\"cbEntryLinks\" ] }\n		]',1,NULL),
	('2c9480838bb8cfb2018bb8d0284f000c','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_security_rate_limiter_logging','true',1,NULL),
	('2c9480838bb8cfb2018bb8d02862000d','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_site_settings_cache','template',1,NULL),
	('2c9480838bb8cfb2018bb8d0286c000e','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_versions_commit_mandatory','false',1,NULL),
	('2c9480838bb8cfb2018bb8d0287f000f','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_notify_page','true',1,NULL),
	('2c9480838bb8cfb2018bb8d028870010','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_site_mail_username','',1,NULL),
	('2c9480838bb8cfb2018bb8d028920011','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_rss_webmaster','',1,NULL),
	('2c9480838bb8cfb2018bb8d028ab0012','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_rss_title','RSS Feed by ContentBox',1,NULL),
	('2c9480838bb8cfb2018bb8d028c10013','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_media_acceptMimeTypes','',1,NULL),
	('2c9480838bb8cfb2018bb8d028ca0014','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_notify_author','true',1,NULL),
	('2c9480838bb8cfb2018bb8d028d50015','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_dashboard_welcome_title','Dashboard',1,NULL),
	('2c9480838bb8cfb2018bb8d028de0016','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_page_excerpts','true',1,NULL),
	('2c9480838bb8cfb2018bb8d028e70017','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_site_outgoingEmail','info@contentbox.org',1,NULL),
	('2c9480838bb8cfb2018bb8d028ee0018','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_dashboard_newsfeed','https://www.ortussolutions.com/blog/rss',1,NULL),
	('2c9480838bb8cfb2018bb8d028f40019','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_media_createFolders','true',1,NULL),
	('2c9480838bb8cfb2018bb8d028fc001a','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_security_min_password_length','8',1,NULL),
	('2c9480838bb8cfb2018bb8d02904001b','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_dashboard_newsfeed_count','5',1,NULL),
	('2c9480838bb8cfb2018bb8d0290a001c','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_rss_cachingTimeout','60',1,NULL),
	('2c9480838bb8cfb2018bb8d02916001d','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_content_cachingTimeoutIdle','15',1,NULL),
	('2c9480838bb8cfb2018bb8d02925001e','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_media_html5uploads_maxFileSize','100',1,NULL),
	('2c9480838bb8cfb2018bb8d02937001f','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_salt','D124CB584B2B1FDC91F9246C37F60959C88E63FAF15AC736B2EE924ACF97D90C011F8F1E983D8B1B73CFE676938990D49ED12672FAADFB4F6DFE9D53E8E2DEB3',1,NULL),
	('2c9480838bb8cfb2018bb8d029450020','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_site_mail_server','',1,NULL),
	('2c9480838bb8cfb2018bb8d029500021','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_media_quickViewWidth','400',1,NULL),
	('2c9480838bb8cfb2018bb8d029570022','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_security_2factorAuth_trusted_days','30',1,NULL),
	('2c9480838bb8cfb2018bb8d029630023','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_rss_generator','ContentBox by Ortus Solutions',1,NULL),
	('2c9480838bb8cfb2018bb8d0296d0024','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_content_bot_regex','Google|msnbot|Rambler|Yahoo|AbachoBOT|accoona|AcioRobot|ASPSeek|CocoCrawler|Dumbot|FAST-WebCrawler|GeonaBot|Gigabot|Lycos|MSRBOT|Scooter|AltaVista|IDBot|eStyle|Scrubby',1,NULL),
	('2c9480838bb8cfb2018bb8d0298b0025','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_editors_ckeditor_excerpt_toolbar','[\n		{ \"name\": \"document\",    \"items\" : [ \"Source\",\"-\",\"Maximize\",\"ShowBlocks\" ] },\n		{ \"name\": \"basicstyles\", \"items\" : [ \"Bold\",\"Italic\",\"Underline\",\"Strike\",\"Subscript\",\"Superscript\"] },\n		{ \"name\": \"paragraph\",   \"items\" : [ \"NumberedList\",\"BulletedList\",\"-\",\"Outdent\",\"Indent\",\"CreateDiv\"] },\n		{ \"name\": \"links\",       \"items\" : [ \"Link\",\"Unlink\",\"Anchor\" ] },\n		{ \"name\": \"insert\",      \"items\" : [ \"Image\",\"Flash\",\"Table\",\"HorizontalRule\",\"Smiley\",\"SpecialChar\" ] },\n		{ \"name\": \"contentbox\",  \"items\" : [ \"MediaEmbed\",\"cbIpsumLorem\",\"cbWidgets\",\"cbContentStore\",\"cbLinks\",\"cbEntryLinks\" ] }\n		]',1,NULL),
	('2c9480838bb8cfb2018bb8d0299f0026','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_security_blocktime','5',1,NULL),
	('2c9480838bb8cfb2018bb8d029aa0027','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_contentstore_caching','true',1,NULL),
	('2c9480838bb8cfb2018bb8d029b40028','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_gravatar_rating','PG',1,NULL),
	('2c9480838bb8cfb2018bb8d029c30029','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_site_maintenance_message','<h1>This site is down for maintenance.<br /> Please check back again soon.</h1>',1,NULL),
	('2c9480838bb8cfb2018bb8d029cb002a','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_admin_theme','contentbox-default',1,NULL),
	('2c9480838bb8cfb2018bb8d029d4002b','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_dashboard_recentcontentstore','5',1,NULL),
	('2c9480838bb8cfb2018bb8d029de002c','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_content_cachingTimeout','60',1,NULL),
	('2c9480838bb8cfb2018bb8d029e7002d','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_security_login_signout_url','',1,NULL),
	('2c9480838bb8cfb2018bb8d029f5002e','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_site_mail_ssl','false',1,NULL),
	('2c9480838bb8cfb2018bb8d029fc002f','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_paging_bandgap','5',1,NULL),
	('2c9480838bb8cfb2018bb8d02a0a0030','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_rss_maxComments','10',1,NULL),
	('2c9480838bb8cfb2018bb8d02a1e0031','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_security_rate_limiter','true',1,NULL),
	('2c9480838bb8cfb2018bb8d02a2e0032','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_media_allowDownloads','true',1,NULL),
	('2c9480838bb8cfb2018bb8d02a440033','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_content_caching','true',1,NULL),
	('2c9480838bb8cfb2018bb8d02a630034','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_content_hit_ignore_bots','false',1,NULL),
	('2c9480838bb8cfb2018bb8d02a7d0035','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_rss_copyright','Ortus Solutions, Corp (www.ortussolutions.com)',1,NULL),
	('2c9480838bb8cfb2018bb8d02a980036','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_site_maintenance','false',1,NULL),
	('2c9480838bb8cfb2018bb8d02a9b0037','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_rss_cachingTimeoutIdle','15',1,NULL),
	('2c9480838bb8cfb2018bb8d02abf0038','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_admin_ssl','false',1,NULL),
	('2c9480838bb8cfb2018bb8d02acf0039','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_paging_maxentries','10',1,NULL),
	('2c9480838bb8cfb2018bb8d02ae4003a','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_dashboard_recentComments','5',1,NULL),
	('2c9480838bb8cfb2018bb8d02aec003b','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_security_latest_logins','10',1,NULL),
	('2c9480838bb8cfb2018bb8d02b00003c','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_content_cachingHeader','true',1,NULL),
	('2c9480838bb8cfb2018bb8d02b10003d','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_search_adapter','contentbox.models.search.DBSearch',1,NULL),
	('2c9480838bb8cfb2018bb8d02b1f003e','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_security_password_reset_expiration','60',1,NULL),
	('2c9480838bb8cfb2018bb8d02b5e003f','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_notify_entry','true',1,NULL),
	('2c9480838bb8cfb2018bb8d02b710040','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_site_mail_smtp','25',1,NULL),
	('2c9480838bb8cfb2018bb8d02b7d0041','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_security_rate_limiter_message','<p>You are making too many requests too fast, please slow down and wait {duration} seconds</p>',1,NULL),
	('2c9480838bb8cfb2018bb8d02b8b0042','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_security_2factorAuth_force','false',1,NULL),
	('2c9480838bb8cfb2018bb8d02b940043','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_paging_maxrows','20',1,NULL),
	('2c9480838bb8cfb2018bb8d02b9c0044','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_security_rate_limiter_count','4',1,NULL),
	('2c9480838bb8cfb2018bb8d02ba30045','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_security_max_attempts','5',1,NULL),
	('2c9480838bb8cfb2018bb8d02ba70046','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_admin_quicksearch_max','5',1,NULL),
	('2c9480838bb8cfb2018bb8d02bac0047','2023-11-10 10:38:52','2023-11-10 10:38:52',0,'cb_comments_whoisURL','http://whois.arin.net/ui/query.do?q',1,NULL),
	('2c9480838bb8cfb2018bb8d02bbf0048','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_security_2factorAuth_provider','email',1,NULL),
	('2c9480838bb8cfb2018bb8d02bca0049','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_security_max_auth_logs','500',1,NULL),
	('2c9480838bb8cfb2018bb8d02bd6004a','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_dashboard_recentPages','5',1,NULL),
	('2c9480838bb8cfb2018bb8d02beb004b','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_editors_default','ckeditor',1,NULL),
	('2c9480838bb8cfb2018bb8d02bf6004c','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_site_mail_tls','false',1,NULL),
	('2c9480838bb8cfb2018bb8d02c01004d','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_version','6.0.0-snapshot',1,NULL),
	('2c9480838bb8cfb2018bb8d02c08004e','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_media_provider','CFContentMediaProvider',1,NULL),
	('2c9480838bb8cfb2018bb8d02c0e004f','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_gravatar_display','true',1,NULL),
	('2c9480838bb8cfb2018bb8d02c190050','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_editors_ckeditor_extraplugins','cbKeyBinding,cbWidgets,cbLinks,cbEntryLinks,cbContentStore,cbIpsumLorem,wsc,mediaembed,insertpre,justify,colorbutton,showblocks,find,div,smiley,specialchar,iframe',1,NULL),
	('2c9480838bb8cfb2018bb8d02c270051','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_site_email','info@contentbox.org',1,NULL),
	('2c9480838bb8cfb2018bb8d02c2c0052','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_notify_contentstore','true',1,NULL),
	('2c9480838bb8cfb2018bb8d02c370053','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_paging_maxRSSComments','10',1,NULL),
	('2c9480838bb8cfb2018bb8d02c3d0054','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_media_provider_caching','true',1,NULL),
	('2c9480838bb8cfb2018bb8d02c400055','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_site_blog_entrypoint','blog',1,NULL),
	('2c9480838bb8cfb2018bb8d02c4d0056','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_media_allowUploads','true',1,NULL),
	('2c9480838bb8cfb2018bb8d02c5e0057','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_dashboard_welcome_body','',1,NULL),
	('2c9480838bb8cfb2018bb8d02c660058','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_media_directoryRoot','/contentbox-custom/_content',1,NULL),
	('2c9480838bb8cfb2018bb8d02c6e0059','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_search_maxResults','20',1,NULL),
	('2c9480838bb8cfb2018bb8d02c7a005a','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_security_rate_limiter_bots_only','true',1,NULL),
	('2c9480838bb8cfb2018bb8d02c88005b','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_content_uiexport','true',1,NULL),
	('2c9480838bb8cfb2018bb8d02c94005c','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_entry_caching','true',1,NULL),
	('2c9480838bb8cfb2018bb8d02ca4005d','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_content_hit_count','true',1,NULL),
	('2c9480838bb8cfb2018bb8d02cd7005e','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_rss_caching','true',1,NULL),
	('2c9480838bb8cfb2018bb8d02cf5005f','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_security_rate_limiter_redirectURL','',1,NULL),
	('2c9480838bb8cfb2018bb8d02d090060','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_dashboard_recentEntries','5',1,NULL),
	('2c9480838bb8cfb2018bb8d02d130061','2023-11-10 10:38:53','2023-11-10 10:38:53',0,'cb_rss_maxEntries','10',1,NULL),
	('2c9480838bb8cfb2018bb8d0309f0062','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_comments_moderation_blacklist','',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d030b20063','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_preArchivesDisplay','',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d030be0064','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_comments_enabled','true',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d030d70065','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_prePageDisplay','',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d030ec0066','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_postCommentForm','',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d030f80067','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_afterContent','',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d031010068','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_postIndexDisplay','',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d0310b0069','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_comments_notify','true',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d03119006a','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_comments_moderation_blockedlist','',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d03131006b','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_beforeContent','',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d0313b006c','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_postArchivesDisplay','',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d03150006d','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_afterBodyStart','',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d03168006e','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_comments_notifyemails','',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d03195006f','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_preIndexDisplay','',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d031a50070','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_afterFooter','',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d031b20071','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_beforeHeadEnd','',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d031c60072','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_afterSideBar','',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d032150073','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_comments_moderation','true',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d0322c0074','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_preEntryDisplay','',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d032380075','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_postPageDisplay','',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d032460076','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_postEntryDisplay','',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d032520077','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_comments_moderation_whitelist','true',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d0325e0078','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_comments_maxDisplayChars','500',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d0326a0079','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_beforeBodyEnd','',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d03276007a','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_comments_moderation_expiration','30',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d03280007b','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_comments_moderation_notify','true',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d03288007c','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_beforeSideBar','',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d03291007d','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_preCommentForm','',1,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d032b0007e','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_comments_moderation_blacklist','',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d032b9007f','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_preArchivesDisplay','',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d032c10080','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_comments_enabled','true',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d032cb0081','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_prePageDisplay','',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d032d40082','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_postCommentForm','',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d032e20083','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_afterContent','',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d032ee0084','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_postIndexDisplay','',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d032f70085','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_comments_notify','true',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d032fe0086','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_comments_moderation_blockedlist','',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d033050087','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_beforeContent','',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d0330b0088','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_postArchivesDisplay','',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d033330089','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_afterBodyStart','',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d03341008a','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_comments_notifyemails','',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d03352008b','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_preIndexDisplay','',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d0337e008c','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_afterFooter','',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d0338b008d','2023-11-10 10:38:54','2023-11-10 10:38:54',0,'cb_html_beforeHeadEnd','',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d0339e008e','2023-11-10 10:38:55','2023-11-10 10:38:55',0,'cb_html_afterSideBar','',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d033b6008f','2023-11-10 10:38:55','2023-11-10 10:38:55',0,'cb_comments_moderation','true',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d033c10090','2023-11-10 10:38:55','2023-11-10 10:38:55',0,'cb_html_preEntryDisplay','',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d033f00091','2023-11-10 10:38:55','2023-11-10 10:38:55',0,'cb_html_postPageDisplay','',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d034030092','2023-11-10 10:38:55','2023-11-10 10:38:55',0,'cb_html_postEntryDisplay','',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d034130093','2023-11-10 10:38:55','2023-11-10 10:38:55',0,'cb_comments_moderation_whitelist','true',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d034210094','2023-11-10 10:38:55','2023-11-10 10:38:55',0,'cb_comments_maxDisplayChars','500',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d0343b0095','2023-11-10 10:38:55','2023-11-10 10:38:55',0,'cb_html_beforeBodyEnd','',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d034460096','2023-11-10 10:38:55','2023-11-10 10:38:55',0,'cb_comments_moderation_expiration','30',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d034570097','2023-11-10 10:38:55','2023-11-10 10:38:55',0,'cb_comments_moderation_notify','true',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d034620098','2023-11-10 10:38:55','2023-11-10 10:38:55',0,'cb_html_beforeSideBar','',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d0346e0099','2023-11-10 10:38:55','2023-11-10 10:38:55',0,'cb_html_preCommentForm','',1,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04834009b','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_cbBootswatchTheme','green',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d0483b009c','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_overrideHeaderColors','false',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d0484b009d','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_overrideHeaderBGColor','',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d0485d009e','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_overrideHeaderTextColor','',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d04871009f','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_cssStyleOverrides','',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d0487500a0','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_headerLogo','',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d0488100a1','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_showSiteSearch','true',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d048a300a2','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_footerBox','',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d048ad00a3','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_hpHeaderTitle','',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d048b100a4','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_hpHeaderText','',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d048b700a5','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_hpHeaderLink','',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d048bc00a6','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_hpHeaderBtnText','',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d048c400a7','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_hpHeaderBtnStyle','primary',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d048d100a8','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_hpHeaderBg','green',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d048d500a9','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_hpHeaderImgBg','',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d048db00aa','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_hpHeaderBgPos','Top Center',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d048e700ab','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_hpHeaderBgPaddingTop','100px',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d048ea00ac','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_hpHeaderBgPaddingBottom','50px',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d048ee00ad','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_rssDiscovery','true',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d048f000ae','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_showCategoriesBlogSide','true',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d048f500af','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_showRecentEntriesBlogSide','true',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d048f900b0','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_showSiteUpdatesBlogSide','true',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d0490500b1','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_showEntryCommentsBlogSide','true',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d0490f00b2','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_showArchivesBlogSide','true',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d0491800b3','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_showEntriesSearchBlogSide','true',0,'2c9480838309dc9c018309dfb74e00af'),
	('2c9480838bb8cfb2018bb8d04aba00b4','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_cbBootswatchTheme','green',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04ac500b5','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_overrideHeaderColors','false',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04ac800b6','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_overrideHeaderBGColor','',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04ad300b7','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_overrideHeaderTextColor','',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04afc00b8','2023-11-10 10:39:00','2023-11-10 10:39:00',0,'cb_theme_default_cssStyleOverrides','',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04b1f00b9','2023-11-10 10:39:01','2023-11-10 10:39:01',0,'cb_theme_default_headerLogo','',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04b2900ba','2023-11-10 10:39:01','2023-11-10 10:39:01',0,'cb_theme_default_showSiteSearch','true',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04b4200bb','2023-11-10 10:39:01','2023-11-10 10:39:01',0,'cb_theme_default_footerBox','',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04b5000bc','2023-11-10 10:39:01','2023-11-10 10:39:01',0,'cb_theme_default_hpHeaderTitle','',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04b6000bd','2023-11-10 10:39:01','2023-11-10 10:39:01',0,'cb_theme_default_hpHeaderText','',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04b6c00be','2023-11-10 10:39:01','2023-11-10 10:39:01',0,'cb_theme_default_hpHeaderLink','',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04b7200bf','2023-11-10 10:39:01','2023-11-10 10:39:01',0,'cb_theme_default_hpHeaderBtnText','',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04b7a00c0','2023-11-10 10:39:01','2023-11-10 10:39:01',0,'cb_theme_default_hpHeaderBtnStyle','primary',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04b7d00c1','2023-11-10 10:39:01','2023-11-10 10:39:01',0,'cb_theme_default_hpHeaderBg','green',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04b8a00c2','2023-11-10 10:39:01','2023-11-10 10:39:01',0,'cb_theme_default_hpHeaderImgBg','',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04b9700c3','2023-11-10 10:39:01','2023-11-10 10:39:01',0,'cb_theme_default_hpHeaderBgPos','Top Center',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04b9c00c4','2023-11-10 10:39:01','2023-11-10 10:39:01',0,'cb_theme_default_hpHeaderBgPaddingTop','100px',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04b9f00c5','2023-11-10 10:39:01','2023-11-10 10:39:01',0,'cb_theme_default_hpHeaderBgPaddingBottom','50px',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04ba800c6','2023-11-10 10:39:01','2023-11-10 10:39:01',0,'cb_theme_default_rssDiscovery','true',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04bb100c7','2023-11-10 10:39:01','2023-11-10 10:39:01',0,'cb_theme_default_showCategoriesBlogSide','true',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04bce00c8','2023-11-10 10:39:01','2023-11-10 10:39:01',0,'cb_theme_default_showRecentEntriesBlogSide','true',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04c2900c9','2023-11-10 10:39:01','2023-11-10 10:39:01',0,'cb_theme_default_showSiteUpdatesBlogSide','true',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04c3100ca','2023-11-10 10:39:01','2023-11-10 10:39:01',0,'cb_theme_default_showEntryCommentsBlogSide','true',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04c3500cb','2023-11-10 10:39:01','2023-11-10 10:39:01',0,'cb_theme_default_showArchivesBlogSide','true',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d04c3c00cc','2023-11-10 10:39:01','2023-11-10 10:39:01',0,'cb_theme_default_showEntriesSearchBlogSide','true',0,'2c9480838309dc9c018309dfcbbe0109'),
	('2c9480838bb8cfb2018bb8d156d600cd','2023-11-10 10:40:09','2023-11-10 10:40:09',0,'cb_enc_key','nFWVC5ljC6hk4YekQl8Wcw==',0,NULL);

/*!40000 ALTER TABLE `cb_setting` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cb_site
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_site`;

CREATE TABLE `cb_site` (
  `siteID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `domainRegex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tagline` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `homepage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isBlogEnabled` tinyint(1) NOT NULL DEFAULT '1',
  `isSitemapEnabled` tinyint(1) NOT NULL DEFAULT '1',
  `poweredByHeader` tinyint(1) NOT NULL DEFAULT '1',
  `adminBar` tinyint(1) NOT NULL DEFAULT '1',
  `isSSL` tinyint(1) NOT NULL DEFAULT '0',
  `activeTheme` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notificationEmails` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `notifyOnEntries` tinyint(1) NOT NULL DEFAULT '1',
  `notifyOnPages` tinyint(1) NOT NULL DEFAULT '1',
  `notifyOnContentStore` tinyint(1) NOT NULL DEFAULT '1',
  `domain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `mediaDisk` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `domainAliases` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`siteID`),
  UNIQUE KEY `slug` (`slug`),
  KEY `idx_siteSlug` (`slug`),
  KEY `idx_deleted` (`isDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cb_site` WRITE;
/*!40000 ALTER TABLE `cb_site` DISABLE KEYS */;

INSERT INTO `cb_site` (`siteID`, `createdDate`, `modifiedDate`, `isDeleted`, `name`, `slug`, `description`, `domainRegex`, `keywords`, `tagline`, `homepage`, `isBlogEnabled`, `isSitemapEnabled`, `poweredByHeader`, `adminBar`, `isSSL`, `activeTheme`, `notificationEmails`, `notifyOnEntries`, `notifyOnPages`, `notifyOnContentStore`, `domain`, `isActive`, `mediaDisk`, `domainAliases`)
VALUES
	('2c9480838309dc9c018309dfb74e00af','2022-09-04 18:59:59','2023-11-10 10:50:06',0,'Headless ContentBox','default','This manages all of our headless content','127\\.0\\.0\\.1','','A Magical Headless CMS ','cbBlog',1,1,1,1,0,'default','esme@ortussolutions.com',1,1,1,'127.0.0.1',1,'contentbox','[]'),
	('2c9480838309dc9c018309dfcbbe0109','2022-09-04 19:00:04','2022-09-04 19:00:04',0,'Development Site','development','A development site','localhost','','','cbBlog',1,1,1,1,0,'default','esme@ortussolutions.com',1,1,1,'localhost',1,NULL,'[]');

/*!40000 ALTER TABLE `cb_site` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cb_stats
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_stats`;

CREATE TABLE `cb_stats` (
  `statsID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `hits` bigint NOT NULL DEFAULT '0',
  `FK_contentID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`statsID`),
  KEY `fk_cb_stats_FK_contentID` (`FK_contentID`),
  KEY `idx_deleted` (`isDeleted`),
  CONSTRAINT `fk_cb_stats_FK_contentID` FOREIGN KEY (`FK_contentID`) REFERENCES `cb_content` (`contentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table cb_subscribers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_subscribers`;

CREATE TABLE `cb_subscribers` (
  `subscriberID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `subscriberEmail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subscriberToken` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`subscriberID`),
  KEY `idx_subscriberEmail` (`subscriberEmail`),
  KEY `idx_deleted` (`isDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table cb_subscriptions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cb_subscriptions`;

CREATE TABLE `cb_subscriptions` (
  `subscriptionID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subscriptionToken` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FK_subscriberID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`subscriptionID`),
  KEY `fk_cb_subscriptions_FK_subscriberID` (`FK_subscriberID`),
  KEY `idx_deleted` (`isDeleted`),
  CONSTRAINT `fk_cb_subscriptions_FK_subscriberID` FOREIGN KEY (`FK_subscriberID`) REFERENCES `cb_subscribers` (`subscriberID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table cbsecurity_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cbsecurity_logs`;

CREATE TABLE `cbsecurity_logs` (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `securityRule` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `blockType` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `httpMethod` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queryString` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `referer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `userAgent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `userId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cbsecurity` (`logDate`,`action`,`blockType`),
  KEY `idx_cbsecurity_userId` (`userId`),
  KEY `idx_cbsecurity_userAgent` (`userAgent`),
  KEY `idx_cbsecurity_ip` (`ip`),
  KEY `idx_cbsecurity_host` (`host`),
  KEY `idx_cbsecurity_httpMethod` (`httpMethod`),
  KEY `idx_cbsecurity_path` (`path`),
  KEY `idx_cbsecurity_referer` (`referer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table cfmigrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cfmigrations`;

CREATE TABLE `cfmigrations` (
  `name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `migration_ran` datetime NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cfmigrations` WRITE;
/*!40000 ALTER TABLE `cfmigrations` DISABLE KEYS */;

INSERT INTO `cfmigrations` (`name`, `migration_ran`)
VALUES
	('2020_01_01_150933_init','2023-11-10 11:29:25'),
	('2020_08_24_150933_v5Upgrade','2023-11-10 11:29:25'),
	('2022_03_07_155812_v5_1_0_page_sslonly_removals','2023-11-10 11:29:25'),
	('2022_04_20_143337_v5_3_0_deprecateMobileLayout','2023-11-10 11:29:25'),
	('2022_05_27_133613_v_5_3_0_CONTENTBOX-1437-Drop-cacheLayout-Column','2023-11-10 11:29:25'),
	('2022_08_05_153052_v_5_3_0_EditorsCanPublishNow','2023-11-10 11:29:25'),
	('2022_10_13_133204_v_6_0_0_Unique-Site-Slug-Relocation','2023-11-10 11:29:26'),
	('2022_10_14_173737_v_6_0_0_Slow-Admin-Search','2023-11-10 11:29:26'),
	('2022_11_17_234941_v_6_0_0_SecurityRules-cbsecurity3','2023-11-10 11:29:26'),
	('2022_11_23_142439_v_6_0_0_Convert-Featured-cbfs','2023-11-10 11:29:26'),
	('2022_11_23_144748_v_6_0_0_Add-Site-Disk','2023-11-10 11:29:26'),
	('2023_07_13_092814_v_6_0_0_ContentTemplates','2023-11-10 11:29:26'),
	('2023_10_18_173527_v_6_0_0_SiteDomainAliases','2023-11-10 11:29:26');

/*!40000 ALTER TABLE `cfmigrations` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

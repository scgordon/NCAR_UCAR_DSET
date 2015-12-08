-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: zith9
-- ------------------------------------------------------
-- Server version	5.1.73

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `zith9`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `zith9` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `zith9`;

--
-- Table structure for table `catalog_forecast`
--

DROP TABLE IF EXISTS `catalog_forecast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_forecast` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `begin_date` date NOT NULL DEFAULT '1000-01-01',
  `end_date` date NOT NULL DEFAULT '1000-01-01',
  `cell_hours_span` int(11) NOT NULL DEFAULT '1',
  `row_version` int(11) unsigned NOT NULL DEFAULT '0',
  `row_create_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_create_time` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `row_revise_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_revise_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  KEY `row_create_contact_id` (`row_create_contact_id`),
  KEY `row_revise_contact_id` (`row_revise_contact_id`),
  CONSTRAINT `catalog_forecast_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `catalog_forecast_ibfk_88` FOREIGN KEY (`row_create_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `catalog_forecast_ibfk_99` FOREIGN KEY (`row_revise_contact_id`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_forecast_datum`
--

DROP TABLE IF EXISTS `catalog_forecast_datum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_forecast_datum` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `forecast_id` int(11) unsigned NOT NULL DEFAULT '0',
  `forecast_subject_id` int(11) unsigned NOT NULL DEFAULT '0',
  `forecast_outlook_id` int(11) unsigned NOT NULL DEFAULT '0',
  `outlook_datetime` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `row_version` int(11) unsigned NOT NULL DEFAULT '0',
  `row_create_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_create_time` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `row_revise_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_revise_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `forecast_id` (`forecast_id`),
  KEY `forecast_subject_id` (`forecast_subject_id`),
  KEY `forecast_outlook_id` (`forecast_outlook_id`),
  KEY `row_create_contact_id` (`row_create_contact_id`),
  KEY `row_revise_contact_id` (`row_revise_contact_id`),
  CONSTRAINT `catalog_forecast_datum_ibfk_1` FOREIGN KEY (`forecast_id`) REFERENCES `catalog_forecast` (`id`),
  CONSTRAINT `catalog_forecast_datum_ibfk_2` FOREIGN KEY (`forecast_subject_id`) REFERENCES `catalog_forecast_subject` (`id`),
  CONSTRAINT `catalog_forecast_datum_ibfk_3` FOREIGN KEY (`forecast_outlook_id`) REFERENCES `catalog_forecast_outlook` (`id`),
  CONSTRAINT `catalog_forecast_datum_ibfk_88` FOREIGN KEY (`row_create_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `catalog_forecast_datum_ibfk_99` FOREIGN KEY (`row_revise_contact_id`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_forecast_forecast_outlook`
--

DROP TABLE IF EXISTS `catalog_forecast_forecast_outlook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_forecast_forecast_outlook` (
  `forecast_id` int(11) unsigned NOT NULL DEFAULT '0',
  `forecast_outlook_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`forecast_id`,`forecast_outlook_id`),
  KEY `forecast_outlook_id` (`forecast_outlook_id`),
  CONSTRAINT `catalog_forecast_forecast_outlook_ibfk_1` FOREIGN KEY (`forecast_id`) REFERENCES `catalog_forecast` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `catalog_forecast_forecast_outlook_ibfk_2` FOREIGN KEY (`forecast_outlook_id`) REFERENCES `catalog_forecast_outlook` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_forecast_forecast_subject`
--

DROP TABLE IF EXISTS `catalog_forecast_forecast_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_forecast_forecast_subject` (
  `forecast_id` int(11) unsigned NOT NULL DEFAULT '0',
  `forecast_subject_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`forecast_id`,`forecast_subject_id`),
  KEY `forecast_subject_id` (`forecast_subject_id`),
  CONSTRAINT `catalog_forecast_forecast_subject_ibfk_1` FOREIGN KEY (`forecast_id`) REFERENCES `catalog_forecast` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `catalog_forecast_forecast_subject_ibfk_2` FOREIGN KEY (`forecast_subject_id`) REFERENCES `catalog_forecast_subject` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_forecast_outlook`
--

DROP TABLE IF EXISTS `catalog_forecast_outlook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_forecast_outlook` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `color` varchar(255) NOT NULL DEFAULT '',
  `row_version` int(11) unsigned NOT NULL DEFAULT '0',
  `row_create_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_create_time` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `row_revise_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_revise_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `row_create_contact_id` (`row_create_contact_id`),
  KEY `row_revise_contact_id` (`row_revise_contact_id`),
  CONSTRAINT `catalog_forecast_outlook_ibfk_88` FOREIGN KEY (`row_create_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `catalog_forecast_outlook_ibfk_99` FOREIGN KEY (`row_revise_contact_id`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_forecast_subject`
--

DROP TABLE IF EXISTS `catalog_forecast_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_forecast_subject` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `row_version` int(11) unsigned NOT NULL DEFAULT '0',
  `row_create_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_create_time` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `row_revise_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_revise_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `row_create_contact_id` (`row_create_contact_id`),
  KEY `row_revise_contact_id` (`row_revise_contact_id`),
  CONSTRAINT `catalog_forecast_subject_ibfk_88` FOREIGN KEY (`row_create_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `catalog_forecast_subject_ibfk_99` FOREIGN KEY (`row_revise_contact_id`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_ingest_approval`
--

DROP TABLE IF EXISTS `catalog_ingest_approval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_ingest_approval` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(11) unsigned NOT NULL DEFAULT '0',
  `category_id` int(11) unsigned NOT NULL DEFAULT '0',
  `platform_id` int(11) unsigned NOT NULL DEFAULT '0',
  `autocreate_product` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `autoadd_category_id` int(11) unsigned DEFAULT NULL,
  `row_version` int(11) unsigned NOT NULL DEFAULT '0',
  `row_create_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_create_time` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `row_revise_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_revise_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id` (`project_id`,`category_id`,`platform_id`),
  KEY `category_id` (`category_id`),
  KEY `platform_id` (`platform_id`),
  KEY `autoadd_category_id` (`autoadd_category_id`),
  KEY `row_create_contact_id` (`row_create_contact_id`),
  KEY `row_revise_contact_id` (`row_revise_contact_id`),
  CONSTRAINT `catalog_ingest_approval_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `catalog_ingest_approval_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `catalog_ingest_approval_ibfk_3` FOREIGN KEY (`platform_id`) REFERENCES `platform` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `catalog_ingest_approval_ibfk_4` FOREIGN KEY (`autoadd_category_id`) REFERENCES `category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `catalog_ingest_approval_ibfk_88` FOREIGN KEY (`row_create_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `catalog_ingest_approval_ibfk_99` FOREIGN KEY (`row_revise_contact_id`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=721 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_ingest_item`
--

DROP TABLE IF EXISTS `catalog_ingest_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_ingest_item` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(11) unsigned DEFAULT NULL,
  `original_directory` varchar(255) NOT NULL DEFAULT '' COMMENT 'ingest location',
  `original_filename` varchar(255) NOT NULL DEFAULT '',
  `destination_directory` varchar(255) DEFAULT NULL COMMENT 'data/web location',
  `destination_filename` varchar(255) DEFAULT NULL,
  `priority` int(11) DEFAULT '1',
  `status` enum('UNKNOWN','FILE_CREATED','FILE_CLOSED','PROCESSING','INGESTED','JAILED','RESCUED','ERROR') NOT NULL DEFAULT 'UNKNOWN',
  `message` text COMMENT 'status/error message',
  `row_version` int(11) unsigned NOT NULL DEFAULT '0',
  `row_create_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_create_time` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `row_revise_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_revise_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `path` (`original_directory`,`original_filename`),
  KEY `project_id` (`project_id`),
  KEY `ingest_queue` (`project_id`,`row_revise_time`,`status`,`priority`),
  KEY `jailpath` (`project_id`,`destination_directory`,`destination_filename`),
  KEY `row_create_contact_id` (`row_create_contact_id`),
  KEY `row_revise_contact_id` (`row_revise_contact_id`),
  CONSTRAINT `catalog_ingest_item_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  CONSTRAINT `catalog_ingest_item_ibfk_88` FOREIGN KEY (`row_create_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `catalog_ingest_item_ibfk_99` FOREIGN KEY (`row_revise_contact_id`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10365842 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_status_item`
--

DROP TABLE IF EXISTS `catalog_status_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_status_item` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(11) unsigned NOT NULL DEFAULT '0',
  `platform_id` int(11) unsigned NOT NULL DEFAULT '0',
  `instrument_id` int(11) unsigned DEFAULT NULL,
  `category_id` int(11) unsigned DEFAULT NULL,
  `row_version` int(11) unsigned NOT NULL DEFAULT '0',
  `row_create_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_create_time` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `row_revise_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_revise_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_status_item` (`project_id`,`platform_id`,`instrument_id`),
  KEY `project_id` (`project_id`),
  KEY `platform_id` (`platform_id`),
  KEY `instrument_id` (`instrument_id`),
  KEY `category_id` (`category_id`),
  KEY `row_create_contact_id` (`row_create_contact_id`),
  KEY `row_revise_contact_id` (`row_revise_contact_id`),
  CONSTRAINT `catalog_status_item_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  CONSTRAINT `catalog_status_item_ibfk_2` FOREIGN KEY (`platform_id`) REFERENCES `platform` (`id`),
  CONSTRAINT `catalog_status_item_ibfk_3` FOREIGN KEY (`instrument_id`) REFERENCES `instrument` (`id`),
  CONSTRAINT `catalog_status_item_ibfk_4` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `catalog_status_item_ibfk_88` FOREIGN KEY (`row_create_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `catalog_status_item_ibfk_99` FOREIGN KEY (`row_revise_contact_id`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=306 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_status_report`
--

DROP TABLE IF EXISTS `catalog_status_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_status_report` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status_item_id` int(11) unsigned NOT NULL DEFAULT '0',
  `status` enum('up','down','provisional','inactive') NOT NULL DEFAULT 'down',
  `comment` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `report_datetime` datetime NOT NULL DEFAULT '1750-01-01 00:00:00',
  `row_version` int(11) unsigned NOT NULL DEFAULT '0',
  `row_create_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_create_time` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `row_revise_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_revise_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `status_item_id` (`status_item_id`),
  KEY `row_create_contact_id` (`row_create_contact_id`),
  KEY `row_revise_contact_id` (`row_revise_contact_id`),
  CONSTRAINT `catalog_status_report_ibfk_1` FOREIGN KEY (`status_item_id`) REFERENCES `catalog_status_item` (`id`),
  CONSTRAINT `catalog_status_report_ibfk_88` FOREIGN KEY (`row_create_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `catalog_status_report_ibfk_99` FOREIGN KEY (`row_revise_contact_id`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3242 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_ui_platform_run_date`
--

DROP TABLE IF EXISTS `catalog_ui_platform_run_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_ui_platform_run_date` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `platform_id` int(11) unsigned NOT NULL,
  `run_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `platform_date` (`platform_id`,`run_date`),
  CONSTRAINT `catalog_ui_platform_run_date_ibfk_1` FOREIGN KEY (`platform_id`) REFERENCES `platform` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4316554 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_ui_project_sort`
--

DROP TABLE IF EXISTS `catalog_ui_project_sort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_ui_project_sort` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(11) unsigned NOT NULL DEFAULT '0',
  `category_id` int(11) unsigned NOT NULL DEFAULT '0',
  `subcategory_id` int(11) unsigned NOT NULL DEFAULT '0',
  `platform_id` int(11) unsigned DEFAULT NULL,
  `sort_key` smallint(5) unsigned NOT NULL DEFAULT '65534' COMMENT 'NOT unique (to simplify insert): must always secondary sort; no KEY needed as sorting is app-level',
  `row_version` int(11) unsigned NOT NULL DEFAULT '0',
  `row_create_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_create_time` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `row_revise_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_revise_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_sort_item` (`project_id`,`category_id`,`subcategory_id`,`platform_id`),
  KEY `project_id` (`project_id`),
  KEY `category_id` (`category_id`),
  KEY `subcategory_id` (`subcategory_id`),
  KEY `platform_id` (`platform_id`),
  KEY `row_create_contact_id` (`row_create_contact_id`),
  KEY `row_revise_contact_id` (`row_revise_contact_id`),
  CONSTRAINT `catalog_ui_project_sort_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `catalog_ui_project_sort_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `catalog_ui_project_sort_ibfk_3` FOREIGN KEY (`subcategory_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `catalog_ui_project_sort_ibfk_4` FOREIGN KEY (`platform_id`) REFERENCES `platform` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `catalog_ui_project_sort_ibfk_88` FOREIGN KEY (`row_create_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `catalog_ui_project_sort_ibfk_99` FOREIGN KEY (`row_revise_contact_id`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `short_name` varchar(63) DEFAULT NULL COMMENT 'abbreviation/code for catalog/filenames; NO WHITESPACE',
  `name` varchar(255) NOT NULL DEFAULT '',
  `parent_category_id` int(11) unsigned DEFAULT NULL,
  `row_create_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_create_time` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `row_revise_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_revise_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `no_twins` (`name`,`parent_category_id`),
  UNIQUE KEY `short_name` (`short_name`),
  KEY `parent_category_id` (`parent_category_id`),
  KEY `row_create_contact_id` (`row_create_contact_id`),
  KEY `row_revise_contact_id` (`row_revise_contact_id`),
  CONSTRAINT `category_ibfk_1` FOREIGN KEY (`parent_category_id`) REFERENCES `category` (`id`) ON DELETE SET NULL,
  CONSTRAINT `category_ibfk_88` FOREIGN KEY (`row_create_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `category_ibfk_99` FOREIGN KEY (`row_revise_contact_id`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `codiac_browse_log`
--

DROP TABLE IF EXISTS `codiac_browse_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `codiac_browse_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hostname` varchar(255) DEFAULT NULL,
  `hostip` varchar(15) DEFAULT '' COMMENT 'IPv4, or try binary(4); IPv6: varchar(23)/binary(8)',
  `username` varchar(15) DEFAULT NULL,
  `access_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dataset_id` int(11) unsigned NOT NULL DEFAULT '0',
  `archive_ident` varchar(15) NOT NULL DEFAULT '',
  `browse_year` smallint(4) NOT NULL DEFAULT '-1',
  `browse_month` tinyint(2) NOT NULL DEFAULT '-1',
  `browse_day` tinyint(2) NOT NULL DEFAULT '-1',
  `browse_hour` tinyint(2) NOT NULL DEFAULT '-1',
  `browse_minute` tinyint(2) NOT NULL DEFAULT '-1',
  `browse_second` tinyint(2) NOT NULL DEFAULT '-1',
  `browse_format` varchar(15) NOT NULL DEFAULT '',
  `return_value` smallint(6) NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `hostname` (`hostname`),
  KEY `hostip` (`hostip`),
  KEY `dataset_id` (`dataset_id`),
  KEY `archive_ident` (`archive_ident`),
  CONSTRAINT `codiac_browse_log_ibfk_1` FOREIGN KEY (`dataset_id`) REFERENCES `dataset` (`id`),
  CONSTRAINT `codiac_browse_log_ibfk_2` FOREIGN KEY (`archive_ident`) REFERENCES `dataset` (`archive_ident`)
) ENGINE=InnoDB AUTO_INCREMENT=144531 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `codiac_dataset_options`
--

DROP TABLE IF EXISTS `codiac_dataset_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `codiac_dataset_options` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `dataset_id` int(11) unsigned NOT NULL DEFAULT '0',
  `x_subset` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `y_subset` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `z_subset` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `t_subset` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `p_subset` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `stnid_subset` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `event_subset` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `file_subset` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `order_allow_compress` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `order_max_size_gb` smallint(5) unsigned DEFAULT NULL,
  `order_directory_levels` smallint(5) unsigned NOT NULL DEFAULT '0',
  `order_select_prog` varchar(255) DEFAULT NULL,
  `order_merge_prog` varchar(255) DEFAULT NULL,
  `order_parm_list_prog` varchar(255) DEFAULT NULL,
  `order_stnid_list_prog` varchar(255) DEFAULT NULL,
  `order_fgr_prog` varchar(255) DEFAULT NULL,
  `order_displayed_format_id` int(11) unsigned DEFAULT NULL,
  `browse_stn_scan_prog` varchar(255) DEFAULT NULL,
  `browse_extract_prog` varchar(255) DEFAULT NULL,
  `browse_param_prog` varchar(255) DEFAULT NULL,
  `row_create_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_create_time` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `row_revise_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_revise_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dataset_id` (`dataset_id`),
  KEY `row_create_contact_id` (`row_create_contact_id`),
  KEY `row_revise_contact_id` (`row_revise_contact_id`),
  KEY `order_displayed_format_id` (`order_displayed_format_id`),
  CONSTRAINT `codiac_dataset_options_ibfk_1` FOREIGN KEY (`dataset_id`) REFERENCES `dataset` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `codiac_dataset_options_ibfk_2` FOREIGN KEY (`order_displayed_format_id`) REFERENCES `format` (`id`),
  CONSTRAINT `codiac_dataset_options_ibfk_88` FOREIGN KEY (`row_create_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `codiac_dataset_options_ibfk_99` FOREIGN KEY (`row_revise_contact_id`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5716 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `codiac_dataset_plot`
--

DROP TABLE IF EXISTS `codiac_dataset_plot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `codiac_dataset_plot` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `dataset_id` int(11) unsigned NOT NULL DEFAULT '0',
  `codiac_plot_type_id` int(11) unsigned NOT NULL DEFAULT '0',
  `time_sel_level` enum('na','yr','mo','dy','hr','mn','sc') NOT NULL DEFAULT 'na',
  `stn_select` enum('no','single','level','single_nomap','flight_nomap','height') NOT NULL DEFAULT 'no',
  `row_create_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_create_time` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `row_revise_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_revise_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dataset_id` (`dataset_id`,`codiac_plot_type_id`),
  KEY `codiac_plot_type_id` (`codiac_plot_type_id`),
  KEY `row_create_contact_id` (`row_create_contact_id`),
  KEY `row_revise_contact_id` (`row_revise_contact_id`),
  CONSTRAINT `codiac_dataset_plot_ibfk_1` FOREIGN KEY (`dataset_id`) REFERENCES `dataset` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `codiac_dataset_plot_ibfk_2` FOREIGN KEY (`codiac_plot_type_id`) REFERENCES `codiac_plot_type` (`id`),
  CONSTRAINT `codiac_dataset_plot_ibfk_88` FOREIGN KEY (`row_create_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `codiac_dataset_plot_ibfk_99` FOREIGN KEY (`row_revise_contact_id`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3004 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `codiac_plot_type`
--

DROP TABLE IF EXISTS `codiac_plot_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `codiac_plot_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(31) NOT NULL DEFAULT '',
  `param_select` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `multi_parm_x` tinyint(1) unsigned DEFAULT NULL,
  `multi_parm_y` tinyint(1) unsigned DEFAULT NULL,
  `multi_parm_z` tinyint(1) unsigned DEFAULT NULL,
  `num_x_axes` tinyint(1) unsigned DEFAULT NULL,
  `num_y_axes` tinyint(1) unsigned DEFAULT NULL,
  `num_z_axes` tinyint(1) unsigned DEFAULT NULL,
  `reference_image` varchar(255) DEFAULT NULL,
  `sort_key` smallint(5) unsigned NOT NULL DEFAULT '65534',
  `row_create_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_create_time` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `row_revise_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_revise_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `row_create_contact_id` (`row_create_contact_id`),
  KEY `row_revise_contact_id` (`row_revise_contact_id`),
  CONSTRAINT `codiac_plot_type_ibfk_88` FOREIGN KEY (`row_create_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `codiac_plot_type_ibfk_99` FOREIGN KEY (`row_revise_contact_id`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `codiac_tape_order_log`
--

DROP TABLE IF EXISTS `codiac_tape_order_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `codiac_tape_order_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `codiac_order_ident` varchar(15) NOT NULL DEFAULT '',
  `dataset_id` int(11) unsigned NOT NULL DEFAULT '0',
  `archive_ident` varchar(15) NOT NULL DEFAULT '',
  `person_name` varchar(255) DEFAULT NULL,
  `org_name` varchar(255) DEFAULT NULL,
  `address` text,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `postal_code` varchar(31) DEFAULT NULL,
  `country` varchar(63) DEFAULT NULL,
  `phone` varchar(63) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `medium_id` int(11) unsigned NOT NULL DEFAULT '0',
  `num_tapes` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `tapelist` text,
  `request_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `status` enum('received','processing','error','filled') NOT NULL DEFAULT 'received',
  `status_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `row_create_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_create_time` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `row_revise_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_revise_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codiac_order_ident` (`codiac_order_ident`),
  KEY `dataset_id` (`dataset_id`),
  KEY `archive_ident` (`archive_ident`),
  KEY `email` (`email`),
  KEY `codiac_tape_order_log_ibfk_3` (`medium_id`),
  KEY `row_create_contact_id` (`row_create_contact_id`),
  KEY `row_revise_contact_id` (`row_revise_contact_id`),
  CONSTRAINT `codiac_tape_order_log_ibfk_1` FOREIGN KEY (`dataset_id`) REFERENCES `dataset` (`id`),
  CONSTRAINT `codiac_tape_order_log_ibfk_2` FOREIGN KEY (`archive_ident`) REFERENCES `dataset` (`archive_ident`),
  CONSTRAINT `codiac_tape_order_log_ibfk_3` FOREIGN KEY (`medium_id`) REFERENCES `medium` (`id`),
  CONSTRAINT `codiac_tape_order_log_ibfk_88` FOREIGN KEY (`row_create_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `codiac_tape_order_log_ibfk_99` FOREIGN KEY (`row_revise_contact_id`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1210 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `codiac_user`
--

DROP TABLE IF EXISTS `codiac_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `codiac_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(15) NOT NULL DEFAULT '',
  `password` varchar(15) NOT NULL DEFAULT '',
  `row_create_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_create_time` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `row_revise_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_revise_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `row_create_contact_id` (`row_create_contact_id`),
  KEY `row_revise_contact_id` (`row_revise_contact_id`),
  CONSTRAINT `codiac_user_ibfk_88` FOREIGN KEY (`row_create_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `codiac_user_ibfk_99` FOREIGN KEY (`row_revise_contact_id`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `codiac_web_order_log`
--

DROP TABLE IF EXISTS `codiac_web_order_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `codiac_web_order_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `dataset_id` int(11) unsigned NOT NULL DEFAULT '0',
  `archive_ident` varchar(15) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `affiliation` enum('ncar_ucar','us_univ','us_gov','us_comm','foreign_univ','foreign_gov','foreign_comm','other') DEFAULT 'other',
  `size_kb` bigint(20) unsigned NOT NULL DEFAULT '0',
  `num_files` int(11) unsigned DEFAULT '0',
  `filehost` enum('localhost','mass_store','hpss') DEFAULT NULL,
  `source_format_id` int(11) unsigned DEFAULT NULL,
  `target_format_id` int(11) unsigned DEFAULT NULL,
  `format_conversion_command` varchar(255) DEFAULT NULL,
  `delivery_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `success_code` int(11) NOT NULL DEFAULT '1',
  `row_create_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_create_time` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `row_revise_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_revise_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `dataset_id` (`dataset_id`),
  KEY `archive_ident` (`archive_ident`),
  KEY `email` (`email`),
  KEY `row_create_contact_id` (`row_create_contact_id`),
  KEY `row_revise_contact_id` (`row_revise_contact_id`),
  KEY `codiac_web_order_log_ibfk_3` (`source_format_id`),
  KEY `codiac_web_order_log_ibfk_4` (`target_format_id`),
  CONSTRAINT `codiac_web_order_log_ibfk_1` FOREIGN KEY (`dataset_id`) REFERENCES `dataset` (`id`),
  CONSTRAINT `codiac_web_order_log_ibfk_2` FOREIGN KEY (`archive_ident`) REFERENCES `dataset` (`archive_ident`),
  CONSTRAINT `codiac_web_order_log_ibfk_3` FOREIGN KEY (`source_format_id`) REFERENCES `format` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `codiac_web_order_log_ibfk_4` FOREIGN KEY (`target_format_id`) REFERENCES `format` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `codiac_web_order_log_ibfk_88` FOREIGN KEY (`row_create_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `codiac_web_order_log_ibfk_99` FOREIGN KEY (`row_revise_contact_id`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106721 DEFAULT CHARSET=utf8 COMMENT='old/codiac style';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `contact_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'author',
  `hostip` varchar(15) NOT NULL DEFAULT '' COMMENT 'IPv4, or try binary(4); IPv6: varchar(23)/binary(8)',
  `entry_date` datetime NOT NULL,
  `visible` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'e.g. approved',
  `purpose` enum('public','collection','source','general','ingest','process','load','check') NOT NULL DEFAULT 'public',
  `content` text NOT NULL,
  `row_create_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_create_time` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `row_revise_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_revise_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `contact_id` (`contact_id`),
  KEY `row_create_contact_id` (`row_create_contact_id`),
  KEY `row_revise_contact_id` (`row_revise_contact_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`contact_id`) REFERENCES `contact` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_88` FOREIGN KEY (`row_create_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `comment_ibfk_99` FOREIGN KEY (`row_revise_contact_id`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='DTS note + general (user) comments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `short_name` varchar(15) DEFAULT NULL COMMENT 'original codiac contact ID, or email username (before @)',
  `active_editor` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'should move to user table or roles',
  `person_name` varchar(255) DEFAULT NULL,
  `organization_name` varchar(255) DEFAULT NULL,
  `affiliation` enum('ncar_ucar','us_univ','us_gov','us_comm','foreign_univ','foreign_gov','foreign_comm','other') DEFAULT 'other',
  `position_name` varchar(255) DEFAULT NULL,
  `primary_name` enum('person','org','position') NOT NULL DEFAULT 'person' COMMENT 'the corresponding _name must also exist',
  `citation_name` varchar(255) DEFAULT NULL COMMENT 'for EZID etc, if NULL then (munged) primary_name',
  `gcmd_name` varchar(255) DEFAULT NULL COMMENT 'if primary==org then this is GCMD "Data Center"',
  `long_term_ident` varchar(255) DEFAULT NULL COMMENT 'with type: prefix, e.g. orcid:, isni:, dai:',
  `address` text,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `postal_code` varchar(31) DEFAULT NULL,
  `country` varchar(63) DEFAULT NULL,
  `phone` varchar(63) DEFAULT NULL,
  `fax` varchar(63) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `homepage` varchar(255) DEFAULT NULL,
  `row_create_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_create_time` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `row_revise_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_revise_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `long_term_ident` (`long_term_ident`),
  KEY `row_create_contact_id` (`row_create_contact_id`),
  KEY `row_revise_contact_id` (`row_revise_contact_id`),
  CONSTRAINT `contact_ibfk_88` FOREIGN KEY (`row_create_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `contact_ibfk_99` FOREIGN KEY (`row_revise_contact_id`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1794 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataset`
--

DROP TABLE IF EXISTS `dataset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataset` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `archive_ident` varchar(15) NOT NULL DEFAULT '' COMMENT 'formerly storm_id, dataset_id (ddd.ddd)',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT 'human-readable name',
  `summary` text COMMENT 'aka abstract or description',
  `archive_note` text COMMENT 'local/archive-specific, public-viewable info that is not included during metadata sharing/export',
  `begin_date` datetime NOT NULL DEFAULT '1750-01-01 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '9999-12-31 23:59:59',
  `minimum_latitude` decimal(7,5) NOT NULL DEFAULT '-90.00000',
  `minimum_longitude` decimal(8,5) NOT NULL DEFAULT '-180.00000',
  `maximum_latitude` decimal(7,5) NOT NULL DEFAULT '90.00000',
  `maximum_longitude` decimal(8,5) NOT NULL DEFAULT '180.00000',
  `spatial_type` enum('unknown','multiple','grid','point','raster','vector','textTable','tin','stereoModel','video') DEFAULT NULL,
  `frequency_id` int(11) unsigned NOT NULL DEFAULT '1',
  `horizontal_resolution_id` int(11) unsigned NOT NULL DEFAULT '1',
  `vertical_resolution_id` int(11) unsigned NOT NULL DEFAULT '1',
  `progress` enum('completed','historicalArchive','obsolete','onGoing','planned','required','underDevelopment') DEFAULT NULL,
  `quality` enum('preliminary','final') DEFAULT NULL,
  `current_version_id` int(11) unsigned DEFAULT NULL,
  `language_id` int(11) unsigned NOT NULL DEFAULT '123' COMMENT 'default should be the ID for english',
  `point_of_contact_id` int(11) unsigned NOT NULL DEFAULT '1' COMMENT 'primary point of contact for user questions about the dataset; displayed to outside world; additionals can be in dataset_contact',
  `internal_contact_id` int(11) unsigned NOT NULL DEFAULT '1' COMMENT 'primary internal contact for processing, problems, etc; NOT shown to outside world; additionals can be in dataset_contact; do NOT use the default value',
  `grant_contact_id` int(11) unsigned DEFAULT NULL,
  `grant_code` varchar(255) DEFAULT NULL,
  `file_event_label` varchar(15) DEFAULT NULL COMMENT 'label for file.event, e.g. Flight, Storm',
  `auth_reqd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `eula_reqd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `online_orderable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `offline_orderable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `browseable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dodsable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_eol_data` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'for metrics about EOL-created data',
  `latest_file_id` bigint(20) unsigned DEFAULT NULL COMMENT 'cache of latest data file',
  `latest_file_begin_date` datetime DEFAULT NULL COMMENT 'cache of latest data file begin_date',
  `catalog_visible` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `visible` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `row_create_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_create_time` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `row_revise_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_revise_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `archive_ident` (`archive_ident`),
  UNIQUE KEY `current_version_id` (`current_version_id`),
  KEY `frequency_id` (`frequency_id`),
  KEY `horizontal_resolution_id` (`horizontal_resolution_id`),
  KEY `vertical_resolution_id` (`vertical_resolution_id`),
  KEY `language_id` (`language_id`),
  KEY `point_of_contact_id` (`point_of_contact_id`),
  KEY `internal_contact_id` (`internal_contact_id`),
  KEY `grant_contact_id` (`grant_contact_id`),
  KEY `row_create_contact_id` (`row_create_contact_id`),
  KEY `row_revise_contact_id` (`row_revise_contact_id`),
  KEY `latest_file_id` (`latest_file_id`),
  CONSTRAINT `dataset_ibfk_1` FOREIGN KEY (`frequency_id`) REFERENCES `frequency` (`id`),
  CONSTRAINT `dataset_ibfk_2` FOREIGN KEY (`horizontal_resolution_id`) REFERENCES `horizontal_resolution` (`id`),
  CONSTRAINT `dataset_ibfk_3` FOREIGN KEY (`vertical_resolution_id`) REFERENCES `vertical_resolution` (`id`),
  CONSTRAINT `dataset_ibfk_4` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`),
  CONSTRAINT `dataset_ibfk_5` FOREIGN KEY (`point_of_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `dataset_ibfk_6` FOREIGN KEY (`internal_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `dataset_ibfk_7` FOREIGN KEY (`grant_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `dataset_ibfk_8` FOREIGN KEY (`latest_file_id`) REFERENCES `file` (`id`),
  CONSTRAINT `dataset_ibfk_88` FOREIGN KEY (`row_create_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `dataset_ibfk_9` FOREIGN KEY (`current_version_id`) REFERENCES `dataset_version` (`id`),
  CONSTRAINT `dataset_ibfk_99` FOREIGN KEY (`row_revise_contact_id`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=119403 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataset_category`
--

DROP TABLE IF EXISTS `dataset_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataset_category` (
  `dataset_id` int(11) unsigned NOT NULL DEFAULT '0',
  `category_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`dataset_id`,`category_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `dataset_category_ibfk_1` FOREIGN KEY (`dataset_id`) REFERENCES `dataset` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dataset_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataset_codiac_user`
--

DROP TABLE IF EXISTS `dataset_codiac_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataset_codiac_user` (
  `dataset_id` int(11) unsigned NOT NULL DEFAULT '0',
  `codiac_user_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`dataset_id`,`codiac_user_id`),
  KEY `codiac_user_id` (`codiac_user_id`),
  CONSTRAINT `dataset_codiac_user_ibfk_1` FOREIGN KEY (`dataset_id`) REFERENCES `dataset` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dataset_codiac_user_ibfk_2` FOREIGN KEY (`codiac_user_id`) REFERENCES `codiac_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataset_comment`
--

DROP TABLE IF EXISTS `dataset_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataset_comment` (
  `dataset_id` int(11) unsigned NOT NULL DEFAULT '0',
  `comment_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`dataset_id`,`comment_id`),
  KEY `comment_id` (`comment_id`),
  CONSTRAINT `dataset_comment_ibfk_1` FOREIGN KEY (`dataset_id`) REFERENCES `dataset` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dataset_comment_ibfk_2` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataset_contact`
--

DROP TABLE IF EXISTS `dataset_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataset_contact` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `dataset_id` int(11) unsigned NOT NULL DEFAULT '0',
  `contact_id` int(11) unsigned NOT NULL DEFAULT '0',
  `iso_citation_role` enum('resourceProvider','custodian','owner','user','distributor','originator','pointOfContact','principalInvestigator','processor','publisher','author','EOL_internal') NOT NULL DEFAULT 'pointOfContact' COMMENT 'consider custodian and processor over EOL_internal',
  `datacite_contributor_type` enum('ContactPerson','DataCollector','DataCurator','DataManager','Distributor','Editor','Funder','HostingInstitution','Producer','ProjectLeader','ProjectManager','ProjectMember','RegistrationAgency','RegistrationAuthority','RelatedPerson','Researcher','ResearchGroup','RightsHolder','Sponsor','Supervisor','WorkPackageLeader','Other') DEFAULT NULL COMMENT 'override default ISO->DataCite conversion',
  `sort_key` smallint(5) unsigned NOT NULL DEFAULT '65534' COMMENT 'NOT unique (to simplify insert): must always secondary sort on id',
  `row_create_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_create_time` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `row_revise_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_revise_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `no_duplicates` (`dataset_id`,`contact_id`,`iso_citation_role`,`datacite_contributor_type`),
  UNIQUE KEY `no_duplicate_dc` (`dataset_id`,`contact_id`,`datacite_contributor_type`),
  KEY `dataset_id` (`dataset_id`),
  KEY `contact_id` (`contact_id`),
  KEY `row_create_contact_id` (`row_create_contact_id`),
  KEY `row_revise_contact_id` (`row_revise_contact_id`),
  CONSTRAINT `dataset_contact_ibfk_1` FOREIGN KEY (`dataset_id`) REFERENCES `dataset` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dataset_contact_ibfk_2` FOREIGN KEY (`contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `dataset_contact_ibfk_88` FOREIGN KEY (`row_create_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `dataset_contact_ibfk_99` FOREIGN KEY (`row_revise_contact_id`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13270 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataset_event`
--

DROP TABLE IF EXISTS `dataset_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataset_event` (
  `dataset_id` int(11) unsigned NOT NULL DEFAULT '0',
  `event_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`dataset_id`,`event_id`),
  KEY `event_id` (`event_id`),
  CONSTRAINT `dataset_event_ibfk_1` FOREIGN KEY (`dataset_id`) REFERENCES `dataset` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dataset_event_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='from dmg_merged_ml.classification where type_id=2';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataset_gcmd_science_keyword`
--

DROP TABLE IF EXISTS `dataset_gcmd_science_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataset_gcmd_science_keyword` (
  `dataset_id` int(11) unsigned NOT NULL DEFAULT '0',
  `gcmd_science_keyword_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`dataset_id`,`gcmd_science_keyword_id`),
  KEY `gcmd_science_keyword_id` (`gcmd_science_keyword_id`),
  CONSTRAINT `dataset_gcmd_science_keyword_ibfk_1` FOREIGN KEY (`dataset_id`) REFERENCES `dataset` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dataset_gcmd_science_keyword_ibfk_2` FOREIGN KEY (`gcmd_science_keyword_id`) REFERENCES `gcmd_science_keyword` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataset_instrument`
--

DROP TABLE IF EXISTS `dataset_instrument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataset_instrument` (
  `dataset_id` int(11) unsigned NOT NULL DEFAULT '0',
  `instrument_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`dataset_id`,`instrument_id`),
  KEY `instrument_id` (`instrument_id`),
  CONSTRAINT `dataset_instrument_ibfk_1` FOREIGN KEY (`dataset_id`) REFERENCES `dataset` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dataset_instrument_ibfk_2` FOREIGN KEY (`instrument_id`) REFERENCES `instrument` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='DTS';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataset_iso_topic_category`
--

DROP TABLE IF EXISTS `dataset_iso_topic_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataset_iso_topic_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `dataset_id` int(11) unsigned NOT NULL DEFAULT '0',
  `iso_topic_category` enum('farming','biota','boundaries','climatologyMeteorologyAtmosphere','economy','elevation','environment','geoscientificInformation','health','imageryBaseMapsEarthCover','intelligenceMilitary','inlandWaters','location','oceans','planningCadastre','society','structure','transportation','utilitiesCommunication') NOT NULL DEFAULT 'climatologyMeteorologyAtmosphere',
  `row_create_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_create_time` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `row_revise_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_revise_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `no_duplicates` (`dataset_id`,`iso_topic_category`),
  KEY `dataset_id` (`dataset_id`),
  KEY `row_create_contact_id` (`row_create_contact_id`),
  KEY `row_revise_contact_id` (`row_revise_contact_id`),
  CONSTRAINT `dataset_iso_topic_category_ibfk_1` FOREIGN KEY (`dataset_id`) REFERENCES `dataset` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dataset_iso_topic_category_ibfk_88` FOREIGN KEY (`row_create_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `dataset_iso_topic_category_ibfk_99` FOREIGN KEY (`row_revise_contact_id`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=279 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataset_platform`
--

DROP TABLE IF EXISTS `dataset_platform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataset_platform` (
  `dataset_id` int(11) unsigned NOT NULL DEFAULT '0',
  `platform_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`dataset_id`,`platform_id`),
  KEY `platform_id` (`platform_id`),
  CONSTRAINT `dataset_platform_ibfk_1` FOREIGN KEY (`dataset_id`) REFERENCES `dataset` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dataset_platform_ibfk_2` FOREIGN KEY (`platform_id`) REFERENCES `platform` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='DTS';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataset_prefix_project`
--

DROP TABLE IF EXISTS `dataset_prefix_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataset_prefix_project` (
  `dataset_id_prefix` varchar(15) NOT NULL DEFAULT '',
  `project_name` varchar(15) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='historical record; now dataset.archive_ident prefixes are th';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataset_product`
--

DROP TABLE IF EXISTS `dataset_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataset_product` (
  `dataset_id` int(11) unsigned NOT NULL DEFAULT '0',
  `product_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`dataset_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `dataset_product_ibfk_1` FOREIGN KEY (`dataset_id`) REFERENCES `dataset` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dataset_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='DTS';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataset_project`
--

DROP TABLE IF EXISTS `dataset_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataset_project` (
  `dataset_id` int(11) unsigned NOT NULL DEFAULT '0',
  `project_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`dataset_id`,`project_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `dataset_project_ibfk_1` FOREIGN KEY (`dataset_id`) REFERENCES `dataset` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dataset_project_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataset_reference`
--

DROP TABLE IF EXISTS `dataset_reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataset_reference` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `dataset_id` int(11) unsigned NOT NULL DEFAULT '0',
  `referenced_dataset_id` int(11) unsigned NOT NULL DEFAULT '0',
  `reference_type` enum('companion','superceded_by') NOT NULL DEFAULT 'companion',
  `row_create_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_create_time` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `row_revise_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_revise_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dataset_id` (`dataset_id`,`referenced_dataset_id`),
  KEY `referenced_dataset_id` (`referenced_dataset_id`),
  KEY `row_create_contact_id` (`row_create_contact_id`),
  KEY `row_revise_contact_id` (`row_revise_contact_id`),
  CONSTRAINT `dataset_reference_ibfk_1` FOREIGN KEY (`dataset_id`) REFERENCES `dataset` (`id`),
  CONSTRAINT `dataset_reference_ibfk_2` FOREIGN KEY (`referenced_dataset_id`) REFERENCES `dataset` (`id`),
  CONSTRAINT `dataset_reference_ibfk_88` FOREIGN KEY (`row_create_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `dataset_reference_ibfk_99` FOREIGN KEY (`row_revise_contact_id`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1363 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataset_site`
--

DROP TABLE IF EXISTS `dataset_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataset_site` (
  `dataset_id` int(11) unsigned NOT NULL DEFAULT '0',
  `site_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`dataset_id`,`site_id`),
  KEY `site_id` (`site_id`),
  CONSTRAINT `dataset_site_ibfk_1` FOREIGN KEY (`dataset_id`) REFERENCES `dataset` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dataset_site_ibfk_2` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='from dmg_merged_ml.classification where type_id=3';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataset_version`
--

DROP TABLE IF EXISTS `dataset_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataset_version` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `dataset_id` int(11) unsigned NOT NULL DEFAULT '0',
  `version_number` varchar(15) NOT NULL DEFAULT '1.0' COMMENT 'x.y(.z)(-TEXT) or major.minor.rev-TEXT',
  `quality` enum('preliminary','final') DEFAULT 'final',
  `description` text NOT NULL COMMENT 'SHORT version statement or change summary',
  `publish_time` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `row_create_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_create_time` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `row_revise_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_revise_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dataset_version_number` (`dataset_id`,`version_number`),
  KEY `row_create_contact_id` (`row_create_contact_id`),
  KEY `row_revise_contact_id` (`row_revise_contact_id`),
  CONSTRAINT `dataset_version_ibfk_1` FOREIGN KEY (`dataset_id`) REFERENCES `dataset` (`id`),
  CONSTRAINT `dataset_version_ibfk_88` FOREIGN KEY (`row_create_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `dataset_version_ibfk_99` FOREIGN KEY (`row_revise_contact_id`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=895 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataset_version_file`
--

DROP TABLE IF EXISTS `dataset_version_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataset_version_file` (
  `dataset_version_id` int(11) unsigned NOT NULL DEFAULT '0',
  `file_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'cache of latest data file',
  PRIMARY KEY (`dataset_version_id`,`file_id`),
  KEY `dataset_version_id` (`dataset_version_id`),
  KEY `file_id` (`file_id`),
  CONSTRAINT `dataset_version_file_ibfk_1` FOREIGN KEY (`dataset_version_id`) REFERENCES `dataset_version` (`id`),
  CONSTRAINT `dataset_version_file_ibfk_2` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataset_xlink`
--

DROP TABLE IF EXISTS `dataset_xlink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataset_xlink` (
  `dataset_id` int(11) unsigned NOT NULL DEFAULT '0',
  `xlink_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`dataset_id`,`xlink_id`),
  KEY `xlink_id` (`xlink_id`),
  CONSTRAINT `dataset_xlink_ibfk_1` FOREIGN KEY (`dataset_id`) REFERENCES `dataset` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dataset_xlink_ibfk_2` FOREIGN KEY (`xlink_id`) REFERENCES `xlink` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `doi`
--

DROP TABLE IF EXISTS `doi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doi` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `eol_owned` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `handle` varchar(255) NOT NULL DEFAULT '' COMMENT 'must be a real DOI handle',
  `shadow` varchar(255) DEFAULT NULL COMMENT 'e.g. ark for a doi',
  `dataset_id` int(11) unsigned NOT NULL DEFAULT '0',
  `dataset_version_id` int(11) unsigned DEFAULT NULL COMMENT 'null for latest version; not-null to freeze the DOI to a particular version (e.g. externally-owned DOIs and/or multiple DOIs per dataset)',
  `ezid_update_time` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `row_create_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_create_time` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `row_revise_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_revise_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `handle` (`handle`),
  UNIQUE KEY `shadow` (`shadow`),
  KEY `doi_ibfk_1` (`dataset_id`),
  KEY `doi_ibfk_2` (`dataset_version_id`),
  KEY `row_create_contact_id` (`row_create_contact_id`),
  KEY `row_revise_contact_id` (`row_revise_contact_id`),
  CONSTRAINT `doi_ibfk_1` FOREIGN KEY (`dataset_id`) REFERENCES `dataset` (`id`),
  CONSTRAINT `doi_ibfk_2` FOREIGN KEY (`dataset_version_id`) REFERENCES `dataset_version` (`id`),
  CONSTRAINT `doi_ibfk_88` FOREIGN KEY (`row_create_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `doi_ibfk_99` FOREIGN KEY (`row_revise_contact_id`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=849 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `doi_file`
--

DROP TABLE IF EXISTS `doi_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doi_file` (
  `doi_id` int(11) unsigned NOT NULL DEFAULT '0',
  `file_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`doi_id`,`file_id`),
  KEY `file_id` (`file_id`),
  CONSTRAINT `doi_file_ibfk_1` FOREIGN KEY (`doi_id`) REFERENCES `doi` (`id`),
  CONSTRAINT `doi_file_ibfk_2` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `parent_event_id` int(11) unsigned DEFAULT NULL,
  `row_create_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_create_time` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `row_revise_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_revise_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `no_twins` (`name`,`parent_event_id`),
  KEY `parent_event_id` (`parent_event_id`),
  KEY `row_create_contact_id` (`row_create_contact_id`),
  KEY `row_revise_contact_id` (`row_revise_contact_id`),
  CONSTRAINT `event_ibfk_1` FOREIGN KEY (`parent_event_id`) REFERENCES `event` (`id`) ON DELETE SET NULL,
  CONSTRAINT `event_ibfk_88` FOREIGN KEY (`row_create_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `event_ibfk_99` FOREIGN KEY (`row_revise_contact_id`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='from dmg_merged_ml.classification where type_id=2';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file` (
  `id` bigint(20) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `dataset_id` int(11) unsigned NOT NULL DEFAULT '0',
  `host` enum('localhost','hpss') NOT NULL DEFAULT 'localhost',
  `directory` varchar(255) NOT NULL DEFAULT '',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `purpose` enum('data','doc','eula','preview') NOT NULL DEFAULT 'data',
  `quality` enum('preliminary','final') DEFAULT NULL,
  `file_version` int(11) unsigned DEFAULT NULL COMMENT 'decimal or varchar ??',
  `format_id` int(11) unsigned NOT NULL DEFAULT '1',
  `projection_id` int(11) unsigned DEFAULT NULL,
  `size_kb` bigint(20) unsigned NOT NULL DEFAULT '0',
  `begin_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `forecast_hour` smallint(6) DEFAULT NULL COMMENT 'model data',
  `forecast_begin_date` datetime DEFAULT NULL COMMENT 'model data, =begin_date+forecast_hour',
  `forecast_end_date` datetime DEFAULT NULL COMMENT 'model data',
  `minimum_latitude` decimal(7,5) DEFAULT NULL,
  `minimum_longitude` decimal(8,5) DEFAULT NULL,
  `maximum_latitude` decimal(7,5) DEFAULT NULL,
  `maximum_longitude` decimal(8,5) DEFAULT NULL,
  `minimum_vertical` decimal(11,5) DEFAULT NULL,
  `maximum_vertical` decimal(11,5) DEFAULT NULL,
  `vertical_type` enum('geoidal','depth','barometric','other') NOT NULL DEFAULT 'geoidal' COMMENT 'use geoidal for altitude above mean sea level',
  `vertical_units` enum('meters','millibars') DEFAULT NULL,
  `event` varchar(15) DEFAULT NULL COMMENT 'grouping label for data ordering, e.g. RF01, Katrina',
  `visible` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `data_archive_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `row_create_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_create_time` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `row_revise_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_revise_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `path` (`dataset_id`,`directory`,`filename`),
  KEY `purpose` (`dataset_id`,`purpose`),
  KEY `format_id` (`format_id`),
  KEY `projection_id` (`projection_id`),
  KEY `latest_file` (`begin_date`,`dataset_id`),
  KEY `end_date` (`end_date`),
  KEY `forecast_begin_date` (`forecast_begin_date`),
  KEY `forecast_end_date` (`forecast_end_date`),
  KEY `row_create_contact_id` (`row_create_contact_id`),
  KEY `row_revise_contact_id` (`row_revise_contact_id`),
  KEY `begin_date` (`begin_date`),
  KEY `dataset_id` (`dataset_id`),
  CONSTRAINT `file_ibfk_1` FOREIGN KEY (`dataset_id`) REFERENCES `dataset` (`id`),
  CONSTRAINT `file_ibfk_2` FOREIGN KEY (`format_id`) REFERENCES `format` (`id`),
  CONSTRAINT `file_ibfk_3` FOREIGN KEY (`projection_id`) REFERENCES `projection` (`id`),
  CONSTRAINT `file_ibfk_88` FOREIGN KEY (`row_create_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `file_ibfk_99` FOREIGN KEY (`row_revise_contact_id`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40394309 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `file_comment`
--

DROP TABLE IF EXISTS `file_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_comment` (
  `file_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`file_id`,`comment_id`),
  KEY `comment_id` (`comment_id`),
  CONSTRAINT `file_comment_ibfk_1` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `file_comment_ibfk_2` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `format`
--

DROP TABLE IF EXISTS `format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `format` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `short_name` varchar(7) DEFAULT NULL,
  `full_name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `mime_type` varchar(255) DEFAULT NULL,
  `file_extension` varchar(15) DEFAULT NULL COMMENT 'EOL-canonical filename extension for this format',
  `file_ext_regex` varchar(255) DEFAULT NULL COMMENT 'MySQL-compatible regular expression matching common in-the-wild file extensions for this format; should use caret and dollar and matches be distinct from others',
  `thredds_name` varchar(15) DEFAULT NULL COMMENT 'string for THREDDS dataFormat',
  `dods_handler` varchar(15) DEFAULT NULL COMMENT 'required for DODS access',
  `dods_ancillary_directory` varchar(255) DEFAULT NULL,
  `dods_ancillary_basename` varchar(255) DEFAULT NULL,
  `row_create_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_create_time` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `row_revise_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_revise_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `full_name` (`full_name`),
  UNIQUE KEY `file_ext_regex` (`file_ext_regex`),
  KEY `row_create_contact_id` (`row_create_contact_id`),
  KEY `row_revise_contact_id` (`row_revise_contact_id`),
  CONSTRAINT `format_ibfk_88` FOREIGN KEY (`row_create_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `format_ibfk_99` FOREIGN KEY (`row_revise_contact_id`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `format_conversion`
--

DROP TABLE IF EXISTS `format_conversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `format_conversion` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `dataset_id` int(11) unsigned NOT NULL DEFAULT '0',
  `source_format_id` int(11) unsigned NOT NULL DEFAULT '1',
  `target_format_id` int(11) unsigned NOT NULL DEFAULT '1',
  `expansion_factor` decimal(4,1) NOT NULL DEFAULT '1.0',
  `command` varchar(255) DEFAULT NULL,
  `row_create_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_create_time` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `row_revise_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_revise_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dataset_id` (`dataset_id`,`source_format_id`,`target_format_id`),
  KEY `source_format_id` (`source_format_id`),
  KEY `target_format_id` (`target_format_id`),
  KEY `row_create_contact_id` (`row_create_contact_id`),
  KEY `row_revise_contact_id` (`row_revise_contact_id`),
  CONSTRAINT `format_conversion_ibfk_1` FOREIGN KEY (`dataset_id`) REFERENCES `dataset` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `format_conversion_ibfk_2` FOREIGN KEY (`source_format_id`) REFERENCES `format` (`id`),
  CONSTRAINT `format_conversion_ibfk_3` FOREIGN KEY (`target_format_id`) REFERENCES `format` (`id`),
  CONSTRAINT `format_conversion_ibfk_88` FOREIGN KEY (`row_create_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `format_conversion_ibfk_99` FOREIGN KEY (`row_revise_contact_id`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=465 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `frequency`
--

DROP TABLE IF EXISTS `frequency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frequency` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(15) NOT NULL DEFAULT '',
  `gcmd_name` varchar(255) DEFAULT NULL COMMENT 'GCMD "Data Resolution"',
  `sort_key` smallint(5) unsigned NOT NULL DEFAULT '65534',
  `row_create_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_create_time` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `row_revise_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_revise_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `sort_key` (`sort_key`),
  KEY `row_create_contact_id` (`row_create_contact_id`),
  KEY `row_revise_contact_id` (`row_revise_contact_id`),
  CONSTRAINT `frequency_ibfk_88` FOREIGN KEY (`row_create_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `frequency_ibfk_99` FOREIGN KEY (`row_revise_contact_id`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gcmd_science_keyword`
--

DROP TABLE IF EXISTS `gcmd_science_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gcmd_science_keyword` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(80) NOT NULL DEFAULT 'EARTH SCIENCE',
  `topic` varchar(80) NOT NULL DEFAULT '',
  `term` varchar(80) NOT NULL DEFAULT '',
  `variable_level_1` varchar(80) DEFAULT NULL,
  `variable_level_2` varchar(80) DEFAULT NULL,
  `variable_level_3` varchar(80) DEFAULT NULL,
  `detailed_variable` varchar(80) DEFAULT NULL,
  `row_create_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_create_time` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `row_revise_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_revise_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `no_dups` (`category`,`topic`,`term`,`variable_level_1`,`variable_level_2`,`variable_level_3`,`detailed_variable`),
  KEY `row_create_contact_id` (`row_create_contact_id`),
  KEY `row_revise_contact_id` (`row_revise_contact_id`),
  CONSTRAINT `gcmd_science_keyword_ibfk_88` FOREIGN KEY (`row_create_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `gcmd_science_keyword_ibfk_99` FOREIGN KEY (`row_revise_contact_id`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `helptip`
--

DROP TABLE IF EXISTS `helptip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `helptip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` int(11) NOT NULL,
  `domain_name` varchar(255) NOT NULL,
  `domain_property` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `published` bit(1) NOT NULL DEFAULT b'1',
  `row_create_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_create_time` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `row_revise_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_revise_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain_name` (`domain_name`,`domain_property`),
  KEY `row_create_contact_id` (`row_create_contact_id`),
  KEY `row_revise_contact_id` (`row_revise_contact_id`),
  CONSTRAINT `helptip_ibfk_88` FOREIGN KEY (`row_create_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `helptip_ibfk_99` FOREIGN KEY (`row_revise_contact_id`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `horizontal_resolution`
--

DROP TABLE IF EXISTS `horizontal_resolution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horizontal_resolution` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(15) NOT NULL DEFAULT '',
  `gcmd_name` varchar(255) DEFAULT NULL COMMENT 'GCMD "Data Resolution"',
  `sort_key` smallint(5) unsigned NOT NULL DEFAULT '65534',
  `row_create_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_create_time` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `row_revise_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_revise_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `sort_key` (`sort_key`),
  KEY `row_create_contact_id` (`row_create_contact_id`),
  KEY `row_revise_contact_id` (`row_revise_contact_id`),
  CONSTRAINT `horizontal_resolution_ibfk_88` FOREIGN KEY (`row_create_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `horizontal_resolution_ibfk_99` FOREIGN KEY (`row_revise_contact_id`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `instrument`
--

DROP TABLE IF EXISTS `instrument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instrument` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `short_name` varchar(63) DEFAULT NULL COMMENT 'abbreviation/code for catalog/filenames; NO WHITESPACE',
  `name` varchar(255) NOT NULL DEFAULT '',
  `gcmd_name` varchar(255) DEFAULT NULL,
  `handle` varchar(255) DEFAULT NULL COMMENT 'with type: prefix, e.g. doi: or ark:',
  `homepage` varchar(255) DEFAULT NULL COMMENT 'URL',
  `institution_contact_id` int(11) unsigned DEFAULT NULL,
  `is_eol_facility` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `row_create_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_create_time` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `row_revise_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_revise_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `handle` (`handle`),
  KEY `row_create_contact_id` (`row_create_contact_id`),
  KEY `row_revise_contact_id` (`row_revise_contact_id`),
  KEY `institution_contact_id` (`institution_contact_id`),
  CONSTRAINT `instrument_ibfk_1` FOREIGN KEY (`institution_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `instrument_ibfk_88` FOREIGN KEY (`row_create_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `instrument_ibfk_99` FOREIGN KEY (`row_revise_contact_id`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `alpha3_bibliographic_code` char(3) NOT NULL DEFAULT '',
  `alpha3_terminologic_code` char(3) DEFAULT NULL,
  `alpha2_code` char(2) DEFAULT NULL,
  `english_name` varchar(255) NOT NULL DEFAULT '',
  `french_name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `alpha3_bibliographic_code` (`alpha3_bibliographic_code`),
  UNIQUE KEY `english_name` (`english_name`),
  UNIQUE KEY `french_name` (`french_name`)
) ENGINE=InnoDB AUTO_INCREMENT=486 DEFAULT CHARSET=utf8 COMMENT='ISO-639 http://www.loc.gov/standards/iso639-2/';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `map`
--

DROP TABLE IF EXISTS `map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `view_mode` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `max_zoom_level` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_map_on_project_id` (`project_id`),
  KEY `index_map_on_view_mode` (`view_mode`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `map_dataset_options`
--

DROP TABLE IF EXISTS `map_dataset_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_dataset_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dataset_id` int(11) DEFAULT NULL,
  `layer_type` varchar(255) DEFAULT NULL,
  `platform_id` int(11) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `initial_display` tinyint(1) DEFAULT NULL,
  `display_index` int(11) DEFAULT NULL,
  `image_height` int(11) DEFAULT NULL,
  `image_width` int(11) DEFAULT NULL,
  `wms_url` varchar(255) DEFAULT NULL,
  `wms_layer` varchar(255) DEFAULT NULL,
  `reference_filepath` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `position_path` varchar(255) DEFAULT NULL,
  `position_icon` varchar(255) DEFAULT NULL,
  `update_interval_seconds` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `index_map_dataset_options_on_dataset_id` (`dataset_id`),
  KEY `index_map_dataset_options_on_layer_type` (`layer_type`)
) ENGINE=InnoDB AUTO_INCREMENT=1127 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `map_view`
--

DROP TABLE IF EXISTS `map_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_view` (
  `map_id` int(11) DEFAULT NULL,
  `map_layer_id` int(11) DEFAULT NULL,
  KEY `index_map_view_on_map_id` (`map_id`),
  KEY `index_map_view_on_map_layer_id` (`map_layer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `medium`
--

DROP TABLE IF EXISTS `medium`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medium` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(63) NOT NULL DEFAULT '',
  `capacity_kb` int(11) unsigned NOT NULL DEFAULT '0',
  `supported` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `row_create_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_create_time` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `row_revise_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_revise_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `row_create_contact_id` (`row_create_contact_id`),
  KEY `row_revise_contact_id` (`row_revise_contact_id`),
  CONSTRAINT `medium_ibfk_88` FOREIGN KEY (`row_create_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `medium_ibfk_99` FOREIGN KEY (`row_revise_contact_id`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menu_item`
--

DROP TABLE IF EXISTS `menu_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `href` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menu_item_project`
--

DROP TABLE IF EXISTS `menu_item_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_item_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `menu_item_id` int(11) DEFAULT NULL,
  `parent_menu_item_id` int(11) DEFAULT NULL,
  `sort_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_menu_item_project_on_project_id` (`project_id`),
  KEY `index_menu_item_project_on_menu_item_id` (`menu_item_id`),
  KEY `index_menu_item_project_on_sort_key` (`sort_key`)
) ENGINE=InnoDB AUTO_INCREMENT=633 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nagios_contact`
--

DROP TABLE IF EXISTS `nagios_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_id` int(11) NOT NULL,
  `nagios_dataset_check_id` int(11) NOT NULL,
  `contact_column` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_nagios_contact_on_contact_id` (`contact_id`),
  KEY `index_nagios_contact_on_nagios_dataset_check_id` (`nagios_dataset_check_id`)
) ENGINE=InnoDB AUTO_INCREMENT=288 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nagios_contact_contactgroup`
--

DROP TABLE IF EXISTS `nagios_contact_contactgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_contact_contactgroup` (
  `nagios_contact_id` int(11) NOT NULL,
  `nagios_contactgroup_id` int(11) NOT NULL,
  KEY `index_nagios_contact_contactgroup_on_nagios_contact_id` (`nagios_contact_id`),
  KEY `index_nagios_contact_contactgroup_on_nagios_contactgroup_id` (`nagios_contactgroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nagios_contactgroup`
--

DROP TABLE IF EXISTS `nagios_contactgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_contactgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_nagios_contactgroup_on_project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nagios_dataset_options`
--

DROP TABLE IF EXISTS `nagios_dataset_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_dataset_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dataset_id` int(11) DEFAULT NULL,
  `service_description` varchar(255) DEFAULT NULL,
  `warning_bound` varchar(255) NOT NULL DEFAULT '10:00',
  `critical_bound` varchar(255) NOT NULL DEFAULT '15:00',
  `verbosity` int(11) NOT NULL DEFAULT '0',
  `path_strftime` varchar(255) DEFAULT NULL,
  `many_files` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_nagios_dataset_options_on_dataset_id` (`dataset_id`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nagios_project`
--

DROP TABLE IF EXISTS `nagios_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nagios_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `nagios_dataset_check_id` int(11) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `index_nagios_project_on_project_id` (`project_id`),
  KEY `index_nagios_project_on_nagios_dataset_check_id` (`nagios_dataset_check_id`),
  KEY `index_nagios_project_on_enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `platform`
--

DROP TABLE IF EXISTS `platform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `platform` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `short_name` varchar(63) DEFAULT NULL COMMENT 'abbreviation/code for catalog/filenames; NO WHITESPACE',
  `name` varchar(255) NOT NULL DEFAULT '',
  `gcmd_name` varchar(255) DEFAULT NULL,
  `handle` varchar(255) DEFAULT NULL COMMENT 'with type: prefix, e.g. doi: or ark:',
  `homepage` varchar(255) DEFAULT NULL COMMENT 'URL',
  `description` text,
  `institution_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `is_eol_facility` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `row_create_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_create_time` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `row_revise_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_revise_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `handle` (`handle`),
  KEY `institution_contact_id` (`institution_contact_id`),
  KEY `row_create_contact_id` (`row_create_contact_id`),
  KEY `row_revise_contact_id` (`row_revise_contact_id`),
  CONSTRAINT `platform_ibfk_1` FOREIGN KEY (`institution_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `platform_ibfk_88` FOREIGN KEY (`row_create_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `platform_ibfk_99` FOREIGN KEY (`row_revise_contact_id`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=960 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `platform_instrument`
--

DROP TABLE IF EXISTS `platform_instrument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `platform_instrument` (
  `platform_id` int(11) unsigned NOT NULL DEFAULT '0',
  `instrument_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`platform_id`,`instrument_id`),
  KEY `instrument_id` (`instrument_id`),
  CONSTRAINT `platform_instrument_ibfk_1` FOREIGN KEY (`platform_id`) REFERENCES `platform` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `platform_instrument_ibfk_2` FOREIGN KEY (`instrument_id`) REFERENCES `instrument` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='DTS';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `short_name` varchar(63) DEFAULT NULL COMMENT 'abbreviation/code for catalog/filenames; NO WHITESPACE',
  `name` varchar(255) NOT NULL DEFAULT '',
  `row_create_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_create_time` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `row_revise_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_revise_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  KEY `row_create_contact_id` (`row_create_contact_id`),
  KEY `row_revise_contact_id` (`row_revise_contact_id`),
  CONSTRAINT `product_ibfk_88` FOREIGN KEY (`row_create_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `product_ibfk_99` FOREIGN KEY (`row_revise_contact_id`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80583 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(15) NOT NULL DEFAULT '' COMMENT 'short name or acronym; RAF-123 is better than a contrived abbreviation',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT 'full name or expanded acronym',
  `summary` text COMMENT 'aka abstract or description',
  `gcmd_name` varchar(255) DEFAULT NULL,
  `begin_date` datetime NOT NULL DEFAULT '1750-01-01 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '9999-12-31 23:59:59',
  `minimum_latitude` decimal(7,5) NOT NULL DEFAULT '-90.00000',
  `minimum_longitude` decimal(8,5) NOT NULL DEFAULT '-180.00000',
  `maximum_latitude` decimal(7,5) NOT NULL DEFAULT '90.00000',
  `maximum_longitude` decimal(8,5) NOT NULL DEFAULT '180.00000',
  `internal_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `parent_project_id` int(11) unsigned DEFAULT NULL,
  `charge_number` varchar(15) DEFAULT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `catalog` enum('none','xlink','cgi','rails') NOT NULL DEFAULT 'none' COMMENT 'where is the field catalog / how to link to it',
  `visible` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `row_create_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_create_time` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `row_revise_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_revise_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `title` (`title`),
  KEY `internal_contact_id` (`internal_contact_id`),
  KEY `parent_project_id` (`parent_project_id`),
  KEY `row_create_contact_id` (`row_create_contact_id`),
  KEY `row_revise_contact_id` (`row_revise_contact_id`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`internal_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `project_ibfk_2` FOREIGN KEY (`parent_project_id`) REFERENCES `project` (`id`) ON DELETE SET NULL,
  CONSTRAINT `project_ibfk_88` FOREIGN KEY (`row_create_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `project_ibfk_99` FOREIGN KEY (`row_revise_contact_id`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=485 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_comment`
--

DROP TABLE IF EXISTS `project_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_comment` (
  `project_id` int(11) unsigned NOT NULL DEFAULT '0',
  `comment_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`project_id`,`comment_id`),
  KEY `comment_id` (`comment_id`),
  CONSTRAINT `project_comment_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `project_comment_ibfk_2` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_xlink`
--

DROP TABLE IF EXISTS `project_xlink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_xlink` (
  `project_id` int(11) unsigned NOT NULL DEFAULT '0',
  `xlink_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`project_id`,`xlink_id`),
  KEY `xlink_id` (`xlink_id`),
  CONSTRAINT `project_xlink_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `project_xlink_ibfk_2` FOREIGN KEY (`xlink_id`) REFERENCES `xlink` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projection`
--

DROP TABLE IF EXISTS `projection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projection` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `epsg_code` bigint(20) unsigned DEFAULT NULL COMMENT 'user codes >= 32768',
  `short_name` varchar(7) NOT NULL DEFAULT '' COMMENT 'e.g. PROJ.4 library name or myName',
  `full_name` varchar(255) NOT NULL DEFAULT '',
  `wkt` text COMMENT 'full Well Known Text specification, info must match proj4text',
  `proj4text` text NOT NULL COMMENT 'PROJ.4 library arguments, space-separated',
  `row_create_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_create_time` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `row_revise_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_revise_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `proj4text` (`proj4text`(255)),
  UNIQUE KEY `epsg_code` (`epsg_code`),
  UNIQUE KEY `wkt` (`wkt`(255)),
  KEY `row_create_contact_id` (`row_create_contact_id`),
  KEY `row_revise_contact_id` (`row_revise_contact_id`),
  CONSTRAINT `projection_ibfk_88` FOREIGN KEY (`row_create_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `projection_ibfk_99` FOREIGN KEY (`row_revise_contact_id`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_choice`
--

DROP TABLE IF EXISTS `report_choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_choice` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `report_element_id` int(11) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  `sort_key` smallint(5) unsigned NOT NULL DEFAULT '65534',
  `row_create_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_create_time` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `row_revise_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_revise_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `report_element_id` (`report_element_id`,`value`),
  KEY `row_create_contact_id` (`row_create_contact_id`),
  KEY `row_revise_contact_id` (`row_revise_contact_id`),
  CONSTRAINT `report_choice_ibfk_1` FOREIGN KEY (`report_element_id`) REFERENCES `report_element` (`id`) ON DELETE CASCADE,
  CONSTRAINT `report_choice_ibfk_88` FOREIGN KEY (`row_create_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `report_choice_ibfk_99` FOREIGN KEY (`row_revise_contact_id`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_element`
--

DROP TABLE IF EXISTS `report_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_element` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `dataset_id` int(11) unsigned NOT NULL DEFAULT '0',
  `control` enum('text','html','select_menu','checkboxes','datetime_min','email','nominal_datetime','header','help_text') DEFAULT 'text',
  `label` varchar(255) NOT NULL DEFAULT '',
  `ident` varchar(255) NOT NULL DEFAULT '',
  `required` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sort_key` smallint(5) unsigned NOT NULL DEFAULT '65534',
  `row_create_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_create_time` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `row_revise_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_revise_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dataset_id` (`dataset_id`,`ident`),
  KEY `row_create_contact_id` (`row_create_contact_id`),
  KEY `row_revise_contact_id` (`row_revise_contact_id`),
  CONSTRAINT `report_element_ibfk_1` FOREIGN KEY (`dataset_id`) REFERENCES `dataset` (`id`) ON DELETE CASCADE,
  CONSTRAINT `report_element_ibfk_88` FOREIGN KEY (`row_create_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `report_element_ibfk_99` FOREIGN KEY (`row_revise_contact_id`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=340 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(11) unsigned NOT NULL DEFAULT '0',
  `authority` varchar(255) NOT NULL,
  `row_create_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_create_time` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `row_revise_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_revise_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `authority` (`authority`),
  KEY `row_create_contact_id` (`row_create_contact_id`),
  KEY `row_revise_contact_id` (`row_revise_contact_id`),
  CONSTRAINT `role_ibfk_88` FOREIGN KEY (`row_create_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `role_ibfk_99` FOREIGN KEY (`row_revise_contact_id`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `site`
--

DROP TABLE IF EXISTS `site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `parent_site_id` int(11) unsigned DEFAULT NULL,
  `row_create_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_create_time` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `row_revise_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_revise_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `no_twins` (`name`,`parent_site_id`),
  KEY `parent_site_id` (`parent_site_id`),
  KEY `row_create_contact_id` (`row_create_contact_id`),
  KEY `row_revise_contact_id` (`row_revise_contact_id`),
  CONSTRAINT `site_ibfk_1` FOREIGN KEY (`parent_site_id`) REFERENCES `site` (`id`) ON DELETE SET NULL,
  CONSTRAINT `site_ibfk_88` FOREIGN KEY (`row_create_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `site_ibfk_99` FOREIGN KEY (`row_revise_contact_id`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='from dmg_merged_ml.classification where type_id=3';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tape`
--

DROP TABLE IF EXISTS `tape`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tape` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `dataset_id` int(11) unsigned NOT NULL DEFAULT '0',
  `begin_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `contents_note` varchar(255) DEFAULT NULL,
  `format_id` int(11) unsigned NOT NULL DEFAULT '1',
  `size_kb` bigint(20) unsigned NOT NULL DEFAULT '0',
  `num_files` int(11) NOT NULL DEFAULT '1',
  `sequence_number` int(11) unsigned NOT NULL DEFAULT '1',
  `primary_label` varchar(15) DEFAULT NULL,
  `primary_medium_id` int(11) unsigned NOT NULL DEFAULT '0',
  `backup_label` varchar(15) DEFAULT NULL,
  `backup_medium_id` int(11) unsigned NOT NULL DEFAULT '0',
  `visible` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `data_archive_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `row_create_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_create_time` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `row_revise_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_revise_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sequence` (`dataset_id`,`sequence_number`),
  KEY `dataset_id` (`dataset_id`),
  KEY `format_id` (`format_id`),
  KEY `primary_medium_id` (`primary_medium_id`),
  KEY `backup_medium_id` (`backup_medium_id`),
  KEY `row_create_contact_id` (`row_create_contact_id`),
  KEY `row_revise_contact_id` (`row_revise_contact_id`),
  CONSTRAINT `tape_ibfk_1` FOREIGN KEY (`dataset_id`) REFERENCES `dataset` (`id`),
  CONSTRAINT `tape_ibfk_2` FOREIGN KEY (`format_id`) REFERENCES `format` (`id`),
  CONSTRAINT `tape_ibfk_3` FOREIGN KEY (`primary_medium_id`) REFERENCES `medium` (`id`),
  CONSTRAINT `tape_ibfk_4` FOREIGN KEY (`backup_medium_id`) REFERENCES `medium` (`id`),
  CONSTRAINT `tape_ibfk_88` FOREIGN KEY (`row_create_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `tape_ibfk_99` FOREIGN KEY (`row_revise_contact_id`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2131 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(11) unsigned NOT NULL DEFAULT '0',
  `account_expired` bit(1) NOT NULL DEFAULT b'0',
  `account_locked` bit(1) NOT NULL DEFAULT b'0',
  `enabled` bit(1) NOT NULL DEFAULT b'0',
  `password` varchar(255) NOT NULL DEFAULT 'xxxxx' COMMENT 'i.e. NULL, use UCAS auth',
  `password_expired` bit(1) NOT NULL DEFAULT b'0',
  `user_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `username` varchar(255) NOT NULL,
  `last_login_time` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `last_login_host` varchar(255) DEFAULT NULL,
  `row_create_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_create_time` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `row_revise_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_revise_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `user_contact_id` (`user_contact_id`),
  KEY `row_create_contact_id` (`row_create_contact_id`),
  KEY `row_revise_contact_id` (`row_revise_contact_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`user_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `user_ibfk_88` FOREIGN KEY (`row_create_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `user_ibfk_99` FOREIGN KEY (`row_revise_contact_id`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `user_id` int(11) unsigned NOT NULL,
  `role_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`user_id`),
  KEY `user_id` (`user_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vertical_resolution`
--

DROP TABLE IF EXISTS `vertical_resolution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vertical_resolution` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(15) NOT NULL DEFAULT '',
  `gcmd_name` varchar(255) DEFAULT NULL COMMENT 'GCMD "Data Resolution"',
  `sort_key` smallint(5) unsigned NOT NULL DEFAULT '65534',
  `row_create_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_create_time` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `row_revise_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_revise_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `sort_key` (`sort_key`),
  KEY `row_create_contact_id` (`row_create_contact_id`),
  KEY `row_revise_contact_id` (`row_revise_contact_id`),
  CONSTRAINT `vertical_resolution_ibfk_88` FOREIGN KEY (`row_create_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `vertical_resolution_ibfk_99` FOREIGN KEY (`row_revise_contact_id`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `xlink`
--

DROP TABLE IF EXISTS `xlink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xlink` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `href` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) DEFAULT NULL,
  `purpose` enum('info','map','homepage','download','catalog','project_logo','project_stylesheet') NOT NULL DEFAULT 'info' COMMENT 'logo, stylesheet to be incorporated into skin',
  `visible` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `row_create_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_create_time` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `row_revise_contact_id` int(11) unsigned NOT NULL DEFAULT '1',
  `row_revise_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `href` (`href`),
  KEY `row_create_contact_id` (`row_create_contact_id`),
  KEY `row_revise_contact_id` (`row_revise_contact_id`),
  CONSTRAINT `xlink_ibfk_88` FOREIGN KEY (`row_create_contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `xlink_ibfk_99` FOREIGN KEY (`row_revise_contact_id`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1879 DEFAULT CHARSET=utf8 COMMENT='external to data system; internals use dataset_reference';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-02-20 11:38:12

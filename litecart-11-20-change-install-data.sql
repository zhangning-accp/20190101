/*
SQLyog Ultimate v12.4.3 (64 bit)
MySQL - 5.7.11 : Database - litecart
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `lc_cart_items` */

DROP TABLE IF EXISTS `lc_cart_items`;

CREATE TABLE `lc_cart_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `cart_uid` varchar(13) NOT NULL,
  `key` varchar(32) NOT NULL,
  `product_id` int(11) NOT NULL,
  `options` varchar(2048) NOT NULL,
  `quantity` decimal(11,4) NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `cart_uid` (`cart_uid`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `lc_cart_items` */

/*Table structure for table `lc_categories` */

DROP TABLE IF EXISTS `lc_categories`;

CREATE TABLE `lc_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `google_taxonomy_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `code` varchar(64) NOT NULL,
  `list_style` varchar(32) NOT NULL,
  `dock` varchar(32) NOT NULL,
  `keywords` varchar(256) NOT NULL,
  `image` varchar(256) NOT NULL,
  `priority` tinyint(2) NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `code` (`code`),
  KEY `parent_id` (`parent_id`),
  KEY `status` (`status`),
  KEY `dock` (`dock`)
) ENGINE=MyISAM AUTO_INCREMENT=303 DEFAULT CHARSET=utf8;

/*Data for the table `lc_categories` */

/*Table structure for table `lc_categories_info` */

DROP TABLE IF EXISTS `lc_categories_info`;

CREATE TABLE `lc_categories_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `language_code` varchar(2) NOT NULL,
  `name` varchar(128) NOT NULL,
  `short_description` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `head_title` varchar(128) NOT NULL,
  `h1_title` varchar(128) NOT NULL,
  `meta_description` varchar(512) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category` (`category_id`,`language_code`),
  KEY `category_id` (`category_id`),
  KEY `language_code` (`language_code`)
) ENGINE=MyISAM AUTO_INCREMENT=297 DEFAULT CHARSET=utf8;

/*Data for the table `lc_categories_info` */

/*Table structure for table `lc_countries` */

DROP TABLE IF EXISTS `lc_countries`;

CREATE TABLE `lc_countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(64) NOT NULL,
  `domestic_name` varchar(64) NOT NULL,
  `iso_code_1` varchar(3) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `tax_id_format` varchar(64) NOT NULL,
  `address_format` varchar(128) NOT NULL,
  `postcode_format` varchar(512) NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `language_code` varchar(2) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `phone_code` varchar(3) NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `iso_code_2` (`iso_code_2`),
  UNIQUE KEY `iso_code_3` (`iso_code_3`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=245 DEFAULT CHARSET=utf8;

/*Data for the table `lc_countries` */

insert  into `lc_countries`(`id`,`status`,`name`,`domestic_name`,`iso_code_1`,`iso_code_2`,`iso_code_3`,`tax_id_format`,`address_format`,`postcode_format`,`postcode_required`,`language_code`,`currency_code`,`phone_code`,`date_updated`,`date_created`) values 
(1,1,'Afghanistan','','004','AF','AFG','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'fa','AFN','93','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(2,1,'Albania','','008','AL','ALB','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'sq','ALL','355','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(3,1,'Algeria','','012','DZ','DZA','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'ar','DZD','213','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(4,1,'American Samoa','','016','AS','ASM','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','96799',0,'en','USD','168','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(5,1,'Andorra','','020','AD','AND','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','AD[0-9]{3}',0,'ca','EUR','376','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(6,1,'Angola','','024','AO','AGO','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'pt','AOA','244','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(7,1,'Anguilla','','660','AI','AIA','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','XCD','126','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(8,1,'Antarctica','','010','AQ','ATA','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'','XCD','672','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(9,1,'Antigua and Barbuda','','028','AG','ATG','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','XCD','126','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(10,1,'Argentina','','032','AR','ARG','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','([A-HJ-NP-Z])?[0-9]{4}([A-Z]{3})?',0,'es','ARS','54','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(11,1,'Armenia','','051','AM','ARM','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','(37)?[0-9]{4}',0,'hy','AMD','374','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(12,1,'Aruba','','533','AW','ABW','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'nl','AWG','297','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(13,1,'Australia','','036','AU','AUS','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'en','AUD','61','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(14,1,'Austria','','040','AT','AUT','^(AT)?U[0-9]{8}$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'de','EUR','43','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(15,1,'Azerbaijan','','031','AZ','AZE','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'az','AZN','994','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(16,1,'Bahamas','','044','BS','BHS','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','BSD','124','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(17,1,'Bahrain','','048','BH','BHR','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','((1[0-2]|[2-9])[0-9]{2})?',0,'ar','BHD','973','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(18,1,'Bangladesh','','050','BD','BGD','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'bn','BDT','880','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(19,1,'Barbados','','052','BB','BRB','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','(BB[0-9]{5})?',0,'en','BBD','124','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(20,1,'Belarus','','112','BY','BLR','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{6}',0,'be','BYR','375','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(21,1,'Belgium','','056','BE','BEL','^(BE)?0[0-9]{9}$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'nl','EUR','32','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(22,1,'Belize','','084','BZ','BLZ','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','BZD','501','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(23,1,'Benin','','204','BJ','BEN','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'fr','XOF','229','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(24,1,'Bermuda','','060','BM','BMU','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[A-Z]{2}[ ]?[A-Z0-9]{2}',0,'en','BMD','144','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(25,1,'Bhutan','','064','BT','BTN','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'dz','BTN','975','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(26,1,'Bolivia','','068','BO','BOL','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'es','BOB','591','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(27,1,'Bosnia and Herzegowina','','070','BA','BIH','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'bs','BAM','387','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(28,1,'Botswana','','072','BW','BWA','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','BWP','267','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(29,1,'Bouvet Island','','074','BV','BVT','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'','NOK','47','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(30,1,'Brazil','','076','BR','BRA','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}[\\-]?[0-9]{3}',0,'pt','BRL','55','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(31,1,'British Indian Ocean Territory','','086','IO','IOT','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','BBND 1ZZ',0,'en','USD','246','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(32,1,'Brunei Darussalam','','096','BN','BRN','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[A-Z]{2}[ ]?[0-9]{4}',0,'ms','BND','673','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(33,1,'Bulgaria','','100','BG','BGR','^(BG)?[0-9]{9,10}$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'bg','BGN','359','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(34,1,'Burkina Faso','','854','BF','BFA','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'fr','XOF','226','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(35,1,'Burundi','','108','BI','BDI','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'fr','BIF','257','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(36,1,'Cambodia','','116','KH','KHM','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'km','KHR','855','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(37,1,'Cameroon','','120','CM','CMR','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','XAF','237','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(38,1,'Canada','','124','CA','CAN','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[ABCEGHJKLMNPRSTVXY][0-9][ABCEGHJ-NPRSTV-Z][ ]?[0-9][ABCEGHJ-NPRSTV-Z][0-9]',0,'en','CAD','1','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(39,1,'Cape Verde','','132','CV','CPV','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'pt','CVE','238','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(40,1,'Cayman Islands','','136','KY','CYM','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','KYD','134','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(41,1,'Central African Republic','','140','CF','CAF','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'fr','XAF','236','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(42,1,'Chad','','148','TD','TCD','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'fr','XAF','235','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(43,1,'Chile','','152','CL','CHL','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'es','CLP','56','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(44,1,'China','','156','CN','CHN','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{6}',0,'zh','CNY','86','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(45,1,'Christmas Island','','162','CX','CXR','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','6798',0,'en','AUD','61','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(46,1,'Cocos (Keeling) Islands','','166','CC','CCK','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','6799',0,'ms','AUD','61','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(47,1,'Colombia','','170','CO','COL','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'es','COP','57','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(48,1,'Comoros','','174','KM','COM','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'ar','KMF','269','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(49,1,'Congo','','178','CG','COG','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'fr','XAF','242','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(50,1,'Cook Islands','','184','CK','COK','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'en','NZD','682','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(51,1,'Costa Rica','','188','CR','CRI','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4,5}|[0-9]{3}-[0-9]{4}',0,'es','CRC','506','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(52,1,'Cote D\'Ivoire','','384','CI','CIV','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'fr','XOF','225','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(53,1,'Croatia','','191','HR','HRV','^(HR)?[0-9]{11}$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'hr','HRK','385','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(54,1,'Cuba','','192','CU','CUB','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'es','CUP','53','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(55,1,'Cyprus','','196','CY','CYP','^(CY)?[0-9]{8}L$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'el','EUR','357','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(56,1,'Czech Republic','','203','CZ','CZE','^(CZ)?[0-9]{8,10}$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{3}[ ]?[0-9]{2}',0,'cs','CZK','420','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(57,1,'Denmark','','208','DK','DNK','^(DK)?[0-9]{8}$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'da','DKK','45','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(58,1,'Djibouti','','262','DJ','DJI','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'fr','DJF','253','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(59,1,'Dominica','','212','DM','DMA','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','XCD','176','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(60,1,'Dominican Republic','','214','DO','DOM','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'es','DOP','180','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(61,1,'East Timor','','626','TP','TMP','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'','USD','670','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(62,1,'Ecuador','','218','EC','ECU','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','([A-Z][0-9]{4}[A-Z]|(?:[A-Z]{2})?[0-9]{6})?',0,'es','ECS','593','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(63,1,'Egypt','','818','EG','EGY','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'ar','EGP','20','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(64,1,'El Salvador','','222','SV','SLV','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'es','SVC','503','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(65,1,'Equatorial Guinea','','226','GQ','GNQ','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'es','XAF','240','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(66,1,'Eritrea','','232','ER','ERI','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'aa','ERN','291','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(67,1,'Estonia','','233','EE','EST','^(EE)?[0-9]{9}$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'et','EUR','372','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(68,1,'Ethiopia','','231','ET','ETH','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'am','ETB','251','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(69,1,'Falkland Islands (Malvinas)','','238','FK','FLK','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','FIQQ 1ZZ',0,'en','FKP','500','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(70,1,'Faroe Islands','','234','FO','FRO','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{3}',0,'fo','DKK','298','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(71,1,'Fiji','','242','FJ','FJI','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','FJD','679','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(72,1,'Finland','','246','FI','FIN','^(FI)?[0-9]{8}$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'fi','EUR','358','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(73,1,'France','','250','FR','FRA','^(FR)?[0-9A-Z]{2}[0-9]{9}$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{2}[ ]?[0-9]{3}',0,'fr','EUR','33','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(75,1,'French Guiana','','254','GF','GUF','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','9[78]3[0-9]{2}',0,'fr','EUR','594','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(76,1,'French Polynesia','','258','PF','PYF','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','987[0-9]{2}',0,'fr','XPF','689','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(77,1,'French Southern Territories','','260','TF','ATF','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'fr','EUR','262','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(78,1,'Gabon','','266','GA','GAB','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'fr','XAF','241','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(79,1,'Gambia','','270','GM','GMB','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','GMD','220','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(80,1,'Georgia','','268','GE','GEO','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'ka','GEL','995','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(81,1,'Germany','','276','DE','DEU','^(DE)?[0-9]{9}$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'de','EUR','49','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(82,1,'Ghana','','288','GH','GHA','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','GHS','233','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(83,1,'Gibraltar','','292','GI','GIB','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','GIP','350','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(84,1,'Greece','','300','GR','GRC','^(EL|GR)?[0-9]{9}$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{3}[ ]?[0-9]{2}',0,'el','EUR','30','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(85,1,'Greenland','','304','GL','GRL','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','39[0-9]{2}',0,'kl','DKK','299','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(86,1,'Grenada','','308','GD','GRD','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','XCD','147','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(87,1,'Guadeloupe','','312','GP','GLP','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','9[78][01][0-9]{2}',0,'fr','EUR','590','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(88,1,'Guam','','316','GU','GUM','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','969[123][0-9]([ \\-][0-9]{4})?',0,'en','USD','167','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(89,1,'Guatemala','','320','GT','GTM','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'es','QTQ','502','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(90,1,'Guinea','','324','GN','GIN','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{3}',0,'fr','GNF','224','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(91,1,'Guinea-bissau','','624','GW','GNB','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'pt','GWP','245','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(92,1,'Guyana','','328','GY','GUY','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','GYD','592','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(93,1,'Haiti','','332','HT','HTI','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'ht','HTG','509','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(94,1,'Heard and McDonald Islands','','334','HM','HMD','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'','AUD','0','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(95,1,'Honduras','','340','HN','HND','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','(?:[0-9]{5})?',0,'es','HNL','504','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(96,1,'Hong Kong','','344','HK','HKG','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'zh','HKD','852','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(97,1,'Hungary','','348','HU','HUN','^(HU)?[0-9]{8}$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'hu','HUF','36','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(98,1,'Iceland','','352','IS','ISL','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{3}',0,'is','ISK','354','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(99,1,'India','','356','IN','IND','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{6}',0,'en','INR','91','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(100,1,'Indonesia','','360','ID','IDN','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'id','IDR','62','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(101,1,'Iran, Islamic Republic of','','364','IR','IRN','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'fa','IRR','98','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(102,1,'Iraq','','368','IQ','IRQ','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'ar','IQD','964','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(103,1,'Ireland','','372','IE','IRL','^(IE)?[0-9]S[0-9]{5}L$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','EUR','353','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(104,1,'Israel','','376','IL','ISR','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'he','ILS','972','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(105,1,'Italy','','380','IT','ITA','^(IT)?[0-9]{11}$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'it','EUR','39','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(106,1,'Jamaica','','388','JM','JAM','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','JMD','187','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(107,1,'Japan','','392','JP','JPN','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{3}-[0-9]{4}',0,'ja','JPY','81','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(108,1,'Jordan','','400','JO','JOR','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'ar','JOD','962','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(109,1,'Kazakhstan','','398','KZ','KAZ','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{6}',0,'kk','KZT','7','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(110,1,'Kenya','','404','KE','KEN','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'en','KES','254','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(111,1,'Kiribati','','296','KI','KIR','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','AUD','686','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(112,1,'North Korea','','408','KP','PRK','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'ko','KPW','850','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(113,1,'Korea, Republic of','','410','KR','KOR','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{3}[\\-][0-9]{3}',0,'ko','KRW','82','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(114,1,'Kuwait','','414','KW','KWT','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'ar','KWD','965','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(115,1,'Kyrgyzstan','','417','KG','KGZ','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{6}',0,'ky','KGS','996','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(116,1,'Lao People\'s Democratic Republic','','418','LA','LAO','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'lo','LAK','856','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(117,1,'Latvia','','428','LV','LVA','^(LV)?[0-9]{11}$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'lv','LVL','371','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(118,1,'Lebanon','','422','LB','LBN','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','([0-9]{4}([ ]?[0-9]{4})?)?',0,'ar','LBP','961','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(119,1,'Lesotho','','426','LS','LSO','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{3}',0,'en','LSL','266','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(120,1,'Liberia','','430','LR','LBR','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'en','LRD','231','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(121,1,'Libyan Arab Jamahiriya','','434','LY','LBY','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'ar','LYD','218','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(122,1,'Liechtenstein','','438','LI','LIE','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','(948[5-9])|(949[0-7])',0,'de','CHF','423','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(123,1,'Lithuania','','440','LT','LTU','^(LT)?([0-9]{9}|[0-9]{12})$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'lt','LTL','370','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(124,1,'Luxembourg','','442','LU','LUX','^(LU)?[0-9]{8}$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'lb','EUR','352','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(125,1,'Macau','','446','MO','MAC','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'zh','MOP','853','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(126,1,'Macedonia','','807','MK','MKD','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'mk','MKD','389','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(127,1,'Madagascar','','450','MG','MDG','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{3}',0,'fr','MGF','261','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(128,1,'Malawi','','454','MW','MWI','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'ny','MWK','265','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(129,1,'Malaysia','','458','MY','MYS','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'ms','MYR','60','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(130,1,'Maldives','','462','MV','MDV','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'dv','MVR','960','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(131,1,'Mali','','466','ML','MLI','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'fr','XOF','223','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(132,1,'Malta','','470','MT','MLT','^(MT)?[0-9]{8}$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'mt','EUR','356','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(133,1,'Marshall Islands','','584','MH','MHL','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','969[67][0-9]([ \\-][0-9]{4})?',0,'mh','USD','692','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(134,1,'Martinique','','474','MQ','MTQ','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','9[78]2[0-9]{2}',0,'fr','EUR','596','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(135,1,'Mauritania','','478','MR','MRT','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'ar','MRO','222','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(136,1,'Mauritius','','480','MU','MUS','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','([0-9]{3}[A-Z]{2}[0-9]{3})?',0,'en','MUR','230','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(137,1,'Mayotte','','175','YT','MYT','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','976[0-9]{2}',0,'fr','EUR','262','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(138,1,'Mexico','','484','MX','MEX','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'es','MXN','52','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(139,1,'Micronesia, Federated States of','','583','FM','FSM','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','(9694[1-4])([ \\-][0-9]{4})?',0,'en','USD','691','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(140,1,'Moldova, Republic of','','498','MD','MDA','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'ro','MDL','373','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(141,1,'Monaco','','492','MC','MCO','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','980[0-9]{2}',0,'fr','EUR','377','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(142,1,'Mongolia','','496','MN','MNG','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{6}',0,'mn','MNT','976','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(143,1,'Montserrat','','500','MS','MSR','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','XCD','166','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(144,1,'Morocco','','504','MA','MAR','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'ar','MAD','212','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(145,1,'Mozambique','','508','MZ','MOZ','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'pt','MZN','258','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(146,1,'Myanmar','','104','MM','MMR','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'my','MMK','95','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(147,1,'Namibia','','516','NA','NAM','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','NAD','264','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(148,1,'Nauru','','520','NR','NRU','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'na','AUD','674','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(149,1,'Nepal','','524','NP','NPL','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'ne','NPR','977','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(150,1,'Netherlands','','528','NL','NLD','^(NL)?[0-9]{9}B[0-9]{2}$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[1-9][0-9]{3} ?[a-zA-Z]{2}',0,'nl','EUR','31','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(151,1,'Netherlands Antilles','','530','AN','ANT','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'nl','ANG','599','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(152,1,'New Caledonia','','540','NC','NCL','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','988[0-9]{2}',0,'fr','XPF','687','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(153,1,'New Zealand','','554','NZ','NZL','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'en','NZD','64','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(154,1,'Nicaragua','','558','NI','NIC','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','(([0-9]{4}-)?[0-9]{3}-[0-9]{3}(-[0-9]{1})?)?',0,'es','NIO','505','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(155,1,'Niger','','562','NE','NER','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'fr','XOF','227','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(156,1,'Nigeria','','566','NG','NGA','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','([0-9]{6})?',0,'en','NGN','234','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(157,1,'Niue','','570','NU','NIU','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','NZD','683','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(158,1,'Norfolk Island','','574','NF','NFK','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','2899',0,'en','AUD','672','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(159,1,'Northern Mariana Islands','','580','MP','MNP','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','9695[012]([ \\-][0-9]{4})?',0,'tl','USD','167','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(160,1,'Norway','','578','NO','NOR','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'no','NOK','47','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(161,1,'Oman','','512','OM','OMN','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','(PC )?[0-9]{3}',0,'ar','OMR','968','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(162,1,'Pakistan','','586','PK','PAK','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'ur','PKR','92','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(163,1,'Palau','','585','PW','PLW','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','96940',0,'en','USD','680','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(164,1,'Panama','','591','PA','PAN','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'es','PAB','507','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(165,1,'Papua New Guinea','','598','PG','PNG','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{3}',0,'en','PGK','675','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(166,1,'Paraguay','','600','PY','PRY','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'es','PYG','595','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(167,1,'Peru','','604','PE','PER','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'es','PEN','51','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(168,1,'Philippines','','608','PH','PHL','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'tl','PHP','63','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(169,1,'Pitcairn','','612','PN','PCN','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','PCRN 1ZZ',0,'en','NZD','870','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(170,1,'Poland','','616','PL','POL','^(PL)?[0-9]{10}$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{2}-[0-9]{3}',0,'pl','PLN','48','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(171,1,'Portugal','','620','PT','PRT','^(PT)?[0-9]{9}$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}([\\-][0-9]{3})?',0,'pt','EUR','351','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(172,1,'Puerto Rico','','630','PR','PRI','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','00[679][0-9]{2}([ \\-][0-9]{4})?',0,'en','USD','1','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(173,1,'Qatar','','634','QA','QAT','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'ar','QAR','974','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(174,1,'Reunion','','638','RE','REU','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','9[78]4[0-9]{2}',0,'fr','EUR','262','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(175,1,'Romania','','642','RO','ROM','^(RO)?[0-9]{2,10}$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{6}',0,'ro','RON','40','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(176,1,'Russian Federation','','643','RU','RUS','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{6}',0,'ru','RUB','7','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(177,1,'Rwanda','','646','RW','RWA','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'rw','RWF','250','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(178,1,'Saint Kitts and Nevis','','659','KN','KNA','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','XCD','186','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(179,1,'Saint Lucia','','662','LC','LCA','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','XCD','175','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(180,1,'Saint Vincent and the Grenadines','','670','VC','VCT','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','XCD','178','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(181,1,'Samoa','','882','WS','WSM','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'sm','WST','685','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(182,1,'San Marino','','674','SM','SMR','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','4789[0-9]',0,'it','EUR','378','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(183,1,'Sao Tome and Principe','','678','ST','STP','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'pt','STD','239','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(184,1,'Saudi Arabia','','682','SA','SAU','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'ar','SAR','966','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(185,1,'Senegal','','686','SN','SEN','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'fr','XOF','221','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(186,1,'Seychelles','','690','SC','SYC','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','SCR','248','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(187,1,'Sierra Leone','','694','SL','SLE','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','SLL','232','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(188,1,'Singapore','','702','SG','SGP','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{6}',0,'en','SGD','65','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(189,1,'Slovak Republic','','703','SK','SVK','^(SK)?[0-9]{10}$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{3}[ ]?[0-9]{2}',0,'sk','EUR','421','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(190,1,'Slovenia','','705','SI','SVN','^(SI)?[0-9]{8}$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'sl','EUR','386','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(191,1,'Solomon Islands','','090','SB','SLB','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','SBD','677','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(192,1,'Somalia','','706','SO','SOM','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'so','SOS','252','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(193,1,'South Africa','','710','ZA','ZAF','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'zu','ZAR','27','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(194,1,'South Georgia and South Sandwich Islands','','239','GS','SGS','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','SIQQ 1ZZ',0,'en','GBP','500','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(195,1,'Spain','','724','ES','ESP','^(ES)?[0-9A-Z][0-9]{7}[0-9A-Z]$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'es','EUR','34','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(196,1,'Sri Lanka','','144','LK','LKA','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'si','LKR','94','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(197,1,'St. Helena','','654','SH','SHN','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','(ASCN|STHL) 1ZZ',0,'en','SHP','290','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(198,1,'St. Pierre and Miquelon','','666','PM','SPM','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','9[78]5[0-9]{2}',0,'fr','EUR','508','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(199,1,'Sudan','','729','SD','SDN','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'ar','SDG','249','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(200,1,'Suriname','','740','SR','SUR','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'nl','SRD','597','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(201,1,'Svalbard and Jan Mayen Islands','','744','SJ','SJM','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'no','NOK','47','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(202,1,'Swaziland','','748','SZ','SWZ','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[HLMS][0-9]{3}',0,'en','SZL','268','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(203,1,'Sweden','','752','SE','SWE','^(SE)?(16|19|20)?[0-9]{6}-?[0-9]{4}?(01)?$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{3}[ ]?[0-9]{2}',0,'sv','SEK','46','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(204,1,'Switzerland','','756','CH','CHE','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'de','CHF','41','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(205,1,'Syrian Arab Republic','','760','SY','SYR','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'ar','SYP','963','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(206,1,'Taiwan','','158','TW','TWN','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{3}([0-9]{2})?',0,'zh','TWD','886','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(207,1,'Tajikistan','','762','TJ','TJK','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{6}',0,'tg','TJS','992','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(208,1,'Tanzania, United Republic of','','834','TZ','TZA','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'sw','TZS','255','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(209,1,'Thailand','','764','TH','THA','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'th','THB','66','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(210,1,'Togo','','768','TG','TGO','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'fr','XOF','228','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(211,1,'Tokelau','','772','TK','TKL','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','NZD','690','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(212,1,'Tonga','','776','TO','TON','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'to','TOP','676','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(213,1,'Trinidad and Tobago','','780','TT','TTO','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','TTD','186','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(214,1,'Tunisia','','788','TN','TUN','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'ar','TND','216','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(215,1,'Turkey','','792','TR','TUR','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'tr','TRY','90','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(216,1,'Turkmenistan','','795','TM','TKM','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{6}',0,'tk','TMT','993','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(217,1,'Turks and Caicos Islands','','796','TC','TCA','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','TKCA 1ZZ',0,'en','USD','164','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(218,1,'Tuvalu','','798','TV','TUV','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','AUD','688','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(219,1,'Uganda','','800','UG','UGA','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','UGX','256','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(220,1,'Ukraine','','804','UA','UKR','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'uk','UAH','380','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(221,1,'United Arab Emirates','','784','AE','ARE','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'ar','AED','971','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(222,1,'United Kingdom','','826','GB','GBR','^(GB)?([0-9]{9}([0-9]{3})?|[A-Z]{2}[0-9]{3})$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[a-zA-Z]{1,2}[0-9][0-9a-zA-Z]? ?[0-9][a-zA-Z]{2}',1,'en','GBP','44','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(223,1,'United States','','840','US','USA','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}([ \\-][0-9]{4})?',0,'en','USD','1','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(224,1,'United States Minor Outlying Islands','','581','UM','UMI','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','USD','1','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(225,1,'Uruguay','','858','UY','URY','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'es','UYU','598','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(226,1,'Uzbekistan','','860','UZ','UZB','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{6}',0,'uz','UZS','998','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(227,1,'Vanuatu','','548','VU','VUT','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'bi','VUV','678','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(228,1,'Vatican City State (Holy See)','','336','VA','VAT','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','00120',0,'la','EUR','39','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(229,1,'Venezuela','','862','VE','VEN','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'es','VEF','58','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(230,1,'Viet Nam','','704','VN','VNM','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'vi','VND','84','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(231,1,'Virgin Islands (British)','','092','VG','VGB','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','USD','128','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(232,1,'Virgin Islands (U.S.)','','850','VI','VIR','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','008(([0-4][0-9])|(5[01]))([ \\-][0-9]{4})?',0,'en','USD','134','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(233,1,'Wallis and Futuna Islands','','876','WF','WLF','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','986[0-9]{2}',0,'fr','XPF','681','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(234,1,'Western Sahara','','732','EH','ESH','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'ar','MAD','212','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(235,1,'Yemen','','887','YE','YEM','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'ar','YER','967','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(236,1,'Serbia','','381','RS','SRB','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'sr','RSD','381','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(237,1,'Democratic Republic of Congo','','180','CD','COD','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'fr','XAF','243','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(238,1,'Zambia','','894','ZM','ZMB','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'en','ZMW','260','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(239,1,'Zimbabwe','','716','ZW','ZWE','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','ZWD','263','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(240,1,'Guernsey','','831','GG','GGY','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','','44','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(241,1,'Montenegro','','499','ME','MNE','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','','382','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(242,1,'Jersey','','832','JE','JEY','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','','44','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(243,1,'Isle of Man','','833','IM','IMN','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','','44','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(244,1,'?land Islands','','248','AX','ALA','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'sv','EUR','358','2018-09-13 09:01:11','2018-09-13 09:01:11');

/*Table structure for table `lc_currencies` */

DROP TABLE IF EXISTS `lc_currencies`;

CREATE TABLE `lc_currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `code` varchar(3) NOT NULL,
  `number` varchar(3) NOT NULL,
  `name` varchar(32) NOT NULL,
  `value` decimal(11,6) NOT NULL,
  `decimals` tinyint(1) NOT NULL,
  `prefix` varchar(8) NOT NULL,
  `suffix` varchar(8) NOT NULL,
  `priority` tinyint(2) NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `lc_currencies` */

insert  into `lc_currencies`(`id`,`status`,`code`,`number`,`name`,`value`,`decimals`,`prefix`,`suffix`,`priority`,`date_updated`,`date_created`) values 
(1,1,'USD','840','US Dollars',1.000000,2,'$','',0,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(2,1,'EUR','978','Euros',0.726000,2,'',' €',0,'2018-09-13 09:01:11','2018-09-13 09:01:11');

/*Table structure for table `lc_customers` */

DROP TABLE IF EXISTS `lc_customers`;

CREATE TABLE `lc_customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `email` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `tax_id` varchar(32) NOT NULL,
  `company` varchar(64) NOT NULL,
  `firstname` varchar(64) NOT NULL,
  `lastname` varchar(64) NOT NULL,
  `address1` varchar(64) NOT NULL,
  `address2` varchar(64) NOT NULL,
  `postcode` varchar(16) NOT NULL,
  `city` varchar(32) NOT NULL,
  `country_code` varchar(4) NOT NULL,
  `zone_code` varchar(8) NOT NULL,
  `phone` varchar(24) NOT NULL,
  `different_shipping_address` tinyint(1) NOT NULL,
  `shipping_company` varchar(64) NOT NULL,
  `shipping_firstname` varchar(64) NOT NULL,
  `shipping_lastname` varchar(64) NOT NULL,
  `shipping_address1` varchar(64) NOT NULL,
  `shipping_address2` varchar(64) NOT NULL,
  `shipping_city` varchar(32) NOT NULL,
  `shipping_postcode` varchar(16) NOT NULL,
  `shipping_country_code` varchar(4) NOT NULL,
  `shipping_zone_code` varchar(8) NOT NULL,
  `shipping_phone` varchar(24) NOT NULL,
  `newsletter` tinyint(1) NOT NULL DEFAULT '1',
  `notes` text NOT NULL,
  `password_reset_token` varchar(128) NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `lc_customers` */

insert  into `lc_customers`(`id`,`code`,`status`,`email`,`password`,`tax_id`,`company`,`firstname`,`lastname`,`address1`,`address2`,`postcode`,`city`,`country_code`,`zone_code`,`phone`,`different_shipping_address`,`shipping_company`,`shipping_firstname`,`shipping_lastname`,`shipping_address1`,`shipping_address2`,`shipping_city`,`shipping_postcode`,`shipping_country_code`,`shipping_zone_code`,`shipping_phone`,`newsletter`,`notes`,`password_reset_token`,`date_updated`,`date_created`) values 
(1,'',1,'user@email.com','000000000000000000000000000000000000000000000000','0000000000','ACME Corp.','John','Doe','Longway Street 1','','12345','Newtown','US','CA','1-555-123-4567',0,'','','','','','','','','','',0,'','','2018-09-13 09:01:11','2018-09-13 09:01:11');

/*Table structure for table `lc_delivery_statuses` */

DROP TABLE IF EXISTS `lc_delivery_statuses`;

CREATE TABLE `lc_delivery_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `lc_delivery_statuses` */

insert  into `lc_delivery_statuses`(`id`,`date_updated`,`date_created`) values 
(1,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(2,'2018-09-13 09:01:11','2018-09-13 09:01:11');

/*Table structure for table `lc_delivery_statuses_info` */

DROP TABLE IF EXISTS `lc_delivery_statuses_info`;

CREATE TABLE `lc_delivery_statuses_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `delivery_status_id` int(11) NOT NULL,
  `language_code` varchar(2) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `delivery_status` (`delivery_status_id`,`language_code`),
  KEY `delivery_status_id` (`delivery_status_id`),
  KEY `language_code` (`language_code`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `lc_delivery_statuses_info` */

insert  into `lc_delivery_statuses_info`(`id`,`delivery_status_id`,`language_code`,`name`,`description`) values 
(1,1,'en','1-3 days',''),
(2,2,'en','3-5 days','');

/*Table structure for table `lc_geo_zones` */

DROP TABLE IF EXISTS `lc_geo_zones`;

CREATE TABLE `lc_geo_zones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(256) NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `lc_geo_zones` */

insert  into `lc_geo_zones`(`id`,`code`,`name`,`description`,`date_updated`,`date_created`) values 
(1,'','European Union','All countries in the European Union','2018-09-13 09:01:11','2018-09-13 09:01:11');

/*Table structure for table `lc_languages` */

DROP TABLE IF EXISTS `lc_languages`;

CREATE TABLE `lc_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `code` varchar(2) NOT NULL,
  `code2` varchar(3) NOT NULL,
  `name` varchar(32) NOT NULL,
  `locale` varchar(32) NOT NULL,
  `charset` varchar(16) NOT NULL,
  `raw_date` varchar(32) NOT NULL,
  `raw_time` varchar(32) NOT NULL,
  `raw_datetime` varchar(32) NOT NULL,
  `format_date` varchar(32) NOT NULL,
  `format_time` varchar(32) NOT NULL,
  `format_datetime` varchar(32) NOT NULL,
  `decimal_point` varchar(1) NOT NULL,
  `thousands_sep` varchar(1) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `priority` tinyint(2) NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `lc_languages` */

insert  into `lc_languages`(`id`,`status`,`code`,`code2`,`name`,`locale`,`charset`,`raw_date`,`raw_time`,`raw_datetime`,`format_date`,`format_time`,`format_datetime`,`decimal_point`,`thousands_sep`,`currency_code`,`priority`,`date_updated`,`date_created`) values 
(1,1,'en','eng','English','en_US.utf8,en_US.UTF-8,english','UTF-8','m/d/y','h:i:s A','m/d/y h:i:s A','%b %e %Y','%I:%M %p','%b %e %Y %I:%M %p','.',',','',0,'2018-09-13 09:01:11','2018-09-13 09:01:11');

/*Table structure for table `lc_manufacturers` */

DROP TABLE IF EXISTS `lc_manufacturers`;

CREATE TABLE `lc_manufacturers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `featured` tinyint(1) NOT NULL,
  `code` varchar(32) NOT NULL,
  `name` varchar(64) NOT NULL,
  `keywords` varchar(256) NOT NULL,
  `image` varchar(256) NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `code` (`code`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `lc_manufacturers` */

insert  into `lc_manufacturers`(`id`,`status`,`featured`,`code`,`name`,`keywords`,`image`,`date_updated`,`date_created`) values 
(1,1,1,'acme','ACME Corp.','','manufacturers/1-acme-corp.png','2018-09-13 09:01:11','2018-09-13 09:01:11');

/*Table structure for table `lc_manufacturers_info` */

DROP TABLE IF EXISTS `lc_manufacturers_info`;

CREATE TABLE `lc_manufacturers_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturer_id` int(11) NOT NULL,
  `language_code` varchar(2) NOT NULL,
  `short_description` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `h1_title` varchar(128) NOT NULL,
  `head_title` varchar(128) NOT NULL,
  `meta_description` varchar(512) NOT NULL,
  `link` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `manufacturer` (`manufacturer_id`,`language_code`),
  KEY `manufacturer_id` (`manufacturer_id`),
  KEY `language_code` (`language_code`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `lc_manufacturers_info` */

insert  into `lc_manufacturers_info`(`id`,`manufacturer_id`,`language_code`,`short_description`,`description`,`h1_title`,`head_title`,`meta_description`,`link`) values 
(1,1,'en','','','','','','');

/*Table structure for table `lc_modules` */

DROP TABLE IF EXISTS `lc_modules`;

CREATE TABLE `lc_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` varchar(64) NOT NULL,
  `type` varchar(16) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `priority` tinyint(4) NOT NULL,
  `settings` text NOT NULL,
  `last_log` text NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `module_id` (`module_id`),
  KEY `type` (`type`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `lc_modules` */

insert  into `lc_modules`(`id`,`module_id`,`type`,`status`,`priority`,`settings`,`last_log`,`date_updated`,`date_created`) values 
(1,'ot_subtotal','order_total',1,1,'{\"status\":\"1\",\"priority\":\"1\"}','','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(2,'ot_shipping_fee','order_total',1,20,'{\"status\":\"1\",\"free_shipping_amount\":\"0\",\"priority\":\"20\"}','','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(3,'ot_payment_fee','order_total',1,30,'{\"status\":\"1\",\"priority\":\"30\"}','','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(4,'job_error_reporter','job',1,0,'{\"status\":\"1\",\"report_frequency\":\"Weekly\",\"email_receipient\":\"\",\"priority\":\"0\"}','','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(5,'sm_zone_weight','shipping',0,0,'{\"status\":\"1\",\"icon\":\"\",\"weight_class\":\"kg\",\"geo_zone_id_1\":\"\",\"weight_rate_table_1\":\"\",\"geo_zone_id_2\":\"\",\"weight_rate_table_2\":\"\",\"geo_zone_id_3\":\"\",\"weight_rate_table_3\":\"\",\"weight_rate_table_x\":\"5:8.95;10:15.95\",\"method\":\">=\",\"handling_fee\":\"0.00\",\"tax_class_id\":\"1\",\"priority\":\"0\"}','','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(8,'pm_cod','payment',0,0,'{\"status\":\"0\",\"icon\":\"\",\"fee\":\"0.00\",\"tax_class_id\":\"1\",\"order_status_id\":\"\",\"geo_zone_id\":\"\",\"priority\":\"0\"}','','2018-09-30 19:55:42','2018-09-29 17:26:05'),
(7,'pm_zn_payment','payment',1,1,'{\"status\":\"1\",\"icon\":\"http:\\/\\/img4.imgtn.bdimg.com\\/it\\/u=2355789716,2376923172&fm=200&gp=0.jpg\",\"fee\":\"3\",\"tax_class_id\":\"1\",\"order_status_id\":\"2\",\"geo_zone_id\":\"\",\"priority\":\"1\"}','','2018-10-15 14:52:13','2018-09-29 17:12:40');

/*Table structure for table `lc_option_groups` */

DROP TABLE IF EXISTS `lc_option_groups`;

CREATE TABLE `lc_option_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `function` varchar(32) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `sort` varchar(32) NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=142 DEFAULT CHARSET=utf8;

/*Data for the table `lc_option_groups` */

/*Table structure for table `lc_option_groups_info` */

DROP TABLE IF EXISTS `lc_option_groups_info`;

CREATE TABLE `lc_option_groups_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `language_code` varchar(2) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` varchar(512) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `language_code` (`language_code`)
) ENGINE=MyISAM AUTO_INCREMENT=142 DEFAULT CHARSET=utf8;

/*Data for the table `lc_option_groups_info` */

/*Table structure for table `lc_option_values` */

DROP TABLE IF EXISTS `lc_option_values`;

CREATE TABLE `lc_option_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `value` varchar(128) NOT NULL,
  `priority` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=441 DEFAULT CHARSET=utf8;

/*Data for the table `lc_option_values` */

/*Table structure for table `lc_option_values_info` */

DROP TABLE IF EXISTS `lc_option_values_info`;

CREATE TABLE `lc_option_values_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value_id` int(11) NOT NULL,
  `language_code` varchar(2) NOT NULL,
  `name` varchar(64) NOT NULL,
  `extension_name` varchar(64) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `value_id` (`value_id`),
  KEY `language_code` (`language_code`)
) ENGINE=MyISAM AUTO_INCREMENT=437 DEFAULT CHARSET=utf8;

/*Data for the table `lc_option_values_info` */

/*Table structure for table `lc_order_statuses` */

DROP TABLE IF EXISTS `lc_order_statuses`;

CREATE TABLE `lc_order_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `icon` varchar(24) NOT NULL,
  `color` varchar(7) NOT NULL,
  `is_sale` tinyint(1) NOT NULL,
  `is_archived` tinyint(1) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `priority` tinyint(2) NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `lc_order_statuses` */

insert  into `lc_order_statuses`(`id`,`icon`,`color`,`is_sale`,`is_archived`,`notify`,`priority`,`date_updated`,`date_created`) values 
(1,'fa-money','#c0c0c0',0,0,0,1,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(2,'fa-clock-o','#d7d96f',1,0,0,2,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(3,'fa-cog','#ffa851',1,0,0,3,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(4,'fa-truck','#99cc66',1,1,0,4,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(5,'fa-times','#ff6666',0,1,0,5,'2018-09-13 09:01:11','2018-09-13 09:01:11');

/*Table structure for table `lc_order_statuses_info` */

DROP TABLE IF EXISTS `lc_order_statuses_info`;

CREATE TABLE `lc_order_statuses_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_status_id` int(11) NOT NULL,
  `language_code` varchar(2) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(256) NOT NULL,
  `email_subject` varchar(128) NOT NULL,
  `email_message` varchar(2048) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_status_id` (`order_status_id`),
  KEY `language_code` (`language_code`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `lc_order_statuses_info` */

insert  into `lc_order_statuses_info`(`id`,`order_status_id`,`language_code`,`name`,`description`,`email_subject`,`email_message`) values 
(1,1,'en','Awaiting payment','','',''),
(2,2,'en','Pending','','',''),
(3,3,'en','Processing','','',''),
(4,4,'en','Dispatched','','',''),
(5,5,'en','Cancelled','','','');

/*Table structure for table `lc_orders` */

DROP TABLE IF EXISTS `lc_orders`;

CREATE TABLE `lc_orders` (
  `id` varchar(32) NOT NULL,
  `uid` varchar(32) NOT NULL,
  `order_number` varchar(32) DEFAULT NULL,
  `order_status_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_company` varchar(64) NOT NULL,
  `customer_firstname` varchar(64) NOT NULL,
  `customer_lastname` varchar(64) NOT NULL,
  `customer_email` varchar(128) NOT NULL,
  `customer_phone` varchar(24) NOT NULL,
  `customer_tax_id` varchar(32) NOT NULL,
  `customer_address1` varchar(64) NOT NULL,
  `customer_address2` varchar(64) NOT NULL,
  `customer_city` varchar(32) NOT NULL,
  `customer_postcode` varchar(16) NOT NULL,
  `customer_country_code` varchar(2) NOT NULL,
  `customer_zone_code` varchar(8) NOT NULL,
  `shipping_company` varchar(64) NOT NULL,
  `shipping_firstname` varchar(64) NOT NULL,
  `shipping_lastname` varchar(64) NOT NULL,
  `shipping_address1` varchar(64) NOT NULL,
  `shipping_address2` varchar(64) NOT NULL,
  `shipping_city` varchar(32) NOT NULL,
  `shipping_postcode` varchar(16) NOT NULL,
  `shipping_country_code` varchar(2) NOT NULL,
  `shipping_zone_code` varchar(8) NOT NULL,
  `shipping_phone` varchar(24) NOT NULL,
  `shipping_option_id` varchar(32) NOT NULL,
  `shipping_option_name` varchar(64) NOT NULL,
  `shipping_tracking_id` varchar(128) NOT NULL,
  `payment_option_id` varchar(32) NOT NULL,
  `payment_option_name` varchar(64) NOT NULL,
  `payment_transaction_id` varchar(128) NOT NULL,
  `language_code` varchar(2) NOT NULL,
  `weight_total` decimal(11,4) NOT NULL,
  `weight_class` varchar(2) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(11,6) NOT NULL,
  `payment_due` decimal(11,4) NOT NULL,
  `tax_total` decimal(11,4) NOT NULL,
  `client_ip` varchar(39) NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_status_id` (`order_status_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `lc_orders` */

/*Table structure for table `lc_orders_comments` */

DROP TABLE IF EXISTS `lc_orders_comments`;

CREATE TABLE `lc_orders_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(32) NOT NULL,
  `author` enum('system','staff','customer') NOT NULL,
  `text` varchar(512) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `lc_orders_comments` */

/*Table structure for table `lc_orders_items` */

DROP TABLE IF EXISTS `lc_orders_items`;

CREATE TABLE `lc_orders_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(32) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_stock_combination` varchar(32) NOT NULL,
  `options` varchar(4096) NOT NULL,
  `name` varchar(128) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `quantity` decimal(11,4) NOT NULL,
  `price` decimal(11,4) NOT NULL,
  `tax` decimal(11,4) NOT NULL,
  `weight` decimal(11,4) NOT NULL,
  `weight_class` varchar(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `lc_orders_items` */

/*Table structure for table `lc_orders_totals` */

DROP TABLE IF EXISTS `lc_orders_totals`;

CREATE TABLE `lc_orders_totals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(32) NOT NULL,
  `module_id` varchar(32) NOT NULL,
  `title` varchar(128) NOT NULL,
  `value` decimal(11,4) NOT NULL,
  `tax` decimal(11,4) NOT NULL,
  `calculate` tinyint(1) NOT NULL,
  `priority` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `lc_orders_totals` */

/*Table structure for table `lc_pages` */

DROP TABLE IF EXISTS `lc_pages`;

CREATE TABLE `lc_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `dock` varchar(64) NOT NULL,
  `priority` tinyint(2) NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `dock` (`dock`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `lc_pages` */

insert  into `lc_pages`(`id`,`status`,`dock`,`priority`,`date_updated`,`date_created`) values 
(1,1,'information',0,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(2,1,'customer_service,information',0,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(3,1,'customer_service,information',0,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(4,1,'customer_service,information',0,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(5,1,'customer_service,information',0,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(6,1,'customer_service,information',0,'2018-09-13 09:01:11','2018-09-13 09:01:11');

/*Table structure for table `lc_pages_info` */

DROP TABLE IF EXISTS `lc_pages_info`;

CREATE TABLE `lc_pages_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `language_code` varchar(2) NOT NULL,
  `title` varchar(256) NOT NULL,
  `content` mediumtext NOT NULL,
  `head_title` varchar(128) NOT NULL,
  `meta_description` varchar(512) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`),
  KEY `language_code` (`language_code`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `lc_pages_info` */

insert  into `lc_pages_info`(`id`,`page_id`,`language_code`,`title`,`content`,`head_title`,`meta_description`) values 
(1,1,'en','About Us','<h1>About Us</h1><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer fermentum quam eget molestie lacinia. Suspendisse consectetur velit vitae tellus commodo pharetra. Curabitur lobortis turpis tortor, id blandit metus pellentesque sit amet. Etiam cursus dolor purus, sit amet vestibulum ipsum aliquet nec. Nunc sed aliquet eros. Sed at vehicula urna. Aliquam euismod nisl a felis adipiscing tincidunt. Etiam vestibulum arcu sed massa ornare, vitae venenatis odio convallis.\r\n</p>\r\n \r\n<h2>\r\n	Subheading 2\r\n</h2>\r\n \r\n<p>\r\n	 Aliquam eget suscipit urna. Fusce sed lorem enim. Praesent dictum sagittis tellus, vel imperdiet urna tristique eu. Morbi sed orci eu odio varius tempor consequat ut lectus. Aliquam sagittis sapien vitae nulla porta adipiscing. Nullam pulvinar interdum malesuada. Ut blandit ligula quam, id luctus risus ultrices eget. Donec mattis turpis vel purus hendrerit, id ornare dui viverra. Donec at aliquet purus. Maecenas ut commodo lorem. Vivamus ornare sem eu convallis ullamcorper. \r\n</p>\r\n \r\n<h3>\r\n	Subheading 3\r\n</h3>\r\n \r\n<p>\r\n	 In in massa accumsan augue accumsan facilisis non eget dui. Ut volutpat nisl urna, ac dapibus ipsum fermentum iaculis. Donec sed lorem metus. Donec gravida et risus et consectetur. Proin aliquet, ipsum in faucibus condimentum, orci sapien sollicitudin mi, vitae molestie nunc odio vitae libero. Nullam pretium velit in sem sagittis, et facilisis mi fermentum. Aenean varius sed est et tincidunt. Praesent non imperdiet ligula. \r\n</p>','',''),
(2,2,'en','Delivery Information','<h1>Delivery Information</h1><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer fermentum quam eget molestie lacinia. Suspendisse consectetur velit vitae tellus commodo pharetra. Curabitur lobortis turpis tortor, id blandit metus pellentesque sit amet. Etiam cursus dolor purus, sit amet vestibulum ipsum aliquet nec. Nunc sed aliquet eros. Sed at vehicula urna. Aliquam euismod nisl a felis adipiscing tincidunt. Etiam vestibulum arcu sed massa ornare, vitae venenatis odio convallis.\r\n</p>\r\n \r\n<h2>\r\n	 Subheading 2 \r\n</h2>\r\n \r\n<p>\r\n	 Aliquam eget suscipit urna. Fusce sed lorem enim. Praesent dictum sagittis tellus, vel imperdiet urna tristique eu. Morbi sed orci eu odio varius tempor consequat ut lectus. Aliquam sagittis sapien vitae nulla porta adipiscing. Nullam pulvinar interdum malesuada. Ut blandit ligula quam, id luctus risus ultrices eget. Donec mattis turpis vel purus hendrerit, id ornare dui viverra. Donec at aliquet purus. Maecenas ut commodo lorem. Vivamus ornare sem eu convallis ullamcorper. \r\n</p>\r\n \r\n<h3>\r\n	 Subheading 3 \r\n</h3>\r\n \r\n<p>\r\n	 In in massa accumsan augue accumsan facilisis non eget dui. Ut volutpat nisl urna, ac dapibus ipsum fermentum iaculis. Donec sed lorem metus. Donec gravida et risus et consectetur. Proin aliquet, ipsum in faucibus condimentum, orci sapien sollicitudin mi, vitae molestie nunc odio vitae libero. Nullam pretium velit in sem sagittis, et facilisis mi fermentum. Aenean varius sed est et tincidunt. Praesent non imperdiet ligula. \r\n</p>','',''),
(3,3,'en','Cookie Policy','<h1>Cookie Policy</h1><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer fermentum quam eget molestie lacinia. Suspendisse consectetur velit vitae tellus commodo pharetra. Curabitur lobortis turpis tortor, id blandit metus pellentesque sit amet. Etiam cursus dolor purus, sit amet vestibulum ipsum aliquet nec. Nunc sed aliquet eros. Sed at vehicula urna. Aliquam euismod nisl a felis adipiscing tincidunt. Etiam vestibulum arcu sed massa ornare, vitae venenatis odio convallis.\r\n</p>\r\n \r\n<h2>\r\n	 Subheading 2 \r\n</h2>\r\n \r\n<p>\r\n	 Aliquam eget suscipit urna. Fusce sed lorem enim. Praesent dictum sagittis tellus, vel imperdiet urna tristique eu. Morbi sed orci eu odio varius tempor consequat ut lectus. Aliquam sagittis sapien vitae nulla porta adipiscing. Nullam pulvinar interdum malesuada. Ut blandit ligula quam, id luctus risus ultrices eget. Donec mattis turpis vel purus hendrerit, id ornare dui viverra. Donec at aliquet purus. Maecenas ut commodo lorem. Vivamus ornare sem eu convallis ullamcorper. \r\n</p>\r\n \r\n<h3>\r\n	 Subheading 3 \r\n</h3>\r\n \r\n<p>\r\n	 In in massa accumsan augue accumsan facilisis non eget dui. Ut volutpat nisl urna, ac dapibus ipsum fermentum iaculis. Donec sed lorem metus. Donec gravida et risus et consectetur. Proin aliquet, ipsum in faucibus condimentum, orci sapien sollicitudin mi, vitae molestie nunc odio vitae libero. Nullam pretium velit in sem sagittis, et facilisis mi fermentum. Aenean varius sed est et tincidunt. Praesent non imperdiet ligula. \r\n</p>','',''),
(4,4,'en','Newsletter','<h1>Newsletter</h1><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer fermentum quam eget molestie lacinia. Suspendisse consectetur velit vitae tellus commodo pharetra. Curabitur lobortis turpis tortor, id blandit metus pellentesque sit amet. Etiam cursus dolor purus, sit amet vestibulum ipsum aliquet nec. Nunc sed aliquet eros. Sed at vehicula urna. Aliquam euismod nisl a felis adipiscing tincidunt. Etiam vestibulum arcu sed massa ornare, vitae venenatis odio convallis.</p>','',''),
(5,5,'en','Privacy Policy','<h1>Privacy Policy</h1><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer fermentum quam eget molestie lacinia. Suspendisse consectetur velit vitae tellus commodo pharetra. Curabitur lobortis turpis tortor, id blandit metus pellentesque sit amet. Etiam cursus dolor purus, sit amet vestibulum ipsum aliquet nec. Nunc sed aliquet eros. Sed at vehicula urna. Aliquam euismod nisl a felis adipiscing tincidunt. Etiam vestibulum arcu sed massa ornare, vitae venenatis odio convallis.\r\n</p>\r\n \r\n<h2>\r\n	 Subheading 2 \r\n</h2>\r\n \r\n<p>\r\n	 Aliquam eget suscipit urna. Fusce sed lorem enim. Praesent dictum sagittis tellus, vel imperdiet urna tristique eu. Morbi sed orci eu odio varius tempor consequat ut lectus. Aliquam sagittis sapien vitae nulla porta adipiscing. Nullam pulvinar interdum malesuada. Ut blandit ligula quam, id luctus risus ultrices eget. Donec mattis turpis vel purus hendrerit, id ornare dui viverra. Donec at aliquet purus. Maecenas ut commodo lorem. Vivamus ornare sem eu convallis ullamcorper. \r\n</p>\r\n \r\n<h3>\r\n	 Subheading 3 \r\n</h3>\r\n \r\n<p>\r\n	 In in massa accumsan augue accumsan facilisis non eget dui. Ut volutpat nisl urna, ac dapibus ipsum fermentum iaculis. Donec sed lorem metus. Donec gravida et risus et consectetur. Proin aliquet, ipsum in faucibus condimentum, orci sapien sollicitudin mi, vitae molestie nunc odio vitae libero. Nullam pretium velit in sem sagittis, et facilisis mi fermentum. Aenean varius sed est et tincidunt. Praesent non imperdiet ligula. \r\n</p>','',''),
(6,6,'en','Terms & Conditions','<h1>Terms &amp; Conditions</h1><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer fermentum quam eget molestie lacinia. Suspendisse consectetur velit vitae tellus commodo pharetra. Curabitur lobortis turpis tortor, id blandit metus pellentesque sit amet. Etiam cursus dolor purus, sit amet vestibulum ipsum aliquet nec. Nunc sed aliquet eros. Sed at vehicula urna. Aliquam euismod nisl a felis adipiscing tincidunt. Etiam vestibulum arcu sed massa ornare, vitae venenatis odio convallis.\r\n</p>\r\n \r\n<h2>\r\n	 Subheading 2 \r\n</h2>\r\n \r\n<p>\r\n	 Aliquam eget suscipit urna. Fusce sed lorem enim. Praesent dictum sagittis tellus, vel imperdiet urna tristique eu. Morbi sed orci eu odio varius tempor consequat ut lectus. Aliquam sagittis sapien vitae nulla porta adipiscing. Nullam pulvinar interdum malesuada. Ut blandit ligula quam, id luctus risus ultrices eget. Donec mattis turpis vel purus hendrerit, id ornare dui viverra. Donec at aliquet purus. Maecenas ut commodo lorem. Vivamus ornare sem eu convallis ullamcorper. \r\n</p>\r\n \r\n<h3>\r\n	 Subheading 3 \r\n</h3>\r\n \r\n<p>\r\n	 In in massa accumsan augue accumsan facilisis non eget dui. Ut volutpat nisl urna, ac dapibus ipsum fermentum iaculis. Donec sed lorem metus. Donec gravida et risus et consectetur. Proin aliquet, ipsum in faucibus condimentum, orci sapien sollicitudin mi, vitae molestie nunc odio vitae libero. Nullam pretium velit in sem sagittis, et facilisis mi fermentum. Aenean varius sed est et tincidunt. Praesent non imperdiet ligula. \r\n</p>','','');

/*Table structure for table `lc_product_groups` */

DROP TABLE IF EXISTS `lc_product_groups`;

CREATE TABLE `lc_product_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;

/*Data for the table `lc_product_groups` */

/*Table structure for table `lc_product_groups_info` */

DROP TABLE IF EXISTS `lc_product_groups_info`;

CREATE TABLE `lc_product_groups_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_group_id` int(11) NOT NULL,
  `language_code` varchar(2) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_group_id` (`product_group_id`),
  KEY `language_code` (`language_code`)
) ENGINE=MyISAM AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;

/*Data for the table `lc_product_groups_info` */

/*Table structure for table `lc_product_groups_values` */

DROP TABLE IF EXISTS `lc_product_groups_values`;

CREATE TABLE `lc_product_groups_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_group_id` int(11) NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_group_id` (`product_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=253 DEFAULT CHARSET=utf8;

/*Data for the table `lc_product_groups_values` */

/*Table structure for table `lc_product_groups_values_info` */

DROP TABLE IF EXISTS `lc_product_groups_values_info`;

CREATE TABLE `lc_product_groups_values_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_group_value_id` int(11) NOT NULL,
  `language_code` varchar(2) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_group_value_id` (`product_group_value_id`),
  KEY `language_code` (`language_code`)
) ENGINE=MyISAM AUTO_INCREMENT=253 DEFAULT CHARSET=utf8;

/*Data for the table `lc_product_groups_values_info` */

/*Table structure for table `lc_product_option_trees` */

DROP TABLE IF EXISTS `lc_product_option_trees`;

CREATE TABLE `lc_product_option_trees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `value_id` int(11) NOT NULL,
  `parent_group_id` int(11) NOT NULL DEFAULT '0',
  `parent_value_id` int(11) NOT NULL,
  `links` varchar(2000) DEFAULT '',
  `date_update` datetime DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `lc_product_option_trees` */

/*Table structure for table `lc_products` */

DROP TABLE IF EXISTS `lc_products`;

CREATE TABLE `lc_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `delivery_status_id` int(11) NOT NULL,
  `sold_out_status_id` int(11) NOT NULL,
  `default_category_id` int(11) NOT NULL,
  `product_groups` varchar(128) NOT NULL,
  `keywords` varchar(256) NOT NULL,
  `code` varchar(36) NOT NULL,
  `sku` varchar(36) NOT NULL,
  `mpn` varchar(36) NOT NULL,
  `upc` varchar(36) NOT NULL COMMENT 'Deprecated, use GTIN',
  `gtin` varchar(36) NOT NULL,
  `taric` varchar(16) NOT NULL,
  `quantity` decimal(11,4) NOT NULL,
  `quantity_unit_id` int(1) NOT NULL,
  `weight` decimal(10,4) NOT NULL,
  `weight_class` varchar(2) NOT NULL,
  `dim_x` decimal(10,4) NOT NULL,
  `dim_y` decimal(10,4) NOT NULL,
  `dim_z` decimal(10,4) NOT NULL,
  `dim_class` varchar(2) NOT NULL,
  `purchase_price` decimal(10,4) NOT NULL,
  `purchase_price_currency_code` varchar(3) NOT NULL,
  `tax_class_id` int(11) NOT NULL,
  `image` varchar(256) NOT NULL,
  `views` int(11) NOT NULL,
  `purchases` int(11) NOT NULL,
  `date_valid_from` date NOT NULL,
  `date_valid_to` date NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `default_category_id` (`default_category_id`),
  KEY `manufacturer_id` (`manufacturer_id`),
  KEY `keywords` (`keywords`),
  KEY `code` (`code`),
  KEY `sku` (`sku`),
  KEY `mpn` (`mpn`),
  KEY `gtin` (`gtin`),
  KEY `taric` (`taric`),
  KEY `date_valid_from` (`date_valid_from`),
  KEY `date_valid_to` (`date_valid_to`),
  KEY `purchases` (`purchases`),
  KEY `views` (`views`),
  KEY `product_groups` (`product_groups`)
) ENGINE=MyISAM AUTO_INCREMENT=602 DEFAULT CHARSET=utf8;

/*Data for the table `lc_products` */

/*Table structure for table `lc_products_campaigns` */

DROP TABLE IF EXISTS `lc_products_campaigns`;

CREATE TABLE `lc_products_campaigns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `USD` decimal(11,4) NOT NULL,
  `EUR` decimal(11,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `lc_products_campaigns` */

insert  into `lc_products_campaigns`(`id`,`product_id`,`start_date`,`end_date`,`USD`,`EUR`) values 
(1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00',18.0000,0.0000);

/*Table structure for table `lc_products_images` */

DROP TABLE IF EXISTS `lc_products_images`;

CREATE TABLE `lc_products_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `filename` varchar(256) NOT NULL,
  `checksum` char(32) NOT NULL,
  `priority` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1707 DEFAULT CHARSET=utf8;

/*Data for the table `lc_products_images` */

/*Table structure for table `lc_products_info` */

DROP TABLE IF EXISTS `lc_products_info`;

CREATE TABLE `lc_products_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `language_code` varchar(2) NOT NULL,
  `name` varchar(128) NOT NULL,
  `short_description` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `head_title` varchar(128) NOT NULL,
  `meta_description` varchar(512) NOT NULL,
  `attributes` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `language_code` (`language_code`)
) ENGINE=MyISAM AUTO_INCREMENT=599 DEFAULT CHARSET=utf8;

/*Data for the table `lc_products_info` */

/*Table structure for table `lc_products_options` */

DROP TABLE IF EXISTS `lc_products_options`;

CREATE TABLE `lc_products_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `value_id` int(11) NOT NULL,
  `price_operator` varchar(1) NOT NULL,
  `USD` decimal(11,4) NOT NULL,
  `EUR` decimal(11,4) NOT NULL,
  `links` varchar(2000) NOT NULL DEFAULT '',
  `priority` tinyint(2) NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=632 DEFAULT CHARSET=utf8;

/*Data for the table `lc_products_options` */

/*Table structure for table `lc_products_options_stock` */

DROP TABLE IF EXISTS `lc_products_options_stock`;

CREATE TABLE `lc_products_options_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `combination` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `weight` decimal(11,4) NOT NULL,
  `weight_class` varchar(2) NOT NULL,
  `dim_x` decimal(11,4) NOT NULL,
  `dim_y` decimal(11,4) NOT NULL,
  `dim_z` decimal(11,4) NOT NULL,
  `dim_class` varchar(2) NOT NULL,
  `quantity` decimal(11,4) NOT NULL,
  `priority` tinyint(2) NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=578 DEFAULT CHARSET=utf8;

/*Data for the table `lc_products_options_stock` */

/*Table structure for table `lc_products_prices` */

DROP TABLE IF EXISTS `lc_products_prices`;

CREATE TABLE `lc_products_prices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `USD` decimal(11,4) NOT NULL,
  `EUR` decimal(11,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=247 DEFAULT CHARSET=utf8;

/*Data for the table `lc_products_prices` */

/*Table structure for table `lc_products_to_categories` */

DROP TABLE IF EXISTS `lc_products_to_categories`;

CREATE TABLE `lc_products_to_categories` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `lc_products_to_categories` */

/*Table structure for table `lc_quantity_units` */

DROP TABLE IF EXISTS `lc_quantity_units`;

CREATE TABLE `lc_quantity_units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `decimals` tinyint(1) NOT NULL,
  `separate` tinyint(1) NOT NULL,
  `priority` tinyint(2) NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `lc_quantity_units` */

insert  into `lc_quantity_units`(`id`,`decimals`,`separate`,`priority`,`date_updated`,`date_created`) values 
(1,0,0,0,'2018-09-13 09:01:11','2018-09-13 09:01:11');

/*Table structure for table `lc_quantity_units_info` */

DROP TABLE IF EXISTS `lc_quantity_units_info`;

CREATE TABLE `lc_quantity_units_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity_unit_id` int(11) NOT NULL,
  `language_code` varchar(2) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quantity_unit_id` (`quantity_unit_id`),
  KEY `language_code` (`language_code`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `lc_quantity_units_info` */

insert  into `lc_quantity_units_info`(`id`,`quantity_unit_id`,`language_code`,`name`,`description`) values 
(1,1,'en','pcs','');

/*Table structure for table `lc_settings` */

DROP TABLE IF EXISTS `lc_settings`;

CREATE TABLE `lc_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `setting_group_key` varchar(64) NOT NULL,
  `type` enum('global','local') NOT NULL DEFAULT 'local',
  `key` varchar(64) NOT NULL,
  `title` varchar(128) NOT NULL,
  `description` varchar(512) NOT NULL,
  `value` varchar(8192) NOT NULL,
  `function` varchar(128) NOT NULL,
  `priority` tinyint(2) NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `setting_group_key` (`setting_group_key`)
) ENGINE=MyISAM AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

/*Data for the table `lc_settings` */

insert  into `lc_settings`(`id`,`setting_group_key`,`type`,`key`,`title`,`description`,`value`,`function`,`priority`,`date_updated`,`date_created`) values 
(1,'','global','platform_database_version','Platform Database Version','The platform version of the database','2.1.3','',0,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(2,'store_info','global','store_name','Store Name','The name of your store.','My Store','input()',10,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(3,'store_info','global','store_email','Store Email','The store e-mail address.','store@email.com','input()',11,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(4,'store_info','local','store_tax_id','Store Tax ID','The store tax ID or VATIN.','XX000000000000','input()',12,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(5,'store_info','local','store_postal_address','Store Postal Address','The store postal address.','My Store\r\nStreet\r\nPostcode City\r\nCountry','bigtext()',13,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(6,'store_info','local','store_visiting_address','Store Visiting Address','The store visiting address if applicable.','','bigtext()',14,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(7,'store_info','local','store_phone','Store Phone Number','The store phone number.','+1-212-555-DUCK','input()',15,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(8,'store_info','global','store_country_code','Store Country','The country of your store.','CN','countries()',16,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(9,'store_info','global','store_timezone','Store Time Zone','The store time zone.','Asia/Shanghai','timezones()',17,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(10,'store_info','local','store_language_code','Store Language','The spoken language of your organization.','en','languages()',18,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(11,'store_info','global','store_currency_code','Store Currency','The currency of which all prices conform to.','USD','currencies()',19,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(12,'store_info','global','store_zone_code','Store Zone','The zone of your store.','','zones()',20,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(13,'store_info','global','store_weight_class','Store Weight Class','The prefered weight class.','kg','weight_classes()',21,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(14,'store_info','global','store_length_class','Store Length Class','The prefered length class.','cm','length_classes()',22,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(15,'defaults','global','default_language_code','Default Language','The default language selected, if failed to identify.','en','languages()',10,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(16,'defaults','global','default_currency_code','Default Currency','The default currency selected, if failed to identify.','USD','currencies()',11,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(17,'defaults','global','default_country_code','Default Country','The default country selected if not set otherwise.','CN','countries()',12,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(18,'defaults','global','default_zone_code','Default Zone','The default zone selected if not set otherwise.','','zones()',13,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(19,'defaults','local','default_tax_class_id','Default Tax Class','Default tax class that will be preset when creating new products.','1','tax_classes()',14,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(20,'defaults','global','default_display_prices_including_tax','Default Display Prices Including Tax','Displays prices including tax by default.','1','toggle()',15,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(21,'defaults','global','default_quantity_unit_id','Default Quantity Unit','Default quantity unit that will be preset when creating new products.','1','quantity_units()',16,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(22,'defaults','global','default_sold_out_status_id','Default Sold Out Status','Default sold out status that will be preset when creating new products.','1','sold_out_statuses()',17,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(23,'defaults','global','default_delivery_status_id','Default Delivery Status','Default delivery status that will be preset when creating new products.','1','delivery_statuses()',18,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(24,'email','local','smtp_status','SMTP Enabled','Wheither or not to use an SMTP server for delivering email.','1','toggle(\"e/d\")',10,'2018-10-15 14:40:29','2018-09-13 09:01:11'),
(25,'email','local','smtp_host','SMTP Host','SMTP hostname e.g. smtp.myprovider.com.','smtp.126.com','input()',11,'2018-10-15 14:40:41','2018-09-13 09:01:11'),
(26,'email','local','smtp_port','SMTP Port','SMTP port e.g. 25, 465 (SSL/TLS), or 587 (STARTTLS).','25','number()',12,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(27,'email','local','smtp_username','SMTP Username','Username for SMTP authentication.','zhangning_holley@126.com','input()',13,'2018-10-15 14:40:16','2018-09-13 09:01:11'),
(28,'email','local','smtp_password','SMTP Password','Password for SMTP authentication.','520liuqiumei','password()',14,'2018-10-15 14:40:23','2018-09-13 09:01:11'),
(29,'listings','global','maintenance_mode','Maintenance Mode','Setting the store in maintenance mode will prevent users from browsing your site.','0','toggle()',2,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(30,'listings','global','catalog_only_mode','Catalog Only Mode','Disables the cart and checkout features leaving only a browsable catalog.','0','toggle(\"t/f\")',1,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(31,'listings','local','items_per_page','Items Per Page','The number of items to be displayed per page.','20','int()',10,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(32,'listings','local','data_table_rows_per_page','Data Table Rows','The number of data table rows per page.','25','input()',11,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(33,'listings','local','display_stock_count','Display Stock Count','Show the available amounts of products in stock.','1','toggle()',12,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(34,'listings','local','display_cheapest_shipping','Cheapest Shipping','Display the cheapest shipping cost on product page.','1','toggle()',13,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(35,'listings','local','new_products_max_age','Max Age for New Products','Display the new sticker for products younger than the give age. E.g. 1 month or 14 days','1 month','input()',14,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(36,'listings','local','box_similar_products_num_items','Similar Products Box: Number of Items','The maximum amount of items to be display in the box.','10','int()',15,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(37,'listings','local','box_recently_viewed_products_num_items','Recently Viewed Products Box: Number of Items','The maximum amount of items to be display in the box.','4','int()',16,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(38,'listings','local','box_latest_products_num_items','Latest Products Box: Number of Items','The maximum amount of items to be display in the box.','10','int()',17,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(39,'listings','local','box_popular_products_num_items','Popular Products Box: Number of Items','The maximum amount of items to be display in the box.','10','int()',18,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(40,'listings','local','box_campaign_products_num_items','Campaign Products Box: Number of Items','The maximum amount of items to be display in the box.','5','int()',19,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(41,'listings','local','box_also_purchased_products_num_items','Also Purchased Products Box: Number of Items','The maximum amount of items to be display in the box.','4','int()',20,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(42,'listings','local','auto_decimals','Auto Decimals','Show only decimals if there are any to display.','1','toggle(\"e/d\")',20,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(43,'images','global','cache_clear_thumbnails','Clear Thumbnails Cache','Remove all cached image thumbnails from disk.','0','toggle()',1,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(44,'images','local','category_image_ratio','Category Images: Aspect Ratio','The aspect ratio of the category thumbnails','2:3','select(\"1:1\",\"2:3\",\"3:2\",\"3:4\",\"4:3\",\"16:9\")',10,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(45,'images','local','category_image_clipping','Category Images: Clipping Method','The clipping method used for scaled category thumbnails.','CROP','select(\"CROP\",\"FIT\",\"FIT_USE_WHITESPACING\")',11,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(46,'images','local','product_image_ratio','Product Images: Aspect Ratio','The aspect ratio of the product thumbnails','1:1','select(\"1:1\",\"2:3\",\"3:2\",\"3:4\",\"4:3\",\"16:9\")',30,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(47,'images','local','product_image_clipping','Product Images: Clipping Method','The clipping method used for scaled product thumbnails.','FIT_USE_WHITESPACING','select(\"CROP\",\"FIT\",\"FIT_USE_WHITESPACING\")',31,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(48,'images','local','product_image_trim','Product Images: Trim Whitespace','Trim whitespace before generating thumbnail images.','0','toggle(\"y/n\")',33,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(49,'images','local','product_image_watermark','Product Images: Watermark','Watermark product images with the store logo.','0','toggle(\"y/n\")',34,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(50,'images','local','image_downsample_size','Downsample','Downsample large uploaded images to best fit within the given dimensions of \"width,height\" or leave empty. Default: 2048,2048','2048,2048','smallinput()',34,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(51,'images','local','image_quality','Image Quality','The JPEG quality for uploaded images (0-100). Default: 90','90','int()',40,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(52,'images','local','image_thumbnail_quality','Thumbnail Quality','The JPEG quality for thumbnail images (0-100). Default: 65','65','int()',41,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(53,'images','local','image_thumbnail_interlaced','Interlaced Thumbnails','Generate interlaced thumbnail images for progressive loading. Increases the filesize by 10-20% but improves user experience.','0','toggle()',42,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(54,'images','local','image_whitespace_color','Whitespace Color','Set the color of any generated whitespace to the given RGB value. Default: 255,255,255','255,255,255','smallinput()',43,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(55,'checkout','local','register_guests','Register Guests','Force guests to create an account.','0','toggle()',10,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(56,'checkout','local','email_order_copy','Order Copy Recipients','Send order copies to the following e-mail addresses. Separate by semi-colons.','store@email.com','mediumtext()',12,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(57,'checkout','global','round_amounts','Round Amounts','Round currency amounts to prevent hidden decimals.','1','toggle()',13,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(58,'advanced','global','cache_enabled','System Cache Enabled','Enables the system cache module which caches frequently used data.','0','toggle()',10,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(59,'advanced','global','cache_clear','Clear System Cache','Remove all cached system information.','0','toggle()',11,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(60,'advanced','global','seo_links_language_prefix','SEO Links Language Prefix','Precede links with language code e.g. /en/....','1','toggle()',13,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(61,'advanced','global','regional_settings_screen_enabled','Regional Settings Screen','Enables the regional settings screen upon first visit.','0','toggle()',14,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(62,'advanced','global','gzip_enabled','GZIP Enabled','Compresses browser data. Increases the load on the server but decreases the bandwidth.','1','toggle()',15,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(63,'advanced','global','jobs_last_run','Jobs Last Run','Time when background jobs where last executed.','2018-09-13 09:01:11','input()',16,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(64,'advanced','local','jobs_interval','Jobs Interval','The amount of minutes between each execution of jobs.','60','int()',17,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(65,'advanced','local','database_admin_link','Database Admin Link','The URL to your database manager e.g. phpMyAdmin.','?app=settings&doc=advanced&action=edit&key=database_admin_link','input()',18,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(66,'advanced','local','webmail_link','Webmail Link','The URL to your webmail client.','?app=settings&doc=advanced&action=edit&key=webmail_link','input()',19,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(67,'advanced','global','seo_links_enabled','SEO Links Enabled','Enabling this requires .htaccess and mod_rewrite rules.','1','toggle()',20,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(68,'security','global','security_blacklist','Blacklist','Deny blacklisted clients access to the site.','0','toggle(\"e/d\")',10,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(69,'security','global','security_session_hijacking','Session Hijacking Protection','Destroy sessions that were signed for a different IP address and user agent.','0','toggle(\"e/d\")',11,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(70,'security','global','security_http_post','HTTP POST Protection','Deny incoming HTTP POST data from external sites by checking for valid form tickets.','0','toggle(\"e/d\")',12,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(71,'security','global','security_bot_trap','Bad Bot Trap','Catch bad behaving bots from crawling your website by setting up a trap.','0','toggle(\"e/d\")',13,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(72,'security','global','security_xss','Cross-site Scripting (XSS) Detection','Detect common XSS attacks and deny access to the site.','1','toggle(\"e/d\")',14,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(73,'security','global','security_bad_urls','Bad URLs Access Detection','Detect access to commonly attacked URLs.','1','toggle(\"e/d\")',15,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(74,'security','local','captcha_enabled','CAPTCHA','Prevent robots from posting form data by enabling CAPTCHA security.','1','toggle()',16,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(75,'','global','store_template_catalog','Catalog Template','','default.catalog','templates(\"catalog\")',0,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(76,'','global','store_template_catalog_settings','Catalog Template Settings','','{\"product_modal_window\":\"1\",\"sidebar_parallax_effect\":\"1\",\"cookie_acceptance\":\"1\"}','smalltext()',0,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(77,'','global','store_template_admin','Admin Template','','default.admin','templates(\"admin\")',0,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(78,'','global','jobs_last_push','Jobs Last Push','Time when background jobs where last pushed for execution.','2018-11-23 12:06:05','input()',0,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(79,'','local','cache_system_breakpoint','Date Cache Cleared','Do not use system cache older than breakpoint.','2018-10-23 16:40:52','input()',0,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(80,'','local','job_error_reporter:last_run','Errors Last Reported','Time when errors where last reported by the background job.','2018-09-13 09:01:11','input()',0,'2018-09-13 09:01:11','2018-09-13 09:01:11');

/*Table structure for table `lc_settings_groups` */

DROP TABLE IF EXISTS `lc_settings_groups`;

CREATE TABLE `lc_settings_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(256) NOT NULL,
  `priority` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `lc_settings_groups` */

insert  into `lc_settings_groups`(`id`,`key`,`name`,`description`,`priority`) values 
(1,'store_info','Store Info','Store information',10),
(2,'defaults','Defaults','Store default settings',20),
(3,'email','Email','Email and SMTP',30),
(4,'listings','Listings','Settings for the catalog listing',40),
(5,'images','Images','Settings for graphical elements',50),
(6,'checkout','Checkout','Checkout settings',60),
(7,'advanced','Advanced','Advanced settings',70),
(8,'security','Security','Site security and protection against threats',80);

/*Table structure for table `lc_slides` */

DROP TABLE IF EXISTS `lc_slides`;

CREATE TABLE `lc_slides` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `languages` varchar(32) NOT NULL,
  `name` varchar(128) NOT NULL,
  `image` varchar(256) NOT NULL,
  `priority` tinyint(2) NOT NULL,
  `date_valid_from` datetime NOT NULL,
  `date_valid_to` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `lc_slides` */

insert  into `lc_slides`(`id`,`status`,`languages`,`name`,`image`,`priority`,`date_valid_from`,`date_valid_to`,`date_updated`,`date_created`) values 
(1,1,'','Family At The Beach','slides/1-family-at-the-beach.jpg',1,'0000-00-00 00:00:00','0000-00-00 00:00:00','2018-09-28 19:10:32','2018-09-13 09:01:11'),
(2,1,'','Test','slides/2-test.jpg',2,'0000-00-00 00:00:00','0000-00-00 00:00:00','2018-09-28 19:14:11','2018-09-28 19:11:10');

/*Table structure for table `lc_slides_info` */

DROP TABLE IF EXISTS `lc_slides_info`;

CREATE TABLE `lc_slides_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slide_id` int(11) NOT NULL,
  `language_code` varchar(2) NOT NULL,
  `caption` text NOT NULL,
  `link` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slide_info` (`slide_id`,`language_code`),
  KEY `slide_id` (`slide_id`),
  KEY `language_code` (`language_code`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `lc_slides_info` */

insert  into `lc_slides_info`(`id`,`slide_id`,`language_code`,`caption`,`link`) values 
(1,1,'en','','https://www.shein.com/SHEIN-Fall-Winter-vc-72543.html?icn=fall180924&ici=www_homebannerpr02'),
(2,2,'en','','');

/*Table structure for table `lc_sold_out_statuses` */

DROP TABLE IF EXISTS `lc_sold_out_statuses`;

CREATE TABLE `lc_sold_out_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderable` tinyint(1) NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `lc_sold_out_statuses` */

insert  into `lc_sold_out_statuses`(`id`,`orderable`,`date_updated`,`date_created`) values 
(1,0,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(2,1,'2018-09-13 09:01:11','2018-09-13 09:01:11'),
(3,1,'2018-09-13 09:01:11','2018-09-13 09:01:11');

/*Table structure for table `lc_sold_out_statuses_info` */

DROP TABLE IF EXISTS `lc_sold_out_statuses_info`;

CREATE TABLE `lc_sold_out_statuses_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sold_out_status_id` int(11) NOT NULL,
  `language_code` varchar(2) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sold_out_status_id` (`sold_out_status_id`),
  KEY `language_code` (`language_code`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `lc_sold_out_statuses_info` */

insert  into `lc_sold_out_statuses_info`(`id`,`sold_out_status_id`,`language_code`,`name`,`description`) values 
(1,1,'en','Sold Out',''),
(2,2,'en','Temporary Sold Out',''),
(3,3,'en','Backorder Item','');

/*Table structure for table `lc_suppliers` */

DROP TABLE IF EXISTS `lc_suppliers`;

CREATE TABLE `lc_suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `email` varchar(128) NOT NULL,
  `phone` varchar(24) NOT NULL,
  `link` varchar(256) NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `code` (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `lc_suppliers` */

/*Table structure for table `lc_tax_classes` */

DROP TABLE IF EXISTS `lc_tax_classes`;

CREATE TABLE `lc_tax_classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(64) NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `lc_tax_classes` */

insert  into `lc_tax_classes`(`id`,`code`,`name`,`description`,`date_updated`,`date_created`) values 
(1,'1','1','1','2018-09-19 14:41:21','2018-09-19 14:41:21');

/*Table structure for table `lc_tax_rates` */

DROP TABLE IF EXISTS `lc_tax_rates`;

CREATE TABLE `lc_tax_rates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(11) NOT NULL,
  `geo_zone_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(128) NOT NULL,
  `rate` decimal(10,4) NOT NULL,
  `type` enum('fixed','percent') NOT NULL DEFAULT 'percent',
  `address_type` enum('shipping','payment') NOT NULL DEFAULT 'shipping',
  `customer_type` enum('individuals','companies','both') NOT NULL DEFAULT 'both',
  `tax_id_rule` enum('with','without','both') NOT NULL DEFAULT 'both',
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tax_class_id` (`tax_class_id`),
  KEY `geo_zone_id` (`geo_zone_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `lc_tax_rates` */

/*Table structure for table `lc_translations` */

DROP TABLE IF EXISTS `lc_translations`;

CREATE TABLE `lc_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(250) NOT NULL,
  `text_en` text NOT NULL,
  `html` tinyint(1) NOT NULL DEFAULT '0',
  `frontend` tinyint(1) NOT NULL DEFAULT '1',
  `backend` tinyint(1) NOT NULL DEFAULT '0',
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `frontend` (`frontend`),
  KEY `backend` (`backend`),
  KEY `date_created` (`date_created`)
) ENGINE=MyISAM AUTO_INCREMENT=678 DEFAULT CHARSET=utf8;

/*Data for the table `lc_translations` */

insert  into `lc_translations`(`id`,`code`,`text_en`,`html`,`frontend`,`backend`,`date_updated`,`date_created`) values 
(1,'title_home','Home',0,1,0,'2018-09-13 09:05:27','2018-09-13 09:05:27'),
(2,'template:title_product_modal_window','Product Modal Window',0,1,0,'2018-09-13 09:05:27','2018-09-13 09:05:27'),
(3,'template:description_product_modal_window','Enables or disables the product modal window.',0,1,0,'2018-09-13 09:05:27','2018-09-13 09:05:27'),
(4,'template:title_sidebar_parallax_effect','Sidebar Parallax Effect',0,1,0,'2018-09-13 09:05:27','2018-09-13 09:05:27'),
(5,'template:description_sidebar_parallax_effect','Enables or disables the sidebar parallax effect.',0,1,0,'2018-09-13 09:05:27','2018-09-13 09:05:27'),
(6,'template:title_compact_category_tree','Compact Category Tree',0,1,0,'2018-09-13 09:05:27','2018-09-13 09:05:27'),
(7,'template:description_compact_category_tree','Hide the other categories while browsing a category branch.',0,1,0,'2018-09-13 09:05:27','2018-09-13 09:05:27'),
(8,'template:title_cookie_acceptance','Cookie Acceptance',0,1,0,'2018-09-13 09:05:27','2018-09-13 09:05:27'),
(9,'template:description_cookie_acceptance','Enables or disables the cookie acceptance notice.',0,1,0,'2018-09-13 09:05:27','2018-09-13 09:05:27'),
(10,'index:head_title','Online Store',0,1,0,'2018-09-13 09:05:27','2018-09-13 09:05:27'),
(11,'index:meta_description','',0,1,0,'2018-09-13 09:05:27','2018-09-13 09:05:27'),
(12,'title_categories','Categories',0,1,0,'2018-09-13 09:05:27','2018-09-13 09:05:27'),
(13,'title_campaign_products','Campaign Products',0,1,0,'2018-09-13 09:05:27','2018-09-13 09:05:27'),
(14,'title_popular_products','Popular Products',0,1,0,'2018-09-13 09:05:27','2018-09-13 09:05:27'),
(15,'title_latest_products','Latest Products',0,1,0,'2018-09-13 09:05:27','2018-09-13 09:05:27'),
(16,'title_on_sale','On Sale',0,1,0,'2018-09-13 09:05:27','2018-09-13 09:05:27'),
(17,'sticker_sale','Sale',0,1,0,'2018-09-13 09:05:27','2018-09-13 09:05:27'),
(18,'title_new','New',0,1,0,'2018-09-13 09:05:27','2018-09-13 09:05:27'),
(19,'sticker_new','New',0,1,0,'2018-09-13 09:05:27','2018-09-13 09:05:27'),
(20,'title_change','Change',0,1,0,'2018-09-13 09:05:28','2018-09-13 09:05:28'),
(21,'title_shopping_cart','Shopping Cart',0,1,0,'2018-09-13 09:05:28','2018-09-13 09:05:28'),
(22,'text_items','item(s)',0,1,0,'2018-09-13 09:05:28','2018-09-13 09:05:28'),
(23,'text_search_products','Search products',0,1,0,'2018-09-13 09:05:28','2018-09-13 09:05:28'),
(24,'title_manufacturers','Manufacturers',0,1,0,'2018-09-13 09:05:28','2018-09-13 09:05:28'),
(25,'title_sign_in','Sign In',0,1,0,'2018-09-13 09:05:28','2018-09-13 09:05:28'),
(26,'title_email_address','Email Address',0,1,0,'2018-09-13 09:05:28','2018-09-13 09:05:28'),
(27,'title_password','Password',0,1,0,'2018-09-13 09:05:28','2018-09-13 09:05:28'),
(28,'text_new_customers_click_here','New customers click here',0,1,0,'2018-09-13 09:05:28','2018-09-13 09:05:28'),
(29,'text_lost_your_password','Lost your password?',0,1,0,'2018-09-13 09:05:28','2018-09-13 09:05:28'),
(30,'terms_cookies_acceptance','We rely on cookies to provide our services. By using our services, you agree to our use of cookies.',0,1,0,'2018-09-13 09:05:28','2018-09-13 09:05:28'),
(31,'title_ok','OK',0,1,0,'2018-09-13 09:05:28','2018-09-13 09:05:28'),
(32,'title_account','Account',0,1,0,'2018-09-13 09:05:28','2018-09-13 09:05:28'),
(33,'title_customer_service','Customer Service',0,1,0,'2018-09-13 09:05:28','2018-09-13 09:05:28'),
(34,'title_regional_settings','Regional Settings',0,1,0,'2018-09-13 09:05:28','2018-09-13 09:05:28'),
(35,'title_create_account','Create Account',0,1,0,'2018-09-13 09:05:28','2018-09-13 09:05:28'),
(36,'title_login','Login',0,1,0,'2018-09-13 09:05:28','2018-09-13 09:05:28'),
(37,'title_information','Information',0,1,0,'2018-09-13 09:05:28','2018-09-13 09:05:28'),
(38,'title_contact','Contact',0,1,0,'2018-09-13 09:05:28','2018-09-13 09:05:28'),
(39,'title_page_parse_time','Page Parse Time',0,1,0,'2018-09-13 09:05:28','2018-09-13 09:05:28'),
(40,'title_page_capture_time','Page Capture Time',0,1,0,'2018-09-13 09:05:28','2018-09-13 09:05:28'),
(41,'title_included_files','Included Files',0,1,0,'2018-09-13 09:05:28','2018-09-13 09:05:28'),
(42,'title_memory_peak','Memory Peak',0,1,0,'2018-09-13 09:05:28','2018-09-13 09:05:28'),
(43,'title_memory_limit','Memory Limit',0,1,0,'2018-09-13 09:05:28','2018-09-13 09:05:28'),
(44,'title_database_queries','Database Queries',0,1,0,'2018-09-13 09:05:28','2018-09-13 09:05:28'),
(45,'title_database_parse_time','Database Parse Time',0,1,0,'2018-09-13 09:05:28','2018-09-13 09:05:28'),
(46,'title_name','Name',0,1,0,'2018-09-13 09:07:01','2018-09-13 09:07:01'),
(47,'title_price','Price',0,1,0,'2018-09-13 09:07:01','2018-09-13 09:07:01'),
(48,'title_popularity','Popularity',0,1,0,'2018-09-13 09:07:01','2018-09-13 09:07:01'),
(49,'title_date','Date',0,1,0,'2018-09-13 09:07:01','2018-09-13 09:07:01'),
(50,'title_total','Total',0,1,0,'2018-09-13 09:08:05','2018-09-13 09:08:05'),
(51,'title_admin_panel','Admin Panel',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(52,'title_appearance','Appearance',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(53,'title_template','Template',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(54,'title_logotype','Logotype',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(55,'title_catalog','Catalog',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(56,'title_product_groups','Product Groups',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(57,'title_option_groups','Option Groups',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(58,'title_suppliers','Suppliers',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(59,'title_delivery_statuses','Delivery Statuses',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(60,'title_sold_out_statuses','Sold Out Statuses',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(61,'title_quantity_units','Quantity Units',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(62,'title_csv_import_export','CSV Import/Export',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(63,'title_countries','Countries',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(64,'title_currencies','Currencies',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(65,'title_customers','Customers',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(66,'title_newsletter','Newsletter',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(67,'title_geo_zones','Geo Zones',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(68,'title_languages','Languages',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(69,'title_storage_encoding','Storage Encoding',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(70,'title_modules','Modules',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(71,'title_customer_modules','Customer Modules',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(72,'title_shipping_modules','Shipping Modules',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(73,'title_payment_modules','Payment Modules',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(74,'title_order_modules','Order Modules',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(75,'title_order_total_modules','Order Total Modules',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(76,'title_job_modules','Job Modules',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(77,'title_orders','Orders',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(78,'title_order_statuses','Order Statuses',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(79,'title_pages','Pages',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(80,'title_reports','Reports',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(81,'title_monthly_sales','Monthly Sales',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(82,'title_most_sold_products','Most Sold Products',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(83,'title_most_shopping_customers','Most Shopping Customers',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(84,'title_settings','Settings',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(85,'settings_group:title_store_info','Store Info',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(86,'settings_group:title_defaults','Defaults',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(87,'settings_group:title_email','Email',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(88,'settings_group:title_listings','Listings',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(89,'settings_group:title_images','Images',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(90,'settings_group:title_checkout','Checkout',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(91,'settings_group:title_advanced','Advanced',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(92,'settings_group:title_security','Security',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(93,'title_slides','Slides',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(94,'title_tax','Tax',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(95,'title_tax_rates','Tax Rates',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(96,'title_tax_classes','Tax Classes',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(97,'title_translations','Translations',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(98,'title_search_translations','Search Translations',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(99,'title_scan_files','Scan Files',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(100,'title_users','Users',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(101,'title_vqmods','vQmods',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(102,'warning_install_folder_exists','Warning: The installation directory is still available and should be deleted.',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(103,'title_addons','Add-ons',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(104,'title_discussions','Discussions',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(105,'title_graphs','Graphs',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(106,'title_statistics','Statistics',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(107,'title_daily_sales','Daily Sales',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(108,'title_total_sales','Total Sales',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(109,'title_total_number_of_customers','Total Number of Customers',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(110,'title_total_number_of_orders','Total Number of Orders',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(111,'title_monthly_average_number_of_orders','Monthly Average Number of Orders',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(112,'title_average_order_amount','Average Order Amount',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(113,'title_highest_order_amount','Highest Order Amount',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(114,'title_id','ID',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(115,'title_customer','Customer',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(116,'title_order_status','Order Status',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(117,'title_amount','Amount',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(118,'title_packing_slip','Packing Slip',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(119,'title_order_copy','Order Copy',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(120,'title_edit','Edit',0,1,0,'2018-09-13 09:08:25','2018-09-13 09:08:25'),
(121,'title_latest_addons','Latest Add-ons',0,1,0,'2018-09-13 09:08:28','2018-09-13 09:08:28'),
(122,'title_most_recent_forum_topics','Most Recent Forum Topics',0,1,0,'2018-09-13 09:08:30','2018-09-13 09:08:30'),
(123,'text_by','by',0,1,0,'2018-09-13 09:08:30','2018-09-13 09:08:30'),
(124,'title_webmail','Webmail',0,1,0,'2018-09-13 09:08:30','2018-09-13 09:08:30'),
(125,'title_database_manager','Database Manager',0,1,0,'2018-09-13 09:08:30','2018-09-13 09:08:30'),
(126,'text_logout','Logout',0,1,0,'2018-09-13 09:08:30','2018-09-13 09:08:30'),
(127,'title_search','Search',0,1,0,'2018-09-13 09:08:30','2018-09-13 09:08:30'),
(128,'text_search_phrase_or_keyword','Search phrase or keyword',0,1,0,'2018-09-13 20:41:13','2018-09-13 20:41:13'),
(129,'title_add_new_category','Add New Category',0,1,0,'2018-09-13 20:41:13','2018-09-13 20:41:13'),
(130,'title_add_new_product','Add New Product',0,1,0,'2018-09-13 20:41:13','2018-09-13 20:41:13'),
(131,'title_root','Root',0,1,0,'2018-09-13 20:41:13','2018-09-13 20:41:13'),
(132,'title_products','Products',0,1,0,'2018-09-13 20:41:13','2018-09-13 20:41:13'),
(133,'text_with_selected','With selected',0,1,0,'2018-09-13 20:41:13','2018-09-13 20:41:13'),
(134,'title_enable','Enable',0,1,0,'2018-09-13 20:41:13','2018-09-13 20:41:13'),
(135,'title_disable','Disable',0,1,0,'2018-09-13 20:41:13','2018-09-13 20:41:13'),
(136,'title_select','Select',0,1,0,'2018-09-13 20:41:13','2018-09-13 20:41:13'),
(137,'title_move','Move',0,1,0,'2018-09-13 20:41:13','2018-09-13 20:41:13'),
(138,'warning_mounting_points_will_be_replaced','Warning: All current mounting points will be replaced.',0,1,0,'2018-09-13 20:41:13','2018-09-13 20:41:13'),
(139,'title_copy','Copy',0,1,0,'2018-09-13 20:41:13','2018-09-13 20:41:13'),
(140,'title_duplicate','Duplicate',0,1,0,'2018-09-13 20:41:13','2018-09-13 20:41:13'),
(141,'title_unmount','Unmount',0,1,0,'2018-09-13 20:41:13','2018-09-13 20:41:13'),
(142,'title_delete','Delete',0,1,0,'2018-09-13 20:41:13','2018-09-13 20:41:13'),
(143,'text_are_you_sure','Are you sure?',0,1,0,'2018-09-13 20:41:13','2018-09-13 20:41:13'),
(144,'title_help','Help',0,1,0,'2018-09-13 20:41:13','2018-09-13 20:41:13'),
(145,'title_general','General',0,1,0,'2018-09-13 20:41:18','2018-09-13 20:41:18'),
(146,'title_status','Status',0,1,0,'2018-09-13 20:41:18','2018-09-13 20:41:18'),
(147,'title_enabled','Enabled',0,1,0,'2018-09-13 20:41:18','2018-09-13 20:41:18'),
(148,'title_disabled','Disabled',0,1,0,'2018-09-13 20:41:18','2018-09-13 20:41:18'),
(149,'title_parent_category','Parent Category',0,1,0,'2018-09-13 20:41:18','2018-09-13 20:41:18'),
(150,'title_google_taxonomy_id','Google Taxonomy ID',0,1,0,'2018-09-13 20:41:18','2018-09-13 20:41:18'),
(151,'title_dock','Dock',0,1,0,'2018-09-13 20:41:18','2018-09-13 20:41:18'),
(152,'text_dock_in_menu','Dock in top menu',0,1,0,'2018-09-13 20:41:18','2018-09-13 20:41:18'),
(153,'text_dock_in_tree','Dock in category tree',0,1,0,'2018-09-13 20:41:18','2018-09-13 20:41:18'),
(154,'title_priority','Priority',0,1,0,'2018-09-13 20:41:18','2018-09-13 20:41:18'),
(155,'title_code','Code',0,1,0,'2018-09-13 20:41:18','2018-09-13 20:41:18'),
(156,'title_list_style','List Style',0,1,0,'2018-09-13 20:41:18','2018-09-13 20:41:18'),
(157,'title_columns','Columns',0,1,0,'2018-09-13 20:41:18','2018-09-13 20:41:18'),
(158,'title_rows','Rows',0,1,0,'2018-09-13 20:41:18','2018-09-13 20:41:18'),
(159,'title_keywords','Keywords',0,1,0,'2018-09-13 20:41:18','2018-09-13 20:41:18'),
(160,'title_image','Image',0,1,0,'2018-09-13 20:41:18','2018-09-13 20:41:18'),
(161,'title_h1_title','H1 Title',0,1,0,'2018-09-13 20:41:18','2018-09-13 20:41:18'),
(162,'title_short_description','Short Description',0,1,0,'2018-09-13 20:41:18','2018-09-13 20:41:18'),
(163,'title_description','Description',0,1,0,'2018-09-13 20:41:18','2018-09-13 20:41:18'),
(164,'title_head_title','Head Title',0,1,0,'2018-09-13 20:41:18','2018-09-13 20:41:18'),
(165,'title_meta_description','Meta Description',0,1,0,'2018-09-13 20:41:18','2018-09-13 20:41:18'),
(166,'title_save','Save',0,1,0,'2018-09-13 20:41:18','2018-09-13 20:41:18'),
(167,'title_cancel','Cancel',0,1,0,'2018-09-13 20:41:18','2018-09-13 20:41:18'),
(168,'success_changes_saved','Changes saved successfully',0,0,0,'2018-09-13 20:42:38','2018-09-13 20:42:38'),
(169,'title_edit_category','Edit Category',0,1,0,'2018-09-13 20:43:10','2018-09-13 20:43:10'),
(170,'title_date_updated','Date Updated',0,1,0,'2018-09-13 20:43:10','2018-09-13 20:43:10'),
(171,'title_date_created','Date Created',0,1,0,'2018-09-13 20:43:10','2018-09-13 20:43:10'),
(172,'title_username','Username',0,1,0,'2018-09-14 11:25:44','2018-09-14 11:25:44'),
(173,'title_remember_me','Remember Me',0,1,0,'2018-09-14 11:25:44','2018-09-14 11:25:44'),
(174,'error_wrong_username_password_combination','Wrong combination of username and password or the account does not exist.',0,1,0,'2018-09-14 11:25:50','2018-09-14 11:25:50'),
(175,'error_d_login_attempts_left','You have %d login attempts left until your account is blocked',0,1,0,'2018-09-14 11:25:50','2018-09-14 11:25:50'),
(176,'error_account_has_been_blocked','The account has been temporary blocked %d minutes',0,1,0,'2018-09-14 11:26:53','2018-09-14 11:26:53'),
(177,'error_account_is_blocked','The account is blocked until %s',0,1,0,'2018-09-14 11:28:43','2018-09-14 11:28:43'),
(178,'success_now_logged_in_as','You are now logged in as %username',0,0,0,'2018-09-14 11:45:22','2018-09-14 11:45:22'),
(179,'error_code_database_conflict','Another entry with the given code already exists in the database',0,1,0,'2018-09-14 11:51:39','2018-09-14 11:51:39'),
(180,'title_empty','Empty',0,1,0,'2018-09-14 11:54:55','2018-09-14 11:54:55'),
(181,'title_import_from_csv','Import From CSV',0,1,0,'2018-09-14 16:17:36','2018-09-14 16:17:36'),
(182,'title_csv_file','CSV File',0,1,0,'2018-09-14 16:17:36','2018-09-14 16:17:36'),
(183,'title_delimiter','Delimiter',0,1,0,'2018-09-14 16:17:36','2018-09-14 16:17:36'),
(184,'title_auto','Auto',0,1,0,'2018-09-14 16:17:36','2018-09-14 16:17:36'),
(185,'text_default','default',0,1,0,'2018-09-14 16:17:36','2018-09-14 16:17:36'),
(186,'title_enclosure','Enclosure',0,1,0,'2018-09-14 16:17:36','2018-09-14 16:17:36'),
(187,'title_escape_character','Escape Character',0,1,0,'2018-09-14 16:17:36','2018-09-14 16:17:36'),
(188,'title_charset','Charset',0,1,0,'2018-09-14 16:17:36','2018-09-14 16:17:36'),
(189,'text_insert_new_products','Insert new products',0,1,0,'2018-09-14 16:17:36','2018-09-14 16:17:36'),
(190,'title_import','Import',0,1,0,'2018-09-14 16:17:36','2018-09-14 16:17:36'),
(191,'title_export_to_csv','Export To CSV',0,1,0,'2018-09-14 16:17:36','2018-09-14 16:17:36'),
(192,'title_language','Language',0,1,0,'2018-09-14 16:17:36','2018-09-14 16:17:36'),
(193,'title_currency','Currency',0,1,0,'2018-09-14 16:17:36','2018-09-14 16:17:36'),
(194,'title_line_ending','Line Ending',0,1,0,'2018-09-14 16:17:36','2018-09-14 16:17:36'),
(195,'title_output','Output',0,1,0,'2018-09-14 16:17:36','2018-09-14 16:17:36'),
(196,'title_file','File',0,1,0,'2018-09-14 16:17:36','2018-09-14 16:17:36'),
(197,'title_screen','Screen',0,1,0,'2018-09-14 16:17:36','2018-09-14 16:17:36'),
(198,'title_export','Export',0,1,0,'2018-09-14 16:17:36','2018-09-14 16:17:36'),
(199,'error_only_products_are_supported','Only products are supported for this operation',0,1,0,'2018-09-14 18:09:53','2018-09-14 18:09:53'),
(200,'title_add_new_currency','Add New Currency',0,1,0,'2018-09-14 18:10:54','2018-09-14 18:10:54'),
(201,'title_value','Value',0,1,0,'2018-09-14 18:10:54','2018-09-14 18:10:54'),
(202,'title_decimals','Decimals',0,1,0,'2018-09-14 18:10:54','2018-09-14 18:10:54'),
(203,'title_prefix','Prefix',0,1,0,'2018-09-14 18:10:54','2018-09-14 18:10:54'),
(204,'title_suffix','Suffix',0,1,0,'2018-09-14 18:10:54','2018-09-14 18:10:54'),
(205,'title_default_currency','Default Currency',0,1,0,'2018-09-14 18:10:54','2018-09-14 18:10:54'),
(206,'title_store_currency','Store Currency',0,1,0,'2018-09-14 18:10:54','2018-09-14 18:10:54'),
(207,'title_add_new_customer','Add New Customer',0,1,0,'2018-09-14 18:10:57','2018-09-14 18:10:57'),
(208,'title_email','Email',0,1,0,'2018-09-14 18:10:57','2018-09-14 18:10:57'),
(209,'title_company','Company',0,1,0,'2018-09-14 18:10:57','2018-09-14 18:10:57'),
(210,'title_date_registered','Date Registered',0,1,0,'2018-09-14 18:10:57','2018-09-14 18:10:57'),
(211,'title_add_new_geo_zone','Add New Geo Zone',0,1,0,'2018-09-14 18:10:59','2018-09-14 18:10:59'),
(212,'title_zones','Zones',0,1,0,'2018-09-14 18:10:59','2018-09-14 18:10:59'),
(213,'title_add_new_language','Add New Language',0,1,0,'2018-09-14 18:11:02','2018-09-14 18:11:02'),
(214,'title_default_language','Default Language',0,1,0,'2018-09-14 18:11:02','2018-09-14 18:11:02'),
(215,'title_store_language','Store Language',0,1,0,'2018-09-14 18:11:02','2018-09-14 18:11:02'),
(216,'title_version','Version',0,1,0,'2018-09-14 18:11:07','2018-09-14 18:11:07'),
(217,'title_developer','Developer',0,1,0,'2018-09-14 18:11:07','2018-09-14 18:11:07'),
(218,'title_install','Install',0,1,0,'2018-09-14 18:11:07','2018-09-14 18:11:07'),
(219,'title_external_link','External Link',0,1,0,'2018-09-14 18:11:07','2018-09-14 18:11:07'),
(220,'title_payment_method','Payment Method',0,1,0,'2018-09-14 18:11:11','2018-09-14 18:11:11'),
(221,'title_filter_now','Filter',0,1,0,'2018-09-14 18:11:11','2018-09-14 18:11:11'),
(222,'title_create_new_order','Create New Order',0,1,0,'2018-09-14 18:11:11','2018-09-14 18:11:11'),
(223,'title_customer_name','Customer Name',0,1,0,'2018-09-14 18:11:11','2018-09-14 18:11:11'),
(224,'title_country','Country',0,1,0,'2018-09-14 18:11:11','2018-09-14 18:11:11'),
(225,'title_create_new_page','Create New Page',0,1,0,'2018-09-14 18:11:13','2018-09-14 18:11:13'),
(226,'title_title','Title',0,1,0,'2018-09-14 18:11:13','2018-09-14 18:11:13'),
(227,'title_edit_page','Edit Page',0,1,0,'2018-09-14 18:11:25','2018-09-14 18:11:25'),
(228,'text_dock_in_dock_menu','Dock in site menu',0,1,0,'2018-09-14 18:11:25','2018-09-14 18:11:25'),
(229,'text_dock_in_customer_service','Dock in customer service',0,1,0,'2018-09-14 18:11:25','2018-09-14 18:11:25'),
(230,'text_dock_in_information','Dock in information',0,1,0,'2018-09-14 18:11:25','2018-09-14 18:11:25'),
(231,'title_content','Content',0,1,0,'2018-09-14 18:11:25','2018-09-14 18:11:25'),
(232,'title_date_period','Date Period',0,1,0,'2018-09-14 18:11:33','2018-09-14 18:11:33'),
(233,'title_month','Month',0,1,0,'2018-09-14 18:11:33','2018-09-14 18:11:33'),
(234,'title_subtotal','Subtotal',0,1,0,'2018-09-14 18:11:33','2018-09-14 18:11:33'),
(235,'title_shipping_fees','Shipping Fees',0,1,0,'2018-09-14 18:11:33','2018-09-14 18:11:33'),
(236,'title_payment_fees','Payment Fees',0,1,0,'2018-09-14 18:11:33','2018-09-14 18:11:33'),
(237,'title_key','Key',0,1,0,'2018-09-14 18:11:35','2018-09-14 18:11:35'),
(238,'settings_key:title_store_name','Store Name',0,1,0,'2018-09-14 18:11:35','2018-09-14 18:11:35'),
(239,'settings_key:description_store_name','The name of your store.',0,1,0,'2018-09-14 18:11:35','2018-09-14 18:11:35'),
(240,'settings_key:title_store_email','Store Email',0,1,0,'2018-09-14 18:11:35','2018-09-14 18:11:35'),
(241,'settings_key:description_store_email','The store e-mail address.',0,1,0,'2018-09-14 18:11:35','2018-09-14 18:11:35'),
(242,'settings_key:title_store_tax_id','Store Tax ID',0,1,0,'2018-09-14 18:11:35','2018-09-14 18:11:35'),
(243,'settings_key:description_store_tax_id','The store tax ID or VATIN.',0,1,0,'2018-09-14 18:11:35','2018-09-14 18:11:35'),
(244,'settings_key:title_store_postal_address','Store Postal Address',0,1,0,'2018-09-14 18:11:35','2018-09-14 18:11:35'),
(245,'settings_key:description_store_postal_address','The store postal address.',0,1,0,'2018-09-14 18:11:35','2018-09-14 18:11:35'),
(246,'settings_key:title_store_visiting_address','Store Visiting Address',0,1,0,'2018-09-14 18:11:35','2018-09-14 18:11:35'),
(247,'settings_key:description_store_visiting_address','The store visiting address if applicable.',0,1,0,'2018-09-14 18:11:35','2018-09-14 18:11:35'),
(248,'settings_key:title_store_phone','Store Phone Number',0,1,0,'2018-09-14 18:11:35','2018-09-14 18:11:35'),
(249,'settings_key:description_store_phone','The store phone number.',0,1,0,'2018-09-14 18:11:35','2018-09-14 18:11:35'),
(250,'settings_key:title_store_country_code','Store Country',0,1,0,'2018-09-14 18:11:35','2018-09-14 18:11:35'),
(251,'settings_key:description_store_country_code','The country of your store.',0,1,0,'2018-09-14 18:11:35','2018-09-14 18:11:35'),
(252,'settings_key:title_store_timezone','Store Time Zone',0,1,0,'2018-09-14 18:11:35','2018-09-14 18:11:35'),
(253,'settings_key:description_store_timezone','The store time zone.',0,1,0,'2018-09-14 18:11:35','2018-09-14 18:11:35'),
(254,'settings_key:title_store_language_code','Store Language',0,1,0,'2018-09-14 18:11:35','2018-09-14 18:11:35'),
(255,'settings_key:description_store_language_code','The spoken language of your organization.',0,1,0,'2018-09-14 18:11:35','2018-09-14 18:11:35'),
(256,'settings_key:title_store_currency_code','Store Currency',0,1,0,'2018-09-14 18:11:35','2018-09-14 18:11:35'),
(257,'settings_key:description_store_currency_code','The currency of which all prices conform to.',0,1,0,'2018-09-14 18:11:35','2018-09-14 18:11:35'),
(258,'settings_key:title_store_zone_code','Store Zone',0,1,0,'2018-09-14 18:11:35','2018-09-14 18:11:35'),
(259,'settings_key:description_store_zone_code','The zone of your store.',0,1,0,'2018-09-14 18:11:35','2018-09-14 18:11:35'),
(260,'settings_key:title_store_weight_class','Store Weight Class',0,1,0,'2018-09-14 18:11:35','2018-09-14 18:11:35'),
(261,'settings_key:description_store_weight_class','The prefered weight class.',0,1,0,'2018-09-14 18:11:35','2018-09-14 18:11:35'),
(262,'settings_key:title_store_length_class','Store Length Class',0,1,0,'2018-09-14 18:11:35','2018-09-14 18:11:35'),
(263,'settings_key:description_store_length_class','The prefered length class.',0,1,0,'2018-09-14 18:11:35','2018-09-14 18:11:35'),
(264,'title_create_new_group','Create New Group',0,1,0,'2018-09-14 18:11:43','2018-09-14 18:11:43'),
(265,'title_values','Values',0,1,0,'2018-09-14 18:11:43','2018-09-14 18:11:43'),
(266,'title_edit_product','Edit Product',0,1,0,'2018-09-14 18:11:54','2018-09-14 18:11:54'),
(267,'title_prices','Prices',0,1,0,'2018-09-14 18:11:54','2018-09-14 18:11:54'),
(268,'title_options','Options',0,1,0,'2018-09-14 18:11:54','2018-09-14 18:11:54'),
(269,'title_stock','Stock',0,1,0,'2018-09-14 18:11:54','2018-09-14 18:11:54'),
(270,'title_default_category','Default Category',0,1,0,'2018-09-14 18:11:54','2018-09-14 18:11:54'),
(271,'title_date_valid_from','Date Valid From',0,1,0,'2018-09-14 18:11:54','2018-09-14 18:11:54'),
(272,'title_date_valid_to','Date Valid To',0,1,0,'2018-09-14 18:11:54','2018-09-14 18:11:54'),
(273,'title_sku','SKU',0,1,0,'2018-09-14 18:11:54','2018-09-14 18:11:54'),
(274,'title_mpn','MPN',0,1,0,'2018-09-14 18:11:54','2018-09-14 18:11:54'),
(275,'title_gtin','GTIN',0,1,0,'2018-09-14 18:11:54','2018-09-14 18:11:54'),
(276,'title_taric','TARIC',0,1,0,'2018-09-14 18:11:54','2018-09-14 18:11:54'),
(277,'title_manufacturer','Manufacturer',0,1,0,'2018-09-14 18:11:54','2018-09-14 18:11:54'),
(278,'title_supplier','Supplier',0,1,0,'2018-09-14 18:11:54','2018-09-14 18:11:54'),
(279,'title_images','Images',0,1,0,'2018-09-14 18:11:54','2018-09-14 18:11:54'),
(280,'text_move_up','Move up',0,1,0,'2018-09-14 18:11:54','2018-09-14 18:11:54'),
(281,'text_move_down','Move down',0,1,0,'2018-09-14 18:11:54','2018-09-14 18:11:54'),
(282,'title_remove','Remove',0,1,0,'2018-09-14 18:11:54','2018-09-14 18:11:54'),
(283,'text_add','Add',0,1,0,'2018-09-14 18:11:54','2018-09-14 18:11:54'),
(284,'title_attributes','Attributes',0,1,0,'2018-09-14 18:11:54','2018-09-14 18:11:54'),
(285,'title_purchase_price','Purchase Price',0,1,0,'2018-09-14 18:11:54','2018-09-14 18:11:54'),
(286,'title_tax_class','Tax Class',0,1,0,'2018-09-14 18:11:54','2018-09-14 18:11:54'),
(287,'title_price_incl_tax','Price Incl. Tax',0,1,0,'2018-09-14 18:11:54','2018-09-14 18:11:54'),
(288,'title_campaigns','Campaigns',0,1,0,'2018-09-14 18:11:54','2018-09-14 18:11:54'),
(289,'text_add_campaign','Add Campaign',0,1,0,'2018-09-14 18:11:54','2018-09-14 18:11:54'),
(290,'title_group','Group',0,1,0,'2018-09-14 18:11:54','2018-09-14 18:11:54'),
(291,'title_price_operator','Price Operator',0,1,0,'2018-09-14 18:11:54','2018-09-14 18:11:54'),
(292,'title_price_adjustment','Price Adjustment',0,1,0,'2018-09-14 18:11:54','2018-09-14 18:11:54'),
(293,'title_add_option','Add Option',0,1,0,'2018-09-14 18:11:54','2018-09-14 18:11:54'),
(294,'title_quantity_unit','Quantity Unit',0,1,0,'2018-09-14 18:11:54','2018-09-14 18:11:54'),
(295,'title_delivery_status','Delivery Status',0,1,0,'2018-09-14 18:11:54','2018-09-14 18:11:54'),
(296,'title_sold_out_status','Sold Out Status',0,1,0,'2018-09-14 18:11:54','2018-09-14 18:11:54'),
(297,'title_option','Option',0,1,0,'2018-09-14 18:11:54','2018-09-14 18:11:54'),
(298,'title_weight','Weight',0,1,0,'2018-09-14 18:11:54','2018-09-14 18:11:54'),
(299,'title_dimensions','Dimensions',0,1,0,'2018-09-14 18:11:54','2018-09-14 18:11:54'),
(300,'title_qty','Qty',0,1,0,'2018-09-14 18:11:54','2018-09-14 18:11:54'),
(301,'title_default_item','Default Item',0,1,0,'2018-09-14 18:11:54','2018-09-14 18:11:54'),
(302,'title_add_stock_option','Add Stock Option',0,1,0,'2018-09-14 18:11:54','2018-09-14 18:11:54'),
(303,'title_new_stock_option','New Stock Option',0,1,0,'2018-09-14 18:11:54','2018-09-14 18:11:54'),
(304,'title_add_to_combination','Add To Combination',0,1,0,'2018-09-14 18:11:54','2018-09-14 18:11:54'),
(305,'tooltip_field_price_incl_tax','This field helps you calculate net price based on the store region tax. All prices input to database are always excluding tax.',0,1,0,'2018-09-14 18:11:54','2018-09-14 18:11:54'),
(306,'title_start_date','Start Date',0,1,0,'2018-09-14 18:11:54','2018-09-14 18:11:54'),
(307,'title_end_date','End Date',0,1,0,'2018-09-14 18:11:54','2018-09-14 18:11:54'),
(308,'error_empty_option_group','Error: Empty option group',0,1,0,'2018-09-14 18:11:54','2018-09-14 18:11:54'),
(309,'error_empty_option_value','Error: Empty option value',0,1,0,'2018-09-14 18:11:54','2018-09-14 18:11:54'),
(310,'error_410_gone','The requested file is no longer available',0,1,0,'2018-09-14 22:20:40','2018-09-14 22:20:40'),
(311,'error_must_select_products','You must select products',0,1,0,'2018-09-14 22:28:54','2018-09-14 22:28:54'),
(312,'error_must_select_category_or_product','You must select a category or product',0,1,0,'2018-09-14 22:29:10','2018-09-14 22:29:10'),
(313,'title_function','Function',0,1,0,'2018-09-16 17:48:32','2018-09-16 17:48:32'),
(314,'title_create_new_option_group','Create New Option Group',0,1,0,'2018-09-16 17:48:34','2018-09-16 17:48:34'),
(315,'title_required','Required',0,1,0,'2018-09-16 17:48:34','2018-09-16 17:48:34'),
(316,'title_sort','Sort',0,1,0,'2018-09-16 17:48:34','2018-09-16 17:48:34'),
(317,'title_alphabetical','Alphabetical',0,1,0,'2018-09-16 17:48:34','2018-09-16 17:48:34'),
(318,'text_set_by_product','Set by product',0,1,0,'2018-09-16 17:48:34','2018-09-16 17:48:34'),
(319,'title_add_value','Add Value',0,1,0,'2018-09-16 17:48:34','2018-09-16 17:48:34'),
(320,'title_range','Range',0,1,0,'2018-09-16 17:48:34','2018-09-16 17:48:34'),
(321,'title_example','Example',0,1,0,'2018-09-16 17:48:34','2018-09-16 17:48:34'),
(322,'title_default','Default',0,1,0,'2018-09-16 17:48:34','2018-09-16 17:48:34'),
(323,'title_edit_option_group','Edit Option Group',0,1,0,'2018-09-16 17:49:38','2018-09-16 17:49:38'),
(324,'text_no_product_description','There is no description for this product yet.',0,1,0,'2018-09-16 17:52:57','2018-09-16 17:52:57'),
(325,'sm_zone_weight:title_zone_based_shipping','Zone Based Shipping',0,1,0,'2018-09-16 17:52:57','2018-09-16 17:52:57'),
(326,'sm_zone_weight:title_status','Status',0,1,0,'2018-09-16 17:52:57','2018-09-16 17:52:57'),
(327,'sm_zone_weight:description_status','',0,1,0,'2018-09-16 17:52:57','2018-09-16 17:52:57'),
(328,'sm_zone_weight:title_icon','Icon',0,1,0,'2018-09-16 17:52:57','2018-09-16 17:52:57'),
(329,'sm_zone_weight:description_icon','Web path of the icon to be displayed.',0,1,0,'2018-09-16 17:52:57','2018-09-16 17:52:57'),
(330,'sm_zone_weight:title_weight_class','Weight Class',0,1,0,'2018-09-16 17:52:57','2018-09-16 17:52:57'),
(331,'sm_zone_weight:description_weight_class','The weight class for the rate table.',0,1,0,'2018-09-16 17:52:57','2018-09-16 17:52:57'),
(332,'sm_zone_weight:title_zone','Zone',0,1,0,'2018-09-16 17:52:57','2018-09-16 17:52:57'),
(333,'sm_zone_weight:title_geo_zone','Geo Zone',0,1,0,'2018-09-16 17:52:57','2018-09-16 17:52:57'),
(334,'sm_zone_weight:description_geo_zone','Geo zone to which the cost applies.',0,1,0,'2018-09-16 17:52:57','2018-09-16 17:52:57'),
(335,'sm_zone_weight:title_weight_rate_table','Weight Rate Table',0,1,0,'2018-09-16 17:52:57','2018-09-16 17:52:57'),
(336,'sm_zone_weight:description_weight_rate_table','Ascending rate table of the shipping cost. The format must be weight:cost;weight:cost;.. (E.g. 5:8.95;10:15.95;..)',0,1,0,'2018-09-16 17:52:57','2018-09-16 17:52:57'),
(337,'sm_zone_weight:title_non_matched_zones','Non-matched Zones',0,1,0,'2018-09-16 17:52:57','2018-09-16 17:52:57'),
(338,'sm_zone_weight:title_method','Method',0,1,0,'2018-09-16 17:52:57','2018-09-16 17:52:57'),
(339,'sm_zone_weight:description_method','The calculation method that should to be used for the rate tables where a condition is met for shipping weight. E.g. weight < table',0,1,0,'2018-09-16 17:52:57','2018-09-16 17:52:57'),
(340,'sm_zone_weight:title_handling_fee','Handling Fee',0,1,0,'2018-09-16 17:52:57','2018-09-16 17:52:57'),
(341,'sm_zone_weight:description_handling_fee','Enter your handling fee for the shipment.',0,1,0,'2018-09-16 17:52:57','2018-09-16 17:52:57'),
(342,'sm_zone_weight:title_tax_class','Tax Class',0,1,0,'2018-09-16 17:52:57','2018-09-16 17:52:57'),
(343,'sm_zone_weight:description_tax_class','The tax class for the shipping cost.',0,1,0,'2018-09-16 17:52:57','2018-09-16 17:52:57'),
(344,'sm_zone_weight:title_priority','Priority',0,1,0,'2018-09-16 17:52:57','2018-09-16 17:52:57'),
(345,'sm_zone_weight:description_priority','Process this module by the given priority value.',0,1,0,'2018-09-16 17:52:57','2018-09-16 17:52:57'),
(346,'sm_zone_weight:title_option_name_zone_x','',0,1,0,'2018-09-16 17:52:57','2018-09-16 17:52:57'),
(347,'text_view_full_page','View full page',0,1,0,'2018-09-16 17:52:57','2018-09-16 17:52:57'),
(348,'title_excluding_tax','Excluding Tax',0,1,0,'2018-09-16 17:52:57','2018-09-16 17:52:57'),
(349,'text_cheapest_shipping_from_price','Cheapest shipping from <strong class=\"value\">%price</strong>',1,1,0,'2018-09-16 17:52:57','2018-09-16 17:52:57'),
(350,'title_stock_status','Stock Status',0,1,0,'2018-09-16 17:52:57','2018-09-16 17:52:57'),
(351,'title_quantity','Quantity',0,1,0,'2018-09-16 17:52:57','2018-09-16 17:52:57'),
(352,'title_add_to_cart','Add To Cart',0,1,0,'2018-09-16 17:52:57','2018-09-16 17:52:57'),
(353,'text_share_on_s','Share on %s',0,1,0,'2018-09-16 17:52:57','2018-09-16 17:52:57'),
(354,'text_link_to_this_product','Link to this product',0,1,0,'2018-09-16 17:52:57','2018-09-16 17:52:57'),
(355,'title_recently_viewed','Recently Viewed',0,1,0,'2018-09-16 17:53:15','2018-09-16 17:53:15'),
(356,'title_edit_product_group','Edit Product Group',0,1,0,'2018-09-17 10:10:50','2018-09-17 10:10:50'),
(357,'title_add_group','Add Group Value',0,1,0,'2018-09-17 10:10:50','2018-09-17 10:10:50'),
(358,'title_new_product_group','Create New Product Group',0,1,0,'2018-09-17 11:10:56','2018-09-17 11:10:56'),
(359,'title_similar_products','Similar Products',0,1,0,'2018-09-17 19:55:38','2018-09-17 19:55:38'),
(360,'title_search_results_for_s','Search Results for &quot;%s&quot;',0,1,0,'2018-09-18 14:59:52','2018-09-18 14:59:52'),
(361,'title_search_results','Search Results',0,1,0,'2018-09-18 14:59:52','2018-09-18 14:59:52'),
(362,'title_relevance','Relevance',0,1,0,'2018-09-18 14:59:52','2018-09-18 14:59:52'),
(363,'error_must_select_category','You must select a category',0,1,0,'2018-09-18 15:01:18','2018-09-18 15:01:18'),
(364,'title_add_new_tax_rate','Add New Tax Rate',0,1,0,'2018-09-19 14:40:48','2018-09-19 14:40:48'),
(365,'title_geo_zone','Geo Zone',0,1,0,'2018-09-19 14:40:48','2018-09-19 14:40:48'),
(366,'title_rate','Rate',0,1,0,'2018-09-19 14:40:48','2018-09-19 14:40:48'),
(367,'title_type','Type',0,1,0,'2018-09-19 14:40:48','2018-09-19 14:40:48'),
(368,'title_address_type','Address Type',0,1,0,'2018-09-19 14:40:50','2018-09-19 14:40:50'),
(369,'title_shipping_address','Shipping Address',0,1,0,'2018-09-19 14:40:50','2018-09-19 14:40:50'),
(370,'title_payment_address','Payment Address',0,1,0,'2018-09-19 14:40:50','2018-09-19 14:40:50'),
(371,'title_rule','Rule',0,1,0,'2018-09-19 14:40:50','2018-09-19 14:40:50'),
(372,'title_customer_type','Customer Type',0,1,0,'2018-09-19 14:40:50','2018-09-19 14:40:50'),
(373,'text_tax_rate_rule_individuals','Applies to individuals',0,1,0,'2018-09-19 14:40:50','2018-09-19 14:40:50'),
(374,'text_tax_rate_rule_companies','Applies to companies',0,1,0,'2018-09-19 14:40:50','2018-09-19 14:40:50'),
(375,'text_tax_rate_rule_both_of_the_above','Applies to both of above',0,1,0,'2018-09-19 14:40:50','2018-09-19 14:40:50'),
(376,'title_tax_id','Tax ID / VATIN',0,1,0,'2018-09-19 14:40:50','2018-09-19 14:40:50'),
(377,'text_tax_rate_rule_customers_with_tax_id','Applies to customers with a tax ID',0,1,0,'2018-09-19 14:40:50','2018-09-19 14:40:50'),
(378,'text_tax_rate_rule_customers_without_tax_id','Applies to customers without a tax ID',0,1,0,'2018-09-19 14:40:50','2018-09-19 14:40:50'),
(379,'title_add_new_tax_class','Add New Tax Class',0,1,0,'2018-09-19 14:41:13','2018-09-19 14:41:13'),
(380,'success_product_added_to_cart','Your product was successfully added to the cart.',0,0,0,'2018-09-19 14:41:47','2018-09-19 14:41:47'),
(381,'checkout:head_title','Checkout',0,1,0,'2018-09-19 14:41:50','2018-09-19 14:41:50'),
(382,'title_checkout','Checkout',0,1,0,'2018-09-19 14:41:50','2018-09-19 14:41:50'),
(383,'warning_your_customer_information_unsaved','Your customer information contains unsaved changes.',0,1,0,'2018-09-19 14:41:50','2018-09-19 14:41:50'),
(384,'text_please_wait','Please wait',0,1,0,'2018-09-19 14:41:50','2018-09-19 14:41:50'),
(385,'title_item','Item',0,1,0,'2018-09-19 14:41:50','2018-09-19 14:41:50'),
(386,'title_sum','Sum',0,1,0,'2018-09-19 14:41:50','2018-09-19 14:41:50'),
(387,'title_update','Update',0,1,0,'2018-09-19 14:41:51','2018-09-19 14:41:51'),
(388,'title_customer_details','Customer Details',0,1,0,'2018-09-19 14:41:51','2018-09-19 14:41:51'),
(389,'title_firstname','First Name',0,1,0,'2018-09-19 14:41:51','2018-09-19 14:41:51'),
(390,'title_lastname','Last Name',0,1,0,'2018-09-19 14:41:51','2018-09-19 14:41:51'),
(391,'title_address1','Address 1',0,1,0,'2018-09-19 14:41:51','2018-09-19 14:41:51'),
(392,'title_address2','Address 2',0,1,0,'2018-09-19 14:41:51','2018-09-19 14:41:51'),
(393,'title_postcode','Postal Code',0,1,0,'2018-09-19 14:41:51','2018-09-19 14:41:51'),
(394,'title_city','City',0,1,0,'2018-09-19 14:41:51','2018-09-19 14:41:51'),
(395,'title_zone_state_province','Zone/State/Province',0,1,0,'2018-09-19 14:41:51','2018-09-19 14:41:51'),
(396,'title_phone','Phone',0,1,0,'2018-09-19 14:41:51','2018-09-19 14:41:51'),
(397,'title_different_shipping_address','Different Shipping Address',0,1,0,'2018-09-19 14:41:51','2018-09-19 14:41:51'),
(398,'title_desired_password','Desired Password',0,1,0,'2018-09-19 14:41:51','2018-09-19 14:41:51'),
(399,'title_confirm_password','Confirm Password',0,1,0,'2018-09-19 14:41:51','2018-09-19 14:41:51'),
(400,'title_save_changes','Save Changes',0,1,0,'2018-09-19 14:41:51','2018-09-19 14:41:51'),
(401,'title_shipping','Shipping',0,1,0,'2018-09-19 14:41:52','2018-09-19 14:41:52'),
(402,'text_no_fee','No fee',0,1,0,'2018-09-19 14:41:52','2018-09-19 14:41:52'),
(403,'pm_cod:title_status','Status',0,1,0,'2018-09-19 14:41:52','2018-09-19 14:41:52'),
(404,'pm_cod:description_status','Enables or disables the module.',0,1,0,'2018-09-19 14:41:52','2018-09-19 14:41:52'),
(405,'pm_cod:title_icon','Icon',0,1,0,'2018-09-19 14:41:52','2018-09-19 14:41:52'),
(406,'pm_cod:description_icon','Web path of the icon to be displayed.',0,1,0,'2018-09-19 14:41:52','2018-09-19 14:41:52'),
(407,'pm_cod:title_payment_fee','Payment Fee',0,1,0,'2018-09-19 14:41:52','2018-09-19 14:41:52'),
(408,'pm_cod:description_payment_fee','Adds a payment fee to the order.',0,1,0,'2018-09-19 14:41:52','2018-09-19 14:41:52'),
(409,'pm_cod:title_tax_class','Tax Class',0,1,0,'2018-09-19 14:41:52','2018-09-19 14:41:52'),
(410,'pm_cod:description_tax_class','The tax class for the fee.',0,1,0,'2018-09-19 14:41:52','2018-09-19 14:41:52'),
(411,'modules:description_order_status','Give orders made with this payment method the following order status.',0,1,0,'2018-09-19 14:41:52','2018-09-19 14:41:52'),
(412,'title_geo_zone_limitation','Geo Zone Limitation',0,1,0,'2018-09-19 14:41:52','2018-09-19 14:41:52'),
(413,'modules:description_geo_zone','Limit this module to the selected geo zone. Otherwise leave blank.',0,1,0,'2018-09-19 14:41:52','2018-09-19 14:41:52'),
(414,'modules:description_priority','Process this module in the given priority order.',0,1,0,'2018-09-19 14:41:52','2018-09-19 14:41:52'),
(415,'pm_cod:title_cash_on_delivery','Cash on Delivery',0,1,0,'2018-09-19 14:41:52','2018-09-19 14:41:52'),
(416,'pm_cod:title_confirm_order','Confirm Order',0,1,0,'2018-09-19 14:41:52','2018-09-19 14:41:52'),
(417,'title_payment','Payment',0,1,0,'2018-09-19 14:41:52','2018-09-19 14:41:52'),
(418,'ot_subtotal:title_subtotal','Subtotal',0,1,0,'2018-09-19 14:41:53','2018-09-19 14:41:53'),
(419,'ot_subtotal:title_status','Status',0,1,0,'2018-09-19 14:41:53','2018-09-19 14:41:53'),
(420,'ot_subtotal:description_status','Enables or disables the module.',0,1,0,'2018-09-19 14:41:53','2018-09-19 14:41:53'),
(421,'ot_subtotal:title_priority','Priority',0,1,0,'2018-09-19 14:41:53','2018-09-19 14:41:53'),
(422,'ot_subtotal:description_priority','Process this module by the given priority value.',0,1,0,'2018-09-19 14:41:53','2018-09-19 14:41:53'),
(423,'ot_shipping_fee:title_shipping_fee','Shipping Fee',0,1,0,'2018-09-19 14:41:53','2018-09-19 14:41:53'),
(424,'ot_shipping_fee:title_status','Status',0,1,0,'2018-09-19 14:41:53','2018-09-19 14:41:53'),
(425,'ot_shipping_fee:description_status','Enables or disables the module.',0,1,0,'2018-09-19 14:41:53','2018-09-19 14:41:53'),
(426,'ot_shipping_fee:title_free_shipping_table','Free Shipping Table',0,1,0,'2018-09-19 14:41:53','2018-09-19 14:41:53'),
(427,'ot_shipping_fee:description_free_shipping_table','Free shipping table in standard CSV format with column headers.',0,1,0,'2018-09-19 14:41:53','2018-09-19 14:41:53'),
(428,'ot_shipping_fee:title_priority','Priority',0,1,0,'2018-09-19 14:41:53','2018-09-19 14:41:53'),
(429,'ot_shipping_fee:description_priority','Process this module by the given priority value.',0,1,0,'2018-09-19 14:41:53','2018-09-19 14:41:53'),
(430,'ot_payment_fee:title_payment_fee','Payment Fee',0,1,0,'2018-09-19 14:41:53','2018-09-19 14:41:53'),
(431,'ot_payment_fee:title_status','Status',0,1,0,'2018-09-19 14:41:53','2018-09-19 14:41:53'),
(432,'ot_payment_fee:description_status','Enables or disables the module.',0,1,0,'2018-09-19 14:41:53','2018-09-19 14:41:53'),
(433,'ot_payment_fee:title_priority','Priority',0,1,0,'2018-09-19 14:41:53','2018-09-19 14:41:53'),
(434,'ot_payment_fee:description_priority','Process this module by the given priority value.',0,1,0,'2018-09-19 14:41:53','2018-09-19 14:41:53'),
(435,'title_including_tax','Including Tax',0,1,0,'2018-09-19 14:41:53','2018-09-19 14:41:53'),
(436,'error_missing_firstname','You must enter a firstname.',0,1,0,'2018-09-19 14:41:53','2018-09-19 14:41:53'),
(437,'title_order_summary','Order Summary',0,1,0,'2018-09-19 14:41:53','2018-09-19 14:41:53'),
(438,'title_payment_due','Payment Due',0,1,0,'2018-09-19 14:41:53','2018-09-19 14:41:53'),
(439,'title_comments','Comments',0,1,0,'2018-09-19 14:41:53','2018-09-19 14:41:53'),
(440,'error_item_not_a_valid_product','The item is not a valid product',0,1,0,'2018-09-19 14:53:22','2018-09-19 14:53:22'),
(441,'error_cart_contains_errors','Your cart contains errors',0,1,0,'2018-09-19 14:53:25','2018-09-19 14:53:25'),
(442,'title_add_new_manufacturer','Add New Manufacturer',0,1,0,'2018-09-19 14:53:35','2018-09-19 14:53:35'),
(443,'description_no_existing_product_groups','There are no existing product groups.',0,1,0,'2018-09-19 15:01:23','2018-09-19 15:01:23'),
(444,'text_user_input','User input',0,1,0,'2018-09-19 18:16:58','2018-09-19 18:16:58'),
(445,'categories:head_title','Categories',0,1,0,'2018-09-19 23:09:59','2018-09-19 23:09:59'),
(446,'categories:meta_description','',0,1,0,'2018-09-19 23:09:59','2018-09-19 23:09:59'),
(447,'error_404_not_found','The requested file could not be found',0,1,0,'2018-09-19 23:15:03','2018-09-19 23:15:03'),
(448,'title_add_new_unit','Add New Unit',0,1,0,'2018-09-20 21:46:09','2018-09-20 21:46:09'),
(449,'title_add_new_supplier','Add New Supplier',0,1,0,'2018-09-20 22:46:00','2018-09-20 22:46:00'),
(450,'text_already_logged_in','You are already logged in',0,1,0,'2018-09-22 11:35:37','2018-09-22 11:35:37'),
(451,'title_false','False',0,1,0,'2018-09-25 11:04:34','2018-09-25 11:04:34'),
(452,'settings_key:title_cache_clear_thumbnails','Clear Thumbnails Cache',0,1,0,'2018-09-25 11:04:34','2018-09-25 11:04:34'),
(453,'settings_key:description_cache_clear_thumbnails','Remove all cached image thumbnails from disk.',0,1,0,'2018-09-25 11:04:34','2018-09-25 11:04:34'),
(454,'settings_key:title_category_image_ratio','Category Images: Aspect Ratio',0,1,0,'2018-09-25 11:04:34','2018-09-25 11:04:34'),
(455,'settings_key:description_category_image_ratio','The aspect ratio of the category thumbnails',0,1,0,'2018-09-25 11:04:34','2018-09-25 11:04:34'),
(456,'settings_key:title_category_image_clipping','Category Images: Clipping Method',0,1,0,'2018-09-25 11:04:34','2018-09-25 11:04:34'),
(457,'settings_key:description_category_image_clipping','The clipping method used for scaled category thumbnails.',0,1,0,'2018-09-25 11:04:34','2018-09-25 11:04:34'),
(458,'settings_key:title_product_image_ratio','Product Images: Aspect Ratio',0,1,0,'2018-09-25 11:04:34','2018-09-25 11:04:34'),
(459,'settings_key:description_product_image_ratio','The aspect ratio of the product thumbnails',0,1,0,'2018-09-25 11:04:34','2018-09-25 11:04:34'),
(460,'settings_key:title_product_image_clipping','Product Images: Clipping Method',0,1,0,'2018-09-25 11:04:34','2018-09-25 11:04:34'),
(461,'settings_key:description_product_image_clipping','The clipping method used for scaled product thumbnails.',0,1,0,'2018-09-25 11:04:34','2018-09-25 11:04:34'),
(462,'settings_key:title_product_image_trim','Product Images: Trim Whitespace',0,1,0,'2018-09-25 11:04:34','2018-09-25 11:04:34'),
(463,'settings_key:description_product_image_trim','Trim whitespace before generating thumbnail images.',0,1,0,'2018-09-25 11:04:34','2018-09-25 11:04:34'),
(464,'settings_key:title_image_downsample_size','Downsample',0,1,0,'2018-09-25 11:04:34','2018-09-25 11:04:34'),
(465,'settings_key:description_image_downsample_size','Downsample large uploaded images to best fit within the given dimensions of \"width,height\" or leave empty. Default: 2048,2048',0,1,0,'2018-09-25 11:04:34','2018-09-25 11:04:34'),
(466,'settings_key:title_product_image_watermark','Product Images: Watermark',0,1,0,'2018-09-25 11:04:34','2018-09-25 11:04:34'),
(467,'settings_key:description_product_image_watermark','Watermark product images with the store logo.',0,1,0,'2018-09-25 11:04:34','2018-09-25 11:04:34'),
(468,'settings_key:title_image_quality','Image Quality',0,1,0,'2018-09-25 11:04:34','2018-09-25 11:04:34'),
(469,'settings_key:description_image_quality','The JPEG quality for uploaded images (0-100). Default: 90',0,1,0,'2018-09-25 11:04:34','2018-09-25 11:04:34'),
(470,'settings_key:title_image_thumbnail_quality','Thumbnail Quality',0,1,0,'2018-09-25 11:04:34','2018-09-25 11:04:34'),
(471,'settings_key:description_image_thumbnail_quality','The JPEG quality for thumbnail images (0-100). Default: 65',0,1,0,'2018-09-25 11:04:34','2018-09-25 11:04:34'),
(472,'settings_key:title_image_thumbnail_interlaced','Interlaced Thumbnails',0,1,0,'2018-09-25 11:04:34','2018-09-25 11:04:34'),
(473,'settings_key:description_image_thumbnail_interlaced','Generate interlaced thumbnail images for progressive loading. Increases the filesize by 10-20% but improves user experience.',0,1,0,'2018-09-25 11:04:34','2018-09-25 11:04:34'),
(474,'settings_key:title_image_whitespace_color','Whitespace Color',0,1,0,'2018-09-25 11:04:34','2018-09-25 11:04:34'),
(475,'settings_key:description_image_whitespace_color','Set the color of any generated whitespace to the given RGB value. Default: 255,255,255',0,1,0,'2018-09-25 11:04:34','2018-09-25 11:04:34'),
(476,'title_yes','Yes',0,1,0,'2018-09-25 11:06:17','2018-09-25 11:06:17'),
(477,'title_no','No',0,1,0,'2018-09-25 11:06:17','2018-09-25 11:06:17'),
(478,'settings_key:title_cache_enabled','System Cache Enabled',0,1,0,'2018-09-25 11:06:29','2018-09-25 11:06:29'),
(479,'settings_key:description_cache_enabled','Enables the system cache module which caches frequently used data.',0,1,0,'2018-09-25 11:06:29','2018-09-25 11:06:29'),
(480,'settings_key:title_cache_clear','Clear System Cache',0,1,0,'2018-09-25 11:06:29','2018-09-25 11:06:29'),
(481,'settings_key:description_cache_clear','Remove all cached system information.',0,1,0,'2018-09-25 11:06:29','2018-09-25 11:06:29'),
(482,'title_true','True',0,1,0,'2018-09-25 11:06:29','2018-09-25 11:06:29'),
(483,'settings_key:title_seo_links_language_prefix','SEO Links Language Prefix',0,1,0,'2018-09-25 11:06:29','2018-09-25 11:06:29'),
(484,'settings_key:description_seo_links_language_prefix','Precede links with language code e.g. /en/....',0,1,0,'2018-09-25 11:06:29','2018-09-25 11:06:29'),
(485,'settings_key:title_regional_settings_screen_enabled','Regional Settings Screen',0,1,0,'2018-09-25 11:06:29','2018-09-25 11:06:29'),
(486,'settings_key:description_regional_settings_screen_enabled','Enables the regional settings screen upon first visit.',0,1,0,'2018-09-25 11:06:29','2018-09-25 11:06:29'),
(487,'settings_key:title_gzip_enabled','GZIP Enabled',0,1,0,'2018-09-25 11:06:29','2018-09-25 11:06:29'),
(488,'settings_key:description_gzip_enabled','Compresses browser data. Increases the load on the server but decreases the bandwidth.',0,1,0,'2018-09-25 11:06:29','2018-09-25 11:06:29'),
(489,'settings_key:title_jobs_last_run','Jobs Last Run',0,1,0,'2018-09-25 11:06:29','2018-09-25 11:06:29'),
(490,'settings_key:description_jobs_last_run','Time when background jobs where last executed.',0,1,0,'2018-09-25 11:06:29','2018-09-25 11:06:29'),
(491,'settings_key:title_jobs_interval','Jobs Interval',0,1,0,'2018-09-25 11:06:29','2018-09-25 11:06:29'),
(492,'settings_key:description_jobs_interval','The amount of minutes between each execution of jobs.',0,1,0,'2018-09-25 11:06:29','2018-09-25 11:06:29'),
(493,'settings_key:title_database_admin_link','Database Admin Link',0,1,0,'2018-09-25 11:06:29','2018-09-25 11:06:29'),
(494,'settings_key:description_database_admin_link','The URL to your database manager e.g. phpMyAdmin.',0,1,0,'2018-09-25 11:06:29','2018-09-25 11:06:29'),
(495,'settings_key:title_webmail_link','Webmail Link',0,1,0,'2018-09-25 11:06:29','2018-09-25 11:06:29'),
(496,'settings_key:description_webmail_link','The URL to your webmail client.',0,1,0,'2018-09-25 11:06:29','2018-09-25 11:06:29'),
(497,'settings_key:title_seo_links_enabled','SEO Links Enabled',0,1,0,'2018-09-25 11:06:29','2018-09-25 11:06:29'),
(498,'settings_key:description_seo_links_enabled','Enabling this requires .htaccess and mod_rewrite rules.',0,1,0,'2018-09-25 11:06:29','2018-09-25 11:06:29'),
(499,'title_all_products','All Products',0,1,0,'2018-09-26 10:43:09','2018-09-26 10:43:09'),
(500,'text_no_matching_results','No matching results',0,1,0,'2018-09-26 10:43:09','2018-09-26 10:43:09'),
(501,'title_online','Online only',0,1,0,'2018-09-26 13:12:46','2018-09-26 13:12:46'),
(502,'title_edit_order','Edit Order',0,1,0,'2018-09-28 18:53:02','2018-09-28 18:53:02'),
(503,'title_guest','Guest',0,1,0,'2018-09-28 18:53:02','2018-09-28 18:53:02'),
(504,'title_order_information','Order Information',0,1,0,'2018-09-28 18:53:02','2018-09-28 18:53:02'),
(505,'title_ip_address','IP Address',0,1,0,'2018-09-28 18:53:02','2018-09-28 18:53:02'),
(506,'title_currency_value','Currency Value',0,1,0,'2018-09-28 18:53:02','2018-09-28 18:53:02'),
(507,'title_customer_information','Customer Information',0,1,0,'2018-09-28 18:53:02','2018-09-28 18:53:02'),
(508,'title_billing_address','Billing Address',0,1,0,'2018-09-28 18:53:02','2018-09-28 18:53:02'),
(509,'title_get_address','Get Address',0,1,0,'2018-09-28 18:53:02','2018-09-28 18:53:02'),
(510,'title_copy_billing_address','Copy Billing Address',0,1,0,'2018-09-28 18:53:02','2018-09-28 18:53:02'),
(511,'title_payment_information','Payment Information',0,1,0,'2018-09-28 18:53:02','2018-09-28 18:53:02'),
(512,'title_option_id','Option ID',0,1,0,'2018-09-28 18:53:02','2018-09-28 18:53:02'),
(513,'title_transaction_id','Transaction ID',0,1,0,'2018-09-28 18:53:02','2018-09-28 18:53:02'),
(514,'title_shipping_information','Shipping Information',0,1,0,'2018-09-28 18:53:02','2018-09-28 18:53:02'),
(515,'title_tracking_id','Tracking ID',0,1,0,'2018-09-28 18:53:02','2018-09-28 18:53:02'),
(516,'title_hidden','Hidden',0,1,0,'2018-09-28 18:53:02','2018-09-28 18:53:02'),
(517,'title_add','Add',0,1,0,'2018-09-28 18:53:02','2018-09-28 18:53:02'),
(518,'title_add_comment','Add Comment',0,1,0,'2018-09-28 18:53:02','2018-09-28 18:53:02'),
(519,'title_order_items','Order Items',0,1,0,'2018-09-28 18:53:02','2018-09-28 18:53:02'),
(520,'title_unit_price','Unit Price',0,1,0,'2018-09-28 18:53:02','2018-09-28 18:53:02'),
(521,'title_add_product','Add Product',0,1,0,'2018-09-28 18:53:02','2018-09-28 18:53:02'),
(522,'title_add_custom_item','Add Custom Item',0,1,0,'2018-09-28 18:53:02','2018-09-28 18:53:02'),
(523,'title_order_total','Order Total',0,1,0,'2018-09-28 18:53:02','2018-09-28 18:53:02'),
(524,'title_module_id','Module ID',0,1,0,'2018-09-28 18:53:02','2018-09-28 18:53:02'),
(525,'title_calculate','Calculate',0,1,0,'2018-09-28 18:53:02','2018-09-28 18:53:02'),
(526,'text_insert_before','Insert before',0,1,0,'2018-09-28 18:53:02','2018-09-28 18:53:02'),
(527,'title_insert_','Insert',0,1,0,'2018-09-28 18:53:02','2018-09-28 18:53:02'),
(528,'title_send_order_copy_email','Send order copy email',0,1,0,'2018-09-28 18:53:02','2018-09-28 18:53:02'),
(529,'text_set_as_guest','Set As Guest',0,1,0,'2018-09-28 18:53:02','2018-09-28 18:53:02'),
(530,'title_notify','Notify',0,1,0,'2018-09-28 18:53:02','2018-09-28 18:53:02'),
(531,'text_no_results','No results',0,1,0,'2018-09-28 18:53:02','2018-09-28 18:53:02'),
(532,'title_author','Author',0,1,0,'2018-09-28 18:54:42','2018-09-28 18:54:42'),
(533,'title_upload_new_vqmod','Upload a New vQmod',0,1,0,'2018-09-28 18:54:42','2018-09-28 18:54:42'),
(534,'title_upload','Upload',0,1,0,'2018-09-28 18:54:42','2018-09-28 18:54:42'),
(535,'title_edit_module','Edit Module',0,1,0,'2018-09-28 18:55:41','2018-09-28 18:55:41'),
(536,'title_developed_by','Developed by',0,1,0,'2018-09-28 18:55:41','2018-09-28 18:55:41'),
(537,'title_edit_translations','Edit Translations',0,1,0,'2018-09-28 18:55:41','2018-09-28 18:55:41'),
(538,'title_uninstall','Uninstall',0,1,0,'2018-09-28 18:55:41','2018-09-28 18:55:41'),
(539,'title_all','All',0,1,0,'2018-09-28 18:56:42','2018-09-28 18:56:42'),
(540,'title_frontend','Frontend',0,1,0,'2018-09-28 18:56:42','2018-09-28 18:56:42'),
(541,'title_backend','Backend',0,1,0,'2018-09-28 18:56:42','2018-09-28 18:56:42'),
(542,'text_inlcude_modules','Include modules',0,1,0,'2018-09-28 18:56:42','2018-09-28 18:56:42'),
(543,'text_only_untranslated','Only untranslated',0,1,0,'2018-09-28 18:56:42','2018-09-28 18:56:42'),
(544,'title_filter','Filter',0,1,0,'2018-09-28 18:56:42','2018-09-28 18:56:42'),
(545,'text_html_enabled','HTML enabled',0,1,0,'2018-09-28 18:56:42','2018-09-28 18:56:42'),
(546,'title_translator_tool','Translator Tool',0,1,0,'2018-09-28 18:56:42','2018-09-28 18:56:42'),
(547,'title_from_language','From Language',0,1,0,'2018-09-28 18:56:42','2018-09-28 18:56:42'),
(548,'title_to_language','To Language',0,1,0,'2018-09-28 18:56:42','2018-09-28 18:56:42'),
(549,'text_copy_below_to_translation_service','Copy below to translation service',0,1,0,'2018-09-28 18:56:42','2018-09-28 18:56:42'),
(550,'text_paste_your_translated_result_below','Paste your translated result below',0,1,0,'2018-09-28 18:56:42','2018-09-28 18:56:42'),
(551,'title_prefill_fields','Prefill Fields',0,1,0,'2018-09-28 18:56:42','2018-09-28 18:56:42'),
(552,'title_scan_files_for_translations','Scan Files For Translations',0,1,0,'2018-09-28 18:56:50','2018-09-28 18:56:50'),
(553,'description_scan_for_translations','This will scan your files for translations. New translations will be added to the database.',0,1,0,'2018-09-28 18:56:50','2018-09-28 18:56:50'),
(554,'text_update_empty_translations','Update empty translations if applicable',0,1,0,'2018-09-28 18:56:50','2018-09-28 18:56:50'),
(555,'text_delete_translations_not_present','Delete translations no longer present in files',0,1,0,'2018-09-28 18:56:50','2018-09-28 18:56:50'),
(556,'title_scan','Scan',0,1,0,'2018-09-28 18:56:50','2018-09-28 18:56:50'),
(557,'warning_backup_translations','Warning: Always backup your translations before continuing.',0,1,0,'2018-09-28 18:56:50','2018-09-28 18:56:50'),
(558,'title_import_to_csv','Import From CSV',0,1,0,'2018-09-28 18:57:05','2018-09-28 18:57:05'),
(559,'title_add_new_slide','Add New Slide',0,1,0,'2018-09-28 18:58:13','2018-09-28 18:58:13'),
(560,'title_valid_from','Valid From',0,1,0,'2018-09-28 18:58:13','2018-09-28 18:58:13'),
(561,'title_valid_to','Valid To',0,1,0,'2018-09-28 18:58:13','2018-09-28 18:58:13'),
(562,'title_edit_slide','Edit Slide',0,1,0,'2018-09-28 18:58:17','2018-09-28 18:58:17'),
(563,'text_leave_blank_for_all','Leave blank for all',0,1,0,'2018-09-28 18:58:17','2018-09-28 18:58:17'),
(564,'title_caption','Caption',0,1,0,'2018-09-28 18:58:17','2018-09-28 18:58:17'),
(565,'title_link','Link',0,1,0,'2018-09-28 18:58:17','2018-09-28 18:58:17'),
(566,'error_must_enter_name','You must enter a name',0,1,0,'2018-09-28 19:11:00','2018-09-28 19:11:00'),
(567,'pm_zn_payment:title_status','Status',0,1,0,'2018-09-29 17:11:33','2018-09-29 17:11:33'),
(568,'pm_zn_payment:description_status','Enables or disables the module.',0,1,0,'2018-09-29 17:11:33','2018-09-29 17:11:33'),
(569,'pm_zn_payment:title_icon','Icon',0,1,0,'2018-09-29 17:11:33','2018-09-29 17:11:33'),
(570,'pm_zn_payment:description_icon','Web path of the icon to be displayed.',0,1,0,'2018-09-29 17:11:33','2018-09-29 17:11:33'),
(571,'pm_zn_payment:title_payment_fee','Payment Fee',0,1,0,'2018-09-29 17:11:33','2018-09-29 17:11:33'),
(572,'pm_zn_payment:description_payment_fee','Adds a payment fee to the order.',0,1,0,'2018-09-29 17:11:33','2018-09-29 17:11:33'),
(573,'pm_zn_payment:title_tax_class','Tax Class',0,1,0,'2018-09-29 17:11:33','2018-09-29 17:11:33'),
(574,'pm_zn_payment:description_tax_class','The tax class for the fee.',0,1,0,'2018-09-29 17:11:33','2018-09-29 17:11:33'),
(575,'title_install_module','Install Module',0,1,0,'2018-09-29 17:11:33','2018-09-29 17:11:33'),
(576,'pm_zn_payment:title_cash_on_delivery','Cash on Delivery',0,1,0,'2018-09-29 17:13:25','2018-09-29 17:13:25'),
(577,'pm_zn_payment:title_confirm_order','Confirm Order',0,1,0,'2018-09-29 17:13:25','2018-09-29 17:13:25'),
(578,'description_no_items_in_cart','There are no items in your cart.',0,1,0,'2018-09-29 21:09:40','2018-09-29 21:09:40'),
(579,'title_back','Back',0,1,0,'2018-09-29 21:09:40','2018-09-29 21:09:40'),
(580,'error_missing_email','You must enter your email address.',0,1,0,'2018-09-29 21:15:37','2018-09-29 21:15:37'),
(581,'error_invalid_email_address','Invalid email address',0,1,0,'2018-09-29 21:15:54','2018-09-29 21:15:54'),
(582,'error_invalid_postcode_format','Invalid postcode format.',0,1,0,'2018-09-29 21:16:09','2018-09-29 21:16:09'),
(583,'checkout_summary:terms_of_purchase','By proceeding you hereby confirm and accept the Terms and Conditions of Purchase.',0,1,0,'2018-09-29 21:17:06','2018-09-29 21:17:06'),
(584,'title_order','Order',0,1,0,'2018-09-29 21:20:14','2018-09-29 21:20:14'),
(585,'title_order_confirmation','Order Confirmation',0,0,0,'2018-09-29 21:20:14','2018-09-29 21:20:14'),
(586,'email_order_confirmation','Thank you for your purchase!\r\n\r\nYour order #%order_id has successfully been created with a total of %payment_due for the following ordered items:\r\n\r\n%order_items\r\n\r\nA printable order copy is available here:\r\n%order_copy_url\r\n\r\nRegards,\r\n%store_name\r\n%store_url\r\n',0,0,0,'2018-09-29 21:20:14','2018-09-29 21:20:14'),
(587,'title_order_success','Order Success',0,1,0,'2018-09-29 21:20:16','2018-09-29 21:20:16'),
(588,'title_order_completed','Your order #%order_id is successfully completed!',0,1,0,'2018-09-29 21:20:16','2018-09-29 21:20:16'),
(589,'description_order_completed','Thank you for your purchase. An order confirmation email has been sent. We will process your order shortly.',0,1,0,'2018-09-29 21:20:16','2018-09-29 21:20:16'),
(590,'description_click_printable_copy','Click here for a printable copy',0,1,0,'2018-09-29 21:20:16','2018-09-29 21:20:16'),
(591,'title_shipping_weight','Shipping Weight',0,1,0,'2018-09-29 21:37:20','2018-09-29 21:37:20'),
(592,'title_shipping_option','Shipping Option',0,1,0,'2018-09-29 21:37:20','2018-09-29 21:37:20'),
(593,'title_shipping_tracking_id','Shipping Tracking ID',0,1,0,'2018-09-29 21:37:20','2018-09-29 21:37:20'),
(594,'title_payment_option','Payment Option',0,1,0,'2018-09-29 21:37:20','2018-09-29 21:37:20'),
(595,'title_transaction_number','Transaction Number',0,1,0,'2018-09-29 21:37:20','2018-09-29 21:37:20'),
(596,'title_grand_total','Grand Total',0,1,0,'2018-09-29 21:37:20','2018-09-29 21:37:20'),
(597,'title_address','Address',0,1,0,'2018-09-29 21:37:20','2018-09-29 21:37:20'),
(598,'title_website','Website',0,1,0,'2018-09-29 21:37:20','2018-09-29 21:37:20'),
(599,'title_vat_registration_id','VAT Registration ID',0,1,0,'2018-09-29 21:37:20','2018-09-29 21:37:20'),
(600,'title_print','Print',0,1,0,'2018-09-29 21:37:20','2018-09-29 21:37:20'),
(601,'error_missing_address1','You must enter an address.',0,1,0,'2018-09-30 20:04:38','2018-09-30 20:04:38'),
(602,'error_missing_phone','You must enter your phone number.',0,1,0,'2018-09-30 20:05:05','2018-09-30 20:05:05'),
(603,'title_redirecting','Redirecting',0,0,0,'2018-09-30 22:02:59','2018-09-30 22:02:59'),
(604,'title_unprocessed','Unprocessed',0,1,0,'2018-10-01 15:02:16','2018-10-01 15:02:16'),
(605,'error_missing_lastname','You must enter a lastname.',0,1,0,'2018-10-07 16:04:08','2018-10-07 16:04:08'),
(606,'error_missing_city','You must enter a city.',0,1,0,'2018-10-07 16:04:25','2018-10-07 16:04:25'),
(607,'title_invoice_address','I want to set another address for my invoice.',0,1,0,'2018-10-08 12:25:02','2018-10-08 12:25:02'),
(608,'error_missing_postcode','You must enter a postcode.',0,1,0,'2018-10-11 10:48:05','2018-10-11 10:48:05'),
(609,'title_create_new_order_status','Create New Order Status',0,1,0,'2018-10-15 11:34:35','2018-10-15 11:34:35'),
(610,'title_sales','Sales',0,1,0,'2018-10-15 11:34:35','2018-10-15 11:34:35'),
(611,'title_archived','Archived',0,1,0,'2018-10-15 11:34:35','2018-10-15 11:34:35'),
(612,'settings_key:title_smtp_status','SMTP Enabled',0,1,0,'2018-10-15 14:06:49','2018-10-15 14:06:49'),
(613,'settings_key:description_smtp_status','Wheither or not to use an SMTP server for delivering email.',0,1,0,'2018-10-15 14:06:49','2018-10-15 14:06:49'),
(614,'settings_key:title_smtp_host','SMTP Host',0,1,0,'2018-10-15 14:06:49','2018-10-15 14:06:49'),
(615,'settings_key:description_smtp_host','SMTP hostname e.g. smtp.myprovider.com.',0,1,0,'2018-10-15 14:06:49','2018-10-15 14:06:49'),
(616,'settings_key:title_smtp_port','SMTP Port',0,1,0,'2018-10-15 14:06:49','2018-10-15 14:06:49'),
(617,'settings_key:description_smtp_port','SMTP port e.g. 25, 465 (SSL/TLS), or 587 (STARTTLS).',0,1,0,'2018-10-15 14:06:49','2018-10-15 14:06:49'),
(618,'settings_key:title_smtp_username','SMTP Username',0,1,0,'2018-10-15 14:06:49','2018-10-15 14:06:49'),
(619,'settings_key:description_smtp_username','Username for SMTP authentication.',0,1,0,'2018-10-15 14:06:49','2018-10-15 14:06:49'),
(620,'settings_key:title_smtp_password','SMTP Password',0,1,0,'2018-10-15 14:06:49','2018-10-15 14:06:49'),
(621,'settings_key:description_smtp_password','Password for SMTP authentication.',0,1,0,'2018-10-15 14:06:49','2018-10-15 14:06:49'),
(622,'settings_key:title_default_language_code','Default Language',0,1,0,'2018-10-15 14:50:53','2018-10-15 14:50:53'),
(623,'settings_key:description_default_language_code','The default language selected, if failed to identify.',0,1,0,'2018-10-15 14:50:53','2018-10-15 14:50:53'),
(624,'settings_key:title_default_currency_code','Default Currency',0,1,0,'2018-10-15 14:50:53','2018-10-15 14:50:53'),
(625,'settings_key:description_default_currency_code','The default currency selected, if failed to identify.',0,1,0,'2018-10-15 14:50:53','2018-10-15 14:50:53'),
(626,'settings_key:title_default_country_code','Default Country',0,1,0,'2018-10-15 14:50:53','2018-10-15 14:50:53'),
(627,'settings_key:description_default_country_code','The default country selected if not set otherwise.',0,1,0,'2018-10-15 14:50:53','2018-10-15 14:50:53'),
(628,'settings_key:title_default_zone_code','Default Zone',0,1,0,'2018-10-15 14:50:53','2018-10-15 14:50:53'),
(629,'settings_key:description_default_zone_code','The default zone selected if not set otherwise.',0,1,0,'2018-10-15 14:50:53','2018-10-15 14:50:53'),
(630,'settings_key:title_default_tax_class_id','Default Tax Class',0,1,0,'2018-10-15 14:50:53','2018-10-15 14:50:53'),
(631,'settings_key:description_default_tax_class_id','Default tax class that will be preset when creating new products.',0,1,0,'2018-10-15 14:50:53','2018-10-15 14:50:53'),
(632,'settings_key:title_default_display_prices_including_tax','Default Display Prices Including Tax',0,1,0,'2018-10-15 14:50:53','2018-10-15 14:50:53'),
(633,'settings_key:description_default_display_prices_including_tax','Displays prices including tax by default.',0,1,0,'2018-10-15 14:50:53','2018-10-15 14:50:53'),
(634,'settings_key:title_default_quantity_unit_id','Default Quantity Unit',0,1,0,'2018-10-15 14:50:53','2018-10-15 14:50:53'),
(635,'settings_key:description_default_quantity_unit_id','Default quantity unit that will be preset when creating new products.',0,1,0,'2018-10-15 14:50:53','2018-10-15 14:50:53'),
(636,'settings_key:title_default_sold_out_status_id','Default Sold Out Status',0,1,0,'2018-10-15 14:50:53','2018-10-15 14:50:53'),
(637,'settings_key:description_default_sold_out_status_id','Default sold out status that will be preset when creating new products.',0,1,0,'2018-10-15 14:50:53','2018-10-15 14:50:53'),
(638,'settings_key:title_default_delivery_status_id','Default Delivery Status',0,1,0,'2018-10-15 14:50:53','2018-10-15 14:50:53'),
(639,'settings_key:description_default_delivery_status_id','Default delivery status that will be preset when creating new products.',0,1,0,'2018-10-15 14:50:53','2018-10-15 14:50:53'),
(640,'settings_key:title_catalog_only_mode','Catalog Only Mode',0,1,0,'2018-10-15 14:51:06','2018-10-15 14:51:06'),
(641,'settings_key:description_catalog_only_mode','Disables the cart and checkout features leaving only a browsable catalog.',0,1,0,'2018-10-15 14:51:06','2018-10-15 14:51:06'),
(642,'settings_key:title_maintenance_mode','Maintenance Mode',0,1,0,'2018-10-15 14:51:06','2018-10-15 14:51:06'),
(643,'settings_key:description_maintenance_mode','Setting the store in maintenance mode will prevent users from browsing your site.',0,1,0,'2018-10-15 14:51:06','2018-10-15 14:51:06'),
(644,'settings_key:title_items_per_page','Items Per Page',0,1,0,'2018-10-15 14:51:06','2018-10-15 14:51:06'),
(645,'settings_key:description_items_per_page','The number of items to be displayed per page.',0,1,0,'2018-10-15 14:51:06','2018-10-15 14:51:06'),
(646,'settings_key:title_data_table_rows_per_page','Data Table Rows',0,1,0,'2018-10-15 14:51:06','2018-10-15 14:51:06'),
(647,'settings_key:description_data_table_rows_per_page','The number of data table rows per page.',0,1,0,'2018-10-15 14:51:06','2018-10-15 14:51:06'),
(648,'settings_key:title_display_stock_count','Display Stock Count',0,1,0,'2018-10-15 14:51:06','2018-10-15 14:51:06'),
(649,'settings_key:description_display_stock_count','Show the available amounts of products in stock.',0,1,0,'2018-10-15 14:51:06','2018-10-15 14:51:06'),
(650,'settings_key:title_display_cheapest_shipping','Cheapest Shipping',0,1,0,'2018-10-15 14:51:06','2018-10-15 14:51:06'),
(651,'settings_key:description_display_cheapest_shipping','Display the cheapest shipping cost on product page.',0,1,0,'2018-10-15 14:51:06','2018-10-15 14:51:06'),
(652,'settings_key:title_new_products_max_age','Max Age for New Products',0,1,0,'2018-10-15 14:51:06','2018-10-15 14:51:06'),
(653,'settings_key:description_new_products_max_age','Display the new sticker for products younger than the give age. E.g. 1 month or 14 days',0,1,0,'2018-10-15 14:51:06','2018-10-15 14:51:06'),
(654,'settings_key:title_box_similar_products_num_items','Similar Products Box: Number of Items',0,1,0,'2018-10-15 14:51:06','2018-10-15 14:51:06'),
(655,'settings_key:description_box_similar_products_num_items','The maximum amount of items to be display in the box.',0,1,0,'2018-10-15 14:51:06','2018-10-15 14:51:06'),
(656,'settings_key:title_box_recently_viewed_products_num_items','Recently Viewed Products Box: Number of Items',0,1,0,'2018-10-15 14:51:06','2018-10-15 14:51:06'),
(657,'settings_key:description_box_recently_viewed_products_num_items','The maximum amount of items to be display in the box.',0,1,0,'2018-10-15 14:51:06','2018-10-15 14:51:06'),
(658,'settings_key:title_box_latest_products_num_items','Latest Products Box: Number of Items',0,1,0,'2018-10-15 14:51:06','2018-10-15 14:51:06'),
(659,'settings_key:description_box_latest_products_num_items','The maximum amount of items to be display in the box.',0,1,0,'2018-10-15 14:51:06','2018-10-15 14:51:06'),
(660,'settings_key:title_box_popular_products_num_items','Popular Products Box: Number of Items',0,1,0,'2018-10-15 14:51:06','2018-10-15 14:51:06'),
(661,'settings_key:description_box_popular_products_num_items','The maximum amount of items to be display in the box.',0,1,0,'2018-10-15 14:51:06','2018-10-15 14:51:06'),
(662,'settings_key:title_box_campaign_products_num_items','Campaign Products Box: Number of Items',0,1,0,'2018-10-15 14:51:06','2018-10-15 14:51:06'),
(663,'settings_key:description_box_campaign_products_num_items','The maximum amount of items to be display in the box.',0,1,0,'2018-10-15 14:51:06','2018-10-15 14:51:06'),
(664,'settings_key:title_auto_decimals','Auto Decimals',0,1,0,'2018-10-15 14:51:06','2018-10-15 14:51:06'),
(665,'settings_key:description_auto_decimals','Show only decimals if there are any to display.',0,1,0,'2018-10-15 14:51:06','2018-10-15 14:51:06'),
(666,'settings_key:title_box_also_purchased_products_num_items','Also Purchased Products Box: Number of Items',0,1,0,'2018-10-15 14:51:06','2018-10-15 14:51:06'),
(667,'settings_key:description_box_also_purchased_products_num_items','The maximum amount of items to be display in the box.',0,1,0,'2018-10-15 14:51:06','2018-10-15 14:51:06'),
(668,'title_sold_out','Sold Out',0,1,0,'2018-10-17 17:31:52','2018-10-17 17:31:52'),
(669,'title_previous','Previous',0,1,0,'2018-10-18 14:45:23','2018-10-18 14:45:23'),
(670,'title_next','Next',0,1,0,'2018-10-18 14:45:23','2018-10-18 14:45:23'),
(671,'regional_settings:head_title','Regional Settings',0,1,0,'2018-10-19 14:56:30','2018-10-19 14:56:30'),
(672,'title_display_prices','Display Prices',0,1,0,'2018-10-19 14:56:30','2018-10-19 14:56:30'),
(673,'title_excl_tax','Excl. Tax',0,1,0,'2018-10-19 14:56:30','2018-10-19 14:56:30'),
(674,'title_incl_tax','Incl. Tax',0,1,0,'2018-10-19 14:56:30','2018-10-19 14:56:30'),
(675,'success_deleted_d_products','Deleted %d products',0,1,0,'2018-10-22 10:33:54','2018-10-22 10:33:54'),
(676,'title_create_new_status','Create New Status',0,1,0,'2018-10-23 19:15:15','2018-10-23 19:15:15'),
(677,'title_orderable','Orderable',0,1,0,'2018-10-23 19:15:16','2018-10-23 19:15:16');

/*Table structure for table `lc_users` */

DROP TABLE IF EXISTS `lc_users`;

CREATE TABLE `lc_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(128) NOT NULL,
  `permissions` varchar(4096) NOT NULL,
  `last_ip` varchar(15) NOT NULL,
  `last_host` varchar(64) NOT NULL,
  `login_attempts` int(11) NOT NULL,
  `total_logins` int(11) NOT NULL,
  `date_blocked` datetime NOT NULL,
  `date_expires` datetime NOT NULL,
  `date_active` datetime NOT NULL,
  `date_login` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `lc_users` */

insert  into `lc_users`(`id`,`status`,`username`,`password`,`permissions`,`last_ip`,`last_host`,`login_attempts`,`total_logins`,`date_blocked`,`date_expires`,`date_active`,`date_login`,`date_updated`,`date_created`) values 
(1,1,'admin','b75615cd0b8522f23eb843d96417abb71408c2168440537386d8ec8aee53a255','','::1','localhost.localdomain',0,25,'2018-08-14 11:41:00','0000-00-00 00:00:00','2018-11-23 12:11:15','2018-10-23 14:13:11','2018-09-13 09:01:11','2018-09-13 09:01:11');

/*Table structure for table `lc_zones` */

DROP TABLE IF EXISTS `lc_zones`;

CREATE TABLE `lc_zones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_code` varchar(4) NOT NULL,
  `code` varchar(8) NOT NULL,
  `name` varchar(64) NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `country_code` (`country_code`),
  KEY `code` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

/*Data for the table `lc_zones` */

insert  into `lc_zones`(`id`,`country_code`,`code`,`name`,`date_updated`,`date_created`) values 
(1,'AU','ACT','Australian Capital Territory','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(2,'AU','NSW','New South Wales','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(3,'AU','NT','Northern Territory','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(4,'AU','QLD','Queensland','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(5,'AU','SA','South Australia','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(6,'AU','TAS','Tasmania','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(7,'AU','VIC','Victoria','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(8,'AU','WA','Western Australia','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(9,'CA','AB','Alberta','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(10,'CA','BC','British Columbia','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(11,'CA','MB','Manitoba','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(12,'CA','NB','New Brunswick','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(13,'CA','NL','Newfoundland and Labrador','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(14,'CA','NT','Northwest Territories','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(15,'CA','NS','Nova Scotia','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(16,'CA','NU','Nunavut','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(17,'CA','ON','Ontario','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(18,'CA','PE','Prince Edward Island','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(19,'CA','QC','Qu¨¦bec','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(20,'CA','SK','Saskatchewan','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(21,'CA','YT','Yukon Territory','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(22,'US','AL','Alabama','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(23,'US','AK','Alaska','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(24,'US','AZ','Arizona','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(25,'US','AR','Arkansas','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(26,'US','CA','California','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(27,'US','CO','Colorado','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(28,'US','CT','Connecticut','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(29,'US','DE','Delaware','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(30,'US','FL','Florida','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(31,'US','GA','Georgia','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(32,'US','HI','Hawaii','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(33,'US','ID','Idaho','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(34,'US','IL','Illinois','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(35,'US','IN','Indiana','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(36,'US','IA','Iowa','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(37,'US','KS','Kansas','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(38,'US','KY','Kentucky','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(39,'US','LA','Louisiana','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(40,'US','ME','Maine','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(41,'US','MD','Maryland','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(42,'US','MA','Massachusetts','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(43,'US','MI','Michigan','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(44,'US','MN','Minnesota','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(45,'US','MS','Mississippi','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(46,'US','MO','Missouri','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(47,'US','MT','Montana','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(48,'US','NE','Nebraska','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(49,'US','NV','Nevada','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(50,'US','NH','New Hampshire','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(51,'US','NJ','New Jersey','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(52,'US','NM','New Mexico','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(53,'US','NY','New York','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(54,'US','NC','North Carolina','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(55,'US','ND','North Dakota','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(56,'US','OH','Ohio','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(57,'US','OK','Oklahoma','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(58,'US','OR','Oregon','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(59,'US','PA','Pennsylvania','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(60,'US','RI','Rhode Island','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(61,'US','SC','South Carolina','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(62,'US','SD','South Dakota','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(63,'US','TN','Tennessee','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(64,'US','TX','Texas','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(65,'US','UT','Utah','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(66,'US','VT','Vermont','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(67,'US','VA','Virginia','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(68,'US','WA','Washington','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(69,'US','WV','West Virginia','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(70,'US','WI','Wisconsin','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(71,'US','WY','Wyoming','0000-00-00 00:00:00','0000-00-00 00:00:00');

/*Table structure for table `lc_zones_to_geo_zones` */

DROP TABLE IF EXISTS `lc_zones_to_geo_zones`;

CREATE TABLE `lc_zones_to_geo_zones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_id` int(11) NOT NULL,
  `country_code` varchar(2) NOT NULL,
  `zone_code` varchar(8) NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `geo_zone_id` (`geo_zone_id`),
  KEY `country_code` (`country_code`),
  KEY `zone_code` (`zone_code`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `lc_zones_to_geo_zones` */

insert  into `lc_zones_to_geo_zones`(`id`,`geo_zone_id`,`country_code`,`zone_code`,`date_updated`,`date_created`) values 
(1,1,'AT','','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(2,1,'BE','','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(3,1,'BG','','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(4,1,'CY','','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(5,1,'CZ','','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(6,1,'DE','','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(7,1,'DK','','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(8,1,'EE','','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(9,1,'ES','','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(10,1,'FR','','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(11,1,'FI','','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(12,1,'GB','','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(13,1,'GR','','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(14,1,'HR','','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(15,1,'HU','','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(16,1,'IE','','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(17,1,'IT','','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(18,1,'LT','','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(19,1,'LU','','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(20,1,'LV','','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(21,1,'MT','','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(22,1,'NL','','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(23,1,'PL','','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(24,1,'PT','','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(25,1,'RO','','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(26,1,'SE','','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(27,1,'SI','','2018-09-13 09:01:11','2018-09-13 09:01:11'),
(28,1,'SK','','2018-09-13 09:01:11','2018-09-13 09:01:11');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

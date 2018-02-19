-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2016-05-16 10:19
-- 服务器版本: 5.5.40
-- PHP 版本: 5.6.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `cn2101free`
--

-- --------------------------------------------------------

--
-- 表的结构 `oc_address`
--

DROP TABLE IF EXISTS `oc_address`;
CREATE TABLE `oc_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(40) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_affiliate`
--

DROP TABLE IF EXISTS `oc_affiliate`;
CREATE TABLE `oc_affiliate` (
  `affiliate_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `company` varchar(40) NOT NULL,
  `website` varchar(255) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_affiliate_activity`
--

DROP TABLE IF EXISTS `oc_affiliate_activity`;
CREATE TABLE `oc_affiliate_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_affiliate_login`
--

DROP TABLE IF EXISTS `oc_affiliate_login`;
CREATE TABLE `oc_affiliate_login` (
  `affiliate_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`affiliate_login_id`),
  KEY `email` (`email`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_affiliate_transaction`
--

DROP TABLE IF EXISTS `oc_affiliate_transaction`;
CREATE TABLE `oc_affiliate_transaction` (
  `affiliate_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_api`
--

DROP TABLE IF EXISTS `oc_api`;
CREATE TABLE `oc_api` (
  `api_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `key` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`api_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `oc_api`
--

-- --------------------------------------------------------

--
-- 表的结构 `oc_api_ip`
--

DROP TABLE IF EXISTS `oc_api_ip`;
CREATE TABLE `oc_api_ip` (
  `api_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `api_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  PRIMARY KEY (`api_ip_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `oc_api_ip`
--

INSERT INTO `oc_api_ip` (`api_ip_id`, `api_id`, `ip`) VALUES
(1, 1, '182.150.145.25'),
(2, 1, '182.150.145.17'),
(3, 1, '::1'),
(4, 1, '182.150.144.228'),
(5, 1, '182.150.145.166'),
(6, 1, '182.150.148.64'),
(7, 1, '182.150.145.128');

-- --------------------------------------------------------

--
-- 表的结构 `oc_api_session`
--

DROP TABLE IF EXISTS `oc_api_session`;
CREATE TABLE `oc_api_session` (
  `api_session_id` int(11) NOT NULL AUTO_INCREMENT,
  `api_id` int(11) NOT NULL,
  `token` varchar(32) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `session_name` varchar(32) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`api_session_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=65 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_attribute`
--

DROP TABLE IF EXISTS `oc_attribute`;
CREATE TABLE `oc_attribute` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `oc_attribute`
--

INSERT INTO `oc_attribute` (`attribute_id`, `attribute_group_id`, `sort_order`) VALUES
(1, 6, 1),
(2, 6, 5),
(3, 6, 3),
(4, 3, 1),
(5, 3, 2),
(6, 3, 3),
(7, 3, 4),
(8, 3, 5),
(9, 3, 6),
(10, 3, 7),
(11, 3, 8);

-- --------------------------------------------------------

--
-- 表的结构 `oc_attribute_description`
--

DROP TABLE IF EXISTS `oc_attribute_description`;
CREATE TABLE `oc_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_attribute_description`
--

INSERT INTO `oc_attribute_description` (`attribute_id`, `language_id`, `name`) VALUES
(1, 2, 'Description'),
(2, 2, 'No. of Cores'),
(4, 2, 'test 1'),
(5, 2, 'test 2'),
(6, 2, 'test 3'),
(7, 2, 'test 4'),
(8, 2, 'test 5'),
(9, 2, 'test 6'),
(10, 2, 'test 7'),
(11, 2, 'test 8'),
(3, 2, 'Clockspeed');

-- --------------------------------------------------------

--
-- 表的结构 `oc_attribute_group`
--

DROP TABLE IF EXISTS `oc_attribute_group`;
CREATE TABLE `oc_attribute_group` (
  `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `oc_attribute_group`
--

INSERT INTO `oc_attribute_group` (`attribute_group_id`, `sort_order`) VALUES
(3, 2),
(4, 1),
(5, 3),
(6, 4);

-- --------------------------------------------------------

--
-- 表的结构 `oc_attribute_group_description`
--

DROP TABLE IF EXISTS `oc_attribute_group_description`;
CREATE TABLE `oc_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_attribute_group_description`
--

INSERT INTO `oc_attribute_group_description` (`attribute_group_id`, `language_id`, `name`) VALUES
(3, 2, 'Memory'),
(4, 2, 'Technical'),
(5, 2, 'Motherboard'),
(6, 2, 'Processor');

-- --------------------------------------------------------

--
-- 表的结构 `oc_banner`
--

DROP TABLE IF EXISTS `oc_banner`;
CREATE TABLE `oc_banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `oc_banner`
--

INSERT INTO `oc_banner` (`banner_id`, `name`, `status`) VALUES
(6, 'HP Products', 0),
(7, 'Home Page Slideshow', 1),
(8, 'Manufacturers', 1),
(11, 'hengfu-xia', 1),
(10, '首页中部横幅2', 1);

-- --------------------------------------------------------

--
-- 表的结构 `oc_banner_image`
--

DROP TABLE IF EXISTS `oc_banner_image`;
CREATE TABLE `oc_banner_image` (
  `banner_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`banner_image_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=299 ;

--
-- 转存表中的数据 `oc_banner_image`
--

INSERT INTO `oc_banner_image` (`banner_image_id`, `banner_id`, `link`, `image`, `sort_order`) VALUES
(296, 7, 'index.php?route=product/product&amp;product_id=76', 'catalog/gd/banner/glasses-banner2.jpg', 1),
(241, 8, '', 'catalog/demo/manufacturer/dell.png', 0),
(231, 8, '', 'catalog/demo/manufacturer/canon.png', 0),
(232, 8, '', 'catalog/demo/manufacturer/harley.png', 0),
(233, 8, '', 'catalog/demo/manufacturer/burgerking.png', 0),
(294, 11, 'index.php?route=product/product&amp;product_id=61', 'catalog/gd/banner/hengfu1.jpg', 0),
(234, 8, '', 'catalog/demo/manufacturer/sony.png', 0),
(235, 8, '', 'catalog/demo/manufacturer/redbull.png', 0),
(236, 8, '', 'catalog/demo/manufacturer/cocacola.png', 0),
(240, 8, '', 'catalog/demo/manufacturer/starbucks.png', 0),
(237, 8, '', 'catalog/demo/manufacturer/disney.png', 0),
(238, 8, '', 'catalog/demo/manufacturer/nfl.png', 0),
(239, 8, '', 'catalog/demo/manufacturer/nintendo.png', 0),
(120, 6, 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'catalog/demo/manufacturer/nintendo.png', 0),
(298, 10, 'index.php?route=product/product&amp;product_id=76', 'catalog/gd/banner/hengfu2.jpg', 0),
(297, 7, 'index.php?route=product/product&amp;product_id=76', 'catalog/gd/banner/glasses-banner1.jpg', 2);

-- --------------------------------------------------------

--
-- 表的结构 `oc_banner_image_description`
--

DROP TABLE IF EXISTS `oc_banner_image_description`;
CREATE TABLE `oc_banner_image_description` (
  `banner_image_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  PRIMARY KEY (`banner_image_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_banner_image_description`
--

INSERT INTO `oc_banner_image_description` (`banner_image_id`, `language_id`, `banner_id`, `title`) VALUES
(120, 2, 6, 'HP Banner'),
(241, 2, 8, 'Dell'),
(240, 2, 8, 'Starbucks'),
(239, 2, 8, 'Nintendo'),
(238, 2, 8, 'NFL'),
(237, 2, 8, 'Disney'),
(236, 2, 8, 'Coca Cola'),
(235, 2, 8, 'RedBull'),
(234, 2, 8, 'Sony'),
(298, 2, 10, '233'),
(294, 2, 11, 'hengfu-xia'),
(233, 2, 8, 'Burger King'),
(232, 2, 8, 'Harley Davidson'),
(231, 2, 8, 'Canon'),
(297, 2, 7, 'glasses-banner1'),
(296, 2, 7, 'glasses-banner2');

-- --------------------------------------------------------

--
-- 表的结构 `oc_cart`
--

DROP TABLE IF EXISTS `oc_cart`;
CREATE TABLE `oc_cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `option` text NOT NULL,
  `quantity` int(5) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `cart_id` (`customer_id`,`session_id`,`product_id`,`recurring_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=78 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_category`
--

DROP TABLE IF EXISTS `oc_category`;
CREATE TABLE `oc_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`category_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=84 ;

--
-- 转存表中的数据 `oc_category`
--

INSERT INTO `oc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(25, '', 0, 1, 1, 3, 1, '2009-01-31 01:04:25', '2016-04-21 12:06:57'),
(20, '', 0, 1, 1, 2, 1, '2009-01-05 21:49:43', '2016-04-21 12:06:00'),
(24, '', 0, 1, 1, 5, 1, '2009-01-20 02:36:26', '2016-04-21 12:07:49'),
(18, '', 0, 1, 0, 1, 1, '2009-01-05 21:49:15', '2016-04-21 12:05:48'),
(63, 'catalog/gd/product/parzin-v.jpg', 20, 0, 1, 0, 1, '2016-04-09 17:45:23', '2016-05-12 16:28:37'),
(64, 'catalog/gd/product/shes.jpg', 20, 0, 1, 0, 1, '2016-04-09 17:46:32', '2016-05-12 16:25:02'),
(26, 'catalog/gd/product/minjon.jpg', 20, 0, 0, 1, 1, '2009-01-31 01:55:14', '2016-05-12 16:30:13'),
(29, 'catalog/gd/product/am.jpg', 25, 0, 0, 1, 1, '2009-02-02 13:11:37', '2016-05-12 16:38:49'),
(30, 'catalog/gd/product/pueerizi.jpg', 25, 0, 0, 1, 1, '2009-02-02 13:11:59', '2016-05-12 16:35:40'),
(31, 'catalog/gd/product/hat.jpg', 25, 0, 0, 1, 1, '2009-02-03 14:17:24', '2016-05-12 16:34:45'),
(32, 'catalog/gd/product/bolon-2.jpg', 25, 0, 0, 1, 1, '2009-02-03 14:17:34', '2016-05-12 16:40:15'),
(33, '', 0, 1, 1, 6, 1, '2009-02-03 14:17:55', '2016-04-21 12:08:02'),
(62, '', 0, 1, 1, 9, 1, '2016-02-06 16:19:03', '2016-02-12 13:40:02'),
(57, '', 0, 0, 1, 4, 1, '2011-04-26 08:53:16', '2016-04-21 12:07:11'),
(65, 'catalog/gd/product/bolon-v.jpg', 20, 0, 1, 0, 1, '2016-04-09 17:46:53', '2016-05-12 16:27:36'),
(71, 'catalog/gd/product/helen.jpg', 18, 0, 1, 0, 1, '2016-04-09 17:52:35', '2016-05-12 16:19:39'),
(72, 'catalog/gd/product/parzin.jpg', 18, 0, 1, 0, 1, '2016-04-09 17:52:57', '2016-05-12 16:18:03'),
(73, 'catalog/gd/product/bolon.jpg', 18, 0, 1, 0, 1, '2016-04-09 17:54:04', '2016-05-12 16:20:56'),
(74, 'catalog/gd/product/parin.jpg', 18, 0, 1, 0, 1, '2016-04-09 17:54:23', '2016-05-12 16:22:14'),
(75, 'catalog/gd/product/brsts.jpg', 18, 0, 1, 0, 1, '2016-04-09 17:54:42', '2016-05-12 16:23:31'),
(81, 'catalog/gd/product/bolon-n.jpg', 25, 0, 1, 0, 1, '2016-04-09 17:59:42', '2016-05-12 16:32:49'),
(83, 'catalog/gd/product/awesa.jpg', 20, 0, 1, 0, 1, '2016-05-12 16:31:28', '2016-05-12 16:31:28');

-- --------------------------------------------------------

--
-- 表的结构 `oc_category_description`
--

DROP TABLE IF EXISTS `oc_category_description`;
CREATE TABLE `oc_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_category_description`
--

INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(33, 2, '轻松购', '&lt;p&gt;&lt;span style=&quot;font-family: Arial, ''Microsoft YaHei'', sans-serif; line-height: 18px;&quot;&gt;OpenCart是国外著名的开源电子商务系统，由英国人Daniel一人独立开发，其社区非常活跃，由各国网友翻译出来的语言包已经达到18种，其中包括中文，俄文，法文，西班牙文，德文，日文等等。&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', '手表名家', '', ''),
(32, 2, '暴龙', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '暴龙', '', ''),
(31, 2, 'AHT', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'AHT', '', ''),
(30, 2, 'pueerizi', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'pueerizi', '', ''),
(29, 2, '阿木', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '阿木', '', ''),
(26, 2, '名匠', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '名匠', '', ''),
(20, 2, '女士眼镜', '&lt;p&gt;&lt;span style=&quot;font-family: Arial, ''Microsoft YaHei'', sans-serif; line-height: 18px;&quot;&gt;OpenCart是国外著名的开源电子商务系统，由英国人Daniel一人独立开发，其社区非常活跃，由各国网友翻译出来的语言包已经达到18种，其中包括中文，俄文，法文，西班牙文，德文，日文等等。&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', '女士手表', '女士手表', '女士手表'),
(18, 2, '男士眼镜', '&lt;p&gt;&lt;span style=&quot;font-family: Arial, ''Microsoft YaHei'', sans-serif; line-height: 18px;&quot;&gt;OpenCart是国外著名的开源电子商务系统，由英国人Daniel一人独立开发，其社区非常活跃，由各国网友翻译出来的语言包已经达到18种，其中包括中文，俄文，法文，西班牙文，德文，日文等等。&lt;/span&gt;&lt;br&gt;&lt;/p&gt;\r\n', '男士眼镜', '', ''),
(64, 2, 'shes茜子', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'shes茜子', '', ''),
(65, 2, '暴龙', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '暴龙', '', ''),
(62, 2, '专业版购买', '&lt;h4&gt;&lt;span style=&quot;font-weight: bold; background-color: rgb(255, 0, 0); color: rgb(255, 255, 255);&quot;&gt;您看到的是opencart2.1中文专业版，如果需要，请购买使用版权，购买地址：&lt;/span&gt;&lt;/h4&gt;&lt;h4 style=&quot;line-height: 1.8;&quot;&gt;&lt;a href=&quot;http://www.opencart.cn/app/plans/opencart2-ecommerce-website-pro-wechat-solution.html&quot; target=&quot;_blank&quot; style=&quot;font-weight: bold; color: rgb(0, 0, 0); background-color: rgb(107, 173, 222);&quot;&gt;http://www.opencart.cn/app/plans/opencart2-ecommerce-website-pro-wechat-solution.html&lt;/a&gt;&lt;/h4&gt;', '专业版购买', '您看到的是opencart中文专业版，如果需要，请购买使用版权，购买地址：', '您看到的是opencart中文专业版，如果需要，请购买使用版权，购买地址：'),
(57, 2, '近视太阳镜', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '近视太阳镜', '', ''),
(24, 2, '海外购', '&lt;p&gt;&lt;span style=&quot;font-family: Arial, ''Microsoft YaHei'', sans-serif; line-height: 18px;&quot;&gt;OpenCart是国外著名的开源电子商务系统，由英国人Daniel一人独立开发，其社区非常活跃，由各国网友翻译出来的语言包已经达到18种，其中包括中文，俄文，法文，西班牙文，德文，日文等等。&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', '海外购', '', ''),
(25, 2, '驾驶镜', '&lt;p&gt;&lt;span style=&quot;font-family: Arial, ''Microsoft YaHei'', sans-serif; line-height: 18px;&quot;&gt;OpenCart是国外著名的开源电子商务系统，由英国人Daniel一人独立开发，其社区非常活跃，由各国网友翻译出来的语言包已经达到18种，其中包括中文，俄文，法文，西班牙文，德文，日文等等。&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', '驾驶镜', '', ''),
(63, 2, '帕森新', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '帕森新', '', ''),
(72, 2, '帕森', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '帕森', '', ''),
(73, 2, '暴龙', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '暴龙', '', ''),
(74, 2, '派丽蒙', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '派丽蒙', '', ''),
(75, 2, '邦士度', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '邦士度', '', ''),
(81, 2, '暴龙', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '暴龙', '', ''),
(71, 2, '海伦凯勒', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '海伦凯勒', '', ''),
(83, 2, '艾唯莎', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '艾唯莎', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `oc_category_filter`
--

DROP TABLE IF EXISTS `oc_category_filter`;
CREATE TABLE `oc_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_category_path`
--

DROP TABLE IF EXISTS `oc_category_path`;
CREATE TABLE `oc_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`path_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_category_path`
--

INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES
(25, 25, 0),
(29, 25, 0),
(29, 29, 1),
(30, 25, 0),
(30, 30, 1),
(31, 25, 0),
(31, 31, 1),
(32, 25, 0),
(32, 32, 1),
(20, 20, 0),
(26, 20, 0),
(26, 26, 1),
(24, 24, 0),
(18, 18, 0),
(63, 63, 1),
(33, 33, 0),
(62, 62, 0),
(57, 57, 0),
(65, 65, 1),
(65, 20, 0),
(64, 64, 1),
(64, 20, 0),
(63, 20, 0),
(71, 18, 0),
(71, 71, 1),
(72, 18, 0),
(72, 72, 1),
(73, 18, 0),
(73, 73, 1),
(74, 18, 0),
(74, 74, 1),
(75, 18, 0),
(75, 75, 1),
(81, 25, 0),
(81, 81, 1),
(83, 20, 0),
(83, 83, 1);

-- --------------------------------------------------------

--
-- 表的结构 `oc_category_to_layout`
--

DROP TABLE IF EXISTS `oc_category_to_layout`;
CREATE TABLE `oc_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_category_to_layout`
--

INSERT INTO `oc_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES
(33, 0, 0),
(64, 0, 0),
(65, 0, 0),
(20, 0, 0),
(26, 0, 0),
(18, 0, 0),
(57, 0, 0),
(25, 0, 0),
(63, 0, 0),
(30, 0, 0),
(31, 0, 0),
(32, 0, 0),
(29, 0, 0),
(24, 0, 0),
(62, 0, 0),
(71, 0, 0),
(72, 0, 0),
(73, 0, 0),
(74, 0, 0),
(75, 0, 0),
(81, 0, 0),
(83, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `oc_category_to_store`
--

DROP TABLE IF EXISTS `oc_category_to_store`;
CREATE TABLE `oc_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_category_to_store`
--

INSERT INTO `oc_category_to_store` (`category_id`, `store_id`) VALUES
(18, 0),
(20, 0),
(24, 0),
(25, 0),
(26, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0),
(57, 0),
(62, 0),
(63, 0),
(64, 0),
(65, 0),
(71, 0),
(72, 0),
(73, 0),
(74, 0),
(75, 0),
(81, 0),
(83, 0);

-- --------------------------------------------------------

--
-- 表的结构 `oc_city`
--

DROP TABLE IF EXISTS `oc_city`;
CREATE TABLE `oc_city` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`city_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2818 ;

--
-- 转存表中的数据 `oc_city`
--

INSERT INTO `oc_city` (`city_id`, `zone_id`, `name`, `status`, `sort_order`) VALUES
(1, 360, '河东', 1, 0),
(2, 360, '河西', 1, 0),
(3, 360, '南开', 1, 0),
(4, 360, '河北', 1, 0),
(5, 360, '红桥', 1, 0),
(6, 360, '塘沽', 1, 0),
(7, 360, '汉沽', 1, 0),
(8, 360, '大港', 1, 0),
(9, 360, '东丽', 1, 0),
(10, 360, '西青', 1, 0),
(11, 360, '津南', 1, 0),
(12, 360, '北辰', 1, 0),
(13, 360, '武清', 1, 0),
(14, 360, '宝坻', 1, 0),
(15, 361, '蓟县', 1, 0),
(16, 361, '宁河', 1, 0),
(17, 361, '静海', 1, 0),
(18, 19, '长安', 1, 0),
(19, 19, '桥东', 1, 0),
(20, 19, '桥西', 1, 0),
(21, 19, '新华', 1, 0),
(22, 19, '裕华', 1, 0),
(23, 19, '井陉矿', 1, 0),
(24, 19, '辛集', 1, 0),
(25, 19, '藁城', 1, 0),
(26, 19, '晋州', 1, 0),
(27, 19, '新乐', 1, 0),
(28, 19, '鹿泉', 1, 0),
(29, 19, '井陉', 1, 0),
(30, 19, '正定', 1, 0),
(31, 19, '栾城', 1, 0),
(32, 19, '行唐', 1, 0),
(33, 19, '灵寿', 1, 0),
(34, 19, '高邑', 1, 0),
(35, 19, '深泽', 1, 0),
(36, 19, '赞皇', 1, 0),
(37, 19, '无极', 1, 0),
(38, 19, '平山', 1, 0),
(39, 19, '元氏', 1, 0),
(40, 19, '赵县', 1, 0),
(41, 20, '路北', 1, 0),
(42, 20, '路南', 1, 0),
(43, 20, '古冶', 1, 0),
(44, 20, '开平', 1, 0),
(45, 20, '丰润', 1, 0),
(46, 20, '丰南', 1, 0),
(47, 20, '遵化', 1, 0),
(48, 20, '迁安', 1, 0),
(49, 20, '滦县', 1, 0),
(50, 20, '滦南', 1, 0),
(51, 20, '乐亭', 1, 0),
(52, 20, '迁西', 1, 0),
(53, 20, '玉田', 1, 0),
(54, 20, '唐海', 1, 0),
(55, 21, '海港', 1, 0),
(56, 21, '山海关', 1, 0),
(57, 21, '北戴河', 1, 0),
(58, 21, '昌黎', 1, 0),
(59, 21, '抚宁', 1, 0),
(60, 21, '卢龙', 1, 0),
(61, 21, '青龙', 1, 0),
(62, 22, '丛台', 1, 0),
(63, 22, '邯山', 1, 0),
(64, 22, '复兴', 1, 0),
(65, 22, '峰峰', 1, 0),
(66, 22, '武安', 1, 0),
(67, 22, '邯郸', 1, 0),
(68, 22, '临漳', 1, 0),
(69, 22, '成安', 1, 0),
(70, 22, '大名', 1, 0),
(71, 22, '涉县', 1, 0),
(72, 22, '磁县', 1, 0),
(73, 22, '肥乡', 1, 0),
(74, 22, '永年', 1, 0),
(75, 22, '邱县', 1, 0),
(76, 22, '鸡泽', 1, 0),
(77, 22, '广平', 1, 0),
(78, 22, '馆陶', 1, 0),
(79, 22, '魏县', 1, 0),
(80, 22, '曲周', 1, 0),
(81, 23, '桥东', 1, 0),
(82, 23, '桥西', 1, 0),
(83, 23, '南宫', 1, 0),
(84, 23, '沙河', 1, 0),
(85, 23, '邢台', 1, 0),
(86, 23, '临城', 1, 0),
(87, 23, '内丘', 1, 0),
(88, 23, '柏乡', 1, 0),
(89, 23, '隆尧', 1, 0),
(90, 23, '任县', 1, 0),
(91, 23, '南和', 1, 0),
(92, 23, '宁晋', 1, 0),
(93, 23, '巨鹿', 1, 0),
(94, 23, '新河', 1, 0),
(95, 23, '广宗', 1, 0),
(96, 23, '平乡', 1, 0),
(97, 23, '威县', 1, 0),
(98, 23, '清河', 1, 0),
(99, 23, '临西', 1, 0),
(100, 24, '新市', 1, 0),
(101, 24, '北市', 1, 0),
(102, 24, '南市', 1, 0),
(103, 24, '定州', 1, 0),
(104, 24, '涿州', 1, 0),
(105, 24, '安国', 1, 0),
(106, 24, '高碑店', 1, 0),
(107, 24, '满城', 1, 0),
(108, 24, '清苑', 1, 0),
(109, 24, '易县', 1, 0),
(110, 24, '徐水', 1, 0),
(111, 24, '涞源', 1, 0),
(112, 24, '定兴', 1, 0),
(113, 24, '顺平', 1, 0),
(114, 24, '唐县', 1, 0),
(115, 24, '望都', 1, 0),
(116, 24, '涞水', 1, 0),
(117, 24, '高阳', 1, 0),
(118, 24, '安新', 1, 0),
(119, 24, '雄县', 1, 0),
(120, 24, '容城', 1, 0),
(121, 24, '曲阳', 1, 0),
(122, 24, '阜平', 1, 0),
(123, 24, '博野', 1, 0),
(124, 24, '蠡县', 1, 0),
(125, 25, '桥西', 1, 0),
(126, 25, '桥东', 1, 0),
(127, 25, '宣化', 1, 0),
(128, 25, '下花园', 1, 0),
(129, 25, '宣化', 1, 0),
(130, 25, '张北', 1, 0),
(131, 25, '康保', 1, 0),
(132, 25, '沽源', 1, 0),
(133, 25, '尚义', 1, 0),
(134, 25, '蔚县', 1, 0),
(135, 25, '阳原', 1, 0),
(136, 25, '怀安', 1, 0),
(137, 25, '万全', 1, 0),
(138, 25, '怀来', 1, 0),
(139, 25, '涿鹿', 1, 0),
(140, 25, '赤城', 1, 0),
(141, 25, '崇礼', 1, 0),
(142, 26, '双桥', 1, 0),
(143, 26, '双滦', 1, 0),
(144, 26, '鹰手营子矿区', 1, 0),
(145, 26, '承德', 1, 0),
(146, 26, '兴隆', 1, 0),
(147, 26, '平泉', 1, 0),
(148, 26, '滦平', 1, 0),
(149, 26, '隆化', 1, 0),
(150, 26, '丰宁', 1, 0),
(151, 26, '宽城', 1, 0),
(152, 26, '围场', 1, 0),
(153, 27, '运河', 1, 0),
(154, 27, '新华', 1, 0),
(155, 27, '泊头', 1, 0),
(156, 27, '任丘', 1, 0),
(157, 27, '黄骅', 1, 0),
(158, 27, '河间', 1, 0),
(159, 27, '沧县', 1, 0),
(160, 27, '青县', 1, 0),
(161, 27, '东光', 1, 0),
(162, 27, '海兴', 1, 0),
(163, 27, '盐山', 1, 0),
(164, 27, '肃宁', 1, 0),
(165, 27, '南皮', 1, 0),
(166, 27, '吴桥', 1, 0),
(167, 27, '献县', 1, 0),
(168, 27, '孟村', 1, 0),
(169, 28, '安次', 1, 0),
(170, 28, '广阳', 1, 0),
(171, 28, '霸州', 1, 0),
(172, 28, '三河', 1, 0),
(173, 28, '固安', 1, 0),
(174, 28, '永清', 1, 0),
(175, 28, '香河', 1, 0),
(176, 28, '大城', 1, 0),
(177, 28, '文安', 1, 0),
(178, 28, '大厂', 1, 0),
(179, 29, '桃城', 1, 0),
(180, 29, '冀州', 1, 0),
(181, 29, '深州', 1, 0),
(182, 29, '枣强', 1, 0),
(183, 29, '武邑', 1, 0),
(184, 29, '武强', 1, 0),
(185, 29, '饶阳', 1, 0),
(186, 29, '安平', 1, 0),
(187, 29, '故城', 1, 0),
(188, 29, '景县', 1, 0),
(189, 29, '阜城', 1, 0),
(190, 30, '小店', 1, 0),
(191, 30, '迎泽', 1, 0),
(192, 30, '尖草坪', 1, 0),
(193, 30, '万柏林', 1, 0),
(194, 30, '晋源', 1, 0),
(195, 30, '古交', 1, 0),
(196, 30, '清徐', 1, 0),
(197, 30, '阳曲', 1, 0),
(198, 30, '娄烦', 1, 0),
(199, 31, '矿区', 1, 0),
(200, 31, '南郊', 1, 0),
(201, 31, '新荣', 1, 0),
(202, 31, '阳高', 1, 0),
(203, 31, '天镇', 1, 0),
(204, 31, '广灵', 1, 0),
(205, 31, '灵丘', 1, 0),
(206, 31, '浑源', 1, 0),
(207, 31, '左云', 1, 0),
(208, 31, '大同', 1, 0),
(209, 32, '矿区', 1, 0),
(210, 32, '郊区', 1, 0),
(211, 32, '平定', 1, 0),
(212, 32, '盂县', 1, 0),
(213, 33, '郊区', 1, 0),
(214, 33, '潞城', 1, 0),
(215, 33, '长治', 1, 0),
(216, 33, '襄垣', 1, 0),
(217, 33, '屯留', 1, 0),
(218, 33, '平顺', 1, 0),
(219, 33, '黎城', 1, 0),
(220, 33, '壶关', 1, 0),
(221, 33, '长子', 1, 0),
(222, 33, '武乡', 1, 0),
(223, 33, '沁县', 1, 0),
(224, 33, '沁源', 1, 0),
(225, 34, '高平', 1, 0),
(226, 34, '泽州', 1, 0),
(227, 34, '沁水', 1, 0),
(228, 34, '阳城', 1, 0),
(229, 34, '陵川', 1, 0),
(230, 35, '平鲁', 1, 0),
(231, 35, '山阴', 1, 0),
(232, 35, '应县', 1, 0),
(233, 35, '右玉', 1, 0),
(234, 35, '怀仁', 1, 0),
(235, 36, '介休', 1, 0),
(236, 36, '榆社', 1, 0),
(237, 36, '左权', 1, 0),
(238, 36, '和顺', 1, 0),
(239, 36, '昔阳', 1, 0),
(240, 36, '寿阳', 1, 0),
(241, 36, '太谷', 1, 0),
(242, 36, '祁县', 1, 0),
(243, 36, '平遥', 1, 0),
(244, 36, '灵石', 1, 0),
(245, 37, '永济', 1, 0),
(246, 37, '河津', 1, 0),
(247, 37, '芮城', 1, 0),
(248, 37, '临猗', 1, 0),
(249, 37, '万荣', 1, 0),
(250, 37, '新绛', 1, 0),
(251, 37, '稷山', 1, 0),
(252, 37, '闻喜', 1, 0),
(253, 37, '夏县', 1, 0),
(254, 37, '绛县', 1, 0),
(255, 37, '平陆', 1, 0),
(256, 37, '垣曲', 1, 0),
(257, 38, '原平', 1, 0),
(258, 38, '定襄', 1, 0),
(259, 38, '五台', 1, 0),
(260, 38, '代县', 1, 0),
(261, 38, '繁峙', 1, 0),
(262, 38, '宁武', 1, 0),
(263, 38, '静乐', 1, 0),
(264, 38, '神池', 1, 0),
(265, 38, '五寨', 1, 0),
(266, 38, '岢岚', 1, 0),
(267, 38, '河曲', 1, 0),
(268, 38, '保德', 1, 0),
(269, 38, '偏关', 1, 0),
(270, 39, '侯马', 1, 0),
(271, 39, '霍州', 1, 0),
(272, 39, '曲沃', 1, 0),
(273, 39, '翼城', 1, 0),
(274, 39, '襄汾', 1, 0),
(275, 39, '洪洞', 1, 0),
(276, 39, '古县', 1, 0),
(277, 39, '安泽', 1, 0),
(278, 39, '浮山', 1, 0),
(279, 39, '吉县', 1, 0),
(280, 39, '乡宁', 1, 0),
(281, 39, '蒲县', 1, 0),
(282, 39, '大宁', 1, 0),
(283, 39, '永和', 1, 0),
(284, 39, '隰县', 1, 0),
(285, 39, '汾西', 1, 0),
(286, 40, '孝义', 1, 0),
(287, 40, '汾阳', 1, 0),
(288, 40, '文水', 1, 0),
(289, 40, '中阳', 1, 0),
(290, 40, '兴县', 1, 0),
(291, 40, '临县', 1, 0),
(292, 40, '方山', 1, 0),
(293, 40, '柳林', 1, 0),
(294, 40, '岚县', 1, 0),
(295, 40, '交口', 1, 0),
(296, 40, '交城', 1, 0),
(297, 40, '石楼', 1, 0),
(298, 41, '回民', 1, 0),
(299, 41, '新城', 1, 0),
(300, 41, '玉泉', 1, 0),
(301, 41, '赛罕', 1, 0),
(302, 41, '托克托', 1, 0),
(303, 41, '武川', 1, 0),
(304, 41, '和林格尔', 1, 0),
(305, 41, '清水河', 1, 0),
(306, 41, '土默特左旗', 1, 0),
(307, 42, '昆都仑', 1, 0),
(308, 42, '东河', 1, 0),
(309, 42, '青山', 1, 0),
(310, 42, '石拐', 1, 0),
(311, 42, '白云矿', 1, 0),
(312, 42, '九原', 1, 0),
(313, 42, '固阳', 1, 0),
(314, 42, '土默特右旗', 1, 0),
(315, 42, '达尔罕茂明安联合旗', 1, 0),
(316, 43, '海勃湾', 1, 0),
(317, 43, '乌达', 1, 0),
(318, 43, '海南', 1, 0),
(319, 44, '红山', 1, 0),
(320, 44, '元宝山', 1, 0),
(321, 44, '松山', 1, 0),
(322, 44, '宁城', 1, 0),
(323, 44, '林西', 1, 0),
(324, 44, '阿鲁科尔沁旗', 1, 0),
(325, 44, '巴林左旗', 1, 0),
(326, 44, '巴林右旗', 1, 0),
(327, 44, '克什克腾旗', 1, 0),
(328, 44, '翁牛特旗', 1, 0),
(329, 44, '喀喇沁旗', 1, 0),
(330, 44, '敖汉旗', 1, 0),
(331, 45, '科尔沁', 1, 0),
(332, 45, '霍林郭勒', 1, 0),
(333, 45, '开鲁', 1, 0),
(334, 45, '库伦旗', 1, 0),
(335, 45, '奈曼旗', 1, 0),
(336, 45, '扎鲁特旗', 1, 0),
(337, 45, '科尔沁左翼中旗', 1, 0),
(338, 45, '科尔沁左翼后旗', 1, 0),
(339, 46, '东胜', 1, 0),
(340, 46, '达拉特旗', 1, 0),
(341, 46, '准格尔旗', 1, 0),
(342, 46, '鄂托克前旗', 1, 0),
(343, 46, '鄂托克旗', 1, 0),
(344, 46, '杭锦旗', 1, 0),
(345, 46, '乌审旗', 1, 0),
(346, 46, '伊金霍洛旗', 1, 0),
(347, 47, '海拉尔', 1, 0),
(348, 47, '满洲里', 1, 0),
(349, 47, '扎兰屯', 1, 0),
(350, 47, '牙克石', 1, 0),
(351, 47, '根河', 1, 0),
(352, 47, '额尔古纳', 1, 0),
(353, 47, '阿荣旗', 1, 0),
(354, 47, '新巴尔虎右旗', 1, 0),
(355, 47, '新巴尔虎左旗', 1, 0),
(356, 47, '陈巴尔虎旗', 1, 0),
(357, 47, '鄂伦春自治旗', 1, 0),
(358, 47, '鄂温克族自治旗', 1, 0),
(359, 47, '莫力达瓦达斡尔族自治旗', 1, 0),
(360, 48, '集宁', 1, 0),
(361, 48, '丰镇', 1, 0),
(362, 48, '卓资', 1, 0),
(363, 48, '化德', 1, 0),
(364, 48, '商都', 1, 0),
(365, 48, '兴和', 1, 0),
(366, 48, '凉城', 1, 0),
(367, 48, '察哈尔右翼前旗', 1, 0),
(368, 48, '察哈尔右翼中旗', 1, 0),
(369, 48, '察哈尔右翼后旗', 1, 0),
(370, 48, '四子王旗', 1, 0),
(371, 49, '锡林浩特', 1, 0),
(372, 49, '二连浩特', 1, 0),
(373, 49, '多伦', 1, 0),
(374, 49, '阿巴嘎旗', 1, 0),
(375, 49, '苏尼特左旗', 1, 0),
(376, 49, '苏尼特右旗', 1, 0),
(377, 49, '东乌珠穆沁旗', 1, 0),
(378, 49, '西乌珠穆沁旗', 1, 0),
(379, 49, '太仆寺旗', 1, 0),
(380, 49, '镶黄旗', 1, 0),
(381, 49, '正镶白旗', 1, 0),
(382, 49, '正蓝旗', 1, 0),
(383, 50, '临河', 1, 0),
(384, 50, '五原', 1, 0),
(385, 50, '磴口', 1, 0),
(386, 50, '乌拉特前旗', 1, 0),
(387, 50, '乌拉特中旗', 1, 0),
(388, 50, '乌拉特后旗', 1, 0),
(389, 50, '杭锦后旗', 1, 0),
(390, 51, '阿拉善左旗', 1, 0),
(391, 51, '阿拉善右旗', 1, 0),
(392, 51, '额济纳旗', 1, 0),
(393, 52, '乌兰浩特', 1, 0),
(394, 52, '阿尔山', 1, 0),
(395, 52, '突泉', 1, 0),
(396, 52, '科尔沁右翼前旗', 1, 0),
(397, 52, '科尔沁右翼中旗', 1, 0),
(398, 52, '扎赉特旗', 1, 0),
(399, 53, '和平', 1, 0),
(400, 53, '大东', 1, 0),
(401, 53, '皇姑', 1, 0),
(402, 53, '铁西', 1, 0),
(403, 53, '苏家屯', 1, 0),
(404, 53, '东陵', 1, 0),
(405, 53, '新城子', 1, 0),
(406, 53, '于洪', 1, 0),
(407, 53, '新民', 1, 0),
(408, 53, '辽中', 1, 0),
(409, 53, '康平', 1, 0),
(410, 53, '法库', 1, 0),
(411, 54, '西岗', 1, 0),
(412, 54, '中山', 1, 0),
(413, 54, '沙河口', 1, 0),
(414, 54, '甘井子', 1, 0),
(415, 54, '旅顺口', 1, 0),
(416, 54, '金州', 1, 0),
(417, 54, '瓦房店', 1, 0),
(418, 54, '普兰店', 1, 0),
(419, 54, '庄河', 1, 0),
(420, 54, '长海', 1, 0),
(421, 55, '铁东', 1, 0),
(422, 55, '铁西', 1, 0),
(423, 55, '立山', 1, 0),
(424, 55, '千山', 1, 0),
(425, 55, '海城', 1, 0),
(426, 55, '台安', 1, 0),
(427, 55, '岫岩', 1, 0),
(428, 56, '新抚', 1, 0),
(429, 56, '东洲', 1, 0),
(430, 56, '望花', 1, 0),
(431, 56, '顺城', 1, 0),
(432, 56, '抚顺', 1, 0),
(433, 56, '新宾', 1, 0),
(434, 56, '清原', 1, 0),
(435, 57, '平山', 1, 0),
(436, 57, '溪湖', 1, 0),
(437, 57, '明山', 1, 0),
(438, 57, '南芬', 1, 0),
(439, 57, '本溪', 1, 0),
(440, 57, '桓仁', 1, 0),
(441, 58, '振兴', 1, 0),
(442, 58, '元宝', 1, 0),
(443, 58, '振安', 1, 0),
(444, 58, '凤城', 1, 0),
(445, 58, '东港', 1, 0),
(446, 58, '宽甸', 1, 0),
(447, 59, '太和', 1, 0),
(448, 59, '古塔', 1, 0),
(449, 59, '凌河', 1, 0),
(450, 59, '凌海', 1, 0),
(451, 59, '北宁', 1, 0),
(452, 59, '黑山', 1, 0),
(453, 59, '义县', 1, 0),
(454, 60, '龙港', 1, 0),
(455, 60, '连山', 1, 0),
(456, 60, '南票', 1, 0),
(457, 60, '兴城', 1, 0),
(458, 60, '绥中', 1, 0),
(459, 60, '建昌', 1, 0),
(460, 61, '站前', 1, 0),
(461, 61, '西市', 1, 0),
(462, 61, '鲅鱼圈', 1, 0),
(463, 61, '老边', 1, 0),
(464, 61, '大石桥', 1, 0),
(465, 61, '盖州', 1, 0),
(466, 62, '双台子', 1, 0),
(467, 62, '兴隆台', 1, 0),
(468, 62, '大洼', 1, 0),
(469, 62, '盘山', 1, 0),
(470, 63, '海州', 1, 0),
(471, 63, '新邱', 1, 0),
(472, 63, '太平', 1, 0),
(473, 63, '清河门', 1, 0),
(474, 63, '细河', 1, 0),
(475, 63, '彰武', 1, 0),
(476, 63, '阜新', 1, 0),
(477, 64, '白塔', 1, 0),
(478, 64, '文圣', 1, 0),
(479, 64, '宏伟', 1, 0),
(480, 64, '弓长岭', 1, 0),
(481, 64, '太子河', 1, 0),
(482, 64, '灯塔', 1, 0),
(483, 64, '辽阳', 1, 0),
(484, 65, '银州', 1, 0),
(485, 65, '清河', 1, 0),
(486, 65, '调兵山', 1, 0),
(487, 65, '开原', 1, 0),
(488, 65, '铁岭', 1, 0),
(489, 65, '西丰', 1, 0),
(490, 65, '昌图', 1, 0),
(491, 66, '双塔', 1, 0),
(492, 66, '龙城', 1, 0),
(493, 66, '北票', 1, 0),
(494, 66, '凌源', 1, 0),
(495, 66, '朝阳', 1, 0),
(496, 66, '建平', 1, 0),
(497, 66, '喀喇沁左翼', 1, 0),
(498, 67, '朝阳', 1, 0),
(499, 67, '南关', 1, 0),
(500, 67, '宽城', 1, 0),
(501, 67, '二道', 1, 0),
(502, 67, '绿园', 1, 0),
(503, 67, '双阳', 1, 0),
(504, 67, '德惠', 1, 0),
(505, 67, '九台', 1, 0),
(506, 67, '榆树', 1, 0),
(507, 67, '农安', 1, 0),
(508, 68, '船营', 1, 0),
(509, 68, '龙潭', 1, 0),
(510, 68, '昌邑', 1, 0),
(511, 68, '丰满', 1, 0),
(512, 68, '磐石', 1, 0),
(513, 68, '蛟河', 1, 0),
(514, 68, '桦甸', 1, 0),
(515, 68, '舒兰', 1, 0),
(516, 68, '永吉', 1, 0),
(517, 69, '铁西', 1, 0),
(518, 69, '铁东', 1, 0),
(519, 69, '双辽', 1, 0),
(520, 69, '公主岭', 1, 0),
(521, 69, '梨树', 1, 0),
(522, 69, '伊通', 1, 0),
(523, 70, '龙山', 1, 0),
(524, 70, '西安', 1, 0),
(525, 70, '东丰', 1, 0),
(526, 70, '东辽', 1, 0),
(527, 71, '东昌', 1, 0),
(528, 71, '二道江', 1, 0),
(529, 71, '梅河口', 1, 0),
(530, 71, '集安', 1, 0),
(531, 71, '通化', 1, 0),
(532, 71, '辉南', 1, 0),
(533, 71, '柳河', 1, 0),
(534, 72, '八道江', 1, 0),
(535, 72, '临江', 1, 0),
(536, 72, '江源', 1, 0),
(537, 72, '抚松', 1, 0),
(538, 72, '靖宇', 1, 0),
(539, 72, '长白', 1, 0),
(540, 73, '宁江', 1, 0),
(541, 73, '扶余', 1, 0),
(542, 73, '长岭', 1, 0),
(543, 73, '乾安', 1, 0),
(544, 73, '前郭尔罗斯', 1, 0),
(545, 74, '洮北', 1, 0),
(546, 74, '大安', 1, 0),
(547, 74, '洮南', 1, 0),
(548, 74, '镇赉', 1, 0),
(549, 74, '通榆', 1, 0),
(550, 75, '延吉', 1, 0),
(551, 75, '图们', 1, 0),
(552, 75, '敦化', 1, 0),
(553, 75, '珲春', 1, 0),
(554, 75, '龙井', 1, 0),
(555, 75, '和龙', 1, 0),
(556, 75, '汪清', 1, 0),
(557, 75, '安图', 1, 0),
(558, 76, '南岗', 1, 0),
(559, 76, '道外', 1, 0),
(560, 76, '太平', 1, 0),
(561, 76, '香坊', 1, 0),
(562, 76, '动力', 1, 0),
(563, 76, '平房', 1, 0),
(564, 76, '双城', 1, 0),
(565, 76, '尚志', 1, 0),
(566, 76, '五常', 1, 0),
(567, 76, '阿城', 1, 0),
(568, 76, '呼兰', 1, 0),
(569, 76, '依兰', 1, 0),
(570, 76, '方正', 1, 0),
(571, 76, '宾县', 1, 0),
(572, 76, '巴彦', 1, 0),
(573, 76, '木兰', 1, 0),
(574, 76, '通河', 1, 0),
(575, 76, '延寿', 1, 0),
(576, 77, '龙沙', 1, 0),
(577, 77, '建华', 1, 0),
(578, 77, '铁峰', 1, 0),
(579, 77, '昂昂溪', 1, 0),
(580, 77, '富拉尔基', 1, 0),
(581, 77, '碾子山', 1, 0),
(582, 77, '梅里斯达斡尔', 1, 0),
(583, 77, '讷河', 1, 0),
(584, 77, '龙江', 1, 0),
(585, 77, '依安', 1, 0),
(586, 77, '泰来', 1, 0),
(587, 77, '甘南', 1, 0),
(588, 77, '富裕', 1, 0),
(589, 77, '克山', 1, 0),
(590, 77, '克东', 1, 0),
(591, 77, '拜泉', 1, 0),
(592, 78, '兴山', 1, 0),
(593, 78, '向阳', 1, 0),
(594, 78, '工农', 1, 0),
(595, 78, '南山', 1, 0),
(596, 78, '兴安', 1, 0),
(597, 78, '东山', 1, 0),
(598, 78, '萝北', 1, 0),
(599, 78, '绥滨', 1, 0),
(600, 79, '尖山', 1, 0),
(601, 79, '岭东', 1, 0),
(602, 79, '四方台', 1, 0),
(603, 79, '宝山', 1, 0),
(604, 79, '集贤', 1, 0),
(605, 79, '友谊', 1, 0),
(606, 79, '宝清', 1, 0),
(607, 79, '饶河', 1, 0),
(608, 80, '鸡冠', 1, 0),
(609, 80, '恒山', 1, 0),
(610, 80, '滴道', 1, 0),
(611, 80, '梨树', 1, 0),
(612, 80, '城子河', 1, 0),
(613, 80, '麻山', 1, 0),
(614, 80, '虎林', 1, 0),
(615, 80, '密山', 1, 0),
(616, 80, '鸡东', 1, 0),
(617, 81, '萨尔图', 1, 0),
(618, 81, '龙凤', 1, 0),
(619, 81, '让胡路', 1, 0),
(620, 81, '大同', 1, 0),
(621, 81, '红岗', 1, 0),
(622, 81, '肇州', 1, 0),
(623, 81, '肇源', 1, 0),
(624, 81, '林甸', 1, 0),
(625, 81, '杜尔伯特', 1, 0),
(626, 82, '伊春', 1, 0),
(627, 82, '南岔', 1, 0),
(628, 82, '友好', 1, 0),
(629, 82, '西林', 1, 0),
(630, 82, '翠峦', 1, 0),
(631, 82, '新青', 1, 0),
(632, 82, '美溪', 1, 0),
(633, 82, '金山屯', 1, 0),
(634, 82, '五营', 1, 0),
(635, 82, '乌马河', 1, 0),
(636, 82, '汤旺河', 1, 0),
(637, 82, '带岭', 1, 0),
(638, 82, '乌伊岭', 1, 0),
(639, 82, '红星', 1, 0),
(640, 82, '上甘岭', 1, 0),
(641, 82, '铁力', 1, 0),
(642, 82, '嘉荫', 1, 0),
(643, 83, '爱民', 1, 0),
(644, 83, '东安', 1, 0),
(645, 83, '阳明', 1, 0),
(646, 83, '西安', 1, 0),
(647, 83, '穆棱', 1, 0),
(648, 83, '绥芬河', 1, 0),
(649, 83, '海林', 1, 0),
(650, 83, '宁安', 1, 0),
(651, 83, '东宁', 1, 0),
(652, 83, '林口', 1, 0),
(653, 84, '前进', 1, 0),
(654, 84, '永红', 1, 0),
(655, 84, '向阳', 1, 0),
(656, 84, '东风', 1, 0),
(657, 84, '郊区', 1, 0),
(658, 84, '同江', 1, 0),
(659, 84, '富锦', 1, 0),
(660, 84, '桦南', 1, 0),
(661, 84, '桦川', 1, 0),
(662, 84, '汤原', 1, 0),
(663, 84, '抚远', 1, 0),
(664, 85, '桃山', 1, 0),
(665, 85, '新兴', 1, 0),
(666, 85, '茄子河', 1, 0),
(667, 85, '勃利', 1, 0),
(668, 86, '爱辉', 1, 0),
(669, 86, '北安', 1, 0),
(670, 86, '五大连池', 1, 0),
(671, 86, '嫩江', 1, 0),
(672, 86, '逊克', 1, 0),
(673, 86, '孙吴', 1, 0),
(674, 87, '北林', 1, 0),
(675, 87, '安达', 1, 0),
(676, 87, '肇东', 1, 0),
(677, 87, '海伦', 1, 0),
(678, 87, '望奎', 1, 0),
(679, 87, '兰西', 1, 0),
(680, 87, '青冈', 1, 0),
(681, 87, '庆安', 1, 0),
(682, 87, '明水', 1, 0),
(683, 87, '绥棱', 1, 0),
(684, 88, '呼玛', 1, 0),
(685, 88, '塔河', 1, 0),
(686, 88, '漠河', 1, 0),
(687, 89, '玄武', 1, 0),
(688, 89, '白下', 1, 0),
(689, 89, '秦淮', 1, 0),
(690, 89, '建邺', 1, 0),
(691, 89, '鼓楼', 1, 0),
(692, 89, '下关', 1, 0),
(693, 89, '浦口', 1, 0),
(694, 89, '六合', 1, 0),
(695, 89, '栖霞', 1, 0),
(696, 89, '雨花台', 1, 0),
(697, 89, '江宁', 1, 0),
(698, 89, '溧水', 1, 0),
(699, 89, '高淳', 1, 0),
(700, 90, '云龙', 1, 0),
(701, 90, '鼓楼', 1, 0),
(702, 90, '九里', 1, 0),
(703, 90, '贾汪', 1, 0),
(704, 90, '泉山', 1, 0),
(705, 90, '邳州', 1, 0),
(706, 90, '新沂', 1, 0),
(707, 90, '铜山', 1, 0),
(708, 90, '睢宁', 1, 0),
(709, 90, '沛县', 1, 0),
(710, 90, '丰县', 1, 0),
(711, 91, '新浦', 1, 0),
(712, 91, '连云', 1, 0),
(713, 91, '海州', 1, 0),
(714, 91, '赣榆', 1, 0),
(715, 91, '灌云', 1, 0),
(716, 91, '东海', 1, 0),
(717, 91, '灌南', 1, 0),
(718, 92, '清河', 1, 0),
(719, 92, '清浦', 1, 0),
(720, 92, '楚州', 1, 0),
(721, 92, '淮阴', 1, 0),
(722, 92, '金湖', 1, 0),
(723, 92, '盱眙', 1, 0),
(724, 92, '洪泽', 1, 0),
(725, 92, '涟水', 1, 0),
(726, 93, '宿城', 1, 0),
(727, 93, '宿豫', 1, 0),
(728, 93, '沭阳', 1, 0),
(729, 93, '泗阳', 1, 0),
(730, 93, '泗洪', 1, 0),
(731, 94, '城区', 1, 0),
(732, 94, '东台', 1, 0),
(733, 94, '大丰', 1, 0),
(734, 94, '盐都', 1, 0),
(735, 94, '射阳', 1, 0),
(736, 94, '阜宁', 1, 0),
(737, 94, '滨海', 1, 0),
(738, 94, '响水', 1, 0),
(739, 94, '建湖', 1, 0),
(740, 95, '广陵', 1, 0),
(741, 95, '维扬', 1, 0),
(742, 95, '邗江', 1, 0),
(743, 95, '仪征', 1, 0),
(744, 95, '江都', 1, 0),
(745, 95, '高邮', 1, 0),
(746, 95, '宝应', 1, 0),
(747, 96, '海陵', 1, 0),
(748, 96, '高港', 1, 0),
(749, 96, '靖江', 1, 0),
(750, 96, '泰兴', 1, 0),
(751, 96, '姜堰', 1, 0),
(752, 96, '兴化', 1, 0),
(753, 97, '崇川', 1, 0),
(754, 97, '港闸', 1, 0),
(755, 97, '海门', 1, 0),
(756, 97, '启东', 1, 0),
(757, 97, '通州', 1, 0),
(758, 97, '如皋', 1, 0),
(759, 97, '如东', 1, 0),
(760, 97, '海安', 1, 0),
(761, 98, '京口', 1, 0),
(762, 98, '润州', 1, 0),
(763, 98, '丹徒', 1, 0),
(764, 98, '丹阳', 1, 0),
(765, 98, '句容', 1, 0),
(766, 99, '钟楼', 1, 0),
(767, 99, '天宁', 1, 0),
(768, 99, '戚墅堰', 1, 0),
(769, 99, '新北', 1, 0),
(770, 99, '金坛', 1, 0),
(771, 99, '溧阳', 1, 0),
(772, 100, '崇安', 1, 0),
(773, 100, '南长', 1, 0),
(774, 100, '北塘', 1, 0),
(775, 100, '滨湖', 1, 0),
(776, 100, '惠山', 1, 0),
(777, 100, '锡山', 1, 0),
(778, 100, '江阴', 1, 0),
(779, 100, '宜兴', 1, 0),
(780, 101, '金阊', 1, 0),
(781, 101, '沧浪', 1, 0),
(782, 101, '平江', 1, 0),
(783, 101, '虎丘', 1, 0),
(784, 101, '吴中', 1, 0),
(785, 101, '相城', 1, 0),
(786, 101, '吴江', 1, 0),
(787, 101, '昆山', 1, 0),
(788, 101, '太仓', 1, 0),
(789, 101, '常熟', 1, 0),
(790, 101, '张家港', 1, 0),
(791, 102, '拱墅', 1, 0),
(792, 102, '上城', 1, 0),
(793, 102, '下城', 1, 0),
(794, 102, '江干', 1, 0),
(795, 102, '西湖', 1, 0),
(796, 102, '滨江', 1, 0),
(797, 102, '余杭', 1, 0),
(798, 102, '萧山', 1, 0),
(799, 102, '临安', 1, 0),
(800, 102, '富阳', 1, 0),
(801, 102, '建德', 1, 0),
(802, 102, '桐庐', 1, 0),
(803, 102, '淳安', 1, 0),
(804, 103, '海曙', 1, 0),
(805, 103, '江东', 1, 0),
(806, 103, '江北', 1, 0),
(807, 103, '镇海', 1, 0),
(808, 103, '北仑', 1, 0),
(809, 103, '鄞州', 1, 0),
(810, 103, '余姚', 1, 0),
(811, 103, '慈溪', 1, 0),
(812, 103, '奉化', 1, 0),
(813, 103, '宁海', 1, 0),
(814, 103, '象山', 1, 0),
(815, 104, '鹿城', 1, 0),
(816, 104, '龙湾', 1, 0),
(817, 104, '瓯海', 1, 0),
(818, 104, '瑞安', 1, 0),
(819, 104, '乐清', 1, 0),
(820, 104, '永嘉', 1, 0),
(821, 104, '文成', 1, 0),
(822, 104, '平阳', 1, 0),
(823, 104, '泰顺', 1, 0),
(824, 104, '洞头', 1, 0),
(825, 104, '苍南', 1, 0),
(826, 105, '秀城', 1, 0),
(827, 105, '秀洲', 1, 0),
(828, 105, '海宁', 1, 0),
(829, 105, '平湖', 1, 0),
(830, 105, '桐乡', 1, 0),
(831, 105, '嘉善', 1, 0),
(832, 105, '海盐', 1, 0),
(833, 106, '长兴', 1, 0),
(834, 106, '德清', 1, 0),
(835, 106, '安吉', 1, 0),
(836, 107, '越城', 1, 0),
(837, 107, '诸暨', 1, 0),
(838, 107, '上虞', 1, 0),
(839, 107, '嵊州', 1, 0),
(840, 107, '绍兴', 1, 0),
(841, 107, '新昌', 1, 0),
(842, 108, '婺城', 1, 0),
(843, 108, '金东', 1, 0),
(844, 108, '兰溪', 1, 0),
(845, 108, '永康', 1, 0),
(846, 108, '义乌', 1, 0),
(847, 108, '东阳', 1, 0),
(848, 108, '武义', 1, 0),
(849, 108, '浦江', 1, 0),
(850, 108, '磐安', 1, 0),
(851, 109, '柯城', 1, 0),
(852, 109, '衢江', 1, 0),
(853, 109, '江山', 1, 0),
(854, 109, '常山', 1, 0),
(855, 109, '开化', 1, 0),
(856, 109, '龙游', 1, 0),
(857, 110, '定海', 1, 0),
(858, 110, '普陀', 1, 0),
(859, 110, '岱山', 1, 0),
(860, 110, '嵊泗', 1, 0),
(861, 111, '椒江', 1, 0),
(862, 111, '黄岩', 1, 0),
(863, 111, '路桥', 1, 0),
(864, 111, '临海', 1, 0),
(865, 111, '温岭', 1, 0),
(866, 111, '三门', 1, 0),
(867, 111, '天台', 1, 0),
(868, 111, '仙居', 1, 0),
(869, 111, '玉环', 1, 0),
(870, 112, '莲都', 1, 0),
(871, 112, '龙泉', 1, 0),
(872, 112, '缙云', 1, 0),
(873, 112, '青田', 1, 0),
(874, 112, '云和', 1, 0),
(875, 112, '遂昌', 1, 0),
(876, 112, '松阳', 1, 0),
(877, 112, '庆元', 1, 0),
(878, 112, '景宁', 1, 0),
(879, 113, '瑶海', 1, 0),
(880, 113, '庐阳', 1, 0),
(881, 113, '蜀山', 1, 0),
(882, 113, '包河', 1, 0),
(883, 113, '长丰', 1, 0),
(884, 113, '肥东', 1, 0),
(885, 113, '肥西', 1, 0),
(886, 114, '镜湖', 1, 0),
(887, 114, '马塘', 1, 0),
(888, 114, '新芜', 1, 0),
(889, 114, '鸠江', 1, 0),
(890, 114, '芜湖', 1, 0),
(891, 114, '繁昌', 1, 0),
(892, 114, '南陵', 1, 0),
(893, 115, '中市', 1, 0),
(894, 115, '东市', 1, 0),
(895, 115, '西市', 1, 0),
(896, 115, '郊区', 1, 0),
(897, 115, '怀远', 1, 0),
(898, 115, '五河', 1, 0),
(899, 115, '固镇', 1, 0),
(900, 116, '田家庵', 1, 0),
(901, 116, '大通', 1, 0),
(902, 116, '谢家集', 1, 0),
(903, 116, '八公山', 1, 0),
(904, 116, '潘集', 1, 0),
(905, 116, '凤台', 1, 0),
(906, 117, '雨山', 1, 0),
(907, 117, '花山', 1, 0),
(908, 117, '金家庄', 1, 0),
(909, 117, '当涂', 1, 0),
(910, 118, '相山', 1, 0),
(911, 118, '杜集', 1, 0),
(912, 118, '烈山', 1, 0),
(913, 118, '濉溪', 1, 0),
(914, 119, '铜官山', 1, 0),
(915, 119, '狮子山', 1, 0),
(916, 119, '郊区', 1, 0),
(917, 119, '铜陵', 1, 0),
(918, 120, '迎江', 1, 0),
(919, 120, '大观', 1, 0),
(920, 120, '郊区', 1, 0),
(921, 120, '桐城', 1, 0),
(922, 120, '怀宁', 1, 0),
(923, 120, '枞阳', 1, 0),
(924, 120, '潜山', 1, 0),
(925, 120, '太湖', 1, 0),
(926, 120, '宿松', 1, 0),
(927, 120, '望江', 1, 0),
(928, 120, '岳西', 1, 0),
(929, 121, '屯溪', 1, 0),
(930, 121, '黄山', 1, 0),
(931, 121, '徽州', 1, 0),
(932, 121, '歙县', 1, 0),
(933, 121, '休宁', 1, 0),
(934, 121, '黟县', 1, 0),
(935, 121, '祁门', 1, 0),
(936, 122, '琅琊', 1, 0),
(937, 122, '南谯', 1, 0),
(938, 122, '明光', 1, 0),
(939, 122, '天长', 1, 0),
(940, 122, '来安', 1, 0),
(941, 122, '全椒', 1, 0),
(942, 122, '定远', 1, 0),
(943, 122, '凤阳', 1, 0),
(944, 123, '颖州', 1, 0),
(945, 123, '颖东', 1, 0),
(946, 123, '颖泉', 1, 0),
(947, 123, '界首', 1, 0),
(948, 123, '临泉', 1, 0),
(949, 123, '太和', 1, 0),
(950, 123, '阜南', 1, 0),
(951, 123, '颖上', 1, 0),
(952, 124, '埇桥', 1, 0),
(953, 124, '砀山', 1, 0),
(954, 124, '萧县', 1, 0),
(955, 124, '灵璧', 1, 0),
(956, 124, '泗县', 1, 0),
(957, 125, '居巢', 1, 0),
(958, 125, '庐江', 1, 0),
(959, 125, '无为', 1, 0),
(960, 125, '含山', 1, 0),
(961, 125, '和县', 1, 0),
(962, 126, '金安', 1, 0),
(963, 126, '裕安', 1, 0),
(964, 126, '寿县', 1, 0),
(965, 126, '霍邱', 1, 0),
(966, 126, '舒城', 1, 0),
(967, 126, '金寨', 1, 0),
(968, 126, '霍山', 1, 0),
(969, 127, '谯城', 1, 0),
(970, 127, '涡阳', 1, 0),
(971, 127, '蒙城', 1, 0),
(972, 127, '利辛', 1, 0),
(973, 128, '贵池', 1, 0),
(974, 128, '东至', 1, 0),
(975, 128, '石台', 1, 0),
(976, 128, '青阳', 1, 0),
(977, 129, '宣州', 1, 0),
(978, 129, '宁国', 1, 0),
(979, 129, '郎溪', 1, 0),
(980, 129, '广德', 1, 0),
(981, 129, '泾县', 1, 0),
(982, 129, '旌德', 1, 0),
(983, 129, '绩溪', 1, 0),
(984, 130, '台江', 1, 0),
(985, 130, '仓山', 1, 0),
(986, 130, '马尾', 1, 0),
(987, 130, '晋安', 1, 0),
(988, 130, '福清', 1, 0),
(989, 130, '长乐', 1, 0),
(990, 130, '闽侯', 1, 0),
(991, 130, '连江', 1, 0),
(992, 130, '罗源', 1, 0),
(993, 130, '闽清', 1, 0),
(994, 130, '永泰', 1, 0),
(995, 130, '平潭', 1, 0),
(996, 131, '鼓浪屿', 1, 0),
(997, 131, '思明', 1, 0),
(998, 131, '杏林', 1, 0),
(999, 131, '湖里', 1, 0),
(1000, 131, '集美', 1, 0),
(1001, 131, '同安', 1, 0),
(1002, 132, '三元', 1, 0),
(1003, 132, '永安', 1, 0),
(1004, 132, '明溪', 1, 0),
(1005, 132, '清流', 1, 0),
(1006, 132, '宁化', 1, 0),
(1007, 132, '大田', 1, 0),
(1008, 132, '尤溪', 1, 0),
(1009, 132, '沙县', 1, 0),
(1010, 132, '将乐', 1, 0),
(1011, 132, '泰宁', 1, 0),
(1012, 132, '建宁', 1, 0),
(1013, 133, '涵江', 1, 0),
(1014, 133, '荔城', 1, 0),
(1015, 134, '丰泽', 1, 0),
(1016, 134, '洛江', 1, 0),
(1017, 134, '泉港', 1, 0),
(1018, 134, '石狮', 1, 0),
(1019, 134, '晋江', 1, 0),
(1020, 134, '南安', 1, 0),
(1021, 134, '惠安', 1, 0),
(1022, 134, '安溪', 1, 0),
(1023, 134, '永春', 1, 0),
(1024, 134, '德化', 1, 0),
(1025, 135, '龙文', 1, 0),
(1026, 135, '龙海', 1, 0),
(1027, 135, '云霄', 1, 0),
(1028, 135, '漳浦', 1, 0),
(1029, 135, '诏安', 1, 0),
(1030, 135, '长泰', 1, 0),
(1031, 135, '东山', 1, 0),
(1032, 135, '南靖', 1, 0),
(1033, 135, '平和', 1, 0),
(1034, 135, '华安', 1, 0),
(1035, 136, '邵武', 1, 0),
(1036, 136, '武夷山', 1, 0),
(1037, 136, '建瓯', 1, 0),
(1038, 136, '建阳', 1, 0),
(1039, 136, '顺昌', 1, 0),
(1040, 136, '浦城', 1, 0),
(1041, 136, '光泽', 1, 0),
(1042, 136, '松溪', 1, 0),
(1043, 136, '政和', 1, 0),
(1044, 137, '漳平', 1, 0),
(1045, 137, '长汀', 1, 0),
(1046, 137, '永定', 1, 0),
(1047, 137, '上杭', 1, 0),
(1048, 137, '武平', 1, 0),
(1049, 137, '连城', 1, 0),
(1050, 138, '福安', 1, 0),
(1051, 138, '福鼎', 1, 0),
(1052, 138, '寿宁', 1, 0),
(1053, 138, '霞浦', 1, 0),
(1054, 138, '柘荣', 1, 0),
(1055, 138, '屏南', 1, 0),
(1056, 138, '古田', 1, 0),
(1057, 138, '周宁', 1, 0),
(1058, 139, '西湖', 1, 0),
(1059, 139, '青云谱', 1, 0),
(1060, 139, '湾里', 1, 0),
(1061, 139, '青山湖', 1, 0),
(1062, 139, '南昌', 1, 0),
(1063, 139, '新建', 1, 0),
(1064, 139, '安义', 1, 0),
(1065, 139, '进贤', 1, 0),
(1066, 140, '昌江', 1, 0),
(1067, 140, '乐平', 1, 0),
(1068, 140, '浮梁', 1, 0),
(1069, 141, '湘东', 1, 0),
(1070, 141, '莲花', 1, 0),
(1071, 141, '上栗', 1, 0),
(1072, 141, '芦溪', 1, 0),
(1073, 142, '庐山', 1, 0),
(1074, 142, '瑞昌', 1, 0),
(1075, 142, '九江', 1, 0),
(1076, 142, '武宁', 1, 0),
(1077, 142, '修水', 1, 0),
(1078, 142, '永修', 1, 0),
(1079, 142, '德安', 1, 0),
(1080, 142, '星子', 1, 0),
(1081, 142, '都昌', 1, 0),
(1082, 142, '湖口', 1, 0),
(1083, 142, '彭泽', 1, 0),
(1084, 143, '分宜', 1, 0),
(1085, 144, '贵溪', 1, 0),
(1086, 144, '余江', 1, 0),
(1087, 145, '瑞金', 1, 0),
(1088, 145, '南康', 1, 0),
(1089, 145, '赣县', 1, 0),
(1090, 145, '信丰', 1, 0),
(1091, 145, '大余', 1, 0),
(1092, 145, '上犹', 1, 0),
(1093, 145, '崇义', 1, 0),
(1094, 145, '安远', 1, 0),
(1095, 145, '龙南', 1, 0),
(1096, 145, '定南', 1, 0),
(1097, 145, '全南', 1, 0),
(1098, 145, '宁都', 1, 0),
(1099, 145, '于都', 1, 0),
(1100, 145, '兴国', 1, 0),
(1101, 145, '会昌', 1, 0),
(1102, 145, '寻乌', 1, 0),
(1103, 145, '石城', 1, 0),
(1104, 146, '青原', 1, 0),
(1105, 146, '井冈山', 1, 0),
(1106, 146, '吉安', 1, 0),
(1107, 146, '吉水', 1, 0),
(1108, 146, '峡江', 1, 0),
(1109, 146, '新干', 1, 0),
(1110, 146, '永丰', 1, 0),
(1111, 146, '泰和', 1, 0),
(1112, 146, '遂川', 1, 0),
(1113, 146, '万安', 1, 0),
(1114, 146, '安福', 1, 0),
(1115, 146, '永新', 1, 0),
(1116, 147, '丰城', 1, 0),
(1117, 147, '樟树', 1, 0),
(1118, 147, '高安', 1, 0),
(1119, 147, '奉新', 1, 0),
(1120, 147, '万载', 1, 0),
(1121, 147, '上高', 1, 0),
(1122, 147, '宜丰', 1, 0),
(1123, 147, '靖安', 1, 0),
(1124, 147, '铜鼓', 1, 0),
(1125, 148, '南城', 1, 0),
(1126, 148, '黎川', 1, 0),
(1127, 148, '南丰', 1, 0),
(1128, 148, '崇仁', 1, 0),
(1129, 148, '乐安', 1, 0),
(1130, 148, '宜黄', 1, 0),
(1131, 148, '金溪', 1, 0),
(1132, 148, '资溪', 1, 0),
(1133, 148, '东乡', 1, 0),
(1134, 148, '广昌', 1, 0),
(1135, 149, '德兴', 1, 0),
(1136, 149, '上饶', 1, 0),
(1137, 149, '广丰', 1, 0),
(1138, 149, '玉山', 1, 0),
(1139, 149, '铅山', 1, 0),
(1140, 149, '横峰', 1, 0),
(1141, 149, '弋阳', 1, 0),
(1142, 149, '余干', 1, 0),
(1143, 149, '波阳', 1, 0),
(1144, 149, '万年', 1, 0),
(1145, 149, '婺源', 1, 0),
(1146, 150, '市中', 1, 0),
(1147, 150, '历下', 1, 0),
(1148, 150, '槐荫', 1, 0),
(1149, 150, '天桥', 1, 0),
(1150, 150, '历城', 1, 0),
(1151, 150, '长清', 1, 0),
(1152, 150, '章丘', 1, 0),
(1153, 150, '平阴', 1, 0),
(1154, 150, '济阳', 1, 0),
(1155, 150, '商河', 1, 0),
(1156, 151, '市南', 1, 0),
(1157, 151, '市北', 1, 0),
(1158, 151, '四方', 1, 0),
(1159, 151, '黄岛', 1, 0),
(1160, 151, '崂山', 1, 0),
(1161, 151, '城阳', 1, 0),
(1162, 151, '李沧', 1, 0),
(1163, 151, '胶州', 1, 0),
(1164, 151, '即墨', 1, 0),
(1165, 151, '平度', 1, 0),
(1166, 151, '胶南', 1, 0),
(1167, 151, '莱西', 1, 0),
(1168, 152, '张店', 1, 0),
(1169, 152, '淄川', 1, 0),
(1170, 152, '博山', 1, 0),
(1171, 152, '临淄', 1, 0),
(1172, 152, '周村', 1, 0),
(1173, 152, '桓台', 1, 0),
(1174, 152, '高青', 1, 0),
(1175, 152, '沂源', 1, 0),
(1176, 153, '市中', 1, 0),
(1177, 153, '薛城', 1, 0),
(1178, 153, '峄城', 1, 0),
(1179, 153, '台儿庄', 1, 0),
(1180, 153, '山亭', 1, 0),
(1181, 153, '滕州', 1, 0),
(1182, 154, '东营', 1, 0),
(1183, 154, '河口', 1, 0),
(1184, 154, '垦利', 1, 0),
(1185, 154, '利津', 1, 0),
(1186, 154, '广饶', 1, 0),
(1187, 155, '潍城', 1, 0),
(1188, 155, '寒亭', 1, 0),
(1189, 155, '坊子', 1, 0),
(1190, 155, '奎文', 1, 0),
(1191, 155, '安丘', 1, 0),
(1192, 155, '昌邑', 1, 0),
(1193, 155, '高密', 1, 0),
(1194, 155, '青州', 1, 0),
(1195, 155, '诸城', 1, 0),
(1196, 155, '寿光', 1, 0),
(1197, 155, '临朐', 1, 0),
(1198, 155, '昌乐', 1, 0),
(1199, 156, '芝罘', 1, 0),
(1200, 156, '福山', 1, 0),
(1201, 156, '莱山', 1, 0),
(1202, 156, '牟平', 1, 0),
(1203, 156, '栖霞', 1, 0),
(1204, 156, '海阳', 1, 0),
(1205, 156, '龙口', 1, 0),
(1206, 156, '莱阳', 1, 0),
(1207, 156, '莱州', 1, 0),
(1208, 156, '蓬莱', 1, 0),
(1209, 156, '招远', 1, 0),
(1210, 156, '长岛', 1, 0),
(1211, 157, '环翠', 1, 0),
(1212, 157, '荣成', 1, 0),
(1213, 157, '乳山', 1, 0),
(1214, 157, '文登', 1, 0),
(1215, 159, '泰山', 1, 0),
(1216, 159, '岱岳', 1, 0),
(1217, 159, '新泰', 1, 0),
(1218, 159, '肥城', 1, 0),
(1219, 159, '宁阳', 1, 0),
(1220, 159, '东平', 1, 0),
(1221, 160, '东港', 1, 0),
(1222, 160, '五莲', 1, 0),
(1223, 160, '莒县', 1, 0),
(1224, 161, '莱城', 1, 0),
(1225, 161, '钢城', 1, 0),
(1226, 162, '兰山', 1, 0),
(1227, 162, '罗庄', 1, 0),
(1228, 162, '河东', 1, 0),
(1229, 162, '郯城', 1, 0),
(1230, 162, '苍山', 1, 0),
(1231, 162, '莒南', 1, 0),
(1232, 162, '沂水', 1, 0),
(1233, 162, '蒙阴', 1, 0),
(1234, 162, '平邑', 1, 0),
(1235, 162, '费县', 1, 0),
(1236, 162, '沂南', 1, 0),
(1237, 162, '临沭', 1, 0),
(1238, 163, '德城', 1, 0),
(1239, 163, '乐陵', 1, 0),
(1240, 163, '禹城', 1, 0),
(1241, 163, '陵县', 1, 0),
(1242, 163, '平原', 1, 0),
(1243, 163, '夏津', 1, 0),
(1244, 163, '武城', 1, 0),
(1245, 163, '齐河', 1, 0),
(1246, 163, '临邑', 1, 0),
(1247, 163, '宁津', 1, 0),
(1248, 163, '庆云', 1, 0),
(1249, 164, '东昌府', 1, 0),
(1250, 164, '临清', 1, 0),
(1251, 164, '阳谷', 1, 0),
(1252, 164, '莘县', 1, 0),
(1253, 164, '茌平', 1, 0),
(1254, 164, '东阿', 1, 0),
(1255, 164, '冠县', 1, 0),
(1256, 164, '高唐', 1, 0),
(1257, 165, '滨城', 1, 0),
(1258, 165, '惠民', 1, 0),
(1259, 165, '阳信', 1, 0),
(1260, 165, '无棣', 1, 0),
(1261, 165, '沾化', 1, 0),
(1262, 165, '博兴', 1, 0),
(1263, 165, '邹平', 1, 0),
(1264, 166, '牡丹', 1, 0),
(1265, 166, '曹县', 1, 0),
(1266, 166, '定陶', 1, 0),
(1267, 166, '成武', 1, 0),
(1268, 166, '单县', 1, 0),
(1269, 166, '巨野', 1, 0),
(1270, 166, '郓城', 1, 0),
(1271, 166, '鄄城', 1, 0),
(1272, 166, '东明', 1, 0),
(1273, 167, '中原', 1, 0),
(1274, 167, '二七', 1, 0),
(1275, 167, '管城', 1, 0),
(1276, 167, '金水', 1, 0),
(1277, 167, '上街', 1, 0),
(1278, 167, '邙山', 1, 0),
(1279, 167, '新郑', 1, 0),
(1280, 167, '登封', 1, 0),
(1281, 167, '新密', 1, 0),
(1282, 167, '巩义', 1, 0),
(1283, 167, '荥阳', 1, 0),
(1284, 167, '中牟', 1, 0),
(1285, 168, '鼓楼', 1, 0),
(1286, 168, '龙亭', 1, 0),
(1287, 168, '顺河', 1, 0),
(1288, 168, '南关', 1, 0),
(1289, 168, '郊区', 1, 0),
(1290, 168, '杞县', 1, 0),
(1291, 168, '通许', 1, 0),
(1292, 168, '尉氏', 1, 0),
(1293, 168, '开封', 1, 0),
(1294, 168, '兰考', 1, 0),
(1295, 169, '西工', 1, 0),
(1296, 169, '老城', 1, 0),
(1297, 169, '瀍河', 1, 0),
(1298, 169, '涧西', 1, 0),
(1299, 169, '吉利', 1, 0),
(1300, 169, '洛龙', 1, 0),
(1301, 169, '偃师', 1, 0),
(1302, 169, '孟津', 1, 0),
(1303, 169, '新安', 1, 0),
(1304, 169, '栾川', 1, 0),
(1305, 169, '嵩县', 1, 0),
(1306, 169, '汝阳', 1, 0),
(1307, 169, '宜阳', 1, 0),
(1308, 169, '洛宁', 1, 0),
(1309, 169, '伊川', 1, 0),
(1310, 170, '新华', 1, 0),
(1311, 170, '卫东', 1, 0),
(1312, 170, '湛河', 1, 0),
(1313, 170, '石龙', 1, 0),
(1314, 170, '舞钢', 1, 0),
(1315, 170, '汝州', 1, 0),
(1316, 170, '宝丰', 1, 0),
(1317, 170, '叶县', 1, 0),
(1318, 170, '鲁山', 1, 0),
(1319, 170, '郏县', 1, 0),
(1320, 171, '山阳', 1, 0),
(1321, 171, '解放', 1, 0),
(1322, 171, '中站', 1, 0),
(1323, 171, '马村', 1, 0),
(1324, 171, '孟州', 1, 0),
(1325, 171, '沁阳', 1, 0),
(1326, 171, '修武', 1, 0),
(1327, 171, '博爱', 1, 0),
(1328, 171, '武陟', 1, 0),
(1329, 171, '温县', 1, 0),
(1330, 172, '淇滨', 1, 0),
(1331, 172, '山城', 1, 0),
(1332, 172, '鹤山', 1, 0),
(1333, 172, '浚县', 1, 0),
(1334, 172, '淇县', 1, 0),
(1335, 173, '新华', 1, 0),
(1336, 173, '红旗', 1, 0),
(1337, 173, '北站', 1, 0),
(1338, 173, '郊区', 1, 0),
(1339, 173, '卫辉', 1, 0),
(1340, 173, '辉县', 1, 0),
(1341, 173, '新乡', 1, 0),
(1342, 173, '获嘉', 1, 0),
(1343, 173, '原阳', 1, 0),
(1344, 173, '延津', 1, 0),
(1345, 173, '封丘', 1, 0),
(1346, 173, '长垣', 1, 0),
(1347, 174, '北关', 1, 0),
(1348, 174, '文峰', 1, 0),
(1349, 174, '殷都', 1, 0),
(1350, 174, '龙安', 1, 0),
(1351, 174, '林州', 1, 0),
(1352, 174, '安阳', 1, 0),
(1353, 174, '汤阴', 1, 0),
(1354, 174, '滑县', 1, 0),
(1355, 174, '内黄', 1, 0),
(1356, 175, '市区', 1, 0),
(1357, 175, '清丰', 1, 0),
(1358, 175, '南乐', 1, 0),
(1359, 175, '范县', 1, 0),
(1360, 175, '台前', 1, 0),
(1361, 175, '濮阳', 1, 0),
(1362, 176, '魏都', 1, 0),
(1363, 176, '禹州', 1, 0),
(1364, 176, '长葛', 1, 0),
(1365, 176, '许昌', 1, 0),
(1366, 176, '鄢陵', 1, 0),
(1367, 176, '襄城', 1, 0),
(1368, 177, '源汇', 1, 0),
(1369, 177, '舞阳', 1, 0),
(1370, 177, '临颖', 1, 0),
(1371, 177, '郾城', 1, 0),
(1372, 178, '湖滨', 1, 0),
(1373, 178, '义马', 1, 0),
(1374, 178, '灵宝', 1, 0),
(1375, 178, '渑池', 1, 0),
(1376, 178, '陕县', 1, 0),
(1377, 178, '卢氏', 1, 0),
(1378, 179, '卧龙', 1, 0),
(1379, 179, '宛城', 1, 0),
(1380, 179, '邓州', 1, 0),
(1381, 179, '南召', 1, 0),
(1382, 179, '方城', 1, 0),
(1383, 179, '西峡', 1, 0),
(1384, 179, '镇平', 1, 0),
(1385, 179, '内乡', 1, 0),
(1386, 179, '淅川', 1, 0),
(1387, 179, '社旗', 1, 0),
(1388, 179, '唐河', 1, 0),
(1389, 179, '新野', 1, 0),
(1390, 179, '桐柏', 1, 0),
(1391, 180, '梁园', 1, 0),
(1392, 180, '睢阳', 1, 0),
(1393, 180, '永城', 1, 0),
(1394, 180, '虞城', 1, 0),
(1395, 180, '民权', 1, 0),
(1396, 180, '宁陵', 1, 0),
(1397, 180, '睢县', 1, 0),
(1398, 180, '夏邑', 1, 0),
(1399, 180, '柘城', 1, 0),
(1400, 181, '浉河', 1, 0),
(1401, 181, '平桥', 1, 0),
(1402, 181, '息县', 1, 0),
(1403, 181, '淮滨', 1, 0),
(1404, 181, '潢川', 1, 0),
(1405, 181, '光山', 1, 0),
(1406, 181, '固始', 1, 0),
(1407, 181, '商城', 1, 0),
(1408, 181, '罗山', 1, 0),
(1409, 181, '新县', 1, 0),
(1410, 182, '川汇', 1, 0),
(1411, 182, '项城', 1, 0),
(1412, 182, '扶沟', 1, 0),
(1413, 182, '西华', 1, 0),
(1414, 182, '商水', 1, 0),
(1415, 182, '太康', 1, 0),
(1416, 182, '鹿邑', 1, 0),
(1417, 182, '郸城', 1, 0),
(1418, 182, '淮阳', 1, 0),
(1419, 182, '沈丘', 1, 0),
(1420, 183, '驿城', 1, 0),
(1421, 183, '确山', 1, 0),
(1422, 183, '泌阳', 1, 0),
(1423, 183, '遂平', 1, 0),
(1424, 183, '西平', 1, 0),
(1425, 183, '上蔡', 1, 0),
(1426, 183, '汝南', 1, 0),
(1427, 183, '平舆', 1, 0),
(1428, 183, '新蔡', 1, 0),
(1429, 183, '正阳', 1, 0),
(1430, 185, '江岸', 1, 0),
(1431, 185, '江汉', 1, 0),
(1432, 185, '硚口', 1, 0),
(1433, 185, '汉阳', 1, 0),
(1434, 185, '武昌', 1, 0),
(1435, 185, '青山', 1, 0),
(1436, 185, '洪山', 1, 0),
(1437, 185, '东西湖', 1, 0),
(1438, 185, '汉南', 1, 0),
(1439, 185, '蔡甸', 1, 0),
(1440, 185, '江夏', 1, 0),
(1441, 185, '黄陂', 1, 0),
(1442, 185, '新洲', 1, 0),
(1443, 186, '黄石港', 1, 0),
(1444, 186, '西塞山', 1, 0),
(1445, 186, '下陆', 1, 0),
(1446, 186, '铁山', 1, 0),
(1447, 186, '大冶', 1, 0),
(1448, 186, '阳新', 1, 0),
(1449, 187, '襄城', 1, 0),
(1450, 187, '樊城', 1, 0),
(1451, 187, '襄阳', 1, 0),
(1452, 187, '老河口', 1, 0),
(1453, 187, '枣阳', 1, 0),
(1454, 187, '宜城', 1, 0),
(1455, 187, '南漳', 1, 0),
(1456, 187, '谷城', 1, 0),
(1457, 187, '保康', 1, 0),
(1458, 188, '张湾', 1, 0),
(1459, 188, '茅箭', 1, 0),
(1460, 188, '丹江口', 1, 0),
(1461, 188, '郧县', 1, 0),
(1462, 188, '竹山', 1, 0),
(1463, 188, '房县', 1, 0),
(1464, 188, '郧西', 1, 0),
(1465, 188, '竹溪', 1, 0),
(1466, 189, '沙市', 1, 0),
(1467, 189, '荆州', 1, 0),
(1468, 189, '石首', 1, 0),
(1469, 189, '洪湖', 1, 0),
(1470, 189, '松滋', 1, 0),
(1471, 189, '江陵', 1, 0),
(1472, 189, '公安', 1, 0),
(1473, 189, '监利', 1, 0),
(1474, 190, '西陵', 1, 0),
(1475, 190, '伍家岗', 1, 0),
(1476, 190, '点军', 1, 0),
(1477, 190, '猇亭', 1, 0),
(1478, 190, '夷陵', 1, 0),
(1479, 190, '枝江', 1, 0),
(1480, 190, '宜都', 1, 0),
(1481, 190, '当阳', 1, 0),
(1482, 190, '远安', 1, 0),
(1483, 190, '兴山', 1, 0),
(1484, 190, '秭归', 1, 0),
(1485, 190, '长阳', 1, 0),
(1486, 190, '五峰', 1, 0),
(1487, 191, '东宝', 1, 0),
(1488, 191, '掇刀', 1, 0),
(1489, 191, '钟祥', 1, 0),
(1490, 191, '沙洋', 1, 0),
(1491, 191, '京山', 1, 0),
(1492, 192, '鄂城', 1, 0),
(1493, 192, '梁子湖', 1, 0),
(1494, 192, '华容', 1, 0),
(1495, 193, '孝南', 1, 0),
(1496, 193, '应城', 1, 0),
(1497, 193, '安陆', 1, 0),
(1498, 193, '汉川', 1, 0),
(1499, 193, '孝昌', 1, 0),
(1500, 193, '大悟', 1, 0),
(1501, 193, '云梦', 1, 0),
(1502, 194, '黄州', 1, 0),
(1503, 194, '麻城', 1, 0),
(1504, 194, '武穴', 1, 0),
(1505, 194, '红安', 1, 0),
(1506, 194, '罗田', 1, 0),
(1507, 194, '英山', 1, 0),
(1508, 194, '浠水', 1, 0),
(1509, 194, '蕲春', 1, 0),
(1510, 194, '黄梅', 1, 0),
(1511, 194, '团风', 1, 0),
(1512, 195, '咸安', 1, 0),
(1513, 195, '赤壁', 1, 0),
(1514, 195, '嘉鱼', 1, 0),
(1515, 195, '通城', 1, 0),
(1516, 195, '崇阳', 1, 0),
(1517, 195, '通山', 1, 0),
(1518, 196, '曾都', 1, 0),
(1519, 196, '广水', 1, 0),
(1520, 197, '恩施', 1, 0),
(1521, 197, '利川', 1, 0),
(1522, 197, '建始', 1, 0),
(1523, 197, '巴东', 1, 0),
(1524, 197, '宣恩', 1, 0),
(1525, 197, '咸丰', 1, 0),
(1526, 197, '来凤', 1, 0),
(1527, 197, '鹤峰', 1, 0),
(1528, 198, '潜江', 1, 0),
(1529, 198, '神农架林', 1, 0),
(1530, 199, '岳麓', 1, 0),
(1531, 199, '芙蓉', 1, 0),
(1532, 199, '天心', 1, 0),
(1533, 199, '开福', 1, 0),
(1534, 199, '雨花', 1, 0),
(1535, 199, '浏阳', 1, 0),
(1536, 199, '长沙', 1, 0),
(1537, 199, '望城', 1, 0),
(1538, 199, '宁乡', 1, 0),
(1539, 200, '天元', 1, 0),
(1540, 200, '荷塘', 1, 0),
(1541, 200, '芦淞', 1, 0),
(1542, 200, '石峰', 1, 0),
(1543, 200, '醴陵', 1, 0),
(1544, 200, '株洲', 1, 0),
(1545, 200, '攸县', 1, 0),
(1546, 200, '茶陵', 1, 0),
(1547, 200, '炎陵', 1, 0),
(1548, 201, '雨湖', 1, 0),
(1549, 201, '岳塘', 1, 0),
(1550, 201, '湘乡', 1, 0),
(1551, 201, '韶山', 1, 0),
(1552, 201, '湘潭', 1, 0),
(1553, 202, '雁峰', 1, 0),
(1554, 202, '珠晖', 1, 0),
(1555, 202, '石鼓', 1, 0),
(1556, 202, '蒸湘', 1, 0),
(1557, 202, '南岳', 1, 0),
(1558, 202, '常宁', 1, 0),
(1559, 202, '耒阳', 1, 0),
(1560, 202, '衡阳', 1, 0),
(1561, 202, '衡南', 1, 0),
(1562, 202, '衡山', 1, 0),
(1563, 202, '衡东', 1, 0),
(1564, 202, '祁东', 1, 0),
(1565, 203, '大祥', 1, 0),
(1566, 203, '北塔', 1, 0),
(1567, 203, '武冈', 1, 0),
(1568, 203, '邵东', 1, 0),
(1569, 203, '邵阳', 1, 0),
(1570, 203, '新邵', 1, 0),
(1571, 203, '隆回', 1, 0),
(1572, 203, '洞口', 1, 0),
(1573, 203, '绥宁', 1, 0),
(1574, 203, '新宁', 1, 0),
(1575, 203, '城步', 1, 0),
(1576, 204, '岳阳楼', 1, 0),
(1577, 204, '君山', 1, 0),
(1578, 204, '云溪', 1, 0),
(1579, 204, '汨罗', 1, 0),
(1580, 204, '临湘', 1, 0),
(1581, 204, '岳阳', 1, 0),
(1582, 204, '华容', 1, 0),
(1583, 204, '湘阴', 1, 0),
(1584, 204, '平江', 1, 0),
(1585, 205, '武陵', 1, 0),
(1586, 205, '鼎城', 1, 0),
(1587, 205, '津市', 1, 0),
(1588, 205, '安乡', 1, 0),
(1589, 205, '汉寿', 1, 0),
(1590, 205, '澧县', 1, 0),
(1591, 205, '临澧', 1, 0),
(1592, 205, '桃源', 1, 0),
(1593, 205, '石门', 1, 0),
(1594, 206, '永定', 1, 0),
(1595, 206, '武陵源', 1, 0),
(1596, 206, '慈利', 1, 0),
(1597, 206, '桑植', 1, 0),
(1598, 207, '赫山', 1, 0),
(1599, 207, '资阳', 1, 0),
(1600, 207, '沅江', 1, 0),
(1601, 207, '南县', 1, 0),
(1602, 207, '桃江', 1, 0),
(1603, 207, '安化', 1, 0),
(1604, 208, '北湖', 1, 0),
(1605, 208, '苏仙', 1, 0),
(1606, 208, '资兴', 1, 0),
(1607, 208, '桂阳', 1, 0),
(1608, 208, '永兴', 1, 0),
(1609, 208, '宜章', 1, 0),
(1610, 208, '嘉禾', 1, 0),
(1611, 208, '临武', 1, 0),
(1612, 208, '汝城', 1, 0),
(1613, 208, '桂东', 1, 0),
(1614, 208, '安仁', 1, 0),
(1615, 209, '冷水滩', 1, 0),
(1616, 209, '芝山', 1, 0),
(1617, 209, '东安', 1, 0),
(1618, 209, '道县', 1, 0),
(1619, 209, '宁远', 1, 0),
(1620, 209, '江永', 1, 0),
(1621, 209, '蓝山', 1, 0),
(1622, 209, '新田', 1, 0),
(1623, 209, '双牌', 1, 0),
(1624, 209, '祁阳', 1, 0),
(1625, 209, '江华', 1, 0),
(1626, 210, '洪江', 1, 0),
(1627, 210, '沅陵', 1, 0),
(1628, 210, '辰溪', 1, 0),
(1629, 210, '溆浦', 1, 0),
(1630, 210, '中方', 1, 0),
(1631, 210, '会同', 1, 0),
(1632, 210, '麻阳', 1, 0),
(1633, 210, '新晃', 1, 0),
(1634, 210, '芷江', 1, 0),
(1635, 210, '靖州', 1, 0),
(1636, 210, '通道', 1, 0),
(1637, 211, '娄星', 1, 0),
(1638, 211, '冷水江', 1, 0),
(1639, 211, '涟源', 1, 0),
(1640, 211, '双峰', 1, 0),
(1641, 211, '新化', 1, 0),
(1642, 212, '吉首', 1, 0),
(1643, 212, '泸溪', 1, 0),
(1644, 212, '凤凰', 1, 0),
(1645, 212, '花垣', 1, 0),
(1646, 212, '保靖', 1, 0),
(1647, 212, '古丈', 1, 0),
(1648, 212, '永顺', 1, 0),
(1649, 212, '龙山', 1, 0),
(1650, 213, '越秀', 1, 0),
(1651, 213, '东山', 1, 0),
(1652, 213, '荔湾', 1, 0),
(1653, 213, '海珠', 1, 0),
(1654, 213, '天河', 1, 0),
(1655, 213, '芳村', 1, 0),
(1656, 213, '白云', 1, 0),
(1657, 213, '黄埔', 1, 0),
(1658, 213, '番禺', 1, 0),
(1659, 213, '花都', 1, 0),
(1660, 213, '增城', 1, 0),
(1661, 213, '从化', 1, 0),
(1662, 214, '罗湖', 1, 0),
(1663, 214, '南山', 1, 0),
(1664, 214, '宝安', 1, 0),
(1665, 214, '龙岗', 1, 0),
(1666, 214, '盐田', 1, 0),
(1667, 215, '香洲', 1, 0),
(1668, 215, '斗门', 1, 0),
(1669, 215, '金湾', 1, 0),
(1670, 216, '金园', 1, 0),
(1671, 216, '达濠', 1, 0),
(1672, 216, '龙湖', 1, 0),
(1673, 216, '升平', 1, 0),
(1674, 216, '河浦', 1, 0),
(1675, 216, '澄海', 1, 0),
(1676, 216, '潮阳', 1, 0),
(1677, 216, '南澳', 1, 0),
(1678, 217, '北江', 1, 0),
(1679, 217, '武江', 1, 0),
(1680, 217, '浈江', 1, 0),
(1681, 217, '乐昌', 1, 0),
(1682, 217, '南雄', 1, 0),
(1683, 217, '曲江', 1, 0),
(1684, 217, '始兴', 1, 0),
(1685, 217, '仁化', 1, 0),
(1686, 217, '翁源', 1, 0),
(1687, 217, '新丰', 1, 0),
(1688, 217, '乳源', 1, 0),
(1689, 218, '源城', 1, 0),
(1690, 218, '紫金', 1, 0),
(1691, 218, '龙川', 1, 0),
(1692, 218, '连平', 1, 0),
(1693, 218, '和平', 1, 0),
(1694, 218, '东源', 1, 0),
(1695, 219, '梅江', 1, 0),
(1696, 219, '兴宁', 1, 0),
(1697, 219, '梅县', 1, 0),
(1698, 219, '大埔', 1, 0),
(1699, 219, '丰顺', 1, 0),
(1700, 219, '五华', 1, 0),
(1701, 219, '平远', 1, 0),
(1702, 219, '蕉岭', 1, 0),
(1703, 220, '惠城', 1, 0),
(1704, 220, '惠阳', 1, 0),
(1705, 220, '博罗', 1, 0),
(1706, 220, '惠东', 1, 0),
(1707, 220, '龙门', 1, 0),
(1708, 221, '城区', 1, 0),
(1709, 221, '陆丰', 1, 0),
(1710, 221, '海丰', 1, 0),
(1711, 221, '陆河', 1, 0),
(1712, 224, '江海', 1, 0),
(1713, 224, '蓬江', 1, 0),
(1714, 224, '新会', 1, 0),
(1715, 224, '恩平', 1, 0),
(1716, 224, '台山', 1, 0),
(1717, 224, '开平', 1, 0),
(1718, 224, '鹤山', 1, 0),
(1719, 225, '禅城', 1, 0),
(1720, 225, '高明', 1, 0),
(1721, 225, '顺德', 1, 0),
(1722, 225, '南海', 1, 0),
(1723, 225, '三水', 1, 0),
(1724, 226, '江城', 1, 0),
(1725, 226, '阳春', 1, 0),
(1726, 226, '阳西', 1, 0),
(1727, 226, '阳东', 1, 0),
(1728, 227, '赤坎', 1, 0),
(1729, 227, '霞山', 1, 0),
(1730, 227, '坡头', 1, 0),
(1731, 227, '麻章', 1, 0),
(1732, 227, '吴川', 1, 0),
(1733, 227, '廉江', 1, 0),
(1734, 227, '雷州', 1, 0),
(1735, 227, '遂溪', 1, 0),
(1736, 227, '徐闻', 1, 0),
(1737, 228, '茂南', 1, 0),
(1738, 228, '茂港', 1, 0),
(1739, 228, '化州', 1, 0),
(1740, 228, '信宜', 1, 0),
(1741, 228, '高州', 1, 0),
(1742, 228, '电白', 1, 0),
(1743, 229, '端州', 1, 0),
(1744, 229, '鼎湖', 1, 0),
(1745, 229, '高要', 1, 0),
(1746, 229, '四会', 1, 0),
(1747, 229, '广宁', 1, 0),
(1748, 229, '怀集', 1, 0),
(1749, 229, '封开', 1, 0),
(1750, 229, '德庆', 1, 0),
(1751, 230, '清城', 1, 0),
(1752, 230, '英德', 1, 0),
(1753, 230, '连州', 1, 0),
(1754, 230, '佛冈', 1, 0),
(1755, 230, '阳山', 1, 0),
(1756, 230, '清新', 1, 0),
(1757, 230, '连山', 1, 0),
(1758, 230, '连南', 1, 0),
(1759, 231, '湘桥', 1, 0),
(1760, 231, '潮安', 1, 0),
(1761, 231, '饶平', 1, 0),
(1762, 232, '榕城', 1, 0),
(1763, 232, '普宁', 1, 0),
(1764, 232, '揭东', 1, 0),
(1765, 232, '揭西', 1, 0),
(1766, 232, '惠来', 1, 0),
(1767, 233, '云城', 1, 0),
(1768, 233, '罗定', 1, 0),
(1769, 233, '云安', 1, 0),
(1770, 233, '新兴', 1, 0),
(1771, 233, '郁南', 1, 0),
(1772, 234, '新城', 1, 0),
(1773, 234, '兴宁', 1, 0),
(1774, 234, '城北', 1, 0),
(1775, 234, '江南', 1, 0),
(1776, 234, '永新', 1, 0),
(1777, 234, '邕宁', 1, 0),
(1778, 234, '武鸣', 1, 0),
(1779, 234, '宾阳', 1, 0),
(1780, 234, '上林', 1, 0),
(1781, 234, '马山', 1, 0),
(1782, 235, '城中', 1, 0),
(1783, 235, '鱼峰', 1, 0),
(1784, 235, '柳南', 1, 0),
(1785, 235, '柳北', 1, 0),
(1786, 235, '柳江', 1, 0),
(1787, 235, '柳城', 1, 0),
(1788, 235, '鹿寨', 1, 0),
(1789, 235, '融安', 1, 0),
(1790, 235, '融水', 1, 0),
(1791, 235, '三江', 1, 0),
(1792, 236, '秀峰', 1, 0),
(1793, 236, '叠彩', 1, 0),
(1794, 236, '象山', 1, 0),
(1795, 236, '七星', 1, 0),
(1796, 236, '雁山', 1, 0),
(1797, 236, '阳朔', 1, 0),
(1798, 236, '临桂', 1, 0),
(1799, 236, '灵川', 1, 0),
(1800, 236, '全州', 1, 0),
(1801, 236, '兴安', 1, 0),
(1802, 236, '永福', 1, 0),
(1803, 236, '灌阳', 1, 0),
(1804, 236, '资源', 1, 0),
(1805, 236, '平乐', 1, 0),
(1806, 236, '荔浦', 1, 0),
(1807, 236, '龙胜', 1, 0),
(1808, 236, '恭城', 1, 0),
(1809, 237, '万秀', 1, 0),
(1810, 237, '蝶山', 1, 0),
(1811, 237, '市郊', 1, 0),
(1812, 237, '岑溪', 1, 0),
(1813, 237, '苍梧', 1, 0),
(1814, 237, '藤县', 1, 0),
(1815, 237, '蒙山', 1, 0),
(1816, 238, '海城', 1, 0),
(1817, 238, '银海', 1, 0),
(1818, 238, '铁山港', 1, 0),
(1819, 238, '合浦', 1, 0),
(1820, 239, '港口', 1, 0),
(1821, 239, '防城', 1, 0),
(1822, 239, '东兴', 1, 0),
(1823, 239, '上思', 1, 0),
(1824, 240, '钦南', 1, 0),
(1825, 240, '钦北', 1, 0),
(1826, 240, '灵山', 1, 0),
(1827, 240, '浦北', 1, 0),
(1828, 241, '港北', 1, 0),
(1829, 241, '港南', 1, 0),
(1830, 241, '桂平', 1, 0),
(1831, 241, '平南', 1, 0),
(1832, 242, '北流', 1, 0),
(1833, 242, '兴业', 1, 0),
(1834, 242, '容县', 1, 0),
(1835, 242, '陆川', 1, 0),
(1836, 242, '博白', 1, 0),
(1837, 243, '田阳', 1, 0),
(1838, 243, '田东', 1, 0),
(1839, 243, '平果', 1, 0),
(1840, 243, '德保', 1, 0),
(1841, 243, '靖西', 1, 0),
(1842, 243, '那坡', 1, 0),
(1843, 243, '凌云', 1, 0),
(1844, 243, '乐业', 1, 0),
(1845, 243, '西林', 1, 0),
(1846, 243, '田林', 1, 0),
(1847, 243, '隆林', 1, 0),
(1848, 244, '八步', 1, 0),
(1849, 244, '昭平', 1, 0),
(1850, 244, '钟山', 1, 0),
(1851, 244, '富川', 1, 0),
(1852, 245, '金城江', 1, 0),
(1853, 245, '宜州', 1, 0),
(1854, 245, '南丹', 1, 0),
(1855, 245, '天峨', 1, 0),
(1856, 245, '凤山', 1, 0),
(1857, 245, '东兰', 1, 0),
(1858, 245, '巴马', 1, 0),
(1859, 245, '都安', 1, 0),
(1860, 245, '大化', 1, 0),
(1861, 245, '罗城', 1, 0),
(1862, 245, '环江', 1, 0),
(1863, 246, '兴宾', 1, 0),
(1864, 246, '合山', 1, 0),
(1865, 246, '象州', 1, 0),
(1866, 246, '武宣', 1, 0),
(1867, 246, '忻城', 1, 0),
(1868, 246, '金秀', 1, 0),
(1869, 247, '凭祥', 1, 0),
(1870, 247, '扶绥', 1, 0),
(1871, 247, '大新', 1, 0),
(1872, 247, '天等', 1, 0),
(1873, 247, '宁明', 1, 0),
(1874, 247, '龙州', 1, 0),
(1875, 248, '秀英', 1, 0),
(1876, 248, '新华', 1, 0),
(1877, 248, '振东', 1, 0),
(1878, 248, '秀英', 1, 0),
(1879, 248, '琼山', 1, 0),
(1880, 250, '澄迈', 1, 0),
(1881, 250, '定安', 1, 0),
(1882, 250, '屯昌', 1, 0),
(1883, 250, '昌江', 1, 0),
(1884, 250, '白沙', 1, 0),
(1885, 250, '琼中', 1, 0),
(1886, 250, '陵水', 1, 0),
(1887, 250, '保亭', 1, 0);
INSERT INTO `oc_city` (`city_id`, `zone_id`, `name`, `status`, `sort_order`) VALUES
(1888, 250, '乐东', 1, 0),
(1889, 251, '青羊', 1, 0),
(1890, 251, '锦江', 1, 0),
(1891, 251, '金牛', 1, 0),
(1892, 251, '武侯', 1, 0),
(1893, 251, '成华', 1, 0),
(1894, 251, '龙泉驿', 1, 0),
(1895, 251, '青白江', 1, 0),
(1896, 251, '新都', 1, 0),
(1897, 251, '温江', 1, 0),
(1898, 251, '崇州', 1, 0),
(1899, 251, '邛崃', 1, 0),
(1900, 251, '都江堰', 1, 0),
(1901, 251, '金堂', 1, 0),
(1902, 251, '双流', 1, 0),
(1903, 251, '郫县', 1, 0),
(1904, 251, '大邑', 1, 0),
(1905, 251, '蒲江', 1, 0),
(1906, 251, '新津', 1, 0),
(1907, 252, '大安', 1, 0),
(1908, 252, '贡井', 1, 0),
(1909, 252, '自流井', 1, 0),
(1910, 252, '沿滩', 1, 0),
(1911, 252, '荣县', 1, 0),
(1912, 252, '富顺', 1, 0),
(1913, 253, '东区', 1, 0),
(1914, 253, '西区', 1, 0),
(1915, 253, '仁和', 1, 0),
(1916, 253, '米易', 1, 0),
(1917, 253, '盐边', 1, 0),
(1918, 254, '江阳', 1, 0),
(1919, 254, '纳溪', 1, 0),
(1920, 254, '龙马潭', 1, 0),
(1921, 254, '泸县', 1, 0),
(1922, 254, '合江', 1, 0),
(1923, 254, '叙永', 1, 0),
(1924, 254, '古蔺', 1, 0),
(1925, 255, '旌阳', 1, 0),
(1926, 255, '什邡', 1, 0),
(1927, 255, '广汉', 1, 0),
(1928, 255, '绵竹', 1, 0),
(1929, 255, '罗江', 1, 0),
(1930, 255, '中江', 1, 0),
(1931, 256, '涪城', 1, 0),
(1932, 256, '游仙', 1, 0),
(1933, 256, '江油', 1, 0),
(1934, 256, '三台', 1, 0),
(1935, 256, '盐亭', 1, 0),
(1936, 256, '安县', 1, 0),
(1937, 256, '梓潼', 1, 0),
(1938, 256, '北川', 1, 0),
(1939, 256, '平武', 1, 0),
(1940, 257, '市中', 1, 0),
(1941, 257, '元坝', 1, 0),
(1942, 257, '朝天', 1, 0),
(1943, 257, '旺苍', 1, 0),
(1944, 257, '青川', 1, 0),
(1945, 257, '剑阁', 1, 0),
(1946, 257, '苍溪', 1, 0),
(1947, 258, '市中', 1, 0),
(1948, 258, '蓬溪', 1, 0),
(1949, 258, '射洪', 1, 0),
(1950, 258, '大英', 1, 0),
(1951, 259, '市中', 1, 0),
(1952, 259, '东兴', 1, 0),
(1953, 259, '威远', 1, 0),
(1954, 259, '资中', 1, 0),
(1955, 259, '隆昌', 1, 0),
(1956, 260, '市中', 1, 0),
(1957, 260, '沙湾', 1, 0),
(1958, 260, '五通桥', 1, 0),
(1959, 260, '金口河', 1, 0),
(1960, 260, '峨眉山', 1, 0),
(1961, 260, '犍为', 1, 0),
(1962, 260, '井研', 1, 0),
(1963, 260, '夹江', 1, 0),
(1964, 260, '沐川', 1, 0),
(1965, 260, '峨边', 1, 0),
(1966, 260, '马边', 1, 0),
(1967, 261, '顺庆', 1, 0),
(1968, 261, '高坪', 1, 0),
(1969, 261, '嘉陵', 1, 0),
(1970, 261, '阆中', 1, 0),
(1971, 261, '南部', 1, 0),
(1972, 261, '营山', 1, 0),
(1973, 261, '蓬安', 1, 0),
(1974, 261, '仪陇', 1, 0),
(1975, 261, '西充', 1, 0),
(1976, 262, '翠屏', 1, 0),
(1977, 262, '宜宾', 1, 0),
(1978, 262, '南溪', 1, 0),
(1979, 262, '江安', 1, 0),
(1980, 262, '长宁', 1, 0),
(1981, 262, '高县', 1, 0),
(1982, 262, '筠连', 1, 0),
(1983, 262, '珙县', 1, 0),
(1984, 262, '兴文', 1, 0),
(1985, 262, '屏山', 1, 0),
(1986, 263, '广安', 1, 0),
(1987, 263, '华蓥', 1, 0),
(1988, 263, '岳池', 1, 0),
(1989, 263, '武胜', 1, 0),
(1990, 263, '邻水', 1, 0),
(1991, 264, '通川', 1, 0),
(1992, 264, '万源', 1, 0),
(1993, 264, '达县', 1, 0),
(1994, 264, '宣汉', 1, 0),
(1995, 264, '开江', 1, 0),
(1996, 264, '大竹', 1, 0),
(1997, 264, '渠县', 1, 0),
(1998, 265, '东坡', 1, 0),
(1999, 265, '仁寿', 1, 0),
(2000, 265, '彭山', 1, 0),
(2001, 265, '洪雅', 1, 0),
(2002, 265, '丹棱', 1, 0),
(2003, 265, '青神', 1, 0),
(2004, 266, '雨城', 1, 0),
(2005, 266, '名山', 1, 0),
(2006, 266, '荥经', 1, 0),
(2007, 266, '汉源', 1, 0),
(2008, 266, '石棉', 1, 0),
(2009, 266, '天全', 1, 0),
(2010, 266, '芦山', 1, 0),
(2011, 266, '宝兴', 1, 0),
(2012, 267, '巴州', 1, 0),
(2013, 267, '通江', 1, 0),
(2014, 267, '南江', 1, 0),
(2015, 267, '平昌', 1, 0),
(2016, 268, '雁江', 1, 0),
(2017, 268, '简阳', 1, 0),
(2018, 268, '乐至', 1, 0),
(2019, 268, '安岳', 1, 0),
(2020, 269, '马尔康', 1, 0),
(2021, 269, '汶川', 1, 0),
(2022, 269, '理县', 1, 0),
(2023, 269, '茂县', 1, 0),
(2024, 269, '松潘', 1, 0),
(2025, 269, '九寨沟', 1, 0),
(2026, 269, '金川', 1, 0),
(2027, 269, '小金', 1, 0),
(2028, 269, '黑水', 1, 0),
(2029, 269, '壤塘', 1, 0),
(2030, 269, '阿坝', 1, 0),
(2031, 269, '若尔盖', 1, 0),
(2032, 269, '红原', 1, 0),
(2033, 270, '康定', 1, 0),
(2034, 270, '泸定', 1, 0),
(2035, 270, '丹巴', 1, 0),
(2036, 270, '九龙', 1, 0),
(2037, 270, '雅江', 1, 0),
(2038, 270, '道孚', 1, 0),
(2039, 270, '炉霍', 1, 0),
(2040, 270, '甘孜', 1, 0),
(2041, 270, '新龙', 1, 0),
(2042, 270, '德格', 1, 0),
(2043, 270, '白玉', 1, 0),
(2044, 270, '石渠', 1, 0),
(2045, 270, '色达', 1, 0),
(2046, 270, '理塘', 1, 0),
(2047, 270, '巴塘', 1, 0),
(2048, 270, '乡城', 1, 0),
(2049, 270, '稻城', 1, 0),
(2050, 270, '得荣', 1, 0),
(2051, 271, '西昌', 1, 0),
(2052, 271, '盐源', 1, 0),
(2053, 271, '德昌', 1, 0),
(2054, 271, '会理', 1, 0),
(2055, 271, '会东', 1, 0),
(2056, 271, '宁南', 1, 0),
(2057, 271, '普格', 1, 0),
(2058, 271, '布拖', 1, 0),
(2059, 271, '金阳', 1, 0),
(2060, 271, '昭觉', 1, 0),
(2061, 271, '喜德', 1, 0),
(2062, 271, '冕宁', 1, 0),
(2063, 271, '越西', 1, 0),
(2064, 271, '甘洛', 1, 0),
(2065, 271, '美姑', 1, 0),
(2066, 271, '雷波', 1, 0),
(2067, 271, '木里', 1, 0),
(2068, 272, '南明', 1, 0),
(2069, 272, '云岩', 1, 0),
(2070, 272, '花溪', 1, 0),
(2071, 272, '乌当', 1, 0),
(2072, 272, '白云', 1, 0),
(2073, 272, '小河', 1, 0),
(2074, 272, '清镇', 1, 0),
(2075, 272, '开阳', 1, 0),
(2076, 272, '修文', 1, 0),
(2077, 272, '息烽', 1, 0),
(2078, 273, '钟山', 1, 0),
(2079, 273, '盘县', 1, 0),
(2080, 273, '六枝特', 1, 0),
(2081, 273, '水城', 1, 0),
(2082, 274, '红花岗', 1, 0),
(2083, 274, '赤水', 1, 0),
(2084, 274, '仁怀', 1, 0),
(2085, 274, '遵义', 1, 0),
(2086, 274, '桐梓', 1, 0),
(2087, 274, '绥阳', 1, 0),
(2088, 274, '正安', 1, 0),
(2089, 274, '凤冈', 1, 0),
(2090, 274, '湄潭', 1, 0),
(2091, 274, '余庆', 1, 0),
(2092, 274, '习水', 1, 0),
(2093, 274, '道真', 1, 0),
(2094, 274, '务川', 1, 0),
(2095, 275, '西秀', 1, 0),
(2096, 275, '平坝', 1, 0),
(2097, 275, '普定', 1, 0),
(2098, 275, '关岭', 1, 0),
(2099, 275, '镇宁', 1, 0),
(2100, 275, '紫云', 1, 0),
(2101, 276, '铜仁', 1, 0),
(2102, 276, '江口', 1, 0),
(2103, 276, '石阡', 1, 0),
(2104, 276, '思南', 1, 0),
(2105, 276, '德江', 1, 0),
(2106, 276, '玉屏', 1, 0),
(2107, 276, '印江', 1, 0),
(2108, 276, '沿河', 1, 0),
(2109, 276, '松桃', 1, 0),
(2110, 276, '万山特', 1, 0),
(2111, 277, '毕节', 1, 0),
(2112, 277, '大方', 1, 0),
(2113, 277, '黔西', 1, 0),
(2114, 277, '金沙', 1, 0),
(2115, 277, '织金', 1, 0),
(2116, 277, '纳雍', 1, 0),
(2117, 277, '赫章', 1, 0),
(2118, 277, '威宁', 1, 0),
(2119, 278, '兴义', 1, 0),
(2120, 278, '兴仁', 1, 0),
(2121, 278, '普安', 1, 0),
(2122, 278, '晴隆', 1, 0),
(2123, 278, '贞丰', 1, 0),
(2124, 278, '望谟', 1, 0),
(2125, 278, '册亨', 1, 0),
(2126, 278, '安龙', 1, 0),
(2127, 279, '凯里', 1, 0),
(2128, 279, '黄平', 1, 0),
(2129, 279, '施秉', 1, 0),
(2130, 279, '三穗', 1, 0),
(2131, 279, '镇远', 1, 0),
(2132, 279, '岑巩', 1, 0),
(2133, 279, '天柱', 1, 0),
(2134, 279, '锦屏', 1, 0),
(2135, 279, '剑河', 1, 0),
(2136, 279, '台江', 1, 0),
(2137, 279, '黎平', 1, 0),
(2138, 279, '榕江', 1, 0),
(2139, 279, '从江', 1, 0),
(2140, 279, '雷山', 1, 0),
(2141, 279, '麻江', 1, 0),
(2142, 279, '丹寨', 1, 0),
(2143, 280, '都匀', 1, 0),
(2144, 280, '福泉', 1, 0),
(2145, 280, '荔波', 1, 0),
(2146, 280, '贵定', 1, 0),
(2147, 280, '瓮安', 1, 0),
(2148, 280, '独山', 1, 0),
(2149, 280, '平塘', 1, 0),
(2150, 280, '罗甸', 1, 0),
(2151, 280, '长顺', 1, 0),
(2152, 280, '龙里', 1, 0),
(2153, 280, '惠水', 1, 0),
(2154, 280, '三都', 1, 0),
(2155, 281, '盘龙', 1, 0),
(2156, 281, '五华', 1, 0),
(2157, 281, '官渡', 1, 0),
(2158, 281, '西山', 1, 0),
(2159, 281, '东川', 1, 0),
(2160, 281, '安宁', 1, 0),
(2161, 281, '呈贡', 1, 0),
(2162, 281, '晋宁', 1, 0),
(2163, 281, '富民', 1, 0),
(2164, 281, '宜良', 1, 0),
(2165, 281, '嵩明', 1, 0),
(2166, 281, '石林', 1, 0),
(2167, 281, '禄劝', 1, 0),
(2168, 281, '寻甸', 1, 0),
(2169, 282, '麒麟', 1, 0),
(2170, 282, '宣威', 1, 0),
(2171, 282, '马龙', 1, 0),
(2172, 282, '沾益', 1, 0),
(2173, 282, '罗平', 1, 0),
(2174, 282, '师宗', 1, 0),
(2175, 282, '陆良', 1, 0),
(2176, 282, '会泽', 1, 0),
(2177, 283, '红塔', 1, 0),
(2178, 283, '江川', 1, 0),
(2179, 283, '澄江', 1, 0),
(2180, 283, '通海', 1, 0),
(2181, 283, '华宁', 1, 0),
(2182, 283, '易门', 1, 0),
(2183, 283, '峨山', 1, 0),
(2184, 283, '新平', 1, 0),
(2185, 283, '元江', 1, 0),
(2186, 284, '隆阳', 1, 0),
(2187, 284, '施甸', 1, 0),
(2188, 284, '腾冲', 1, 0),
(2189, 284, '龙陵', 1, 0),
(2190, 284, '昌宁', 1, 0),
(2191, 285, '昭阳', 1, 0),
(2192, 285, '鲁甸', 1, 0),
(2193, 285, '巧家', 1, 0),
(2194, 285, '盐津', 1, 0),
(2195, 285, '大关', 1, 0),
(2196, 285, '永善', 1, 0),
(2197, 285, '绥江', 1, 0),
(2198, 285, '镇雄', 1, 0),
(2199, 285, '彝良', 1, 0),
(2200, 285, '威信', 1, 0),
(2201, 285, '水富', 1, 0),
(2202, 286, '思茅', 1, 0),
(2203, 286, '普洱', 1, 0),
(2204, 286, '墨江', 1, 0),
(2205, 286, '景东', 1, 0),
(2206, 286, '景谷', 1, 0),
(2207, 286, '镇沅', 1, 0),
(2208, 286, '江城', 1, 0),
(2209, 286, '孟连', 1, 0),
(2210, 286, '澜沧', 1, 0),
(2211, 286, '西盟', 1, 0),
(2212, 287, '临沧', 1, 0),
(2213, 287, '凤庆', 1, 0),
(2214, 287, '云县', 1, 0),
(2215, 287, '永德', 1, 0),
(2216, 287, '镇康', 1, 0),
(2217, 287, '双江', 1, 0),
(2218, 287, '耿马', 1, 0),
(2219, 287, '沧源', 1, 0),
(2220, 288, '丽江', 1, 0),
(2221, 288, '永胜', 1, 0),
(2222, 288, '华坪', 1, 0),
(2223, 288, '宁蒗', 1, 0),
(2224, 289, '文山', 1, 0),
(2225, 289, '砚山', 1, 0),
(2226, 289, '西畴', 1, 0),
(2227, 289, '麻栗坡', 1, 0),
(2228, 289, '马关', 1, 0),
(2229, 289, '丘北', 1, 0),
(2230, 289, '广南', 1, 0),
(2231, 289, '富宁', 1, 0),
(2232, 290, '个旧', 1, 0),
(2233, 290, '开远', 1, 0),
(2234, 290, '蒙自', 1, 0),
(2235, 290, '绿春', 1, 0),
(2236, 290, '建水', 1, 0),
(2237, 290, '石屏', 1, 0),
(2238, 290, '弥勒', 1, 0),
(2239, 290, '泸西', 1, 0),
(2240, 290, '元阳', 1, 0),
(2241, 290, '红河', 1, 0),
(2242, 290, '金平', 1, 0),
(2243, 290, '河口', 1, 0),
(2244, 290, '屏边', 1, 0),
(2245, 291, '景洪', 1, 0),
(2246, 291, '勐海', 1, 0),
(2247, 291, '勐腊', 1, 0),
(2248, 292, '楚雄', 1, 0),
(2249, 292, '双柏', 1, 0),
(2250, 292, '牟定', 1, 0),
(2251, 292, '南华', 1, 0),
(2252, 292, '姚安', 1, 0),
(2253, 292, '大姚', 1, 0),
(2254, 292, '永仁', 1, 0),
(2255, 292, '元谋', 1, 0),
(2256, 292, '武定', 1, 0),
(2257, 292, '禄丰', 1, 0),
(2258, 293, '大理', 1, 0),
(2259, 293, '祥云', 1, 0),
(2260, 293, '宾川', 1, 0),
(2261, 293, '弥渡', 1, 0),
(2262, 293, '永平', 1, 0),
(2263, 293, '云龙', 1, 0),
(2264, 293, '洱源', 1, 0),
(2265, 293, '剑川', 1, 0),
(2266, 293, '鹤庆', 1, 0),
(2267, 293, '漾濞', 1, 0),
(2268, 293, '南涧', 1, 0),
(2269, 293, '巍山', 1, 0),
(2270, 294, '潞西', 1, 0),
(2271, 294, '瑞丽', 1, 0),
(2272, 294, '梁河', 1, 0),
(2273, 294, '盈江', 1, 0),
(2274, 294, '陇川', 1, 0),
(2275, 295, '泸水', 1, 0),
(2276, 295, '福贡', 1, 0),
(2277, 295, '贡山', 1, 0),
(2278, 295, '兰坪', 1, 0),
(2279, 296, '香格里拉', 1, 0),
(2280, 296, '德钦', 1, 0),
(2281, 296, '维西', 1, 0),
(2282, 297, '城关', 1, 0),
(2283, 297, '林周', 1, 0),
(2284, 297, '当雄', 1, 0),
(2285, 297, '尼木', 1, 0),
(2286, 297, '曲水', 1, 0),
(2287, 297, '堆龙德庆', 1, 0),
(2288, 297, '达孜', 1, 0),
(2289, 297, '墨竹工卡', 1, 0),
(2290, 298, '那曲', 1, 0),
(2291, 298, '嘉黎', 1, 0),
(2292, 298, '比如', 1, 0),
(2293, 298, '聂荣', 1, 0),
(2294, 298, '安多', 1, 0),
(2295, 298, '申扎', 1, 0),
(2296, 298, '索县', 1, 0),
(2297, 298, '班戈', 1, 0),
(2298, 298, '巴青', 1, 0),
(2299, 298, '尼玛', 1, 0),
(2300, 299, '昌都', 1, 0),
(2301, 299, '江达', 1, 0),
(2302, 299, '贡觉', 1, 0),
(2303, 299, '类乌齐', 1, 0),
(2304, 299, '丁青', 1, 0),
(2305, 299, '察雅', 1, 0),
(2306, 299, '八宿', 1, 0),
(2307, 299, '左贡', 1, 0),
(2308, 299, '芒康', 1, 0),
(2309, 299, '洛隆', 1, 0),
(2310, 299, '边坝', 1, 0),
(2311, 300, '乃东', 1, 0),
(2312, 300, '扎囊', 1, 0),
(2313, 300, '贡嘎', 1, 0),
(2314, 300, '桑日', 1, 0),
(2315, 300, '琼结', 1, 0),
(2316, 300, '曲松', 1, 0),
(2317, 300, '措美', 1, 0),
(2318, 300, '洛扎', 1, 0),
(2319, 300, '加查', 1, 0),
(2320, 300, '隆子', 1, 0),
(2321, 300, '错那', 1, 0),
(2322, 300, '浪卡子', 1, 0),
(2323, 301, '日喀则', 1, 0),
(2324, 301, '南木林', 1, 0),
(2325, 301, '江孜', 1, 0),
(2326, 301, '定日', 1, 0),
(2327, 301, '萨迦', 1, 0),
(2328, 301, '拉孜', 1, 0),
(2329, 301, '昂仁', 1, 0),
(2330, 301, '谢通门', 1, 0),
(2331, 301, '白朗', 1, 0),
(2332, 301, '仁布', 1, 0),
(2333, 301, '康马', 1, 0),
(2334, 301, '定结', 1, 0),
(2335, 301, '仲巴', 1, 0),
(2336, 301, '亚东', 1, 0),
(2337, 301, '吉隆', 1, 0),
(2338, 301, '聂拉木', 1, 0),
(2339, 301, '萨嘎', 1, 0),
(2340, 301, '岗巴', 1, 0),
(2341, 302, '噶尔', 1, 0),
(2342, 302, '普兰', 1, 0),
(2343, 302, '札达', 1, 0),
(2344, 302, '日土', 1, 0),
(2345, 302, '革吉', 1, 0),
(2346, 302, '改则', 1, 0),
(2347, 302, '措勤', 1, 0),
(2348, 303, '林芝', 1, 0),
(2349, 303, '工布江达', 1, 0),
(2350, 303, '米林', 1, 0),
(2351, 303, '墨脱', 1, 0),
(2352, 303, '波密', 1, 0),
(2353, 303, '察隅', 1, 0),
(2354, 303, '朗县', 1, 0),
(2355, 304, '莲湖', 1, 0),
(2356, 304, '新城', 1, 0),
(2357, 304, '碑林', 1, 0),
(2358, 304, '灞桥', 1, 0),
(2359, 304, '未央', 1, 0),
(2360, 304, '雁塔', 1, 0),
(2361, 304, '阎良', 1, 0),
(2362, 304, '临潼', 1, 0),
(2363, 304, '长安', 1, 0),
(2364, 304, '蓝田', 1, 0),
(2365, 304, '周至', 1, 0),
(2366, 304, '户县', 1, 0),
(2367, 304, '高陵', 1, 0),
(2368, 305, '王益', 1, 0),
(2369, 305, '印台', 1, 0),
(2370, 305, '耀州', 1, 0),
(2371, 305, '宜君', 1, 0),
(2372, 306, '渭滨', 1, 0),
(2373, 306, '金台', 1, 0),
(2374, 306, '宝鸡', 1, 0),
(2375, 306, '凤翔', 1, 0),
(2376, 306, '岐山', 1, 0),
(2377, 306, '扶风', 1, 0),
(2378, 306, '眉县', 1, 0),
(2379, 306, '陇县', 1, 0),
(2380, 306, '千阳', 1, 0),
(2381, 306, '麟游', 1, 0),
(2382, 306, '凤县', 1, 0),
(2383, 306, '太白', 1, 0),
(2384, 307, '秦都', 1, 0),
(2385, 307, '杨凌', 1, 0),
(2386, 307, '渭城', 1, 0),
(2387, 307, '兴平', 1, 0),
(2388, 307, '三原', 1, 0),
(2389, 307, '泾阳', 1, 0),
(2390, 307, '乾县', 1, 0),
(2391, 307, '礼泉', 1, 0),
(2392, 307, '永寿', 1, 0),
(2393, 307, '彬县', 1, 0),
(2394, 307, '长武', 1, 0),
(2395, 307, '旬邑', 1, 0),
(2396, 307, '淳化', 1, 0),
(2397, 307, '武功', 1, 0),
(2398, 308, '临渭', 1, 0),
(2399, 308, '华阴', 1, 0),
(2400, 308, '韩城', 1, 0),
(2401, 308, '华县', 1, 0),
(2402, 308, '潼关', 1, 0),
(2403, 308, '大荔', 1, 0),
(2404, 308, '蒲城', 1, 0),
(2405, 308, '澄城', 1, 0),
(2406, 308, '白水', 1, 0),
(2407, 308, '合阳', 1, 0),
(2408, 308, '富平', 1, 0),
(2409, 309, '宝塔', 1, 0),
(2410, 309, '延长', 1, 0),
(2411, 309, '延川', 1, 0),
(2412, 309, '子长', 1, 0),
(2413, 309, '安塞', 1, 0),
(2414, 309, '志丹', 1, 0),
(2415, 309, '吴旗', 1, 0),
(2416, 309, '甘泉', 1, 0),
(2417, 309, '富县', 1, 0),
(2418, 309, '洛川', 1, 0),
(2419, 309, '宜川', 1, 0),
(2420, 309, '黄龙', 1, 0),
(2421, 309, '黄陵', 1, 0),
(2422, 310, '汉台', 1, 0),
(2423, 310, '南郑', 1, 0),
(2424, 310, '城固', 1, 0),
(2425, 310, '洋县', 1, 0),
(2426, 310, '西乡', 1, 0),
(2427, 310, '勉县', 1, 0),
(2428, 310, '宁强', 1, 0),
(2429, 310, '略阳', 1, 0),
(2430, 310, '镇巴', 1, 0),
(2431, 310, '留坝', 1, 0),
(2432, 310, '佛坪', 1, 0),
(2433, 311, '榆阳', 1, 0),
(2434, 311, '神木', 1, 0),
(2435, 311, '府谷', 1, 0),
(2436, 311, '横山', 1, 0),
(2437, 311, '靖边', 1, 0),
(2438, 311, '定边', 1, 0),
(2439, 311, '绥德', 1, 0),
(2440, 311, '米脂', 1, 0),
(2441, 311, '佳县', 1, 0),
(2442, 311, '吴堡', 1, 0),
(2443, 311, '清涧', 1, 0),
(2444, 311, '子洲', 1, 0),
(2445, 312, '汉滨', 1, 0),
(2446, 312, '汉阴', 1, 0),
(2447, 312, '石泉', 1, 0),
(2448, 312, '宁陕', 1, 0),
(2449, 312, '紫阳', 1, 0),
(2450, 312, '岚皋', 1, 0),
(2451, 312, '平利', 1, 0),
(2452, 312, '镇坪', 1, 0),
(2453, 312, '旬阳', 1, 0),
(2454, 312, '白河', 1, 0),
(2455, 313, '商州', 1, 0),
(2456, 313, '洛南', 1, 0),
(2457, 313, '丹凤', 1, 0),
(2458, 313, '商南', 1, 0),
(2459, 313, '山阳', 1, 0),
(2460, 313, '镇安', 1, 0),
(2461, 313, '柞水', 1, 0),
(2462, 314, '城关', 1, 0),
(2463, 314, '七里河', 1, 0),
(2464, 314, '西固', 1, 0),
(2465, 314, '安宁', 1, 0),
(2466, 314, '红古', 1, 0),
(2467, 314, '永登', 1, 0),
(2468, 314, '皋兰', 1, 0),
(2469, 314, '榆中', 1, 0),
(2470, 315, '金川', 1, 0),
(2471, 315, '永昌', 1, 0),
(2472, 316, '白银', 1, 0),
(2473, 316, '平川', 1, 0),
(2474, 316, '靖远', 1, 0),
(2475, 316, '会宁', 1, 0),
(2476, 316, '景泰', 1, 0),
(2477, 317, '秦城', 1, 0),
(2478, 317, '北道', 1, 0),
(2479, 317, '清水', 1, 0),
(2480, 317, '秦安', 1, 0),
(2481, 317, '甘谷', 1, 0),
(2482, 317, '武山', 1, 0),
(2483, 317, '张家川', 1, 0),
(2484, 319, '凉州', 1, 0),
(2485, 319, '民勤', 1, 0),
(2486, 319, '古浪', 1, 0),
(2487, 319, '天祝', 1, 0),
(2488, 320, '甘州', 1, 0),
(2489, 320, '民乐', 1, 0),
(2490, 320, '临泽', 1, 0),
(2491, 320, '高台', 1, 0),
(2492, 320, '山丹', 1, 0),
(2493, 320, '肃南', 1, 0),
(2494, 321, '崆峒', 1, 0),
(2495, 321, '泾川', 1, 0),
(2496, 321, '灵台', 1, 0),
(2497, 321, '崇信', 1, 0),
(2498, 321, '华亭', 1, 0),
(2499, 321, '庄浪', 1, 0),
(2500, 321, '静宁', 1, 0),
(2501, 322, '肃州', 1, 0),
(2502, 322, '玉门', 1, 0),
(2503, 322, '敦煌', 1, 0),
(2504, 322, '金塔', 1, 0),
(2505, 322, '安西', 1, 0),
(2506, 322, '肃北', 1, 0),
(2507, 322, '阿克塞', 1, 0),
(2508, 323, '西峰', 1, 0),
(2509, 323, '庆城', 1, 0),
(2510, 323, '环县', 1, 0),
(2511, 323, '华池', 1, 0),
(2512, 323, '合水', 1, 0),
(2513, 323, '正宁', 1, 0),
(2514, 323, '宁县', 1, 0),
(2515, 323, '镇原', 1, 0),
(2516, 324, '定西', 1, 0),
(2517, 324, '通渭', 1, 0),
(2518, 324, '临洮', 1, 0),
(2519, 324, '漳县', 1, 0),
(2520, 324, '岷县', 1, 0),
(2521, 324, '渭源', 1, 0),
(2522, 324, '陇西', 1, 0),
(2523, 325, '成县', 1, 0),
(2524, 325, '武都', 1, 0),
(2525, 325, '宕昌', 1, 0),
(2526, 325, '康县', 1, 0),
(2527, 325, '文县', 1, 0),
(2528, 325, '西和', 1, 0),
(2529, 325, '礼县', 1, 0),
(2530, 325, '两当', 1, 0),
(2531, 325, '徽县', 1, 0),
(2532, 326, '合作', 1, 0),
(2533, 326, '临潭', 1, 0),
(2534, 326, '卓尼', 1, 0),
(2535, 326, '舟曲', 1, 0),
(2536, 326, '迭部', 1, 0),
(2537, 326, '玛曲', 1, 0),
(2538, 326, '碌曲', 1, 0),
(2539, 326, '夏河', 1, 0),
(2540, 327, '临夏', 1, 0),
(2541, 327, '临夏', 1, 0),
(2542, 327, '康乐', 1, 0),
(2543, 327, '永靖', 1, 0),
(2544, 327, '广河', 1, 0),
(2545, 327, '和政', 1, 0),
(2546, 327, '东乡族自治县', 1, 0),
(2547, 327, '积石山', 1, 0),
(2548, 328, '城中', 1, 0),
(2549, 328, '城东', 1, 0),
(2550, 328, '城西', 1, 0),
(2551, 328, '城北', 1, 0),
(2552, 328, '大通', 1, 0),
(2553, 328, '湟源', 1, 0),
(2554, 328, '湟中', 1, 0),
(2555, 329, '平安', 1, 0),
(2556, 329, '乐都', 1, 0),
(2557, 329, '民和', 1, 0),
(2558, 329, '互助', 1, 0),
(2559, 329, '化隆', 1, 0),
(2560, 329, '循化', 1, 0),
(2561, 330, '海晏', 1, 0),
(2562, 330, '祁连', 1, 0),
(2563, 330, '刚察', 1, 0),
(2564, 330, '门源', 1, 0),
(2565, 331, '同仁', 1, 0),
(2566, 331, '尖扎', 1, 0),
(2567, 331, '泽库', 1, 0),
(2568, 331, '河南', 1, 0),
(2569, 332, '共和', 1, 0),
(2570, 332, '同德', 1, 0),
(2571, 332, '贵德', 1, 0),
(2572, 332, '兴海', 1, 0),
(2573, 332, '贵南', 1, 0),
(2574, 333, '玛沁', 1, 0),
(2575, 333, '班玛', 1, 0),
(2576, 333, '甘德', 1, 0),
(2577, 333, '达日', 1, 0),
(2578, 333, '久治', 1, 0),
(2579, 333, '玛多', 1, 0),
(2580, 334, '玉树', 1, 0),
(2581, 334, '杂多', 1, 0),
(2582, 334, '称多', 1, 0),
(2583, 334, '治多', 1, 0),
(2584, 334, '囊谦', 1, 0),
(2585, 334, '曲麻莱', 1, 0),
(2586, 335, '德令哈', 1, 0),
(2587, 335, '格尔木', 1, 0),
(2588, 335, '乌兰', 1, 0),
(2589, 335, '都兰', 1, 0),
(2590, 335, '天峻', 1, 0),
(2591, 336, '西夏', 1, 0),
(2592, 336, '贺兰', 1, 0),
(2593, 336, '新城', 1, 0),
(2594, 336, '郊区', 1, 0),
(2595, 337, '大武口', 1, 0),
(2596, 337, '石嘴山', 1, 0),
(2597, 337, '平罗', 1, 0),
(2598, 337, '陶乐', 1, 0),
(2599, 337, '惠农', 1, 0),
(2600, 338, '利通', 1, 0),
(2601, 338, '青铜峡', 1, 0),
(2602, 338, '中卫', 1, 0),
(2603, 338, '中宁', 1, 0),
(2604, 338, '盐池', 1, 0),
(2605, 338, '同心', 1, 0),
(2606, 339, '原州', 1, 0),
(2607, 339, '海原', 1, 0),
(2608, 339, '西吉', 1, 0),
(2609, 339, '隆德', 1, 0),
(2610, 339, '泾源', 1, 0),
(2611, 339, '彭阳', 1, 0),
(2612, 340, '天山', 1, 0),
(2613, 340, '沙依巴克', 1, 0),
(2614, 340, '新市', 1, 0),
(2615, 340, '水磨沟', 1, 0),
(2616, 340, '头屯河', 1, 0),
(2617, 340, '达坂城', 1, 0),
(2618, 340, '乌鲁木齐', 1, 0),
(2619, 341, '克拉玛依', 1, 0),
(2620, 341, '独山子', 1, 0),
(2621, 341, '白碱滩', 1, 0),
(2622, 341, '乌尔禾', 1, 0),
(2623, 343, '吐鲁番', 1, 0),
(2624, 343, '鄯善', 1, 0),
(2625, 343, '托克逊', 1, 0),
(2626, 344, '哈密', 1, 0),
(2627, 344, '伊吾', 1, 0),
(2628, 344, '巴里坤', 1, 0),
(2629, 345, '和田', 1, 0),
(2630, 345, '和田', 1, 0),
(2631, 345, '墨玉', 1, 0),
(2632, 345, '皮山', 1, 0),
(2633, 345, '洛浦', 1, 0),
(2634, 345, '策勒', 1, 0),
(2635, 345, '于田', 1, 0),
(2636, 345, '民丰', 1, 0),
(2637, 346, '阿克苏', 1, 0),
(2638, 346, '温宿', 1, 0),
(2639, 346, '库车', 1, 0),
(2640, 346, '沙雅', 1, 0),
(2641, 346, '新和', 1, 0),
(2642, 346, '拜城', 1, 0),
(2643, 346, '乌什', 1, 0),
(2644, 346, '阿瓦提', 1, 0),
(2645, 346, '柯坪', 1, 0),
(2646, 347, '喀什', 1, 0),
(2647, 347, '疏附', 1, 0),
(2648, 347, '疏勒', 1, 0),
(2649, 347, '英吉沙', 1, 0),
(2650, 347, '泽普', 1, 0),
(2651, 347, '莎车', 1, 0),
(2652, 347, '叶城', 1, 0),
(2653, 347, '麦盖提', 1, 0),
(2654, 347, '岳普湖', 1, 0),
(2655, 347, '伽师', 1, 0),
(2656, 347, '巴楚', 1, 0),
(2657, 347, '塔什库尔干塔吉克', 1, 0),
(2658, 348, '阿克陶', 1, 0),
(2659, 348, '阿合奇', 1, 0),
(2660, 348, '乌恰', 1, 0),
(2661, 349, '库尔勒', 1, 0),
(2662, 349, '轮台', 1, 0),
(2663, 349, '尉犁', 1, 0),
(2664, 349, '若羌', 1, 0),
(2665, 349, '且末', 1, 0),
(2666, 349, '和静', 1, 0),
(2667, 349, '和硕', 1, 0),
(2668, 349, '博湖', 1, 0),
(2669, 349, '焉耆', 1, 0),
(2670, 350, '昌吉', 1, 0),
(2671, 350, '阜康', 1, 0),
(2672, 350, '米泉', 1, 0),
(2673, 350, '呼图壁', 1, 0),
(2674, 350, '玛纳斯', 1, 0),
(2675, 350, '奇台', 1, 0),
(2676, 350, '吉木萨尔', 1, 0),
(2677, 350, '木垒', 1, 0),
(2678, 351, '博乐', 1, 0),
(2679, 351, '精河', 1, 0),
(2680, 351, '温泉', 1, 0),
(2681, 352, '奎屯', 1, 0),
(2682, 352, '伊宁', 1, 0),
(2683, 352, '霍城', 1, 0),
(2684, 352, '巩留', 1, 0),
(2685, 352, '新源', 1, 0),
(2686, 352, '昭苏', 1, 0),
(2687, 352, '特克斯', 1, 0),
(2688, 352, '尼勒克', 1, 0),
(2689, 352, '察布查尔锡伯', 1, 0),
(2690, 353, '塔城', 1, 0),
(2691, 353, '乌苏', 1, 0),
(2692, 353, '额敏', 1, 0),
(2693, 353, '沙湾', 1, 0),
(2694, 353, '托里', 1, 0),
(2695, 353, '裕民', 1, 0),
(2696, 353, '和布克赛尔', 1, 0),
(2697, 354, '阿勒泰', 1, 0),
(2698, 354, '布尔津', 1, 0),
(2699, 354, '富蕴', 1, 0),
(2700, 354, '福海', 1, 0),
(2701, 354, '哈巴河', 1, 0),
(2702, 354, '青河', 1, 0),
(2703, 354, '吉木乃', 1, 0),
(2704, 355, '黄浦', 1, 0),
(2705, 355, '卢湾', 1, 0),
(2706, 355, '徐汇', 1, 0),
(2707, 355, '长宁', 1, 0),
(2708, 355, '静安', 1, 0),
(2709, 355, '普陀', 1, 0),
(2710, 355, '闸北', 1, 0),
(2711, 355, '虹口', 1, 0),
(2712, 355, '杨浦', 1, 0),
(2713, 355, '宝山', 1, 0),
(2714, 355, '闵行', 1, 0),
(2715, 355, '嘉定', 1, 0),
(2716, 355, '浦东新', 1, 0),
(2717, 355, '松江', 1, 0),
(2718, 355, '金山', 1, 0),
(2719, 355, '青浦', 1, 0),
(2720, 355, '南汇', 1, 0),
(2721, 355, '奉贤', 1, 0),
(2722, 356, '崇明', 1, 0),
(2723, 357, '渝中', 1, 0),
(2724, 357, '大渡口', 1, 0),
(2725, 357, '江北', 1, 0),
(2726, 357, '沙坪坝', 1, 0),
(2727, 357, '九龙坡', 1, 0),
(2728, 357, '南岸', 1, 0),
(2729, 357, '北碚', 1, 0),
(2730, 357, '万盛', 1, 0),
(2731, 357, '双桥', 1, 0),
(2732, 357, '渝北', 1, 0),
(2733, 357, '巴南', 1, 0),
(2734, 357, '万州', 1, 0),
(2735, 357, '涪陵', 1, 0),
(2736, 357, '黔江', 1, 0),
(2737, 357, '长寿', 1, 0),
(2738, 358, '永川', 1, 0),
(2739, 358, '合川', 1, 0),
(2740, 358, '江津', 1, 0),
(2741, 358, '南川', 1, 0),
(2742, 359, '綦江', 1, 0),
(2743, 359, '潼南', 1, 0),
(2744, 359, '荣昌', 1, 0),
(2745, 359, '璧山', 1, 0),
(2746, 359, '大足', 1, 0),
(2747, 359, '铜梁', 1, 0),
(2748, 359, '梁平', 1, 0),
(2749, 359, '城口', 1, 0),
(2750, 359, '垫江', 1, 0),
(2751, 359, '武隆', 1, 0),
(2752, 359, '丰都', 1, 0),
(2753, 359, '奉节', 1, 0),
(2754, 359, '开县', 1, 0),
(2755, 359, '云阳', 1, 0),
(2756, 359, '忠县', 1, 0),
(2757, 359, '巫溪', 1, 0),
(2758, 359, '巫山', 1, 0),
(2759, 359, '石柱', 1, 0),
(2760, 359, '秀山', 1, 0),
(2761, 359, '酉阳', 1, 0),
(2762, 359, '彭水', 1, 0),
(2763, 98, '扬中', 1, 0),
(2764, 53, '沈河', 1, 0),
(2765, 130, '鼓楼', 1, 0),
(2766, 251, '彭州', 1, 0),
(2767, 214, '福田', 1, 0),
(2768, 234, '青秀', 1, 0),
(2769, 4225, '东城', 1, 0),
(2770, 4225, '丰台', 1, 0),
(2771, 4225, '大兴', 1, 0),
(2772, 4225, '宣武', 1, 0),
(2773, 4225, '密云', 1, 0),
(2774, 4225, '崇文', 1, 0),
(2775, 4225, '平谷', 1, 0),
(2776, 4225, '延庆', 1, 0),
(2777, 4225, '怀柔', 1, 0),
(2778, 4225, '房山', 1, 0),
(2779, 4225, '昌平', 1, 0),
(2780, 4225, '朝阳', 1, 0),
(2781, 4225, '海淀', 1, 0),
(2782, 4225, '石景山', 1, 0),
(2783, 4225, '西城', 1, 0),
(2784, 4225, '通州', 1, 0),
(2785, 4225, '顺义', 1, 0),
(2786, 4225, '门头沟', 1, 0),
(2787, 158, '兖州区', 1, 0),
(2788, 158, '任城区', 1, 0),
(2789, 158, '高新区', 1, 0),
(2790, 158, '太白湖新区', 1, 0),
(2791, 158, '济宁经济技术开发区', 1, 0),
(2792, 158, '嘉祥县', 1, 0),
(2793, 158, '汶上县', 1, 0),
(2794, 158, '泗水县', 1, 0),
(2795, 158, '梁山县', 1, 0),
(2796, 158, '曲阜市', 1, 0),
(2797, 158, '微山县', 1, 0),
(2798, 158, '邹城市', 1, 0),
(2799, 158, '鱼台县', 1, 0),
(2800, 158, '金乡县', 1, 0),
(2801, 222, '莞城区', 1, 0),
(2802, 222, '东城区', 1, 0),
(2803, 222, '南城区', 1, 0),
(2804, 222, '万江区', 1, 0),
(2805, 223, '石岐区', 1, 0),
(2806, 223, '东区', 1, 0),
(2807, 223, '西区', 1, 0),
(2808, 223, '南区', 1, 0),
(2809, 223, '火炬区', 1, 0),
(2810, 223, '五桂山区', 1, 0),
(2811, 249, '吉阳区', 1, 0),
(2812, 249, '崖州区', 1, 0),
(2813, 249, '海棠区', 1, 0),
(2814, 249, '天涯区', 1, 0),
(2815, 318, '雄关区', 1, 0),
(2816, 318, '长城区', 1, 0),
(2817, 318, '镜铁区', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `oc_country`
--

DROP TABLE IF EXISTS `oc_country`;
CREATE TABLE `oc_country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

--
-- 转存表中的数据 `oc_country`
--

INSERT INTO `oc_country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES
(34, '台湾', 'tw', 'TAI', '', 0, 1),
(32, '香港', 'xg', 'HKG', '', 0, 1),
(31, '新疆', 'xj', 'XIN', '', 0, 1),
(30, '宁夏', 'nx', 'NXA', '', 0, 1),
(29, '青海', 'qh', 'QIH', '', 0, 1),
(28, '甘肃', 'gs', 'GAN', '', 0, 1),
(27, '陕西', 'sx', 'SHA', '', 0, 1),
(26, '西藏', 'xc', 'TIB', '', 0, 1),
(25, '云南', 'yn', 'YUN', '', 0, 1),
(24, '贵州', 'gz', 'GUI', '', 0, 1),
(23, '四川', 'sc', 'SCH', '', 0, 1),
(22, '重庆', 'cq', 'CHQ', '', 0, 1),
(21, '海南', 'hn', 'HAI', '', 0, 1),
(20, '广西', 'gx', 'GXI', '', 0, 1),
(19, '广东', 'gd', 'GUD', '', 0, 1),
(18, '湖南', 'hn', 'HUN', '', 0, 1),
(17, '湖北', 'hb', 'HUB', '', 0, 1),
(16, '河南', 'hn', 'HEN', '', 0, 1),
(15, '山东', 'sd', 'SHD', '', 0, 1),
(14, '江西', 'jx', 'JXI', '', 0, 1),
(13, '福建', 'fj', 'FUJ', '', 0, 1),
(12, '安徽', 'ah', 'ANH', '', 0, 1),
(11, '浙江', 'zj', 'ZHJ', '', 0, 1),
(9, '上海', 'sh', 'SHH', '', 0, 1),
(8, '黑龙江', 'hl', 'HLJ', '', 0, 1),
(7, '吉林', 'jl', 'JIL', '', 0, 1),
(4, '山西', 'sx', 'SHX', '', 0, 1),
(5, '内蒙古', 'nm', 'NMG', '', 0, 1),
(6, '辽宁', 'ln', 'LIA', '', 0, 1),
(3, '河北', 'hb', 'HEB', '', 0, 1),
(2, '天津', 'tj', 'TAJ', '', 0, 1),
(1, '北京', 'bj', 'BEJ', '', 0, 1),
(10, '江苏', 'js', 'JSU', '', 0, 1),
(33, '澳门', 'am', 'MAC', '', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `oc_coupon`
--

DROP TABLE IF EXISTS `oc_coupon`;
CREATE TABLE `oc_coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(10) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `oc_coupon`
--

INSERT INTO `oc_coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`) VALUES
(4, '-10% Discount', '2222', 'P', '10.0000', 0, 0, '0.0000', '2014-01-01', '2020-01-01', 10, '10', 0, '2009-01-27 13:55:03'),
(5, 'Free Shipping', '3333', 'P', '0.0000', 0, 1, '100.0000', '2014-01-01', '2014-02-01', 10, '10', 0, '2009-03-14 21:13:53'),
(6, '-10.00 Discount', '1111', 'F', '10.0000', 0, 0, '10.0000', '2014-01-01', '2020-01-01', 100000, '10000', 0, '2009-03-14 21:15:18');

-- --------------------------------------------------------

--
-- 表的结构 `oc_coupon_category`
--

DROP TABLE IF EXISTS `oc_coupon_category`;
CREATE TABLE `oc_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_coupon_history`
--

DROP TABLE IF EXISTS `oc_coupon_history`;
CREATE TABLE `oc_coupon_history` (
  `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_coupon_product`
--

DROP TABLE IF EXISTS `oc_coupon_product`;
CREATE TABLE `oc_coupon_product` (
  `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_currency`
--

DROP TABLE IF EXISTS `oc_currency`;
CREATE TABLE `oc_currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` float(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `oc_currency`
--

INSERT INTO `oc_currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(4, '人民币', 'CNY', '￥', '', '2', 1.00000000, 1, '2015-12-10 22:19:57');

-- --------------------------------------------------------

--
-- 表的结构 `oc_customer`
--

DROP TABLE IF EXISTS `oc_customer`;
CREATE TABLE `oc_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_group_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `safe` tinyint(1) NOT NULL,
  `token` text NOT NULL,
  `date_added` datetime NOT NULL,
  `qq_openid` varchar(50) DEFAULT NULL,
  `weibo_uid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_customer_activity`
--

DROP TABLE IF EXISTS `oc_customer_activity`;
CREATE TABLE `oc_customer_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=161 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_customer_group`
--

DROP TABLE IF EXISTS `oc_customer_group`;
CREATE TABLE `oc_customer_group` (
  `customer_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `approval` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`customer_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `oc_customer_group`
--

INSERT INTO `oc_customer_group` (`customer_group_id`, `approval`, `sort_order`) VALUES
(1, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `oc_customer_group_description`
--

DROP TABLE IF EXISTS `oc_customer_group_description`;
CREATE TABLE `oc_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`customer_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_customer_group_description`
--

INSERT INTO `oc_customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`) VALUES
(1, 2, 'Default', 'test');

-- --------------------------------------------------------

--
-- 表的结构 `oc_customer_history`
--

DROP TABLE IF EXISTS `oc_customer_history`;
CREATE TABLE `oc_customer_history` (
  `customer_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_customer_ip`
--

DROP TABLE IF EXISTS `oc_customer_ip`;
CREATE TABLE `oc_customer_ip` (
  `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_customer_login`
--

DROP TABLE IF EXISTS `oc_customer_login`;
CREATE TABLE `oc_customer_login` (
  `customer_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`customer_login_id`),
  KEY `email` (`email`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_customer_online`
--

DROP TABLE IF EXISTS `oc_customer_online`;
CREATE TABLE `oc_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_customer_reward`
--

DROP TABLE IF EXISTS `oc_customer_reward`;
CREATE TABLE `oc_customer_reward` (
  `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_reward_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `oc_customer_reward`
--

INSERT INTO `oc_customer_reward` (`customer_reward_id`, `customer_id`, `order_id`, `description`, `points`, `date_added`) VALUES
(1, 6, 0, '', 2000, '2016-02-14 11:00:05');

-- --------------------------------------------------------

--
-- 表的结构 `oc_customer_transaction`
--

DROP TABLE IF EXISTS `oc_customer_transaction`;
CREATE TABLE `oc_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_customer_wishlist`
--

DROP TABLE IF EXISTS `oc_customer_wishlist`;
CREATE TABLE `oc_customer_wishlist` (
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_id`,`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_custom_field`
--

DROP TABLE IF EXISTS `oc_custom_field`;
CREATE TABLE `oc_custom_field` (
  `custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `location` varchar(7) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `oc_custom_field`
--

INSERT INTO `oc_custom_field` (`custom_field_id`, `type`, `value`, `location`, `status`, `sort_order`) VALUES
(1, 'text', '', 'address', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `oc_custom_field_customer_group`
--

DROP TABLE IF EXISTS `oc_custom_field_customer_group`;
CREATE TABLE `oc_custom_field_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_custom_field_customer_group`
--

INSERT INTO `oc_custom_field_customer_group` (`custom_field_id`, `customer_group_id`, `required`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `oc_custom_field_description`
--

DROP TABLE IF EXISTS `oc_custom_field_description`;
CREATE TABLE `oc_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_custom_field_description`
--

INSERT INTO `oc_custom_field_description` (`custom_field_id`, `language_id`, `name`) VALUES
(1, 2, '手机号码');

-- --------------------------------------------------------

--
-- 表的结构 `oc_custom_field_value`
--

DROP TABLE IF EXISTS `oc_custom_field_value`;
CREATE TABLE `oc_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_custom_field_value_description`
--

DROP TABLE IF EXISTS `oc_custom_field_value_description`;
CREATE TABLE `oc_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_download`
--

DROP TABLE IF EXISTS `oc_download`;
CREATE TABLE `oc_download` (
  `download_id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(128) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`download_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_download_description`
--

DROP TABLE IF EXISTS `oc_download_description`;
CREATE TABLE `oc_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`download_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_event`
--

DROP TABLE IF EXISTS `oc_event`;
CREATE TABLE `oc_event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `trigger` text NOT NULL,
  `action` text NOT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `oc_event`
--

INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`) VALUES
(1, 'voucher', 'post.order.history.add', 'total/voucher/send');

-- --------------------------------------------------------

--
-- 表的结构 `oc_extension`
--

DROP TABLE IF EXISTS `oc_extension`;
CREATE TABLE `oc_extension` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=36 ;

--
-- 转存表中的数据 `oc_extension`
--

INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES
(1, 'payment', 'cod'),
(2, 'total', 'shipping'),
(3, 'total', 'sub_total'),
(22, 'captcha', 'basic_captcha'),
(5, 'total', 'total'),
(6, 'module', 'banner'),
(7, 'module', 'carousel'),
(8, 'total', 'credit'),
(9, 'shipping', 'flat'),
(10, 'total', 'handling'),
(11, 'total', 'low_order_fee'),
(12, 'total', 'coupon'),
(13, 'module', 'category'),
(14, 'module', 'account'),
(15, 'total', 'reward'),
(16, 'total', 'voucher'),
(17, 'payment', 'free_checkout'),
(18, 'module', 'featured'),
(19, 'module', 'slideshow'),
(20, 'shipping', 'free'),
(21, 'payment', 'bank_transfer'),
(23, 'captcha', 'basic_captcha'),
(24, 'feed', 'google_sitemap'),
(25, 'feed', 'google_sitemap'),
(29, 'captcha', 'google_captcha'),
(33, 'module', 'latest'),
(34, 'module', 'bestseller'),
(35, 'module', 'special');

-- --------------------------------------------------------

--
-- 表的结构 `oc_filter`
--

DROP TABLE IF EXISTS `oc_filter`;
CREATE TABLE `oc_filter` (
  `filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_filter_description`
--

DROP TABLE IF EXISTS `oc_filter_description`;
CREATE TABLE `oc_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_filter_group`
--

DROP TABLE IF EXISTS `oc_filter_group`;
CREATE TABLE `oc_filter_group` (
  `filter_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_filter_group_description`
--

DROP TABLE IF EXISTS `oc_filter_group_description`;
CREATE TABLE `oc_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_geo_zone`
--

DROP TABLE IF EXISTS `oc_geo_zone`;
CREATE TABLE `oc_geo_zone` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_modified` datetime NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `oc_geo_zone`
--

INSERT INTO `oc_geo_zone` (`geo_zone_id`, `name`, `description`, `date_modified`, `date_added`) VALUES
(3, 'UK VAT Zone', 'UK VAT', '2015-12-10 18:41:29', '2009-01-06 23:26:25'),
(4, 'UK Shipping', 'UK Shipping Zones', '2015-12-10 18:40:45', '2009-06-23 01:14:53');

-- --------------------------------------------------------

--
-- 表的结构 `oc_information`
--

DROP TABLE IF EXISTS `oc_information`;
CREATE TABLE `oc_information` (
  `information_id` int(11) NOT NULL AUTO_INCREMENT,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`information_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `oc_information`
--

INSERT INTO `oc_information` (`information_id`, `bottom`, `sort_order`, `status`) VALUES
(3, 1, 3, 1),
(4, 1, 1, 1),
(5, 1, 4, 1),
(6, 1, 2, 1);

-- --------------------------------------------------------

--
-- 表的结构 `oc_information_description`
--

DROP TABLE IF EXISTS `oc_information_description`;
CREATE TABLE `oc_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`information_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_information_description`
--

INSERT INTO `oc_information_description` (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(4, 2, '关于我们', '&lt;p&gt;&lt;a href=&quot;http://www.opencart.cn/&quot; target=&quot;_blank&quot; style=&quot;word-wrap: break-word; outline: none; color: rgb(51, 51, 51); font-family: ''Microsoft yahei'', 微软雅黑, Arial, Helvetica, sans-serif, 宋体; font-size: 14px; line-height: 24px; text-indent: 30px; background-color: rgb(242, 242, 242);&quot;&gt;【OpenCart中文网站】&lt;/a&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: ''Microsoft yahei'', 微软雅黑, Arial, Helvetica, sans-serif, 宋体; font-size: 14px; line-height: 24px; text-indent: 30px; background-color: rgb(242, 242, 242);&quot;&gt;是opencart.com已认证的合作伙伴，在中国地区支持OpenCart软件的最大社区，我们的目的是支持OpenCart开源软件在中国地区的发展，并为OpenCart软件爱好者提供交流的网络平台，我们专注于OpenCart开发设计、定制等。&lt;/span&gt;&lt;br&gt;&lt;/p&gt;\r\n', '关于我们', '', ''),
(5, 2, '条款及条件', '&lt;p&gt;\r\n	条款及条件&lt;/p&gt;\r\n', '条款及条件', '', ''),
(3, 2, '隐私政策', '&lt;p&gt;\r\n	隐私政策&lt;/p&gt;\r\n', '隐私政策', '', ''),
(6, 2, '最新公告', '&lt;p&gt;\r\n	最新公告&lt;/p&gt;\r\n', '最新公告', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `oc_information_to_layout`
--

DROP TABLE IF EXISTS `oc_information_to_layout`;
CREATE TABLE `oc_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_information_to_layout`
--

INSERT INTO `oc_information_to_layout` (`information_id`, `store_id`, `layout_id`) VALUES
(4, 0, 0),
(5, 0, 0),
(3, 0, 0),
(6, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `oc_information_to_store`
--

DROP TABLE IF EXISTS `oc_information_to_store`;
CREATE TABLE `oc_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_information_to_store`
--

INSERT INTO `oc_information_to_store` (`information_id`, `store_id`) VALUES
(3, 0),
(4, 0),
(5, 0),
(6, 0);

-- --------------------------------------------------------

--
-- 表的结构 `oc_language`
--

DROP TABLE IF EXISTS `oc_language`;
CREATE TABLE `oc_language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `oc_language`
--

INSERT INTO `oc_language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `sort_order`, `status`) VALUES
(2, '简体中文', 'zh_CN', 'zh_CN.UTF-8,zh_CN,zh-cn,china', 'cn.png', 'zh-CN', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `oc_layout`
--

DROP TABLE IF EXISTS `oc_layout`;
CREATE TABLE `oc_layout` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`layout_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- 转存表中的数据 `oc_layout`
--

INSERT INTO `oc_layout` (`layout_id`, `name`) VALUES
(1, 'Home'),
(2, 'Product'),
(3, 'Category'),
(4, 'Default'),
(5, 'Manufacturer'),
(6, 'Account'),
(7, 'Checkout'),
(8, 'Contact'),
(9, 'Sitemap'),
(10, 'Affiliate'),
(11, 'Information'),
(12, 'Compare'),
(13, 'Search');

-- --------------------------------------------------------

--
-- 表的结构 `oc_layout_module`
--

DROP TABLE IF EXISTS `oc_layout_module`;
CREATE TABLE `oc_layout_module` (
  `layout_module_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `position` varchar(14) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`layout_module_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=503 ;

--
-- 转存表中的数据 `oc_layout_module`
--

INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES
(2, 4, '0', 'content_top', 0),
(3, 4, '0', 'content_top', 1),
(20, 5, '0', 'column_left', 2),
(69, 10, 'affiliate', 'column_right', 1),
(202, 3, 'category', 'column_left', 1),
(201, 3, 'banner.30', 'column_left', 2),
(79, 6, 'account', 'column_right', 2),
(501, 1, 'slideshow.27', 'content_top', 1),
(500, 1, 'latest.32', 'content_top', 5),
(499, 1, 'banner.36', 'content_top', 4),
(498, 1, 'banner.37', 'content_top', 6),
(497, 1, 'featured.35', 'content_top', 2),
(502, 1, 'special.34', 'content_top', 7);

-- --------------------------------------------------------

--
-- 表的结构 `oc_layout_route`
--

DROP TABLE IF EXISTS `oc_layout_route`;
CREATE TABLE `oc_layout_route` (
  `layout_route_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(255) NOT NULL,
  PRIMARY KEY (`layout_route_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=145 ;

--
-- 转存表中的数据 `oc_layout_route`
--

INSERT INTO `oc_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(56, 6, 0, 'account/%'),
(17, 10, 0, 'affiliate/%'),
(91, 3, 0, 'product/category'),
(144, 1, 0, 'common/home'),
(97, 2, 0, 'product/product'),
(24, 11, 0, 'information/information'),
(23, 7, 0, 'checkout/%'),
(31, 8, 0, 'information/contact'),
(32, 9, 0, 'information/sitemap'),
(34, 4, 0, ''),
(45, 5, 0, 'product/manufacturer'),
(52, 12, 0, 'product/compare'),
(53, 13, 0, 'product/search');

-- --------------------------------------------------------

--
-- 表的结构 `oc_length_class`
--

DROP TABLE IF EXISTS `oc_length_class`;
CREATE TABLE `oc_length_class` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL,
  PRIMARY KEY (`length_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `oc_length_class`
--

INSERT INTO `oc_length_class` (`length_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '10.00000000'),
(3, '0.39370000');

-- --------------------------------------------------------

--
-- 表的结构 `oc_length_class_description`
--

DROP TABLE IF EXISTS `oc_length_class_description`;
CREATE TABLE `oc_length_class_description` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`length_class_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `oc_length_class_description`
--

INSERT INTO `oc_length_class_description` (`length_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 2, '厘米', 'cm'),
(2, 2, '毫米', 'mm'),
(3, 2, '英寸', 'in');

-- --------------------------------------------------------

--
-- 表的结构 `oc_location`
--

DROP TABLE IF EXISTS `oc_location`;
CREATE TABLE `oc_location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `geocode` varchar(32) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `open` text NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_manufacturer`
--

DROP TABLE IF EXISTS `oc_manufacturer`;
CREATE TABLE `oc_manufacturer` (
  `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `oc_manufacturer`
--

INSERT INTO `oc_manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`) VALUES
(5, 'HTC', 'catalog/demo/htc_logo.jpg', 0),
(6, 'Palm', 'catalog/demo/palm_logo.jpg', 0),
(7, 'Hewlett-Packard', 'catalog/demo/hp_logo.jpg', 0),
(8, 'Apple', 'catalog/demo/apple_logo.jpg', 0),
(9, 'Canon', 'catalog/demo/canon_logo.jpg', 0),
(10, 'Sony', 'catalog/demo/sony_logo.jpg', 0);

-- --------------------------------------------------------

--
-- 表的结构 `oc_manufacturer_to_store`
--

DROP TABLE IF EXISTS `oc_manufacturer_to_store`;
CREATE TABLE `oc_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`manufacturer_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_manufacturer_to_store`
--

INSERT INTO `oc_manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0);

-- --------------------------------------------------------

--
-- 表的结构 `oc_marketing`
--

DROP TABLE IF EXISTS `oc_marketing`;
CREATE TABLE `oc_marketing` (
  `marketing_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `code` varchar(64) NOT NULL,
  `clicks` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`marketing_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_modification`
--

DROP TABLE IF EXISTS `oc_modification`;
CREATE TABLE `oc_modification` (
  `modification_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `author` varchar(64) NOT NULL,
  `version` varchar(32) NOT NULL,
  `link` varchar(255) NOT NULL,
  `xml` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`modification_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `oc_modification`
--

INSERT INTO `oc_modification` (`modification_id`, `name`, `code`, `author`, `version`, `link`, `xml`, `status`, `date_added`) VALUES
(1, '无需FTP配置使用OCMOD方式上传安装扩充功能', 'noftp_ocmod', 'opencart.cn', '1.1.1', 'http://www.opencart.cn', '<modification>\r\n    <name>无需FTP配置使用OCMOD方式上传安装扩充功能</name>\r\n	<version>1.1.1</version>\r\n	<link>http://www.opencart.cn</link>\r\n	<author>opencart.cn</author>\r\n	<code>noftp_ocmod</code>\r\n\r\n	<file path="admin/controller/extension/installer.php">\r\n		<operation>\r\n			<search ><![CDATA[''url''  => str_replace(''&amp;'', ''&'', $this->url->link(''extension/installer/ftp'', ''token='' . $this->session->data[''token''], ''SSL'')),]]></search>\r\n			<add position="replace"><![CDATA[''url''  => str_replace(''&amp;'', ''&'', $this->url->link(''extension/installer/localcopy'', ''token='' . $this->session->data[''token''], ''SSL'')),]]></add>\r\n		</operation>\r\n\r\n		<operation>\r\n			<search><![CDATA[public function unzip() {]]></search>\r\n			<add position="before"><![CDATA[			\r\n	public function localcopy() {\r\n		$this->load->language(''extension/installer'');\r\n\r\n		$json = array();\r\n\r\n		if (!$this->user->hasPermission(''modify'', ''extension/installer'')) {\r\n			$json[''error''] = $this->language->get(''error_permission'');\r\n		}\r\n\r\n        \r\n        $directory = DIR_UPLOAD  . str_replace(array(''../'', ''..\\\\'', ''..''), '''', $this->request->post[''path'']) . ''/upload/'';\r\n        \r\n\r\n		if (!is_dir($directory)) {\r\n			$json[''error''] = $this->language->get(''error_directory'');\r\n		}\r\n\r\n		if (!$json) {\r\n			// Get a list of files ready to upload\r\n			$files = array();\r\n\r\n			$path = array($directory . ''*'');\r\n\r\n			while (count($path) != 0) {\r\n				$next = array_shift($path);\r\n\r\n				foreach (glob($next) as $file) {\r\n					if (is_dir($file)) {\r\n						$path[] = $file . ''/*'';\r\n					}\r\n\r\n					$files[] = $file;\r\n				}\r\n			}\r\n\r\n			$root = dirname(DIR_APPLICATION).''/'';\r\n\r\n			foreach ($files as $file) {\r\n				// Upload everything in the upload directory\r\n				$destination = $root.substr($file, strlen($directory));\r\n\r\n				if (is_dir($file)) {\r\n					$list = glob(rtrim($destination, ''/'').''/*'');\r\n\r\n					if (!file_exists($destination)) {\r\n						if (!mkdir($destination)) {\r\n							$json[''error''] = sprintf($this->language->get(''error_ftp_directory''), $destination);\r\n						}\r\n					}\r\n				}\r\n\r\n				if (is_file($file)) {\r\n					if (!copy($file, $destination)) {\r\n						$json[''error''] = sprintf($this->language->get(''error_ftp_file''), $file);\r\n					}\r\n				}\r\n			}\r\n		}\r\n\r\n		$this->response->addHeader(''Content-Type: application/json'');\r\n		$this->response->setOutput(json_encode($json));\r\n	}]]></add>\r\n		</operation>\r\n	</file>	\r\n</modification>', 1, '2015-12-15 16:11:25');

-- --------------------------------------------------------

--
-- 表的结构 `oc_module`
--

DROP TABLE IF EXISTS `oc_module`;
CREATE TABLE `oc_module` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` varchar(32) NOT NULL,
  `setting` text NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

--
-- 转存表中的数据 `oc_module`
--

INSERT INTO `oc_module` (`module_id`, `name`, `code`, `setting`) VALUES
(30, 'Category', 'banner', '{"name":"Category","banner_id":"6","width":"182","height":"182","status":"1"}'),
(29, 'Home Page', 'carousel', '{"name":"Home Page","banner_id":"8","width":"130","height":"100","status":"1"}'),
(28, 'Home Page', 'featured', '{"name":"Home Page","product":["50","54","51","53"],"limit":"4","width":"300","height":"300","status":"1"}'),
(27, 'Home Page', 'slideshow', '{"name":"Home Page","banner_id":"7","width":"1140","height":"500","status":"1"}'),
(31, 'Banner 1', 'banner', '{"name":"Banner 1","banner_id":"6","width":"182","height":"182","status":"1"}'),
(32, '最新商品', 'latest', '{"name":"\\u6700\\u65b0\\u5546\\u54c1","limit":"8","width":"300","height":"340","status":"1"}'),
(33, '热卖商品', 'bestseller', '{"name":"\\u70ed\\u5356\\u5546\\u54c1","limit":"4","width":"300","height":"300","status":"1"}'),
(34, '特价商品', 'special', '{"name":"\\u7279\\u4ef7\\u5546\\u54c1","limit":"4","width":"300","height":"340","status":"1"}'),
(35, '推荐商品', 'featured', '{"name":"\\u63a8\\u8350\\u5546\\u54c1","product":["56","61","71","72"],"limit":"4","width":"300","height":"340","status":"1"}'),
(36, '首页中部横幅', 'banner', '{"name":"\\u9996\\u9875\\u4e2d\\u90e8\\u6a2a\\u5e45","banner_id":"11","width":"1140","height":"382","status":"1"}'),
(37, '首页中部横幅2', 'banner', '{"name":"\\u9996\\u9875\\u4e2d\\u90e8\\u6a2a\\u5e452","banner_id":"10","width":"1140","height":"587","status":"1"}');

-- --------------------------------------------------------

--
-- 表的结构 `oc_option`
--

DROP TABLE IF EXISTS `oc_option`;
CREATE TABLE `oc_option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `oc_option`
--

INSERT INTO `oc_option` (`option_id`, `type`, `sort_order`) VALUES
(1, 'radio', 1),
(2, 'checkbox', 2),
(4, 'text', 3),
(5, 'select', 4),
(6, 'textarea', 5),
(7, 'file', 6),
(8, 'date', 7),
(9, 'time', 8),
(10, 'datetime', 9),
(11, 'select', 10),
(12, 'date', 11);

-- --------------------------------------------------------

--
-- 表的结构 `oc_option_description`
--

DROP TABLE IF EXISTS `oc_option_description`;
CREATE TABLE `oc_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_option_description`
--

INSERT INTO `oc_option_description` (`option_id`, `language_id`, `name`) VALUES
(1, 2, 'Radio'),
(2, 2, 'Checkbox'),
(4, 2, 'Text'),
(6, 2, 'Textarea'),
(8, 2, 'Date'),
(7, 2, 'File'),
(5, 2, 'Select'),
(9, 2, 'Time'),
(10, 2, 'Date &amp; Time'),
(12, 2, 'Delivery Date'),
(11, 2, 'Size');

-- --------------------------------------------------------

--
-- 表的结构 `oc_option_value`
--

DROP TABLE IF EXISTS `oc_option_value`;
CREATE TABLE `oc_option_value` (
  `option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=49 ;

--
-- 转存表中的数据 `oc_option_value`
--

INSERT INTO `oc_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES
(43, 1, '', 3),
(32, 1, '', 1),
(45, 2, '', 4),
(44, 2, '', 3),
(42, 5, '', 4),
(41, 5, '', 3),
(39, 5, '', 1),
(40, 5, '', 2),
(31, 1, '', 2),
(23, 2, '', 1),
(24, 2, '', 2),
(46, 11, '', 1),
(47, 11, '', 2),
(48, 11, '', 3);

-- --------------------------------------------------------

--
-- 表的结构 `oc_option_value_description`
--

DROP TABLE IF EXISTS `oc_option_value_description`;
CREATE TABLE `oc_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_option_value_description`
--

INSERT INTO `oc_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES
(43, 2, 1, 'Large'),
(32, 2, 1, 'Small'),
(45, 2, 2, 'Checkbox 4'),
(44, 2, 2, 'Checkbox 3'),
(31, 2, 1, 'Medium'),
(42, 2, 5, 'Yellow'),
(41, 2, 5, 'Green'),
(39, 2, 5, 'Red'),
(40, 2, 5, 'Blue'),
(23, 2, 2, 'Checkbox 1'),
(24, 2, 2, 'Checkbox 2'),
(48, 2, 11, 'Large'),
(47, 2, 11, 'Medium'),
(46, 2, 11, 'Small');

-- --------------------------------------------------------

--
-- 表的结构 `oc_order`
--

DROP TABLE IF EXISTS `oc_order`;
CREATE TABLE `oc_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `custom_field` text NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(40) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_custom_field` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(40) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_custom_field` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `marketing_id` int(11) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1001811 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_order_custom_field`
--

DROP TABLE IF EXISTS `oc_order_custom_field`;
CREATE TABLE `oc_order_custom_field` (
  `order_custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  `location` varchar(16) NOT NULL,
  PRIMARY KEY (`order_custom_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_order_history`
--

DROP TABLE IF EXISTS `oc_order_history`;
CREATE TABLE `oc_order_history` (
  `order_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_history_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=62 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_order_option`
--

DROP TABLE IF EXISTS `oc_order_option`;
CREATE TABLE `oc_order_option` (
  `order_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY (`order_option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_order_product`
--

DROP TABLE IF EXISTS `oc_order_product`;
CREATE TABLE `oc_order_product` (
  `order_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL,
  PRIMARY KEY (`order_product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_order_recurring`
--

DROP TABLE IF EXISTS `oc_order_recurring`;
CREATE TABLE `oc_order_recurring` (
  `order_recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `recurring_name` varchar(255) NOT NULL,
  `recurring_description` varchar(255) NOT NULL,
  `recurring_frequency` varchar(25) NOT NULL,
  `recurring_cycle` smallint(6) NOT NULL,
  `recurring_duration` smallint(6) NOT NULL,
  `recurring_price` decimal(10,4) NOT NULL,
  `trial` tinyint(1) NOT NULL,
  `trial_frequency` varchar(25) NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_recurring_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_order_recurring_transaction`
--

DROP TABLE IF EXISTS `oc_order_recurring_transaction`;
CREATE TABLE `oc_order_recurring_transaction` (
  `order_recurring_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_recurring_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_recurring_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_order_status`
--

DROP TABLE IF EXISTS `oc_order_status`;
CREATE TABLE `oc_order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`order_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `oc_order_status`
--

INSERT INTO `oc_order_status` (`order_status_id`, `language_id`, `name`) VALUES
(2, 2, '处理中'),
(3, 2, '已发货'),
(7, 2, '已取消'),
(5, 2, '已完成'),
(8, 2, '已拒绝'),
(9, 2, '取消回退'),
(10, 2, '已失败'),
(11, 2, '已退款'),
(12, 2, '已回退'),
(13, 2, '已拒付'),
(1, 2, '待处理'),
(16, 2, '已失败'),
(15, 2, '已付款'),
(14, 2, '已逾期');

-- --------------------------------------------------------

--
-- 表的结构 `oc_order_total`
--

DROP TABLE IF EXISTS `oc_order_total`;
CREATE TABLE `oc_order_total` (
  `order_total_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`order_total_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=91 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_order_voucher`
--

DROP TABLE IF EXISTS `oc_order_voucher`;
CREATE TABLE `oc_order_voucher` (
  `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  PRIMARY KEY (`order_voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_product`
--

DROP TABLE IF EXISTS `oc_product`;
CREATE TABLE `oc_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(17) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL DEFAULT '0000-00-00',
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `viewed` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=82 ;

--
-- 转存表中的数据 `oc_product`
--

INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES
(77, '432424', '', '', '', '', '', '', '', 765, 7, 'catalog/gd/product/yanjing8.jpg', 0, 1, '8899.0000', 0, 0, '2016-04-10', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 3, 1, 1, 0, '2016-04-10 03:13:42', '2016-04-21 11:21:40'),
(76, '463452', '', '', '', '', '', '', '', 7657, 7, 'catalog/gd/product/yanjing9.1.jpg', 0, 1, '8766.0000', 0, 0, '2016-04-10', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2016-04-10 02:57:03', '2016-04-21 11:24:11'),
(75, '463452ss', '', '', '', '', '', '', '', 7657, 7, 'catalog/gd/product/yanjing10.jpg', 0, 1, '7099.0000', 0, 0, '2016-04-10', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 5, 1, 1, 0, '2016-04-10 02:55:17', '2016-04-21 11:26:40'),
(74, '13213124', '', '', '', '', '', '', '', 3342, 7, 'catalog/gd/product/yanjing11.1.jpg', 0, 1, '8436.0000', 0, 0, '2016-04-10', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2016-04-10 02:46:11', '2016-04-21 11:29:40'),
(73, '2321321', '', '', '', '', '', '', '', 3333, 7, 'catalog/gd/product/yanjing12.1.jpg', 0, 1, '4999.0000', 0, 0, '2016-04-10', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2016-04-10 02:36:58', '2016-04-21 11:31:29'),
(72, '12351222', '56456', 'lopasx4', '', '', '', '', '', 222, 7, 'catalog/gd/product/yanjing1.jpg', 0, 1, '8600.0000', 0, 0, '2016-04-10', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2016-04-10 02:22:42', '2016-04-21 17:54:51'),
(71, '1252323', '', '', '', '', '', '', '', 6666, 7, 'catalog/gd/product/yanjing4.jpg', 0, 1, '8867.0000', 0, 0, '2016-04-05', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2016-04-10 01:40:24', '2016-04-21 15:39:48'),
(70, '表', '', '', '', '', '', '', '', 869, 6, 'catalog/gd/product/yanjing13.1.jpg', 0, 1, '4899.0000', 80, 0, '2016-01-28', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 3, 1, 0, '2016-04-10 01:31:27', '2016-04-21 15:40:31'),
(78, '123452', '', '', '', '', '', '', '', 5655, 7, 'catalog/gd/product/yanjing7.jpg', 0, 1, '8896.0000', 0, 0, '2016-04-11', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 3, 1, 1, 0, '2016-04-11 16:01:12', '2016-04-21 11:18:56'),
(61, '5342', '', '', '', '', '', '', '', 988, 5, 'catalog/gd/product/yanjing3.jpg', 0, 1, '8766.0000', 100, 9, '2016-02-12', '12.50000000', 1, '1.00000000', '2.00000000', '3.00000000', 1, 1, 1, 0, 1, 0, '2016-02-01 18:33:29', '2016-04-21 10:57:17'),
(60, '55561', '', '', '', '', '', '', '1', 6666, 7, 'catalog/gd/product/yanjing14.1.jpg', 0, 1, '6500.0000', 10, 0, '2016-05-04', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 1, 1, 0, '2016-02-01 18:33:29', '2016-04-21 15:44:24'),
(56, '21513656', '', '', '', '', '', '', '', 6666, 7, 'catalog/gd/product/yanjing2.jpg', 0, 1, '8096.0000', 5, 0, '2016-02-11', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 4, 1, 0, '2016-01-28 15:42:01', '2016-04-21 16:51:22'),
(80, '45615', '件', '', '', '', '', '', '', 5656, 7, 'catalog/gd/product/yanjing5.jpg', 0, 1, '3799.0000', 0, 0, '2016-04-11', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2016-04-11 17:54:54', '2016-04-21 14:05:20'),
(79, '15132', '', '', '', '', '', '', '', 98540, 7, 'catalog/gd/product/yanjing6.jpg', 0, 1, '5399.0000', 0, 0, '2016-04-11', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2016-04-11 16:59:24', '2016-04-21 11:16:29'),
(50, '14556156', '件', '', '', '', '', 'lis541', '1', 5555, 7, 'catalog/gd/product/yanjing1.jpg', 0, 1, '8609.0000', 50, 0, '2016-07-16', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2016-01-28 11:09:19', '2016-04-21 18:26:57');

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_attribute`
--

DROP TABLE IF EXISTS `oc_product_attribute`;
CREATE TABLE `oc_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`product_id`,`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_product_attribute`
--

INSERT INTO `oc_product_attribute` (`product_id`, `attribute_id`, `language_id`, `text`) VALUES
(61, 3, 2, '100mhz'),
(50, 4, 2, '2575627257274');

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_description`
--

DROP TABLE IF EXISTS `oc_product_description`;
CREATE TABLE `oc_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`product_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_product_description`
--

INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(72, 2, '普利邦欧美大框时尚眼镜女潮个性百搭太阳镜女防眩驾驶镜女墨nv', '&lt;p&gt;&lt;img src=&quot;http://demo.opencart.cn/image/catalog/gd/product/yanjing1-xq2.jpg&quot;&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://demo.opencart.cn/image/catalog/gd/product/yanjing1-xq3.jpg&quot;&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://demo.opencart.cn/image/catalog/gd/product/yanjing1-xq4.jpg&quot;&gt;&lt;br&gt;&lt;/p&gt;', '', '普利邦欧美大框时尚眼镜女潮个性百搭太阳镜女防眩驾驶镜女墨镜女', '', ''),
(71, 2, '2016时尚墨镜 女士偏光太阳镜潮人欧美复古圆框眼镜驾驶镜', '&lt;p&gt;&lt;img src=&quot;http://demo.opencart.cn/image/catalog/gd/product/yanjing4-xq1.jpg&quot;&gt;&lt;img src=&quot;http://demo.opencart.cn/image/catalog/gd/product/yanjing4-xq2.jpg&quot;&gt;&lt;br&gt;&lt;/p&gt;', '', '女士偏光太阳镜', '', ''),
(75, 2, '普利邦欧美大框时尚墨镜女气质百搭太阳镜女偏光驾驶镜女防眩眼镜', '&lt;p&gt;&lt;img src=&quot;http://demo.opencart.cn/image/catalog/gd/product/yanjing10-xq1.jpg&quot;&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://demo.opencart.cn/image/catalog/gd/product/yanjing10-xq2.jpg&quot;&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://demo.opencart.cn/image/catalog/gd/product/yanjing10-xq3.jpg&quot;&gt;&lt;br&gt;&lt;/p&gt;', '', '普利邦欧美大框时尚墨镜女气质百搭太阳镜女偏光驾驶镜女防眩眼镜', '', ''),
(76, 2, '普利邦欧美个性太阳镜女款大框气质墨镜女潮驾驶镜防眩光司机镜', '&lt;img src=&quot;http://demo.opencart.cn/image/catalog/gd/product/yanjing9.1-xq2.jpg&quot;&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://demo.opencart.cn/image/catalog/gd/product/yanjing9.1-xq3.jpg&quot;&gt;&lt;br&gt;&lt;/p&gt;', '', '普利邦欧美个性太阳镜女款大框气质墨镜女潮驾驶镜防眩光司机镜', '', ''),
(79, 2, '普利邦欧美风时尚太阳镜男个性炫酷墨镜男潮驾驶镜男防眩光司机镜', '&lt;p&gt;&lt;img src=&quot;http://demo.opencart.cn/image/catalog/gd/product/yanjing6-xq1.jpg&quot;&gt;&lt;br&gt;&lt;/p&gt;', '', '普利邦欧美风时尚太阳镜男个性炫酷墨镜男潮驾驶镜男防眩光司机镜', '', ''),
(80, 2, '普利邦 欧美时尚大框优雅墨镜女款复古个性防强光太阳镜简约眼镜', '&lt;img src=&quot;http://demo.opencart.cn/image/catalog/gd/product/yanjing5-xq2.jpg&quot;&gt;&lt;img src=&quot;http://demo.opencart.cn/image/catalog/gd/product/yanjing5-xq1.jpg&quot;&gt;', '', '普利邦 欧美时尚大框优雅墨镜女款复古个性防强光太阳镜简约眼镜', '', ''),
(78, 2, '普利邦欧美大框眼镜女优雅精致太阳镜女士潮2016前卫墨镜女驾驶镜', '&lt;p&gt;&lt;img src=&quot;http://demo.opencart.cn/image/catalog/gd/product/yanjing7-xq4.jpg&quot;&gt;&lt;img src=&quot;http://demo.opencart.cn/image/catalog/gd/product/yanjing7-xq2.jpg&quot;&gt;&lt;img src=&quot;http://demo.opencart.cn/image/catalog/gd/product/yanjing7-xq1.jpg&quot;&gt;&lt;br&gt;&lt;/p&gt;', '', '宝珀VILLERET系列6654-1127-55B腕表', '', ''),
(77, 2, '普利邦欧美大框太阳镜女潮时尚百搭驾驶镜女偏光墨镜女气质简约潮', '&lt;p&gt;&lt;img src=&quot;http://demo.opencart.cn/image/catalog/gd/product/yanjing8-xq2.jpg&quot;&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://demo.opencart.cn/image/catalog/gd/product/yanjing8-xq1.jpg&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://demo.opencart.cn/image/catalog/gd/product/yanjing8-xq3.jpg&quot;&gt;&lt;br&gt;&lt;/p&gt;', '', '宝珀VILLERET系列6651-1127-55B腕表', '', ''),
(70, 2, '普利邦欧美大框蛤蟆镜男个性百搭眼镜男偏光驾驶镜男炫酷时尚墨镜', '&lt;p&gt;&lt;img src=&quot;http://demo.opencart.cn/image/catalog/gd/product/yanjing13.1-xq1.jpg&quot;&gt;&lt;br&gt;&lt;/p&gt;', '', '普利邦欧美大框蛤蟆镜男个性百搭眼镜男偏光驾驶镜男炫酷时尚墨镜', '', ''),
(74, 2, '普利邦欧美大框眼镜女个性百搭太阳镜女气质优雅驾驶镜女偏光墨镜', '&lt;p&gt;&lt;img src=&quot;http://demo.opencart.cn/image/catalog/gd/product/yanjing11.1-xq1.jpg&quot;&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://demo.opencart.cn/image/catalog/gd/product/yanjing10-xq3.jpg&quot;&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://demo.opencart.cn/image/catalog/gd/product/yanjing11.1-xq3.jpg&quot;&gt;&lt;br&gt;&lt;/p&gt;', '', '瑞士美度MIDO贝伦赛丽机械男表M8600.4.26.8皮带', '', ''),
(73, 2, '普利邦 欧美圆框黑色炫酷太阳镜男款圆框防紫外线墨镜前卫驾驶镜', '&lt;p&gt;&lt;img src=&quot;http://demo.opencart.cn/image/catalog/gd/product/yanjing12.1-xq1.jpg&quot;&gt;&lt;br&gt;&lt;/p&gt;', '', '普利邦 欧美圆框黑色炫酷太阳镜男款圆框防紫外线墨镜前卫驾驶镜', '', ''),
(61, 2, '普利邦欧美大框墨镜男潮2016太阳镜男炫彩百搭驾驶镜男偏光眼镜男', '&lt;img src=&quot;http://demo.opencart.cn/image/catalog/gd/product/yanjing3-xq1.jpg&quot;&gt;', '', '普利邦欧美大框墨镜男潮2016太阳镜男炫彩百搭驾驶镜男偏光眼镜男', '', ''),
(56, 2, '普利邦欧美炫彩墨镜男个性大框太阳镜男士潮偏光驾驶镜男眼镜男士', '&lt;p&gt;&lt;img src=&quot;http://demo.opencart.cn/image/catalog/gd/product/yanjing2-xq1.jpg&quot;&gt;&lt;img src=&quot;http://demo.opencart.cn/image/catalog/gd/product/yanjing2-xq2.jpg&quot;&gt;&lt;img src=&quot;http://demo.opencart.cn/image/catalog/gd/product/yanjing2-xq3.jpg&quot;&gt;&lt;br&gt;&lt;/p&gt;', '', '普利邦欧美炫彩墨镜男个性大框太阳镜男士潮偏光驾驶镜男眼镜男士', '', ''),
(50, 2, '普利邦欧美大框太阳镜女潮时尚百搭驾驶镜女偏光墨镜女气质简约潮', '&lt;img src=&quot;http://demo.opencart.cn/image/catalog/gd/product/yanjing1-xq2.jpg&quot;&gt;&lt;img src=&quot;http://demo.opencart.cn/image/catalog/gd/product/yanjing1-xq4.jpg&quot;&gt;&lt;img src=&quot;http://demo.opencart.cn/image/catalog/gd/product/yanjing1-xq3.jpg&quot;&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://demo.opencart.cn/image/catalog/gd/product/yanjing1-xq5.jpg&quot;&gt;&lt;br&gt;&lt;/p&gt;', '太阳镜女士', '普利邦欧美大框太阳镜女潮时尚百搭驾驶镜女偏光墨镜女气质简约潮', '太阳镜女士', '太阳镜女士'),
(60, 2, '普利邦欧美大框眼镜女时尚个性墨镜女气质优雅驾驶镜女偏光司机镜', '&lt;p&gt;&lt;img src=&quot;http://demo.opencart.cn/image/catalog/gd/product/yanjing14.1-1.jpg&quot;&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://demo.opencart.cn/image/catalog/gd/product/yanjing14.1-2.jpg&quot;&gt;&lt;br&gt;&lt;/p&gt;', '', '普利邦欧美大框眼镜女时尚个性墨镜女气质优雅驾驶镜女偏光司机镜', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_discount`
--

DROP TABLE IF EXISTS `oc_product_discount`;
CREATE TABLE `oc_product_discount` (
  `product_discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_discount_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=509 ;

--
-- 转存表中的数据 `oc_product_discount`
--

INSERT INTO `oc_product_discount` (`product_discount_id`, `product_id`, `customer_group_id`, `quantity`, `priority`, `price`, `date_start`, `date_end`) VALUES
(508, 70, 1, 0, 0, '200.0000', '2016-03-31', '2016-04-02');

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_filter`
--

DROP TABLE IF EXISTS `oc_product_filter`;
CREATE TABLE `oc_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_image`
--

DROP TABLE IF EXISTS `oc_product_image`;
CREATE TABLE `oc_product_image` (
  `product_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_image_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2902 ;

--
-- 转存表中的数据 `oc_product_image`
--

INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES
(2896, 73, '', 0),
(2884, 61, '', 0),
(2892, 77, '', 0),
(2893, 77, '', 0),
(2894, 77, '', 0),
(2901, 80, '', 0),
(2900, 80, '', 0),
(2899, 80, '', 0),
(2898, 80, '', 0),
(2891, 78, '', 0),
(2890, 78, '', 0),
(2889, 78, '', 0),
(2895, 75, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_option`
--

DROP TABLE IF EXISTS `oc_product_option`;
CREATE TABLE `oc_product_option` (
  `product_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`product_option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=240 ;

--
-- 转存表中的数据 `oc_product_option`
--

INSERT INTO `oc_product_option` (`product_option_id`, `product_id`, `option_id`, `value`, `required`) VALUES
(232, 61, 5, '', 1),
(230, 61, 1, '', 1),
(233, 61, 2, '', 1),
(239, 50, 7, '', 1),
(238, 50, 1, '', 1),
(237, 50, 2, '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_option_value`
--

DROP TABLE IF EXISTS `oc_product_option_value`;
CREATE TABLE `oc_product_option_value` (
  `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL,
  PRIMARY KEY (`product_option_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

--
-- 转存表中的数据 `oc_product_option_value`
--

INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES
(20, 232, 61, 5, 40, 300, 0, '3.0000', '+', 0, '+', '3.00000000', '+'),
(22, 232, 61, 5, 39, 90, 1, '4.0000', '+', 0, '+', '4.00000000', '+'),
(23, 232, 61, 5, 41, 100, 0, '1.0000', '+', 0, '+', '1.00000000', '+'),
(21, 232, 61, 5, 42, 200, 1, '2.0000', '+', 0, '+', '2.00000000', '+'),
(19, 230, 61, 1, 31, 146, 1, '20.0000', '+', 2, '-', '20.00000000', '+'),
(18, 230, 61, 1, 43, 300, 1, '30.0000', '+', 3, '+', '30.00000000', '+'),
(17, 230, 61, 1, 32, 94, 1, '10.0000', '+', 1, '+', '10.00000000', '+'),
(25, 233, 61, 2, 24, 194, 1, '20.0000', '+', 0, '+', '20.00000000', '+'),
(26, 233, 61, 2, 44, 2696, 1, '30.0000', '+', 0, '+', '30.00000000', '+'),
(24, 233, 61, 2, 45, 3998, 1, '40.0000', '+', 0, '+', '40.00000000', '+'),
(27, 233, 61, 2, 23, 46, 1, '10.0000', '+', 0, '+', '10.00000000', '+'),
(29, 238, 50, 1, 31, 856, 1, '200.0000', '+', 50, '+', '1.00000000', '+'),
(30, 238, 50, 1, 43, 565, 1, '200.0000', '+', 50, '+', '1.00000000', '+'),
(31, 238, 50, 1, 32, 200, 1, '200.0000', '+', 5, '+', '0.00000000', '+'),
(34, 237, 50, 2, 45, 654, 1, '200.0000', '+', 50, '+', '1.00000000', '+'),
(33, 237, 50, 2, 44, 151, 1, '200.0000', '+', 50, '+', '1.00000000', '+'),
(32, 237, 50, 2, 24, 5695, 1, '200.0000', '+', 50, '+', '1.00000000', '+'),
(28, 237, 50, 2, 23, 1654, 1, '200.0000', '+', 50, '+', '1.00000000', '+');

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_questions`
--

DROP TABLE IF EXISTS `oc_product_questions`;
CREATE TABLE `oc_product_questions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `product_question` longtext NOT NULL,
  `product_answer` longtext NOT NULL,
  `product_status` int(11) NOT NULL,
  `product_question_helpfull` int(11) NOT NULL,
  `product_question_nothelpfull` int(11) NOT NULL,
  `question_asked_date` datetime NOT NULL,
  `question_answred_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `oc_product_questions`
--

INSERT INTO `oc_product_questions` (`id`, `product_id`, `user_name`, `product_question`, `product_answer`, `product_status`, `product_question_helpfull`, `product_question_nothelpfull`, `question_asked_date`, `question_answred_date`) VALUES
(1, 63, 'undefined', 'undefined', '', 0, 0, 0, '2016-02-04 12:39:02', '0000-00-00 00:00:00'),
(2, 62, 'undefined', 'undefined', '', 0, 0, 0, '2016-02-04 15:29:22', '0000-00-00 00:00:00'),
(3, 51, 'undefined', 'undefined', '', 0, 0, 0, '2016-02-05 10:44:54', '0000-00-00 00:00:00'),
(4, 33, 'undefined', 'undefined', '', 0, 0, 0, '2016-02-17 00:19:42', '0000-00-00 00:00:00'),
(5, 33, 'undefined', 'undefined', '', 0, 0, 0, '2016-02-17 00:19:45', '0000-00-00 00:00:00'),
(6, 62, 'undefined', 'undefined', '', 0, 0, 0, '2016-02-18 09:51:28', '0000-00-00 00:00:00'),
(7, 33, 'undefined', 'undefined', '', 0, 0, 0, '2016-02-18 10:18:07', '0000-00-00 00:00:00'),
(8, 33, 'undefined', 'undefined', '', 0, 0, 0, '2016-02-18 10:18:07', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_recurring`
--

DROP TABLE IF EXISTS `oc_product_recurring`;
CREATE TABLE `oc_product_recurring` (
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`recurring_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_related`
--

DROP TABLE IF EXISTS `oc_product_related`;
CREATE TABLE `oc_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_product_related`
--

INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES
(60, 80),
(70, 72),
(70, 73),
(70, 76),
(70, 80),
(72, 70),
(72, 73),
(72, 80),
(73, 70),
(73, 72),
(76, 70),
(80, 60),
(80, 70),
(80, 72);

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_reward`
--

DROP TABLE IF EXISTS `oc_product_reward`;
CREATE TABLE `oc_product_reward` (
  `product_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_reward_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=607 ;

--
-- 转存表中的数据 `oc_product_reward`
--

INSERT INTO `oc_product_reward` (`product_reward_id`, `product_id`, `customer_group_id`, `points`) VALUES
(603, 70, 1, 20),
(597, 61, 1, 50),
(606, 50, 1, 50);

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_special`
--

DROP TABLE IF EXISTS `oc_product_special`;
CREATE TABLE `oc_product_special` (
  `product_special_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_special_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=714 ;

--
-- 转存表中的数据 `oc_product_special`
--

INSERT INTO `oc_product_special` (`product_special_id`, `product_id`, `customer_group_id`, `priority`, `price`, `date_start`, `date_end`) VALUES
(713, 50, 1, 0, '5219.0000', '2016-04-05', '2017-01-12'),
(695, 80, 1, 0, '2999.0000', '2016-04-11', '2017-03-24'),
(683, 79, 1, 0, '8966.0000', '2016-04-11', '2017-03-10'),
(703, 56, 1, 1, '5379.0000', '2016-01-28', '2017-02-18'),
(702, 60, 1, 0, '3925.0000', '2016-04-21', '2017-05-30'),
(677, 61, 1, 1, '5259.0000', '2016-02-01', '2017-05-25'),
(684, 78, 1, 0, '5337.0000', '2016-04-11', '2016-11-26'),
(701, 70, 1, 1, '2129.0000', '2016-04-21', '2017-11-23'),
(690, 73, 1, 0, '3199.0000', '2016-04-10', '2017-01-13'),
(689, 74, 1, 0, '6899.0000', '2016-04-10', '2017-01-13'),
(687, 75, 1, 0, '5206.0000', '2016-04-10', '2017-01-12'),
(685, 77, 1, 0, '5377.0000', '2016-04-10', '2017-01-06'),
(686, 76, 1, 0, '5012.0000', '2016-04-10', '2017-02-15'),
(704, 72, 1, 0, '5499.0000', '2016-04-10', '2017-01-20'),
(700, 71, 1, 0, '7770.0000', '2016-04-21', '2017-06-25');

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_to_category`
--

DROP TABLE IF EXISTS `oc_product_to_category`;
CREATE TABLE `oc_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_product_to_category`
--

INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES
(56, 20),
(56, 24),
(56, 33),
(61, 18),
(61, 20),
(61, 24),
(71, 18),
(71, 20),
(71, 24),
(71, 33),
(72, 18),
(72, 24),
(73, 18),
(73, 20),
(73, 24),
(73, 25),
(74, 18),
(74, 20),
(74, 24),
(74, 33),
(77, 18),
(77, 20),
(77, 24),
(77, 33),
(78, 18),
(78, 24),
(78, 25),
(79, 20),
(79, 24),
(80, 18),
(80, 25);

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_to_download`
--

DROP TABLE IF EXISTS `oc_product_to_download`;
CREATE TABLE `oc_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_to_layout`
--

DROP TABLE IF EXISTS `oc_product_to_layout`;
CREATE TABLE `oc_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_product_to_layout`
--

INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES
(50, 0, 0),
(80, 0, 0),
(79, 0, 0),
(56, 0, 0),
(60, 0, 0),
(61, 0, 0),
(78, 0, 0),
(70, 0, 0),
(71, 0, 0),
(72, 0, 0),
(73, 0, 0),
(74, 0, 0),
(75, 0, 0),
(76, 0, 0),
(77, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_to_store`
--

DROP TABLE IF EXISTS `oc_product_to_store`;
CREATE TABLE `oc_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_product_to_store`
--

INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES
(50, 0),
(56, 0),
(60, 0),
(61, 0),
(70, 0),
(71, 0),
(72, 0),
(73, 0),
(74, 0),
(75, 0),
(76, 0),
(77, 0),
(78, 0),
(79, 0),
(80, 0);

-- --------------------------------------------------------

--
-- 表的结构 `oc_recurring`
--

DROP TABLE IF EXISTS `oc_recurring`;
CREATE TABLE `oc_recurring` (
  `recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int(10) unsigned NOT NULL,
  `cycle` int(10) unsigned NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int(10) unsigned NOT NULL,
  `trial_cycle` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`recurring_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_recurring_description`
--

DROP TABLE IF EXISTS `oc_recurring_description`;
CREATE TABLE `oc_recurring_description` (
  `recurring_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`recurring_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `oc_return`
--

DROP TABLE IF EXISTS `oc_return`;
CREATE TABLE `oc_return` (
  `return_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text,
  `date_ordered` date NOT NULL DEFAULT '0000-00-00',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`return_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_return_action`
--

DROP TABLE IF EXISTS `oc_return_action`;
CREATE TABLE `oc_return_action` (
  `return_action_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`return_action_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `oc_return_action`
--

INSERT INTO `oc_return_action` (`return_action_id`, `language_id`, `name`) VALUES
(1, 2, '已退款'),
(2, 2, '信用卡已退款'),
(3, 2, '已寄出替换商品');

-- --------------------------------------------------------

--
-- 表的结构 `oc_return_history`
--

DROP TABLE IF EXISTS `oc_return_history`;
CREATE TABLE `oc_return_history` (
  `return_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`return_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_return_reason`
--

DROP TABLE IF EXISTS `oc_return_reason`;
CREATE TABLE `oc_return_reason` (
  `return_reason_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`return_reason_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `oc_return_reason`
--

INSERT INTO `oc_return_reason` (`return_reason_id`, `language_id`, `name`) VALUES
(1, 2, '没有收到商品'),
(2, 2, '发错商品'),
(3, 2, '错误下单'),
(4, 2, '商品质量问题，请详细描述'),
(5, 2, '其它，请说明原因');

-- --------------------------------------------------------

--
-- 表的结构 `oc_return_status`
--

DROP TABLE IF EXISTS `oc_return_status`;
CREATE TABLE `oc_return_status` (
  `return_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`return_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `oc_return_status`
--

INSERT INTO `oc_return_status` (`return_status_id`, `language_id`, `name`) VALUES
(1, 2, '待处理'),
(3, 2, '已完成'),
(2, 2, '等待商品寄回');

-- --------------------------------------------------------

--
-- 表的结构 `oc_review`
--

DROP TABLE IF EXISTS `oc_review`;
CREATE TABLE `oc_review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `oc_review`
--

INSERT INTO `oc_review` (`review_id`, `product_id`, `customer_id`, `author`, `text`, `rating`, `status`, `date_added`, `date_modified`) VALUES
(1, 43, 0, 'dsfd', 'fdsfdsafdsdddddddddddddddddddddddddddddddddddd', 4, 0, '2015-12-11 14:33:10', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `oc_setting`
--

DROP TABLE IF EXISTS `oc_setting`;
CREATE TABLE `oc_setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3689 ;

--
-- 转存表中的数据 `oc_setting`
--

INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES
(1682, 0, 'shipping', 'shipping_sort_order', '3', 0),
(2, 0, 'sub_total', 'sub_total_sort_order', '1', 0),
(3, 0, 'sub_total', 'sub_total_status', '1', 0),
(5, 0, 'total', 'total_sort_order', '9', 0),
(6, 0, 'total', 'total_status', '1', 0),
(1683, 0, 'basic_captcha', 'basic_captcha_status', '0', 0),
(8, 0, 'free_checkout', 'free_checkout_sort_order', '1', 0),
(9, 0, 'cod', 'cod_sort_order', '5', 0),
(10, 0, 'cod', 'cod_total', '0.01', 0),
(11, 0, 'cod', 'cod_order_status_id', '1', 0),
(12, 0, 'cod', 'cod_geo_zone_id', '0', 0),
(13, 0, 'cod', 'cod_status', '1', 0),
(1681, 0, 'shipping', 'shipping_status', '1', 0),
(1680, 0, 'shipping', 'shipping_estimator', '1', 0),
(27, 0, 'coupon', 'coupon_sort_order', '4', 0),
(28, 0, 'coupon', 'coupon_status', '1', 0),
(2064, 0, 'flat', 'flat_sort_order', '3', 0),
(2063, 0, 'flat', 'flat_status', '1', 0),
(2062, 0, 'flat', 'flat_geo_zone_id', '0', 0),
(2061, 0, 'flat', 'flat_tax_class_id', '9', 0),
(2060, 0, 'flat', 'flat_cost', '5.00', 0),
(42, 0, 'credit', 'credit_sort_order', '7', 0),
(43, 0, 'credit', 'credit_status', '1', 0),
(53, 0, 'reward', 'reward_sort_order', '2', 0),
(54, 0, 'reward', 'reward_status', '1', 0),
(146, 0, 'category', 'category_status', '1', 0),
(158, 0, 'account', 'account_status', '1', 0),
(159, 0, 'affiliate', 'affiliate_status', '1', 0),
(3645, 0, 'config', 'config_image_popup_width', '500', 0),
(3646, 0, 'config', 'config_image_popup_height', '500', 0),
(3647, 0, 'config', 'config_image_product_width', '300', 0),
(3648, 0, 'config', 'config_image_product_height', '300', 0),
(3649, 0, 'config', 'config_image_additional_width', '300', 0),
(3650, 0, 'config', 'config_image_additional_height', '300', 0),
(3651, 0, 'config', 'config_image_related_width', '80', 0),
(3652, 0, 'config', 'config_image_related_height', '80', 0),
(3653, 0, 'config', 'config_image_compare_width', '90', 0),
(3654, 0, 'config', 'config_image_compare_height', '90', 0),
(3655, 0, 'config', 'config_image_wishlist_width', '47', 0),
(3656, 0, 'config', 'config_image_wishlist_height', '47', 0),
(3657, 0, 'config', 'config_image_cart_width', '47', 0),
(3658, 0, 'config', 'config_image_cart_height', '47', 0),
(3659, 0, 'config', 'config_image_location_width', '268', 0),
(3660, 0, 'config', 'config_image_location_height', '50', 0),
(3661, 0, 'config', 'config_ftp_hostname', 'demo.opencart.cn', 0),
(3662, 0, 'config', 'config_ftp_port', '21', 0),
(3663, 0, 'config', 'config_ftp_username', '', 0),
(3664, 0, 'config', 'config_ftp_password', '', 0),
(3665, 0, 'config', 'config_ftp_root', '', 0),
(3666, 0, 'config', 'config_ftp_status', '0', 0),
(3667, 0, 'config', 'config_mail_protocol', 'mail', 0),
(3668, 0, 'config', 'config_mail_parameter', '', 0),
(3669, 0, 'config', 'config_mail_smtp_hostname', '', 0),
(3670, 0, 'config', 'config_mail_smtp_username', '', 0),
(3671, 0, 'config', 'config_mail_smtp_password', '', 0),
(3672, 0, 'config', 'config_mail_smtp_port', '25', 0),
(3673, 0, 'config', 'config_mail_smtp_timeout', '5', 0),
(3674, 0, 'config', 'config_mail_alert', '', 0),
(3675, 0, 'config', 'config_maintenance', '0', 0),
(3676, 0, 'config', 'config_seo_url', '0', 0),
(3677, 0, 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai''hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', 0),
(94, 0, 'voucher', 'voucher_sort_order', '8', 0),
(95, 0, 'voucher', 'voucher_status', '1', 0),
(103, 0, 'free_checkout', 'free_checkout_status', '1', 0),
(104, 0, 'free_checkout', 'free_checkout_order_status_id', '1', 0),
(3644, 0, 'config', 'config_image_thumb_height', '300', 0),
(3643, 0, 'config', 'config_image_thumb_width', '300', 0),
(3642, 0, 'config', 'config_image_category_height', '80', 0),
(3641, 0, 'config', 'config_image_category_width', '80', 0),
(3640, 0, 'config', 'config_icon', 'catalog/cart.png', 0),
(3639, 0, 'config', 'config_logo', 'catalog/logo3.png', 0),
(2067, 0, 'free', 'free_status', '1', 0),
(2066, 0, 'free', 'free_geo_zone_id', '0', 0),
(298, 0, 'bank_transfer', 'bank_transfer_bank1', '请将货款转到以下银行账号，并在转账备注栏注明订单号：\r\n中国工商银行绵阳分行，卡号：9558822308334343，户名：张三\r\n有任何问题请联系店主，谢谢惠顾！', 0),
(299, 0, 'bank_transfer', 'bank_transfer_total', '', 0),
(300, 0, 'bank_transfer', 'bank_transfer_order_status_id', '15', 0),
(301, 0, 'bank_transfer', 'bank_transfer_geo_zone_id', '0', 0),
(302, 0, 'bank_transfer', 'bank_transfer_status', '1', 0),
(303, 0, 'bank_transfer', 'bank_transfer_sort_order', '', 0),
(3636, 0, 'config', 'config_return_status_id', '1', 0),
(3637, 0, 'config', 'config_captcha', 'basic_captcha', 0),
(3638, 0, 'config', 'config_captcha_page', '["register","review","return","contact"]', 1),
(3635, 0, 'config', 'config_return_id', '5', 0),
(3634, 0, 'config', 'config_affiliate_mail', '1', 0),
(3633, 0, 'config', 'config_affiliate_id', '5', 0),
(3632, 0, 'config', 'config_affiliate_commission', '5', 0),
(3631, 0, 'config', 'config_affiliate_auto', '0', 0),
(3630, 0, 'config', 'config_affiliate_approval', '0', 0),
(3629, 0, 'config', 'config_stock_checkout', '0', 0),
(3628, 0, 'config', 'config_stock_warning', '0', 0),
(3627, 0, 'config', 'config_stock_display', '0', 0),
(3626, 0, 'config', 'config_api_id', '2', 0),
(3625, 0, 'config', 'config_order_mail', '1', 0),
(3624, 0, 'config', 'config_fraud_status_id', '7', 0),
(3623, 0, 'config', 'config_complete_status', '["3","5"]', 1),
(3622, 0, 'config', 'config_processing_status', '["2","3","12","5","1"]', 1),
(3621, 0, 'config', 'config_order_status_id', '1', 0),
(3620, 0, 'config', 'config_checkout_id', '5', 0),
(3619, 0, 'config', 'config_checkout_guest', '1', 0),
(3618, 0, 'config', 'config_cart_weight', '1', 0),
(3617, 0, 'config', 'config_invoice_prefix', 'INV-2013-00', 0),
(3616, 0, 'config', 'config_account_mail', '0', 0),
(3615, 0, 'config', 'config_account_id', '3', 0),
(3614, 0, 'config', 'config_login_attempts', '5', 0),
(3613, 0, 'config', 'config_customer_price', '0', 0),
(3612, 0, 'config', 'config_customer_group_display', '["1"]', 1),
(3611, 0, 'config', 'config_customer_group_id', '1', 0),
(3610, 0, 'config', 'config_customer_online', '0', 0),
(3609, 0, 'config', 'config_tax_customer', 'shipping', 0),
(3608, 0, 'config', 'config_tax_default', 'shipping', 0),
(3607, 0, 'config', 'config_tax', '0', 0),
(3606, 0, 'config', 'config_voucher_max', '1000', 0),
(3605, 0, 'config', 'config_voucher_min', '1', 0),
(3604, 0, 'config', 'config_review_mail', '0', 0),
(3603, 0, 'config', 'config_review_guest', '1', 0),
(3602, 0, 'config', 'config_review_status', '1', 0),
(3601, 0, 'config', 'config_limit_admin', '20', 0),
(3600, 0, 'config', 'config_product_description_length', '100', 0),
(3599, 0, 'config', 'config_product_limit', '15', 0),
(3598, 0, 'config', 'config_product_count', '0', 0),
(3597, 0, 'config', 'config_weight_class_id', '1', 0),
(2087, 0, 'config_c123', 'config_c123_csid', '', 0),
(2088, 0, 'config_c123', 'config_c123_status', '1', 0),
(2086, 0, 'config_c123', 'config_c123_cgid', '52', 0),
(2085, 0, 'config_c123', 'config_c123_authkey', 'EB003F5666A0F96BB56DCEB29FE16C68', 0),
(2084, 0, 'config_c123', 'config_c123_ac', '1001@501238260001', 0),
(3596, 0, 'config', 'config_length_class_id', '1', 0),
(3595, 0, 'config', 'config_currency_auto', '0', 0),
(3594, 0, 'config', 'config_currency', 'CNY', 0),
(3593, 0, 'config', 'config_admin_language', 'zh_CN', 0),
(3592, 0, 'config', 'config_language', 'zh_CN', 0),
(3591, 0, 'config', 'config_zone_id', '251', 0),
(3590, 0, 'config', 'config_country_id', '23', 0),
(3589, 0, 'config', 'config_comment', 'OpenCart2.1中文社区版（免费版） 由 www.opencart.cn出品， 成都光大网络科技有限公司 版权所有', 0),
(3588, 0, 'config', 'config_open', '', 0),
(3587, 0, 'config', 'config_image', '', 0),
(3586, 0, 'config', 'config_fax', '', 0),
(3585, 0, 'config', 'config_telephone', '123456789', 0),
(3584, 0, 'config', 'config_email', 'support@opencart.cn', 0),
(3583, 0, 'config', 'config_geocode', '4OS1ut0EX72MCu0R3P1lqCTu', 0),
(3582, 0, 'config', 'config_address', '四川省成都市高新西区天目路77号 成都光大网络科技有限公司', 0),
(3581, 0, 'config', 'config_owner', 'sunboy', 0),
(3580, 0, 'config', 'config_name', 'OpenCart2.1中文社区版（免费版）', 0),
(2044, 0, 'alipay', 'alipay_total', '0.01', 0),
(2045, 0, 'alipay', 'alipay_seller_email', 'sunboy@opencart.cn', 0),
(2046, 0, 'alipay', 'alipay_security_code', '63yf4qs9ht0t6ufjhcqeecsjy547yxpy', 0),
(2047, 0, 'alipay', 'alipay_partner', '2088002964544267', 0),
(2048, 0, 'alipay', 'alipay_currency_code', 'CNY', 0),
(2049, 0, 'alipay', 'alipay_order_status_id', '1', 0),
(2050, 0, 'alipay', 'alipay_wait_buyer_pay', '2', 0),
(2051, 0, 'alipay', 'alipay_wait_seller_send', '15', 0),
(2052, 0, 'alipay', 'alipay_wait_buyer_confirm', '3', 0),
(2053, 0, 'alipay', 'alipay_trade_finished', '5', 0),
(2054, 0, 'alipay', 'alipay_status', '1', 0),
(2055, 0, 'alipay', 'alipay_sort_order', '1', 0),
(2068, 0, 'free', 'free_sort_order', '1', 0),
(2065, 0, 'free', 'free_total', '0.01', 0),
(3578, 0, 'config', 'config_template', 'gd-free', 0),
(3579, 0, 'config', 'config_layout_id', '4', 0),
(3577, 0, 'config', 'config_meta_keyword', 'OpenCart2.1中文社区版（免费版）', 0),
(3576, 0, 'config', 'config_meta_description', 'OpenCart2.1中文社区版（免费版）', 0),
(3575, 0, 'config', 'config_meta_title', 'OpenCart2.1中文社区版（免费版）', 0),
(3678, 0, 'config', 'config_compression', '0', 0),
(3679, 0, 'config', 'config_secure', '0', 0),
(3680, 0, 'config', 'config_password', '1', 0),
(3681, 0, 'config', 'config_shared', '0', 0),
(3682, 0, 'config', 'config_encryption', 'To7QeZTgyW6byfrVoi2RPkB3kv7nSFroktWrk6tlRSC0AMgZZBdPENgmBogGD2tHij3a7Y7KTsHLGxrAlkufsmz7DzqI18JlhatluaYzPIb0oRuOCG5M1OCoaAGe4t2a3OPzs9JJot9iCzonX2PKlTcMbkFnD6H4rzXOSL4r0TB57NIrIUggZ7BmCOS1Uisyz1TJlgtgMQ3iUtn5ROo836nFGKFouTawZU7TU9bL6p0HaJ6SRIxlTxlK4kctdNKvAl9t8GzBBQ3f4RZHgKfb0Lv7JY0lu9qXl1w7nl2JbC8NIj0jFkyHfwoBka6JBNPHGRMcMjYymELD2pms1T0D9zHWMxJ0nOemnbU8Do82pQUndk6GhXxrj6VX7yL3ck5HTtmjTZnExyxDzM0yacloxAXOYGSMpCaUoe7zcLwX9lbTXXhN7onyVKRDUOUbSdKObdXttN8J7oe4jKQpAUjKGXCZku9gLxDObzPBxi8asU7rs5cG3pdoRY3EARKZgimTWDYq0lwxo7VHWMDImWm6bbey7mN0CEj1CcMWFgvcbb0KrjsBNkcSjYV5Sx5352zYvdZERCA86Xz1ihxNWUOW5FtMIhLtQmt9INagT1XtPLf8hwDki9UGty7LeuBhMqzISpiHSbaZ893FB2bHqEDFoID6sdkTnBfgwmFjQA8eVnxv2hcD3qsCo0qjlXnCKBulhVO1c4MBYD3YxReQH0leCeRdaiVxYSrcEcyQA2scvyPodUSZ2pY9yYTVFKhWZBDDRdH9jrZEgF9L0Nmp0U0yxCV8Wwr4CWeHWvIIvTANTvnYJlUOyel6VNgjwKFwMzwm8FFSED5BMeATUTy1GmrcEs4i9yXfyhqgE5tTszOYvK4YThjxykSbSc81aPoyzMmnID8JsXdLxWo5PtY5E0NQcu0KpokdrUeNAp5boGis2jZHhI7f8U8TTOkSpWTzFba2HGhDmfczHL6Um12GoBjiX0vWnTd3QkGltCC2WsHDRVNClcntMhDa0wxiFlxWPh0l', 0),
(3683, 0, 'config', 'config_file_max_size', '300000', 0),
(3684, 0, 'config', 'config_file_ext_allowed', 'zip\r\ntxt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc', 0),
(3685, 0, 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\n&quot;application/zip&quot;\r\napplication/x-zip\r\n&quot;application/x-zip&quot;\r\napplication/x-zip-compressed\r\n&quot;application/x-zip-compressed&quot;\r\napplication/rar\r\n&quot;application/rar&quot;\r\napplication/x-rar\r\n&quot;application/x-rar&quot;\r\napplication/x-rar-compressed\r\n&quot;application/x-rar-compressed&quot;\r\napplication/octet-stream\r\n&quot;application/octet-stream&quot;\r\naudio/mpeg\r\nvideo/quicktime\r\napplication/pdf', 0),
(3686, 0, 'config', 'config_error_display', '1', 0),
(3687, 0, 'config', 'config_error_log', '1', 0),
(3688, 0, 'config', 'config_error_filename', 'error.log', 0);

-- --------------------------------------------------------

--
-- 表的结构 `oc_stock_status`
--

DROP TABLE IF EXISTS `oc_stock_status`;
CREATE TABLE `oc_stock_status` (
  `stock_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`stock_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `oc_stock_status`
--

INSERT INTO `oc_stock_status` (`stock_status_id`, `language_id`, `name`) VALUES
(7, 2, '有库存'),
(8, 2, '预定'),
(5, 2, '脱销'),
(6, 2, '2-3 天');

-- --------------------------------------------------------

--
-- 表的结构 `oc_store`
--

DROP TABLE IF EXISTS `oc_store`;
CREATE TABLE `oc_store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_tax_class`
--

DROP TABLE IF EXISTS `oc_tax_class`;
CREATE TABLE `oc_tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`tax_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `oc_tax_class`
--

INSERT INTO `oc_tax_class` (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`) VALUES
(9, 'Taxable Goods', 'Taxed goods', '2009-01-06 23:21:53', '2011-09-23 14:07:50'),
(10, 'Downloadable Products', 'Downloadable', '2011-09-21 22:19:39', '2011-09-22 10:27:36');

-- --------------------------------------------------------

--
-- 表的结构 `oc_tax_rate`
--

DROP TABLE IF EXISTS `oc_tax_rate`;
CREATE TABLE `oc_tax_rate` (
  `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`tax_rate_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=88 ;

--
-- 转存表中的数据 `oc_tax_rate`
--

INSERT INTO `oc_tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`) VALUES
(86, 3, 'VAT (20%)', '20.0000', 'P', '2011-03-09 21:17:10', '2011-09-22 22:24:29'),
(87, 3, 'Eco Tax (-2.00)', '2.0000', 'F', '2011-09-21 21:49:23', '2011-09-23 00:40:19');

-- --------------------------------------------------------

--
-- 表的结构 `oc_tax_rate_to_customer_group`
--

DROP TABLE IF EXISTS `oc_tax_rate_to_customer_group`;
CREATE TABLE `oc_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`tax_rate_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_tax_rate_to_customer_group`
--

INSERT INTO `oc_tax_rate_to_customer_group` (`tax_rate_id`, `customer_group_id`) VALUES
(86, 1),
(87, 1);

-- --------------------------------------------------------

--
-- 表的结构 `oc_tax_rule`
--

DROP TABLE IF EXISTS `oc_tax_rule`;
CREATE TABLE `oc_tax_rule` (
  `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tax_rule_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=129 ;

--
-- 转存表中的数据 `oc_tax_rule`
--

INSERT INTO `oc_tax_rule` (`tax_rule_id`, `tax_class_id`, `tax_rate_id`, `based`, `priority`) VALUES
(121, 10, 86, 'payment', 1),
(120, 10, 87, 'store', 0),
(128, 9, 86, 'shipping', 1),
(127, 9, 87, 'shipping', 2);

-- --------------------------------------------------------

--
-- 表的结构 `oc_upload`
--

DROP TABLE IF EXISTS `oc_upload`;
CREATE TABLE `oc_upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`upload_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_url_alias`
--

DROP TABLE IF EXISTS `oc_url_alias`;
CREATE TABLE `oc_url_alias` (
  `url_alias_id` int(11) NOT NULL AUTO_INCREMENT,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`url_alias_id`),
  KEY `query` (`query`),
  KEY `keyword` (`keyword`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=897 ;

--
-- 转存表中的数据 `oc_url_alias`
--

INSERT INTO `oc_url_alias` (`url_alias_id`, `query`, `keyword`) VALUES
(824, 'product_id=48', 'ipod-classic'),
(836, 'category_id=20', 'desktops'),
(890, 'category_id=26', 'pc'),
(835, 'category_id=27', 'mac'),
(730, 'manufacturer_id=8', 'apple'),
(844, 'information_id=4', 'about_us'),
(873, 'product_id=42', 'test'),
(789, 'category_id=34', 'mp3-players'),
(781, 'category_id=36', 'test2'),
(774, 'category_id=18', 'laptop-notebook'),
(775, 'category_id=46', 'macs'),
(776, 'category_id=45', 'windows'),
(777, 'category_id=25', 'component'),
(895, 'category_id=29', 'mouse'),
(779, 'category_id=28', 'monitor'),
(780, 'category_id=35', 'test1'),
(893, 'category_id=30', 'printer'),
(892, 'category_id=31', 'scanner'),
(896, 'category_id=32', 'web-camera'),
(785, 'category_id=57', 'tablet'),
(786, 'category_id=17', 'software'),
(787, 'category_id=24', 'smartphone'),
(853, 'category_id=33', 'camera'),
(790, 'category_id=43', 'test11'),
(791, 'category_id=44', 'test12'),
(792, 'category_id=47', 'test15'),
(793, 'category_id=48', 'test16'),
(794, 'category_id=49', 'test17'),
(795, 'category_id=50', 'test18'),
(796, 'category_id=51', 'test19'),
(797, 'category_id=52', 'test20'),
(798, 'category_id=58', 'test25'),
(799, 'category_id=53', 'test21'),
(800, 'category_id=54', 'test22'),
(801, 'category_id=55', 'test23'),
(802, 'category_id=56', 'test24'),
(803, 'category_id=38', 'test4'),
(804, 'category_id=37', 'test5'),
(805, 'category_id=39', 'test6'),
(806, 'category_id=40', 'test7'),
(807, 'category_id=41', 'test8'),
(808, 'category_id=42', 'test9'),
(887, 'product_id=30', 'canon-eos-5d'),
(840, 'product_id=47', 'hp-lp3065'),
(811, 'product_id=28', 'htc-touch-hd'),
(888, 'product_id=43', 'macbook'),
(813, 'product_id=44', 'macbook-air'),
(814, 'product_id=45', 'macbook-pro'),
(816, 'product_id=31', 'nikon-d300'),
(817, 'product_id=29', 'palm-treo-pro'),
(818, 'product_id=35', 'product-8'),
(819, 'product_id=49', 'samsung-galaxy-tab-10-1'),
(820, 'product_id=33', 'samsung-syncmaster-941bw'),
(821, 'product_id=46', 'sony-vaio'),
(837, 'product_id=41', 'imac'),
(886, 'product_id=40', 'iphone'),
(825, 'product_id=36', 'ipod-nano'),
(826, 'product_id=34', 'ipod-shuffle'),
(827, 'product_id=32', 'ipod-touch'),
(828, 'manufacturer_id=9', 'canon'),
(829, 'manufacturer_id=5', 'htc'),
(830, 'manufacturer_id=7', 'hewlett-packard'),
(831, 'manufacturer_id=6', 'palm'),
(832, 'manufacturer_id=10', 'sony'),
(848, 'information_id=6', 'delivery'),
(846, 'information_id=3', 'privacy'),
(845, 'information_id=5', 'terms'),
(854, 'category_id=59', 'clothing'),
(889, 'product_id=50', 'women-white-clothing'),
(856, 'category_id=60', 'women-clothing'),
(864, 'product_id=51', 'persenality-clothing'),
(880, 'product_id=52', 'cheongsam-clothing'),
(865, 'product_id=54', 'zoom-clothing'),
(876, 'product_id=56', 'sanwei'),
(869, 'category_id=61', 'men-clothing'),
(879, 'product_id=57', '2015new-niuzai'),
(875, 'product_id=58', 'qiake-man'),
(874, 'product_id=59', 'dayi-clothing'),
(891, 'category_id=83', '');

-- --------------------------------------------------------

--
-- 表的结构 `oc_user`
--

DROP TABLE IF EXISTS `oc_user`;
CREATE TABLE `oc_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `image` varchar(255) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `oc_user`
--

INSERT INTO `oc_user` (`user_id`, `user_group_id`, `username`, `password`, `salt`, `firstname`, `lastname`, `email`, `image`, `code`, `ip`, `status`, `date_added`) VALUES
(1, 1, 'admin', '8a8fd7726fca740e442218594545f594319d75e9', 'GcNPkbRPX', 'John', '', 'support@opencart.cn', '', '', '127.0.0.1', 1, '2016-05-16 02:05:48');

-- --------------------------------------------------------

--
-- 表的结构 `oc_user_group`
--

DROP TABLE IF EXISTS `oc_user_group`;
CREATE TABLE `oc_user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY (`user_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `oc_user_group`
--

INSERT INTO `oc_user_group` (`user_group_id`, `name`, `permission`) VALUES
(1, 'Administrator', '{"access":["analytics\\/google_analytics","captcha\\/basic_captcha","captcha\\/google_captcha","catalog\\/attribute","catalog\\/attribute_group","catalog\\/category","catalog\\/download","catalog\\/filter","catalog\\/information","catalog\\/manufacturer","catalog\\/option","catalog\\/product","catalog\\/recurring","catalog\\/review","common\\/column_left","common\\/filemanager","common\\/menu","common\\/profile","common\\/sass","common\\/stats","customer\\/custom_field","customer\\/customer","customer\\/customer_group","design\\/banner","design\\/layout","extension\\/analytics","extension\\/captcha","extension\\/feed","extension\\/fraud","extension\\/installer","extension\\/modification","extension\\/module","extension\\/openbay","extension\\/payment","extension\\/shipping","extension\\/total","feed\\/google_base","feed\\/google_sitemap","feed\\/openbaypro","fraud\\/fraudlabspro","fraud\\/ip","fraud\\/maxmind","localisation\\/city","localisation\\/country","localisation\\/currency","localisation\\/geo_zone","localisation\\/language","localisation\\/length_class","localisation\\/location","localisation\\/order_status","localisation\\/return_action","localisation\\/return_reason","localisation\\/return_status","localisation\\/stock_status","localisation\\/tax_class","localisation\\/tax_rate","localisation\\/weight_class","localisation\\/zone","marketing\\/affiliate","marketing\\/contact","marketing\\/coupon","marketing\\/marketing","module\\/account","module\\/affiliate","module\\/banner","module\\/bestseller","module\\/carousel","module\\/category","module\\/featured","module\\/filter","module\\/google_hangouts","module\\/html","module\\/information","module\\/latest","module\\/slideshow","module\\/special","module\\/store","payment\\/alipay","payment\\/bank_transfer","payment\\/cod","payment\\/free_checkout","report\\/affiliate","report\\/affiliate_activity","report\\/affiliate_login","report\\/customer_activity","report\\/customer_credit","report\\/customer_login","report\\/customer_online","report\\/customer_order","report\\/customer_reward","report\\/marketing","report\\/product_purchased","report\\/product_viewed","report\\/sale_coupon","report\\/sale_order","report\\/sale_return","report\\/sale_shipping","report\\/sale_tax","sale\\/order","sale\\/recurring","sale\\/return","sale\\/voucher","sale\\/voucher_theme","setting\\/setting","setting\\/store","shipping\\/flat","shipping\\/free","shipping\\/item","shipping\\/pickup","shipping\\/weight","tool\\/backup","tool\\/error_log","tool\\/upload","total\\/coupon","total\\/credit","total\\/handling","total\\/klarna_fee","total\\/low_order_fee","total\\/reward","total\\/shipping","total\\/sub_total","total\\/tax","total\\/total","total\\/voucher","user\\/api","user\\/user","user\\/user_permission","module\\/sms","module\\/sms","module\\/latest","module\\/bestseller","module\\/special"],"modify":["analytics\\/google_analytics","captcha\\/basic_captcha","captcha\\/google_captcha","catalog\\/attribute","catalog\\/attribute_group","catalog\\/category","catalog\\/download","catalog\\/filter","catalog\\/information","catalog\\/manufacturer","catalog\\/option","catalog\\/product","catalog\\/recurring","catalog\\/review","common\\/column_left","common\\/filemanager","common\\/menu","common\\/profile","common\\/sass","common\\/stats","customer\\/custom_field","customer\\/customer","customer\\/customer_group","design\\/banner","design\\/layout","extension\\/analytics","extension\\/captcha","extension\\/feed","extension\\/fraud","extension\\/installer","extension\\/modification","extension\\/module","extension\\/openbay","extension\\/payment","extension\\/shipping","extension\\/total","feed\\/google_base","feed\\/google_sitemap","feed\\/openbaypro","fraud\\/fraudlabspro","fraud\\/ip","fraud\\/maxmind","localisation\\/city","localisation\\/country","localisation\\/currency","localisation\\/geo_zone","localisation\\/language","localisation\\/length_class","localisation\\/location","localisation\\/order_status","localisation\\/return_action","localisation\\/return_reason","localisation\\/return_status","localisation\\/stock_status","localisation\\/tax_class","localisation\\/tax_rate","localisation\\/weight_class","localisation\\/zone","marketing\\/affiliate","marketing\\/contact","marketing\\/coupon","marketing\\/marketing","module\\/account","module\\/affiliate","module\\/banner","module\\/bestseller","module\\/carousel","module\\/category","module\\/featured","module\\/filter","module\\/google_hangouts","module\\/html","module\\/information","module\\/latest","module\\/slideshow","module\\/special","module\\/store","payment\\/alipay","payment\\/bank_transfer","payment\\/cod","payment\\/free_checkout","report\\/affiliate","report\\/affiliate_activity","report\\/affiliate_login","report\\/customer_activity","report\\/customer_credit","report\\/customer_login","report\\/customer_online","report\\/customer_order","report\\/customer_reward","report\\/marketing","report\\/product_purchased","report\\/product_viewed","report\\/sale_coupon","report\\/sale_order","report\\/sale_return","report\\/sale_shipping","report\\/sale_tax","sale\\/order","sale\\/recurring","sale\\/return","sale\\/voucher","sale\\/voucher_theme","setting\\/setting","setting\\/store","shipping\\/flat","shipping\\/free","shipping\\/item","shipping\\/pickup","shipping\\/weight","tool\\/backup","tool\\/error_log","tool\\/upload","total\\/coupon","total\\/credit","total\\/handling","total\\/klarna_fee","total\\/low_order_fee","total\\/reward","total\\/shipping","total\\/sub_total","total\\/tax","total\\/total","total\\/voucher","user\\/api","user\\/user","user\\/user_permission","module\\/sms","module\\/sms","module\\/latest","module\\/bestseller","module\\/special"]}'),
(10, 'Demonstration', '');

-- --------------------------------------------------------

--
-- 表的结构 `oc_voucher`
--

DROP TABLE IF EXISTS `oc_voucher`;
CREATE TABLE `oc_voucher` (
  `voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_voucher_history`
--

DROP TABLE IF EXISTS `oc_voucher_history`;
CREATE TABLE `oc_voucher_history` (
  `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `oc_voucher_theme`
--

DROP TABLE IF EXISTS `oc_voucher_theme`;
CREATE TABLE `oc_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `oc_voucher_theme`
--

INSERT INTO `oc_voucher_theme` (`voucher_theme_id`, `image`) VALUES
(8, 'catalog/demo/canon_eos_5d_2.jpg'),
(7, 'catalog/demo/gift-voucher-birthday.jpg'),
(6, 'catalog/demo/apple_logo.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `oc_voucher_theme_description`
--

DROP TABLE IF EXISTS `oc_voucher_theme_description`;
CREATE TABLE `oc_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oc_voucher_theme_description`
--

INSERT INTO `oc_voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`) VALUES
(6, 2, 'Christmas'),
(7, 2, 'Birthday'),
(8, 2, 'General');

-- --------------------------------------------------------

--
-- 表的结构 `oc_weight_class`
--

DROP TABLE IF EXISTS `oc_weight_class`;
CREATE TABLE `oc_weight_class` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  PRIMARY KEY (`weight_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `oc_weight_class`
--

INSERT INTO `oc_weight_class` (`weight_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '1000.00000000');

-- --------------------------------------------------------

--
-- 表的结构 `oc_weight_class_description`
--

DROP TABLE IF EXISTS `oc_weight_class_description`;
CREATE TABLE `oc_weight_class_description` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`weight_class_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `oc_weight_class_description`
--

INSERT INTO `oc_weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 2, '千克 ', 'kg'),
(2, 2, '克  ', 'g');

-- --------------------------------------------------------

--
-- 表的结构 `oc_zone`
--

DROP TABLE IF EXISTS `oc_zone`;
CREATE TABLE `oc_zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4226 ;

--
-- 转存表中的数据 `oc_zone`
--

INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(27, 3, '沧州', 'cz', 1),
(26, 3, '承德', 'cd', 1),
(25, 3, '张家口', 'zjk', 1),
(24, 3, '保定', 'bd', 1),
(23, 3, '邢台', 'xt', 1),
(22, 3, '邯郸', 'hd', 1),
(21, 3, '秦皇岛', 'qhd', 1),
(20, 3, '唐山', 'ts', 1),
(19, 3, '石家庄', 'sjz', 1),
(28, 3, '廊坊', 'lf', 1),
(29, 3, '衡水', 'hs', 1),
(30, 4, '太原', 'ty', 1),
(31, 4, '大同', 'dt', 1),
(32, 4, '阳泉', 'yq', 1),
(33, 4, '长治', 'cz', 1),
(34, 4, '晋城', 'jc', 1),
(35, 4, '朔州', 'sz', 1),
(36, 4, '晋中', 'jz', 1),
(37, 4, '运城', 'yc', 1),
(38, 4, '忻州', 'xz', 1),
(39, 4, '临汾', 'lf', 1),
(40, 4, '吕梁地', 'lld', 1),
(41, 5, '呼和浩特', 'hhht', 1),
(42, 5, '包头', 'bt', 1),
(43, 5, '乌海', 'wh', 1),
(44, 5, '赤峰', 'cf', 1),
(45, 5, '通辽', 'tl', 1),
(46, 5, '鄂尔多斯', 'eeds', 1),
(47, 5, '呼伦贝尔', 'hlbe', 1),
(48, 5, '乌兰察布', 'wlcbm', 1),
(49, 5, '锡林郭勒', 'xlglm', 1),
(50, 5, '巴彦淖尔', 'bynem', 1),
(51, 5, '阿拉善', 'alsm', 1),
(52, 5, '兴安', 'xam', 1),
(53, 6, '沈阳', 'sy', 1),
(54, 6, '大连', 'dl', 1),
(55, 6, '鞍山', 'as', 1),
(56, 6, '抚顺', 'fs', 1),
(57, 6, '本溪', 'bx', 1),
(58, 6, '丹东', 'dd', 1),
(59, 6, '锦州', 'jz', 1),
(60, 6, '葫芦岛', 'hld', 1),
(61, 6, '营口', 'yk', 1),
(62, 6, '盘锦', 'pj', 1),
(63, 6, '阜新', 'fx', 1),
(64, 6, '辽阳', 'ly', 1),
(65, 6, '铁岭', 'tl', 1),
(66, 6, '朝阳', 'cy', 1),
(67, 7, '长春', 'cc', 1),
(68, 7, '吉林', 'jl', 1),
(69, 7, '四平', 'sp', 1),
(70, 7, '辽源', 'ly', 1),
(71, 7, '通化', 'th', 1),
(72, 7, '白山', 'bs', 1),
(73, 7, '松原', 'sy', 1),
(74, 7, '白城', 'bc', 1),
(75, 7, '延边', 'yb', 1),
(76, 8, '哈尔滨', 'heb', 1),
(77, 8, '齐齐哈尔', 'qqhe', 1),
(78, 8, '鹤岗', 'hg', 1),
(79, 8, '双鸭山', 'sys', 1),
(80, 8, '鸡西', 'jx', 1),
(81, 8, '大庆', 'dq', 1),
(82, 8, '伊春', 'yc', 1),
(83, 8, '牡丹江', 'mdj', 1),
(84, 8, '佳木斯', 'jms', 1),
(85, 8, '七台河', 'qth', 1),
(86, 8, '黑河', 'hh', 1),
(87, 8, '绥化', 'sh', 1),
(88, 8, '大兴安岭', 'dxald', 1),
(89, 10, '南京', 'nj', 1),
(90, 10, '徐州', 'xz', 1),
(91, 10, '连云港', 'lyg', 1),
(92, 10, '淮安', 'ha', 1),
(93, 10, '宿迁', 'sq', 1),
(94, 10, '盐城', 'yc', 1),
(95, 10, '扬州', 'yz', 1),
(96, 10, '泰州', 'tz', 1),
(97, 10, '南通', 'nt', 1),
(98, 10, '镇江', 'zj', 1),
(99, 10, '常州', 'cz', 1),
(100, 10, '无锡', 'wx', 1),
(101, 10, '苏州', 'sz', 1),
(102, 11, '杭州', 'hz', 1),
(103, 11, '宁波', 'nb', 1),
(104, 11, '温州', 'wz', 1),
(105, 11, '嘉兴', 'jx', 1),
(106, 11, '湖州', 'hz', 1),
(107, 11, '绍兴', 'sx', 1),
(108, 11, '金华', 'jh', 1),
(109, 11, '衢州', 'xz', 1),
(110, 11, '舟山', 'zs', 1),
(111, 11, '台州', 'tz', 1),
(112, 11, '丽水', 'ls', 1),
(113, 12, '合肥', 'hf', 1),
(114, 12, '芜湖', 'wh', 1),
(115, 12, '蚌埠', 'bb', 1),
(116, 12, '淮南', 'hn', 1),
(117, 12, '马鞍山', 'mas', 1),
(118, 12, '淮北', 'hb', 1),
(119, 12, '铜陵', 'tl', 1),
(120, 12, '安庆', 'aq', 1),
(121, 12, '黄山', 'hs', 1),
(122, 12, '滁州', 'cz', 1),
(123, 12, '阜阳', 'fy', 1),
(124, 12, '宿州', 'sz', 1),
(125, 12, '巢湖', 'ch', 1),
(126, 12, '六安', 'la', 1),
(127, 12, '亳州', 'hz', 1),
(128, 12, '池州', 'cz', 1),
(129, 12, '宣城', 'xc', 1),
(130, 13, '福州', 'fz', 1),
(131, 13, '厦门', 'xm', 1),
(132, 13, '三明', 'sm', 1),
(133, 13, '莆田', 'pt', 1),
(134, 13, '泉州', 'qz', 1),
(135, 13, '漳州', 'zz', 1),
(136, 13, '南平', 'np', 1),
(137, 13, '龙岩', 'ly', 1),
(138, 13, '宁德', 'nd', 1),
(139, 14, '南昌', 'nc', 1),
(140, 14, '景德镇', 'jdz', 1),
(141, 14, '萍乡', 'px', 1),
(142, 14, '九江', 'jj', 1),
(143, 14, '新余', 'xy', 1),
(144, 14, '鹰潭', 'yt', 1),
(145, 14, '赣州', 'gz', 1),
(146, 14, '吉安', 'ja', 1),
(147, 14, '宜春', 'yc', 1),
(148, 14, '抚州', 'fz', 1),
(149, 14, '上饶', 'sr', 1),
(150, 15, '济南', 'jn', 1),
(151, 15, '青岛', 'qd', 1),
(152, 15, '淄博', 'zb', 1),
(153, 15, '枣庄', 'zz', 1),
(154, 15, '东营', 'dy', 1),
(155, 15, '潍坊', 'wf', 1),
(156, 15, '烟台', 'yt', 1),
(157, 15, '威海', 'wh', 1),
(158, 15, '济宁', 'jn', 1),
(159, 15, '泰安', 'ta', 1),
(160, 15, '日照', 'rz', 1),
(161, 15, '莱芜', 'lw', 1),
(162, 15, '临沂', 'ly', 1),
(163, 15, '德州', 'dz', 1),
(164, 15, '聊城', 'lc', 1),
(165, 15, '滨州', 'bz', 1),
(166, 15, '菏泽', 'hz', 1),
(167, 16, '郑州', 'zz', 1),
(168, 16, '开封', 'kf', 1),
(169, 16, '洛阳', 'ly', 1),
(170, 16, '平顶山', 'pds', 1),
(171, 16, '焦作', 'jz', 1),
(172, 16, '鹤壁', 'hb', 1),
(173, 16, '新乡', 'xx', 1),
(174, 16, '安阳', 'ay', 1),
(175, 16, '濮阳', 'y', 1),
(176, 16, '许昌', 'xc', 1),
(177, 16, '漯河', 'h', 1),
(178, 16, '三门峡', 'smx', 1),
(179, 16, '南阳', 'ny', 1),
(180, 16, '商丘', 'sq', 1),
(181, 16, '信阳', 'xy', 1),
(182, 16, '周口', 'zk', 1),
(183, 16, '驻马店', 'zmd', 1),
(184, 16, '直辖行政单位', 'zxxzdw', 1),
(185, 17, '武汉', 'wh', 1),
(186, 17, '黄石', 'hs', 1),
(187, 17, '襄樊', 'xf', 1),
(188, 17, '十堰', 'sy', 1),
(189, 17, '荆州', 'jz', 1),
(190, 17, '宜昌', 'yc', 1),
(191, 17, '荆门', 'jm', 1),
(192, 17, '鄂州', 'ez', 1),
(193, 17, '孝感', 'xg', 1),
(194, 17, '黄冈', 'hg', 1),
(195, 17, '咸宁', 'xn', 1),
(196, 17, '随州', 'sz', 1),
(197, 17, '恩施', 'es', 1),
(198, 17, '直辖行政单位', 'zxxzdw', 1),
(199, 18, '长沙', 'cs', 1),
(200, 18, '株洲', 'zz', 1),
(201, 18, '湘潭', 'xt', 1),
(202, 18, '衡阳', 'hy', 1),
(203, 18, '邵阳', 'sy', 1),
(204, 18, '岳阳', 'yy', 1),
(205, 18, '常德', 'cd', 1),
(206, 18, '张家界', 'zjj', 1),
(207, 18, '益阳', 'yy', 1),
(208, 18, '郴州', 'cz', 1),
(209, 18, '永州', 'yz', 1),
(210, 18, '怀化', 'hh', 1),
(211, 18, '娄底', 'ld', 1),
(212, 18, '湘西', 'xx', 1),
(213, 19, '广州', 'gz', 1),
(214, 19, '深圳', 'sz', 1),
(215, 19, '珠海', 'zh', 1),
(216, 19, '汕头', 'st', 1),
(217, 19, '韶关', 'sg', 1),
(218, 19, '河源', 'hy', 1),
(219, 19, '梅州', 'mz', 1),
(220, 19, '惠州', 'hz', 1),
(221, 19, '汕尾', 'sw', 1),
(222, 19, '东莞', 'd', 1),
(223, 19, '中山', 'zs', 1),
(224, 19, '江门', 'jm', 1),
(225, 19, '佛山', 'fs', 1),
(226, 19, '阳江', 'yj', 1),
(227, 19, '湛江', 'zj', 1),
(228, 19, '茂名', 'mm', 1),
(229, 19, '肇庆', 'zq', 1),
(230, 19, '清远', 'qy', 1),
(231, 19, '潮州', 'cz', 1),
(232, 19, '揭阳', 'jy', 1),
(233, 19, '云浮', 'yf', 1),
(234, 20, '南宁', 'nn', 1),
(235, 20, '柳州', 'lz', 1),
(236, 20, '桂林', 'gl', 1),
(237, 20, '梧州', 'wz', 1),
(238, 20, '北海', 'bh', 1),
(239, 20, '防城港', 'fcg', 1),
(240, 20, '钦州', 'qz', 1),
(241, 20, '贵港', 'gg', 1),
(242, 20, '玉林', 'yl', 1),
(243, 20, '百色', 'bs', 1),
(244, 20, '贺州', 'hz', 1),
(245, 20, '河池', 'hc', 1),
(246, 20, '来宾', 'lb', 1),
(247, 20, '崇左', 'cz', 1),
(248, 21, '海口', 'hk', 1),
(249, 21, '三亚', 'sy', 1),
(250, 21, '省直辖行政单位', 'zxxzdw', 1),
(251, 23, '成都', 'cd', 1),
(252, 23, '自贡', 'zg', 1),
(253, 23, '攀枝花', 'pzh', 1),
(254, 23, '泸州', 'lz', 1),
(255, 23, '德阳', 'dy', 1),
(256, 23, '绵阳', 'my', 1),
(257, 23, '广元', 'gy', 1),
(258, 23, '遂宁', 'sn', 1),
(259, 23, '内江', 'nj', 1),
(260, 23, '乐山', 'ls', 1),
(261, 23, '南充', 'nc', 1),
(262, 23, '宜宾', 'yb', 1),
(263, 23, '广安', 'ga', 1),
(264, 23, '达州', 'dz', 1),
(265, 23, '眉山', 'ms', 1),
(266, 23, '雅安', 'ya', 1),
(267, 23, '巴中', 'bz', 1),
(268, 23, '资阳', 'zy', 1),
(269, 23, '阿坝', 'ab', 1),
(270, 23, '甘孜', 'gz', 1),
(271, 23, '凉山', 'ls', 1),
(272, 24, '贵阳', 'gy', 1),
(273, 24, '六盘水', 'lps', 1),
(274, 24, '遵义', 'zy', 1),
(275, 24, '安顺', 'as', 1),
(276, 24, '铜仁地', 'trd', 1),
(277, 24, '毕节地', 'bjd', 1),
(278, 24, '黔西南', 'qxn', 1),
(279, 24, '黔东南', 'qdn', 1),
(280, 24, '黔南', 'qn', 1),
(281, 25, '昆明', 'km', 1),
(282, 25, '曲靖', 'qj', 1),
(283, 25, '玉溪', 'yx', 1),
(284, 25, '保山', 'bs', 1),
(285, 25, '昭通', 'zt', 1),
(286, 25, '思茅', 'smd', 1),
(287, 25, '临沧', 'lcd', 1),
(288, 25, '丽江', 'lj', 1),
(289, 25, '文山', 'ws', 1),
(290, 25, '红河', 'hh', 1),
(291, 25, '西双版纳', 'xsbn', 1),
(292, 25, '楚雄', 'cx', 1),
(293, 25, '大理', 'dl', 1),
(294, 25, '德宏', 'dh', 1),
(295, 25, '怒江', 'nj', 1),
(296, 25, '迪庆', 'dq', 1),
(297, 26, '拉萨', 'ls', 1),
(298, 26, '那曲', 'nqd', 1),
(299, 26, '昌都', 'cdd', 1),
(300, 26, '山南', 'snd', 1),
(301, 26, '日喀则', 'rkzd', 1),
(302, 26, '阿里', 'ald', 1),
(303, 26, '林芝', 'lzd', 1),
(304, 27, '西安', 'xa', 1),
(305, 27, '铜川', 'tc', 1),
(306, 27, '宝鸡', 'bj', 1),
(307, 27, '咸阳', 'xy', 1),
(308, 27, '渭南', 'wn', 1),
(309, 27, '延安', 'ya', 1),
(310, 27, '汉中', 'hz', 1),
(311, 27, '榆林', 'yl', 1),
(312, 27, '安康', 'ak', 1),
(313, 27, '商洛', 'sl', 1),
(314, 28, '兰州', 'lz', 1),
(315, 28, '金昌', 'jc', 1),
(316, 28, '白银', 'by', 1),
(317, 28, '天水', 'ts', 1),
(318, 28, '嘉峪关', 'jyg', 1),
(319, 28, '武威', 'ww', 1),
(320, 28, '张掖', 'zy', 1),
(321, 28, '平凉', 'pl', 1),
(322, 28, '酒泉', 'jq', 1),
(323, 28, '庆阳', 'qy', 1),
(324, 28, '定西', 'dxd', 1),
(325, 28, '陇南', 'lnd', 1),
(326, 28, '甘南', 'gn', 1),
(327, 28, '临夏', 'lx', 1),
(328, 29, '西宁', 'xn', 1),
(329, 29, '海东', 'hdd', 1),
(330, 29, '海北', 'hb', 1),
(331, 29, '黄南', 'hn', 1),
(332, 29, '海南', 'hn', 1),
(333, 29, '果洛', 'gl', 1),
(334, 29, '玉树', 'ys', 1),
(335, 29, '海西', 'hx', 1),
(336, 30, '银川', 'yc', 1),
(337, 30, '石嘴山', 'szs', 1),
(338, 30, '吴忠', 'wz', 1),
(339, 30, '固原', 'gy', 1),
(340, 31, '乌鲁木齐', 'wlmq', 1),
(341, 31, '克拉玛依', 'klmy', 1),
(342, 31, '直辖行政单位', 'zxxzdw', 1),
(343, 31, '吐鲁番', 'tlfd', 1),
(344, 31, '哈密', 'hmd', 1),
(345, 31, '和田', 'htd', 1),
(346, 31, '阿克苏', 'aksd', 1),
(347, 31, '喀什', 'ksd', 1),
(348, 31, '克孜勒苏', 'kzls', 1),
(349, 31, '巴音郭楞', 'bygl', 1),
(350, 31, '昌吉', 'cj', 1),
(351, 31, '博尔塔拉', 'betl', 1),
(352, 31, '伊犁', 'yl', 1),
(353, 31, '塔城', 'tcd', 1),
(354, 31, '阿勒泰', 'altd', 1),
(355, 9, '市辖区', 'null', 1),
(356, 9, '县', 'null', 1),
(357, 22, '市辖区', 'null', 1),
(358, 22, '市', 'null', 1),
(359, 22, '县', 'null', 1),
(360, 2, '市辖区', 'null', 1),
(361, 2, '县', 'null', 1),
(4225, 1, '市辖区', '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `oc_zone_to_geo_zone`
--

DROP TABLE IF EXISTS `oc_zone_to_geo_zone`;
CREATE TABLE `oc_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`zone_to_geo_zone_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
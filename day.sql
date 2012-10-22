-- phpMyAdmin SQL Dump
-- version 3.4.9
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2012 年 10 月 22 日 19:08
-- 服务器版本: 5.5.20
-- PHP 版本: 5.3.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `day`
--

-- --------------------------------------------------------

--
-- 表的结构 `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `type` int(3) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `days`
--

CREATE TABLE IF NOT EXISTS `days` (
  `days_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `days_user_id` int(10) unsigned NOT NULL,
  `days_type` int(1) NOT NULL,
  `days_from_id` int(10) unsigned NOT NULL DEFAULT '0',
  `days_day` char(8) NOT NULL,
  `days_time` char(8) NOT NULL,
  `days_title` varchar(300) DEFAULT NULL,
  `days_content` varchar(4800) NOT NULL,
  `days_url` varchar(600) DEFAULT NULL,
  `days_image` varchar(50) DEFAULT NULL,
  `days_comment` int(11) NOT NULL DEFAULT '0',
  `days_like` int(11) NOT NULL DEFAULT '0',
  `days_favourite` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`days_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=459 ;

-- --------------------------------------------------------

--
-- 表的结构 `days_comment`
--

CREATE TABLE IF NOT EXISTS `days_comment` (
  `days_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `days_item_id` int(10) unsigned NOT NULL,
  `days_user_id` int(11) NOT NULL,
  `days_date` char(10) NOT NULL,
  `days_time` char(10) NOT NULL,
  `days_comment` varchar(600) NOT NULL,
  PRIMARY KEY (`days_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `friend`
--

CREATE TABLE IF NOT EXISTS `friend` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `friend_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=311 ;

-- --------------------------------------------------------

--
-- 表的结构 `register`
--

CREATE TABLE IF NOT EXISTS `register` (
  `register_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `register_email` varchar(40) NOT NULL,
  `register_password` char(50) NOT NULL,
  `register_active` enum('0','1') DEFAULT '0',
  `register_signal` char(50) NOT NULL,
  `register_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '用户什么时候创建了此账户',
  PRIMARY KEY (`register_id`),
  UNIQUE KEY `email` (`register_email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户注册' AUTO_INCREMENT=100019 ;

-- --------------------------------------------------------

--
-- 表的结构 `response`
--

CREATE TABLE IF NOT EXISTS `response` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `type` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tc_comment`
--

CREATE TABLE IF NOT EXISTS `tc_comment` (
  `tc_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tc_item_id` int(10) unsigned NOT NULL,
  `tc_user_id` int(11) NOT NULL,
  `tc_date` char(10) NOT NULL,
  `tc_time` char(10) NOT NULL,
  `tc_comment` varchar(1200) NOT NULL,
  PRIMARY KEY (`tc_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=152 ;

-- --------------------------------------------------------

--
-- 表的结构 `twitter`
--

CREATE TABLE IF NOT EXISTS `twitter` (
  `twitter_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `twitter_user_id` int(10) unsigned NOT NULL,
  `twitter_from_id` int(10) unsigned NOT NULL,
  `twitter_day` char(8) NOT NULL,
  `twitter_type` int(1) NOT NULL,
  `twitter_time` char(8) NOT NULL,
  `twitter_title` varchar(300) NOT NULL,
  `twitter_content` varchar(4800) NOT NULL,
  `twitter_url` varchar(600) NOT NULL,
  `twitter_image` varchar(50) DEFAULT NULL,
  `twitter_comment` int(11) NOT NULL DEFAULT '0',
  `twitter_like` int(11) NOT NULL DEFAULT '0',
  `twitter_favourite` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`twitter_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=491 ;

-- --------------------------------------------------------

--
-- 表的结构 `unknown_us`
--

CREATE TABLE IF NOT EXISTS `unknown_us` (
  `us_id` int(11) NOT NULL AUTO_INCREMENT,
  `us_name` varchar(80) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`us_id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='未添加大学的名称' AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_firstname` char(12) NOT NULL,
  `user_lastname` char(12) NOT NULL,
  `user_name` char(30) DEFAULT NULL,
  `user_birthday` date NOT NULL,
  `user_gender` enum('0','1') NOT NULL,
  `user_province` varchar(15) NOT NULL,
  `user_city` varchar(45) NOT NULL,
  `user_us_province` varchar(15) NOT NULL,
  `user_us` varchar(45) DEFAULT NULL,
  `user_permit` enum('2','3','4','5') NOT NULL,
  `user_img` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=100038 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

CREATE DATABASE IF NOT EXISTS `projectDB`;
USE `projectDB`;


CREATE TABLE IF NOT EXISTS `answer` (
  `num` int NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `posnum` int DEFAULT NULL,
  PRIMARY KEY (`num`)
)

CREATE TABLE IF NOT EXISTS `healthitem` (
  `num` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `hcontent` varchar(255) DEFAULT NULL,
  `fcperiod` varchar(255) DEFAULT NULL,
  `ptnum` int DEFAULT NULL,
  `gxnum` int DEFAULT NULL,
  `frnum` int DEFAULT NULL,
  `sellperiod` varchar(255) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `sellflag` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`num`)
)

CREATE TABLE IF NOT EXISTS `location` (
  `num` int NOT NULL,
  `id` varchar(255) DEFAULT NULL,
  `postnum` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `streetaddr` varchar(255) DEFAULT NULL,
  `parking` tinyint(1) DEFAULT NULL,
  `size` int DEFAULT NULL,
  `callnum` varchar(255) DEFAULT NULL,
  `companyinfo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`num`)
)


CREATE TABLE IF NOT EXISTS `mycart` (
  `num` int NOT NULL,
  `user` int DEFAULT NULL,
  `item` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `buyflag` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `item` (`item`),
  CONSTRAINT `mybag_ibfk_1` FOREIGN KEY (`item`) REFERENCES `healthitem` (`num`)
) 


CREATE TABLE IF NOT EXISTS `payitems` (
  `num` int NOT NULL,
  `usernum` int DEFAULT NULL,
  `paydate` varchar(255) DEFAULT NULL,
  `itemnum` int DEFAULT NULL,
  `payprice` int DEFAULT NULL,
  `paymethod` varchar(255) DEFAULT NULL,
  `payflag` tinyint(1) DEFAULT NULL,
  `ccflag` tinyint(1) DEFAULT NULL,
  `payback` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`num`)
) 


CREATE TABLE IF NOT EXISTS `qna` (
  `num` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `usernum` int DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `secret` tinyint(1) DEFAULT NULL,
  `frnum` int DEFAULT NULL,
  PRIMARY KEY (`num`)
) 



CREATE TABLE IF NOT EXISTS `reservation` (
  `num` int NOT NULL,
  `usernum` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phonenum` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `population` int DEFAULT NULL,
  `ccflag` tinyint(1) DEFAULT NULL,
  `frnum` int DEFAULT NULL,
  `reservdate` varchar(255) DEFAULT NULL,
  `carflag` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`num`)
) 



CREATE TABLE IF NOT EXISTS `review` (
  `num` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `usernum` int DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `secret` tinyint(1) DEFAULT NULL,
  `frnum` int DEFAULT NULL,
  PRIMARY KEY (`num`)
) 



CREATE TABLE IF NOT EXISTS `trainer` (
  `num` int NOT NULL,
  `user` int DEFAULT NULL,
  `imgpath` varchar(255) DEFAULT NULL,
  `career` varchar(255) DEFAULT NULL,
  `salary` int DEFAULT NULL,
  PRIMARY KEY (`num`)
) 



CREATE TABLE IF NOT EXISTS `trainerwork` (
  `num` int NOT NULL,
  `trainer` int DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `starttime` varchar(255) DEFAULT NULL,
  `endtime` varchar(255) DEFAULT NULL,
  `frnum` int DEFAULT NULL,
  PRIMARY KEY (`num`)
) 


CREATE TABLE IF NOT EXISTS `trainschedule` (
  `num` int NOT NULL,
  `user` int DEFAULT NULL,
  `trainer` int DEFAULT NULL,
  `lcontent` int DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `starttime` varchar(255) DEFAULT NULL,
  `endtime` varchar(255) DEFAULT NULL,
  `frnum` int DEFAULT NULL,
  PRIMARY KEY (`num`)
)



CREATE TABLE IF NOT EXISTS `user` (
  `num` varchar(255) NOT NULL,
  `id` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `birth` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `postnum` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `streetaddr` varchar(255) DEFAULT NULL,
  `joindate` varchar(255) DEFAULT NULL,
  `point` int DEFAULT NULL,
  `sns` int DEFAULT NULL,
  `snsid` varchar(255) DEFAULT NULL,
  `snspwd` varchar(255) DEFAULT NULL,
  `authority` int DEFAULT NULL,
  `frnum` int DEFAULT NULL,
  PRIMARY KEY (`num`)
) 

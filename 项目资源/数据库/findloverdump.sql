-- MySQL dump 10.13  Distrib 5.7.16, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: findlover
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Database Initialize
-- 
DROP DATABASE IF EXISTS findlover;
CREATE DATABASE findlover CHARACTER SET utf8;
USE findlover;

--
-- Table structure for table `admin`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `flag` int(11) NOT NULL DEFAULT '1' COMMENT '0：超级管理员、1：普通管理员',
  `create_time` datetime NOT NULL,
  `last_login` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1008 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `flag`, `create_time`, `last_login`) VALUES (1001,'admin','d1d317984f2b77f0e3dbe22bd36d61a7',0,'2017-10-31 16:11:44','2017-11-05 14:12:04'),(1002,'gss','89e8b73cc665717104ef06dfb1358ce4',1,'2017-11-03 09:49:58','2017-11-04 19:34:16'),(1003,'yyf','556fe1677f75a91b471d89874aafc1d2',1,'2017-11-03 09:53:11','2017-11-04 19:45:26'),(1004,'hgh','0e66d509dda9d280731d22f22ece4374',1,'2017-11-03 09:53:54','1970-01-01 00:00:00'),(1005,'wm','e2def63a42038c8c9e7a9d99ee377766',1,'2017-11-03 09:54:26','2017-11-04 22:44:31'),(1007,'ceshi1','5675179cc4a9abcff789eb06bed0a868',1,'2017-11-04 15:08:29','1970-01-01 00:00:00');

--
-- Table structure for table `admin_role`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_role` (
  `admin_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  KEY `FK_fk_araid` (`admin_id`),
  KEY `FK_fk_arrid` (`role_id`),
  CONSTRAINT `FK_fk_araid` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_fk_arrid` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_role`
--

INSERT INTO `admin_role` (`admin_id`, `role_id`) VALUES (1004,3),(1005,4),(1005,5),(1001,1),(1001,2),(1001,3),(1001,4),(1001,5),(1001,6),(1001,7),(1002,1),(1002,2),(1002,3),(1007,1),(1007,3),(1003,1),(1003,2),(1004,1),(1005,1);

--
-- Table structure for table `complain`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `com_obj` int(11) NOT NULL,
  `reason` varchar(50) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `com_time` datetime NOT NULL,
  `status` int(11) DEFAULT '0' COMMENT '0：待处理、1：忽略、2：警告、3：封号',
  `admin_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_fk_comadminid` (`admin_id`),
  KEY `FK_fk_comobjid` (`com_obj`),
  KEY `FK_fk_comuserid` (`user_id`),
  CONSTRAINT `FK_fk_comadminid` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`),
  CONSTRAINT `FK_fk_comobjid` FOREIGN KEY (`com_obj`) REFERENCES `user_basic` (`id`),
  CONSTRAINT `FK_fk_comuserid` FOREIGN KEY (`user_id`) REFERENCES `user_basic` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complain`
--

INSERT INTO `complain` (`id`, `user_id`, `com_obj`, `reason`, `content`, `com_time`, `status`, `admin_id`) VALUES (1,100002,100012,'违法信息','由于您操作过于频繁 请稍后返回首页重新操作','2017-10-26 20:47:26',1,NULL),(2,100002,100012,'有害信息','由于您操作过于频繁 请稍后返回首页重新操作','2017-10-26 21:17:41',3,NULL),(3,100003,100004,'有害信息','由于您操作过于频繁 请稍后返回首页重新操作','2017-10-26 21:17:41',0,NULL),(4,100042,100033,'违法信息','由于您操作过于频繁 请稍后返回首页重新操作','2017-10-26 20:47:26',2,NULL),(5,100045,100042,'违法信息','\n;,.,','2017-11-05 09:05:50',0,NULL);

--
-- Table structure for table `dict`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL,
  `value` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dict`
--

INSERT INTO `dict` (`id`, `type`, `value`) VALUES (1,'education','高中及以下'),(2,'education','中专'),(3,'education','大专'),(4,'education','大学本科'),(5,'education','硕士'),(6,'education','博士'),(12,'marry_status','未婚'),(13,'marry_status','离异'),(14,'marry_status','丧偶'),(15,'job','销售'),(16,'job','客户服务'),(17,'job','计算机/互联网'),(18,'job','通信/电子'),(19,'job','生产/制造'),(20,'job','物流/仓储'),(21,'job','商贸/采购'),(22,'job','人事/行政'),(23,'job','高级管理'),(24,'job','广告/市场'),(25,'job','传媒/艺术'),(26,'job','生物/制药'),(27,'job','医疗/护理'),(28,'job','金融/保险'),(29,'job','建筑/房地产'),(30,'job','咨询/顾问'),(31,'job','法律'),(32,'job','财会/审计'),(33,'job','教育/科研'),(34,'job','服务业'),(35,'job','交通运输'),(36,'job','政府机构'),(37,'job','军人/警察'),(38,'job','农林牧渔'),(39,'job','自由职业'),(40,'job','在校学生'),(41,'job','待业'),(42,'job','其他行业'),(43,'animal','鼠'),(44,'animal','牛'),(45,'animal','虎'),(46,'animal','兔'),(47,'animal','龙'),(48,'animal','蛇'),(49,'animal','马'),(50,'animal','羊'),(51,'animal','猴'),(52,'animal','鸡'),(53,'animal','狗'),(54,'animal','猪'),(55,'zodiac','白羊座'),(56,'zodiac','金牛座'),(57,'zodiac','双子座'),(58,'zodiac','巨蟹座'),(59,'zodiac','狮子座'),(60,'zodiac','处女座'),(61,'zodiac','天秤座'),(62,'zodiac','天蝎座'),(63,'zodiac','射手座'),(64,'zodiac','摩羯座'),(65,'zodiac','水平座'),(66,'zodiac','双鱼座'),(67,'religion','不信教'),(68,'religion','佛教'),(69,'religion','道教'),(70,'religion','伊斯兰教'),(71,'religion','基督教'),(72,'religion','天主教'),(73,'religion','儒家门徒'),(74,'religion','不可知论者'),(75,'religion','其他宗教'),(76,'job_time','有双休'),(77,'job_time','工作忙碌'),(78,'job_time','工作清闲'),(79,'job_time','自由工作出差'),(80,'job_time','经常出差'),(81,'love_history','初恋还在'),(82,'love_history','谈过3次以内恋爱'),(83,'love_history','情场高手'),(84,'marry_time','认同闪婚'),(85,'marry_time','一年内'),(86,'marry_time','两年内'),(87,'marry_time','三年内'),(88,'marry_time','时机成熟就结婚'),(89,'parent_status','父母均健在'),(90,'parent_status','只有母亲健在'),(91,'parent_status','只有父亲健在'),(92,'parent_status','父母均已离世'),(93,'bro_and_sis','独生子女'),(94,'bro_and_sis','2'),(95,'bro_and_sis','3'),(96,'bro_and_sis','4'),(97,'bro_and_sis','更多'),(98,'com_reason','违法信息'),(99,'com_reason','有害信息'),(100,'com_reason','人身攻击我'),(101,'live_condition','和家人同住'),(102,'live_condition','已购房'),(103,'live_condition','租房'),(104,'live_condition','打算婚后购房'),(105,'live_condition','单位宿舍');

--
-- Table structure for table `essay`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `essay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `writer_id` int(11) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `pub_time` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '0：下架，1：审核通过，2：待审核',
  `admin_id` int(11) DEFAULT NULL,
  `like_count` int(11) DEFAULT '0',
  `visit_count` int(11) DEFAULT '0',
  `photo` varchar(255) DEFAULT NULL,
  `brief` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_fk_essayadminid` (`admin_id`),
  KEY `FK_fk_wewid` (`writer_id`),
  CONSTRAINT `FK_fk_essayadminid` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`),
  CONSTRAINT `FK_fk_wewid` FOREIGN KEY (`writer_id`) REFERENCES `writer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `essay`
--

INSERT INTO `essay` (`id`, `writer_id`, `title`, `filename`, `pub_time`, `status`, `admin_id`, `like_count`, `visit_count`, `photo`, `brief`) VALUES (1,1,'老实男人就适合当男友？','group1/M00/00/01/rBEuvln33yCACowVAAAWYIcHBjc622.txt','2017-11-01 10:16:44',1,NULL,1,4,'group1/M00/00/01/rBEuvln5RU2AcyRHAAD_33uoJkU256.jpg','第一次见她说实话没有什么特别的感觉，大概是我很慢热，不会有太热烈的情感，毕竟这世界没那么多的一见钟情，只是觉得不讨厌，可以接触下，至少做朋友是可以的。'),(2,2,'男友该有哪些品质？','group1/M00/00/01/rBEuvln33yCACowVAAAWYIcHBjc622.txt','2017-10-31 09:16:06',1,NULL,1,12,'group1/M00/00/01/rBEuvln5osCAeR-NAADpJ8VFujg864.jpg','会慢慢的觉得跟她相处在一起很轻松，可以放松工作中崩得紧紧的神经，和她一起不被打扰的讨论各自的爱好，印象深刻的电影，单曲循环的歌，爱吃的食物，想去的地方，对未来的构想。\r\n\r\n　　我对于地域其实是有一些介怀的，不是很想找离武汉太远的，而她老家在广西'),(3,4,'如何正确正视对方?','group1/M00/00/01/rBEuvln33yCACowVAAAWYIcHBjc622.txt','2017-11-01 16:50:00',1,NULL,3,4,'group1/M00/00/01/rBEuvln5pKGAdFWrAAEEkn7INaI596.jpg','跟喜欢的人在一起，有说不完的话，她爱运动爱旅行，平时在一起永远充满活力，活泼可爱又善解人意，三观合得来，对同一件事往往有相似的看法。对于这段感情，我能很明显的感觉到她也有很在意，心里暖洋洋的。爱情本来就是两个人的事情，只有一个人的'),(5,1,'我们的两年牵手路','group1/M00/00/01/rBEuvln5RU2ACLDKAAALUM263pE448.txt','2017-11-01 16:50:15',1,NULL,17,27,'group1/M00/00/01/rBEuvln5RU2AcyRHAAD_33uoJkU256.jpg','　　我们住的近，每周休息的时候都有约会，有个人在身边，感情上有依托，心里才会踏实，希望我们以后能够在人生路上永远相伴。同时也希望感谢珍爱网提供了让我们彼此相识相知的机会，祝福还在珍爱网寻寻觅觅的单身会员们能尽快找到属于自己的人生伴侣。'),(6,3,'如何走入爱情的婚姻？','group1/M00/00/01/rBEuvln5osCAF1j2AAALSgZgnFI523.txt','2017-11-01 18:40:46',1,NULL,1,9,'group1/M00/00/01/rBEuvln5osCAeR-NAADpJ8VFujg864.jpg','        爱情是人类永恒的话题，电影里总会有一条感情线贯穿始末，歌曲里有人在感悟爱情轻轻吟唱，文章里有对爱情入木三分的描绘。年轻男女们都会有对爱情的美好想象，我自然也不能免俗，会在看到街上情侣手'),(7,4,'爱情是如何修炼成功的？','group1/M00/00/01/rBEuvln5pKGAIhySAAANDsMbr1Y455.txt','2017-11-01 18:41:04',0,NULL,4,4,'group1/M00/00/01/rBEuvln5pKGAdFWrAAEEkn7INaI596.jpg','        找不到对象是都市男女共同面对的困境，白天愁工作，晚上愁对象。泱泱大国人口密度这样大，...'),(9,1,'直播网','group1/M00/00/02/wKgrmln6mimAeTm1AAAAyHmZzC8643.txt','2017-11-02 12:08:46',1,NULL,3,9,'group1/M00/00/02/wKgrmln6mimAE6BsAAEz9IJnsb8837.jpg','阿三...'),(10,1,'我们在一起两年了','group1/M00/00/02/rBEuvln7BS6AJ8dmAAAOhKghaQo085.txt',NULL,2,NULL,0,0,'group1/M00/00/02/rBEuvln7BS6AWc-YAACw-I3KgNQ893.jpg','某一个午夜梦回，窗外整夜亮着的霓虹灯透过窗帘缝隙照进灯光到卧室里，看着斑驳光影里空荡荡的半边床，听着...'),(11,13,'男人为什么更偏爱“狐狸精”的女人？','group1/M00/00/02/rBEuvln8NHGAKg_TAAAyNleNVt0371.txt','2017-11-03 17:22:14',1,1001,2,5,'group1/M00/00/02/rBEuvln8NHGAa4liAAOiP0nRVtw888.jpg','事实上，男人面对那样的女人根本不会有兴趣和她聊看法。他们渴望的永远是和漂亮女生谈恋爱。明白这个亘古不...');
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 trigger Trigger_writer_essay after insert
on essay for each row
update writer set essay_count=essay_count+1 where id=new.writer_id */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER Trigger_writer_essay_del
AFTER DELETE ON essay
FOR EACH ROW
  UPDATE writer set essay_count=essay_count-1 WHERE id=old.writer_id */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `essay_photo`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `essay_photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `essay_id` int(11) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `essay_id` (`essay_id`),
  CONSTRAINT `essay_photo_ibfk_1` FOREIGN KEY (`essay_id`) REFERENCES `essay` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `essay_photo`
--

INSERT INTO `essay_photo` (`id`, `essay_id`, `photo`) VALUES (1,5,'group1/M00/00/01/rBEuvln5RSWAXy6SAACw-I3KgNQ129.jpg'),(2,NULL,'group1/M00/00/01/rBEuvln5ogKAJFQOAADpJ8VFujg520.jpg'),(3,NULL,'group1/M00/00/01/rBEuvln5pHSAf4JsAAB1e4fljfE579.jpg'),(4,NULL,'group1/M00/00/01/rBEuvln6dPuADIABAACE4ckXuu0378.jpg'),(5,NULL,'group1/M00/00/01/rBEuvln6dYeAarloAACE4ckXuu0515.jpg'),(6,NULL,'group1/M00/00/01/rBEuvln6eyCASiVuAACE4ckXuu0536.jpg'),(7,NULL,'group1/M00/00/01/rBEuvln6e0qACu9wAACIponWObk609.jpg'),(8,NULL,'group1/M00/00/02/wKgrmln6mhWACJGfAAJTuPblSyc197.jpg'),(9,NULL,'group1/M00/00/02/rBEuvln7AV2ACYU4AAD_33uoJkU291.jpg'),(10,NULL,'group1/M00/00/02/rBEuvln7AvKAWwTGAATZuFJoABM239.jpg'),(11,NULL,'group1/M00/00/02/rBEuvln7Av6ALUScAAD_33uoJkU265.jpg'),(12,NULL,'group1/M00/00/02/rBEuvln7A1iAW6A6AACw-I3KgNQ892.jpg'),(13,NULL,'group1/M00/00/02/rBEuvln8NGSAAS6uAAC-OBHF7gs837.jpg'),(14,NULL,'group1/M00/00/02/rBEuvln9s9KAGTK8AA9EGjNKta4467.gif'),(15,NULL,'group1/M00/00/02/rBEuvln9wXiAbc3QAAAdn14Dea0265.jpg');

--
-- Table structure for table `follow`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `follow_id` int(11) DEFAULT NULL,
  `follow_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_fk_uffollowid` (`follow_id`),
  KEY `FK_fk_ufuserid` (`user_id`),
  CONSTRAINT `FK_fk_uffollowid` FOREIGN KEY (`follow_id`) REFERENCES `user_basic` (`id`),
  CONSTRAINT `FK_fk_ufuserid` FOREIGN KEY (`user_id`) REFERENCES `user_basic` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow`
--

INSERT INTO `follow` (`id`, `user_id`, `follow_id`, `follow_time`) VALUES (3,100002,100012,'2017-10-27 16:19:38'),(20,100045,100003,'2017-10-30 16:39:35'),(26,100045,100024,'2017-10-30 19:45:49'),(27,100045,100034,'2017-10-30 19:46:02'),(28,100045,100004,'2017-10-30 20:16:00'),(29,100003,100045,'2017-10-30 20:47:10'),(30,100006,100045,'2017-10-30 20:47:13'),(31,100023,100045,'2017-10-30 20:47:15'),(32,100025,100045,'2017-10-30 20:47:17'),(33,100045,100044,'2017-10-30 21:01:26'),(36,100045,100006,'2017-10-31 10:53:51'),(37,100045,100023,'2017-10-31 11:40:07'),(38,100006,100028,'2017-10-31 14:03:57'),(39,100006,100026,'2017-10-31 14:04:19'),(40,100006,100029,'2017-10-31 14:04:29'),(41,100002,100006,'2017-10-31 16:12:25'),(42,100002,100017,'2017-11-01 17:12:25'),(43,100005,100002,'2017-11-01 18:25:58'),(44,100045,100033,'2017-11-01 22:30:51'),(45,100002,100005,'2017-11-03 10:40:30'),(46,100024,100005,'2017-11-03 10:40:38'),(48,100045,100032,'2017-11-04 21:05:04'),(49,100045,100042,'2017-11-05 09:05:22'),(53,100045,100030,'2017-11-05 13:57:44');

--
-- Table structure for table `label`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `label` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `meaning` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `label`
--

INSERT INTO `label` (`id`, `name`, `meaning`) VALUES (1,'高收入','high_salary'),(2,'高学历','high_education'),(3,'有车一族','have_car'),(4,'有房一族','have_house'),(5,'公务员','civil_servant'),(6,'程序员','programmer');

--
-- Table structure for table `letter`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `letter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `send_id` int(11) DEFAULT NULL,
  `recieve_id` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `send_time` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_fk_letterrecieveid` (`recieve_id`),
  KEY `FK_fk_lettersendid` (`send_id`),
  CONSTRAINT `FK_fk_letterrecieveid` FOREIGN KEY (`recieve_id`) REFERENCES `user_basic` (`id`),
  CONSTRAINT `FK_fk_lettersendid` FOREIGN KEY (`send_id`) REFERENCES `user_basic` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100110 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `letter`
--

INSERT INTO `letter` (`id`, `send_id`, `recieve_id`, `content`, `send_time`, `status`) VALUES (100001,100001,100005,'hello','2017-10-21 17:35:56',1),(100002,100005,100001,'hello','2017-10-21 17:36:19',0),(100003,100005,100001,'hello','2017-10-21 17:36:37',0),(100004,100001,100005,'hello','2017-10-21 17:37:01',1),(100005,100005,100001,'hello','2017-10-21 17:37:26',0),(100006,100002,100005,'hello','2017-10-23 10:18:50',1),(100007,100003,100002,'hello','2017-10-23 10:19:11',0),(100008,100002,100003,'123456678','2017-10-23 10:19:43',0),(100009,100005,100003,'hahahahaha','2017-10-23 10:19:53',0),(100010,100003,100005,'nihao','2017-10-23 10:20:28',1),(100011,100005,100003,'hahahahaha','2017-10-23 10:20:41',0),(100012,100005,100007,'hahahahaha','2017-10-23 10:20:54',0),(100013,100007,100005,'nihao','2017-10-23 10:21:14',1),(100014,100007,100005,'hahahahaha','2017-10-23 10:21:36',1),(100015,100005,100006,'hello','2017-10-23 10:22:22',0),(100016,100006,100005,'hahahahaha','2017-10-23 10:22:39',1),(100017,100005,100006,'nihao','2017-10-23 10:22:59',0),(100018,100002,100003,'hahahahaha','2017-10-24 15:59:08',0),(100019,100002,100003,'nihao','2017-10-24 15:59:22',0),(100020,100003,100002,'nihao','2017-10-24 15:59:45',0),(100021,100002,100003,'hahahahaha','2017-10-24 16:00:02',0),(100022,100005,100001,'hahahahaha','2017-10-24 19:48:46',0),(100023,100001,100005,'nihao','2017-10-24 19:48:48',1),(100024,100005,100001,'hahahahaha','2017-10-24 19:48:49',0),(100025,100002,100005,'hahahahaha','2017-10-24 19:48:51',1),(100026,100003,100002,'nihao','2017-10-24 19:48:53',0),(100027,100002,100003,'hahahahaha','2017-10-24 19:48:54',0),(100028,100005,100003,'hello','2017-10-24 19:48:55',0),(100029,100003,100005,'hahahahaha','2017-10-24 19:48:56',1),(100030,100005,100003,'nihao','2017-10-24 19:48:57',0),(100031,100005,100007,'hahahahaha','2017-10-24 19:48:57',0),(100032,100007,100005,'hello','2017-10-24 19:48:58',1),(100033,100007,100005,'hello','2017-10-24 19:48:59',1),(100034,100005,100006,'hello','2017-10-24 19:49:05',0),(100035,100002,100003,'nihao','2017-10-24 19:50:17',0),(100036,100003,100002,'nihao','2017-10-24 19:50:24',0),(100037,100003,100002,'你现在在干什么呢？','2017-10-26 08:46:46',0),(100038,100003,100002,'你现在在干什么呢？','2017-10-26 08:46:49',0),(100039,100003,100002,'你现在在干什么呢？','2017-10-26 08:46:50',1),(100040,100003,100002,'你现在在干什么呢？','2017-10-26 08:46:50',1),(100041,100003,100002,'你是谁','2017-10-26 08:47:24',0),(100042,100003,100002,'how are you？','2017-10-26 08:47:36',0),(100043,100003,100002,'你叫啥？','2017-10-26 09:02:42',0),(100044,100003,100002,'你叫啥？','2017-10-26 09:03:54',0),(100045,100005,100006,'你叫啥？','2017-10-26 09:09:27',0),(100046,100005,100006,'sad','2017-10-26 14:56:33',0),(100047,100005,100006,'asd','2017-10-26 14:56:38',0),(100048,100005,100006,'asd','2017-10-26 14:56:43',0),(100049,100005,100006,'sdsad','2017-10-26 14:57:01',0),(100050,100005,100006,'啊实打实的','2017-10-26 14:57:04',0),(100051,100005,100006,'撒大声地','2017-10-26 14:57:07',0),(100052,100005,100006,'撒大声地','2017-10-26 14:57:14',0),(100053,100005,100006,'啊实打实打算','2017-10-26 14:57:17',0),(100054,100005,100006,'规范丰富的广泛的','2017-10-26 14:57:19',0),(100055,100005,100006,'大师傅似的','2017-10-26 14:57:24',0),(100056,100005,100006,'a','2017-10-26 16:45:23',0),(100057,100005,100006,'s','2017-10-26 16:45:25',0),(100058,100005,100006,'s','2017-10-26 16:45:26',0),(100059,100005,100006,'a','2017-10-26 16:46:44',0),(100060,100005,100006,'a','2017-10-26 16:46:47',0),(100061,100005,100006,'a','2017-10-26 16:46:53',0),(100062,100005,100006,'a','2017-10-26 16:59:26',0),(100063,100005,100006,'a','2017-10-26 16:59:29',0),(100064,100005,100006,'a','2017-10-26 16:59:30',0),(100065,100005,100006,'1','2017-10-26 17:19:29',0),(100066,100005,100006,'1','2017-10-26 17:19:32',0),(100067,100005,100006,'1','2017-10-26 17:21:30',0),(100068,100005,100006,'q','2017-10-26 17:22:38',0),(100069,100003,100002,'gaoshaoshuai ','2017-10-26 20:33:11',0),(100070,100005,100001,'hello','2017-10-27 10:04:08',0),(100071,100005,100010,'qw','2017-10-27 10:22:41',0),(100072,100005,100039,'123','2017-10-27 10:31:43',0),(100073,100005,100015,'asd','2017-10-27 10:34:12',0),(100074,100012,100001,'你好\n','2017-10-27 16:58:28',0),(100075,100012,100005,'你好','2017-10-27 16:58:42',1),(100076,100045,100003,'有钱','2017-10-27 17:22:51',0),(100077,100045,100015,'yi \n','2017-10-27 17:24:39',0),(100078,100045,100015,'yi ','2017-10-27 17:28:08',0),(100079,100005,100034,'lisi9\n','2017-10-30 09:53:39',0),(100080,100005,100001,'aa\n\n','2017-10-30 10:10:07',0),(100081,100001,100001,'nihao \n','2017-10-30 19:34:11',0),(100082,100001,100001,'hello','2017-10-30 19:34:15',0),(100083,100001,100001,'my name is david','2017-10-30 19:34:28',0),(100084,100001,100002,'1','2017-10-30 19:35:46',1),(100085,100001,100003,'qw','2017-10-30 19:44:16',0),(100086,100001,100005,'1','2017-10-30 19:46:54',1),(100087,100012,100005,'nh','2017-10-31 11:23:54',1),(100088,100012,100005,'nihao ','2017-10-31 11:23:59',1),(100089,100012,100005,'sad','2017-10-31 11:25:50',1),(100090,100012,100005,'asd','2017-10-31 11:26:07',1),(100091,100012,100009,'123','2017-10-31 11:57:06',0),(100092,100002,100045,'你好啊','2017-10-31 15:28:35',0),(100093,100002,100045,'你好奔跑的小猪','2017-10-31 16:33:05',1),(100094,100002,100045,'好好啊','2017-10-31 16:34:45',0),(100095,100012,100009,'123123','2017-10-31 19:30:08',0),(100096,100009,100001,'123','2017-10-31 19:30:30',0),(100097,100002,100017,'你好啊','2017-11-01 17:12:33',0),(100098,100005,100002,'hello','2017-11-01 18:24:54',1),(100099,100005,100009,'nihao a ','2017-11-01 20:25:07',0),(100100,100005,100009,'hello啊','2017-11-01 20:25:13',0),(100101,100045,100033,'哈哈哈','2017-11-01 22:31:52',0),(100102,100045,100033,'...','2017-11-01 22:44:40',0),(100103,100045,100032,'123','2017-11-01 22:57:34',0),(100104,100005,100002,'nihao','2017-11-02 09:33:13',1),(100105,100005,100028,'nihao，麦粒','2017-11-02 10:40:08',0),(100106,100005,100028,'nihao','2017-11-02 12:11:55',0),(100107,100005,100003,'nihao','2017-11-02 12:12:52',0),(100108,100002,100024,'haha ','2017-11-02 14:28:08',0),(100109,100045,100009,'df','2017-11-05 13:57:12',0);

--
-- Table structure for table `message`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `pub_time` datetime DEFAULT NULL,
  `like_count` int(11) DEFAULT '0',
  `reply_count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_fk_msguserid` (`user_id`),
  CONSTRAINT `FK_fk_msguserid` FOREIGN KEY (`user_id`) REFERENCES `user_basic` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `user_id`, `content`, `pub_time`, `like_count`, `reply_count`) VALUES (1,100005,'gooby my almost lover goobye my hopeless dream','2017-10-30 14:01:25',0,0),(5,100002,'可以发动太吗','2017-10-26 09:09:52',2,1),(7,100002,'开始将东方航空是否是打开发货时间付费u复合肥可视电话防守打法开始将上岛咖啡看司法解释快递费','2017-10-26 15:48:38',2,3),(10,100026,'至少今天你欠缺的明天见，人间的圆总是不够远','2017-10-31 14:46:37',2,1),(11,100028,'its shame to no one to blame, mother sweep,chidren sleep','2017-10-31 14:48:27',1,0),(12,100029,'u will love me  i will lover if u will just take me it might just complete me','2017-10-31 14:49:36',2,2),(13,100045,'夏天的氛围，打开电台，我要踢走这些忧郁，脚踩着浪花。在树荫下畅饮','2017-10-31 14:50:45',3,2),(16,100006,'baby i feel crazy all night all night and every day.give me something but you say nothing. i just wanna keep calling your name util you come back home','2017-10-31 15:55:42',2,4),(17,100002,'走了一趟那绚烂华丽背后的虚假，想那些愉悦，的哪些忧伤','2017-10-31 16:13:34',2,1),(18,100005,'还没好好恋一次爱，十二生肖就轮了两遍了～我已长发及腰，但是，没有但是了，头发该剪了～都说本命年犯太岁，今年好像也没有很不顺，但求15年转运～你好！再见！','2017-11-01 18:55:13',3,3),(21,100045,'hehe','2017-11-05 14:17:06',1,0);

--
-- Table structure for table `message_like`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_like` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `like_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_fk_msgrlikemid` (`message_id`),
  KEY `FK_fk_msgruid` (`user_id`),
  CONSTRAINT `FK_fk_msgrlikemid` FOREIGN KEY (`message_id`) REFERENCES `message` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_fk_msgruid` FOREIGN KEY (`user_id`) REFERENCES `user_basic` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_like`
--

INSERT INTO `message_like` (`id`, `message_id`, `user_id`, `like_time`) VALUES (1,7,100002,'2017-10-26 18:37:08'),(3,5,100002,'2017-10-26 19:39:21'),(5,13,100006,'2017-10-31 15:13:24'),(6,12,100006,'2017-10-31 15:33:51'),(7,11,100006,'2017-10-31 15:36:20'),(8,10,100006,'2017-10-31 15:41:08'),(9,17,100002,'2017-10-31 16:13:55'),(10,16,100002,'2017-10-31 16:14:12'),(13,13,100002,'2017-11-01 15:54:14'),(14,10,100002,'2017-11-01 15:55:41'),(15,17,100005,'2017-11-01 18:52:34'),(16,16,100005,'2017-11-01 18:52:35'),(19,13,100005,'2017-11-01 18:52:44'),(20,12,100005,'2017-11-01 18:52:45'),(21,7,100005,'2017-11-01 18:53:00'),(22,5,100005,'2017-11-01 18:53:02'),(23,18,100005,'2017-11-01 18:55:22'),(24,18,100002,'2017-11-02 09:30:45'),(29,18,100045,'2017-11-05 09:15:14'),(30,21,100045,'2017-11-05 14:17:14');
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 trigger Trigger_msgreplylike after insert
on message_like for each row
update message set like_count=like_count+1 where id=new.message_id */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `message_reply`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `reply_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_fk_mrmsgid` (`message_id`),
  KEY `FK_fk_msgruserid` (`user_id`),
  CONSTRAINT `FK_fk_mrmsgid` FOREIGN KEY (`message_id`) REFERENCES `message` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_fk_msgruserid` FOREIGN KEY (`user_id`) REFERENCES `user_basic` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_reply`
--

INSERT INTO `message_reply` (`id`, `message_id`, `user_id`, `content`, `reply_time`) VALUES (1,7,100002,'是防守打法','2017-10-26 19:38:45'),(6,7,100002,'your finger tuch aross my skin ','2017-10-27 14:16:24'),(8,7,100002,'i nerver want to see you unhappy ','2017-10-27 14:17:24'),(12,13,100006,'说的真好！','2017-10-31 15:43:06'),(13,13,100006,'美女可以留个联系方式吗','2017-10-31 15:43:53'),(14,12,100006,'i will lover you util  you take me away','2017-10-31 15:45:21'),(15,5,100006,'可以的哟，哈哈，我都不知道怎么成功的','2017-10-31 15:45:57'),(16,12,100006,'so ,if want go ,baby lets go .if want role ,now ready to role.','2017-10-31 15:53:42'),(17,16,100002,'我要怎么说我不爱你，我要怎么做才能死心，我们一再一再的证明。。。。','2017-10-31 16:16:06'),(18,16,100002,'i miss you so much tonight give me a hug in loney night','2017-10-31 16:16:57'),(19,16,100002,'i feel so bad tonight much i drink so much coffee i can not sleep day and night ','2017-10-31 16:17:42'),(21,10,100002,'when i say all i needs id a little love in dark','2017-10-31 16:20:46'),(22,16,100005,'i just a little girl lost in a moment i am so scary but i don\'t know it i can\'t figur it out','2017-11-01 09:31:09'),(23,18,100005,'\"你知道深爱是什么感觉吗?\" \"就像房间突然黑了，我不是去找灯而是去找他。\"','2017-11-01 18:55:44'),(24,17,100005,'一个小时前我想吃玉米，但是因为冷不想出去就吃了包薯片。半个小时前我又想吃玉米于是我吃了一个橙子。我到现在还想吃玉米，所以我又吃了饼干和酸奶，但是我还想吃玉米。这种就像我真的喜欢你，半路喜欢别人也没有用，最后还是喜欢你。','2017-11-01 18:56:10'),(25,18,100002,'好的呢','2017-11-02 09:30:55'),(28,18,100045,NULL,'2017-11-05 09:15:30');
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 trigger Trigger_msg_reply after insert
on message_reply for each row
update message set reply_count=reply_count+1 where id=new.message_id */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `notice`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `pub_time` datetime DEFAULT NULL,
  `pub_obj` int(11) DEFAULT NULL COMMENT '0:所有用户，1:vip，2:星级用户，Id:用户id',
  PRIMARY KEY (`id`),
  KEY `FK_fk_noticeaaid` (`admin_id`),
  CONSTRAINT `FK_fk_noticeaaid` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

INSERT INTO `notice` (`id`, `admin_id`, `title`, `content`, `pub_time`, `pub_obj`) VALUES (1,1002,'会员通知','尊敬的用户您好，恭喜您成为我们的VIP会员','2017-11-02 19:13:48',100002),(2,1004,'欢迎加入寻爱大家庭','欢迎加入寻爱大家庭，希望在这里能找到您的另一半','2017-11-02 20:33:53',0),(3,1005,'专门给VIP用户发的通知','专门给VIP用户发的通知','2017-11-02 20:40:43',1),(4,1003,'专门给星级用户发的通知','专门给用户用户发的通知','2017-11-02 20:41:03',2),(6,1001,'真爱会员俱乐部','敬爱的会员您好，为了方便用户进行交流，我们成立了线下交流俱乐部，欢迎报名加入，详情联系QQ:76558337','2017-11-03 11:35:59',0),(8,1001,'你最近行为不当，被其他用户举报！','你最近行为不当，被其他用户举报！','2017-11-03 16:00:18',100033),(9,NULL,'成功故事审核','尊敬的用户，您的爱人发布了一条成功故事等待您审核呢，快来看看吧','2017-11-04 20:34:59',100005),(10,NULL,'成功故事审核','尊敬的用户，您的爱人发布了一条成功故事等待您审核呢，快来看看吧<a href =http://localhost/success_story/confirmSuccessStory/22>http://localhost/success_story/confirmSuccessStory/22</a>','2017-11-04 21:33:00',100045),(11,NULL,'成功故事审核','尊敬的用户，您的爱人发布了一条成功故事等待您审核呢，快来看看吧<a href =http://localhost/success_story/confirmSuccessStory/25>http://localhost/success_story/confirmSuccessStory/25</a>','2017-11-05 13:10:54',100045),(13,NULL,'成功故事审核','尊敬的用户，您的爱人发布了一条成功故事等待您审核呢，快来看看吧<a href=\"http://localhost/success_story/confirmSuccessStory/27?left=100012\">http://localhost/success_story/confirmSuccessStory/27?left=100012</a>','2017-11-05 13:39:54',100045),(14,NULL,'成功故事审核','尊敬的用户，您的爱人发布了一条成功故事等待您审核呢，快来看看吧<a href=\"http://localhost/success_story/confirmSuccessStory/28?left=100012\">http://localhost/success_story/confirmSuccessStory/28?left=100012</a>','2017-11-05 13:53:11',100045);

--
-- Table structure for table `notice_user`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice_user` (
  `notice_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `read_time` datetime NOT NULL,
  PRIMARY KEY (`notice_id`),
  KEY `FK_fk_unuid` (`user_id`),
  CONSTRAINT `FK_fk_unnid` FOREIGN KEY (`notice_id`) REFERENCES `notice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_fk_unuid` FOREIGN KEY (`user_id`) REFERENCES `user_basic` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice_user`
--

INSERT INTO `notice_user` (`notice_id`, `user_id`, `read_time`) VALUES (1,100002,'2017-11-03 11:12:10'),(2,100002,'2017-11-03 11:12:06'),(3,100002,'2017-11-03 15:15:53'),(4,100002,'2017-11-03 11:02:31'),(6,100002,'2017-11-03 15:15:46'),(10,100045,'2017-11-04 21:35:35'),(11,100045,'2017-11-05 13:11:55'),(13,100045,'2017-11-05 13:40:07'),(14,100045,'2017-11-05 13:53:56');

--
-- Table structure for table `permission`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `value` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`id`, `name`, `value`) VALUES (1,'用户信息查询','user:select'),(2,'用户状态修改','user:update'),(3,'标签信息查询','label:select'),(4,'增加新标签','label:insert'),(5,'删除标签','label:delete'),(6,'修改标签','label:update'),(7,'作家信息查询','writer:select'),(8,'新增作家','writer:insert'),(9,'修改作家账户','writer:update'),(10,'文章信息查询','essay:select'),(11,'文章状态修改','essay:update'),(12,'文章删除','essay:delete'),(13,'文章审核','essay:authenticate'),(14,'用户动态信息查询','message:select'),(15,'删除用户动态','message:select'),(16,'成功故事信息查询','successStory:select'),(17,'成功故事审核','successStory:authenticate'),(18,'成功故事状态修改','successStory:update'),(19,'通知列表查看','notice:select'),(20,'发布新通知','notice:insert'),(21,'投诉信息查询','complain:select'),(24,'投诉审核','complain:authenticate');

--
-- Table structure for table `role`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `value` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`, `value`) VALUES (1,'用户管理','user'),(2,'寻爱驿站管理','stage'),(3,'成功故事管理','successStory'),(4,'通知管理','notice'),(5,'投诉管理','complain'),(6,'管理员管理','admin'),(7,'权限管理','permission');

--
-- Table structure for table `role_permission`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_permission` (
  `role_id` int(11) DEFAULT NULL,
  `permission_id` int(11) DEFAULT NULL,
  KEY `FK_fk_rmrid` (`role_id`),
  KEY `FK_fk_rmmid` (`permission_id`),
  CONSTRAINT `FK_fk_rmmid` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_fk_rmrid` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permission`
--

INSERT INTO `role_permission` (`role_id`, `permission_id`) VALUES (2,7),(2,8),(2,9),(2,10),(2,11),(2,12),(2,13),(2,14),(2,15),(3,16),(3,17),(3,18),(4,19),(4,20),(5,21),(1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,21),(5,24),(1,24);

--
-- Table structure for table `success_story`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `success_story` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `left_user` int(11) DEFAULT NULL,
  `right_user` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `content` text,
  `success_time` datetime DEFAULT NULL,
  `like_count` int(11) DEFAULT NULL,
  `reply_count` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '0：下架，1：审核通过，2：待右手审核，3：待管理员审核',
  `admin_id` int(11) DEFAULT NULL,
  `brief` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_fk_ssadminid` (`admin_id`),
  KEY `FK_fk_ucleftid` (`left_user`),
  KEY `FK_fk_ucrightid` (`right_user`),
  CONSTRAINT `FK_fk_ssadminid` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`),
  CONSTRAINT `FK_fk_ucleftid` FOREIGN KEY (`left_user`) REFERENCES `user_basic` (`id`),
  CONSTRAINT `FK_fk_ucrightid` FOREIGN KEY (`right_user`) REFERENCES `user_basic` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `success_story`
--

INSERT INTO `success_story` (`id`, `left_user`, `right_user`, `title`, `content`, `success_time`, `like_count`, `reply_count`, `status`, `admin_id`, `brief`, `photo`) VALUES (7,100001,100005,'我们终于在一起了','group1/M00/00/01/rBEuvln36smAQxWyAAANYOe_ySM506.txt','2017-10-31 11:15:22',0,0,1,1001,'因为身边有朋友在珍爱网服务过，有成功找到对象的，也有没找到的，不过这种个人因素占很大比重的事情，苛求百分百的成功率...','group1/M00/00/01/rBEuvln5h9KAHkxjAADpJ8VFujg415.jpg'),(8,100007,100004,'我们的恋爱经历','group1/M00/00/01/rBEuvln363eAYpFfAAAMbxaryWM862.txt','2017-10-31 11:18:15',0,1,1,NULL,'大城市工作的女生格外难找对象，据说深圳的男女比例是三比七，大多女生都是单身，不知不觉我也快...','group1/M00/00/01/rBEuvln6dQCAAC3AAACE4ckXuu0413.jpg'),(9,100012,100041,'我们在一起了~~','group1/M00/00/01/rBEuvln36-uAUFIgAAAM8ORZRds336.txt','2017-10-31 11:20:12',0,0,2,NULL,'我是个爽朗的东北姑娘，176的高高个子，爱运动爱生活，对一切都充满了积极的态度。生活也没什么不顺心，除了爱...','group1/M00/00/02/rBEuvln6vX6ABRmFAACw-I3KgNQ900.jpg'),(10,100002,100005,'我们在一起两年了','group1/M00/00/01/rBEuvln5h9KAWTp8AAAK8mk0WfU591.txt','2017-11-01 16:37:38',0,0,2,NULL,'爱情是人类永恒的话题，电影里总会有一条感情线贯穿始末，歌曲里有人在感悟爱情轻轻吟唱，文章里有对爱情入木三分的描绘。年轻男女们都会有对爱情的美好想象，我自然也不能免俗，会在看到街上情侣手牵手散步的时候想...','group1/M00/00/02/rBEuvln7AxOAYtxbAAC-OBHF7gs459.jpg'),(13,100009,100007,'牵手最好的你','group1/M00/00/02/rBEuvln7AxOAC4dSAAAL1RlhH6Q222.txt','2017-11-02 19:35:45',0,0,3,NULL,'在我身上投射着很多理工科男生的缩影，完成学业参加工作后，生活圈子里很少再有合适的女生出现...','group1/M00/00/02/rBEuvln7AxOAYtxbAAC-OBHF7gs459.jpg'),(14,100011,100016,'和你一起，把生活写成诗','group1/M00/00/02/rBEuvln7A3KAcfTaAAAPXqtkdB0109.txt','2017-11-02 19:37:20',0,2,1,NULL,'某一个午夜梦回，窗外整夜亮着的霓虹灯透过窗帘缝隙照进灯光到卧室里，看着斑驳光影里空荡荡的半边床...','group1/M00/00/02/rBEuvln7A3KAW9n1AAB1e4fljfE551.jpg'),(15,100012,100015,'爱情甜蜜蜜','group1/M00/00/02/rBEuvln7A62AeVrLAAAOhKghaQo626.txt','2017-10-28 19:38:19',1,1,1,NULL,'某一个午夜梦回，窗外整夜亮着的霓虹灯透过窗帘缝隙照进灯光到卧室里，看着斑驳光影里空荡荡的半边床...','group1/M00/00/02/rBEuvln7A62AXic8AAEEkn7INaI758.jpg'),(16,100035,100023,'我们的恋爱经历','group1/M00/00/01/rBEuvln363eAYpFfAAAMbxaryWM862.txt','2017-11-02 19:41:03',0,0,2,NULL,'因为身边有朋友在珍爱网服务过，有成功找到对象的，也有没找到的，不过这种个人因素占很大比重的事情，苛求百分百的成功率...','group1/M00/00/01/rBEuvln5h9KAHkxjAADpJ8VFujg415.jpg'),(17,100036,100024,'我们在一起了~~','group1/M00/00/01/rBEuvln36-uAUFIgAAAM8ORZRds336.txt','2017-11-02 19:41:04',0,0,2,NULL,'大城市工作的女生格外难找对象，据说深圳的男女比例是三比七，大多女生都是单身，不知不觉我也快...','group1/M00/00/01/rBEuvln6dQCAAC3AAACE4ckXuu0413.jpg'),(18,100037,100025,'我们在一起两年了','group1/M00/00/01/rBEuvln5h9KAWTp8AAAK8mk0WfU591.txt','2017-11-02 19:41:05',21,19,1,NULL,'我是个爽朗的东北姑娘，176的高高个子，爱运动爱生活，对一切都充满了积极的态度。生活也没什么不顺心，除了爱...','group1/M00/00/02/rBEuvln6vX6ABRmFAACw-I3KgNQ900.jpg'),(19,100038,100026,'测试文章1','group1/M00/00/01/rBEuvln6dQCAHyGMAAAAhqdKHqA200.txt','2017-11-02 19:41:06',0,3,1,NULL,'爱情是人类永恒的话题，电影里总会有一条感情线贯穿始末，歌曲里有人在感悟爱情轻轻吟唱，文章里有对爱情入木三分的描绘。年轻男女们都会有对爱情的美好想象，我自然也不能免俗，会在看到街上情侣手牵手散步的时候想...','group1/M00/00/02/rBEuvln7AxOAYtxbAAC-OBHF7gs459.jpg'),(22,100041,100029,'和你一起，把生活写成诗','group1/M00/00/02/rBEuvln7A3KAcfTaAAAPXqtkdB0109.txt','2017-11-02 19:41:09',0,0,1,NULL,'在我身上投射着很多理工科男生的缩影，完成学业参加工作后，生活圈子里很少再有合适的女生出现...','group1/M00/00/02/rBEuvln7AxOAYtxbAAC-OBHF7gs459.jpg'),(25,100012,100045,'桂豪啊好','group1/M00/00/02/rBEuvln-nV6ATfE5AAAAFln4wyA316.txt','2017-11-05 13:10:54',0,0,2,NULL,'测试文章111...','group1/M00/00/02/rBEuvln-nV6AcSUmAADpJ8VFujg444.jpg'),(27,100012,100045,'桂豪啊好11111222','group1/M00/00/02/rBEuvln-pCqALC8DAAAACwOwYUA666.txt','2017-11-05 13:39:54',0,0,3,NULL,'2222...','group1/M00/00/02/rBEuvln-pCqAQ1EMAAB1e4fljfE938.jpg'),(28,100012,100045,'3333333333','group1/M00/00/02/rBEuvln-p0aAQ-nzAAAAFZb6mE8673.txt','2017-11-05 13:53:11',0,0,1,NULL,'33333333333333...','group1/M00/00/02/rBEuvln-p0aAP8ugAAB1e4fljfE700.jpg');

--
-- Table structure for table `success_story_like`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `success_story_like` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `success_story_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `like_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_fk_sslikesid` (`success_story_id`),
  KEY `FK_fk_sslikeuid` (`user_id`),
  CONSTRAINT `FK_fk_sslikesid` FOREIGN KEY (`success_story_id`) REFERENCES `success_story` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_fk_sslikeuid` FOREIGN KEY (`user_id`) REFERENCES `user_basic` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `success_story_like`
--

INSERT INTO `success_story_like` (`id`, `success_story_id`, `user_id`, `like_time`) VALUES (21,18,100005,'2017-11-04 17:58:08'),(22,15,100045,'2017-11-05 09:14:01');
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 trigger trigger_sslike after insert
on success_story_like for each row
update success_story set like_count=like_count+1 where id=new.success_story_id */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `success_story_reply`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `success_story_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ss_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `reply_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_fk_ssrssid` (`ss_id`),
  KEY `FK_fk_ssruserid` (`user_id`),
  CONSTRAINT `FK_fk_ssrssid` FOREIGN KEY (`ss_id`) REFERENCES `success_story` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_fk_ssruserid` FOREIGN KEY (`user_id`) REFERENCES `user_basic` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `success_story_reply`
--

INSERT INTO `success_story_reply` (`id`, `ss_id`, `user_id`, `content`, `reply_time`) VALUES (1,14,100005,'恭喜恭喜','2017-11-04 17:06:46'),(2,18,100005,'真好','2017-11-04 17:33:28'),(3,18,100005,'棒棒哒！','2017-11-04 17:34:00'),(4,18,100005,'123','2017-11-04 20:10:42'),(5,18,100005,'123','2017-11-04 20:10:45'),(6,18,100005,'123','2017-11-04 20:10:47'),(7,18,100005,'123','2017-11-04 20:10:50'),(8,18,100005,'123','2017-11-04 20:10:53'),(9,18,100005,'真好','2017-11-04 20:11:16'),(10,18,100005,'棒棒哒！','2017-11-04 20:11:17'),(11,18,100005,'123','2017-11-04 20:11:18'),(12,18,100005,'123','2017-11-04 20:11:19'),(13,18,100005,'123','2017-11-04 20:11:20'),(14,18,100005,'123','2017-11-04 20:11:21'),(15,18,100005,'123','2017-11-04 20:11:23'),(16,18,100005,'真好','2017-11-04 20:11:21'),(17,18,100005,'棒棒哒！','2017-11-04 20:11:24'),(18,18,100005,'123','2017-11-04 20:11:25'),(19,18,100005,'123','2017-11-04 20:11:26'),(20,18,100005,'123','2017-11-04 20:11:26'),(21,19,100005,'咦','2017-11-04 20:26:19'),(22,19,100005,'不错哦','2017-11-04 20:26:34'),(23,19,100005,'小伙子','2017-11-04 20:26:50'),(24,14,100005,'qwe','2017-11-04 20:33:42'),(25,15,100045,'nnk','2017-11-05 09:13:55'),(26,8,100045,'ddd','2017-11-05 14:22:24');
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 trigger trigger_ssreply after insert
on success_story_reply for each row
update success_story set reply_count=reply_count+1 where id=new.ss_id */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user_asset`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_asset` (
  `id` int(11) NOT NULL,
  `vip_deadline` datetime DEFAULT '1970-01-01 11:11:11',
  `star_deadline` datetime DEFAULT '1970-01-01 11:11:11',
  `asset` int(11) DEFAULT '0',
  `cost` double DEFAULT '0',
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_fk_uaid` FOREIGN KEY (`id`) REFERENCES `user_basic` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_asset`
--

INSERT INTO `user_asset` (`id`, `vip_deadline`, `star_deadline`, `asset`, `cost`) VALUES (100000,'2017-12-10 16:55:21','2017-12-29 16:56:16',100,0),(100001,'2016-11-23 19:06:29','2015-10-23 21:19:37',0,52.1),(100002,'2017-12-03 14:43:28','2017-11-17 16:55:30',80,0),(100003,'2018-10-20 16:56:00','2017-12-09 20:21:23',10,0),(100005,'2022-06-29 16:55:21','2018-01-05 16:56:35',948,3751.3399999999997),(100008,'2018-10-23 18:19:21','2017-11-02 18:19:14',0,521),(100009,'2018-10-23 21:09:51','2017-11-04 21:09:07',0,625.2),(100011,'2018-10-23 21:31:46','2017-11-09 21:31:43',0,885.7),(100012,'2017-11-24 14:00:52','2017-11-20 14:00:48',0,1406.7),(100024,'2017-12-31 09:12:26','2017-12-31 09:12:31',200,200),(100045,'1970-01-01 11:11:11','1970-01-01 11:11:11',460,0);

--
-- Table structure for table `user_basic`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_basic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `tel` varchar(50) NOT NULL,
  `sex` char(2) NOT NULL,
  `birthday` date NOT NULL,
  `photo` varchar(255) NOT NULL,
  `marry_status` varchar(50) NOT NULL,
  `height` int(11) NOT NULL,
  `sexual` char(2) NOT NULL,
  `education` varchar(50) NOT NULL,
  `workplace` varchar(50) NOT NULL,
  `salary` double(9,2) NOT NULL,
  `live_condition` varchar(50) DEFAULT NULL,
  `authority` int(11) NOT NULL DEFAULT '1' COMMENT '个人资料可见性（0：所有用户不可见，1：所有用户可见，2：仅我关注的人可见）',
  `status` int(11) NOT NULL COMMENT '账户状态（0：锁定，1：激活，2：未激活）',
  `code` varchar(255) DEFAULT NULL COMMENT '用户激活码',
  `reg_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100049 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_basic`
--

INSERT INTO `user_basic` (`id`, `email`, `password`, `nickname`, `tel`, `sex`, `birthday`, `photo`, `marry_status`, `height`, `sexual`, `education`, `workplace`, `salary`, `live_condition`, `authority`, `status`, `code`, `reg_time`) VALUES (100000,'gss@qq.com','0e0dc18e4418a863a7d2d13de15db78a','gsssss','123','男','1997-07-19','group1/M00/00/01/rBEuvln31OuAYLz5AAHz6vOfkNI626.jpg','未婚',175,'男','大学本科','山东-济南',8000.00,'单位宿舍',1,1,NULL,'2017-10-17 21:02:53'),(100001,'a@a.com','03b170c9e8bd799dd1d2b1d42982e63b','Tom','13222131223','男','1997-10-16','group1/M00/00/01/rBEuvln4PHmAeDgRAABlhpZ40Sc478.jpg','未婚',173,'女','博士','山东-济宁',20000.00,'已购房',1,0,NULL,'2017-10-17 15:12:13'),(100002,'sinna@163.com','cf026a42cced1e54786c2d8bad456494','sinna','18764543221','女','1996-08-01','group1/M00/00/02/rBEuvln8EH-AYVHAAARNI2VWixQ257.jpg','未婚',168,'男','大学本科','北京-朝阳区',5000.00,'已购房',0,1,NULL,'2017-10-17 15:12:09'),(100003,'sinnamm@163.com','84491cb4390e00a116f076ad8065dd46','sinnamm','123','女','1996-08-01','group1/M00/00/01/rBEuvln4UmeAfrCnAAZWoBDWdNg742.jpg','未婚',168,'女','大学本科','北京-海淀区',7000.00,'打算婚后购房',1,1,NULL,'2017-10-17 15:12:09'),(100004,'1472610316@qq.com','5744d2d77c7cff43a3fce0d71bf3a662','aaa','17865166639','男','1987-10-06','group1/M00/00/01/rBEuvln4PHmAXhCvAAClgAwZey8111.jpg','未婚',161,'男','大专','山东-淄博',11111.00,'已购房',2,1,'50005637-14b3-4599-8416-b1a86639dca8','2017-10-18 11:48:14'),(100005,'b@a.com','0121fdf450aaa71df8fd0ffb1a8c9f51','我是程序袁','13222222222','男','1994-10-06','group1/M00/00/01/rBEuvln4VECAaBatAAKl7lmtFgI263.jpg','未婚',178,'女','高中及以下','山东-济宁',3000.00,'和家人同住',2,1,'b96086a9-f706-41f0-9a3a-33fc167fb7d8','2017-10-17 18:05:29'),(100006,'gss@gss.com','ecc0bd875ef81563677dedfb129f3b50','Gss','132','男','1991-10-16','group1/M00/00/01/rBEuvln32SSAa5OEAAMjDSnPUy0059.jpg','未婚',173,'女','大学本科','山东-菏泽',5000.00,'单位宿舍',1,1,NULL,'2017-10-17 15:12:13'),(100007,'zhangsan@163.com','8a82d3b22a4794dfea23a5b8a7c35388','zhangsan','16527783355','男','1992-12-01','group1/M00/00/01/rBEuvln4PHmAAXEvAAAg_1uOQ-4292.jpg','未婚',177,'女','硕士','山东-青岛',8000.00,'和家人同住',0,1,'a82b2b1f-ee86-43d3-a5d4-67327b91a063','2017-10-21 15:29:56'),(100008,'caocao1@163.com','8d495b11d50bbe42ad521f9f13e5276e','沧海笑','13888888888','男','1999-05-15','group1/M00/00/00/rBEuvlnxiMeAWcahAAAN-VQSomQ746.jpg','离异',207,'男','大学本科','北京-崇文区',8000.00,'单位宿舍',1,1,'e3e85ec7-01e8-4370-885f-42f8b7b7d684','2017-10-23 18:00:30'),(100009,'caocao2@163.com','72ac55336cb2fe10dfc44c5f89927534','林含冰','13888888888','女','1991-07-10','group1/M00/00/01/rBEuvln4Ol-AS5T3AAAjtFqrcKo807.jpg','未婚',164,'女','大专','山东-东营',15000.00,'打算婚后购房',1,1,'5be6c299-90fc-40b9-8ed1-e14cfc9c3e3b','2017-10-23 20:51:54'),(100010,'caocao3@163.com','1ec2dad09d0e3c9847a3482864fc4377','沧浪','13888888888','男','1994-02-10','group1/M00/00/01/rBEuvln4PFmANiCcAAAVWq-6lpk097.jpg','未婚',205,'男','大学本科','重庆-渝北区',20000.00,'单位宿舍',1,1,'12d8e7c4-6b2a-4e16-b3fe-aca4bb9d53dc','2017-10-23 21:15:38'),(100011,'caocao4@163.com','e85236cbdda923b42ba5a987e29dad0f','苗明恩','13888888888','男','1994-01-11','group1/M00/00/02/rBEuvln7G9yACKu-AAE2QbD14KQ833.jpg','未婚',210,'女','高中及以下','山东-济南',12000.00,'已购房',1,1,'eb472615-475e-4236-8d5e-926287b17703','2017-10-23 21:31:21'),(100012,'caocao5@163.com','be17b4b6eb1a275a2b31f5d9de619d18','皇埔铁牛','13454534533','男','1991-02-22','group1/M00/00/02/rBEuvln8NM6AY7S0AAMacMscvFw930.jpg','未婚',172,'女','大学本科','山东-菏泽',8000.00,'和家人同住',1,1,'9d8a5a04-68db-46cb-aa27-40ba5e760982','2017-10-24 11:13:32'),(100015,'zhangsan0@qq.com','9a179e9d7c58717ddbe3779e0056c7c3','铲屎官王发财','123214421421','男','1996-01-01','group1/M00/00/01/rBEuvln33bGACnLLAAL-uegAHfI044.jpg','未婚',175,'女','大学本科','山东-济南',6000.00,NULL,1,0,NULL,'2017-01-10 00:24:00'),(100016,'zhangsan1@qq.com','b4ed8d5ad2a839ff2739d3d3c1f342ab','阿达姆松','123214421421','男','1997-01-01','group1/M00/00/01/rBEuvln33bGACFO4AAM63g6yu_A708.jpg','未婚',160,'女','大学本科','山东-菏泽',6000.00,NULL,1,1,NULL,'2017-01-10 00:24:00'),(100017,'zhangsan2@qq.com','c2b4d03be7dd35ac14dee1b085ff95fe','逸舟','123214421421','男','1998-01-01','group1/M00/00/01/rBEuvln33bKAAvWcABwegpvJpN8074.jpg','未婚',161,'女','大学本科','山东-济南',6000.00,NULL,1,1,NULL,'2017-01-10 00:24:00'),(100018,'zhangsan3@qq.com','5d7c7725cedeff34faa2818165f84bdf','旁观者说','123214421421','男','1994-01-01','group1/M00/00/01/rBEuvln33bKAS4lpADrA8fBeNvU007.jpg','未婚',162,'女','大学本科','山东-济南',6000.00,NULL,1,1,NULL,'2017-01-10 00:24:00'),(100019,'zhangsan4@qq.com','b6c11e38db5148149ccd238f369efeb9','米小喵','123214421421','女','1993-01-01','group1/M00/00/00/rBEuvln3A0aAN0qbAAGS95Xwec0528.jpg','未婚',163,'女','大学本科','山东-济南',6000.00,NULL,1,1,NULL,'2017-01-10 00:24:00'),(100020,'zhangsan5@qq.com','030ec30b2626c63d4eb5306f1b15c1f7','赊月洞庭','123214421421','男','1998-01-01','group1/M00/00/01/rBEuvln33bOAe2HAAATZuFJoABM522.jpg','未婚',164,'女','大学本科','山东-菏泽',6000.00,NULL,1,1,NULL,'2017-01-10 00:24:00'),(100021,'zhangsan6@qq.com','8846ff06faf81dd8a127abc11070320d','钟二','123214421421','男','1991-01-01','group1/M00/00/01/rBEuvln33bOAbgZwAAMTuXu5aK0724.jpg','未婚',165,'女','大学本科','山东-济南',6000.00,NULL,1,1,NULL,'2017-01-10 00:24:00'),(100022,'zhangsan7@qq.com','d8be96421eb33285d01c3f136346c887','王二胖不算胖','123214421421','男','1996-01-01','group1/M00/00/01/rBEuvln33bOAba4bAAHz6vOfkNI775.jpg','未婚',166,'女','大学本科','山东-菏泽',6000.00,NULL,1,1,NULL,'2017-01-10 00:24:00'),(100023,'zhangsan8@qq.com','07444045b9fb49d1d1ceb6f5462c026a','任燚','123214421421','男','1996-01-01','group1/M00/00/01/rBEuvln4PHmAZgT0AABxOMAoiuk539.jpg','未婚',167,'女','大学本科','山东-济南',6000.00,NULL,1,1,NULL,'2017-01-10 00:24:00'),(100024,'zhangsan9@qq.com','ea3921d273e74bf6b1e06fa537f3d0ef','孙鹏昊','123214421421','男','1993-01-01','group1/M00/00/01/rBEuvln4PHmAJQcZAABXnMIXfJ8496.jpg','未婚',168,'女','大学本科','山东-济南',6000.00,NULL,1,1,NULL,'2017-01-10 00:24:00'),(100025,'lisi0@qq.com','64deb71a1d0d72e39ce7487821df3efb','欧阳翠花','123214421421','女','1991-01-01','group1/M00/00/00/rBEuvln3AvOAacRiAAUGygZ1rUM185.jpg','未婚',169,'男','大学本科','山东-济南',6000.00,NULL,1,1,NULL,'2017-01-10 00:24:00'),(100026,'lisi1@qq.com','e9933ee16377dba9d795064827858039','嵘嵘嵘','123214421421','女','1996-01-01','group1/M00/00/00/rBEuvln3AvSAbppOAATG3jvAb_M235.jpg','未婚',170,'男','大学本科','山东-菏泽',6000.00,NULL,1,1,NULL,'2017-01-10 00:24:00'),(100027,'lisi2@qq.com','c0c51d1b74dfd2f6d47013ef268ccbe0','Safinch','123214421421','女','1996-01-01','group1/M00/00/00/rBEuvln3AvSAdHByAAB7l0E9v1o364.jpg','未婚',171,'男','大学本科','山东-济南',6000.00,NULL,1,1,NULL,'2017-01-10 00:24:00'),(100028,'lisi3@qq.com','a9d49e6c2ff27d7372c897c22d75fff4','硕麦粒','123214421421','女','1996-01-01','group1/M00/00/00/rBEuvln3AvSAb9s7AAMs5VYsCU0325.jpg','未婚',172,'男','大学本科','山东-菏泽',6000.00,NULL,1,1,NULL,'2017-01-10 00:24:00'),(100029,'lisi4@qq.com','1f7e1b0368e3df566d5c741248a6bb77','戚梦','123214421421','女','1996-01-01','group1/M00/00/01/rBEuvln4OmCAU8t7AABrqyUCULE216.jpg','未婚',173,'男','大学本科','山东-济宁',6000.00,NULL,1,1,NULL,'2017-01-10 00:24:00'),(100030,'lisi5@qq.com','cce6d0bdc45c6799ebf399e717412543','白原儿','123214421421','女','1992-01-01','group1/M00/00/01/rBEuvln4OmCAX4RpAABMecZOeg8570.jpg','未婚',174,'男','大学本科','山东-济南',6000.00,NULL,1,1,NULL,'2017-01-10 00:24:00'),(100031,'lisi6@qq.com','b535d00b823e485f44f690d069daf752','小玩闹','123214421421','女','1993-01-01','group1/M00/00/00/rBEuvln3AvSAerlGAAJfix-bpxk051.jpg','未婚',175,'男','大学本科','山东-菏泽',6000.00,NULL,1,1,NULL,'2017-01-10 00:24:00'),(100032,'lisi7@qq.com','c016d5a73d0ab429f24333d82e4d7af4','安之若素','123214421421','女','1994-01-01','group1/M00/00/01/rBEuvln4Ol-AV-VwAACB5M4dT7s652.jpg','未婚',176,'男','大学本科','山东-济南',6000.00,NULL,1,1,NULL,'2017-01-10 00:24:00'),(100033,'lisi8@qq.com','0b6d4ab4722741f92cb214e8d0172863','郭襄','123214421421','女','1995-01-01','group1/M00/00/00/rBEuvln3A0aADWblAAFJLQ_Qins788.jpg','未婚',177,'男','大学本科','山东-济宁',6000.00,NULL,1,1,NULL,'2017-01-10 00:24:00'),(100034,'lisi9@qq.com','b5629f42411088aec54e9c358d828d79','OnaiveO','123214421421','女','1996-01-01','group1/M00/00/01/rBEuvln3A0eAAhYIAAJfix-bpxk607.jpg','未婚',178,'男','大学本科','山东-济南',6000.00,NULL,1,1,NULL,'2017-01-10 00:24:00'),(100035,'ruhua0@qq.com','a4cf631e4d869435f3cd80c375ec1122','香蕉君','123214421421','女','1997-01-01','group1/M00/00/01/rBEuvln3A0eABcu5AASxDdSyJc8006.jpg','未婚',179,'男','大学本科','山东-菏泽',6000.00,NULL,1,1,NULL,'2017-01-10 00:24:00'),(100036,'ruhua1@qq.com','34bfba1caaacf7e2ba0d4f16ab12f8e6','泰榕','123214421421','女','1998-01-01','group1/M00/00/01/rBEuvln3A0eAVknAAAF-bZ17g_I678.jpg','未婚',180,'男','大学本科','山东-济南',6000.00,NULL,1,1,NULL,'2017-01-10 00:24:00'),(100037,'ruhua2@qq.com','d29dc6684883a5aeb0e30becda723a25','陈一发儿','123214421421','女','1996-01-01','group1/M00/00/01/rBEuvln3A0eAciXsAAZWoBDWdNg380.jpg','未婚',175,'男','大学本科','山东-济宁',6000.00,NULL,1,1,NULL,'2017-01-10 00:24:00'),(100038,'ruhua3@qq.com','6189925f68c779f86d7dc542ca5e49ed','脸红的我','123214421421','女','1996-01-01','group1/M00/00/01/rBEuvln3A0eAFEhOAAFT8vv_8iQ263.jpg','未婚',175,'男','大学本科','山东-菏泽',6000.00,NULL,1,1,NULL,'2017-01-10 00:24:00'),(100039,'ruhua4@qq.com','30873f1ec3010137a1f171b73d54a87d','性感的猪','123214421421','女','1999-01-01','group1/M00/00/01/rBEuvln3A0eAfu_PAAKpIFBDk6o741.jpg','未婚',172,'男','大学本科','山东-济南',6000.00,NULL,1,1,NULL,'2017-01-10 00:24:00'),(100040,'ruhua5@qq.com','cf33a58b3aa4f615b8ede34b36086dc6','伊丽莎白','123214421421','女','1994-01-01','group1/M00/00/01/rBEuvln33nSAH4D6AAH1H76Ud1A061.jpg','未婚',173,'男','大学本科','山东-济宁',6000.00,NULL,1,1,NULL,'2017-01-10 00:24:00'),(100041,'ruhua6@qq.com','db0593eae0b8df6dee5c2f4b3b15ee29','Lemon','123214421421','女','1996-01-01','group1/M00/00/01/rBEuvln4Ol-AFXOeAACjM3JDtdI054.jpg','未婚',174,'男','大学本科','山东-济南',6000.00,NULL,1,1,NULL,'2017-01-10 00:24:00'),(100042,'ruhua7@qq.com','b3caec93fea1a56998b8eeca66ce841b','肉肉','123214421421','女','1996-01-01','group1/M00/00/01/rBEuvln33nSAH4D6AAH1H76Ud1A061.jpg','未婚',175,'男','大学本科','山东-菏泽',6000.00,NULL,1,1,NULL,'2017-01-10 00:24:00'),(100043,'ruhua8@qq.com','e0e9a5a7f8d636bf18358e528377fbb8','少女婉','123214421421','女','1997-01-01','group1/M00/00/02/rBEuvln8GmqAZ1ifAARNI2VWixQ039.jpg','未婚',176,'男','大学本科','山东-济南',6000.00,NULL,1,1,NULL,'2017-01-10 00:24:00'),(100044,'ruhua9@qq.com','75c2c2b09190eb4c2f0a63c549e747ba','破颜君的小屋','123214421421','男','1993-01-01','group1/M00/00/01/rBEuvln4PHmASg-NAAA5C0Az2sI073.jpg','未婚',175,'男','大学本科','山东-菏泽',6000.00,NULL,1,1,NULL,'2017-01-10 00:24:00'),(100045,'g@g.com','6e07efd1e578395807cfba790c75e82d','奔跑的小猪','15555555555','男','1991-01-01','group1/M00/00/02/rBEuvln-ZwCAWd3JAACIponWObk841.jpg','未婚',179,'女','中专','山东-济南',5000.00,'和家人同住',1,1,'95a4d443-cb80-4636-bf90-afbcb2fed269','2017-10-24 22:32:29'),(100046,'gnjsmmz@163.com','fb1de8e1ac9146d87ca93aaae5cb4b35','孤城雪','13888888888','男','1993-07-07','group1/M00/00/00/rBEuvlnx3xCANxP0AAAv6Fn0wow084.jpg','未婚',185,'女','博士','山东-枣庄',20000.00,NULL,1,1,'78153453-ef79-47f4-ac83-d0837a6139b9','2017-10-26 19:56:40'),(100047,'g@gss.com','edb09d1edff41f64c9b4ac3974114ecf','_听弦断','15555555555','男','1994-07-07','group1/M00/00/02/rBEuvln6j4SABA0aAATZuFJoABM877.jpg','未婚',194,'女','大专','山东-菏泽',12000.00,NULL,1,1,'62d19d20-ef43-45f3-91b8-bb5c9d9ec112','2017-11-02 10:58:09'),(100048,'adfs@163.com','681801802b6aa919af523f27b09ad414','阿道夫撒','13222131223','男','1991-11-13','group1/M00/00/00/rBEuvlnxjMuAQiedAABzD4s1V58372.png','未婚',201,'女','大学本科','山东-枣庄',8000.00,NULL,1,1,'d0c421c5-1311-433a-98be-97c7191f14aa','2017-11-04 16:42:48');
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 trigger trigger_seletterxual after update
on user_basic for each row
update user_pick set sex=new.sexual where id=new.id */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user_detail`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_detail` (
  `id` int(11) NOT NULL,
  `realname` varchar(50) DEFAULT NULL,
  `cardnumber` varchar(50) DEFAULT NULL,
  `birthplace` varchar(50) DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `animal` char(2) DEFAULT NULL,
  `zodiac` char(6) DEFAULT NULL,
  `nation` varchar(20) DEFAULT NULL,
  `religion` varchar(20) DEFAULT NULL,
  `graduation` varchar(50) DEFAULT NULL,
  `hobby` varchar(255) DEFAULT NULL,
  `signature` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_fk_udid` FOREIGN KEY (`id`) REFERENCES `user_basic` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_detail`
--

INSERT INTO `user_detail` (`id`, `realname`, `cardnumber`, `birthplace`, `weight`, `animal`, `zodiac`, `nation`, `religion`, `graduation`, `hobby`, `signature`) VALUES (100000,'lisi','452127199903142713','山东-菏泽',NULL,NULL,NULL,NULL,NULL,'北京-北京交通大学','李四李四李四李四','李四李四李四李四'),(100001,'帅帅','452127199903142713','山东-济宁',67,'虎','天蝎座','汉族','佛教','北京-北京交通大学','爱睡觉，爱打撸啊撸，爱跑步','生命诚可贵，爱情价更高'),(100002,'gggg','452127199903142713','山东-青岛',12,NULL,NULL,NULL,NULL,'山东-青岛科技大学',NULL,'我不知道该说些什么，反正项目好难写啊啊啊'),(100003,'王五','452127199903142713','山东-济宁',NULL,NULL,NULL,NULL,NULL,'山东',NULL,'王五王五王五那我 昂科威蝴蝶卡'),(100004,'赵六','452127199903142713','山东-济宁',NULL,NULL,NULL,NULL,NULL,'山东-青岛科技大学',NULL,'胜多负少看到回复规划书快递费 '),(100005,'张三','452127199903142713','安徽-亳州',66,'虎','双子座','蒙古族','佛教','山东','张三张三张三','张三张三张三张三'),(100007,'张三','452127199903142713','安徽-亳州',66,'虎','双子座','蒙古族','佛教','广东-广州大学','张三张三张三','张三张三张三张三'),(100008,NULL,'452127199903142713','山东-菏泽',NULL,NULL,NULL,NULL,NULL,'广东-广州大学',NULL,'不忘初心，牢记使命，高举中国特色社会主义伟大旗帜'),(100009,NULL,'452127199903142713','山东-临沂',NULL,NULL,NULL,NULL,NULL,'山东-青岛科技大学',NULL,'万众瞩目的十九大已于今天拉开帷幕，今天上午习大大长达 3 个小时\r\n\r\n'),(100011,NULL,'452127199903142713','山东-淄博',NULL,NULL,NULL,NULL,NULL,'山东',NULL,'4.思想文化建设取得重大进展。国家文化软实力和中华文化影响力大幅提升'),(100012,NULL,NULL,'山东-临沂',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'3.意味着中国特色社会主义道路、理论、制度、文化不断发展'),(100015,NULL,'452127199903142713','山东-菏泽',NULL,NULL,NULL,NULL,NULL,'广东-广州大学',NULL,'张三张三张三张三'),(100016,NULL,'452127199903142713','山东-济宁',NULL,NULL,NULL,NULL,NULL,'山东-青岛科技大学',NULL,'不忘初心，牢记使命，高举中国特色社会主义伟大旗帜'),(100017,NULL,'452127199903142713','山东-青岛',NULL,NULL,NULL,NULL,NULL,'山东',NULL,'万众瞩目的十九大已于今天拉开帷幕，今天上午习大大长达 3 个小时\r\n\r\n'),(100018,NULL,'452127199903142713','山东-济宁',NULL,NULL,NULL,NULL,NULL,'山东-青岛科技大学',NULL,'4.思想文化建设取得重大进展。国家文化软实力和中华文化影响力大幅提升'),(100019,NULL,'452127199903142713','山东-济宁',NULL,NULL,NULL,NULL,NULL,'山东',NULL,'3.意味着中国特色社会主义道路、理论、制度、文化不断发展'),(100020,NULL,'452127199903142713','安徽-亳州',NULL,NULL,NULL,NULL,NULL,'广东-广州大学',NULL,'不忘初心，牢记使命，高举中国特色社会主义伟大旗帜'),(100021,NULL,'452127199903142713','安徽-亳州',NULL,NULL,NULL,NULL,NULL,'广东-广州大学',NULL,'万众瞩目的十九大已于今天拉开帷幕，今天上午习大大长达 3 个小时\r\n\r\n'),(100022,NULL,'452127199903142713','山东-菏泽',NULL,NULL,NULL,NULL,NULL,'山东-青岛科技大学',NULL,'4.思想文化建设取得重大进展。国家文化软实力和中华文化影响力大幅提升'),(100023,NULL,'452127199903142713','山东-临沂',NULL,NULL,NULL,NULL,NULL,'山东',NULL,'3.意味着中国特色社会主义道路、理论、制度、文化不断发展'),(100024,NULL,'452127199903142713','山东-淄博',NULL,NULL,NULL,NULL,NULL,'山东-青岛科技大学',NULL,'张三张三张三张三'),(100025,NULL,'452127199903142713','山东-临沂',NULL,NULL,NULL,NULL,NULL,'山东',NULL,'不忘初心，牢记使命，高举中国特色社会主义伟大旗帜'),(100026,NULL,'452127199903142713','山东-菏泽',NULL,NULL,NULL,NULL,NULL,'广东-广州大学',NULL,'万众瞩目的十九大已于今天拉开帷幕，今天上午习大大长达 3 个小时\r\n\r\n'),(100027,NULL,'452127199903142713','山东-济宁',NULL,NULL,NULL,NULL,NULL,'广东-广州大学',NULL,'4.思想文化建设取得重大进展。国家文化软实力和中华文化影响力大幅提升'),(100028,NULL,'452127199903142713','山东-青岛',NULL,NULL,NULL,NULL,NULL,'山东-青岛科技大学',NULL,'3.意味着中国特色社会主义道路、理论、制度、文化不断发展'),(100029,NULL,'452127199903142713','山东-济宁',NULL,NULL,NULL,NULL,NULL,'山东',NULL,'不忘初心，牢记使命，高举中国特色社会主义伟大旗帜'),(100030,NULL,'452127199903142713','山东-菏泽',NULL,NULL,NULL,NULL,NULL,'广东-广州大学',NULL,'万众瞩目的十九大已于今天拉开帷幕，今天上午习大大长达 3 个小时\r\n\r\n'),(100031,NULL,'452127199903142713','山东-济宁',NULL,NULL,NULL,NULL,NULL,'广东-广州大学',NULL,'4.思想文化建设取得重大进展。国家文化软实力和中华文化影响力大幅提升'),(100032,NULL,'452127199903142713','山东-青岛',NULL,NULL,NULL,NULL,NULL,'山东-青岛科技大学',NULL,'3.意味着中国特色社会主义道路、理论、制度、文化不断发展'),(100033,NULL,'452127199903142713','山东-济宁',NULL,NULL,NULL,NULL,NULL,'山东',NULL,'张三张三张三张三'),(100034,NULL,'452127199903142713','山东-济宁',NULL,NULL,NULL,NULL,NULL,'山东-青岛科技大学',NULL,'不忘初心，牢记使命，高举中国特色社会主义伟大旗帜'),(100035,NULL,'452127199903142713','安徽-亳州',NULL,NULL,NULL,NULL,NULL,'山东',NULL,'万众瞩目的十九大已于今天拉开帷幕，今天上午习大大长达 3 个小时\r\n\r\n'),(100036,NULL,'452127199903142713','安徽-亳州',NULL,NULL,NULL,NULL,NULL,'广东-广州大学',NULL,'4.思想文化建设取得重大进展。国家文化软实力和中华文化影响力大幅提升'),(100037,NULL,'452127199903142713','山东-菏泽',NULL,NULL,NULL,NULL,NULL,'北京-北京交通大学',NULL,'3.意味着中国特色社会主义道路、理论、制度、文化不断发展'),(100038,NULL,'452127199903142713','山东-临沂',NULL,NULL,NULL,NULL,NULL,'山东-青岛科技大学',NULL,'不忘初心，牢记使命，高举中国特色社会主义伟大旗帜'),(100039,NULL,'452127199903142713','山东-淄博',NULL,NULL,NULL,NULL,NULL,'山东',NULL,'万众瞩目的十九大已于今天拉开帷幕，今天上午习大大长达 3 个小时\r\n\r\n'),(100040,NULL,'452127199903142713','山东-临沂',NULL,NULL,NULL,NULL,NULL,'山东-青岛科技大学',NULL,'4.思想文化建设取得重大进展。国家文化软实力和中华文化影响力大幅提升'),(100041,NULL,'452127199903142713','山东-菏泽',NULL,NULL,NULL,NULL,NULL,'山东',NULL,'3.意味着中国特色社会主义道路、理论、制度、文化不断发展'),(100042,NULL,'452127199903142713','山东-济宁',NULL,NULL,NULL,NULL,NULL,'广东-广州大学',NULL,'张三张三张三张三'),(100043,NULL,'452127199903142713','山东-青岛',NULL,NULL,NULL,NULL,NULL,'广东-广州大学',NULL,'不忘初心，牢记使命，高举中国特色社会主义伟大旗帜'),(100044,NULL,'452127199903142713','山东-济宁',NULL,NULL,NULL,NULL,NULL,'山东-青岛科技大学',NULL,'万众瞩目的十九大已于今天拉开帷幕，今天上午习大大长达 3 个小时\r\n\r\n'),(100045,NULL,'452127199903142713','山东-济宁',NULL,NULL,NULL,NULL,NULL,'山东',NULL,'4.思想文化建设取得重大进展。国家文化软实力和中华文化影响力大幅提升'),(100046,NULL,'452127199903142713','安徽-亳州',NULL,NULL,NULL,NULL,NULL,'广东-广州大学',NULL,'3.意味着中国特色社会主义道路、理论、制度、文化不断发展');

--
-- Table structure for table `user_label`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_label` (
  `user_id` int(11) NOT NULL,
  `label_id` int(11) NOT NULL,
  KEY `FK_fk_ullabelid` (`label_id`),
  KEY `FK_fk_uluserid` (`user_id`),
  CONSTRAINT `FK_fk_ullabelid` FOREIGN KEY (`label_id`) REFERENCES `label` (`id`),
  CONSTRAINT `FK_fk_uluserid` FOREIGN KEY (`user_id`) REFERENCES `user_basic` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_label`
--

INSERT INTO `user_label` (`user_id`, `label_id`) VALUES (100000,1),(100004,1),(100007,1),(100001,1),(100001,2),(100008,1),(100008,2),(100008,3),(100008,5),(100008,4),(100011,5),(100012,3),(100012,5),(100046,1),(100046,2),(100025,2),(100026,3),(100027,5),(100028,4),(100029,5),(100030,3),(100031,2),(100032,2),(100033,4),(100034,1),(100035,2),(100036,2),(100037,3),(100033,5),(100034,4),(100035,5),(100025,1),(100026,1),(100027,1),(100028,1),(100029,1),(100030,1),(100031,1),(100032,1),(100033,1),(100034,2),(100035,1),(100036,1),(100037,1),(100025,6),(100026,6),(100027,6),(100028,6),(100029,6),(100030,6),(100031,6),(100032,6),(100033,6),(100034,6),(100035,6),(100036,6),(100037,6),(100038,6),(100008,6),(100009,6),(100010,6),(100011,6),(100012,6),(100015,6),(100016,6),(100017,6),(100018,6),(100019,6),(100020,6),(100047,1),(100005,3),(100005,5),(100012,1),(100012,2),(100048,1),(100048,2);

--
-- Table structure for table `user_life`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_life` (
  `id` int(11) NOT NULL,
  `smoke` int(11),
  `drink` int(11),
  `car` int(11),
  `job` varchar(50) DEFAULT NULL,
  `job_time` varchar(50) DEFAULT NULL,
  `character` varchar(255) DEFAULT NULL,
  `job_brief` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_fk_ulid` FOREIGN KEY (`id`) REFERENCES `user_basic` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_life`
--

INSERT INTO `user_life` (`id`, `smoke`, `drink`, `car`, `job`, `job_time`, `character`, `job_brief`) VALUES (100000,NULL,NULL,NULL,'通信/电子',NULL,NULL,NULL),(100001,0,1,0,'服务业','工作忙碌','阳光开朗','轻松愉快'),(100003,NULL,NULL,NULL,'通信/电子',NULL,NULL,NULL),(100004,NULL,NULL,NULL,'通信/电子',NULL,NULL,NULL),(100005,NULL,NULL,1,'政府机构',NULL,NULL,NULL),(100007,0,1,1,'物流/仓储','工作清闲','张三张三张三张三张三','张三张三张三张三张三张三'),(100008,NULL,NULL,1,'政府机构',NULL,NULL,NULL),(100011,NULL,NULL,0,'政府机构',NULL,NULL,NULL),(100012,NULL,NULL,1,'政府机构',NULL,NULL,NULL),(100045,1,1,0,'教育/科研',NULL,NULL,NULL);

--
-- Table structure for table `user_login_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_login_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `login_ip` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_fk_uluuid` (`user_id`),
  CONSTRAINT `FK_fk_uluuid` FOREIGN KEY (`user_id`) REFERENCES `user_basic` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_login_log`
--


--
-- Table structure for table `user_photo`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_fk_ufid` (`user_id`),
  CONSTRAINT `FK_fk_ufid` FOREIGN KEY (`user_id`) REFERENCES `user_basic` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_photo`
--

INSERT INTO `user_photo` (`id`, `user_id`, `photo`) VALUES (12,100012,'group1/M00/00/00/rBEuvlnxQ9eAP_v7AAAv6Fn0wow118.jpg'),(15,100012,'group1/M00/00/00/rBEuvlnxiMeAWcahAAAN-VQSomQ746.jpg'),(48,100009,'group1/M00/00/00/rBEuvln3Af6AJpLlAAOiP0nRVtw860.jpg'),(49,100009,'group1/M00/00/00/rBEuvln3Af-AHJzBAAUPAhhY1zs356.jpg'),(50,100009,'group1/M00/00/00/rBEuvln3Af-AZC42AARNI2VWixQ502.jpg'),(51,100009,'group1/M00/00/00/rBEuvln3Af-AJVNEAALlRlZ9zAc935.jpg'),(54,100025,'group1/M00/00/00/rBEuvln3AvOAacRiAAUGygZ1rUM185.jpg'),(55,100025,'group1/M00/00/00/rBEuvln3AvSAbppOAATG3jvAb_M235.jpg'),(56,100025,'group1/M00/00/00/rBEuvln3AvSAdHByAAB7l0E9v1o364.jpg'),(57,100025,'group1/M00/00/00/rBEuvln3AvSAb9s7AAMs5VYsCU0325.jpg'),(58,100025,'group1/M00/00/00/rBEuvln3AvSACO_gAAGS95Xwec0272.jpg'),(59,100025,'group1/M00/00/00/rBEuvln3AvSAK9avAAFJLQ_Qins304.jpg'),(60,100025,'group1/M00/00/00/rBEuvln3AvSAerlGAAJfix-bpxk051.jpg'),(61,100019,'group1/M00/00/00/rBEuvln3A0aAN0qbAAGS95Xwec0528.jpg'),(62,100019,'group1/M00/00/00/rBEuvln3A0aADWblAAFJLQ_Qins788.jpg'),(63,100019,'group1/M00/00/01/rBEuvln3A0eAAhYIAAJfix-bpxk607.jpg'),(64,100019,'group1/M00/00/01/rBEuvln3A0eABcu5AASxDdSyJc8006.jpg'),(65,100019,'group1/M00/00/01/rBEuvln3A0eAVknAAAF-bZ17g_I678.jpg'),(66,100019,'group1/M00/00/01/rBEuvln3A0eAciXsAAZWoBDWdNg380.jpg'),(67,100019,'group1/M00/00/01/rBEuvln3A0eAFEhOAAFT8vv_8iQ263.jpg'),(68,100019,'group1/M00/00/01/rBEuvln3A0eAfu_PAAKpIFBDk6o741.jpg'),(69,100006,'group1/M00/00/01/rBEuvln33bGAFA8BAE0ctAqSN4Y449.jpg'),(70,100006,'group1/M00/00/01/rBEuvln33bGACnLLAAL-uegAHfI044.jpg'),(71,100006,'group1/M00/00/01/rBEuvln33bGACFO4AAM63g6yu_A708.jpg'),(72,100006,'group1/M00/00/01/rBEuvln33bKAAvWcABwegpvJpN8074.jpg'),(73,100006,'group1/M00/00/01/rBEuvln33bKAS4lpADrA8fBeNvU007.jpg'),(74,100006,'group1/M00/00/01/rBEuvln33bOAe2HAAATZuFJoABM522.jpg'),(75,100006,'group1/M00/00/01/rBEuvln33bOAbgZwAAMTuXu5aK0724.jpg'),(76,100006,'group1/M00/00/01/rBEuvln33bOAba4bAAHz6vOfkNI775.jpg'),(77,100002,'group1/M00/00/01/rBEuvln33nSAH4D6AAH1H76Ud1A061.jpg'),(79,100002,'group1/M00/00/01/rBEuvln4Ol-AV-VwAACB5M4dT7s652.jpg'),(80,100002,'group1/M00/00/01/rBEuvln4Ol-AS5T3AAAjtFqrcKo807.jpg'),(82,100002,'group1/M00/00/01/rBEuvln4Ol-AFXOeAACjM3JDtdI054.jpg'),(83,100002,'group1/M00/00/01/rBEuvln4OmCAU8t7AABrqyUCULE216.jpg'),(84,100002,'group1/M00/00/01/rBEuvln4OmCAX4RpAABMecZOeg8570.jpg'),(85,100010,'group1/M00/00/01/rBEuvln4PHmASX1YAABX1Y466xQ908.jpg'),(86,100010,'group1/M00/00/01/rBEuvln4PHmAE9mqAAAif9AeYUc042.jpg'),(87,100010,'group1/M00/00/01/rBEuvln4PHmAXhCvAAClgAwZey8111.jpg'),(88,100010,'group1/M00/00/01/rBEuvln4PHmAAXEvAAAg_1uOQ-4292.jpg'),(89,100010,'group1/M00/00/01/rBEuvln4PHmAeDgRAABlhpZ40Sc478.jpg'),(90,100010,'group1/M00/00/01/rBEuvln4PHmAZgT0AABxOMAoiuk539.jpg'),(91,100010,'group1/M00/00/01/rBEuvln4PHmAJQcZAABXnMIXfJ8496.jpg'),(92,100010,'group1/M00/00/01/rBEuvln4PHmASg-NAAA5C0Az2sI073.jpg'),(93,100045,'group1/M00/00/01/rBEuvln4PmOAVTLNAAA5C0Az2sI812.jpg'),(94,100045,'group1/M00/00/01/rBEuvln4PmSAFNoAAAAkSipah3s996.jpg'),(95,100045,'group1/M00/00/01/rBEuvln4PmSAMzp6AAA0EyGLdyM664.jpg'),(96,100003,'group1/M00/00/01/rBEuvln4UnuAHFTdAAJfix-bpxk616.jpg'),(97,100003,'group1/M00/00/01/rBEuvln4UnyAO3qNAASxDdSyJc8307.jpg'),(98,100003,'group1/M00/00/01/rBEuvln4UnyAa63aAAF-bZ17g_I501.jpg'),(99,100003,'group1/M00/00/01/rBEuvln4UnyAIwQrAAZWoBDWdNg240.jpg'),(100,100003,'group1/M00/00/01/rBEuvln4UnyAScR-AAFT8vv_8iQ185.jpg'),(101,100003,'group1/M00/00/01/rBEuvln4UnyAOB-3AAKpIFBDk6o297.jpg'),(102,100005,'group1/M00/00/01/rBEuvln4VECAfYK5AAE2QbD14KQ632.jpg'),(103,100005,'group1/M00/00/01/rBEuvln4VECAaSYoAAHNjJivitM335.jpg'),(104,100005,'group1/M00/00/01/rBEuvln4VECATvDXAABUxEm3DhE185.jpg'),(105,100005,'group1/M00/00/01/rBEuvln4VD-ALL6mAACIponWObk520.jpg'),(107,100005,'group1/M00/00/01/rBEuvln4VECAMHA8AAHoUju9-IM087.jpg'),(108,100005,'group1/M00/00/01/rBEuvln4VECAHNnKAAOf24MMGEw289.jpg'),(109,100005,'group1/M00/00/01/rBEuvln4VECAMn38AAF5Py-hGkc582.jpg'),(111,100047,'group1/M00/00/02/rBEuvln6j4SACDVGAAF5Py-hGkc734.jpg'),(112,100047,'group1/M00/00/02/rBEuvln6j9iAWp7hAAOf24MMGEw621.jpg'),(113,100005,'group1/M00/00/02/wKgrmln6mcOAFMkQAAEz9IJnsb8916.jpg'),(114,100002,'group1/M00/00/02/rBEuvln6u0yAR-hDAAFNx621zmE979.jpg'),(116,100002,'group1/M00/00/02/rBEuvln8D-KAAJ-GAASxDdSyJc8800.jpg'),(117,100012,'group1/M00/00/00/rBEuvlnxi_WAcQWFAAAmcIPIr9E661.jpg');

--
-- Table structure for table `user_pick`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_pick` (
  `id` int(11) NOT NULL,
  `sex` char(2) NOT NULL COMMENT '根据性取向生成，用户不可修改',
  `age_low` int(11) DEFAULT NULL,
  `age_high` int(11) DEFAULT NULL,
  `workplace` varchar(50) DEFAULT NULL,
  `birthplace` varchar(50) DEFAULT NULL,
  `marry_status` varchar(50) DEFAULT NULL,
  `education` varchar(50) DEFAULT NULL,
  `salary_low` double DEFAULT NULL,
  `salary_high` double DEFAULT NULL,
  `height_low` int(11) DEFAULT NULL,
  `height_high` int(11) DEFAULT NULL,
  `job` varchar(50) DEFAULT NULL,
  `drink` int(11),
  `smoke` int(11),
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_fk_upid` FOREIGN KEY (`id`) REFERENCES `user_basic` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_pick`
--

INSERT INTO `user_pick` (`id`, `sex`, `age_low`, `age_high`, `workplace`, `birthplace`, `marry_status`, `education`, `salary_low`, `salary_high`, `height_low`, `height_high`, `job`, `drink`, `smoke`) VALUES (100000,'男',18,30,'山东-济宁',NULL,'未婚',NULL,NULL,NULL,160,180,NULL,NULL,NULL),(100001,'女',18,33,'山东-青岛','山东-菏泽','未婚','硕士',3000,5000,185,195,'客户服务',0,0),(100002,'男',20,25,'山东-济南',NULL,'未婚','大学本科',3000,20000,NULL,NULL,NULL,NULL,NULL),(100003,'女',20,30,'山东-济南',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(100004,'男',20,30,'山东-济南',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(100005,'女',NULL,NULL,NULL,NULL,'未婚',NULL,NULL,NULL,NULL,NULL,NULL,1,1),(100006,'女',18,30,'山东-菏泽',NULL,'未婚',NULL,NULL,NULL,162,180,NULL,NULL,NULL),(100007,'女',18,33,'河南-许昌','山东-菏泽','离异','大专',3000,8000,167,187,'通信/电子',0,NULL),(100008,'男',18,33,'山东','山东-菏泽','未婚','大学本科',8000,15000,197,188,'政府机构',0,1),(100009,'女',23,29,'山东-青岛',NULL,'未婚',NULL,12000,20000,154,174,'计算机/互联网',1,1),(100010,'男',20,26,'重庆-渝北区',NULL,'未婚',NULL,NULL,NULL,195,215,NULL,NULL,NULL),(100011,'女',20,26,'山东',NULL,'未婚','大专',5000,15000,200,210,NULL,NULL,NULL),(100012,'女',23,29,NULL,NULL,'未婚',NULL,NULL,NULL,162,182,NULL,NULL,NULL),(100015,'女',18,30,'山东-济南',NULL,'未婚',NULL,NULL,NULL,160,180,NULL,NULL,NULL),(100016,'女',18,30,'山东-济南',NULL,'未婚',NULL,NULL,NULL,160,180,NULL,NULL,NULL),(100017,'女',18,30,'山东-济南',NULL,'未婚',NULL,NULL,NULL,160,180,NULL,NULL,NULL),(100018,'女',18,30,'山东-济南',NULL,'未婚',NULL,NULL,NULL,160,180,NULL,NULL,NULL),(100019,'女',18,30,'山东-济南',NULL,'未婚',NULL,NULL,NULL,160,180,NULL,NULL,NULL),(100020,'女',18,30,'山东-济南',NULL,'未婚',NULL,NULL,NULL,160,180,NULL,NULL,NULL),(100021,'女',18,30,'山东-济南',NULL,'未婚',NULL,NULL,NULL,160,180,NULL,NULL,NULL),(100022,'女',18,30,'山东-济南',NULL,'未婚',NULL,NULL,NULL,160,180,NULL,NULL,NULL),(100023,'女',18,30,'山东-济南',NULL,'未婚',NULL,NULL,NULL,160,180,NULL,NULL,NULL),(100024,'女',18,30,'山东-济南',NULL,'未婚',NULL,NULL,NULL,160,180,NULL,NULL,NULL),(100025,'男',18,30,'山东-济南',NULL,'未婚',NULL,NULL,NULL,160,180,NULL,NULL,NULL),(100026,'男',18,30,'山东-济南',NULL,'未婚',NULL,NULL,NULL,160,180,NULL,NULL,NULL),(100027,'男',18,30,'山东-济南',NULL,'未婚',NULL,NULL,NULL,160,180,NULL,NULL,NULL),(100028,'男',18,30,'山东-济南',NULL,'未婚',NULL,NULL,NULL,160,180,NULL,NULL,NULL),(100029,'男',18,30,'山东-济南',NULL,'未婚',NULL,NULL,NULL,160,180,NULL,NULL,NULL),(100030,'男',18,30,'山东-济南',NULL,'未婚',NULL,NULL,NULL,160,180,NULL,NULL,NULL),(100031,'男',18,30,'山东-济南',NULL,'未婚',NULL,NULL,NULL,160,180,NULL,NULL,NULL),(100032,'男',18,30,'山东-济南',NULL,'未婚',NULL,NULL,NULL,160,180,NULL,NULL,NULL),(100033,'男',18,30,'山东-济南',NULL,'未婚',NULL,NULL,NULL,160,180,NULL,NULL,NULL),(100034,'男',18,30,'山东-济南',NULL,'未婚',NULL,NULL,NULL,160,180,NULL,NULL,NULL),(100035,'男',18,30,'山东-济南',NULL,'未婚',NULL,NULL,NULL,160,180,NULL,NULL,NULL),(100036,'男',18,30,'山东-济南',NULL,'未婚',NULL,NULL,NULL,160,180,NULL,NULL,NULL),(100037,'男',18,30,'山东-济南',NULL,'未婚',NULL,NULL,NULL,160,180,NULL,NULL,NULL),(100038,'男',18,30,'山东-济南',NULL,'未婚',NULL,NULL,NULL,160,180,NULL,NULL,NULL),(100039,'男',18,30,'山东-济南',NULL,'未婚',NULL,NULL,NULL,160,180,NULL,NULL,NULL),(100040,'男',18,30,'山东-济南',NULL,'未婚',NULL,NULL,NULL,160,180,NULL,NULL,NULL),(100041,'男',18,30,'山东-济南',NULL,'未婚',NULL,NULL,NULL,160,180,NULL,NULL,NULL),(100042,'男',18,30,'山东-济南',NULL,'未婚',NULL,NULL,NULL,160,180,NULL,NULL,NULL),(100043,'男',18,30,'山东-济南',NULL,'未婚',NULL,NULL,NULL,160,180,NULL,NULL,NULL),(100044,'男',18,30,'山东-济南',NULL,'未婚',NULL,NULL,NULL,160,180,NULL,NULL,NULL),(100045,'女',23,29,'山东-济南',NULL,'未婚',NULL,NULL,NULL,169,189,NULL,NULL,NULL),(100046,'女',18,2,'山东-济南',NULL,'未婚',NULL,NULL,NULL,167,187,NULL,NULL,NULL),(100047,'女',20,26,'山东-菏泽',NULL,'未婚',NULL,NULL,NULL,184,204,NULL,NULL,NULL),(100048,'女',22,28,'山东-枣庄',NULL,'未婚',NULL,NULL,NULL,191,210,NULL,NULL,NULL);

--
-- Table structure for table `user_status`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_status` (
  `id` int(11) NOT NULL,
  `love_history` varchar(50) DEFAULT NULL,
  `marry_time` varchar(50) DEFAULT NULL,
  `ldr` int(11) DEFAULT NULL,
  `parent_status` varchar(50) DEFAULT NULL,
  `bro_and_sis` varchar(50) DEFAULT NULL,
  `family_brief` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_fk_usid` FOREIGN KEY (`id`) REFERENCES `user_basic` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_status`
--

INSERT INTO `user_status` (`id`, `love_history`, `marry_time`, `ldr`, `parent_status`, `bro_and_sis`, `family_brief`) VALUES (100001,'情场高手','三年内',0,'父母均健在','2','家庭美满幸福'),(100005,NULL,'认同闪婚',NULL,NULL,NULL,NULL),(100007,'初恋还在','一年内',0,'只有母亲健在','4','张三张三张三张三张三张三张三');

--
-- Table structure for table `visit_trace`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visit_trace` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `interviewee_id` int(11) NOT NULL,
  `visit_time` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_fk_uvuserid` (`user_id`),
  KEY `FK_fk_uvvid` (`interviewee_id`),
  CONSTRAINT `FK_fk_uvuserid` FOREIGN KEY (`user_id`) REFERENCES `user_basic` (`id`),
  CONSTRAINT `FK_fk_uvvid` FOREIGN KEY (`interviewee_id`) REFERENCES `user_basic` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit_trace`
--

INSERT INTO `visit_trace` (`id`, `user_id`, `interviewee_id`, `visit_time`, `status`) VALUES (1,100002,100002,'2017-11-01 10:51:43',1),(2,100002,100005,'2017-11-01 10:52:01',1),(3,100012,100005,'2017-11-01 10:52:15',1),(4,100002,100026,'2017-11-01 10:52:25',0),(5,100005,100000,'2017-11-01 10:52:47',0),(6,100012,100005,'2017-11-01 10:52:59',0),(7,100005,100045,'2017-11-01 10:53:22',1),(8,100005,100006,'2017-11-01 10:54:22',0),(9,100045,100002,'2017-11-01 10:54:26',1),(10,100012,100024,'2017-11-01 10:54:32',0),(14,100005,100002,'2017-11-01 14:54:47',1),(15,100005,100023,'2017-11-01 16:36:26',0),(17,100002,100045,'2017-11-01 16:37:50',1),(18,100045,100024,'2017-11-01 16:37:56',0),(19,100045,100002,'2017-11-01 16:37:59',1),(20,100045,100017,'2017-11-01 16:38:21',0),(21,100045,100018,'2017-11-01 16:38:35',0),(22,100045,100002,'2017-11-01 16:38:45',1),(23,100005,100002,'2017-11-01 17:12:23',1),(26,100002,100005,'2017-11-01 18:52:22',0),(28,100005,100040,'2017-11-01 19:16:47',0),(29,100005,100031,'2017-11-01 19:34:13',0),(30,100012,100002,'2017-11-01 19:34:16',1),(31,100002,100005,'2017-11-01 20:24:54',1),(33,100005,100005,'2017-11-01 20:27:37',1),(34,100045,100033,'2017-11-01 22:30:30',0),(35,100045,100033,'2017-11-02 01:14:33',0),(36,100005,100006,'2017-11-02 08:31:27',0),(37,100005,100012,'2017-11-02 08:44:23',0),(38,100002,100021,'2017-11-02 09:24:22',0),(39,100005,100045,'2017-11-02 09:27:41',1),(41,100005,100046,'2017-11-01 16:37:43',0),(42,100005,100005,'2017-11-02 09:43:28',0),(43,100005,100023,'2017-11-02 09:43:49',0),(44,100005,100028,'2017-11-02 10:39:51',0),(45,100002,100047,'2017-11-02 11:25:28',1),(46,100047,100036,'2017-11-02 11:51:13',0),(47,100005,100026,'2017-11-02 12:02:57',0),(48,100012,100005,'2017-11-02 12:12:43',1),(49,100012,100024,'2017-11-02 14:27:53',0),(50,100002,100007,'2017-11-02 14:28:18',1),(52,100002,100008,'2017-11-02 17:05:05',1),(53,100005,100005,'2017-11-02 19:53:03',1),(54,100005,100040,'2017-11-02 19:53:28',0),(55,100005,100040,'2017-11-02 20:01:16',0),(56,100005,100042,'2017-11-02 20:01:39',0),(57,100005,100042,'2017-11-02 20:01:56',0),(58,100005,100011,'2017-11-02 20:02:29',0),(59,100012,100038,'2017-11-02 20:38:29',0),(60,100012,100009,'2017-11-02 20:38:36',0),(61,100002,100012,'2017-11-02 20:44:44',1),(62,100012,100009,'2017-11-02 20:44:44',0),(63,100012,100009,'2017-11-02 20:44:57',0),(64,100012,100011,'2017-11-02 20:45:00',0),(65,100012,100011,'2017-11-02 20:45:01',0),(66,100012,100002,'2017-11-02 21:19:24',1),(67,100011,100026,'2017-11-02 21:23:36',0),(68,100045,100000,'2017-11-03 14:58:13',0),(69,100002,100000,'2017-11-03 14:58:26',0),(70,100012,100005,'2017-11-03 14:59:57',1),(71,100002,100011,'2017-11-03 15:03:53',0),(72,100002,100011,'2017-11-03 15:04:01',0),(73,100005,100043,'2017-11-03 15:26:23',0),(74,100002,100047,'2017-11-03 15:44:45',0),(75,100002,100005,'2017-11-04 16:43:07',0),(76,100002,100012,'2017-11-04 16:44:31',0),(77,100005,100003,'2017-11-04 18:02:57',0),(78,100045,100032,'2017-11-04 20:46:14',0),(79,100045,100032,'2017-11-04 20:52:21',0),(80,100045,100032,'2017-11-04 21:04:20',0),(81,100005,100046,'2017-11-01 10:54:51',0),(82,100005,100002,'2017-11-02 15:40:38',1),(83,100005,100024,'2017-11-04 21:24:07',0),(84,100005,100002,'2017-11-04 21:24:10',0),(85,100005,100002,'2017-11-04 21:24:14',0),(86,100005,100002,'2017-11-04 21:24:18',0),(87,100005,100002,'2017-11-04 21:25:10',0),(88,100005,100002,'2017-11-04 21:36:14',0),(89,100005,100002,'2017-11-04 21:36:47',0),(90,100045,100032,'2017-11-04 22:21:06',0),(91,100045,100025,'2017-11-04 22:21:10',0),(92,100045,100011,'2017-11-04 23:33:22',0),(93,100045,100012,'2017-11-04 23:40:55',0),(94,100045,100030,'2017-11-04 23:41:14',0),(95,100045,100042,'2017-11-05 09:05:01',0),(96,100045,100025,'2017-11-05 09:10:30',0),(97,100045,100025,'2017-11-05 09:10:56',0),(98,100045,100025,'2017-11-05 09:11:09',0),(99,100045,100025,'2017-11-05 09:11:11',0),(100,100045,100025,'2017-11-05 09:11:48',0),(101,100045,100023,'2017-11-05 09:12:08',0),(102,100045,100009,'2017-11-05 09:16:18',0),(103,100045,100028,'2017-11-05 09:30:21',0),(104,100045,100011,'2017-11-05 12:53:28',0),(105,100045,100004,'2017-11-05 13:56:00',0),(106,100045,100004,'2017-11-05 13:57:02',0),(107,100045,100030,'2017-11-05 13:57:43',0),(108,100045,100002,'2017-11-05 14:22:12',0);

--
-- Table structure for table `writer`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `writer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pseudonym` varchar(50) DEFAULT NULL,
  `reg_time` datetime DEFAULT NULL,
  `essay_count` int(11) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `writer`
--

INSERT INTO `writer` (`id`, `pseudonym`, `reg_time`, `essay_count`, `username`, `password`, `status`) VALUES (1,'莫言','2017-10-27 14:35:36',4,'moyan','b714e56faeedf82621e280ee9e85f136',1),(2,'没有草原却爱上野马','2017-10-30 20:17:11',1,'mycyqasym','11cbaa2aaddac9f568eb3f985ddf7cd3',0),(3,'爱吃火锅的小辣椒','2017-10-31 10:22:32',1,'moyan1','1660e254ed6928e3c93df8beb3a6de88',1),(4,'奔跑的哈士奇','2017-10-31 10:25:35',2,'moyan2','84d6d590865933c8608706f2860d76c8',1),(11,'adfads','2017-11-03 15:11:32',0,'adfas','348da5e157fcb9a3d3b455108e2f91dd',1),(12,'莫言3','2017-11-03 16:29:03',0,'moyan3','b0640964b92d38541e1f51ba2c15ef0e',1),(13,'莫言4','2017-11-03 16:30:53',1,'moyan4','ac6f5cb04b4be4cf3668c4de7a37872d',1);

--
-- Table structure for table `writer_essay_like`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `writer_essay_like` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `essay_id` int(11) DEFAULT NULL,
  `like_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_fk_essay_like_userid` (`user_id`),
  KEY `FK_fk_welikeeid` (`essay_id`),
  CONSTRAINT `FK_fk_essay_like_userid` FOREIGN KEY (`user_id`) REFERENCES `user_basic` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_fk_welikeeid` FOREIGN KEY (`essay_id`) REFERENCES `essay` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `writer_essay_like`
--

INSERT INTO `writer_essay_like` (`id`, `user_id`, `essay_id`, `like_time`) VALUES (1,100012,9,'2017-11-02 15:42:59'),(2,100012,6,'2017-11-02 15:44:36'),(3,100002,9,'2017-11-03 17:21:46'),(4,100012,11,'2017-11-03 17:23:17'),(5,100005,11,'2017-11-04 17:15:21'),(6,100045,5,'2017-11-05 09:14:39'),(7,100045,9,'2017-11-05 09:16:07');
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 trigger Trigger_essay_like after insert
on writer_essay_like for each row
update essay set like_count=like_count+1 where id=new.essay_id */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
COMMIT;
-- Dump completed on 2017-11-05 15:23:24

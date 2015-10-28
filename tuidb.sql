-- MySQL dump 10.13  Distrib 5.6.26, for osx10.8 (x86_64)
--
-- Host: localhost    Database: tuidb
-- ------------------------------------------------------
-- Server version	5.6.26

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
-- Table structure for table `application`
--

DROP TABLE IF EXISTS `application`;
CREATE TABLE IF NOT EXISTS `application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `info` text CHARACTER SET utf8 NOT NULL,
  `full_name` text CHARACTER SET utf8 NOT NULL,
  `phone` text CHARACTER SET utf8 NOT NULL,
  `email` text CHARACTER SET utf8 NOT NULL,
  `request_type_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `application`
--

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
INSERT INTO `application` (`id`, `info`, `full_name`, `phone`, `email`, `request_type_id`, `status`) VALUES
(1, 'Здравствуйте! Я директор Харьковского детского дома №5. Наши дети нуждаются в медикаментах! Звоните в любое время.', 'Карасиков Владислав Викторович', '+380678364374833', 'karas@ya.ru', 1, 0),
(2, 'Я директор текстильной фабрики Николаев А.В. Готов пожертвовать одежду нуждающимся. Звонить во 2 половине дня.', 'Николаев Андрей Викторович', '+3805674656764', 'nikAV@textil.ua', 2, 0),
(3, 'Нечего есть в поселке Добровольное. Помогите!', 'Крестьянова Лидия Юрьевна', '+3803457347538756', 'lidia@dobro.com', 1, 1),
(4, 'Я хочу помочь деткам! У меня есть одежда, оставшаяся от моих деток. Звоните', 'Милевская Варвара Николаевна', '+34647856478', 'motherVarya@mymail.com', 2, 1),
(5, 'У меня большая семья и мы нуждаемся в одежде. Срочно, ибо зима близко!', 'Носов Фёдор Константинович', '+3678483473', '-', 1, 1),
(6, 'Полтавскую окружная больница №9 готова помочь с медикаментами.', 'Вольная Алла Николаевна', '+3678465454', 'allamed@hospital.ua', 2, 1);
/*!40000 ALTER TABLE `application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `available_resource`
--

DROP TABLE IF EXISTS `available_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `available_resource` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) NOT NULL,
  `stock_id` int(11) DEFAULT NULL,
  `number` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `available_resource`
--

LOCK TABLES `available_resource` WRITE;
/*!40000 ALTER TABLE `available_resource` DISABLE KEYS */;
INSERT INTO `available_resource` (`id`, `resource_id`, `stock_id`, `number`) VALUES
(1, 1, 1, 10),
(2, 2, 2, 20),
(3, 1, 3, 30),
(4, 1, 4, 65),
(5, 2, 5, 20),
(6, 3, 6, 30),
(7, 1, 7, 10);
/*!40000 ALTER TABLE `available_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `stock_id` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `available_resource`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
CREATE TABLE IF NOT EXISTS `location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `region_id` int(11) NOT NULL,
  `address` text NOT NULL,
  `x_coord` double NOT NULL,
  `y_coord` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` (`id`, `region_id`, `address`, `x_coord`, `y_coord`) VALUES
(1, 19, 'улица Тобольская, 46-а', 30.456149, 50.29807),
(2, 19, 'улица Астрономическая, 1', 50.05425, 36.292063),
(3, 9, 'улица Сергея Есенина, 21', 50.49749, 30.74034),
(4, 5, 'Соборная площадь, 2/2', 28.657425, 50.254992),
(5, 1, 'улица Архитектора Артынова, 37', 28.465527, 49.23267),
(6, 17, 'Покровская улица, 6', 34.469355, 50.578017),
(7, 1, 'улица Козицкого, 71', 28.470243, 49.231894),
(8, 5, 'Замковая площадь, 2', 28.654677, 50.255089),
(9, 17, 'Нижнесоборная улица, 10', 34.801623, 50.909356),
(10, 9, 'переулок Тараса Шевченко, 11', 29.918453, 50.079386),
(11, 13, 'улица Лягина, 4', 31.992726, 46.974885);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `measure`
--

DROP TABLE IF EXISTS `measure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measure`
--

LOCK TABLES `measure` WRITE;
/*!40000 ALTER TABLE `measure` DISABLE KEYS */;
INSERT INTO `measure` VALUES (1,'кг'),(2,'м'),(3,'шт');
/*!40000 ALTER TABLE `measure` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` (`id`, `name`) VALUES
(1, 'Суперадмин'),
(2, 'Координатор'),
(3, 'Редактор карты'),
(4, 'Водитель'),
(5, 'Заведующий складом'),
(6, 'Обработчик заявок');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `surname` text NOT NULL,
  `second_name` text NOT NULL,
  `login` text NOT NULL,
  `password` text NOT NULL,
  `region_id` int(11) NOT NULL,
  `address` text NOT NULL,
  `phone` text NOT NULL,
  `email` text NOT NULL,
  `permission_id` int(11) NOT NULL,
  `city` text NOT NULL,
  `birthday` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` (`id`, `name`, `surname`, `second_name`, `login`, `password`, `region_id`, `address`, `phone`, `email`, `permission_id`, `city`, `birthday`) VALUES
(1, 'Елизавета', 'Попова', 'Олеговна', 'liza', '1', 19, 'улица Астрономическая, 37', '3150897', 'lizapopova@yandex.ru', 1, 'Харьков', '1999-01-25'),
(2, 'Станислав', 'Минаков', 'Сергеевич', 'stas', '2', 19, 'улица 23 Августа, 16', '3568790', 'supermina999@gmail.com', 5, 'Харьков', '1999-01-15'),
(3, 'Роман', 'Скурихин', 'Владимирович', 'roma', '3', 19, 'улица Розы Люксембург, 4', '3780987', 'romasku135@gmail.com', 6, 'Харьков', '1998-09-17'),
(4, 'София', 'Уфимцева', 'Игоревна', 'sofy', '4', 19, 'улица Тобольская, 78Б', '9007865', 'sonya.uf@gmail.com', 4, 'Харьков', '1999-01-28'),
(5, 'Артем', 'Пайвин', 'Юрьевич', 'artem', '5', 9, 'улица Довженко, 6', '2346789', 'payvinartem@gmail.com', 3, 'Киев', '1998-12-23');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
CREATE TABLE IF NOT EXISTS `region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` (`id`, `name`) VALUES
(1, 'Винницкая область'),
(2, 'Волынская область'),
(3, 'Днепропетровская область'),
(4, 'Донецкая область'),
(5, 'Житомирская область'),
(6, 'Закарпатская область'),
(7, 'Запорожская область'),
(8, 'Ивано-Франковская область'),
(9, 'Киевская область'),
(10, 'Кировоградская область'),
(11, 'Луганская область'),
(12, 'Львовская область'),
(13, 'Николаевская область'),
(14, 'Одесская область'),
(15, 'Полтавская область'),
(16, 'Ровенская область'),
(17, 'Сумская область'),
(18, 'Тернопольская область'),
(19, 'Харьковская область'),
(20, 'Херсонская область'),
(21, 'Хмельницкая область'),
(22, 'Черкасская область'),
(23, 'Черниговская область'),
(24, 'Черновицкая область');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
CREATE TABLE IF NOT EXISTS `request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_type_id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `application_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` (`id`, `request_type_id`, `resource_id`, `number`, `application_id`, `location_id`, `status`, `date`) VALUES
(1, 1, 3, 10, 3, 4, 0, '2015-05-05'),
(2, 2, 2, 12, 4, 2, 0, '2015-10-27'),
(3, 1, 2, 10, 5, 5, 1, '2015-10-25'),
(4, 2, 1, 30, 6, 6, 1, '2015-10-19');
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_type`
--

DROP TABLE IF EXISTS `request_type`;
CREATE TABLE IF NOT EXISTS `request_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_type`
--

LOCK TABLES `request_type` WRITE;
/*!40000 ALTER TABLE `request_type` DISABLE KEYS */;
INSERT INTO `request_type` (`id`, `name`) VALUES
(1, 'Получение ресурса'),
(2, 'Пожертвование ресурса');
/*!40000 ALTER TABLE `request_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource`
--

DROP TABLE IF EXISTS `resource`;
CREATE TABLE IF NOT EXISTS `resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `weight` int(11) NOT NULL,
  `measure_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource`
--

LOCK TABLES `resource` WRITE;
/*!40000 ALTER TABLE `resource` DISABLE KEYS */;
INSERT INTO `resource` (`id`, `name`, `weight`, `measure_id`) VALUES
(1, 'Медикаменты', 2, 1),
(2, 'Одежда', 3, 1),
(3, 'Хлеб', 1, 1);
/*!40000 ALTER TABLE `resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `safety`
--

DROP TABLE IF EXISTS `safety`;
CREATE TABLE IF NOT EXISTS `safety` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `safety`
--

LOCK TABLES `safety` WRITE;
/*!40000 ALTER TABLE `safety` DISABLE KEYS */;
INSERT INTO `safety` (`id`, `name`) VALUES
(1, 'абсолютно безопасно'),
(2, 'безопасно'),
(3, 'достаточно безопасно'),
(4, 'небезопасно'),
(5, 'опасно'),
(6, 'очень опасно');
/*!40000 ALTER TABLE `safety` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
CREATE TABLE IF NOT EXISTS `stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` (`id`, `location_id`, `person_id`) VALUES
(1, 1, 2),
(2, 3, 2),
(3, 7, 2),
(4, 8, 2),
(5, 9, 2),
(6, 10, 2),
(7, 11, 2);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transport`
--

DROP TABLE IF EXISTS `transport`;
CREATE TABLE IF NOT EXISTS `transport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  `number` text NOT NULL,
  `person_id` int(11) NOT NULL,
  `stock_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transport`
--

LOCK TABLES `transport` WRITE;
/*!40000 ALTER TABLE `transport` DISABLE KEYS */;
INSERT INTO `transport` (`id`, `type_id`, `number`, `person_id`, `stock_id`) VALUES
(1, 1, 'АХ1800', 4, 1),
(2, 2, 'АН5626АУ', 4, 2),
(3, 1, 'АС5665УУ', 4, 3),
(4, 2, 'АК5670УА', 4, 4),
(5, 1, 'АУ4444АУ', 4, 5),
(6, 2, 'ГР5672АА', 4, 6),
(7, 1, 'АХ6767АУ', 4, 7);
/*!40000 ALTER TABLE `transport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transportation`
--

DROP TABLE IF EXISTS `transportation`;
CREATE TABLE IF NOT EXISTS `transportation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_id` int(11) NOT NULL,
  `transport_id` int(11) NOT NULL,
  `time_start` text NOT NULL,
  `time_finish` text NOT NULL,
  `status` int(11) NOT NULL,
  `safety_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transportation`
--

LOCK TABLES `transportation` WRITE;
/*!40000 ALTER TABLE `transportation` DISABLE KEYS */;
INSERT INTO `transportation` (`id`, `request_id`, `transport_id`, `time_start`, `time_finish`, `status`, `safety_id`) VALUES
(1, 1, 4, '11:00', '12:00', 0, 1),
(2, 2, 1, '17:00', '19:30', 0, 3),
(3, 3, 3, '15:30', '16:45', 1, 2),
(4, 4, 5, '8:00', '9:15', 1, 4);
/*!40000 ALTER TABLE `transportation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transport_type`
--

DROP TABLE IF EXISTS `transport_type`;
CREATE TABLE IF NOT EXISTS `transport_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `speed` int(11) NOT NULL,
  `max_weight` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transport_type`
--

LOCK TABLES `transport_type` WRITE;
/*!40000 ALTER TABLE `transport_type` DISABLE KEYS */;
INSERT INTO `transport_type` (`id`, `name`, `speed`, `max_weight`) VALUES
(1, 'Газель', 30, 10),
(2, 'Фура', 50, 20);
/*!40000 ALTER TABLE `transport_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-10 10:45:40

-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: tuidb
-- ------------------------------------------------------
-- Server version	5.5.44-0ubuntu0.14.04.1

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
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `info` text NOT NULL,
  `full_name` text NOT NULL,
  `phone` text NOT NULL,
  `email` text NOT NULL,
  `request_type_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
(6, 'Полтавскую окружная больница №9 готова помочь с медикаментами.', 'Вольная Алла Николаевна', '+3678465454', 'allamed@hospital.ua', 2, 1),
(7, 'Я директор школы №6 в поселке Березняки. Нам не хватает парт и стульев. Помогите пожалуйста!', 'Абрамова Ирина Андреевна', '+380968755303', 'irina@mail.ru', 1, 0),
(8, 'Фирма "Авель" готова предоставить школам новые компьютеры. Звонки только в первой половине дня.', 'Баев Илья Александрович', '+38095874487', 'baevil@avel.com', 2, 0),
(9, 'Магазин обуви "Юлия" может предоставить обувь всевозможных размеров.', 'Валиева Татьяна Владимировна', '+3809855208', 'tatianaVAL@julia.com', 2, 0),
(10, 'Помогите пожалуйста! Не хватает антигистаминных в селе Ольшана!', 'Девятовская Ирина Владимировна', '+38095874456', 'Irina999@gmail.com', 1, 1),
(11, 'Я хочу отдать лишнюю одежду нуждающимся!', 'Дунаев Александр Сергеевич', '+39029878367', 'dunaevAleks@mail.ru', 2, 1),
(12, 'Здравствуйте, я частный предприниматель и готов пожертвовать футболки и куртки разных размеров.', 'Иваненко Дарья Олеговна', '+3805678453', 'Ivanenko78@ii.ru', 2, 1);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `available_resource`
--

LOCK TABLES `available_resource` WRITE;
/*!40000 ALTER TABLE `available_resource` DISABLE KEYS */;
INSERT INTO `available_resource` (`id`, `resource_id`, `stock_id`, `number`) VALUES
(2, 7, 2, 20),
(3, 10, 3, 30),
(4, 11, 4, 65),
(5, 2, 5, 20),
(6, 3, 6, 30),
(7, 5, 7, 10),
(8, 6, 18, 25),
(9, 9, 19, 15);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` (`id`, `number`, `resource_id`, `stock_id`, `date`) VALUES
(1, 20, 7, 2, '2015-10-19'),
(2, 30, 10, 3, '2015-10-20'),
(3, 65, 11, 4, '2015-10-21'),
(4, 20, 2, 5, '2015-10-21'),
(5, 30, 3, 6, '2015-10-22'),
(6, 10, 5, 7, '2015-10-23'),
(7, 25, 6, 12, '2015-10-24'),
(8, 15, 9, 13, '2015-10-25'),
(9, 10, 7, 2, '2015-10-23'),
(10, 30, 7, 2, '2015-10-26');
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `region_id` int(11) NOT NULL,
  `address` text NOT NULL,
  `x_coord` double NOT NULL,
  `y_coord` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` (`id`, `region_id`, `address`, `x_coord`, `y_coord`) VALUES
(2, 19, 'улица Астрономическая, 1', 50.05425, 36.292063),
(3, 9, 'улица Сергея Есенина, 21', 50.49749, 30.74034),
(4, 5, 'Соборная площадь, 2/2', 28.657425, 50.254992),
(5, 1, 'улица Архитектора Артынова, 37', 28.465527, 49.23267),
(6, 17, 'Покровская улица, 6', 34.469355, 50.578017),
(7, 1, 'улица Козицкого, 71', 28.470243, 49.231894),
(8, 5, 'Замковая площадь, 2', 28.654677, 50.255089),
(9, 17, 'Нижнесоборная улица, 10', 34.801623, 50.909356),
(10, 9, 'переулок Тараса Шевченко, 11', 29.918453, 50.079386),
(11, 13, 'улица Лягина, 4', 31.992726, 46.974885),
(24, 22, 'улица Свердлова, 42', 31.881677, 49.246581),
(25, 17, 'улица Герасима Кондратьева, 4', 34.797958, 50.90613),
(26, 16, 'Парковая улица, 8', 26.253992, 50.616811),
(27, 19, 'Пушкинская улица, 34', 36.238137, 49.99632),
(28, 19, 'Клочковская улица, 50', 36.22689, 49.99819),
(29, 19, 'Рымарская улица, 8', 36.231032, 49.99431),
(30, 19, 'Чернышевская улица, 1', 36.235954, 49.995926),
(31, 19, 'Бородиновская улица, 9', 36.213128, 50.005966),
(33, 19, 'улица Квитки-Основьяненко, 15', 36.231696, 49.988889);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measure`
--

LOCK TABLES `measure` WRITE;
/*!40000 ALTER TABLE `measure` DISABLE KEYS */;
INSERT INTO `measure` VALUES (1,'кг'),(2,'м'),(3,'шт'),(4,'л');
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
INSERT INTO `permission` VALUES (1,'Суперадмин'),(2,'Координатор'),(3,'Редактор карты'),(4,'Водитель'),(5,'Заведующий складом'),(6,'Обработчик заявок');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` (`id`, `name`, `surname`, `second_name`, `login`, `password`, `region_id`, `address`, `phone`, `email`, `permission_id`, `city`, `birthday`) VALUES
(1, 'Елизавета', 'Попова', 'Олеговна', 'liza', 'c4ca4238a0b923820dcc509a6f75849b', 19, 'улица Астрономическая, 37', '3150897', 'lizapopova@yandex.ru', 1, 'Харьков', '1999-01-25'),
(2, 'Станислав', 'Минаков', 'Сергеевич', 'stas', 'c81e728d9d4c2f636f067f89cc14862c', 19, 'улица 23 Августа, 16', '3568790', 'supermina999@gmail.com', 5, 'Харьков', '1999-01-15'),
(3, 'Роман', 'Скурихин', 'Владимирович', 'roma', 'eccbc87e4b5ce2fe28308fd9f2a7baf3', 19, 'улица Розы Люксембург, 4', '3780987', 'romasku135@gmail.com', 6, 'Харьков', '1998-09-17'),
(4, 'София', 'Уфимцева', 'Игоревна', 'sofy', 'a87ff679a2f3e71d9181a67b7542122c', 19, 'улица Тобольская, 78Б', '9007865', 'sonya.uf@gmail.com', 4, 'Харьков', '1999-01-28'),
(5, 'Артем', 'Пайвин', 'Юрьевич', 'artem', 'e4da3b7fbbce2345d7772b0674a318d5', 9, 'улица Довженко, 6', '2346789', 'payvinartem@gmail.com', 3, 'Киев', '1998-12-23'),
(11, 'Екатерина', 'Бочарова', 'Павловна', 'ekaterin', 'c4ca4238a0b923820dcc509a6f75849b', 9, 'улица Тобольская, 46-а', '+3809812345', 'katerin@gmail.com', 5, 'Киев', '1997-01-10'),
(12, 'Владимир', 'Земцов', 'Николаевич', 'vlad', 'c4ca4238a0b923820dcc509a6f75849b', 5, 'Соборная площадь, 2/2', '+380987844202', 'semzov@au.com', 4, 'Житомир', '1987-10-10'),
(14, 'Елена', 'Кочегарова', 'Владимировна', 'elena', 'c4ca4238a0b923820dcc509a6f75849b', 1, 'улица Архитектора Артынова, 37', '+380872230709', 'elena@mail.ru', 5, 'Винница', '1987-09-17'),
(15, 'Ольга', 'Лазарева', 'Николаевна', 'olga', 'c4ca4238a0b923820dcc509a6f75849b', 17, 'Покровская улица, 6', '+3800098654', 'olgaLas@lala.ru', 6, 'Сумы', '1989-12-19'),
(16, 'Сергей', 'Новоселов', 'Аркадиевич', 'sergei', 'c4ca4238a0b923820dcc509a6f75849b', 17, 'Нижнесоборная улица, 10', '+38098783423', 'serg999@mail.ru', 4, 'Сумы', '1988-09-23'),
(17, 'Александр', 'Суперадмин', 'Викторович', 'superadmin', 'c4ca4238a0b923820dcc509a6f75849b', 2, 'улица Козицкого, 71', '+38098433258', 'superadmin@xlv.com', 1, 'Луцк', '1999-01-01'),
(18, 'Владимир', 'Координатор', 'Иванович', 'coordinator', 'c4ca4238a0b923820dcc509a6f75849b', 9, 'переулок Тараса Шевченко, 11', '+3809930409876', 'coordinator@xlv.com', 2, 'Киев', '1999-01-01'),
(19, 'Борис', 'Редактор', 'Константинович', 'editor', 'c4ca4238a0b923820dcc509a6f75849b', 13, 'улица Лягина, 4', '+3809712039272', 'map_editor@xlv.com', 3, 'Николаев', '1999-01-01'),
(20, 'Павел', 'Водитель', 'Иванович', 'driver', 'c4ca4238a0b923820dcc509a6f75849b', 22, 'улица Свердлова, 42', '+3809587294712', 'driver@xlv.com', 4, 'Черкассы', '1999-01-01'),
(21, 'Максим', 'Заведующий', 'Викторович', 'manager', 'c4ca4238a0b923820dcc509a6f75849b', 22, 'улица Свердлова, 42', '+38098782200', 'stock_manager@xlv.com', 5, 'Черкассы', '1999-01-01'),
(22, 'Евгений', 'Обработчик', 'Леонидович', 'handler', 'c4ca4238a0b923820dcc509a6f75849b', 17, 'Парковая улица, 8', '+380998730080', 'application_handler@xlv.com', 6, 'Сумы', '1999-01-01');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region` (
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
INSERT INTO `region` VALUES (1,'Винницкая область'),(2,'Волынская область'),(3,'Днепропетровская область'),(4,'Донецкая область'),(5,'Житомирская область'),(6,'Закарпатская область'),(7,'Запорожская область'),(8,'Ивано-Франковская область'),(9,'Киевская область'),(10,'Кировоградская область'),(11,'Луганская область'),(12,'Львовская область'),(13,'Николаевская область'),(14,'Одесская область'),(15,'Полтавская область'),(16,'Ровенская область'),(17,'Сумская область'),(18,'Тернопольская область'),(19,'Харьковская область'),(20,'Херсонская область'),(21,'Хмельницкая область'),(22,'Черкасская область'),(23,'Черниговская область'),(24,'Черновицкая область');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_type_id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `application_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` (`id`, `request_type_id`, `resource_id`, `number`, `application_id`, `location_id`, `status`, `date`) VALUES
(1, 1, 3, 10, 3, 27, 0, '2015-11-03'),
(2, 2, 2, 12, 4, 2, 0, '2015-11-03'),
(3, 1, 2, 10, 5, 5, 1, '2015-10-25'),
(4, 2, 11, 30, 6, 6, 1, '2015-11-03'),
(6, 1, 4, 20, 10, 24, 1, '2015-10-27'),
(7, 2, 2, 37, 11, 28, 0, '2015-11-03'),
(8, 2, 2, 25, 12, 29, 0, '2015-11-03'),
(9, 1, 3, 10, 3, 27, 0, '2015-11-04'),
(10, 2, 2, 12, 4, 2, 0, '2015-11-04'),
(11, 2, 2, 37, 11, 28, 0, '2015-11-04'),
(13, 2, 2, 25, 12, 29, 0, '2015-11-04');
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_type`
--

DROP TABLE IF EXISTS `request_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_type`
--

LOCK TABLES `request_type` WRITE;
/*!40000 ALTER TABLE `request_type` DISABLE KEYS */;
INSERT INTO `request_type` VALUES (1,'Потребность в ресурсе'),(2,'Пожертвование ресурса');
/*!40000 ALTER TABLE `request_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource`
--

DROP TABLE IF EXISTS `resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `weight` double NOT NULL,
  `measure_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource`
--

LOCK TABLES `resource` WRITE;
/*!40000 ALTER TABLE `resource` DISABLE KEYS */;
INSERT INTO `resource` VALUES (2,'Одежда',3,1),(3,'Хлеб',0.5,1),(4,'Антигистаминные препараты',0.7,3),(5,'Крупы',1,1),(6,'Консервы',2,3),(7,'Вода',2,4),(8,'Канцтовары',1,3),(9,'Одеяла',1,3),(10,'Бинты',1,2),(11,'Перекись водорода',1,4);
/*!40000 ALTER TABLE `resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `safety`
--

DROP TABLE IF EXISTS `safety`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `safety` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `safety`
--

LOCK TABLES `safety` WRITE;
/*!40000 ALTER TABLE `safety` DISABLE KEYS */;
INSERT INTO `safety` VALUES (1,'абсолютно безопасно'),(2,'безопасно'),(3,'достаточно безопасно'),(4,'небезопасно'),(5,'опасно'),(6,'очень опасно');
/*!40000 ALTER TABLE `safety` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` (`id`, `location_id`, `person_id`) VALUES
(2, 3, 14),
(3, 7, 2),
(4, 8, 2),
(5, 9, 14),
(6, 10, 11),
(7, 11, 11),
(12, 24, 14),
(13, 25, 2),
(14, 26, 14),
(18, 30, 21),
(19, 31, 21),
(21, 33, 11);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transport`
--

DROP TABLE IF EXISTS `transport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  `number` text NOT NULL,
  `person_id` int(11) NOT NULL,
  `stock_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transport`
--

LOCK TABLES `transport` WRITE;
/*!40000 ALTER TABLE `transport` DISABLE KEYS */;
INSERT INTO `transport` (`id`, `type_id`, `number`, `person_id`, `stock_id`) VALUES
(3, 4, 'АС5665УУ', 20, 18),
(4, 2, 'АК5670УА', 12, 4),
(5, 6, 'АУ4444АУ', 20, 19),
(6, 4, 'ГР5672АА', 16, 21),
(7, 1, 'АХ6767АУ', 4, 7);
/*!40000 ALTER TABLE `transport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transport_type`
--

DROP TABLE IF EXISTS `transport_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transport_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `speed` int(11) NOT NULL,
  `max_weight` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transport_type`
--

LOCK TABLES `transport_type` WRITE;
/*!40000 ALTER TABLE `transport_type` DISABLE KEYS */;
INSERT INTO `transport_type` VALUES (1,'ГАЗ 3302',60,1.6),(2,'Mercedes-Benz Actros',50,2),(4,'Volvo FH12',60,1),(6,'Renault Magnum',60,2.5);
/*!40000 ALTER TABLE `transport_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transportation`
--

DROP TABLE IF EXISTS `transportation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transportation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_id` int(11) NOT NULL,
  `transport_id` int(11) NOT NULL,
  `time_start` text NOT NULL,
  `time_finish` text NOT NULL,
  `status` int(11) NOT NULL,
  `safety_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transportation`
--

LOCK TABLES `transportation` WRITE;
/*!40000 ALTER TABLE `transportation` DISABLE KEYS */;
INSERT INTO `transportation` (`id`, `request_id`, `transport_id`, `time_start`, `time_finish`, `status`, `safety_id`) VALUES
(1, 1, 4, '11:00', '12:00', 0, 1),
(3, 3, 3, '15:30', '16:45', 1, 2),
(4, 4, 5, '8:00', '9:15', 0, 4),
(6, 6, 5, '8:00', '11:45', 1, 4);
/*!40000 ALTER TABLE `transportation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-02 10:30:28

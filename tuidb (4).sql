-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Окт 17 2015 г., 20:16
-- Версия сервера: 5.5.44-0ubuntu0.14.04.1
-- Версия PHP: 5.5.9-1ubuntu4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `tuidb`
--

-- --------------------------------------------------------

--
-- Структура таблицы `application`
--

CREATE TABLE IF NOT EXISTS `application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `info` text CHARACTER SET utf8 NOT NULL,
  `full_name` text CHARACTER SET utf8 NOT NULL,
  `phone` text CHARACTER SET utf8 NOT NULL,
  `email` text CHARACTER SET utf8 NOT NULL,
  `request_type_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `application`
--

INSERT INTO `application` (`id`, `info`, `full_name`, `phone`, `email`, `request_type_id`, `status_id`) VALUES
(1, 'Я хочу кушать! Помогите!', 'Карасиков Владислав Викторович', '12345', 'karas@ya.ru', 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `available_resource`
--

CREATE TABLE IF NOT EXISTS `available_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) NOT NULL,
  `stock_id` int(11) DEFAULT NULL,
  `number` int(11) NOT NULL,
  `measure_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `available_resource`
--

INSERT INTO `available_resource` (`id`, `resource_id`, `stock_id`, `number`, `measure_id`) VALUES
(1, 1, 1, 12, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `country`
--

INSERT INTO `country` (`id`, `name`) VALUES
(1, 'Украина');

-- --------------------------------------------------------

--
-- Структура таблицы `emergency`
--

CREATE TABLE IF NOT EXISTS `emergency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `emergency`
--

INSERT INTO `emergency` (`id`, `name`) VALUES
(1, 'Несрочно'),
(2, 'Достаточно срочно'),
(3, 'Срочно'),
(4, 'Очень срочно');

-- --------------------------------------------------------

--
-- Структура таблицы `location`
--

CREATE TABLE IF NOT EXISTS `location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `region_id` int(11) NOT NULL,
  `address` text NOT NULL,
  `x_coord` double NOT NULL,
  `y_coord` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Дамп данных таблицы `location`
--

INSERT INTO `location` (`id`, `region_id`, `address`, `x_coord`, `y_coord`) VALUES
(1, 1, 'улица Тобольская, 46-а', 30.456149, 50.29807),
(2, 1, 'улица Астрономическая, 1', 50.05425, 36.292063),
(3, 2, 'улица Сергея Есенина, 21', 50.49749, 30.74034);

-- --------------------------------------------------------

--
-- Структура таблицы `measure`
--

CREATE TABLE IF NOT EXISTS `measure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `measure`
--

INSERT INTO `measure` (`id`, `name`) VALUES
(1, 'кг'),
(2, 'м'),
(3, 'шт');

-- --------------------------------------------------------

--
-- Структура таблицы `permission`
--

CREATE TABLE IF NOT EXISTS `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `permission`
--

INSERT INTO `permission` (`id`, `name`) VALUES
(1, 'Суперадмин'),
(2, 'Координатор'),
(3, 'Редактор карты'),
(4, 'Водитель'),
(5, 'Заведующий складом'),
(6, 'Обработчик заявок');

-- --------------------------------------------------------

--
-- Структура таблицы `person`
--

CREATE TABLE IF NOT EXISTS `person` (
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
  `date` date NOT NULL,
  `city` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Дамп данных таблицы `person`
--

INSERT INTO `person` (`id`, `name`, `surname`, `second_name`, `login`, `password`, `region_id`, `address`, `phone`, `email`, `permission_id`, `date`, `city`) VALUES
(1, 'Елизавета', 'Попова', 'Олеговна', 'liza', '1', 1, 'улица Астрономическая, 37', '3150897', 'lizapopova@yandex.ru', 1, '2015-09-17', 'Харьков'),
(2, 'Станислав', 'Минаков', 'Сергеевич', 'stas', '2', 1, 'улица 23 Августа, 16', '3568790', 'supermina999@gmail.com', 2, '2015-09-17', 'Харьков'),
(3, 'Роман', 'Скурихин', 'Владимирович', 'roma', '3', 1, 'улица Розы Люксембург, 4', '3780987', 'romasku135@gmail.com', 6, '2015-09-17', 'Харьков'),
(4, 'София', 'Уфимцева', 'Игоревна', 'sofy', '4', 2, 'улица Тобольская, 78Б', '9007865', 'sonya.uf@gmail.com', 4, '2015-09-17', 'Харьков'),
(5, 'Артем', 'Пайвин', 'Юрьевич', 'artem', '5', 1, 'улица Довженко, 6', '2346789', 'payvinartem@gmail.com', 3, '2015-09-17', 'Киев');

-- --------------------------------------------------------

--
-- Структура таблицы `region`
--

CREATE TABLE IF NOT EXISTS `region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `country_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `region`
--

INSERT INTO `region` (`id`, `name`, `country_id`) VALUES
(1, 'Харьковcкая область', 1),
(2, 'Киевская область', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `request`
--

CREATE TABLE IF NOT EXISTS `request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_type_id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `measure_id` int(11) NOT NULL,
  `application_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `emergency_id` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `request`
--

INSERT INTO `request` (`id`, `request_type_id`, `resource_id`, `number`, `measure_id`, `application_id`, `location_id`, `status_id`, `emergency_id`, `date`) VALUES
(1, 1, 1, 10, 1, 1, 1, 1, 1, '0000-00-00');

-- --------------------------------------------------------

--
-- Структура таблицы `request_type`
--

CREATE TABLE IF NOT EXISTS `request_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `request_type`
--

INSERT INTO `request_type` (`id`, `name`) VALUES
(1, 'Получение ресурса'),
(2, 'Пожертвование ресурса');

-- --------------------------------------------------------

--
-- Структура таблицы `resource`
--

CREATE TABLE IF NOT EXISTS `resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `resource`
--

INSERT INTO `resource` (`id`, `name`, `weight`) VALUES
(1, 'Медикаменты', 0),
(2, 'Одежда', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `safety`
--

CREATE TABLE IF NOT EXISTS `safety` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `safety`
--

INSERT INTO `safety` (`id`, `name`) VALUES
(1, 'Безопасно'),
(2, 'Достаточно безопасно'),
(3, 'Небезопасно'),
(4, 'Опасно');

-- --------------------------------------------------------

--
-- Структура таблицы `status`
--

CREATE TABLE IF NOT EXISTS `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `status`
--

INSERT INTO `status` (`id`, `name`) VALUES
(1, '??????????'),
(2, '????????????');

-- --------------------------------------------------------

--
-- Структура таблицы `stock`
--

CREATE TABLE IF NOT EXISTS `stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `stock`
--

INSERT INTO `stock` (`id`, `location_id`, `date`) VALUES
(1, 1, '2015-09-23');

-- --------------------------------------------------------

--
-- Структура таблицы `transport`
--

CREATE TABLE IF NOT EXISTS `transport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `person_id` int(11) NOT NULL,
  `stock_id` int(11) NOT NULL,
  `speed` int(11) NOT NULL,
  `max_weight` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `transport`
--

INSERT INTO `transport` (`id`, `name`, `person_id`, `stock_id`, `speed`, `max_weight`) VALUES
(1, 'Грузовик', 4, 1, 30, 120);

-- --------------------------------------------------------

--
-- Структура таблицы `transportation`
--

CREATE TABLE IF NOT EXISTS `transportation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_id` int(11) NOT NULL,
  `transport_id` int(11) NOT NULL,
  `time_start` date NOT NULL,
  `time_finish` date NOT NULL,
  `status_id` int(11) NOT NULL,
  `safety_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `transportation`
--

INSERT INTO `transportation` (`id`, `request_id`, `transport_id`, `time_start`, `time_finish`, `status_id`, `safety_id`) VALUES
(1, 1, 1, '2015-10-12', '2015-10-12', 1, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

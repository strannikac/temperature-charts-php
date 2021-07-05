-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 05, 2021 at 07:32 AM
-- Server version: 10.2.37-MariaDB
-- PHP Version: 7.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dreamsfm_r8`
--

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `iso` varchar(3) NOT NULL,
  `iso2` varchar(2) NOT NULL,
  `title` varchar(35) NOT NULL,
  `pos` int(11) NOT NULL,
  `status_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `iso`, `iso2`, `title`, `pos`, `status_id`) VALUES
(101, 'fin', 'fi', 'Finland', 900, 1),
(201, 'est', 'ee', 'Estonia', 1000, 1),
(301, 'lva', 'lv', 'Latvia', 2000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `countries_langs`
--

CREATE TABLE `countries_langs` (
  `country_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries_langs`
--

INSERT INTO `countries_langs` (`country_id`, `language_id`, `title`) VALUES
(101, 1, 'Finland'),
(101, 2, 'Soome'),
(101, 3, 'Финляндия'),
(201, 1, 'Estonia'),
(201, 2, 'Eestimaa'),
(201, 3, 'Эстония'),
(301, 1, 'Latvia'),
(301, 2, 'Läti'),
(301, 3, 'Латвия');

-- --------------------------------------------------------

--
-- Table structure for table `forecasts`
--

CREATE TABLE `forecasts` (
  `id` bigint(20) NOT NULL,
  `location_id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `max_temp` decimal(5,2) NOT NULL DEFAULT 0.00,
  `min_temp` decimal(5,0) NOT NULL DEFAULT 0,
  `avg_temp` decimal(5,2) NOT NULL DEFAULT 0.00,
  `creation_time` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `forecasts`
--

INSERT INTO `forecasts` (`id`, `location_id`, `date`, `max_temp`, `min_temp`, `avg_temp`, `creation_time`) VALUES
(1, 1, '2021-07-01', '20.50', '15', '18.90', 1625397685),
(2, 3, '2021-07-03', '23.60', '17', '22.40', 1625397685),
(3, 1, '2021-06-28', '20.30', '14', '18.40', 1625397685),
(4, 1, '2021-06-30', '22.00', '15', '19.90', 1625397686),
(5, 1, '2021-06-27', '21.00', '13', '19.10', 1625397686),
(6, 1, '2021-06-29', '22.20', '14', '20.10', 1625397686),
(7, 1, '2021-07-03', '23.40', '15', '21.20', 1625397686),
(8, 2, '2021-07-03', '24.90', '18', '23.00', 1625397686),
(9, 3, '2021-06-29', '23.30', '15', '20.70', 1625397686),
(10, 3, '2021-06-27', '20.40', '15', '18.90', 1625397686),
(11, 1, '2021-07-02', '23.20', '17', '21.10', 1625397686),
(12, 3, '2021-06-28', '21.60', '15', '19.70', 1625397686),
(13, 2, '2021-06-27', '20.60', '15', '19.10', 1625397686),
(14, 2, '2021-06-28', '21.90', '16', '20.30', 1625397686),
(15, 3, '2021-06-30', '21.10', '16', '19.40', 1625397686),
(16, 3, '2021-07-01', '21.20', '16', '19.20', 1625397686),
(17, 2, '2021-06-29', '21.40', '16', '19.90', 1625397686),
(18, 3, '2021-07-02', '21.00', '15', '19.30', 1625397686),
(19, 2, '2021-07-01', '25.30', '17', '23.10', 1625397686),
(20, 2, '2021-06-30', '23.70', '15', '20.10', 1625397686),
(21, 2, '2021-07-02', '26.40', '17', '23.10', 1625397686),
(22, 1, '2021-07-04', '22.80', '14', '20.60', 1625463339),
(23, 2, '2021-07-04', '24.00', '17', '22.10', 1625463339),
(24, 3, '2021-07-04', '22.50', '16', '20.80', 1625463339);

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `iso` varchar(5) NOT NULL,
  `title` varchar(25) NOT NULL,
  `pos` int(11) NOT NULL,
  `is_def` tinyint(4) NOT NULL,
  `status_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `iso`, `title`, `pos`, `is_def`, `status_id`) VALUES
(1, 'en', 'English', 10, 1, 1),
(2, 'et', 'Eesti', 20, 0, 1),
(3, 'ru', 'Русский', 30, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `locales`
--

CREATE TABLE `locales` (
  `id` varchar(55) NOT NULL,
  `language_id` int(11) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `locales`
--

INSERT INTO `locales` (`id`, `language_id`, `value`) VALUES
('EMPTY_FILE_SELECTED', 1, 'Empty file selected'),
('EMPTY_FILE_SELECTED', 2, 'Empty file selected'),
('EMPTY_FILE_SELECTED', 3, 'Выбран пустой файл'),
('ERR_1000', 1, 'Unspecified Error.'),
('ERR_1000', 2, 'Täpsustamata viga'),
('ERR_1000', 3, 'Неизвестная ошибка.'),
('ERR_1002', 1, 'Request used forbidden controller or action.'),
('ERR_1002', 2, 'Taotlege kasutatud keelatud kontrollerit või toimingut.'),
('ERR_1002', 3, 'Запрос использует запрещенный контроллер или метод.'),
('ERR_1003', 1, 'The token is invalid or expired.'),
('ERR_1003', 2, 'Luba on vale või aegunud.'),
('ERR_1003', 3, 'Токен некорректен или устарел.'),
('ERR_1004', 1, 'The token expired.'),
('ERR_1004', 2, 'Luba aegus.'),
('ERR_1004', 3, 'Токен устарел.'),
('ERR_1005', 1, 'There are no data in the request.'),
('ERR_1005', 2, 'Taotluses pole andmeid.'),
('ERR_1005', 3, 'Нет данных в запросе.'),
('ERR_1006', 1, 'The allowed amount of data in the request is exceeded.'),
('ERR_1006', 2, 'Taotluses lubatud andmemaht on ületatud.'),
('ERR_1006', 3, 'Превышен допустимый объем данных в запросе.'),
('ERR_1007', 1, 'Failed to create a session.'),
('ERR_1007', 2, 'Seansi loomine ebaõnnestus.'),
('ERR_1007', 3, 'Ошибка создания сессии.'),
('ERR_1008', 1, 'Data didn\'t inserted in table.'),
('ERR_1008', 2, 'Andmeid ei lisatud tabelisse.'),
('ERR_1008', 3, 'Данные не были добавлены в таблицу.'),
('ERR_1009', 1, 'Data didn\'t updated in table.'),
('ERR_1009', 2, 'Andmeid ei värskendatud tabelis.'),
('ERR_1009', 3, 'Данные не были обновлены в таблице.'),
('ERR_1010', 1, 'Data didn\'t removed from table.'),
('ERR_1010', 2, 'Andmeid ei eemaldatud tabelist.'),
('ERR_1010', 3, 'Данные не были удалены из таблицы.'),
('ERR_1011', 1, 'Customer didn\'t found.'),
('ERR_1011', 2, 'Klienti ei leitud.'),
('ERR_1011', 3, 'Пользователь не найден.'),
('ERR_1012', 1, 'This item is already in your basket'),
('ERR_1012', 2, 'This item is already in your basket'),
('ERR_1012', 3, 'Этот элемент уже содержится в Вашей корзине'),
('ERR_1013', 1, 'Some date is unavailable for rent.'),
('ERR_1013', 2, 'Some date is unavailable for rent.'),
('ERR_1013', 3, 'Одна из дат недоступна для аренды.'),
('ERR_2000', 1, 'Identifier is empty.'),
('ERR_2000', 2, 'Identifier on tühi.'),
('ERR_2000', 3, 'Пустой идентификатор.'),
('ERR_2001', 1, 'There is no such identifier in the system.'),
('ERR_2001', 2, 'Sellist identifikaatorit süsteemis pole.'),
('ERR_2001', 3, 'Не существует такого идентификатора в системе.'),
('ERR_2002', 1, 'Device with such identifier is blocked.'),
('ERR_2002', 2, 'Sellise identifikaatoriga seade on blokeeritud.'),
('ERR_2002', 3, 'Устройство с таким идентификатором заблокировано.'),
('ERR_2003', 1, 'Terms of the identifier expired.'),
('ERR_2003', 2, 'Identifikaatori tingimused on aegunud.'),
('ERR_2003', 3, 'Правила для идентификатора устарели.'),
('ERR_2004', 1, 'The limit of using the current identifier without registration in the system is exceeded.'),
('ERR_2004', 2, 'Praeguse identifikaatori kasutamise piir ilma süsteemis registreerimiseta on ületatud.'),
('ERR_2004', 3, 'Превышен лимит использования текущего идентификатора без регистрации.'),
('ERR_2005', 1, 'E-mail is incorrect.'),
('ERR_2005', 2, 'E-post on vale.'),
('ERR_2005', 3, 'Некорректный e-mail.'),
('ERR_2006', 1, 'Password must be between 8 and 20 characters long.'),
('ERR_2006', 2, 'Parool peab olema 8–20 tähemärki pikk.'),
('ERR_2006', 3, 'Длина пароля должна быть от 8 до 20 символов.'),
('ERR_2007', 1, 'Password must contain at least 1 letter, at least 1 digit.'),
('ERR_2007', 2, 'Parool peab sisaldama vähemalt ühte tähte ja vähemalt ühte numbrit.'),
('ERR_2007', 3, 'Пароль должен содержать хотя бы 1 букву, хотя бы 1 цифру.'),
('ERR_2008', 1, 'First name is incorrect.'),
('ERR_2008', 2, 'Eesnimi on vale.'),
('ERR_2008', 3, 'Некорректное имя.'),
('ERR_2009', 1, 'Nick is incorrect.'),
('ERR_2009', 2, 'Nick on vale.'),
('ERR_2009', 3, 'Некорректный ник.'),
('ERR_2010', 1, 'Last name is incorrect.'),
('ERR_2010', 2, 'Perekonnanimi on vale.'),
('ERR_2010', 3, 'Некорректная фамилия.'),
('ERR_2011', 1, 'Check password.'),
('ERR_2011', 2, 'Kontrollige parooli.'),
('ERR_2011', 3, 'Проверьте пароль.'),
('ERR_2013', 1, 'Confirmation code is empty.'),
('ERR_2013', 2, 'Kinnituskood on tühi.'),
('ERR_2013', 3, 'Пустой код подтверждения.'),
('ERR_2014', 1, 'Confirmation code is incorrect or expired.'),
('ERR_2014', 2, 'Kinnituskood on vale või aegunud.'),
('ERR_2014', 3, 'Некорректный или устаревший код подтверждения.'),
('ERR_2015', 1, 'Entered e-mail exists.'),
('ERR_2015', 2, 'Sisestatud e-post on olemas.'),
('ERR_2015', 3, 'Такой e-mail уже существует.'),
('ERR_2016', 1, 'Entered nick name exists.'),
('ERR_2016', 2, 'Sisestatud hüüdnimi on olemas.'),
('ERR_2016', 3, 'Такой ник уже существует.'),
('ERR_2017', 1, 'You need to confirm your e-mail.'),
('ERR_2017', 2, 'Peate oma e-posti aadressi kinnitama.'),
('ERR_2017', 3, 'Пожалуйста, подтвердите своей e-mail.'),
('ERR_2018', 1, 'Check date for rent.'),
('ERR_2018', 2, 'Check date for rent.'),
('ERR_2018', 3, 'Проверьте дату аренды.'),
('ERR_3000', 1, 'Login or password is incorrect.'),
('ERR_3000', 2, 'Sisselogimine või parool on vale.'),
('ERR_3000', 3, 'Некорректный логин или пароль.'),
('ERR_3001', 1, 'The limit of login attempts is exceeded.'),
('ERR_3001', 2, 'Sisselogimiskatsete piir on ületatud.'),
('ERR_3001', 3, 'Превышено количество попыток войти в систему.'),
('ERR_3002', 1, 'Account is locked.'),
('ERR_3002', 2, 'Konto on lukus.'),
('ERR_3002', 3, 'Профиль заблокирован.'),
('ERR_3003', 1, 'Account is blacklisted.'),
('ERR_3003', 2, 'Konto on musta nimekirja kantud.'),
('ERR_3003', 3, 'Профиль в черном списке.'),
('ERR_3004', 1, 'Customer is self-excluded.'),
('ERR_3004', 2, 'Klient on ise välistatud.'),
('ERR_3004', 3, 'Пользователь самоисключен.'),
('ERR_3006', 1, 'Customer must accept the T&Cs.'),
('ERR_3006', 2, 'Klient peab nõustuma tingimustega.'),
('ERR_3006', 3, 'Пользователь должен принять правила и условия.'),
('ERR_3007', 1, 'The IP address is restricted.'),
('ERR_3007', 2, 'IP-aadress on piiratud.'),
('ERR_3007', 3, 'Этот IP адрес запрещен к использованию.'),
('ERR_3008', 1, 'The IMEI is restricted.'),
('ERR_3008', 2, 'IMEI on piiratud.'),
('ERR_3008', 3, 'Этот IMEI запрещен.'),
('ERR_3009', 1, 'Account does not exist.'),
('ERR_3009', 2, 'Kontot pole olemas.'),
('ERR_3009', 3, 'Такого профиля не существует.'),
('ERR_4000', 1, 'Permissions is denied.'),
('ERR_4000', 2, 'Lubadest keeldutakse.'),
('ERR_4000', 3, 'В доступе отказано.'),
('ERR_4001', 1, 'Request used forbidden method.'),
('ERR_4001', 2, 'Taotlege kasutatud keelatud meetodit.'),
('ERR_4001', 3, 'Запрос исползует запрещенный метод.'),
('ERR_4002', 1, 'Incorrect data for operation.'),
('ERR_4002', 2, 'Valed andmed töötamiseks.'),
('ERR_4002', 3, 'Некорректные данные для операции.'),
('ERR_4003', 1, 'File size is too large.'),
('ERR_4003', 2, 'Faili suurus on liiga suur.'),
('ERR_4003', 3, 'Размер файла слишком большой.'),
('ERR_4004', 1, 'File type or extension is invalid.'),
('ERR_4004', 2, 'Failitüüp või laiend on vale.'),
('ERR_4004', 3, 'Недопустимый тип или недопустимое расширение файла.'),
('ERR_404', 1, 'Error 404'),
('ERR_404', 2, 'Viga 404'),
('ERR_404', 3, 'Ошибка 404'),
('FILE_SIZE_IS_LARGER', 1, 'File size is larger than permissible, {SIZE} maximum'),
('FILE_SIZE_IS_LARGER', 2, 'File size is larger than permissible, {SIZE} maximum'),
('FILE_SIZE_IS_LARGER', 3, 'Размер файла больше допустимого, максимум {SIZE}'),
('HDR_CARS', 1, 'Cars for rent'),
('HDR_CARS', 2, 'Autode rentimine'),
('HDR_CARS', 3, 'Машины в аренду'),
('HDR_FORGOT_EMAIL', 1, 'Recovery password on site'),
('HDR_FORGOT_EMAIL', 2, 'Taastamise parool kohapeal'),
('HDR_FORGOT_EMAIL', 3, 'Восстановление пароля на сайте'),
('HDR_FORGOT_PASSWORD', 1, 'Forgot password'),
('HDR_FORGOT_PASSWORD', 2, 'Unustasid parooli'),
('HDR_FORGOT_PASSWORD', 3, 'Забыли пароль'),
('HDR_PROFILE', 1, 'My profile'),
('HDR_PROFILE', 2, 'Minu profiil'),
('HDR_PROFILE', 3, 'Мой профиль'),
('HDR_PROFILE_DATA', 1, 'My personal data'),
('HDR_PROFILE_DATA', 2, 'Minu isikuandmed'),
('HDR_PROFILE_DATA', 3, 'Мои личные данные'),
('HDR_PROFILE_PASSWORD', 1, 'Change password'),
('HDR_PROFILE_PASSWORD', 2, 'Muuda salasõna'),
('HDR_PROFILE_PASSWORD', 3, 'Изменить пароль'),
('HDR_RECOVERY_PASSWORD', 1, 'Recovery password'),
('HDR_RECOVERY_PASSWORD', 2, 'Taasteparool'),
('HDR_RECOVERY_PASSWORD', 3, 'Восстановление пароля'),
('HDR_SIGNIN', 1, 'Authentication'),
('HDR_SIGNIN', 2, 'Autentimine'),
('HDR_SIGNIN', 3, 'Аутентификация'),
('HDR_SIGNUP', 1, 'Registration'),
('HDR_SIGNUP', 2, 'Registreerimine'),
('HDR_SIGNUP', 3, 'Регистрация'),
('HDR_SIGNUP_COMPLETE', 1, 'Thank you for registration'),
('HDR_SIGNUP_COMPLETE', 2, 'Täname registreerumise eest'),
('HDR_SIGNUP_COMPLETE', 3, 'Спасибо за регистрацию'),
('HDR_SIGNUP_CONFIRM', 1, 'Confirmation was send on your e-mail'),
('HDR_SIGNUP_CONFIRM', 2, 'Teie e-mailile saadeti kinnitus'),
('HDR_SIGNUP_CONFIRM', 3, 'На вашу почту было выслано письмо для подтверждения'),
('HDR_SIGNUP_EMAIL', 1, 'Registration on site'),
('HDR_SIGNUP_EMAIL', 2, 'Registreerimine kohapeal'),
('HDR_SIGNUP_EMAIL', 3, 'Регистрация на сайте'),
('INVALID_FILE_FORMAT', 1, 'Incorrect file format, only allowed '),
('INVALID_FILE_FORMAT', 2, 'Incorrect file format, only allowed '),
('INVALID_FILE_FORMAT', 3, 'Неверный формат файла, допускается только '),
('SIGNUP_EMAIL_SUBJECT', 1, 'Registration on site'),
('STR_ABOUT_US', 1, 'About us'),
('STR_ABOUT_US', 2, 'Meist'),
('STR_ABOUT_US', 3, 'О нас'),
('STR_ACTIONS', 1, 'Actions'),
('STR_ACTIONS', 2, 'Actions'),
('STR_ACTIONS', 3, 'Действия'),
('STR_ALL', 1, 'All'),
('STR_ALL', 2, 'Kõik'),
('STR_ALL', 3, 'Все'),
('STR_ALL_LOCATIONS', 1, 'All locations'),
('STR_ALL_LOCATIONS', 2, 'All locations'),
('STR_ALL_LOCATIONS', 3, 'Все локации'),
('STR_ANY', 1, 'Any'),
('STR_ANY', 2, 'Ükskõik'),
('STR_ANY', 3, 'Любой'),
('STR_BACK_ORDERS', 1, 'Back to orders'),
('STR_BACK_ORDERS', 2, 'Back to orders'),
('STR_BACK_ORDERS', 3, 'Назад к заказам'),
('STR_BASE_PRICE', 1, 'Base price'),
('STR_BASE_PRICE', 2, 'Base price'),
('STR_BASE_PRICE', 3, 'Базовая цена'),
('STR_BASKET', 1, 'Basket'),
('STR_BASKET', 2, 'Korv'),
('STR_BASKET', 3, 'Корзина'),
('STR_CAR', 1, 'Car'),
('STR_CAR', 2, 'Auto'),
('STR_CAR', 3, 'Машина'),
('STR_CARS', 1, 'Cars'),
('STR_CARS', 2, 'Autod'),
('STR_CARS', 3, 'Машины'),
('STR_CATEGORY', 1, 'Category'),
('STR_CATEGORY', 2, 'Kategooria'),
('STR_CATEGORY', 3, 'Категория'),
('STR_CHECKOUT', 1, 'Checkout'),
('STR_CHECKOUT', 2, 'Checkout'),
('STR_CHECKOUT', 3, 'Оформить заказ'),
('STR_COLOR', 1, 'Color'),
('STR_COLOR', 2, 'Värv'),
('STR_COLOR', 3, 'Цвет'),
('STR_CONTACTS', 1, 'Contacts'),
('STR_CONTACTS', 2, 'Kontaktid'),
('STR_CONTACTS', 3, 'Контакты'),
('STR_CONTINUE', 1, 'Continue'),
('STR_CONTINUE', 2, 'Jätka'),
('STR_CONTINUE', 3, 'Продолжить'),
('STR_DATE', 1, 'Date'),
('STR_DATE', 2, 'Kuupäev'),
('STR_DATE', 3, 'Дата'),
('STR_DATE_FROM', 1, 'Date from'),
('STR_DATE_FROM', 2, 'Date from'),
('STR_DATE_FROM', 3, 'Дата от'),
('STR_DATE_TILL', 1, 'Date till'),
('STR_DATE_TILL', 2, 'Date till'),
('STR_DATE_TILL', 3, 'Дата до'),
('STR_DELETE', 1, 'Delete'),
('STR_DELETE', 2, 'Delete'),
('STR_DELETE', 3, 'Удалить'),
('STR_DETAILS', 1, 'Details'),
('STR_DETAILS', 2, 'Details'),
('STR_DETAILS', 3, 'Подробнее'),
('STR_DISCOUNT_DAYS_FEE', 1, 'Discount days fee'),
('STR_DISCOUNT_DAYS_FEE', 2, 'Discount days fee'),
('STR_DISCOUNT_DAYS_FEE', 3, 'Плата за дни скидки'),
('STR_DOWNLOAD_PDF', 1, 'Download pdf'),
('STR_DOWNLOAD_PDF', 2, 'Download pdf'),
('STR_DOWNLOAD_PDF', 3, 'Загрузить pdf'),
('STR_EMAIL', 1, 'E-mail'),
('STR_EMAIL', 2, 'E-post'),
('STR_EMAIL', 3, 'E-mail'),
('STR_FNAME', 1, 'First name'),
('STR_FNAME', 2, 'Eesnimi'),
('STR_FNAME', 3, 'Имя'),
('STR_FORGOT_PASSWORD', 1, 'Forgot password?'),
('STR_FORGOT_PASSWORD', 2, 'Unustasite parooli?'),
('STR_FORGOT_PASSWORD', 3, 'Забыли пароль?'),
('STR_HELP', 1, 'Help'),
('STR_HELP', 2, 'Abi'),
('STR_HELP', 3, 'Помощь'),
('STR_HOLIDAYS_FEE', 1, 'Holidays fee'),
('STR_HOLIDAYS_FEE', 2, 'Holidays fee'),
('STR_HOLIDAYS_FEE', 3, 'Плата за выходные'),
('STR_INVOICE', 1, 'Invoice'),
('STR_INVOICE', 2, 'Invoice'),
('STR_INVOICE', 3, 'Счет'),
('STR_LNAME', 1, 'Last name'),
('STR_LNAME', 2, 'Perekonnanimi'),
('STR_LNAME', 3, 'Фамилия'),
('STR_MODEL', 1, 'Model'),
('STR_MODEL', 2, 'Mudel'),
('STR_MODEL', 3, 'Модель'),
('STR_MY_ORDERS', 1, 'My orders'),
('STR_MY_ORDERS', 2, 'Minu tellimused'),
('STR_MY_ORDERS', 3, 'Мои заказы'),
('STR_MY_PROFILE', 1, 'My profile'),
('STR_MY_PROFILE', 2, 'Minu profiil'),
('STR_MY_PROFILE', 3, 'Мой профиль'),
('STR_NEW_PASSWORD', 1, 'New password'),
('STR_NEW_PASSWORD', 2, 'Uus salasõna'),
('STR_NEW_PASSWORD', 3, 'Новый пароль'),
('STR_ONE_TIME_FEE', 1, 'One time fee'),
('STR_ONE_TIME_FEE', 2, 'One time fee'),
('STR_ONE_TIME_FEE', 3, 'Единовременная плата'),
('STR_ORDER_DATE', 1, 'Order date'),
('STR_ORDER_DATE', 2, 'Order date'),
('STR_ORDER_DATE', 3, 'Дата заказа'),
('STR_PASSWORD', 1, 'Password'),
('STR_PASSWORD', 2, 'Parool'),
('STR_PASSWORD', 3, 'Пароль'),
('STR_PERSONAL_CODE', 1, 'Personal code'),
('STR_PERSONAL_CODE', 2, 'Isikukood'),
('STR_PERSONAL_CODE', 3, 'Личный код'),
('STR_PHONE', 1, 'Phone'),
('STR_PHONE', 2, 'Telefon'),
('STR_PHONE', 3, 'Телефон'),
('STR_PRICE', 1, 'Price'),
('STR_PRICE', 2, 'Hind'),
('STR_PRICE', 3, 'Цена'),
('STR_PRODUCER', 1, 'Manufacturer'),
('STR_PRODUCER', 2, 'Tootja'),
('STR_PRODUCER', 3, 'Производитель'),
('STR_PROFILE', 1, 'Profile'),
('STR_PROFILE', 2, 'Profiil'),
('STR_PROFILE', 3, 'Профиль'),
('STR_RECOVERY_PASSWORD', 1, 'Recovery password'),
('STR_RECOVERY_PASSWORD', 2, 'Recovery password'),
('STR_RECOVERY_PASSWORD', 3, 'Восстановить пароль'),
('STR_RENEW', 1, 'Renew'),
('STR_RENEW', 2, 'Renew'),
('STR_RENEW', 3, 'Продлить'),
('STR_RENEWAL_FEE', 1, 'Renewal fee'),
('STR_RENEWAL_FEE', 2, 'Renewal fee'),
('STR_RENEWAL_FEE', 3, 'Плата за продление'),
('STR_RENEW_ORDER', 1, 'Renew order'),
('STR_RENEW_ORDER', 2, 'Renew order'),
('STR_RENEW_ORDER', 3, 'Продлить заказ'),
('STR_RENT', 1, 'Rent'),
('STR_RENT', 2, 'Rentima'),
('STR_RENT', 3, 'Арендовать'),
('STR_RENT_DATE', 1, 'Rent date'),
('STR_RENT_DATE', 2, 'Rent date'),
('STR_RENT_DATE', 3, 'Дата аренды'),
('STR_RESULTS', 1, 'Results'),
('STR_RESULTS', 2, 'Tulemused'),
('STR_RESULTS', 3, 'Результаты'),
('STR_RETYPE_NEW_PASSWORD', 1, 'Retype password'),
('STR_RETYPE_NEW_PASSWORD', 2, 'Retype password'),
('STR_RETYPE_NEW_PASSWORD', 3, 'Новый пароль еще раз'),
('STR_RETYPE_PASSWORD', 1, 'Retype password'),
('STR_RETYPE_PASSWORD', 2, 'Retype password'),
('STR_RETYPE_PASSWORD', 3, 'Пароль еще раз'),
('STR_SAVE', 1, 'Save'),
('STR_SAVE', 2, 'Save'),
('STR_SAVE', 3, 'Сохранить'),
('STR_SELECT_CATEGORY', 1, 'Select category'),
('STR_SELECT_CATEGORY', 2, 'Valige kategooria'),
('STR_SELECT_CATEGORY', 3, 'Выберите категорию'),
('STR_SELECT_REGION', 1, 'Select region'),
('STR_SELECT_REGION', 2, 'Valige piirkond'),
('STR_SELECT_REGION', 3, 'Выберите регион'),
('STR_SEND', 1, 'Send'),
('STR_SEND', 2, 'Saada'),
('STR_SEND', 3, 'Отправить'),
('STR_SHOW', 1, 'Show'),
('STR_SHOW', 2, 'Show'),
('STR_SHOW', 3, 'Показать'),
('STR_SIGNIN', 1, 'Sign in'),
('STR_SIGNIN', 2, 'Logi sisse'),
('STR_SIGNIN', 3, 'Войти'),
('STR_SIGNOUT', 1, 'Sign out'),
('STR_SIGNOUT', 2, 'Logi välja'),
('STR_SIGNOUT', 3, 'Выйти'),
('STR_SIGNUP', 1, 'Sign up'),
('STR_SIGNUP', 2, 'Registreeri'),
('STR_SIGNUP', 3, 'Зарегистрироваться'),
('STR_SORTBY', 1, 'Sort by'),
('STR_SORTBY', 2, 'Sort by'),
('STR_SORTBY', 3, 'Сортировать'),
('STR_STATUS', 1, 'Status'),
('STR_STATUS', 2, 'Status'),
('STR_STATUS', 3, 'Статус'),
('STR_TERMINATE', 1, 'Terminate'),
('STR_TERMINATE', 2, 'Terminate'),
('STR_TERMINATE', 3, 'Расторгнуть'),
('STR_TERMINATE_ORDER', 1, 'Terminate order'),
('STR_TERMINATE_ORDER', 2, 'Terminate order'),
('STR_TERMINATE_ORDER', 3, 'Прекратить заказ'),
('STR_TERMINATION_FEE', 1, 'Termination fee'),
('STR_TERMINATION_FEE', 2, 'Termination fee'),
('STR_TERMINATION_FEE', 3, 'Плата за расторжение'),
('STR_TERMINATION_PENALTY_FEE', 1, 'Termination penalty fee'),
('STR_TERMINATION_PENALTY_FEE', 2, 'Termination penalty fee'),
('STR_TERMINATION_PENALTY_FEE', 3, 'Штраф за расторжение'),
('STR_TERMINATION_PRICE', 1, 'Price after termination'),
('STR_TERMINATION_PRICE', 2, 'Price after termination'),
('STR_TERMINATION_PRICE', 3, 'Цена после прекращения'),
('STR_TOTAL', 1, 'Total'),
('STR_TOTAL', 2, 'Total'),
('STR_TOTAL', 3, 'Итого'),
('STR_TYPE_CODE', 1, 'Type code'),
('STR_TYPE_CODE', 2, 'Sisestage kood'),
('STR_TYPE_CODE', 3, 'Введите код'),
('STR_WEEKENDS_HOLIDAYS', 1, 'Weekends and holidays'),
('STR_WEEKENDS_HOLIDAYS', 2, 'Weekends and holidays'),
('STR_WEEKENDS_HOLIDAYS', 3, 'Выходные и праздники'),
('STR_YEAR', 1, 'Year'),
('STR_YEAR', 2, 'Aasta'),
('STR_YEAR', 3, 'Год'),
('SUCCESS_9000', 1, 'Data were added.'),
('SUCCESS_9000', 2, 'Andmed lisati.'),
('SUCCESS_9000', 3, 'Данные были добавлены.'),
('SUCCESS_9001', 1, 'Data were changed.'),
('SUCCESS_9001', 2, 'Andmeid muudeti.'),
('SUCCESS_9001', 3, 'Данные были изменены.'),
('SUCCESS_9002', 1, 'Data were removed.'),
('SUCCESS_9002', 2, 'Andmed eemaldati.'),
('SUCCESS_9002', 3, 'Данные были удалены.'),
('SUCCESS_9003', 1, 'Data were selected.'),
('SUCCESS_9003', 2, 'Valiti andmed.'),
('SUCCESS_9003', 3, 'Данные были удалены.'),
('SUCCESS_9004', 1, 'No data selected.'),
('SUCCESS_9004', 2, 'Andmeid pole valitud.'),
('SUCCESS_9004', 3, 'Нет данных для выбора.'),
('TXT_BASKET', 1, 'Here you can see selected rent cars. Also you can change rent period and remove items.'),
('TXT_BASKET', 2, 'Here you can see selected rent cars. Also you can change rent period and remove items.'),
('TXT_BASKET', 3, 'Здесь Вы можете видеть выбранные машины в аренду. Также Вы можете менять период аренды и удалять элементы.'),
('TXT_CARS', 1, 'Here you can select cars for rent by different paramenters.'),
('TXT_CARS', 2, 'Siin saate rentida autosid erinevate parameetrite järgi.'),
('TXT_CARS', 3, 'Здесь Вы можете выбрать автомобили в аренду по различным параметрам.'),
('TXT_FORGOT_EMAIL', 1, 'Hello. You can recovery password by link: {LINK}'),
('TXT_FORGOT_EMAIL', 2, 'Tere. Parooli saate taastada lingi kaudu: {LINK}'),
('TXT_FORGOT_EMAIL', 3, 'Здравствуйте. Вы можете восстановить пароль по ссылке: {LINK}'),
('TXT_FORGOT_PASSWORD', 1, 'Type your e-mail and we will send to you message with link for recovery password.'),
('TXT_FORGOT_PASSWORD', 2, 'Sisestage oma e-mail ja me saadame teile sõnumi taasteparooli lingiga'),
('TXT_FORGOT_PASSWORD', 3, 'Введите свой e-mail, и мы отправим вам сообщение с ссылкой для восстановления пароля.'),
('TXT_FORGOT_RESPONSE', 1, 'We sent link for recovery password to your e-mail.'),
('TXT_FORGOT_RESPONSE', 2, 'Saatsime teie e-posti aadressile parooli taastamise lingi.'),
('TXT_FORGOT_RESPONSE', 3, 'Мы отправили Вам ссылку для восстановления пароля на Ваш e-mail.'),
('TXT_MY_ORDERS', 1, 'Here you can see your orders, also you can download, renew or terminate it.'),
('TXT_MY_ORDERS', 2, 'Here you can see your orders, also you can download, renew or terminate it.'),
('TXT_MY_ORDERS', 3, 'Здесь Вы можете видеть свои заказы, а также загрузить, продлить или расторгнуть их.'),
('TXT_PROFILE', 1, 'Here you can see and change your data.'),
('TXT_PROFILE', 2, 'Siin saate oma andmeid vaadata ja muuta.'),
('TXT_PROFILE', 3, 'Здесь вы можете видеть и менять свои данные.'),
('TXT_RECOVERY_PASSWORD', 1, 'Type your new password and retype it.'),
('TXT_RECOVERY_PASSWORD', 2, 'Sisestage uus parool ja tippige see uuesti.'),
('TXT_RECOVERY_PASSWORD', 3, 'Введите свой новый пароль и повторите его.'),
('TXT_RECOVERY_RESPONSE', 1, 'Your password was changed. Now you can login.'),
('TXT_RECOVERY_RESPONSE', 2, 'Your password was changed. Now you can login.'),
('TXT_RECOVERY_RESPONSE', 3, 'Ваш пароль был изменен. Теперь Вы можете авторизоваться.'),
('TXT_RENEW_ORDER', 1, 'If you want, you can renew this order.'),
('TXT_RENEW_ORDER', 2, 'If you want, you can renew this order.'),
('TXT_RENEW_ORDER', 3, 'Если хотите, можете продлить этот заказ.'),
('TXT_SIGNUP', 1, 'After sending registration You will get letter by e-mail for activation.'),
('TXT_SIGNUP', 2, 'After sending registration You will get letter by e-mail for activation.'),
('TXT_SIGNUP', 3, 'После регистрации на Вашу почту будет выслано письмо для активации аккаунта'),
('TXT_SIGNUP_COMPLETE', 1, 'Now you can sign in and see or change your data in your profile.'),
('TXT_SIGNUP_COMPLETE', 2, 'Nüüd login sisse ja näete või saate oma andmeid oma profiilil muuta.'),
('TXT_SIGNUP_COMPLETE', 3, 'Теперь Вы можете войти и видеть или менять свои данные в Вашем профиле.'),
('TXT_SIGNUP_CONFIRM', 1, 'Type code or click link from letter for confirmation.'),
('TXT_SIGNUP_CONFIRM', 2, 'Sisestage kinnituseks kood või klõpsake kirjas oleval lingil.'),
('TXT_SIGNUP_CONFIRM', 3, 'Укажите код или пройдите по ссылке из полученного письма для подтверждения регистрации.'),
('TXT_SIGNUP_EMAIL', 1, 'You are registered on site {SITE}<br/> Your confirmation code is: {CODE}<br/>Or you can click link: <a href=\'{URL}\'>{URL}</a>'),
('TXT_SIGNUP_EMAIL', 2, 'You are registered on site {SITE}<br/> Your confirmation code is: {CODE}<br/>Or you can click link: <a href=\'{URL}\'>{URL}</a>'),
('TXT_SIGNUP_EMAIL', 3, 'Вы зареристрировались на сайте {SITE}<br/> Ваш код подтверждения: {CODE}<br/>Или пройдите по ссылке: <a href=\'{URL}\'>{URL}</a>'),
('TXT_SIGNUP_TERMS', 1, 'By sending registration you accept our terms and conditions'),
('TXT_SIGNUP_TERMS', 2, 'By sending registration you accept our terms and conditions'),
('TXT_SIGNUP_TERMS', 3, 'Регистрируясь, Вы принимаете наши правила и условия'),
('TXT_SOMETHING_WRONG', 1, 'Something went wrong...'),
('TXT_SOMETHING_WRONG', 2, 'Midagi läks valesti...'),
('TXT_SOMETHING_WRONG', 3, 'Что-то пошло не так...'),
('TXT_TERMINATE_ORDER', 1, 'If you want you can terminate this order.'),
('TXT_TERMINATE_ORDER', 2, 'If you want you can terminate this order.'),
('TXT_TERMINATE_ORDER', 3, 'Если Вы желаете, Вы можете прекратить этот заказ.');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `title` varchar(75) NOT NULL DEFAULT '',
  `pos` int(11) NOT NULL DEFAULT 0,
  `status_id` int(11) NOT NULL DEFAULT 1,
  `latitude` decimal(11,8) NOT NULL DEFAULT 0.00000000,
  `longitude` decimal(11,8) NOT NULL DEFAULT 0.00000000,
  `is_def` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `country_id`, `title`, `pos`, `status_id`, `latitude`, `longitude`, `is_def`) VALUES
(1, 201, 'Tallinn', 10, 1, '59.43700000', '24.75360000', 1),
(2, 301, 'Riga', 20, 1, '56.94960000', '24.10520000', 0),
(3, 101, 'Helsinki', 30, 1, '60.16990000', '24.93840000', 0);

-- --------------------------------------------------------

--
-- Table structure for table `locations_langs`
--

CREATE TABLE `locations_langs` (
  `location_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(75) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `locations_langs`
--

INSERT INTO `locations_langs` (`location_id`, `language_id`, `title`) VALUES
(1, 1, 'Tallinn'),
(1, 2, 'Tallinn'),
(1, 3, 'Таллин'),
(2, 1, 'Riga'),
(2, 2, 'Riia'),
(2, 3, 'Рига'),
(3, 1, 'Helsinki'),
(3, 2, 'Helsingi'),
(3, 3, 'Хельсинки');

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` int(11) NOT NULL,
  `title` varchar(35) NOT NULL,
  `descr` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `title`, `descr`) VALUES
(1, 'Active', 'Normal status.'),
(2, 'Blocked', 'Blocked - not active some period (before some date)'),
(3, 'Invisible', 'Active, but invisible.'),
(4, 'Deleted', 'Removed.');

-- --------------------------------------------------------

--
-- Table structure for table `statuses_langs`
--

CREATE TABLE `statuses_langs` (
  `status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(35) NOT NULL,
  `descr` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `statuses_langs`
--

INSERT INTO `statuses_langs` (`status_id`, `language_id`, `title`, `descr`) VALUES
(1, 1, 'Active', 'Normal status.'),
(1, 2, 'Aktiivne', 'Noormal status.'),
(1, 3, 'Активный', 'Обычный статус.'),
(2, 1, 'Blocked', 'Blocked - not active some period (before some date)'),
(2, 2, 'Blocked', 'Blocked - not active some period (before some date)'),
(2, 3, 'Заблокирован', 'Заблокирован - неактивен какой-то период (до определенной даты)'),
(3, 1, 'Unvisible', 'Active, but unvisible.'),
(3, 2, 'Unvisible', 'Active, but unvisible.'),
(3, 3, 'Невидимый', 'Активный, но невидимый.'),
(4, 1, 'Deleted', 'Removed permanently.'),
(4, 2, 'Deleted', 'Removed permanently.'),
(4, 3, 'Удален', 'Удален навсегда.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `iso` (`iso`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `countries_langs`
--
ALTER TABLE `countries_langs`
  ADD PRIMARY KEY (`country_id`,`language_id`),
  ADD KEY `language_id` (`language_id`);

--
-- Indexes for table `forecasts`
--
ALTER TABLE `forecasts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `location_id` (`location_id`,`date`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `iso` (`iso`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `locales`
--
ALTER TABLE `locales`
  ADD PRIMARY KEY (`id`,`language_id`),
  ADD KEY `language_id` (`language_id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_id` (`country_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `locations_langs`
--
ALTER TABLE `locations_langs`
  ADD PRIMARY KEY (`location_id`,`language_id`),
  ADD KEY `language_id` (`language_id`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statuses_langs`
--
ALTER TABLE `statuses_langs`
  ADD PRIMARY KEY (`status_id`,`language_id`),
  ADD KEY `language_id` (`language_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=302;

--
-- AUTO_INCREMENT for table `forecasts`
--
ALTER TABLE `forecasts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `countries`
--
ALTER TABLE `countries`
  ADD CONSTRAINT `countries_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`);

--
-- Constraints for table `countries_langs`
--
ALTER TABLE `countries_langs`
  ADD CONSTRAINT `countries_langs_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  ADD CONSTRAINT `countries_langs_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Constraints for table `forecasts`
--
ALTER TABLE `forecasts`
  ADD CONSTRAINT `forecasts_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`);

--
-- Constraints for table `languages`
--
ALTER TABLE `languages`
  ADD CONSTRAINT `languages_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`);

--
-- Constraints for table `locales`
--
ALTER TABLE `locales`
  ADD CONSTRAINT `locales_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Constraints for table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  ADD CONSTRAINT `locations_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`);

--
-- Constraints for table `locations_langs`
--
ALTER TABLE `locations_langs`
  ADD CONSTRAINT `locations_langs_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`),
  ADD CONSTRAINT `locations_langs_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Constraints for table `statuses_langs`
--
ALTER TABLE `statuses_langs`
  ADD CONSTRAINT `statuses_langs_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  ADD CONSTRAINT `statuses_langs_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

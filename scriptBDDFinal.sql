-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 13, 2014 at 04:40 PM
-- Server version: 5.5.37-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `gestionstock`
--

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `society` varchar(50) DEFAULT NULL,
  `adress` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `cp` varchar(10) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id`, `name`, `society`, `adress`, `city`, `cp`, `phone`, `email`) VALUES
(1, 'Jea', 'D', '2', 'Z', '5', '5', 'D');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(250) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `seuil_active` tinyint(1) NOT NULL,
  `seuil_value` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=104 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `reference`, `name`, `description`, `quantity`, `price`, `seuil_active`, `seuil_value`) VALUES
(89, 'PS4', 'PS4', 'Console PS4', 10000, 3, 1, 100),
(103, 'sdfsdf', 'Zara', 'Fringue', 1011, 10, 10, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_client`
--

CREATE TABLE IF NOT EXISTS `product_client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_client` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  PRIMARY KEY (`id`,`id_client`,`id_product`),
  KEY `id_product` (`id_product`),
  KEY `id_client` (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `product_supplier`
--

CREATE TABLE IF NOT EXISTS `product_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_product` int(11) NOT NULL,
  `id_supplier` int(11) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`,`id_product`,`id_supplier`),
  KEY `id_product` (`id_product`),
  KEY `id_supplier` (`id_supplier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sale`
--

CREATE TABLE IF NOT EXISTS `sale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idProduct` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `saleDate` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idProduct` (`idProduct`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `sale`
--

INSERT INTO `sale` (`id`, `idProduct`, `quantity`, `saleDate`) VALUES
(1, 89, 1000, '2014-06-02'),
(2, 89, 800, '2014-06-03'),
(3, 89, 750, '2014-06-04'),
(4, 89, 420, '2014-06-05'),
(5, 89, 652, '2014-06-06'),
(6, 89, 502, '2014-06-07'),
(8, 89, 142, '2014-06-10'),
(9, 89, 852, '2014-06-09'),
(10, 89, 658, '2014-06-08'),
(11, 89, 500, '2014-06-11');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE IF NOT EXISTS `supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `society` varchar(50) DEFAULT NULL,
  `adress` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `cp` varchar(10) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `name`, `society`, `adress`, `city`, `cp`, `phone`, `email`) VALUES
(2, '', 'aaaaa', 'aaaaaaaaaaaaaaaaaaa', 'aaaaa', 'aaaaa', 'aaaaaaaaaa', 'aaaaaaaaaaaaaaaaa'),
(9, 'a', 'a', 'a', 'a', 'a', 'a', 'a');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(30) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `email` varchar(80) NOT NULL,
  `motDepasse` varchar(50) NOT NULL,
  `isSupAdmin` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `login`, `lastname`, `firstname`, `email`, `motDepasse`, `isSupAdmin`) VALUES
(1, 'admin', 'chaudhry', 'hussam', 'hussam@hotmail.fr', 'd033e22ae348aeb5660fc2140aec35850c4da997', 1),
(2, 'user', 'user', 'user', 'user', 'user', 0);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product_client`
--
ALTER TABLE `product_client`
  ADD CONSTRAINT `product_client_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `product_client_ibfk_2` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`);

--
-- Constraints for table `product_supplier`
--
ALTER TABLE `product_supplier`
  ADD CONSTRAINT `product_supplier_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `product_supplier_ibfk_2` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id`);

--
-- Constraints for table `sale`
--
ALTER TABLE `sale`
  ADD CONSTRAINT `sale_ibfk_1` FOREIGN KEY (`idProduct`) REFERENCES `product` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

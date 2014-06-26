-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 26, 2014 at 11:47 AM
-- Server version: 5.5.37-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.1

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id`, `name`, `society`, `adress`, `city`, `cp`, `phone`, `email`) VALUES
(1, 'FranÃ§ois', 'Avon Informatique', '1 rue de la butte', 'Avon', '77210', '0160545258', 'contact@avon-informatique.com'),
(2, 'Xavier', 'Tepco', '85 rue du Chateau', 'Fontainebleau', '77300', '0625145269', 'contact@tepco.com');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=106 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `reference`, `name`, `description`, `quantity`, `price`, `seuil_active`, `seuil_value`) VALUES
(89, 'ps125558', 'PS4', 'Console PS4 160Go', 200, 250, 1, 100),
(103, 'srs12', 'Souris', 'Souris sans fil', 200, 10, 1, 150),
(104, 'cvr34785rs', 'clavier', 'Clavier AZERTY sans fil', 100, 10, 0, 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `product_client`
--

INSERT INTO `product_client` (`id`, `id_client`, `id_product`) VALUES
(12, 2, 89);

-- --------------------------------------------------------

--
-- Table structure for table `product_supplier`
--

CREATE TABLE IF NOT EXISTS `product_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_product` int(11) NOT NULL,
  `id_supplier` int(11) NOT NULL,
  PRIMARY KEY (`id`,`id_product`,`id_supplier`),
  KEY `id_product` (`id_product`),
  KEY `id_supplier` (`id_supplier`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `product_supplier`
--

INSERT INTO `product_supplier` (`id`, `id_product`, `id_supplier`) VALUES
(4, 89, 2);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `name`, `society`, `adress`, `city`, `cp`, `phone`, `email`) VALUES
(2, 'Sony', 'Sony', '15 rue de paris', 'Montreuil', '93100', '0123456543', 'contact@sony.com'),
(9, 'LDLC', 'LDLC Computing', '27 rue des Lillas ', 'Paris', '75012', '0160458259', 'ldlc@contact.com');

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
(1, 'admin', 'chaudhry', 'hussam', 'nseris77@gmail.com', 'd033e22ae348aeb5660fc2140aec35850c4da997', 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product_client`
--
ALTER TABLE `product_client`
  ADD CONSTRAINT `product_client_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_client_ibfk_2` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_supplier`
--
ALTER TABLE `product_supplier`
  ADD CONSTRAINT `product_supplier_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_supplier_ibfk_2` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sale`
--
ALTER TABLE `sale`
  ADD CONSTRAINT `sale_ibfk_1` FOREIGN KEY (`idProduct`) REFERENCES `product` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

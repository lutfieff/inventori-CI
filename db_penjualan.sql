-- phpMyAdmin SQL Dump
-- version 3.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 15, 2014 at 10:06 AM
-- Server version: 5.5.25a
-- PHP Version: 5.4.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_penjualan`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_barang`
--

CREATE TABLE IF NOT EXISTS `tbl_barang` (
  `kd_barang` varchar(5) NOT NULL,
  `nm_barang` varchar(20) NOT NULL,
  `stok` int(10) NOT NULL,
  `harga` int(15) NOT NULL,
  PRIMARY KEY (`kd_barang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_barang`
--

INSERT INTO `tbl_barang` (`kd_barang`, `nm_barang`, `stok`, `harga`) VALUES
('B-001', 'Notebook', 9, 4000000),
('B-002', 'Monitor', 12, 600000),
('B-003', 'Printer', 12, 750000);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contact`
--

CREATE TABLE IF NOT EXISTS `tbl_contact` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `nama` varchar(30) DEFAULT NULL,
  `alamat` text,
  `telp` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `website` varchar(50) DEFAULT NULL,
  `owner` varchar(30) DEFAULT NULL,
  `desc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tbl_contact`
--

INSERT INTO `tbl_contact` (`id`, `nama`, `alamat`, `telp`, `email`, `website`, `owner`, `desc`) VALUES
(1, 'PT. Petrokimia Gresik', 'Jl. Jenderal Ahmad Yani - Gresik 61119', '031 3981811', 'pkg@petrokimia-gresik.com', 'http://petrokimia-gresik.com', 'PT. Petrokimia Gresik', 'Divisi Kesehatan & Keselamatan Kerja');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pegawai`
--

CREATE TABLE IF NOT EXISTS `tbl_pegawai` (
  `kd_pegawai` varchar(5) NOT NULL DEFAULT '0',
  `username` varchar(25) DEFAULT NULL,
  `password` varchar(225) DEFAULT NULL,
  `nama` varchar(25) DEFAULT NULL,
  `level` enum('pegawai','admin') DEFAULT 'pegawai',
  PRIMARY KEY (`kd_pegawai`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_pegawai`
--

INSERT INTO `tbl_pegawai` (`kd_pegawai`, `username`, `password`, `nama`, `level`) VALUES
('K-001', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Testing', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pelanggan`
--

CREATE TABLE IF NOT EXISTS `tbl_pelanggan` (
  `kd_pelanggan` varchar(5) NOT NULL,
  `nm_pelanggan` varchar(30) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`kd_pelanggan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_pelanggan`
--

INSERT INTO `tbl_pelanggan` (`kd_pelanggan`, `nm_pelanggan`, `alamat`, `email`) VALUES
('P-001', 'Aji', 'Surabaya', 'aji@gmail.com'),
('P-002', 'Ilham', 'Surabaya', 'ilham@gmail.com'),
('P-003', 'Eky', 'Surabaya', 'eky@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_penjualan_detail`
--

CREATE TABLE IF NOT EXISTS `tbl_penjualan_detail` (
  `kd_penjualan` varchar(5) NOT NULL,
  `kd_barang` varchar(10) NOT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_penjualan_detail`
--

INSERT INTO `tbl_penjualan_detail` (`kd_penjualan`, `kd_barang`, `qty`) VALUES
('O-001', 'B-001', 2),
('O-001', 'B-002', 3),
('O-002', 'B-001', 2),
('O-003', 'B-001', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_penjualan_header`
--

CREATE TABLE IF NOT EXISTS `tbl_penjualan_header` (
  `kd_penjualan` varchar(5) NOT NULL,
  `kd_pelanggan` varchar(10) NOT NULL,
  `total_harga` int(20) NOT NULL,
  `tanggal_penjualan` date NOT NULL,
  `kd_pegawai` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`kd_penjualan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_penjualan_header`
--

INSERT INTO `tbl_penjualan_header` (`kd_penjualan`, `kd_pelanggan`, `total_harga`, `tanggal_penjualan`, `kd_pegawai`) VALUES
('O-001', 'P-002', 9800000, '2014-06-20', 'K-001'),
('O-002', 'P-001', 8000000, '2014-08-12', 'K-001'),
('O-003', '', 4000000, '2014-08-15', 'K-001');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

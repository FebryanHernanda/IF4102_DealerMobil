-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 03, 2019 at 05:55 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sql_mobildansparepart`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Nama` varchar(15) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `Alamat` varchar(25) NOT NULL,
  `No.Hp` int(11) NOT NULL,
  `Id_admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Nama` varchar(15) NOT NULL,
  `Alamat` varchar(25) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `No.Telp` int(11) NOT NULL,
  `NIP` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mengirim_kodeboking`
--

CREATE TABLE `mengirim_kodeboking` (
  `Kode_Boking` int(11) NOT NULL,
  `Email` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

CREATE TABLE `owner` (
  `Nama` varchar(15) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `Alamat` int(25) NOT NULL,
  `No.Hp` int(11) NOT NULL,
  `NIP_O` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `Tgl_Pembayaran` date NOT NULL,
  `Total_Pembayaran` int(11) NOT NULL,
  `Tgl_Pelunasan` date NOT NULL,
  `Kode_Pembayaran` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan`
--

CREATE TABLE `pemesanan` (
  `Nama_Unit` varchar(20) NOT NULL,
  `Tgl_Pemesanan` date NOT NULL,
  `Jumlah_Pemesanan` int(11) NOT NULL,
  `Ket_Pemesanan` varchar(20) NOT NULL,
  `Kode_Pemesanan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `proposal`
--

CREATE TABLE `proposal` (
  `Judul_Proposal` varchar(15) NOT NULL,
  `Jenis_Proposal` varchar(10) NOT NULL,
  `No.Proposal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `verifikasi_pembayaran`
--

CREATE TABLE `verifikasi_pembayaran` (
  `Status` tinyint(1) NOT NULL,
  `Bukti_TF` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Id_admin`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`NIP`);

--
-- Indexes for table `mengirim_kodeboking`
--
ALTER TABLE `mengirim_kodeboking`
  ADD PRIMARY KEY (`Kode_Boking`);

--
-- Indexes for table `owner`
--
ALTER TABLE `owner`
  ADD PRIMARY KEY (`NIP_O`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`Kode_Pembayaran`);

--
-- Indexes for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD PRIMARY KEY (`Kode_Pemesanan`);

--
-- Indexes for table `proposal`
--
ALTER TABLE `proposal`
  ADD PRIMARY KEY (`No.Proposal`);

--
-- Indexes for table `verifikasi_pembayaran`
--
ALTER TABLE `verifikasi_pembayaran`
  ADD PRIMARY KEY (`Bukti_TF`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pemesanan`
--
ALTER TABLE `pemesanan`
  MODIFY `Kode_Pemesanan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `verifikasi_pembayaran`
--
ALTER TABLE `verifikasi_pembayaran`
  MODIFY `Bukti_TF` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`Id_admin`) REFERENCES `verifikasi_pembayaran` (`Bukti_TF`);

--
-- Constraints for table `mengirim_kodeboking`
--
ALTER TABLE `mengirim_kodeboking`
  ADD CONSTRAINT `mengirim_kodeboking_ibfk_1` FOREIGN KEY (`Kode_Boking`) REFERENCES `verifikasi_pembayaran` (`Bukti_TF`);

--
-- Constraints for table `owner`
--
ALTER TABLE `owner`
  ADD CONSTRAINT `owner_ibfk_1` FOREIGN KEY (`NIP_O`) REFERENCES `proposal` (`No.Proposal`);

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`Kode_Pembayaran`) REFERENCES `pemesanan` (`Kode_Pemesanan`);

--
-- Constraints for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD CONSTRAINT `pemesanan_ibfk_1` FOREIGN KEY (`Kode_Pemesanan`) REFERENCES `customer` (`NIP`);

--
-- Constraints for table `proposal`
--
ALTER TABLE `proposal`
  ADD CONSTRAINT `proposal_ibfk_1` FOREIGN KEY (`No.Proposal`) REFERENCES `admin` (`Id_admin`);

--
-- Constraints for table `verifikasi_pembayaran`
--
ALTER TABLE `verifikasi_pembayaran`
  ADD CONSTRAINT `verifikasi_pembayaran_ibfk_1` FOREIGN KEY (`Bukti_TF`) REFERENCES `pembayaran` (`Kode_Pembayaran`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

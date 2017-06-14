-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 04, 2016 at 10:43 AM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;


--
-- Database: `penjualan_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `pj_akses`
--

CREATE TABLE `pj_akses` (
  `id_akses` tinyint(1) UNSIGNED NOT NULL,
  `label` varchar(10) NOT NULL,
  `level_akses` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pj_akses`
--

INSERT INTO `pj_akses` (`id_akses`, `label`, `level_akses`) VALUES
(1, 'admin', 'Administrator'),
(2, 'kasir', 'Staff Kasir'),
(3, 'inventory', 'Staff Inventory'),
(4, 'keuangan', 'Staff Keuangan');

-- --------------------------------------------------------

--
-- Table structure for table `pj_barang`
--

CREATE TABLE `pj_barang` (
  `id_barang` int(1) UNSIGNED NOT NULL,
  `kode_barang` varchar(40) NOT NULL,
  `nama_barang` varchar(60) NOT NULL,
  `total_stok` mediumint(1) UNSIGNED NOT NULL,
  `harga` decimal(10,0) NOT NULL,
  `id_kategori_barang` mediumint(1) UNSIGNED NOT NULL,
  `id_merk_barang` mediumint(1) UNSIGNED DEFAULT NULL,
  `keterangan` text NOT NULL,
  `dihapus` enum('tidak','ya') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pj_barang`
--

INSERT INTO `pj_barang` (`id_barang`, `kode_barang`, `nama_barang`, `total_stok`, `harga`, `id_kategori_barang`, `id_merk_barang`, `keterangan`, `dihapus`) VALUES
(1, '0001', 'Nike Sport C993', 4, '400000', 1, 2, '', 'tidak'),
(2, '0002', 'Runme Everynight Y98', 45, '120000', 3, 6, '', 'tidak'),
(3, '0003', 'My Lovely Bag 877', 30, '350000', 2, 3, '', 'tidak'),
(4, '0004', 'Quick Silver Gaul', 15, '35000', 3, 5, '', 'tidak'),
(5, '0005', 'My Cool Shoes', 39, '550000', 1, 2, '', 'tidak'),
(6, '3453453', 'Testing', 45, '929992', 1, 6, '', 'ya'),
(7, '9982429', 'Tes ada', 67, '600000', 3, 3, '', 'ya'),
(8, '8787829', 'Yes desk', 88, '999999', 1, 3, '', 'ya'),
(9, '0009', 'Test', 18, '100000', 3, 1, '', 'ya'),
(10, '99989', 'Test', 9, '99', 1, 2, '', 'ya'),
(11, '00010', 'Rinso', 17, '30000', 3, NULL, '', 'tidak'),
(12, '00011', 'mouse', 20, '20000', 3, 1, '', 'tidak'),
(13, '00012', 'Soklin Lantai', 20, '3000', 3, 1, '', 'tidak'),
(14, '00013', 'Beras Merah', 15, '2000', 3, 1, '', 'tidak'),
(16, '00018', 'Testing', 20, '3000', 4, 3, '', 'tidak');

-- --------------------------------------------------------

--
-- Table structure for table `pj_ci_sessions`
--

CREATE TABLE `pj_ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pj_kategori_barang`
--

CREATE TABLE `pj_kategori_barang` (
  `id_kategori_barang` mediumint(1) UNSIGNED NOT NULL,
  `kategori` varchar(40) NOT NULL,
  `dihapus` enum('tidak','ya') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pj_kategori_barang`
--

INSERT INTO `pj_kategori_barang` (`id_kategori_barang`, `kategori`, `dihapus`) VALUES
(1, 'Sepatu', 'ya'),
(2, 'Tas', 'tidak'),
(3, 'Baju', 'tidak'),
(4, 'Celana', 'tidak'),
(5, 'Topi', 'ya'),
(6, 'Gelang', 'ya'),
(7, 'Jam', 'ya'),
(8, 'Topi', 'tidak');

-- --------------------------------------------------------

--
-- Table structure for table `pj_merk_barang`
--

CREATE TABLE `pj_merk_barang` (
  `id_merk_barang` mediumint(1) UNSIGNED NOT NULL,
  `merk` varchar(40) NOT NULL,
  `dihapus` enum('tidak','ya') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pj_merk_barang`
--

INSERT INTO `pj_merk_barang` (`id_merk_barang`, `merk`, `dihapus`) VALUES
(1, 'Adidas', 'tidak'),
(2, 'Nike', 'tidak'),
(3, 'BodyPack', 'tidak'),
(4, 'Jansport', 'tidak'),
(5, 'Nevada', 'tidak'),
(6, 'Jackloth', 'tidak'),
(7, 'Pierro', 'ya'),
(8, 'Pierro', 'ya'),
(9, 'Pierro', 'ya'),
(10, 'Converse', 'tidak'),
(11, 'Piero', 'ya'),
(12, 'Teen', 'ya'),
(13, 'adass2', 'ya'),
(14, 'asda', 'ya'),
(15, 'sada3', 'ya'),
(16, 'asda 3', 'ya'),
(17, '333', 'ya');

-- --------------------------------------------------------

--
-- Table structure for table `pj_pelanggan`
--

CREATE TABLE `pj_pelanggan` (
  `id_pelanggan` mediumint(1) UNSIGNED NOT NULL,
  `nama` varchar(40) NOT NULL,
  `alamat` text,
  `telp` varchar(40) DEFAULT NULL,
  `info_tambahan` text,
  `kode_unik` varchar(30) NOT NULL,
  `waktu_input` datetime NOT NULL,
  `dihapus` enum('tidak','ya') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pj_pelanggan`
--

INSERT INTO `pj_pelanggan` (`id_pelanggan`, `nama`, `alamat`, `telp`, `info_tambahan`, `kode_unik`, `waktu_input`, `dihapus`) VALUES
(1, 'Pak Udin', 'Jalan Kayumanis 2 Baru', '08838493439', 'Testtt', '', '2016-05-07 22:44:25', 'ya'),
(2, 'Pak Jarwo', 'Kemanggisan deket binus', '4353535353', NULL, '', '2016-05-07 22:44:49', 'tidak'),
(3, 'Joko', 'Kayumanis', '08773682882', '', '', '2016-05-23 16:31:47', 'tidak'),
(4, 'Budi', 'Salemba', '089930393829', 'Testing', '', '2016-05-23 16:33:00', 'ya'),
(5, 'Mira', 'Pisangan', '09938829232', '', '', '2016-05-23 16:36:45', 'tidak'),
(6, 'Deden', 'Jauh', '990393', 'Test', '', '2016-05-24 20:54:58', 'ya'),
(7, 'Jamil', 'Berlan', '0934934939', '', '14640998941', '2016-05-24 21:24:54', 'tidak'),
(8, 'Budi', 'Jatinegara', '8349393439', '', '14640999321', '2016-05-24 21:25:32', 'tidak'),
(9, 'Kodok', 'Test', '0000', '', '14641003271', '2016-05-24 21:32:07', 'tidak'),
(10, 'Brandon', 'Test', '99030', '', '14641003401', '2016-05-24 21:32:20', 'tidak'),
(11, 'Broke', 'Test', '9900', 'Test', '14641005481', '2016-05-24 21:35:48', 'tidak'),
(12, 'Narji', 'Test', '000', 'Test', '14641006401', '2016-05-24 21:37:20', 'tidak'),
(13, 'Bernard', 'Test', '0000', 'test', '14641006651', '2016-05-24 21:37:45', 'tidak'),
(14, 'Nani', 'Test\r\n\r\nAja', '0000', 'Test\r\n\r\nAja', '14641016551', '2016-05-24 21:54:15', 'ya'),
(15, 'Norman', 'Test', '0039349', '', '14641017311', '2016-05-24 21:55:31', 'tidak'),
(16, 'Melina', 'Jauh', '9900039', 'Test', '14661682871', '2016-06-17 19:58:07', 'tidak'),
(17, 'Malih', 'test', '3434343', '', '14729767201', '2016-09-04 15:12:00', 'tidak'),
(18, 'jaka', 'jaka', '0000', 'jaka', '14729767881', '2016-09-04 15:13:08', 'tidak'),
(19, 'makak', 'kkk', '999', 'kakad', '14729768261', '2016-09-04 15:13:46', 'tidak'),
(20, 'asda', 'asda', '2342', 'asdad', '14729768371', '2016-09-04 15:13:57', 'tidak'),
(21, 'asdadadasdad', 'test', '324', 'asdadad', '14729768481', '2016-09-04 15:14:08', 'tidak');

-- --------------------------------------------------------

--
-- Table structure for table `pj_penjualan_detail`
--

CREATE TABLE `pj_penjualan_detail` (
  `id_penjualan_d` int(1) UNSIGNED NOT NULL,
  `id_penjualan_m` int(1) UNSIGNED NOT NULL,
  `id_barang` int(1) NOT NULL,
  `jumlah_beli` smallint(1) UNSIGNED NOT NULL,
  `harga_satuan` decimal(10,0) NOT NULL,
  `total` decimal(10,0) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pj_penjualan_detail`
--

INSERT INTO `pj_penjualan_detail` (`id_penjualan_d`, `id_penjualan_m`, `id_barang`, `jumlah_beli`, `harga_satuan`, `total`) VALUES
(2, 2, 2, 1, '120000', '120000'),
(3, 2, 4, 1, '35000', '35000'),
(4, 3, 3, 1, '350000', '350000'),
(5, 4, 2, 1, '120000', '120000'),
(6, 4, 11, 2, '30000', '60000'),
(7, 4, 4, 2, '35000', '70000'),
(11, 6, 2, 1, '120000', '120000'),
(10, 6, 1, 1, '400000', '400000'),
(12, 7, 4, 1, '35000', '35000'),
(13, 8, 3, 1, '350000', '350000'),
(14, 9, 1, 1, '400000', '400000'),
(15, 9, 2, 1, '120000', '120000'),
(16, 9, 3, 1, '350000', '350000'),
(17, 9, 4, 1, '35000', '35000'),
(18, 10, 1, 1, '400000', '400000'),
(19, 10, 2, 1, '120000', '120000'),
(20, 10, 3, 1, '350000', '350000'),
(21, 11, 1, 1, '400000', '400000'),
(22, 11, 3, 1, '350000', '350000'),
(23, 12, 3, 2, '350000', '700000'),
(26, 15, 1, 1, '400000', '400000');

-- --------------------------------------------------------

--
-- Table structure for table `pj_penjualan_master`
--

CREATE TABLE `pj_penjualan_master` (
  `id_penjualan_m` int(1) UNSIGNED NOT NULL,
  `nomor_nota` varchar(40) NOT NULL,
  `tanggal` datetime NOT NULL,
  `grand_total` decimal(10,0) NOT NULL,
  `bayar` decimal(10,0) NOT NULL,
  `keterangan_lain` text,
  `id_pelanggan` mediumint(1) UNSIGNED DEFAULT NULL,
  `id_user` mediumint(1) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pj_penjualan_master`
--

INSERT INTO `pj_penjualan_master` (`id_penjualan_m`, `nomor_nota`, `tanggal`, `grand_total`, `bayar`, `keterangan_lain`, `id_pelanggan`, `id_user`) VALUES
(2, '57431A97D5DF8', '2016-05-23 16:58:31', '155000', '160000', '', 3, 1),
(3, '57431BDDAFA9D2', '2016-05-23 17:03:57', '350000', '400000', '', 3, 2),
(4, '57445D46655AB1', '2016-05-24 15:55:18', '250000', '260000', '', NULL, 1),
(6, '576406086CB611', '2016-06-17 16:15:36', '520000', '550000', '', NULL, 1),
(7, '57655546C37441', '2016-06-18 16:05:58', '35000', '40000', '', NULL, 1),
(8, '57655552ABF781', '2016-06-18 16:06:10', '350000', '400000', '', NULL, 1),
(9, '577A31BABCDC51', '2016-07-04 11:51:54', '905000', '910000', '', NULL, 1),
(10, '577A3327991DC1', '2016-07-04 11:57:59', '870000', '880000', 'Dibayar Langsung', NULL, 1),
(11, '577A3793C67CB1', '2016-07-04 12:16:51', '750000', '750000', '', NULL, 1),
(12, '57CA627F897FB1', '2016-09-03 07:41:19', '700000', '800000', '', NULL, 1),
(15, '57CBD697806F61', '2016-09-04 10:08:55', '400000', '500000', '', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pj_user`
--

CREATE TABLE `pj_user` (
  `id_user` mediumint(1) UNSIGNED NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(60) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `id_akses` tinyint(1) UNSIGNED NOT NULL,
  `status` enum('Aktif','Non Aktif') NOT NULL,
  `dihapus` enum('tidak','ya') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pj_user`
--

INSERT INTO `pj_user` (`id_user`, `username`, `password`, `nama`, `id_akses`, `status`, `dihapus`) VALUES
(1, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Bang Admin', 1, 'Aktif', 'tidak'),
(2, 'kasir', '8691e4fc53b99da544ce86e22acba62d13352eff', 'Centini', 2, 'Aktif', 'tidak'),
(3, 'kasir2', '08dfc5f04f9704943a423ea5732b98d3567cbd49', 'Kasir Dua', 2, 'Aktif', 'ya'),
(4, 'jaka', '2ec22095503fe843326e7c19dd2ab98716b63e4d', 'Jaka Sembung', 3, 'Aktif', 'ya'),
(5, 'jaka', '2ec22095503fe843326e7c19dd2ab98716b63e4d', 'Jaka Sembung', 3, 'Aktif', 'tidak'),
(6, 'joko', '97c358728f7f947c9a279ba9be88308395c7cc3a', 'Joko Haji', 4, 'Aktif', 'tidak'),
(7, 'amir', '1dd89e5367785ba89076cd264daac0464fdf0d7b', 'amir', 3, 'Aktif', 'ya');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pj_akses`
--
ALTER TABLE `pj_akses`
  ADD PRIMARY KEY (`id_akses`);

--
-- Indexes for table `pj_barang`
--
ALTER TABLE `pj_barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `pj_ci_sessions`
--
ALTER TABLE `pj_ci_sessions`
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `pj_kategori_barang`
--
ALTER TABLE `pj_kategori_barang`
  ADD PRIMARY KEY (`id_kategori_barang`);

--
-- Indexes for table `pj_merk_barang`
--
ALTER TABLE `pj_merk_barang`
  ADD PRIMARY KEY (`id_merk_barang`);

--
-- Indexes for table `pj_pelanggan`
--
ALTER TABLE `pj_pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `pj_penjualan_detail`
--
ALTER TABLE `pj_penjualan_detail`
  ADD PRIMARY KEY (`id_penjualan_d`);

--
-- Indexes for table `pj_penjualan_master`
--
ALTER TABLE `pj_penjualan_master`
  ADD PRIMARY KEY (`id_penjualan_m`);

--
-- Indexes for table `pj_user`
--
ALTER TABLE `pj_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pj_akses`
--
ALTER TABLE `pj_akses`
  MODIFY `id_akses` tinyint(1) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `pj_barang`
--
ALTER TABLE `pj_barang`
  MODIFY `id_barang` int(1) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `pj_kategori_barang`
--
ALTER TABLE `pj_kategori_barang`
  MODIFY `id_kategori_barang` mediumint(1) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `pj_merk_barang`
--
ALTER TABLE `pj_merk_barang`
  MODIFY `id_merk_barang` mediumint(1) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `pj_pelanggan`
--
ALTER TABLE `pj_pelanggan`
  MODIFY `id_pelanggan` mediumint(1) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `pj_penjualan_detail`
--
ALTER TABLE `pj_penjualan_detail`
  MODIFY `id_penjualan_d` int(1) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `pj_penjualan_master`
--
ALTER TABLE `pj_penjualan_master`
  MODIFY `id_penjualan_m` int(1) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `pj_user`
--
ALTER TABLE `pj_user`
  MODIFY `id_user` mediumint(1) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

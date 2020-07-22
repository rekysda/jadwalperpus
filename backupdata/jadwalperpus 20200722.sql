-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 22, 2020 at 04:27 AM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `jadwalperpus`
--
CREATE DATABASE IF NOT EXISTS `jadwalperpus` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `jadwalperpus`;

-- --------------------------------------------------------

--
-- Table structure for table `actions`
--

DROP TABLE IF EXISTS `actions`;
CREATE TABLE IF NOT EXISTS `actions` (
`id` bigint(20) NOT NULL,
  `modul` varchar(20) NOT NULL DEFAULT '',
  `posisi` int(1) NOT NULL DEFAULT '0',
  `order` int(3) NOT NULL DEFAULT '0',
  `modul_id` int(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `actions`
--

INSERT INTO `actions` (`id`, `modul`, `posisi`, `order`, `modul_id`) VALUES
(35, 'news', 1, 0, 32),
(36, 'news', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
`id` int(11) NOT NULL,
  `menu` varchar(30) NOT NULL DEFAULT '',
  `url` varchar(60) NOT NULL DEFAULT '',
  `mod` int(1) NOT NULL DEFAULT '0',
  `ordering` int(2) NOT NULL,
  `parent` int(2) NOT NULL DEFAULT '0',
  `icon` varchar(200) NOT NULL DEFAULT ''
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=119 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `menu`, `url`, `mod`, `ordering`, `parent`, `icon`) VALUES
(5, 'Master', '#', 0, 2, 0, 'fa fa-archive'),
(8, 'Menus', 'menu', 1, 1, 4, ''),
(14, 'Admin User', 'user', 1, 1, 2, ''),
(114, 'Jam', 'jam', 1, 2, 5, ''),
(2, 'Settings', '#', 0, 1, 0, 'fa fa-plug'),
(101, 'Setting Website', 'settingwebsite', 1, 2, 2, ''),
(115, 'Transaksi', '#', 0, 3, 0, 'fa fa-clock-o'),
(116, 'Jadwal Perpus', 'jadwalperpus', 1, 1, 115, ''),
(105, 'Kelas', 'kelas', 1, 3, 5, ''),
(113, 'Tahun Ajaran', 'tahunajaran', 1, 3, 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `guru_dinilai`
--

DROP TABLE IF EXISTS `guru_dinilai`;
CREATE TABLE IF NOT EXISTS `guru_dinilai` (
`id` int(2) NOT NULL,
  `dinilai` varchar(255) NOT NULL,
  `guru` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `guru_isi`
--

DROP TABLE IF EXISTS `guru_isi`;
CREATE TABLE IF NOT EXISTS `guru_isi` (
`id` int(2) NOT NULL,
  `kelas` varchar(255) NOT NULL,
  `guru` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=451 ;

--
-- Dumping data for table `guru_isi`
--

INSERT INTO `guru_isi` (`id`, `kelas`, `guru`) VALUES
(9, '6', 'widiaswarini'),
(10, '7', 'widiaswarini'),
(12, '8', 'widiaswarini'),
(13, '19', 'widiaswarini'),
(14, '20', 'widiaswarini'),
(15, '21', 'widiaswarini'),
(16, '12', 'widiaswarini'),
(17, '1', 'nurbetus'),
(19, '15', 'widiaswarini'),
(22, '16', 'widiaswarini'),
(23, '2', 'nurbetus'),
(24, '17', 'widiaswarini'),
(25, '18', 'widiaswarini'),
(26, '28', 'widiaswarini'),
(27, '29', 'widiaswarini'),
(28, '3', 'nurbetus'),
(29, '4', 'nurbetus'),
(30, '16', 'panji'),
(31, '5', 'nurbetus'),
(32, '17', 'panji'),
(33, '18', 'panji'),
(34, '9', 'nurbetus'),
(35, '26', 'panji'),
(36, '27', 'panji'),
(37, '28', 'panji'),
(38, '29', 'panji'),
(39, '10', 'nurbetus'),
(40, '6', 'widi'),
(41, '7', 'widi'),
(42, '8', 'widi'),
(43, '19', 'widi'),
(44, '20', 'widi'),
(45, '11', 'nurbetus'),
(46, '24', 'widi'),
(47, '13', 'nurbetus'),
(48, '25', 'widi'),
(49, '14', 'nurbetus'),
(50, '19', 'nurbetus'),
(51, '20', 'nurbetus'),
(52, '1', 'emmi'),
(53, '21', 'nurbetus'),
(54, '2', 'emmi'),
(55, '22', 'nurbetus'),
(56, '19', 'emmi'),
(57, '20', 'emmi'),
(58, '21', 'emmi'),
(59, '25', 'emmi'),
(60, '13', 'resti'),
(61, '14', 'resti'),
(62, '15', 'resti'),
(63, '12', 'resti'),
(64, '23', 'resti'),
(65, '24', 'resti'),
(66, '1', 'ananda'),
(67, '2', 'ananda'),
(68, '3', 'ananda'),
(69, '4', 'ananda'),
(70, '5', 'ananda'),
(71, '9', 'ananda'),
(72, '15', 'ananda'),
(73, '15', 'toto'),
(74, '12', 'toto'),
(75, '16', 'toto'),
(76, '17', 'toto'),
(77, '18', 'toto'),
(78, '26', 'toto'),
(79, '27', 'toto'),
(80, '22', 'toto'),
(81, '23', 'toto'),
(82, '24', 'toto'),
(83, '25', 'toto'),
(84, '6', 'christina'),
(85, '7', 'christina'),
(86, '8', 'christina'),
(87, '26', 'christina'),
(88, '27', 'christina'),
(89, '4', 'christina'),
(90, '9', 'christina'),
(91, '5', 'christina'),
(92, '6', 'eva'),
(93, '7', 'eva'),
(94, '8', 'eva'),
(95, '27', 'eva'),
(96, '28', 'eva'),
(97, '29', 'eva'),
(98, '1', 'markus'),
(99, '2', 'markus'),
(100, '3', 'markus'),
(101, '6', 'catur'),
(102, '7', 'catur'),
(103, '28', 'markus'),
(104, '8', 'catur'),
(105, '29', 'markus'),
(106, '16', 'catur'),
(108, '6', 'markus'),
(109, '7', 'markus'),
(110, '8', 'markus'),
(111, '4', 'albertus'),
(112, '5', 'albertus'),
(113, '9', 'albertus'),
(114, '1', 'albertus'),
(115, '2', 'albertus'),
(116, '17', 'catur'),
(117, '3', 'albertus'),
(118, '16', 'albertus'),
(119, '17', 'albertus'),
(120, '18', 'catur'),
(121, '18', 'albertus'),
(122, '15', 'catur'),
(123, '12', 'catur'),
(124, '16', 'galih'),
(125, '23', 'catur'),
(126, '17', 'galih'),
(127, '26', 'galih'),
(128, '26', 'catur'),
(130, '27', 'catur'),
(131, '28', 'catur'),
(132, '29', 'catur'),
(133, '24', 'catur'),
(134, '18', 'galih'),
(135, '25', 'catur'),
(136, '6', 'galih'),
(137, '7', 'galih'),
(138, '8', 'galih'),
(139, '1', 'sunarni'),
(140, '2', 'sunarni'),
(141, '3', 'sunarni'),
(142, '1', 'sayekti'),
(143, '5', 'sunarni'),
(144, '9', 'sunarni'),
(145, '4', 'sunarni'),
(146, '2', 'sayekti'),
(147, '6', 'sunarni'),
(148, '7', 'sunarni'),
(149, '3', 'sayekti'),
(150, '6', 'sayekti'),
(151, '7', 'sayekti'),
(152, '13', 'sunarni'),
(153, '14', 'sunarni'),
(154, '8', 'sayekti'),
(155, '12', 'sunarni'),
(156, '15', 'sunarni'),
(157, '19', 'sayekti'),
(158, '20', 'sayekti'),
(159, '15', 'octhan'),
(160, '21', 'sayekti'),
(161, '22', 'sayekti'),
(162, '24', 'octhan'),
(163, '23', 'sayekti'),
(164, '22', 'octhan'),
(165, '23', 'octhan'),
(166, '24', 'sayekti'),
(167, '25', 'sayekti'),
(168, '14', 'octhan'),
(169, '26', 'sayekti'),
(170, '27', 'sayekti'),
(171, '28', 'sayekti'),
(172, '5', 'fransiska'),
(173, '29', 'sayekti'),
(174, '9', 'fransiska'),
(175, '10', 'fransiska'),
(176, '11', 'fransiska'),
(177, '3', 'fransiska'),
(178, '4', 'fransiska'),
(179, '13', 'fransiska'),
(180, '12', 'fransiska'),
(181, '10', 'mayangkoro'),
(182, '11', 'mayangkoro'),
(183, '13', 'mayangkoro'),
(184, '14', 'mayangkoro'),
(185, '15', 'mayangkoro'),
(186, '16', 'mayangkoro'),
(187, '17', 'mayangkoro'),
(188, '18', 'mayangkoro'),
(189, '6', 'mayangkoro'),
(190, '7', 'mayangkoro'),
(191, '8', 'mayangkoro'),
(192, '19', 'aryief'),
(193, '20', 'aryief'),
(194, '21', 'aryief'),
(195, '22', 'aryief'),
(196, '23', 'aryief'),
(197, '26', 'aryief'),
(198, '27', 'aryief'),
(199, '28', 'aryief'),
(200, '29', 'aryief'),
(201, '25', 'aryief'),
(202, '1', 'laurentius'),
(203, '24', 'aryief'),
(204, '2', 'laurentius'),
(205, '3', 'laurentius'),
(206, '16', 'aryief'),
(207, '19', 'laurentius'),
(208, '20', 'laurentius'),
(209, '17', 'aryief'),
(210, '21', 'laurentius'),
(211, '18', 'aryief'),
(212, '25', 'laurentius'),
(213, '10', 'aryief'),
(214, '11', 'aryief'),
(215, '13', 'aryief'),
(216, '14', 'aryief'),
(217, '15', 'aryief'),
(218, '12', 'aryief'),
(219, '6', 'bernadus'),
(220, '7', 'bernadus'),
(221, '8', 'bernadus'),
(222, '28', 'bernadus'),
(223, '29', 'bernadus'),
(224, '19', 'machrus'),
(225, '20', 'machrus'),
(226, '21', 'machrus'),
(227, '22', 'machrus'),
(228, '23', 'machrus'),
(229, '24', 'machrus'),
(230, '26', 'machrus'),
(231, '27', 'machrus'),
(232, '28', 'machrus'),
(233, '29', 'machrus'),
(234, '25', 'machrus'),
(235, '22', 'meliana'),
(236, '23', 'meliana'),
(237, '24', 'meliana'),
(238, '10', 'choirul'),
(239, '11', 'choirul'),
(240, '13', 'choirul'),
(241, '14', 'choirul'),
(242, '15', 'choirul'),
(243, '12', 'choirul'),
(247, '4', 'anata'),
(248, '5', 'anata'),
(249, '16', 'choirul'),
(250, '9', 'anata'),
(251, '17', 'choirul'),
(252, '10', 'anata'),
(253, '18', 'choirul'),
(254, '11', 'anata'),
(255, '13', 'anata'),
(256, '14', 'anata'),
(257, '26', 'stephanus'),
(258, '15', 'anata'),
(259, '27', 'stephanus'),
(260, '28', 'stephanus'),
(261, '12', 'anata'),
(262, '29', 'stephanus'),
(263, '12', 'henrika'),
(264, '19', 'henrika'),
(265, '20', 'henrika'),
(266, '9', 'haritono'),
(267, '12', 'haritono'),
(268, '1', 'fani'),
(269, '2', 'fani'),
(270, '3', 'fani'),
(271, '4', 'fani'),
(272, '5', 'fani'),
(273, '19', 'haritono'),
(274, '20', 'haritono'),
(275, '6', 'fani'),
(276, '21', 'haritono'),
(277, '7', 'fani'),
(278, '8', 'fani'),
(279, '22', 'haritono'),
(280, '23', 'haritono'),
(281, '24', 'haritono'),
(282, '6', 'cucuk'),
(283, '25', 'haritono'),
(284, '7', 'cucuk'),
(285, '8', 'cucuk'),
(286, '26', 'haritono'),
(287, '1', 'cucuk'),
(288, '27', 'haritono'),
(289, '2', 'cucuk'),
(290, '28', 'haritono'),
(291, '3', 'cucuk'),
(292, '4', 'cucuk'),
(293, '5', 'cucuk'),
(294, '29', 'haritono'),
(295, '1', 'haritono'),
(296, '2', 'haritono'),
(297, '3', 'haritono'),
(298, '4', 'haritono'),
(299, '5', 'haritono'),
(300, '12', 'andik'),
(301, '6', 'andik'),
(302, '7', 'andik'),
(303, '8', 'andik'),
(304, '19', 'andik'),
(305, '20', 'andik'),
(306, '25', 'andik'),
(307, '10', 'estiningtyas'),
(308, '11', 'estiningtyas'),
(309, '13', 'estiningtyas'),
(310, '14', 'estiningtyas'),
(311, '12', 'estiningtyas'),
(312, '21', 'estiningtyas'),
(313, '22', 'estiningtyas'),
(314, '23', 'estiningtyas'),
(315, '1', 'novita'),
(316, '2', 'novita'),
(317, '3', 'novita'),
(318, '6', 'novita'),
(319, '7', 'novita'),
(320, '8', 'novita'),
(321, '19', 'novita'),
(322, '20', 'novita'),
(323, '21', 'novita'),
(324, '22', 'novita'),
(326, '23', 'novita'),
(327, '26', 'handang'),
(328, '27', 'handang'),
(329, '24', 'novita'),
(330, '28', 'handang'),
(331, '29', 'handang'),
(333, '25', 'novita'),
(334, '16', 'handang'),
(335, '17', 'handang'),
(336, '18', 'handang'),
(337, '1', 'fatubun'),
(338, '2', 'fatubun'),
(339, '3', 'fatubun'),
(340, '4', 'fatubun'),
(341, '5', 'fatubun'),
(342, '9', 'fatubun'),
(343, '10', 'handang'),
(344, '10', 'fatubun'),
(345, '11', 'handang'),
(346, '11', 'fatubun'),
(347, '13', 'handang'),
(348, '13', 'fatubun'),
(349, '14', 'fatubun'),
(350, '14', 'handang'),
(351, '19', 'gatot'),
(352, '20', 'gatot'),
(353, '21', 'gatot'),
(354, '22', 'gatot'),
(355, '26', 'gatot'),
(356, '27', 'gatot'),
(357, '28', 'gatot'),
(358, '29', 'gatot'),
(359, '1', 'tina'),
(360, '2', 'tina'),
(361, '3', 'tina'),
(362, '4', 'tina'),
(363, '10', 'tina'),
(364, '11', 'tina'),
(365, '13', 'tina'),
(366, '14', 'tina'),
(367, '15', 'tina'),
(368, '6', 'angelina'),
(369, '7', 'angelina'),
(370, '8', 'angelina'),
(371, '10', 'angelina'),
(372, '11', 'angelina'),
(373, '13', 'angelina'),
(374, '14', 'angelina'),
(375, '15', 'angelina'),
(376, '1', 'jaka'),
(377, '2', 'jaka'),
(378, '3', 'jaka'),
(379, '4', 'jaka'),
(380, '5', 'jaka'),
(381, '9', 'jaka'),
(382, '10', 'jaka'),
(383, '11', 'jaka'),
(386, '5', 'ervina'),
(387, '9', 'ervina'),
(388, '21', 'ervina'),
(389, '22', 'ervina'),
(390, '23', 'ervina'),
(391, '24', 'ervina'),
(392, '25', 'ervina'),
(393, '8', 'anastasia'),
(394, '16', 'anastasia'),
(395, '17', 'anastasia'),
(396, '18', 'anastasia'),
(397, '10', 'anastasia'),
(398, '11', 'anastasia'),
(403, '4', 'bambang'),
(404, '5', 'bambang'),
(406, '16', 'bambang'),
(407, '17', 'bambang'),
(408, '18', 'bambang'),
(409, '26', 'bambang'),
(410, '27', 'bambang'),
(411, '9', 'bambang'),
(412, '1', 'anastasia'),
(413, '2', 'anastasia'),
(414, '3', 'anastasia'),
(415, '4', 'anastasia'),
(416, '5', 'anastasia'),
(417, '23', 'lilyana'),
(418, '25', 'lilyana'),
(419, '9', 'anastasia'),
(420, '11', 'lilyana'),
(421, '24', 'lilyana'),
(422, '13', 'lilyana'),
(423, '10', 'lilyana'),
(424, '14', 'lilyana'),
(425, '15', 'lilyana'),
(426, '12', 'lilyana'),
(427, '1', 'yudoretno'),
(428, '5', 'yudoretno'),
(430, '21', 'yudoretno'),
(431, '22', 'yudoretno'),
(432, '2', 'yudoretno'),
(433, '4', 'maria'),
(434, '3', 'yudoretno'),
(435, '5', 'maria'),
(436, '4', 'yudoretno'),
(437, '9', 'maria'),
(438, '6', 'maria'),
(439, '7', 'maria'),
(440, '8', 'maria'),
(441, '9', 'yudoretno'),
(442, '10', 'maria'),
(443, '11', 'maria'),
(444, '13', 'maria'),
(445, '14', 'maria'),
(446, '15', 'maria'),
(447, '12', 'maria'),
(448, '16', 'maria'),
(449, '17', 'maria'),
(450, '18', 'maria');

-- --------------------------------------------------------

--
-- Table structure for table `infoguru`
--

DROP TABLE IF EXISTS `infoguru`;
CREATE TABLE IF NOT EXISTS `infoguru` (
`id` int(4) NOT NULL,
  `guru` varchar(255) NOT NULL,
  `statusemail` enum('tampilkan','sembunyikan') NOT NULL,
  `statustelp` enum('tampilkan','sembunyikan') NOT NULL,
  `email` varchar(255) NOT NULL,
  `telp` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `intrusions`
--

DROP TABLE IF EXISTS `intrusions`;
CREATE TABLE IF NOT EXISTS `intrusions` (
`id` int(11) unsigned NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  `page` varchar(255) NOT NULL DEFAULT '',
  `ip` varchar(15) NOT NULL DEFAULT '',
  `impact` int(11) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `intrusions`
--

INSERT INTO `intrusions` (`id`, `name`, `value`, `page`, `ip`, `impact`, `created`) VALUES
(1, 'judul', 'ibrahimovic-hamil-delapan-bulan-3-6-2', '/auracms2.3/article-9-ibrahimovic-hamil-delapan-bulan-3-6-2.html', 'local/unknown', 7, '2010-08-28 04:00:00'),
(2, '_SERVER.DOCUMENT_ROOT', 'http://94.199.51.7/readme.txt?', '/?_SERVER[DOCUMENT_ROOT]=http://94.199.51.7/readme.txt?', '94.199.51.7', 5, '2013-04-17 00:41:17'),
(3, '_ult', 'sec=web&slk=web&pos=3&linkstr=http%3A%2F%2Fppikom.com%2Farticle-cara-mengkrimping-kabel-rj45-dan-urutan-warna-kabel-straight-amp-cross.html', '/article-cara-mengkrimping-kabel-rj45-dan-urutan-warna-kabel-straight-amp-cross.html?_ult=sec%3Dweb%26slk%3Dweb%26pos%3D3%26linkstr%3Dhttp%253A%252F%252Fppikom.com%252Farticle-cara-mengkrimping-kabel-rj45-dan-urutan-warna-kabel-straight-amp-cross.html', '50.57.206.196', 15, '2013-06-20 15:11:19'),
(4, '_SERVER.DOCUMENT_ROOT', 'data://text/plain;base64,U0hFTExfTU9KTk9fUFJPQk9WQVRK?', '/?_SERVER[DOCUMENT_ROOT]=data://text/plain;base64,U0hFTExfTU9KTk9fUFJPQk9WQVRK?', '79.135.239.234', 10, '2013-09-09 06:15:10');

-- --------------------------------------------------------

--
-- Table structure for table `jadwalperpus`
--

DROP TABLE IF EXISTS `jadwalperpus`;
CREATE TABLE IF NOT EXISTS `jadwalperpus` (
`id` int(10) NOT NULL,
  `tgl1` datetime NOT NULL,
  `status` varchar(5) NOT NULL,
  `keterangan` text NOT NULL,
  `guru` varchar(50) NOT NULL,
  `jam` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `jadwalperpus`
--

INSERT INTO `jadwalperpus` (`id`, `tgl1`, `status`, `keterangan`, `guru`, `jam`) VALUES
(3, '2020-07-22 07:00:00', '2', ' ( Jam Ke1) - Frater M. Adriano, BHK, S.Pd - TEST01', '11', '1');

-- --------------------------------------------------------

--
-- Table structure for table `jadwalstatus`
--

DROP TABLE IF EXISTS `jadwalstatus`;
CREATE TABLE IF NOT EXISTS `jadwalstatus` (
`id` int(5) NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `jadwalstatus`
--

INSERT INTO `jadwalstatus` (`id`, `nama`) VALUES
(1, 'Belum Konfirmasi'),
(2, 'Aktif'),
(3, 'Batal');

-- --------------------------------------------------------

--
-- Table structure for table `jam`
--

DROP TABLE IF EXISTS `jam`;
CREATE TABLE IF NOT EXISTS `jam` (
`id` int(5) NOT NULL,
  `kode` varchar(512) NOT NULL,
  `mulai` varchar(50) NOT NULL,
  `selesai` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `jam`
--

INSERT INTO `jam` (`id`, `kode`, `mulai`, `selesai`) VALUES
(1, '1', '07:00', ''),
(2, '2', '08:00', '08:40'),
(4, '3', '09:10', '09:50'),
(5, '4', '09:50', '10:30'),
(6, '5', '10:30', '11:10'),
(7, '6', '11:10', '11:50'),
(8, '7', '12:20', '13:00'),
(9, '8', '13:00', '13:40'),
(10, '9', '13:40', '14:20');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

DROP TABLE IF EXISTS `kelas`;
CREATE TABLE IF NOT EXISTS `kelas` (
`id` int(2) NOT NULL,
  `kelas` varchar(255) NOT NULL,
  `kelaskat` int(5) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id`, `kelas`, `kelaskat`) VALUES
(1, 'X-MIPA1', 1),
(2, 'X-MIPA2', 1),
(3, 'X-MIPA3', 1),
(4, 'X-MIPA4', 1),
(5, 'X-MIPA5', 1),
(6, 'X-IPS1', 2),
(7, 'X-IPS2', 2),
(8, 'X-IPS3', 2),
(9, 'X-SC', 1),
(10, 'XI-MIPA1', 1),
(11, 'XI-MIPA2', 1),
(12, 'XI-SC', 1),
(13, 'XI-MIPA3', 1),
(14, 'XI-MIPA4', 1),
(15, 'XI-MIPA5', 1),
(16, 'XI-IPS1', 2),
(17, 'XI-IPS2', 2),
(18, 'XI-IPS3', 2),
(19, 'XII-MIPA1', 1),
(20, 'XII-MIPA2', 1),
(21, 'XII-MIPA3', 1),
(22, 'XII-MIPA4', 1),
(23, 'XII-MIPA5', 1),
(24, 'XII-MIPA6', 1),
(25, 'XII-SC', 1),
(26, 'XII-IPS1', 2),
(27, 'XII-IPS2', 2),
(28, 'XII-IPS3', 2),
(29, 'XII-IPS4', 2),
(30, 'UMUM', 1);

-- --------------------------------------------------------

--
-- Table structure for table `kelaskat`
--

DROP TABLE IF EXISTS `kelaskat`;
CREATE TABLE IF NOT EXISTS `kelaskat` (
`id` int(2) NOT NULL,
  `kelaskat` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `kelaskat`
--

INSERT INTO `kelaskat` (`id`, `kelaskat`) VALUES
(1, 'IPA'),
(2, 'IPS');

-- --------------------------------------------------------

--
-- Table structure for table `kelas_isi`
--

DROP TABLE IF EXISTS `kelas_isi`;
CREATE TABLE IF NOT EXISTS `kelas_isi` (
`id` int(2) NOT NULL,
  `kelas` varchar(255) NOT NULL,
  `siswa` varchar(255) NOT NULL,
  `absen` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `kursus_setting`
--

DROP TABLE IF EXISTS `kursus_setting`;
CREATE TABLE IF NOT EXISTS `kursus_setting` (
`id` int(4) NOT NULL,
  `guru` varchar(255) NOT NULL,
  `mapel` varchar(255) NOT NULL,
  `tahunajaran` varchar(255) NOT NULL,
  `kelaskat` varchar(512) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `labkom`
--

DROP TABLE IF EXISTS `labkom`;
CREATE TABLE IF NOT EXISTS `labkom` (
`id` int(4) NOT NULL,
  `labkom` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `labkom`
--

INSERT INTO `labkom` (`id`, `labkom`) VALUES
(1, 'PERPUSTAKAAN');

-- --------------------------------------------------------

--
-- Table structure for table `mapel`
--

DROP TABLE IF EXISTS `mapel`;
CREATE TABLE IF NOT EXISTS `mapel` (
`id` int(4) NOT NULL,
  `mapel` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `kode` varchar(20) NOT NULL DEFAULT '0',
  `guru` varchar(100) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=65 ;

--
-- Dumping data for table `mapel`
--

INSERT INTO `mapel` (`id`, `mapel`, `icon`, `kode`, `guru`) VALUES
(2, 'Sejarah', '', 'Sejarah', 'maria'),
(4, 'B.Indonesia', '', 'B.Indonesia', 'panji'),
(5, 'BK', '', 'BK', 'susanta'),
(6, 'BK', '', 'BK', 'aloysiuswasi'),
(7, 'Matematika', '', 'Matematika', 'yudoretno'),
(8, 'Geografi', '', 'Geografi', 'bernadusedy'),
(9, 'Agama', '', 'Agama', 'toto'),
(10, 'B.Inggris', '', 'B.Inggris', 'sunarni'),
(11, 'Pend. Seni', '', 'Pend. Seni', 'haritono'),
(12, 'B. Indonesia', '', 'B. Indonesia', 'widi'),
(13, 'Fisika', '', 'Fisika', 'meliana'),
(14, 'Fisika', '', 'Fisika', 'laurentius'),
(15, 'Matematika', '', 'Matematika', 'andikadi'),
(16, 'Biologi', '', 'Biologi', 'henrika'),
(17, 'Penjas', '', 'Penjas', 'aloysiuscatur'),
(18, 'Ekonomi/PKWU', '', 'Ekonomi/PKWU', 'christinakustindarti'),
(20, 'Biologi', '', 'Biologi', 'christinahandoyo'),
(21, 'Sosiologi', '', 'Sosiologi', 'evarenanthya'),
(22, 'B.Inggris', '', 'B.Inggris', 'lilyana'),
(23, 'B.Indonesia', '', 'B.Indonesia', 'estiningtyasutami'),
(24, 'Kimia', '', 'Kimia', 'flavianaemmi'),
(25, 'Ekonomi/PKWU', '', 'Ekonomi/PKWU', 'markus'),
(26, 'Penjas', '', 'Penjas', 'nurbetus'),
(27, 'Sejarah/PPKN', '', 'Sejarah/PPKN', 'handang'),
(28, 'Ekonomi / PKWU', '', 'Ekonomi / PKWU', 'albertusprihayudi'),
(29, 'Kimia', '', 'Kimia', 'octhan'),
(30, 'BK', '', 'BK', 'yudi'),
(31, 'PPKN', '', 'PPKN', 'sayekti'),
(32, 'Sejarah', '', 'Sejarah', 'novita'),
(33, 'B. Inggris', '', 'B. Inggris', 'anastasialelyana'),
(34, 'B. Inggris', '', 'B. Inggris', 'gatotwibawanto'),
(35, 'Kimia', '', 'Kimia', 'fransiskamartanti'),
(36, 'Biologi', '', 'Biologi', 'tina'),
(37, 'Matematika', '', 'Matematika', 'resti'),
(38, 'Seni Budaya', '', 'Seni Budaya', 'mayangkoro'),
(39, 'Geografi/PPKN', '', 'Geografi/PPKN', 'albertusbambang'),
(40, 'Agama ', '', 'Agama ', 'widiaswarini'),
(41, 'Fisika', '', 'Fisika', 'theresiaanata'),
(42, 'Prakarya/IT', '', 'Prakarya/IT', 'machrus'),
(43, 'BK', '', 'BK', 'choirulanwar'),
(44, 'PKWU', '', 'PKWU', 'choirulanwar'),
(45, 'B. Indonesia', '', 'B. Indonesia', 'mateusananda'),
(46, 'Matematika', '', 'Matematika', 'angelinachristofania'),
(47, 'Sosiologi/Antropologi', '', 'Sosiologi/Antropolog', 'evarenanthya'),
(48, 'Agama', '', 'Agama', 'markusfatubun'),
(49, 'Matematika', '', 'Matematika', 'jaka'),
(50, 'Mandarin', '', 'Mandarin', 'marcelitamilarosa'),
(51, 'Mandarin', '', 'Mandarin', 'marcelitamilarosa'),
(52, 'B. Daerah', '', 'B. Daerah', 'cucuk'),
(54, 'PPKn', '', 'PPKN', 'anawatisusi'),
(55, 'Matematika/Matematika Minat', '', 'Matematika', 'stephanussulistyanto'),
(56, 'Matematika/Matematika Minat', '', 'Matematika', 'stephanussulistyanto'),
(57, 'asd', '', 'asd', 'stephanussulistyanto'),
(58, 'asd', '', 'asd', 'stephanussulistyanto'),
(59, 'asd', '', 'asd', 'stephanussulistyanto'),
(60, 'Matematika/Matematika Minat', '', 'Matematika/Matematik', 'stephanussulistyanto'),
(61, 'Matematika/Matematika Minat', '', 'Matematika/Matematik', 'stephanussulistyanto'),
(62, 'asd', '', 'asd', 'stephanussulistyanto'),
(63, 'asd', '', 'asd', 'stephanussulistyanto'),
(64, 'asd', '', 'asd', 'stephanussulistyantoro');

-- --------------------------------------------------------

--
-- Table structure for table `mapel_icon`
--

DROP TABLE IF EXISTS `mapel_icon`;
CREATE TABLE IF NOT EXISTS `mapel_icon` (
`id` int(5) NOT NULL,
  `icon` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `mapel_icon`
--

INSERT INTO `mapel_icon` (`id`, `icon`) VALUES
(1, 'icon01.jpg'),
(2, 'icon02.jpg'),
(3, 'icon03.jpg'),
(4, 'icon04.jpg'),
(5, 'icon05.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `master`
--

DROP TABLE IF EXISTS `master`;
CREATE TABLE IF NOT EXISTS `master` (
`id_daftar` int(5) NOT NULL,
  `s_nama` varchar(150) NOT NULL,
  `s_jk` int(1) NOT NULL,
  `s_agama` int(1) NOT NULL,
  `s_tmp_lahir` varchar(100) NOT NULL,
  `s_tgl_lahir` date NOT NULL,
  `jrsn_pil1` int(4) NOT NULL,
  `jrsn_pil2` int(4) NOT NULL,
  `tgl_daftar` date NOT NULL,
  `nisn` varchar(15) NOT NULL,
  `noreg` varchar(10) NOT NULL,
  `Alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `materi`
--

DROP TABLE IF EXISTS `materi`;
CREATE TABLE IF NOT EXISTS `materi` (
`id` int(4) NOT NULL,
  `pertemuan` int(3) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `materi` varchar(255) NOT NULL,
  `guru` varchar(255) NOT NULL,
  `idkursus` varchar(512) NOT NULL,
  `konten` text NOT NULL,
  `kelas` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
`id` int(2) NOT NULL,
  `menu` varchar(50) NOT NULL DEFAULT '',
  `url` varchar(127) NOT NULL DEFAULT '',
  `published` int(1) NOT NULL DEFAULT '0',
  `ordering` int(2) NOT NULL DEFAULT '0'
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `menu`, `url`, `published`, `ordering`) VALUES
(1, 'Home', 'index.php', 1, 1),
(2, 'Interaktif', '#', 1, 4),
(22, 'Selebriti', 'category-selebriti.html', 1, 5),
(19, 'Links', 'links.html', 1, 3),
(24, 'TEKNOLOGI', 'category-teknologi.html', 1, 7),
(23, 'Hukum', 'category-hukum.html', 1, 6),
(25, 'SOSIAL', 'category-sosial.html', 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `menu_guru`
--

DROP TABLE IF EXISTS `menu_guru`;
CREATE TABLE IF NOT EXISTS `menu_guru` (
`id` int(6) NOT NULL,
  `menu` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `ordering` int(2) NOT NULL,
  `parent` int(4) NOT NULL DEFAULT '0',
  `icon` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `menu_siswa`
--

DROP TABLE IF EXISTS `menu_siswa`;
CREATE TABLE IF NOT EXISTS `menu_siswa` (
`id` int(6) NOT NULL,
  `menu` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `ordering` int(2) NOT NULL,
  `parent` int(4) NOT NULL DEFAULT '0',
  `icon` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `modul`
--

DROP TABLE IF EXISTS `modul`;
CREATE TABLE IF NOT EXISTS `modul` (
`id` tinyint(11) NOT NULL,
  `modul` varchar(30) NOT NULL DEFAULT '',
  `isi` text NOT NULL,
  `setup` varchar(50) NOT NULL DEFAULT '',
  `posisi` tinyint(2) NOT NULL DEFAULT '0',
  `published` int(1) NOT NULL DEFAULT '0',
  `ordering` int(5) NOT NULL DEFAULT '0',
  `type` enum('block','module') NOT NULL DEFAULT 'module'
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `modul`
--

INSERT INTO `modul` (`id`, `modul`, `isi`, `setup`, `posisi`, `published`, `ordering`, `type`) VALUES
(1, 'Terbaru', 'mod/news/terakhir.php', '', 1, 1, 3, 'module'),
(2, 'Statistik Situs', 'mod/statistik/stat.php', '', 1, 1, 6, 'module'),
(3, 'Polling', 'mod/polling/polling.php', '', 1, 0, 99, 'module'),
(4, 'Kalender', 'mod/calendar/calendar.php', '', 1, 0, 100, 'module'),
(5, 'Pesan Singkat', 'mod/shoutbox/shoutboxview.php', '', 1, 0, 99, 'module'),
(6, 'Random Links', 'mod/random_link/randomlink.php', '', 1, 0, 100, 'module'),
(7, 'Top Download', 'mod/top_download/topdl.php', '', 1, 0, 99, 'module'),
(8, 'Login', 'mod/login/login.php', '', 1, 0, 99, 'module'),
(10, 'ip logs', 'mod/phpids/ids.php', '', 1, 0, 99, 'module'),
(17, 'Social Widget', 'mod/socialwidget/socialwidget.php', '', 1, 0, 99, 'module'),
(18, 'Follow Us', 'mod/socialurl/socialurl.php', '', 1, 0, 99, 'module'),
(22, 'Follow Kami di Twitter', '<script type="text/javascript" charset="utf-8" src="http://widgets.twimg.com/j/2/widget.js"></script>\n\n<script type="text/javascript">\n\nnew TWTR.Widget({\n\n  version: 2,\n\n  type: ''profile'',\n\n  rpp: 4,\n\n  interval: 30000,\n\n  width: 300,\n\n  height: 250,\n\n  theme: {\n\n    shell: {\n\n      background: ''#1E7DC1'',\n\n      color: ''#ffffff''\n\n    },\n\n    tweets: {\n\n      background: ''#ffffff'',\n\n      color: ''#333333'',\n\n      links: ''#eb0707''\n\n    }\n\n  },\n\n  features: {\n\n    scrollbar: true,\n\n    loop: false,\n\n    live: false,\n\n    behavior: ''default''\n\n  }\n\n}).render().setUser(''ppikomkutisari'').start();\n\n</script>', '', 1, 0, 99, 'block'),
(29, 'Apa itu RWD', '<div align="center">\n\n<a href="#"><img src="images/rwd-kecil.jpg"></a>\n\n</div>', '', 1, 1, 5, 'block'),
(32, 'Terpopuler', 'mod/news/terpopuler.php', '', 1, 1, 2, 'module'),
(31, 'Pencarian', 'mod/pencarian/pencarian.php', '', 1, 1, 1, 'module');

-- --------------------------------------------------------

--
-- Table structure for table `multiupload`
--

DROP TABLE IF EXISTS `multiupload`;
CREATE TABLE IF NOT EXISTS `multiupload` (
`id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `size` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `dir` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pengumuman_sekolah`
--

DROP TABLE IF EXISTS `pengumuman_sekolah`;
CREATE TABLE IF NOT EXISTS `pengumuman_sekolah` (
`id` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL DEFAULT '',
  `konten` text NOT NULL,
  `user` varchar(30) NOT NULL DEFAULT '',
  `tgl` date NOT NULL DEFAULT '0000-00-00',
  `hits` int(250) NOT NULL DEFAULT '0',
  `seftitle` varchar(225) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `pertemuan`
--

DROP TABLE IF EXISTS `pertemuan`;
CREATE TABLE IF NOT EXISTS `pertemuan` (
`id` int(4) NOT NULL,
  `pertemuan` varchar(512) NOT NULL,
  `idkursus` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `phpmysqlautobackup`
--

DROP TABLE IF EXISTS `phpmysqlautobackup`;
CREATE TABLE IF NOT EXISTS `phpmysqlautobackup` (
  `id` int(11) NOT NULL,
  `version` varchar(6) DEFAULT NULL,
  `time_last_run` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `phpmysqlautobackup`
--

INSERT INTO `phpmysqlautobackup` (`id`, `version`, `time_last_run`) VALUES
(1, '1.6.3', 1473302014);

-- --------------------------------------------------------

--
-- Table structure for table `phpmysqlautobackup_log`
--

DROP TABLE IF EXISTS `phpmysqlautobackup_log`;
CREATE TABLE IF NOT EXISTS `phpmysqlautobackup_log` (
  `date` int(11) NOT NULL,
  `bytes` int(11) NOT NULL,
  `lines` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `phpmysqlautobackup_log`
--

INSERT INTO `phpmysqlautobackup_log` (`date`, `bytes`, `lines`) VALUES
(1473302015, 584798, 2257);

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
`id` int(11) NOT NULL,
  `image` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

DROP TABLE IF EXISTS `semester`;
CREATE TABLE IF NOT EXISTS `semester` (
`id` int(4) NOT NULL,
  `nama` varchar(20) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `semester`
--

INSERT INTO `semester` (`id`, `nama`) VALUES
(1, 'Semester 1'),
(2, 'Semester 2');

-- --------------------------------------------------------

--
-- Table structure for table `sensor`
--

DROP TABLE IF EXISTS `sensor`;
CREATE TABLE IF NOT EXISTS `sensor` (
`id` bigint(20) NOT NULL,
  `word` varchar(50) NOT NULL DEFAULT ''
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `sensor`
--

INSERT INTO `sensor` (`id`, `word`) VALUES
(1, 'Kontol'),
(2, 'Anjing'),
(3, 'Anjeng'),
(4, 'anjrit'),
(5, 'memek'),
(6, 'tempek'),
(7, 'Bangsat'),
(8, 'fuck'),
(9, 'eSDeCe');

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
CREATE TABLE IF NOT EXISTS `session` (
`id` int(5) NOT NULL,
  `session` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`id`, `session`) VALUES
(1, 'Session 1'),
(2, 'Session 2'),
(3, 'Session 3'),
(4, 'Session 4'),
(5, 'Session 5');

-- --------------------------------------------------------

--
-- Table structure for table `session_isi`
--

DROP TABLE IF EXISTS `session_isi`;
CREATE TABLE IF NOT EXISTS `session_isi` (
`id` int(2) NOT NULL,
  `session` varchar(255) NOT NULL,
  `kelas` int(5) NOT NULL,
  `siswa` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `situs`
--

DROP TABLE IF EXISTS `situs`;
CREATE TABLE IF NOT EXISTS `situs` (
`id` int(2) NOT NULL,
  `email_master` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `judul_situs` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `url_situs` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `slogan` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `description` text COLLATE latin1_general_ci NOT NULL,
  `keywords` text COLLATE latin1_general_ci NOT NULL,
  `maxkonten` int(2) NOT NULL DEFAULT '5',
  `maxadmindata` int(2) NOT NULL DEFAULT '5',
  `maxdata` int(2) NOT NULL DEFAULT '5',
  `maxgalleri` int(2) NOT NULL DEFAULT '4',
  `widgetshare` int(2) NOT NULL DEFAULT '0',
  `theme` varchar(50) COLLATE latin1_general_ci NOT NULL DEFAULT 'penilaiansikap',
  `author` text COLLATE latin1_general_ci NOT NULL,
  `alamatkantor` text COLLATE latin1_general_ci NOT NULL,
  `publishwebsite` int(1) NOT NULL DEFAULT '1',
  `publishnews` int(2) NOT NULL,
  `maxgalleridata` int(11) NOT NULL,
  `widgetkomentar` int(2) NOT NULL DEFAULT '1',
  `widgetpenulis` int(2) NOT NULL DEFAULT '2',
  `semester` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `tahun ajaran` int(50) NOT NULL,
  `tampilan` enum('table','icon') COLLATE latin1_general_ci NOT NULL DEFAULT 'table'
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `situs`
--

INSERT INTO `situs` (`id`, `email_master`, `judul_situs`, `url_situs`, `slogan`, `description`, `keywords`, `maxkonten`, `maxadmindata`, `maxdata`, `maxgalleri`, `widgetshare`, `theme`, `author`, `alamatkantor`, `publishwebsite`, `publishnews`, `maxgalleridata`, `widgetkomentar`, `widgetpenulis`, `semester`, `tahun ajaran`, `tampilan`) VALUES
(1, 'admin@admin.com', 'jadwalperpus', 'http://localhost/jadwalujian/', 'Slogan / Motto Sekolah', 'jadwalperpus', 'surabaya,indonesia', 5, 50, 10, 4, 3, 'elearning', '', '<span>"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."</span>', 1, 1, 12, 1, 2, '', 0, 'icon');

-- --------------------------------------------------------

--
-- Table structure for table `soal`
--

DROP TABLE IF EXISTS `soal`;
CREATE TABLE IF NOT EXISTS `soal` (
`id` int(11) NOT NULL,
  `ujian` int(10) NOT NULL,
  `soal` text NOT NULL,
  `pilihan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tahunajaran`
--

DROP TABLE IF EXISTS `tahunajaran`;
CREATE TABLE IF NOT EXISTS `tahunajaran` (
`id` int(11) NOT NULL,
  `tahunajaran` varchar(50) NOT NULL,
  `keterangan` varchar(256) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `tahunajaran`
--

INSERT INTO `tahunajaran` (`id`, `tahunajaran`, `keterangan`, `status`) VALUES
(16, '2020/2021', '2020/2021', 'disable');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kalender`
--

DROP TABLE IF EXISTS `tbl_kalender`;
CREATE TABLE IF NOT EXISTS `tbl_kalender` (
  `judul` varchar(255) NOT NULL DEFAULT '',
  `isi` text NOT NULL,
  `waktu_mulai` date NOT NULL DEFAULT '0000-00-00',
  `waktu_akhir` date NOT NULL DEFAULT '0000-00-00',
  `background` varchar(10) NOT NULL DEFAULT '#d1d1d1',
  `color` varchar(10) NOT NULL DEFAULT '',
`id` int(12) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE IF NOT EXISTS `tbl_user` (
`id_user` int(10) NOT NULL,
  `username` varchar(100) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `level_user` int(5) NOT NULL,
  `email` varchar(50) NOT NULL,
  `nip` varchar(5) NOT NULL,
  `status` int(5) NOT NULL,
  `w_login` datetime NOT NULL,
  `w_daftar` datetime NOT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tipeujian`
--

DROP TABLE IF EXISTS `tipeujian`;
CREATE TABLE IF NOT EXISTS `tipeujian` (
`id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kode` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `topik`
--

DROP TABLE IF EXISTS `topik`;
CREATE TABLE IF NOT EXISTS `topik` (
`id` tinyint(11) NOT NULL,
  `topik` varchar(60) NOT NULL DEFAULT '',
  `ket` text NOT NULL,
  `parentid` int(2) NOT NULL DEFAULT '0',
  `seftitle` varchar(50) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=48 ;

-- --------------------------------------------------------

--
-- Table structure for table `tugas`
--

DROP TABLE IF EXISTS `tugas`;
CREATE TABLE IF NOT EXISTS `tugas` (
`id` int(5) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `ket` text NOT NULL,
  `tglmulai` date NOT NULL,
  `tglakhir` date NOT NULL,
  `user` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tugaskomentar`
--

DROP TABLE IF EXISTS `tugaskomentar`;
CREATE TABLE IF NOT EXISTS `tugaskomentar` (
`id` int(5) NOT NULL,
  `tgl` date NOT NULL,
  `tugassiswa` int(5) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `kelas` varchar(255) NOT NULL,
  `komentar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tugassiswa`
--

DROP TABLE IF EXISTS `tugassiswa`;
CREATE TABLE IF NOT EXISTS `tugassiswa` (
`id` int(5) NOT NULL,
  `tugas` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `kelas` varchar(255) NOT NULL,
  `file` varchar(512) NOT NULL,
  `ket` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `t_jurusan`
--

DROP TABLE IF EXISTS `t_jurusan`;
CREATE TABLE IF NOT EXISTS `t_jurusan` (
`id_jur` int(5) NOT NULL,
  `jurusan` varchar(30) NOT NULL,
  `jur_ket` varchar(10) NOT NULL,
  `kdjur` varchar(10) NOT NULL,
  `quota` varchar(5) NOT NULL,
  `kelas` varchar(5) NOT NULL,
  `bayar` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ujian`
--

DROP TABLE IF EXISTS `ujian`;
CREATE TABLE IF NOT EXISTS `ujian` (
`id` int(4) NOT NULL,
  `ujian` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `ujian`
--

INSERT INTO `ujian` (`id`, `ujian`) VALUES
(11, 'UH 4 (Remidi)');

-- --------------------------------------------------------

--
-- Table structure for table `ujianguru`
--

DROP TABLE IF EXISTS `ujianguru`;
CREATE TABLE IF NOT EXISTS `ujianguru` (
`id` int(5) NOT NULL,
  `iduser` varchar(50) NOT NULL,
  `idmapel` varchar(50) NOT NULL,
  `tahunajaran` varchar(50) NOT NULL,
  `semester` varchar(50) NOT NULL,
  `tipeujian` varchar(50) NOT NULL,
  `idujian` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ujianhari`
--

DROP TABLE IF EXISTS `ujianhari`;
CREATE TABLE IF NOT EXISTS `ujianhari` (
`id` int(5) NOT NULL,
  `idhari` varchar(5) NOT NULL,
  `tgl` varchar(50) NOT NULL,
  `idmapel` varchar(50) NOT NULL,
  `tahunajaran` varchar(50) NOT NULL,
  `semester` varchar(50) NOT NULL,
  `tipeujian` varchar(50) NOT NULL,
  `idujian` varchar(50) NOT NULL,
  `kelaskat` varchar(50) NOT NULL,
  `cekgenap` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ujianharijam`
--

DROP TABLE IF EXISTS `ujianharijam`;
CREATE TABLE IF NOT EXISTS `ujianharijam` (
`id` int(5) NOT NULL,
  `tahunajaran` varchar(50) NOT NULL,
  `semester` varchar(50) NOT NULL,
  `tipeujian` varchar(50) NOT NULL,
  `nama` varchar(512) NOT NULL,
  `tgl` varchar(50) NOT NULL,
  `hari` varchar(50) NOT NULL,
  `mulai` varchar(50) NOT NULL,
  `selesai` varchar(50) NOT NULL,
  `keterangan` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ujianharijamsusulan`
--

DROP TABLE IF EXISTS `ujianharijamsusulan`;
CREATE TABLE IF NOT EXISTS `ujianharijamsusulan` (
`id` int(5) NOT NULL,
  `tahunajaran` varchar(50) NOT NULL,
  `semester` varchar(50) NOT NULL,
  `tipeujian` varchar(50) NOT NULL,
  `nama` varchar(512) NOT NULL,
  `tgl` varchar(50) NOT NULL,
  `hari` varchar(50) NOT NULL,
  `mulai` varchar(50) NOT NULL,
  `selesai` varchar(50) NOT NULL,
  `keterangan` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ujianharisusulan`
--

DROP TABLE IF EXISTS `ujianharisusulan`;
CREATE TABLE IF NOT EXISTS `ujianharisusulan` (
`id` int(5) NOT NULL,
  `idhari` varchar(5) NOT NULL,
  `tgl` varchar(50) NOT NULL,
  `idmapel` varchar(50) NOT NULL,
  `tahunajaran` varchar(50) NOT NULL,
  `semester` varchar(50) NOT NULL,
  `tipeujian` varchar(50) NOT NULL,
  `idujian` varchar(50) NOT NULL,
  `kelaskat` varchar(50) NOT NULL,
  `cekgenap` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ujiannilai`
--

DROP TABLE IF EXISTS `ujiannilai`;
CREATE TABLE IF NOT EXISTS `ujiannilai` (
`id` int(5) NOT NULL,
  `tgl` date NOT NULL,
  `jam` time NOT NULL,
  `idujian` varchar(50) NOT NULL,
  `tahunajaran` varchar(50) NOT NULL,
  `tipeujian` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  `nilai` varchar(50) NOT NULL,
  `terisi` varchar(50) NOT NULL,
  `jawabanuser` varchar(512) NOT NULL,
  `levelakses` varchar(50) NOT NULL,
  `guru` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ujiansetting`
--

DROP TABLE IF EXISTS `ujiansetting`;
CREATE TABLE IF NOT EXISTS `ujiansetting` (
`id` int(5) NOT NULL,
  `petunjuk` text NOT NULL,
  `waktu` varchar(255) NOT NULL,
  `tahunajaran` varchar(10) NOT NULL,
  `semester` int(5) NOT NULL,
  `tipeujian` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `useraura`
--

DROP TABLE IF EXISTS `useraura`;
CREATE TABLE IF NOT EXISTS `useraura` (
`UserId` int(15) NOT NULL,
  `user` varchar(250) NOT NULL DEFAULT '',
  `password` text NOT NULL,
  `level` enum('Siswa','Guru','Administrator') NOT NULL DEFAULT 'Siswa',
  `tipe` varchar(250) NOT NULL DEFAULT 'aktif',
  `is_online` int(5) NOT NULL DEFAULT '0',
  `last_ping` text NOT NULL,
  `start` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `exp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `nama` varchar(512) NOT NULL,
  `photo` varchar(512) NOT NULL,
  `statusemail` enum('tampilkan','sembunyikan') NOT NULL DEFAULT 'sembunyikan',
  `statustelp` enum('tampilkan','sembunyikan') NOT NULL DEFAULT 'sembunyikan',
  `email` varchar(255) NOT NULL,
  `telp` varchar(255) NOT NULL,
  `password2` varchar(50) NOT NULL,
  `tahunajaran` varchar(50) NOT NULL,
  `kelas` varchar(50) NOT NULL,
  `absen` varchar(50) NOT NULL,
  `urutan` varchar(50) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5854 ;

--
-- Dumping data for table `useraura`
--

INSERT INTO `useraura` (`UserId`, `user`, `password`, `level`, `tipe`, `is_online`, `last_ping`, `start`, `exp`, `nama`, `photo`, `statusemail`, `statustelp`, `email`, `telp`, `password2`, `tahunajaran`, `kelas`, `absen`, `urutan`) VALUES
(1, 'admin', '9a70ecc6352cb8e0655e057dbd29bfcb', 'Administrator', 'aktif', 1, '8/24/2019 11:16', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Administrator', '', 'sembunyikan', 'sembunyikan', '', '', '#fratz2020', '', '', '', ''),
(68, 'superadmin', 'b11d5ece6353d17f85c5ad30e0a02360', 'Administrator', 'aktif', 0, '2020-07-22 09:24:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', 'sembunyikan', 'sembunyikan', '', '', '', '', '', '', ''),
(5791, 'guru1', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'guru1', '', 'sembunyikan', 'sembunyikan', 'guru1@guru1.com', '', 'guru1', '', '', '', '1'),
(5792, '11', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Frater M. Adriano, BHK, S.Pd', '', 'sembunyikan', 'sembunyikan', '', '', '11', '', '', '', ''),
(5793, '12', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Drs.Y.Pandji Dwi Riyanto', '', 'sembunyikan', 'sembunyikan', '', '', '12', '', '', '', ''),
(5794, '13', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Drs. Aloysius Wasi Dwipoyono,M.Si.', '', 'sembunyikan', 'sembunyikan', '', '', '13', '', '', '', ''),
(5795, '14', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Drs. FX.Susanta Lucia', '', 'sembunyikan', 'sembunyikan', '', '', '14', '', '', '', ''),
(5796, '15', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Dra. Rosula Sri PamungkasYudoretno', '', 'sembunyikan', 'sembunyikan', '', '', '15', '', '', '', ''),
(5797, '16', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Drs. B. Edy Gunarso', '', 'sembunyikan', 'sembunyikan', '', '', '16', '', '', '', ''),
(5798, '17', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Drs. A. Toto Widijarto', '', 'sembunyikan', 'sembunyikan', '', '', '17', '', '', '', ''),
(5799, '18', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Dra. C. Sunarni', '', 'sembunyikan', 'sembunyikan', '', '', '18', '', '', '', ''),
(5800, '19', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Antonius Haritono, S.Pd.', '', 'sembunyikan', 'sembunyikan', '', '', '19', '', '', '', ''),
(5801, '20', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'B. Widi Krismantari, S.Pd.', '', 'sembunyikan', 'sembunyikan', '', '', '20', '', '', '', ''),
(5802, '21', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Meliana Pantouw, S.Pd.SH.M.Kn', '', 'sembunyikan', 'sembunyikan', '', '', '21', '', '', '', ''),
(5803, '22', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Laurentius Wahyudiarjo,S.Pd.', '', 'sembunyikan', 'sembunyikan', '', '', '22', '', '', '', ''),
(5804, '23', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Y.B. Andik Adi Cahyono,S.Pd.', '', 'sembunyikan', 'sembunyikan', '', '', '23', '', '', '', ''),
(5805, '24', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Henrika Dwi Hendrastuti, S.Si.', '', 'sembunyikan', 'sembunyikan', '', '', '24', '', '', '', ''),
(5806, '25', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Aloysius Catur Heri Purnama, S.Pd.', '', 'sembunyikan', 'sembunyikan', '', '', '25', '', '', '', ''),
(5807, '26', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Christina Kustindarti, S.Pd., M.M., CFP.', '', 'sembunyikan', 'sembunyikan', '', '', '26', '', '', '', ''),
(5808, '27', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Stephanus Sulistyantoro, M.Pd.', '', 'sembunyikan', 'sembunyikan', '', '', '27', '', '', '', ''),
(5809, '28', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'V.Ervina Pudjiastuti, S.Si.', '', 'sembunyikan', 'sembunyikan', '', '', '28', '', '', '', ''),
(5810, '29', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Eva Renanthya Grimaldi, S.Sos.', '', 'sembunyikan', 'sembunyikan', '', '', '29', '', '', '', ''),
(5811, '30', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Th.Estiningtyas Utami, S.Pd.', '', 'sembunyikan', 'sembunyikan', '', '', '30', '', '', '', ''),
(5812, '31', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Flaviana Emmi Dwi Astuti, ST.', '', 'sembunyikan', 'sembunyikan', '', '', '31', '', '', '', ''),
(5813, '32', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Markus Tri Wibowo, S.Pd.', '', 'sembunyikan', 'sembunyikan', '', '', '32', '', '', '', ''),
(5814, '33', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Nurbetus Dwi Junianto, S.Pd.', '', 'sembunyikan', 'sembunyikan', '', '', '33', '', '', '', ''),
(5815, '34', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Albertus Handang Budi Karya, S.Pd.', '', 'sembunyikan', 'sembunyikan', '', '', '34', '', '', '', ''),
(5816, '35', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Octhan Setyawan, S.Si.', '', 'sembunyikan', 'sembunyikan', '', '', '35', '', '', '', ''),
(5817, '36', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Albertus Prihayudi Purnawijaya, S.Pd.', '', 'sembunyikan', 'sembunyikan', '', '', '36', '', '', '', ''),
(5818, '37', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Antonius Yudi Suko Atmaji, S.Pd.', '', 'sembunyikan', 'sembunyikan', '', '', '37', '', '', '', ''),
(5819, '38', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Sri Sayekti, S.Pd.', '', 'sembunyikan', 'sembunyikan', '', '', '38', '', '', '', ''),
(5820, '39', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Erlina Thomas Novita, S.Pd.', '', 'sembunyikan', 'sembunyikan', '', '', '39', '', '', '', ''),
(5821, '40', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Anastasia Lelyana T, S.Pd.', '', 'sembunyikan', 'sembunyikan', '', '', '40', '', '', '', ''),
(5822, '41', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'A. Gatot Wibawanto, S.Pd.', '', 'sembunyikan', 'sembunyikan', '', '', '41', '', '', '', ''),
(5823, '42', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Resti Citraningtyas, S.Pd', '', 'sembunyikan', 'sembunyikan', '', '', '42', '', '', '', ''),
(5824, '43', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Christina Handoyo, S.Si.', '', 'sembunyikan', 'sembunyikan', '', '', '43', '', '', '', ''),
(5825, '44', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Catur Mayangkoro, S.Pd', '', 'sembunyikan', 'sembunyikan', '', '', '44', '', '', '', ''),
(5826, '45', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Albertus Bambang Arintoko,S.Pd', '', 'sembunyikan', 'sembunyikan', '', '', '45', '', '', '', ''),
(5827, '46', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Theresia Anata, S.Pd', '', 'sembunyikan', 'sembunyikan', '', '', '46', '', '', '', ''),
(5828, '47', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Mateus Ananda Merfi A., S.Pd.', '', 'sembunyikan', 'sembunyikan', '', '', '47', '', '', '', ''),
(5829, '48', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Angelina Christofania Elizabeth, S.Pd.', '', 'sembunyikan', 'sembunyikan', '', '', '48', '', '', '', ''),
(5830, '49', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Markus Fatubun, S.Pd.', '', 'sembunyikan', 'sembunyikan', '', '', '49', '', '', '', ''),
(5831, '50', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Aloysius Jaka Susanta Widjaja, S.Pd.', '', 'sembunyikan', 'sembunyikan', '', '', '50', '', '', '', ''),
(5832, '51', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Anawati Susi Astuti, S.Pd.', '', 'sembunyikan', 'sembunyikan', '', '', '51', '', '', '', ''),
(5833, '52', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Heru Purnomo, M.Pd.', '', 'sembunyikan', 'sembunyikan', '', '', '52', '', '', '', ''),
(5834, '53', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ghalant Reenata, S.Pd.', '', 'sembunyikan', 'sembunyikan', '', '', '53', '', '', '', ''),
(5835, '54', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Cicilia Salaisek, S.Pd.', '', 'sembunyikan', 'sembunyikan', '', '', '54', '', '', '', ''),
(5836, '55', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Antonius Hariyanto', '', 'sembunyikan', 'sembunyikan', '', '', '55', '', '', '', ''),
(5837, '56', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Suwaji', '', 'sembunyikan', 'sembunyikan', '', '', '56', '', '', '', ''),
(5838, '57', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Budi Santoso', '', 'sembunyikan', 'sembunyikan', '', '', '57', '', '', '', ''),
(5839, '58', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Mudjio', '', 'sembunyikan', 'sembunyikan', '', '', '58', '', '', '', ''),
(5840, '59', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Theresia Arifina, SE', '', 'sembunyikan', 'sembunyikan', '', '', '59', '', '', '', ''),
(5841, '60', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Budi Purwanto, S.Kom', '', 'sembunyikan', 'sembunyikan', '', '', '60', '', '', '', ''),
(5842, '61', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Suyono', '', 'sembunyikan', 'sembunyikan', '', '', '61', '', '', '', ''),
(5843, '62', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Khoiri', '', 'sembunyikan', 'sembunyikan', '', '', '62', '', '', '', ''),
(5844, '63', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Agus Setiawan', '', 'sembunyikan', 'sembunyikan', '', '', '63', '', '', '', ''),
(5845, '64', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Martinus Luluk Uspridi', '', 'sembunyikan', 'sembunyikan', '', '', '64', '', '', '', ''),
(5846, '65', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Sunarsih', '', 'sembunyikan', 'sembunyikan', '', '', '65', '', '', '', ''),
(5847, '66', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ignatius Suramin', '', 'sembunyikan', 'sembunyikan', '', '', '66', '', '', '', ''),
(5848, '67', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ricky Yansen', '', 'sembunyikan', 'sembunyikan', '', '', '67', '', '', '', ''),
(5849, '68', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Fr. M. Albinus, BHK', '', 'sembunyikan', 'sembunyikan', '', '', '68', '', '', '', ''),
(5850, '69', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Anita Rachma Apriliani Manginsela,A.Md.', '', 'sembunyikan', 'sembunyikan', '', '', '69', '', '', '', ''),
(5851, '70', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Mikael Florentino Wungbelen', '', 'sembunyikan', 'sembunyikan', '', '', '70', '', '', '', ''),
(5852, '71', '92afb435ceb16630e9827f54330c59c9', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Aurelius Nanang Mustofa', '', 'sembunyikan', 'sembunyikan', '', '', '71', '', '', '', ''),
(5853, 'SMAKatolikFrateran', '32bb90e8976aab5298d5da10fe66f21d', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'SMA Katolik Frateran', '', 'sembunyikan', 'sembunyikan', 'sma@sma.com', '', '72', '', '', '', '72');

-- --------------------------------------------------------

--
-- Table structure for table `usercounter`
--

DROP TABLE IF EXISTS `usercounter`;
CREATE TABLE IF NOT EXISTS `usercounter` (
`id` tinyint(11) NOT NULL,
  `ip` text NOT NULL,
  `counter` int(11) NOT NULL DEFAULT '0',
  `hits` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `usercounter`
--

INSERT INTO `usercounter` (`id`, `ip`, `counter`, `hits`) VALUES
(1, '::1-157.56.92.173-208.115.111.66-180.76.6.233-66.249.64.6-36.73.229.186-', 0, 746);

-- --------------------------------------------------------

--
-- Table structure for table `useronline`
--

DROP TABLE IF EXISTS `useronline`;
CREATE TABLE IF NOT EXISTS `useronline` (
`id` int(11) NOT NULL,
  `ipproxy` varchar(100) DEFAULT NULL,
  `host` varchar(100) DEFAULT NULL,
  `ipanda` varchar(100) DEFAULT NULL,
  `proxyserver` varchar(100) DEFAULT NULL,
  `timevisit` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=96 ;

--
-- Dumping data for table `useronline`
--

INSERT INTO `useronline` (`id`, `ipproxy`, `host`, `ipanda`, `proxyserver`, `timevisit`) VALUES
(95, '127.0.0.1', 'localhost', '127.0.0.1', '', 1321091831);

-- --------------------------------------------------------

--
-- Table structure for table `useronlineday`
--

DROP TABLE IF EXISTS `useronlineday`;
CREATE TABLE IF NOT EXISTS `useronlineday` (
`id` int(11) NOT NULL,
  `ipproxy` varchar(100) DEFAULT NULL,
  `host` varchar(100) DEFAULT NULL,
  `ipanda` varchar(100) DEFAULT NULL,
  `proxyserver` varchar(100) DEFAULT NULL,
  `timevisit` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5597 ;

--
-- Dumping data for table `useronlineday`
--

INSERT INTO `useronlineday` (`id`, `ipproxy`, `host`, `ipanda`, `proxyserver`, `timevisit`) VALUES
(5596, '::1', 'nafisah-PC', '::1', '', 1406996355);

-- --------------------------------------------------------

--
-- Table structure for table `useronlinemonth`
--

DROP TABLE IF EXISTS `useronlinemonth`;
CREATE TABLE IF NOT EXISTS `useronlinemonth` (
`id` int(11) NOT NULL,
  `ipproxy` varchar(100) DEFAULT NULL,
  `host` varchar(100) DEFAULT NULL,
  `ipanda` varchar(100) DEFAULT NULL,
  `proxyserver` varchar(100) DEFAULT NULL,
  `timevisit` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3871 ;

--
-- Dumping data for table `useronlinemonth`
--

INSERT INTO `useronlinemonth` (`id`, `ipproxy`, `host`, `ipanda`, `proxyserver`, `timevisit`) VALUES
(3870, '::1', 'nafisah-PC', '::1', '', 1406996355);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actions`
--
ALTER TABLE `actions`
 ADD PRIMARY KEY (`id`), ADD KEY `modul_id` (`modul_id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guru_dinilai`
--
ALTER TABLE `guru_dinilai`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guru_isi`
--
ALTER TABLE `guru_isi`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `infoguru`
--
ALTER TABLE `infoguru`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `intrusions`
--
ALTER TABLE `intrusions`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jadwalperpus`
--
ALTER TABLE `jadwalperpus`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jadwalstatus`
--
ALTER TABLE `jadwalstatus`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jam`
--
ALTER TABLE `jam`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kelaskat`
--
ALTER TABLE `kelaskat`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kelas_isi`
--
ALTER TABLE `kelas_isi`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kursus_setting`
--
ALTER TABLE `kursus_setting`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `labkom`
--
ALTER TABLE `labkom`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mapel`
--
ALTER TABLE `mapel`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mapel_icon`
--
ALTER TABLE `mapel_icon`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master`
--
ALTER TABLE `master`
 ADD PRIMARY KEY (`id_daftar`);

--
-- Indexes for table `materi`
--
ALTER TABLE `materi`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_guru`
--
ALTER TABLE `menu_guru`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_siswa`
--
ALTER TABLE `menu_siswa`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modul`
--
ALTER TABLE `modul`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `multiupload`
--
ALTER TABLE `multiupload`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengumuman_sekolah`
--
ALTER TABLE `pengumuman_sekolah`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pertemuan`
--
ALTER TABLE `pertemuan`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phpmysqlautobackup`
--
ALTER TABLE `phpmysqlautobackup`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phpmysqlautobackup_log`
--
ALTER TABLE `phpmysqlautobackup_log`
 ADD PRIMARY KEY (`date`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `semester`
--
ALTER TABLE `semester`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sensor`
--
ALTER TABLE `sensor`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `session_isi`
--
ALTER TABLE `session_isi`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `siswa` (`siswa`);

--
-- Indexes for table `situs`
--
ALTER TABLE `situs`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `soal`
--
ALTER TABLE `soal`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tahunajaran`
--
ALTER TABLE `tahunajaran`
 ADD PRIMARY KEY (`id`), ADD KEY `tahunajaran` (`tahunajaran`);

--
-- Indexes for table `tbl_kalender`
--
ALTER TABLE `tbl_kalender`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
 ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `tipeujian`
--
ALTER TABLE `tipeujian`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `topik`
--
ALTER TABLE `topik`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tugas`
--
ALTER TABLE `tugas`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tugaskomentar`
--
ALTER TABLE `tugaskomentar`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tugassiswa`
--
ALTER TABLE `tugassiswa`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_jurusan`
--
ALTER TABLE `t_jurusan`
 ADD PRIMARY KEY (`id_jur`);

--
-- Indexes for table `ujian`
--
ALTER TABLE `ujian`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ujianguru`
--
ALTER TABLE `ujianguru`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ujianhari`
--
ALTER TABLE `ujianhari`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ujianharijam`
--
ALTER TABLE `ujianharijam`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ujianharijamsusulan`
--
ALTER TABLE `ujianharijamsusulan`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ujianharisusulan`
--
ALTER TABLE `ujianharisusulan`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ujiannilai`
--
ALTER TABLE `ujiannilai`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ujiansetting`
--
ALTER TABLE `ujiansetting`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `useraura`
--
ALTER TABLE `useraura`
 ADD PRIMARY KEY (`UserId`), ADD UNIQUE KEY `user` (`user`), ADD UNIQUE KEY `user_2` (`user`);

--
-- Indexes for table `usercounter`
--
ALTER TABLE `usercounter`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `useronline`
--
ALTER TABLE `useronline`
 ADD PRIMARY KEY (`id`), ADD KEY `ipanda` (`ipanda`), ADD KEY `timevisit` (`timevisit`), ADD KEY `ipproxy` (`ipproxy`);

--
-- Indexes for table `useronlineday`
--
ALTER TABLE `useronlineday`
 ADD PRIMARY KEY (`id`), ADD KEY `ipanda` (`ipanda`), ADD KEY `timevisit` (`timevisit`), ADD KEY `ipproxy` (`ipproxy`);

--
-- Indexes for table `useronlinemonth`
--
ALTER TABLE `useronlinemonth`
 ADD PRIMARY KEY (`id`), ADD KEY `ipanda` (`ipanda`), ADD KEY `timevisit` (`timevisit`), ADD KEY `ipproxy` (`ipproxy`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `actions`
--
ALTER TABLE `actions`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=119;
--
-- AUTO_INCREMENT for table `guru_dinilai`
--
ALTER TABLE `guru_dinilai`
MODIFY `id` int(2) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `guru_isi`
--
ALTER TABLE `guru_isi`
MODIFY `id` int(2) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=451;
--
-- AUTO_INCREMENT for table `infoguru`
--
ALTER TABLE `infoguru`
MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `intrusions`
--
ALTER TABLE `intrusions`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `jadwalperpus`
--
ALTER TABLE `jadwalperpus`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `jadwalstatus`
--
ALTER TABLE `jadwalstatus`
MODIFY `id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `jam`
--
ALTER TABLE `jam`
MODIFY `id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
MODIFY `id` int(2) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `kelaskat`
--
ALTER TABLE `kelaskat`
MODIFY `id` int(2) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `kelas_isi`
--
ALTER TABLE `kelas_isi`
MODIFY `id` int(2) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `kursus_setting`
--
ALTER TABLE `kursus_setting`
MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `labkom`
--
ALTER TABLE `labkom`
MODIFY `id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `mapel`
--
ALTER TABLE `mapel`
MODIFY `id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=65;
--
-- AUTO_INCREMENT for table `mapel_icon`
--
ALTER TABLE `mapel_icon`
MODIFY `id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `master`
--
ALTER TABLE `master`
MODIFY `id_daftar` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `materi`
--
ALTER TABLE `materi`
MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
MODIFY `id` int(2) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `menu_guru`
--
ALTER TABLE `menu_guru`
MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `menu_siswa`
--
ALTER TABLE `menu_siswa`
MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `modul`
--
ALTER TABLE `modul`
MODIFY `id` tinyint(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `multiupload`
--
ALTER TABLE `multiupload`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pengumuman_sekolah`
--
ALTER TABLE `pengumuman_sekolah`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `pertemuan`
--
ALTER TABLE `pertemuan`
MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `semester`
--
ALTER TABLE `semester`
MODIFY `id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sensor`
--
ALTER TABLE `sensor`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `session`
--
ALTER TABLE `session`
MODIFY `id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `session_isi`
--
ALTER TABLE `session_isi`
MODIFY `id` int(2) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `situs`
--
ALTER TABLE `situs`
MODIFY `id` int(2) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `soal`
--
ALTER TABLE `soal`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tahunajaran`
--
ALTER TABLE `tahunajaran`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `tbl_kalender`
--
ALTER TABLE `tbl_kalender`
MODIFY `id` int(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
MODIFY `id_user` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tipeujian`
--
ALTER TABLE `tipeujian`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `topik`
--
ALTER TABLE `topik`
MODIFY `id` tinyint(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT for table `tugas`
--
ALTER TABLE `tugas`
MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tugaskomentar`
--
ALTER TABLE `tugaskomentar`
MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tugassiswa`
--
ALTER TABLE `tugassiswa`
MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `t_jurusan`
--
ALTER TABLE `t_jurusan`
MODIFY `id_jur` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ujian`
--
ALTER TABLE `ujian`
MODIFY `id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `ujianguru`
--
ALTER TABLE `ujianguru`
MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ujianhari`
--
ALTER TABLE `ujianhari`
MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ujianharijam`
--
ALTER TABLE `ujianharijam`
MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ujianharijamsusulan`
--
ALTER TABLE `ujianharijamsusulan`
MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ujianharisusulan`
--
ALTER TABLE `ujianharisusulan`
MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ujiannilai`
--
ALTER TABLE `ujiannilai`
MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ujiansetting`
--
ALTER TABLE `ujiansetting`
MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `useraura`
--
ALTER TABLE `useraura`
MODIFY `UserId` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5854;
--
-- AUTO_INCREMENT for table `usercounter`
--
ALTER TABLE `usercounter`
MODIFY `id` tinyint(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `useronline`
--
ALTER TABLE `useronline`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=96;
--
-- AUTO_INCREMENT for table `useronlineday`
--
ALTER TABLE `useronlineday`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5597;
--
-- AUTO_INCREMENT for table `useronlinemonth`
--
ALTER TABLE `useronlinemonth`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3871;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

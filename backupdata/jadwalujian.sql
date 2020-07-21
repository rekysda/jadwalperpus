-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 26, 2019 at 03:58 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `jadwalujian`
--
CREATE DATABASE IF NOT EXISTS `jadwalujian` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `jadwalujian`;

-- --------------------------------------------------------

--
-- Table structure for table `actions`
--

DROP TABLE IF EXISTS `actions`;
CREATE TABLE IF NOT EXISTS `actions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `modul` varchar(20) NOT NULL DEFAULT '',
  `posisi` int(1) NOT NULL DEFAULT '0',
  `order` int(3) NOT NULL DEFAULT '0',
  `modul_id` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `modul_id` (`modul_id`)
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu` varchar(30) NOT NULL DEFAULT '',
  `url` varchar(60) NOT NULL DEFAULT '',
  `mod` int(1) NOT NULL DEFAULT '0',
  `ordering` int(2) NOT NULL,
  `parent` int(2) NOT NULL DEFAULT '0',
  `icon` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
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
(84, 'Mata Pelajaran', 'mapel', 1, 1, 5, ''),
(101, 'Setting Website', 'settingwebsite', 1, 2, 2, ''),
(115, 'Transaksi', '#', 0, 3, 0, 'fa fa-clock-o'),
(116, 'Jadwal Ujian', 'jadwalujian', 1, 1, 115, ''),
(105, 'Kelas', 'kelas', 1, 3, 5, ''),
(113, 'Tahun Ajaran', 'tahunajaran', 1, 3, 2, ''),
(117, 'Ujian', 'ujian', 1, 4, 5, ''),
(118, 'Labkom', 'labkom', 1, 5, 5, '');

-- --------------------------------------------------------

--
-- Table structure for table `guru_dinilai`
--

DROP TABLE IF EXISTS `guru_dinilai`;
CREATE TABLE IF NOT EXISTS `guru_dinilai` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `dinilai` varchar(255) NOT NULL,
  `guru` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `guru_isi`
--

DROP TABLE IF EXISTS `guru_isi`;
CREATE TABLE IF NOT EXISTS `guru_isi` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `kelas` varchar(255) NOT NULL,
  `guru` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
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
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `guru` varchar(255) NOT NULL,
  `statusemail` enum('tampilkan','sembunyikan') NOT NULL,
  `statustelp` enum('tampilkan','sembunyikan') NOT NULL,
  `email` varchar(255) NOT NULL,
  `telp` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `intrusions`
--

DROP TABLE IF EXISTS `intrusions`;
CREATE TABLE IF NOT EXISTS `intrusions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  `page` varchar(255) NOT NULL DEFAULT '',
  `ip` varchar(15) NOT NULL DEFAULT '',
  `impact` int(11) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
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
-- Table structure for table `jadwalstatus`
--

DROP TABLE IF EXISTS `jadwalstatus`;
CREATE TABLE IF NOT EXISTS `jadwalstatus` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
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
-- Table structure for table `jadwalujian`
--

DROP TABLE IF EXISTS `jadwalujian`;
CREATE TABLE IF NOT EXISTS `jadwalujian` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tgl1` datetime NOT NULL,
  `status` varchar(5) NOT NULL,
  `keterangan` text NOT NULL,
  `guru` varchar(50) NOT NULL,
  `mapel` varchar(50) NOT NULL,
  `kelas` varchar(50) NOT NULL,
  `jam` varchar(50) NOT NULL,
  `ujian` varchar(50) NOT NULL,
  `labkom` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=136 ;

--
-- Dumping data for table `jadwalujian`
--

INSERT INTO `jadwalujian` (`id`, `tgl1`, `status`, `keterangan`, `guru`, `mapel`, `kelas`, `jam`, `ujian`, `labkom`) VALUES
(47, '2018-08-28 05:00:00', '2', 'XMIPA5 - Biologi UH 1 (5-5) - Veronica Ervina Pudjiastuti , S.Si.  - LABKOM 1 (Lantai 1)', 'ervina', '20', '5', '6', '2', '1'),
(48, '2018-08-29 08:00:00', '2', 'XIISC - Biologi UH 1 (8-8) - Veronica Ervina Pudjiastuti , S.Si.  - LABKOM 1 (Lantai 1)', 'ervina', '20', '25', '9', '2', '1'),
(49, '2018-08-29 07:45:00', '2', 'XIMIPA5 - Biologi UH 1 (07:45:00-08:20:00) - Christina Handoyo, S.Si - LABKOM 1 (Lantai 1)', 'tina', '36', '15', '2', '2', '1'),
(50, '2018-08-29 07:00:00', '2', 'XIMIPA3 - Biologi UH 1 (7-7) - Christina Handoyo, S.Si - LABKOM 1 (Lantai 1)', 'tina', '36', '13', '8', '2', '1'),
(51, '2018-08-30 11:10:00', '2', 'XIMIPA4 - Biologi UH 1 (11:10-11:50) - Veronica Ervina Pudjiastuti , S.Si.  - LABKOM 1 (Lantai 1)', 'ervina', '20', '14', '7', '2', '1'),
(52, '2018-08-31 07:10:00', '2', 'XII-SC - Biologi UH 1 (07:10- 07:55) - Christina Handoyo, S.Si - LABKOM 1 (Lantai 1)', 'tina', '36', '25', '1', '2', '1'),
(53, '2018-09-04 07:10:00', '2', 'XII-IPA1 - Fisika UH 1 (07:10- 07:55) - Theresia Anata, S. Pd. - LABKOM 1 (Lantai 1)', 'anata', '41', '19', '1', '2', '1'),
(54, '2018-09-04 09:50:00', '2', 'XII-IPA2 - Fisika UH 1 (09:50-10:30) - Theresia Anata, S. Pd. - LABKOM 1 (Lantai 1)', 'anata', '41', '20', '5', '2', '1'),
(55, '2018-09-05 09:10:00', '2', 'XII-SC - Fisika UH 1 (09:10-09:50) - Theresia Anata, S. Pd. - LABKOM 1 (Lantai 1)', 'anata', '41', '25', '4', '2', '1'),
(56, '2018-09-06 07:10:00', '3', 'XI-MIPA5 - Biologi UH 1 (Remidi) (07:10- 07:55) - Veronica Ervina Pudjiastuti , S.Si.  - LABKOM 1 (Lantai 1)', 'ervina', '20', '15', '1', '5', '1'),
(58, '2018-09-10 07:10:00', '2', 'XII-MIPA2 - Fisika UH 1 (07:10- 07:55) - Theresia Anata, S. Pd. - LABKOM 1 (Lantai 1)', 'anata', '41', '20', '1', '2', '1'),
(59, '2018-09-13 07:10:00', '2', 'XII-MIPA1 - Kimia UH 1 (Remidi) (07:10- 07:55) - Flaviana Emmi Dwi Astuti, S.T.  - LABKOM 1 (Lantai 1)', 'emmi', '24', '19', '1', '5', '1'),
(61, '2018-09-13 13:00:00', '2', 'XII-MIPA2 - Kimia UH 1 (Remidi) (13:00-13:40) - Flaviana Emmi Dwi Astuti, S.T.  - LABKOM 1 (Lantai 1)', 'emmi', '24', '20', '9', '5', '1'),
(62, '2018-09-13 10:30:00', '2', 'XII-MIPA3 - Kimia UH 1 (Remidi) (10:30-11:10) - Flaviana Emmi Dwi Astuti, S.T.  - LABKOM 1 (Lantai 1)', 'emmi', '24', '21', '6', '5', '1'),
(63, '2018-09-18 09:50:00', '2', 'XII-MIPA4 - Fisika UH 1 (09:50-10:30) - M.V. Meliana Pantouw , S.Pd., S.H., M.Kn. - LABKOM 1 (Lantai 1)', 'meliana', '13', '22', '5', '2', '1'),
(65, '2018-09-19 10:30:00', '2', 'XII-MIPA5 - Fisika UH 1 (Remidi) (10:30-11:10) - M.V. Meliana Pantouw , S.Pd., S.H., M.Kn. - LABKOM 1 (Lantai 1)', 'meliana', '13', '23', '6', '5', '1'),
(66, '2018-09-19 11:10:00', '2', 'XII-MIPA3 - Fisika UH 1 (Remidi) (11:10-11:50) - M.V. Meliana Pantouw , S.Pd., S.H., M.Kn. - LABKOM 1 (Lantai 1)', 'meliana', '13', '21', '7', '5', '1'),
(67, '2018-10-16 07:10:00', '2', 'XII-MIPA1 - Fisika UH 1 (07:10- 07:55) - Theresia Anata, S. Pd. - LABKOM 1 (Lantai 1)', 'anata', '41', '19', '1', '2', '1'),
(69, '2018-10-16 09:50:00', '2', 'XII-MIPA2 - Fisika UH 1 (09:50-10:30) - Theresia Anata, S. Pd. - LABKOM 1 (Lantai 1)', 'anata', '41', '20', '5', '2', '1'),
(70, '2018-10-17 07:10:00', '2', 'XI-MIPA5 - Fisika UH 2 (07:10- 07:55) - Theresia Anata, S. Pd. - LABKOM 1 (Lantai 1)', 'anata', '41', '15', '1', '3', '1'),
(71, '2018-10-17 09:10:00', '2', 'XII-SC - Fisika UH 1 (09:10-09:50) - Theresia Anata, S. Pd. - LABKOM 1 (Lantai 1)', 'anata', '41', '25', '4', '2', '1'),
(72, '2018-10-17 07:10:00', '2', 'XI-MIPA3 - Fisika UH 2 (10:30-11:10) - Theresia Anata, S. Pd. - LABKOM 1 (Lantai 1)', 'anata', '41', '13', '6', '3', '1'),
(73, '2018-10-17 13:00:00', '2', 'XI-MIPA4 - Fisika UH 2 (13:00-13:40) - Theresia Anata, S. Pd. - LABKOM 1 (Lantai 1)', 'anata', '41', '14', '9', '3', '1'),
(74, '2018-10-23 07:10:00', '2', 'XII-MIPA1 - Fisika UH 3 (07:10- 07:55) - Theresia Anata, S. Pd. - LABKOM 1 (Lantai 1)', 'anata', '41', '19', '1', '4', '1'),
(75, '2018-10-23 09:50:00', '2', 'XII-MIPA2 - Fisika UH 3 (09:50-10:30) - Theresia Anata, S. Pd. - LABKOM 1 (Lantai 1)', 'anata', '41', '20', '5', '4', '1'),
(76, '2018-10-24 09:10:00', '2', 'XII-SC - Fisika UH 3 (09:10-09:50) - Theresia Anata, S. Pd. - LABKOM 1 (Lantai 1)', 'anata', '41', '25', '4', '4', '1'),
(80, '2018-11-06 13:00:00', '2', 'XI-MIPA4 - Fisika UH4 (13:00-13:40) - Theresia Anata, S. Pd. - LABKOM 1 (Lantai 1)', 'anata', '41', '14', '9', '10', '1'),
(81, '2018-11-06 09:50:00', '2', 'XII-MIPA2 - Fisika UH4 (09:50-10:30) - Theresia Anata, S. Pd. - LABKOM 1 (Lantai 1)', 'anata', '41', '20', '5', '10', '1'),
(82, '2018-11-07 07:10:00', '2', 'XI-MIPA5 - Fisika UH4 (07:10- 07:55) - Theresia Anata, S. Pd. - LABKOM 1 (Lantai 1)', 'anata', '41', '15', '1', '10', '1'),
(83, '2018-11-07 10:30:00', '2', 'XI-MIPA3 - Fisika UH4 (10:30-11:10) - Theresia Anata, S. Pd. - LABKOM 1 (Lantai 1)', 'anata', '41', '13', '6', '10', '1'),
(84, '2018-11-08 13:00:00', '2', 'XII-SC - Fisika UH4 (13:00-13:40) - Theresia Anata, S. Pd. - LABKOM 1 (Lantai 1)', 'anata', '41', '25', '9', '10', '1'),
(85, '2018-11-09 07:10:00', '2', 'XII-MIPA1 - Fisika UH4 (07:10- 07:55) - Theresia Anata, S. Pd. - LABKOM 1 (Lantai 1)', 'anata', '41', '19', '1', '10', '1'),
(86, '2018-11-12 11:10:00', '2', 'XII-MIPA4 - Biologi UH 1 (11:10-11:50) - Henrika Dwi Hendrastuti, S.Si. - LABKOM 1 (Lantai 1)', 'henrika', '16', '22', '7', '2', '1'),
(87, '2018-11-12 13:00:00', '2', 'XII-MIPA3 - Biologi UH 1 (13:00-13:40) - Henrika Dwi Hendrastuti, S.Si. - LABKOM 1 (Lantai 1)', 'henrika', '16', '21', '9', '2', '1'),
(88, '2018-11-13 09:10:00', '2', 'XII-MIPA5 - Biologi UH 1 (09:10-09:50) - Henrika Dwi Hendrastuti, S.Si. - LABKOM 1 (Lantai 1)', 'henrika', '16', '23', '4', '2', '1'),
(89, '2018-11-14 11:10:00', '2', 'XII-MIPA3 - Biologi UH 2 (11:10-11:50) - Henrika Dwi Hendrastuti, S.Si. - LABKOM 1 (Lantai 1)', 'henrika', '16', '21', '7', '3', '1'),
(90, '2018-11-14 13:00:00', '2', 'XII-MIPA5 - Biologi UH 2 (13:00-13:40) - Henrika Dwi Hendrastuti, S.Si. - LABKOM 1 (Lantai 1)', 'henrika', '16', '23', '9', '3', '1'),
(91, '2018-11-15 13:00:00', '2', 'XII-MIPA4 - Biologi UH 2 (13:00-13:40) - Henrika Dwi Hendrastuti, S.Si. - LABKOM 1 (Lantai 1)', 'henrika', '16', '22', '9', '3', '1'),
(92, '2018-11-27 11:10:00', '2', 'XII-MIPA3 - Biologi UH 3 (11:10-11:50) - Henrika Dwi Hendrastuti, S.Si. - LABKOM 1 (Lantai 1)', 'henrika', '16', '21', '7', '4', '1'),
(93, '2018-12-03 07:10:00', '2', 'XII-IPS1 - Matematika UH 1 (Remidi) (07:10- 07:55) - Stephanus Sulistyantoro , M.Pd. - LABKOM 1 (Lantai 1)', 'stephanus', '19', '26', '1', '5', '1'),
(94, '2018-12-04 07:10:00', '2', 'XII-IPS2 - Matematika UH 1 (Remidi) (07:10- 07:55) - Stephanus Sulistyantoro , M.Pd. - LABKOM 1 (Lantai 1)', 'stephanus', '19', '27', '1', '5', '1'),
(95, '2018-12-05 07:10:00', '2', 'XII-IPS3 - Matematika UH 1 (Remidi) (07:10- 07:55) - Stephanus Sulistyantoro , M.Pd. - LABKOM 1 (Lantai 1)', 'stephanus', '19', '28', '1', '5', '1'),
(96, '2018-12-06 07:10:00', '2', 'XII-IPS4 - Matematika UH 1 (Remidi) (07:10- 07:55) - Stephanus Sulistyantoro , M.Pd. - LABKOM 1 (Lantai 1)', 'stephanus', '19', '29', '1', '5', '1'),
(97, '2018-12-07 07:10:00', '3', 'XII-SC - Matematika UH 1 (Remidi) (07:10- 07:55) - Stephanus Sulistyantoro , M.Pd. - LABKOM 1 (Lantai 1)', 'stephanus', '19', '25', '1', '5', '1'),
(98, '2019-01-25 07:10:00', '2', 'X-IPS1 - Sejarah/PPKN UH 1 (Remidi) (07:10- 07:55) - Albertus Handang Budi Karya , S.Pd. - LABKOM 1 (Lantai 1)', 'handang', '27', '6', '1', '5', '1'),
(99, '2019-01-29 07:10:00', '2', 'XI-SC - Biologi UH 1 (07:10- 07:55) - Veronica Ervina Pudjiastuti , S.Si.  - LABKOM 1 (Lantai 1)', 'ervina', '20', '12', '1', '2', '1'),
(100, '2019-01-31 07:10:00', '2', 'XI-MIPA4 - Biologi UH 1 (07:10- 07:55) - Veronica Ervina Pudjiastuti , S.Si.  - LABKOM 1 (Lantai 1)', 'ervina', '20', '14', '1', '2', '1'),
(106, '2019-08-13 00:00:00', '3', 'XII-MIPA5 - Kimia UH 1 ( Jam Ke1) - Octhan Setyawan, S.Si.  - LABKOM 3 (Lantai 3)', 'octhan', '29', '23', '1', '2', '3'),
(107, '2019-08-13 00:00:00', '3', 'XII-SC - Kimia UH 1 ( Jam Ke2) - Octhan Setyawan, S.Si.  - LABKOM 3 (Lantai 3)', 'octhan', '29', '25', '2', '2', '3'),
(108, '2019-08-13 00:00:00', '3', 'XII-MIPA5 - Kimia UH 1 ( Jam Ke2) - Octhan Setyawan, S.Si.  - LABKOM 3 (Lantai 3)', 'octhan', '29', '23', '2', '2', '3'),
(109, '2019-08-14 00:00:00', '2', 'XII-MIPA5 - Kimia UH 1 ( Jam Ke1) - Octhan Setyawan, S.Si.  - LABKOM 3 (Lantai 3)', 'octhan', '29', '23', '1', '2', '3'),
(110, '2019-08-14 00:00:00', '2', 'XII-MIPA5 - Kimia UH 1 ( Jam Ke2) - Octhan Setyawan, S.Si.  - LABKOM 3 (Lantai 3)', 'octhan', '29', '23', '2', '2', '3'),
(111, '2019-08-19 13:00:00', '2', 'XII-SC - Kimia UH 1 ( Jam Ke8) - Octhan Setyawan, S.Si.  - LABKOM 1 (Lantai 1)', 'octhan', '29', '25', '9', '2', '1'),
(112, '2019-08-19 13:40:00', '2', 'XII-SC - Kimia UH 1 ( Jam Ke9) - Octhan Setyawan, S.Si.  - LABKOM 1 (Lantai 1)', 'octhan', '29', '25', '10', '2', '1'),
(113, '2019-08-19 09:10:00', '2', 'XII-MIPA4 - Kimia UH 1 ( Jam Ke3) - Octhan Setyawan, S.Si.  - LABKOM 1 (Lantai 1)', 'octhan', '29', '22', '4', '2', '1'),
(114, '2019-08-19 09:50:00', '2', 'XII-MIPA4 - Kimia UH 1 ( Jam Ke4) - Octhan Setyawan, S.Si.  - LABKOM 1 (Lantai 1)', 'octhan', '29', '22', '5', '2', '1'),
(115, '2019-08-14 09:10:00', '2', 'XI-IPS2 - Sosiologi UH 1 ( Jam Ke3) - Eva Renanthya Grimaldi, S.Sos.  - LABKOM 1 (Lantai 1)', 'eva', '21', '17', '4', '2', '1'),
(116, '2019-08-14 09:50:00', '2', 'XI-IPS2 - Sosiologi UH 1 ( Jam Ke4) - Eva Renanthya Grimaldi, S.Sos.  - LABKOM 1 (Lantai 1)', 'eva', '21', '17', '5', '2', '1'),
(117, '2019-08-14 10:30:00', '2', 'XII-IPS3 - Sosiologi UH 1 ( Jam Ke5) - Eva Renanthya Grimaldi, S.Sos.  - LABKOM 1 (Lantai 1)', 'eva', '21', '28', '6', '2', '1'),
(118, '2019-08-14 11:10:00', '2', 'XII-IPS3 - Sosiologi UH 1 ( Jam Ke6) - Eva Renanthya Grimaldi, S.Sos.  - LABKOM 1 (Lantai 1)', 'eva', '21', '28', '7', '2', '1'),
(119, '2019-08-19 13:00:00', '2', 'XI-MIPA2 - Sejarah/PPKN UH 1 ( Jam Ke8) - Albertus Handang Budi Karya , S.Pd. - LABKOM 2 (Lantai 3)', 'handang', '27', '11', '9', '2', '2'),
(120, '2019-08-20 13:00:00', '2', 'XI-MIPA1 - Sejarah/PPKN UH 1 ( Jam Ke8) - Albertus Handang Budi Karya , S.Pd. - LABKOM 1 (Lantai 1)', 'handang', '27', '10', '9', '2', '1'),
(121, '2019-08-21 09:10:00', '2', 'XI-MIPA3 - Sejarah/PPKN UH 1 ( Jam Ke3) - Albertus Handang Budi Karya , S.Pd. - LABKOM 1 (Lantai 1)', 'handang', '27', '13', '4', '2', '1'),
(122, '2019-08-21 10:30:00', '2', 'XI-SC - Sejarah/PPKN UH 1 ( Jam Ke5) - Albertus Handang Budi Karya , S.Pd. - LABKOM 1 (Lantai 1)', 'handang', '27', '12', '6', '2', '1'),
(123, '2019-08-22 00:00:00', '2', 'XI-MIPA4 - Sejarah/PPKN UH 1 ( Jam Ke1) - Albertus Handang Budi Karya , S.Pd. - LABKOM 1 (Lantai 1)', 'handang', '27', '14', '1', '2', '1'),
(124, '2019-08-19 13:40:00', '2', 'XI-MIPA2 - Sejarah/PPKN UH 1 ( Jam Ke9) - Albertus Handang Budi Karya , S.Pd. - LABKOM 2 (Lantai 3)', 'handang', '27', '11', '10', '2', '2'),
(125, '2019-08-20 13:40:00', '2', 'XI-MIPA1 - Sejarah/PPKN UH 1 ( Jam Ke9) - Albertus Handang Budi Karya , S.Pd. - LABKOM 1 (Lantai 1)', 'handang', '27', '10', '10', '2', '1'),
(126, '2019-08-21 09:50:00', '2', 'XI-MIPA3 - Sejarah/PPKN UH 1 ( Jam Ke4) - Albertus Handang Budi Karya , S.Pd. - LABKOM 1 (Lantai 1)', 'handang', '27', '13', '5', '2', '1'),
(127, '2019-08-21 11:10:00', '2', 'XI-SC - Sejarah/PPKN UH 1 ( Jam Ke6) - Albertus Handang Budi Karya , S.Pd. - LABKOM 1 (Lantai 1)', 'handang', '27', '12', '7', '2', '1'),
(128, '2019-08-22 00:00:00', '2', 'XI-MIPA4 - Sejarah/PPKN UH 1 ( Jam Ke2) - Albertus Handang Budi Karya , S.Pd. - LABKOM 1 (Lantai 1)', 'handang', '27', '14', '2', '2', '1'),
(129, '2019-08-23 10:30:00', '2', 'XI-MIPA4 - Fisika UH 1 ( Jam Ke5) - Theresia Anata, S. Pd. - LABKOM 1 (Lantai 1)', 'anata', '41', '14', '6', '2', '1'),
(130, '2019-08-23 11:10:00', '2', 'XI-MIPA4 - Fisika UH 1 ( Jam Ke6) - Theresia Anata, S. Pd. - LABKOM 1 (Lantai 1)', 'anata', '41', '14', '7', '2', '1'),
(131, '2019-08-22 12:20:00', '2', 'XI-IPS1 - Sosiologi UH 1 ( Jam Ke7) - Eva Renanthya Grimaldi, S.Sos.  - LABKOM 1 (Lantai 1)', 'eva', '21', '16', '8', '2', '1'),
(132, '2019-08-22 13:00:00', '2', 'XI-IPS1 - Sosiologi UH 1 ( Jam Ke8) - Eva Renanthya Grimaldi, S.Sos.  - LABKOM 1 (Lantai 1)', 'eva', '21', '16', '9', '2', '1'),
(133, '0000-00-00 00:00:00', '2', 'XI-IPS1 - Sosiologi UH 1 ( Jam Ke8) - Eva Renanthya Grimaldi, S.Sos.  - LABKOM 1 (Lantai 1)', 'eva', '21', '16', '9', '2', '1'),
(134, '2019-08-23 09:10:00', '2', 'XI-IPS3 - Sosiologi UH 1 ( Jam Ke3) - Eva Renanthya Grimaldi, S.Sos.  - LABKOM 1 (Lantai 1)', 'eva', '21', '18', '4', '2', '1'),
(135, '2019-08-23 09:50:00', '2', 'XI-IPS3 - Sosiologi UH 1 ( Jam Ke4) - Eva Renanthya Grimaldi, S.Sos.  - LABKOM 1 (Lantai 1)', 'eva', '21', '18', '5', '2', '1');

-- --------------------------------------------------------

--
-- Table structure for table `jam`
--

DROP TABLE IF EXISTS `jam`;
CREATE TABLE IF NOT EXISTS `jam` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `kode` varchar(512) NOT NULL,
  `mulai` varchar(50) NOT NULL,
  `selesai` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `jam`
--

INSERT INTO `jam` (`id`, `kode`, `mulai`, `selesai`) VALUES
(1, '1', 'JAM KE 1', ''),
(2, '2', 'JAM KE 2', '08:40'),
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
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `kelas` varchar(255) NOT NULL,
  `kelaskat` int(5) NOT NULL,
  PRIMARY KEY (`id`)
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
(30, 'PPDB', 1);

-- --------------------------------------------------------

--
-- Table structure for table `kelaskat`
--

DROP TABLE IF EXISTS `kelaskat`;
CREATE TABLE IF NOT EXISTS `kelaskat` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `kelaskat` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
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
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `kelas` varchar(255) NOT NULL,
  `siswa` varchar(255) NOT NULL,
  `absen` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `kursus_setting`
--

DROP TABLE IF EXISTS `kursus_setting`;
CREATE TABLE IF NOT EXISTS `kursus_setting` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `guru` varchar(255) NOT NULL,
  `mapel` varchar(255) NOT NULL,
  `tahunajaran` varchar(255) NOT NULL,
  `kelaskat` varchar(512) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `labkom`
--

DROP TABLE IF EXISTS `labkom`;
CREATE TABLE IF NOT EXISTS `labkom` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `labkom` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `labkom`
--

INSERT INTO `labkom` (`id`, `labkom`) VALUES
(1, 'LABKOM 1 (Lantai 1)'),
(2, 'LABKOM 2 (Lantai 3)'),
(3, 'LABKOM 3 (Lantai 3)');

-- --------------------------------------------------------

--
-- Table structure for table `mapel`
--

DROP TABLE IF EXISTS `mapel`;
CREATE TABLE IF NOT EXISTS `mapel` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `mapel` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `kode` varchar(20) NOT NULL DEFAULT '0',
  `guru` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=55 ;

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
(19, 'Matematika', '', 'Matematika', 'stephanus'),
(20, 'Biologi', '', 'Biologi', 'veronicaervina'),
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
(54, 'PPKn', '', 'PPKN', 'anawatisusi');

-- --------------------------------------------------------

--
-- Table structure for table `mapel_icon`
--

DROP TABLE IF EXISTS `mapel_icon`;
CREATE TABLE IF NOT EXISTS `mapel_icon` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
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
  `id_daftar` int(5) NOT NULL AUTO_INCREMENT,
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
  `Alamat` text NOT NULL,
  PRIMARY KEY (`id_daftar`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `materi`
--

DROP TABLE IF EXISTS `materi`;
CREATE TABLE IF NOT EXISTS `materi` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `pertemuan` int(3) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `materi` varchar(255) NOT NULL,
  `guru` varchar(255) NOT NULL,
  `idkursus` varchar(512) NOT NULL,
  `konten` text NOT NULL,
  `kelas` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `menu` varchar(50) NOT NULL DEFAULT '',
  `url` varchar(127) NOT NULL DEFAULT '',
  `published` int(1) NOT NULL DEFAULT '0',
  `ordering` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
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
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `menu` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `ordering` int(2) NOT NULL,
  `parent` int(4) NOT NULL DEFAULT '0',
  `icon` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `menu_siswa`
--

DROP TABLE IF EXISTS `menu_siswa`;
CREATE TABLE IF NOT EXISTS `menu_siswa` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `menu` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `ordering` int(2) NOT NULL,
  `parent` int(4) NOT NULL DEFAULT '0',
  `icon` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `modul`
--

DROP TABLE IF EXISTS `modul`;
CREATE TABLE IF NOT EXISTS `modul` (
  `id` tinyint(11) NOT NULL AUTO_INCREMENT,
  `modul` varchar(30) NOT NULL DEFAULT '',
  `isi` text NOT NULL,
  `setup` varchar(50) NOT NULL DEFAULT '',
  `posisi` tinyint(2) NOT NULL DEFAULT '0',
  `published` int(1) NOT NULL DEFAULT '0',
  `ordering` int(5) NOT NULL DEFAULT '0',
  `type` enum('block','module') NOT NULL DEFAULT 'module',
  PRIMARY KEY (`id`)
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `size` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `dir` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pengumuman_sekolah`
--

DROP TABLE IF EXISTS `pengumuman_sekolah`;
CREATE TABLE IF NOT EXISTS `pengumuman_sekolah` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) NOT NULL DEFAULT '',
  `konten` text NOT NULL,
  `user` varchar(30) NOT NULL DEFAULT '',
  `tgl` date NOT NULL DEFAULT '0000-00-00',
  `hits` int(250) NOT NULL DEFAULT '0',
  `seftitle` varchar(225) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `pertemuan`
--

DROP TABLE IF EXISTS `pertemuan`;
CREATE TABLE IF NOT EXISTS `pertemuan` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `pertemuan` varchar(512) NOT NULL,
  `idkursus` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `phpmysqlautobackup`
--

DROP TABLE IF EXISTS `phpmysqlautobackup`;
CREATE TABLE IF NOT EXISTS `phpmysqlautobackup` (
  `id` int(11) NOT NULL,
  `version` varchar(6) DEFAULT NULL,
  `time_last_run` int(11) NOT NULL,
  PRIMARY KEY (`id`)
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
  `lines` int(11) NOT NULL,
  PRIMARY KEY (`date`)
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

DROP TABLE IF EXISTS `semester`;
CREATE TABLE IF NOT EXISTS `semester` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `word` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
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
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `session` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
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
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `session` varchar(255) NOT NULL,
  `kelas` int(5) NOT NULL,
  `siswa` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `siswa` (`siswa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `situs`
--

DROP TABLE IF EXISTS `situs`;
CREATE TABLE IF NOT EXISTS `situs` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
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
  `tampilan` enum('table','icon') COLLATE latin1_general_ci NOT NULL DEFAULT 'table',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `situs`
--

INSERT INTO `situs` (`id`, `email_master`, `judul_situs`, `url_situs`, `slogan`, `description`, `keywords`, `maxkonten`, `maxadmindata`, `maxdata`, `maxgalleri`, `widgetshare`, `theme`, `author`, `alamatkantor`, `publishwebsite`, `publishnews`, `maxgalleridata`, `widgetkomentar`, `widgetpenulis`, `semester`, `tahun ajaran`, `tampilan`) VALUES
(1, 'admin@admin.com', 'jadwalUjian', 'http://localhost/jadwalujian/', 'Slogan / Motto Sekolah', 'jadwalujian', 'surabaya,indonesia', 5, 50, 10, 4, 3, 'elearning', '', '<span>"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."</span>', 1, 1, 12, 1, 2, '', 0, 'icon');

-- --------------------------------------------------------

--
-- Table structure for table `soal`
--

DROP TABLE IF EXISTS `soal`;
CREATE TABLE IF NOT EXISTS `soal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ujian` int(10) NOT NULL,
  `soal` text NOT NULL,
  `pilihan` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tahunajaran`
--

DROP TABLE IF EXISTS `tahunajaran`;
CREATE TABLE IF NOT EXISTS `tahunajaran` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tahunajaran` varchar(50) NOT NULL,
  `keterangan` varchar(256) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tahunajaran` (`tahunajaran`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `tahunajaran`
--

INSERT INTO `tahunajaran` (`id`, `tahunajaran`, `keterangan`, `status`) VALUES
(14, '2017/2018', '2017/2018', 'aktif'),
(15, '2018/2019', '2018/2019', 'aktif');

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
  `id` int(12) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE IF NOT EXISTS `tbl_user` (
  `id_user` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `level_user` int(5) NOT NULL,
  `email` varchar(50) NOT NULL,
  `nip` varchar(5) NOT NULL,
  `status` int(5) NOT NULL,
  `w_login` datetime NOT NULL,
  `w_daftar` datetime NOT NULL,
  `photo` varchar(100) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tipeujian`
--

DROP TABLE IF EXISTS `tipeujian`;
CREATE TABLE IF NOT EXISTS `tipeujian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `kode` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `topik`
--

DROP TABLE IF EXISTS `topik`;
CREATE TABLE IF NOT EXISTS `topik` (
  `id` tinyint(11) NOT NULL AUTO_INCREMENT,
  `topik` varchar(60) NOT NULL DEFAULT '',
  `ket` text NOT NULL,
  `parentid` int(2) NOT NULL DEFAULT '0',
  `seftitle` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=48 ;

-- --------------------------------------------------------

--
-- Table structure for table `tugas`
--

DROP TABLE IF EXISTS `tugas`;
CREATE TABLE IF NOT EXISTS `tugas` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) NOT NULL,
  `ket` text NOT NULL,
  `tglmulai` date NOT NULL,
  `tglakhir` date NOT NULL,
  `user` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tugaskomentar`
--

DROP TABLE IF EXISTS `tugaskomentar`;
CREATE TABLE IF NOT EXISTS `tugaskomentar` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `tgl` date NOT NULL,
  `tugassiswa` int(5) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `kelas` varchar(255) NOT NULL,
  `komentar` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tugassiswa`
--

DROP TABLE IF EXISTS `tugassiswa`;
CREATE TABLE IF NOT EXISTS `tugassiswa` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `tugas` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `kelas` varchar(255) NOT NULL,
  `file` varchar(512) NOT NULL,
  `ket` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `t_jurusan`
--

DROP TABLE IF EXISTS `t_jurusan`;
CREATE TABLE IF NOT EXISTS `t_jurusan` (
  `id_jur` int(5) NOT NULL AUTO_INCREMENT,
  `jurusan` varchar(30) NOT NULL,
  `jur_ket` varchar(10) NOT NULL,
  `kdjur` varchar(10) NOT NULL,
  `quota` varchar(5) NOT NULL,
  `kelas` varchar(5) NOT NULL,
  `bayar` varchar(20) NOT NULL,
  PRIMARY KEY (`id_jur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ujian`
--

DROP TABLE IF EXISTS `ujian`;
CREATE TABLE IF NOT EXISTS `ujian` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `ujian` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `ujian`
--

INSERT INTO `ujian` (`id`, `ujian`) VALUES
(2, 'UH 1'),
(3, 'UH 2'),
(4, 'UH 3'),
(5, 'UH 1 (Remidi)'),
(6, 'UH 2 (Remidi)'),
(7, 'UH 3 (Remidi)'),
(8, 'Uji Coba'),
(10, 'UH4'),
(11, 'UH 4 (Remidi)');

-- --------------------------------------------------------

--
-- Table structure for table `ujianguru`
--

DROP TABLE IF EXISTS `ujianguru`;
CREATE TABLE IF NOT EXISTS `ujianguru` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `iduser` varchar(50) NOT NULL,
  `idmapel` varchar(50) NOT NULL,
  `tahunajaran` varchar(50) NOT NULL,
  `semester` varchar(50) NOT NULL,
  `tipeujian` varchar(50) NOT NULL,
  `idujian` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ujianhari`
--

DROP TABLE IF EXISTS `ujianhari`;
CREATE TABLE IF NOT EXISTS `ujianhari` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `idhari` varchar(5) NOT NULL,
  `tgl` varchar(50) NOT NULL,
  `idmapel` varchar(50) NOT NULL,
  `tahunajaran` varchar(50) NOT NULL,
  `semester` varchar(50) NOT NULL,
  `tipeujian` varchar(50) NOT NULL,
  `idujian` varchar(50) NOT NULL,
  `kelaskat` varchar(50) NOT NULL,
  `cekgenap` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ujianharijam`
--

DROP TABLE IF EXISTS `ujianharijam`;
CREATE TABLE IF NOT EXISTS `ujianharijam` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `tahunajaran` varchar(50) NOT NULL,
  `semester` varchar(50) NOT NULL,
  `tipeujian` varchar(50) NOT NULL,
  `nama` varchar(512) NOT NULL,
  `tgl` varchar(50) NOT NULL,
  `hari` varchar(50) NOT NULL,
  `mulai` varchar(50) NOT NULL,
  `selesai` varchar(50) NOT NULL,
  `keterangan` varchar(512) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ujianharijamsusulan`
--

DROP TABLE IF EXISTS `ujianharijamsusulan`;
CREATE TABLE IF NOT EXISTS `ujianharijamsusulan` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `tahunajaran` varchar(50) NOT NULL,
  `semester` varchar(50) NOT NULL,
  `tipeujian` varchar(50) NOT NULL,
  `nama` varchar(512) NOT NULL,
  `tgl` varchar(50) NOT NULL,
  `hari` varchar(50) NOT NULL,
  `mulai` varchar(50) NOT NULL,
  `selesai` varchar(50) NOT NULL,
  `keterangan` varchar(512) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ujianharisusulan`
--

DROP TABLE IF EXISTS `ujianharisusulan`;
CREATE TABLE IF NOT EXISTS `ujianharisusulan` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `idhari` varchar(5) NOT NULL,
  `tgl` varchar(50) NOT NULL,
  `idmapel` varchar(50) NOT NULL,
  `tahunajaran` varchar(50) NOT NULL,
  `semester` varchar(50) NOT NULL,
  `tipeujian` varchar(50) NOT NULL,
  `idujian` varchar(50) NOT NULL,
  `kelaskat` varchar(50) NOT NULL,
  `cekgenap` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ujiannilai`
--

DROP TABLE IF EXISTS `ujiannilai`;
CREATE TABLE IF NOT EXISTS `ujiannilai` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
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
  `guru` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ujiansetting`
--

DROP TABLE IF EXISTS `ujiansetting`;
CREATE TABLE IF NOT EXISTS `ujiansetting` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `petunjuk` text NOT NULL,
  `waktu` varchar(255) NOT NULL,
  `tahunajaran` varchar(10) NOT NULL,
  `semester` int(5) NOT NULL,
  `tipeujian` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `useraura`
--

DROP TABLE IF EXISTS `useraura`;
CREATE TABLE IF NOT EXISTS `useraura` (
  `UserId` int(15) NOT NULL AUTO_INCREMENT,
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
  `urutan` varchar(50) NOT NULL,
  PRIMARY KEY (`UserId`),
  UNIQUE KEY `user` (`user`),
  UNIQUE KEY `user_2` (`user`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5791 ;

--
-- Dumping data for table `useraura`
--

INSERT INTO `useraura` (`UserId`, `user`, `password`, `level`, `tipe`, `is_online`, `last_ping`, `start`, `exp`, `nama`, `photo`, `statusemail`, `statustelp`, `email`, `telp`, `password2`, `tahunajaran`, `kelas`, `absen`, `urutan`) VALUES
(1, 'admin', '10e01b4500dec5cccf9e851afacf4410', 'Administrator', 'aktif', 1, '2019-08-24 11:16:09', '2010-08-27 00:00:00', '2034-08-27 00:00:00', 'Administrator', '', 'sembunyikan', 'sembunyikan', '', '', 'Frateran2018..?', '', '', '', ''),
(68, 'superadmin', 'b11d5ece6353d17f85c5ad30e0a02360', 'Administrator', 'aktif', 1, '2019-08-26 08:39:21', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', 'sembunyikan', 'sembunyikan', '', '', '', '', '', '', ''),
(5779, 'markustri', 'a605299085d36ad7ec3c37bfc7ea1a18', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Markus Tri Wibowo , S.Pd.', '', 'sembunyikan', 'sembunyikan', '', '', 'markustri6571', '', '', '', '39'),
(5778, 'markusfatubun', 'c2651dd019513e6b09a640511f0a995b', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Markus Fatubun, S.Pd.', '', 'sembunyikan', 'sembunyikan', '', '', 'markusfatubun3360', '', '', '', '38'),
(5777, 'melianapantouw', 'baa341c7cc950c063ed372f9ed902c88', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'M.V. Meliana Pantouw , S.Pd., S.H., M.Kn.', '', 'sembunyikan', 'sembunyikan', '', '', 'melianapantouw7627', '', '', '', '37'),
(5776, 'laurentiuswahyudiarjo', '33f33531f21803f0c420963e047efc6f', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Laurentius Wahyudiarjo , S.Pd.', '', 'sembunyikan', 'sembunyikan', '', '', 'laurentiuswahyudiarjo5176', '', '', '', '36'),
(5775, 'herupurnomo', '5bf68c1cde331714940a8edc78dbdc54', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Heru Purnomo', '', 'sembunyikan', 'sembunyikan', '', '', 'herupurnomo7614', '', '', '', '35'),
(5774, 'henrikadwi', '73f8ac2afd1b3131648571c329a1e2f0', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Henrika Dwi Hendrastuti, S.Si.', '', 'sembunyikan', 'sembunyikan', '', '', 'henrikadwi5737', '', '', '', '34'),
(5773, 'widiaswarini', '825a03929779bfd518aa03f4883af593', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'FX. Widiaswarini, S.Pd..', '', 'sembunyikan', 'sembunyikan', '', '', 'widiaswarini3421', '', '', '', '33'),
(5772, 'fransiskamartanti', '7a70e536cbe63840106a924792e20ec0', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Fransiska Martanti Y., S. Pd.', '', 'sembunyikan', 'sembunyikan', '', '', 'fransiskamartanti5309', '', '', '', '32'),
(5771, 'adriano', 'e640e0328db8170865381846e9be9ed1', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Fr. M. Adriano, BHK., S.Pd.', '', 'sembunyikan', 'sembunyikan', '', '', 'adriano9200', '', '', '', '31'),
(5770, 'flavianaemmi', '84e35352fc376c5b55324d3b4d14b456', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Flaviana Emmi Dwi Astuti, S.T.', '', 'sembunyikan', 'sembunyikan', '', '', 'flavianaemmi5792', '', '', '', '30'),
(5769, 'marcelitamilarosa', '5339d44b06fed4706c6ad3507b2530ab', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Fani Marcelita Mila Rosa, S.Pd., B.A.', '', 'sembunyikan', 'sembunyikan', '', '', 'marcelitamilarosa7214', '', '', '', '29'),
(5768, 'fabriziourso', '1184b2298b0ce4fc00b725759a6a65d1', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Fabrizio Urso', '', 'sembunyikan', 'sembunyikan', '', '', 'fabriziourso4666', '', '', '', '28'),
(5767, 'evarenanthya', '3d085f6a8a9e861a6723abf70f7b0d4f', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Eva Renanthya Grimaldi, S.Sos.', '', 'sembunyikan', 'sembunyikan', '', '', 'evarenanthya3148', '', '', '', '27'),
(5766, 'erlinathomas', '62f11e88be703d4b4700c597ea381802', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Erlina Thomas Novita, S.Pd.', '', 'sembunyikan', 'sembunyikan', '', '', 'erlinathomas6840', '', '', '', '26'),
(5765, 'panjidwi', '0d1eb75dbe257fcb6719eaa5e3288e37', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Drs. Y. Panji Dwi Riyanto', '', 'sembunyikan', 'sembunyikan', '', '', 'panjidwi4689', '', '', '', '25'),
(5763, 'susantalucia', 'd2102a0e4ff4339c735233c2922b486d', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Drs. Fx. Susanta Lucia', '', 'sembunyikan', 'sembunyikan', '', '', 'susantalucia7980', '', '', '', '23'),
(5762, 'bernadusedy', '4fd9528179dbbff2446cd72c06a11d68', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Drs. Bernadus Edy Gunarso', '', 'sembunyikan', 'sembunyikan', '', '', 'bernadusedy9028', '', '', '', '22'),
(5761, 'aloysiuswasi', 'b922b8726df074d88dce779b945769e1', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Drs. Aloysius Wasi Dwipoyono, M.Si.', '', 'sembunyikan', 'sembunyikan', '', '', 'aloysiuswasi3982', '', '', '', '21'),
(5760, 'sunarni', '4f3ff49dfe8d43140d9823cd806b46b7', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Dra.C. Sunarni', '', 'sembunyikan', 'sembunyikan', '', '', 'sunarni5386', '', '', '', '20'),
(5759, 'rosulasri', 'b08225d93b8a3ebaa30602d50c654bc0', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Dra. Rosula Sri Pamungkas Yudoretno', '', 'sembunyikan', 'sembunyikan', '', '', 'rosulasri5223', '', '', '', '19'),
(5758, 'mariachristina', '7adf70bd8a98a96b0dc3a75f777a569b', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Dra. Maria Christina Ekaningtyas S.', '', 'sembunyikan', 'sembunyikan', '', '', 'mariachristina8111', '', '', '', '18'),
(5757, 'christindwiningrum', '12b207ccd4d8824523f2b377dfde5edd', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Dra. Christin Dwiningrum', '', 'sembunyikan', 'sembunyikan', '', '', 'christindwiningrum6611', '', '', '', '17'),
(5756, 'ciciliasalaisek', '0babbbadce212df12f20b820b4cb0d8c', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Cicilia Salaisek', '', 'sembunyikan', 'sembunyikan', '', '', 'ciciliasalaisek5268', '', '', '', '16'),
(5755, 'christinakustindarti', 'e616ff1a357968f4eceb69ed2b4f1af8', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Christina Kustindarti , S.Pd., CFP, M.M.', '', 'sembunyikan', 'sembunyikan', '', '', 'christinakustindarti3307', '', '', '', '15'),
(5754, 'christinahandoyo', '81e425005c45e658548c47438b16faed', 'Guru', 'aktif', 1, '2019-08-26 08:55:22', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Christina Handoyo, S.Si', '', 'sembunyikan', 'sembunyikan', '', '', 'christinahandoyo2071', '', '', '', '14'),
(5753, 'choirulanwar', '3e1d66082ee83c56a314905c3f9b01d4', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Choirul Anwar, S.Pd.', '', 'sembunyikan', 'sembunyikan', '', '', 'choirulanwar6022', '', '', '', '13'),
(5752, 'caturmayangkoro', 'dc0369b467bec42acc381863ab45e82e', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Catur Mayangkoro, S. Pd.', '', 'sembunyikan', 'sembunyikan', '', '', 'caturmayangkoro9875', '', '', '', '12'),
(5751, 'widikrismantari', '616e3b092e60da89ec454953e33629bb', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'B. Widi Krismantari , S.Pd.', '', 'sembunyikan', 'sembunyikan', '', '', 'widikrismantari4397', '', '', '', '11'),
(5750, 'antoniusyudi', 'd0ee78b9b358ab79dcb069bd9b12c5fc', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Antonius Yudi Suko Atmaji, S.Psi.', '', 'sembunyikan', 'sembunyikan', '', '', 'antoniusyudi4049', '', '', '', '10'),
(5749, 'antoniusharitono', '591f86ee9bfe062dc252d28f537135c2', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Antonius Haritono, S.Pd.', '', 'sembunyikan', 'sembunyikan', '', '', 'antoniusharitono8356', '', '', '', '09'),
(5748, 'angelinachristofania', 'aa73224a0332b71f54bbd3aba96de18f', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Angelina Christofania Elizabeth, S.Pd.', '', 'sembunyikan', 'sembunyikan', '', '', 'angelinachristofania2020', '', '', '', '08'),
(5747, 'anastasialelyana', '8e5bfa647e91ffdaa0a0cb8402c35113', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Anastasia Lelyana T, S.Pd.', '', 'sembunyikan', 'sembunyikan', '', '', 'anastasialelyana2717', '', '', '', '07'),
(5746, 'aloysiusjaka', '352c54fc78ad9d07be8fdba28042fd6c', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Aloysius Jaka Susanta Widjaya, S.Pd.', '', 'sembunyikan', 'sembunyikan', '', '', 'aloysiusjaka6649', '', '', '', '06'),
(5745, 'aloysiuscatur', 'c1f8fb8869735db4a7324aa2d84e9343', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Aloysius Catur Heri Purnama, S.Pd.', '', 'sembunyikan', 'sembunyikan', '', '', 'aloysiuscatur5055', '', '', '', '05'),
(5744, 'albertusprihayudi', 'a8fe1f933339a776423d32162cf53c55', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Albertus Prihayudi Purnawijaya , S.Pd.', '', 'sembunyikan', 'sembunyikan', '', '', 'albertusprihayudi5310', '', '', '', '04'),
(5742, 'albertusbambang', '13fc97f3162dbd739e8e8327928c8b9e', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Albertus Bambang Arintoko, S. Pd.', '', 'sembunyikan', 'sembunyikan', '', '', 'albertusbambang6882', '', '', '', '02'),
(5743, 'albertushandang', '6363ad5cc818a7d6431203e254aed946', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Albertus Handang Budi Karya , S.Pd.', '', 'sembunyikan', 'sembunyikan', '', '', 'albertushandang2413', '', '', '', '03'),
(5722, '18103', '27b886e94c1aa7cb9cbc46c7683322c7', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'JUSTIN KARUNIA P', '', 'sembunyikan', 'sembunyikan', '', '', '18103*', '14', '9', '8', ''),
(5723, '18105', '1ede06a7741932246670f15737fa776d', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'KARINE WIJAYA', '', 'sembunyikan', 'sembunyikan', '', '', '18105*', '14', '9', '9', ''),
(5721, '18096', 'ff0a0e49e1a2cd2b8339a118312c29da', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'JOSHUA YORDANA', '', 'sembunyikan', 'sembunyikan', '', '', '18096*', '14', '9', '7', ''),
(5719, '18077', 'e718ae61c0344b317d71d2a995b60109', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'JENNIFER WIDJAJA', '', 'sembunyikan', 'sembunyikan', '', '', '18077*', '14', '9', '5', ''),
(5720, '18089', '3f8b4689e4d99de20b9a74d612e2911a', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'JETHRO AMADEUS PO', '', 'sembunyikan', 'sembunyikan', '', '', '18089*', '14', '9', '6', ''),
(5718, '18076', '36b9b7b7543a410ceebb6cb4032b8b78', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'JENNIFER TANUJAYA', '', 'sembunyikan', 'sembunyikan', '', '', '18076*', '14', '9', '4', ''),
(5717, '18064', '7b5dd5cf51d84106071f6aaeb3c2f7e5', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'INDIERA PUTRI ARINI LIMODIREDJO', '', 'sembunyikan', 'sembunyikan', '', '', '18064*', '14', '9', '3', ''),
(5716, '18049', '7c86521c543ab57f89aeb875215b2797', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'GIOVANO DAVE PUTRA', '', 'sembunyikan', 'sembunyikan', '', '', '18049*', '14', '9', '2', ''),
(5715, '17990', '7ec14beecb68d6cc4222eb541c9ce138', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'CHRISTOFFEL ANGELO KUNTADI', '', 'sembunyikan', 'sembunyikan', '', '', '17990*', '14', '9', '1', ''),
(5714, '18235', '54ca0f3d66796024e41809a2dbb697f5', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'YUSAK SUGIARTO', '', 'sembunyikan', 'sembunyikan', '', '', '18235*', '14', '8', '38', ''),
(5712, '18218', 'a43d2c1aea3e1169266d61a78e204d60', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'VINCENSA FANDA', '', 'sembunyikan', 'sembunyikan', '', '', '18218*', '14', '8', '36', ''),
(5713, '18219', 'f85acefd69080eefba1092072b2a5cc2', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'VINCENT GABRIEL', '', 'sembunyikan', 'sembunyikan', '', '', '18219*', '14', '8', '37', ''),
(5711, '18213', 'c52125411489981a59b0886b150ec9d9', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'VANESSA SUSANTO', '', 'sembunyikan', 'sembunyikan', '', '', '18213*', '14', '8', '35', ''),
(5710, '18209', '884ca41368f8f47842032be316b55019', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'VALENZIA JADE', '', 'sembunyikan', 'sembunyikan', '', '', '18209*', '14', '8', '34', ''),
(5708, '18181', '0da1135a2f9947525ed6a474d50ec3a7', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'RIVALDO CARLOS TANDIONO', '', 'sembunyikan', 'sembunyikan', '', '', '18181*', '14', '8', '32', ''),
(5709, '18205', '9eefa53d37dc355e5a29c7f413e20cff', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'THERESSA WIJAYA', '', 'sembunyikan', 'sembunyikan', '', '', '18205*', '14', '8', '33', ''),
(5707, '18155', 'c018c998027cc5933bc7bfa0fd69358c', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'PATRICK EMERSON WYNN', '', 'sembunyikan', 'sembunyikan', '', '', '18155*', '14', '8', '31', ''),
(5706, '18150', '3ae51190a05bcb9c947d493db5055aa4', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'NINI BERRA', '', 'sembunyikan', 'sembunyikan', '', '', '18150*', '14', '8', '30', ''),
(5705, '18143', 'a3c769ec69e89d9d5dae2a42209ac389', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'NATALIA', '', 'sembunyikan', 'sembunyikan', '', '', '18143*', '14', '8', '29', ''),
(5704, '18140', '502ff61a5bab682572fc5dce9b1edd97', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'MONICA EKA WIJAYA', '', 'sembunyikan', 'sembunyikan', '', '', '18140*', '14', '8', '28', ''),
(5702, '18128', '4ed0418ccaf8defe06c29c33c5f1e4cb', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'MARIA JENNIFER KUSUMO', '', 'sembunyikan', 'sembunyikan', '', '', '18128*', '14', '8', '26', ''),
(5703, '18135', 'a58ed6496bfcd094f9962d1f04d27eb4', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'MICHAEL FERRO', '', 'sembunyikan', 'sembunyikan', '', '', '18135*', '14', '8', '27', ''),
(5701, '18121', 'a2befdcbff31a4c1f8bb3ca5e835cb2c', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LOLITA', '', 'sembunyikan', 'sembunyikan', '', '', '18121*', '14', '8', '25', ''),
(5700, '18112', '45ce94840411685bd66831117fd7049e', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'KRISTIA CLOUDY GO SWIE', '', 'sembunyikan', 'sembunyikan', '', '', '18112*', '14', '8', '24', ''),
(5699, '18101', '8fa1d2bc1e42beaec252a2d4c7d2b05b', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'JULIA GIOVANNI', '', 'sembunyikan', 'sembunyikan', '', '', '18101*', '14', '8', '23', ''),
(5698, '18097', 'b5c5b73a26eefb6a026de031e0a2b5ed', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'jourdy jonathan', '', 'sembunyikan', 'sembunyikan', '', '', '18097*', '14', '8', '22', ''),
(5697, '18087', 'b9fc58d5b0e4cc0f311fb5997ef4c86c', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'JESSICA VIVIAN KURNIAWAN', '', 'sembunyikan', 'sembunyikan', '', '', '18087*', '14', '8', '21', ''),
(5696, '18083', '21afc66d2b37b9fb87e4bf59fe3c9d7b', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'JESSICA EVELYN WIJAYA', '', 'sembunyikan', 'sembunyikan', '', '', '18083*', '14', '8', '20', ''),
(5693, '18067', '9015dfe08504e4c19ec60512e1c4c918', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'IVANA DELLAROSA', '', 'sembunyikan', 'sembunyikan', '', '', '18067*', '14', '8', '17', ''),
(5694, '18073', '9ca3151714ccf8487d6ccbd4f7f27eec', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'JEANNANDA FEBY LIANTO', '', 'sembunyikan', 'sembunyikan', '', '', '18073*', '14', '8', '18', ''),
(5695, '18075', '6e20e16bb3e82ad19588883672017428', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'JENNIFER MICHELLE APRILIA', '', 'sembunyikan', 'sembunyikan', '', '', '18075*', '14', '8', '19', ''),
(5692, '18062', '52503780afeb5a713de04e0cf5e1069e', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'HUGO CHRISTIAN WAHYUDI', '', 'sembunyikan', 'sembunyikan', '', '', '18062*', '14', '8', '16', ''),
(5691, '18058', 'dac58414492d35526e2ce906499c811e', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'HANSSEN SUGIARTO', '', 'sembunyikan', 'sembunyikan', '', '', '18058*', '14', '8', '15', ''),
(5690, '18033', '20f3a6e0393a7dcce750345313dcccec', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'FIDELLIO WIDHI PRASETYO IGANG', '', 'sembunyikan', 'sembunyikan', '', '', '18033*', '14', '8', '14', ''),
(5689, '18022', '2e0d4b2660138d06b1856ce23160b7bf', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ELBERT WIRYA OENTORO', '', 'sembunyikan', 'sembunyikan', '', '', '18022*', '14', '8', '13', ''),
(5688, '18020', '4601558c2987c2a782916723bb5e40e8', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'EDWIN SEBASTIAN', '', 'sembunyikan', 'sembunyikan', '', '', '18020*', '14', '8', '12', ''),
(5687, '18012', '187bb57fcb9b4347d8382c987962fa81', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'DEWI MILNA HANDAYANI', '', 'sembunyikan', 'sembunyikan', '', '', '18012*', '14', '8', '11', ''),
(5686, '18009', 'd61c88a2f7ed7259c998fceadeee934b', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'DEFITTO VERDICHA', '', 'sembunyikan', 'sembunyikan', '', '', '18009*', '14', '8', '10', ''),
(5685, '18007', 'd48383e644fda1dbdc43a9f013330f48', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'DAVID CHRISTOPHER KARMAN', '', 'sembunyikan', 'sembunyikan', '', '', '18007*', '14', '8', '9', ''),
(5684, '18005', 'dbdbc962109b005d67d86e2d0627ce4c', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'DANIEL INDO SAHAT BINTANG N.', '', 'sembunyikan', 'sembunyikan', '', '', '18005*', '14', '8', '8', ''),
(5683, '18004', '65ab9c2f25691d0d14300939d695cb56', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'CYNTHIA TRIMULIANA WILUJENG', '', 'sembunyikan', 'sembunyikan', '', '', '18004*', '14', '8', '7', ''),
(5682, '17993', '6099c6a09e5b0695eb93fc2da00fad98', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'CHRISTOPHER LAURENT MULYA', '', 'sembunyikan', 'sembunyikan', '', '', '17993*', '14', '8', '6', ''),
(5681, '17972', '495f749e06e99d12b8ac38fa5e8e77b9', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'CALVIN ADRIAN GUNAWAN', '', 'sembunyikan', 'sembunyikan', '', '', '17972*', '14', '8', '5', ''),
(5680, '17958', '6dddedd151da60550cc30de4d62bd0fc', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'AURELIA CHANDRA WIDODO', '', 'sembunyikan', 'sembunyikan', '', '', '17958*', '14', '8', '4', ''),
(5679, '17954', 'c9a7abbeb627bd1de53b7b61a5048739', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ASHLEY GERALD VICTORIA', '', 'sembunyikan', 'sembunyikan', '', '', '17954*', '14', '8', '3', ''),
(5678, '17953', '0a0d67446cfc1f7fabea493fae8be7fa', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ARSSANGELA ALICIA MILAN', '', 'sembunyikan', 'sembunyikan', '', '', '17953*', '14', '8', '2', ''),
(5676, '18222', '7482c42c11ab59a44f2eccde554e3c84', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'VINCENTIUS ALEGRA KRISTAL', '', 'sembunyikan', 'sembunyikan', '', '', '18222*', '14', '2', '34', ''),
(5677, '17931', '2f2969a1afc6b39efa4f07ec2de5acce', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ABDIONO SETIADI CANDRA', '', 'sembunyikan', 'sembunyikan', '', '', '17931*', '14', '8', '1', ''),
(5675, '19215', '55ff7033aa3aabe370326eec4656aaf4', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'VELYCIA VALENTIO', '', 'sembunyikan', 'sembunyikan', '', '', '19215*', '14', '2', '33', ''),
(5674, '18214', '871edec15cd87c93d9b5e6ef3b627314', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'VANIA SHARON ARDELIA SATMONO', '', 'sembunyikan', 'sembunyikan', '', '', '18214*', '14', '2', '32', ''),
(5673, '18212', 'c14ca2d83a73cf98d872780374b16dea', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'VANESSA SEBASTIAN HANDOJO', '', 'sembunyikan', 'sembunyikan', '', '', '18212*', '14', '2', '31', ''),
(5672, '18206', 'c30ee663c1944af15ac1b13348606c35', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'TITUS TIRTAWAN', '', 'sembunyikan', 'sembunyikan', '', '', '18206*', '14', '2', '30', ''),
(5670, '18190', '1797092c689e15829ba29a1547072325', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'SEVANA PRABHA DEWI', '', 'sembunyikan', 'sembunyikan', '', '', '18190*', '14', '2', '28', ''),
(5671, '18191', 'cbcd8e90b75975b19fc0ce0dcfb4eafb', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'SHANE FREDERICK SUNYOTO', '', 'sembunyikan', 'sembunyikan', '', '', '18191*', '14', '2', '29', ''),
(5669, '18179', '5608479d9ffb470318fe31cbdbc8d49c', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'RICKY CHRISTIAN WIETANTO', '', 'sembunyikan', 'sembunyikan', '', '', '18179*', '14', '2', '27', ''),
(5668, '18169', '6f4b8aa9d1abe48f6b88333aad41c281', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REINALDO', '', 'sembunyikan', 'sembunyikan', '', '', '18169*', '14', '2', '26', ''),
(5667, '18168', '06ca19d2313c74f15f35291fa6203401', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REGINA ANGELYN SINTAN SUTANTO', '', 'sembunyikan', 'sembunyikan', '', '', '18168*', '14', '2', '25', ''),
(5666, '18161', 'aede7cd267fc2dbebb6b8158386273a5', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'PRICILLIA KURNIAWAN', '', 'sembunyikan', 'sembunyikan', '', '', '18161*', '14', '2', '24', ''),
(5665, '18134', 'e366fa9e2e185efa69159530624ca795', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'MICHAEL ANDREAS PRASETIO', '', 'sembunyikan', 'sembunyikan', '', '', '18134*', '14', '2', '23', ''),
(5663, '18118', '5b901d34d526e9ea9a67e66590a6713b', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LEVINA FRANCOIS HARIANTO', '', 'sembunyikan', 'sembunyikan', '', '', '18118*', '14', '2', '21', ''),
(5664, '18124', '3678ac4b38182339aabbb54895c58778', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'MARCELLA RANIA LIMANTONO', '', 'sembunyikan', 'sembunyikan', '', '', '18124*', '14', '2', '22', ''),
(5647, '17945', 'f850c170ac0d8ae2498dbc7afa032846', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ANGEL SIAUW TANTRI', '', 'sembunyikan', 'sembunyikan', '', '', '17945*', '14', '2', '5', ''),
(5513, '18176', 'e7492af86e955b9c8fe6112e6f6d9ee1', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'RICHARD', '', 'sembunyikan', 'sembunyikan', '', '', '18176*', '14', '3', '29', ''),
(5512, '18170', '916c6d7c30084f0e0e9631a1684dfb17', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REINHART EDBERT ONGKOJOYO', '', 'sembunyikan', 'sembunyikan', '', '', '18170*', '14', '3', '28', ''),
(5511, '18158', '8eb9e27797ed11f0a5344e643a09ea02', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'PIERRE PHOA WATEN MIOR BERTKI BERLYN', '', 'sembunyikan', 'sembunyikan', '', '', '18158*', '14', '3', '27', ''),
(5510, '18146', '3accc48720688f3f757f35bd1fa04006', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'NATHALIE', '', 'sembunyikan', 'sembunyikan', '', '', '18146*', '14', '3', '26', ''),
(5509, '18115', '4a839f33c0580fd17236a94a607a922b', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LAURENSIUS NICHOLAS BERTRAND', '', 'sembunyikan', 'sembunyikan', '', '', '18115*', '14', '3', '25', ''),
(5508, '18102', '0976e15fdfbe8728b3f4528e5445496b', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'JULIUS JOSE CHRISTOFAN', '', 'sembunyikan', 'sembunyikan', '', '', '18102*', '14', '3', '24', ''),
(5507, '18099', '0b00427f8aed910c3a1b44d6c1d07654', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'JOVIAN PUTRA SANTOSO', '', 'sembunyikan', 'sembunyikan', '', '', '18099*', '14', '3', '23', ''),
(5506, '18095', 'c866ff611c30b8e632534186c077f295', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'JOSHUA BISMADHIKA ARYA WICAKSANA', '', 'sembunyikan', 'sembunyikan', '', '', '18095*', '14', '3', '22', ''),
(5505, '18094', '88642ba51a551c82c5c77776e0b193c8', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'JOSEF APRILIANO VAKKERS', '', 'sembunyikan', 'sembunyikan', '', '', '18094*', '14', '3', '21', ''),
(5504, '18078', 'd422d7bba2f04e10c715377261d443a9', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'JESSALYN ANGELICA', '', 'sembunyikan', 'sembunyikan', '', '', '18078*', '14', '3', '20', ''),
(5503, '18070', '799de3b2f0286df2de3ef62c43b82a03', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'JASON HONGGO', '', 'sembunyikan', 'sembunyikan', '', '', '18070*', '14', '3', '19', ''),
(5502, '18066', '943b00e6070a4c924d56f44ad4b12ee0', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'IVAN SAMPURNO', '', 'sembunyikan', 'sembunyikan', '', '', '18066*', '14', '3', '18', ''),
(5501, '18065', '5d1aae61e2e4a4b012a0a410aa7c7ea9', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'INDO KARUNIA WIRAWAN', '', 'sembunyikan', 'sembunyikan', '', '', '18065*', '14', '3', '17', ''),
(5500, '18055', '46ee187eac4edf431973125d9a2c6f80', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'GREGORIUS RICHARDO GHEVYN TJAHJADI', '', 'sembunyikan', 'sembunyikan', '', '', '18055*', '14', '3', '16', ''),
(5499, '18054', 'c64053d06abfb582aae05d5cc83d187f', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'GRASIE ARDELIA OSLAN', '', 'sembunyikan', 'sembunyikan', '', '', '18054*', '14', '3', '15', ''),
(5498, '18035', '09cb509d426b3a42a7f6dda4f107735f', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'FLAVIANUS DUI SAVERINO RAHIM', '', 'sembunyikan', 'sembunyikan', '', '', '18035*', '14', '3', '14', ''),
(5497, '18034', 'ef1862b7a278fb9cd8ab12cbff833a4a', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'FIELITA SOEJOSO GONDO', '', 'sembunyikan', 'sembunyikan', '', '', '18034*', '14', '3', '13', ''),
(5496, '18032', '08cef7ef1101cdb61ad3b1b5b2cc7fd3', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'FIALDO FEBRIANTO', '', 'sembunyikan', 'sembunyikan', '', '', '18032*', '14', '3', '12', ''),
(5495, '18027', 'ca14d3d7bdc5646d84c09a3f75cb8bcd', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'EVAN SUTRISNO', '', 'sembunyikan', 'sembunyikan', '', '', '18027*', '14', '3', '11', ''),
(5494, '18023', 'a731babeff47cb5b5088f08810a5da51', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'EMILY VIRGINIA YONANDA HENOEK', '', 'sembunyikan', 'sembunyikan', '', '', '18023*', '14', '3', '10', ''),
(5493, '18015', 'c09fe063649480b3f50d80ac527b4064', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'DONNY YUNG', '', 'sembunyikan', 'sembunyikan', '', '', '18015*', '14', '3', '9', ''),
(5492, '18010', 'da3b00477f8c319c88e1b32b52c9184c', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'DELA PUTRI WIBOWO', '', 'sembunyikan', 'sembunyikan', '', '', '18010*', '14', '3', '8', ''),
(5491, '18000', '683384cf28b1e62b4c1650c73aa37427', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'CLEARY BUDIMAN', '', 'sembunyikan', 'sembunyikan', '', '', '18000*', '14', '3', '7', ''),
(5490, '17996', '7bb1327b859af6ba2032ce87a20ec85b', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'CINDY LAVENIA', '', 'sembunyikan', 'sembunyikan', '', '', '17996*', '14', '3', '6', ''),
(5489, '17971', '1ef3f16fd4a41456063137cdb92aa8cd', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'BRYAN MICHAEL BUDIANTO', '', 'sembunyikan', 'sembunyikan', '', '', '17971*', '14', '3', '5', ''),
(5488, '17962', '28860055ba7c5c90a4a24f909905aa78', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'BEN HUGO', '', 'sembunyikan', 'sembunyikan', '', '', '17962*', '14', '3', '4', ''),
(5487, '17961', '49bde1d0a21664f086212fbc52510dcf', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'AXELLINO ADI WIYONO', '', 'sembunyikan', 'sembunyikan', '', '', '17961*', '14', '3', '3', ''),
(5486, '17948', '31a7bdd04887b3eddf5ce6f94dcac396', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ANGELINE LISTIYANI UTOMO', '', 'sembunyikan', 'sembunyikan', '', '', '17948*', '14', '3', '2', ''),
(5485, '17932', '64fc9b4bc1eb91cd5756c4d910610175', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ABIGAIL ROSALIA', '', 'sembunyikan', 'sembunyikan', '', '', '17932*', '14', '3', '1', ''),
(4599, '17938', 'a2a59025c96d14a563b443f83082e2bd', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ALOYSIUS JEFFREY SUNUR', '', 'sembunyikan', 'sembunyikan', '', '', '17938*', '14', '4', '1', ''),
(4600, '17942', '1803d7c88c81e5cdf01cd585933dc307', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ANASTASIA VANYA D S', '', 'sembunyikan', 'sembunyikan', '', '', '17942*', '14', '4', '2', ''),
(4601, '17944', 'e628ade69a82ce0d2ac5e31c29c1117f', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ANDREW JAMES SUTJIOADI', '', 'sembunyikan', 'sembunyikan', '', '', '17944*', '14', '4', '3', ''),
(4602, '17949', '88abbbf0ab400e33d674bfcd6a072e2a', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ANGELINE NYOWANDA', '', 'sembunyikan', 'sembunyikan', '', '', '17949*', '14', '4', '4', ''),
(4603, '17952', '668fc9e768aa395b111e85e9e00d5a06', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ANTONIO CHRISTOPHER', '', 'sembunyikan', 'sembunyikan', '', '', '17952*', '14', '4', '5', ''),
(4604, '17957', 'ddf4bef94244754fc2d8e3cf0fb52908', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'AUDRICO', '', 'sembunyikan', 'sembunyikan', '', '', '17957*', '14', '4', '6', ''),
(4605, '17963', 'dacb228a5bc1512b81806b5564aa5fd5', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'BENNY LIMANTO', '', 'sembunyikan', 'sembunyikan', '', '', '17963*', '14', '4', '7', ''),
(4606, '17966', '0aa948901b3ea2c37b558848cc05a1f9', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'BILL LOREN JAYA', '', 'sembunyikan', 'sembunyikan', '', '', '17966*', '14', '4', '8', ''),
(4607, '17974', '194d57c9722f02bbaab8501c0d4b30ae', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'CALVIN YOSUA LOMI', '', 'sembunyikan', 'sembunyikan', '', '', '17974*', '14', '4', '9', ''),
(4608, '17984', '71ec5569559bcabd007438898df43f88', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'CHERYL AMANDA SANTOSO', '', 'sembunyikan', 'sembunyikan', '', '', '17984*', '14', '4', '10', ''),
(4609, '18021', '7fd10d757f3cae3740140982a8a2d003', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'EKAPRASETYA ARTHA KENCANA SILANGIT', '', 'sembunyikan', 'sembunyikan', '', '', '18021*', '14', '4', '11', ''),
(4610, '18025', '6ae33e8677396ffe1f94153ffe5eca33', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ERISA', '', 'sembunyikan', 'sembunyikan', '', '', '18025*', '14', '4', '12', ''),
(4611, '18043', '4a89d8a9e57f9c1a1650a0317c03cab1', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'GABBY', '', 'sembunyikan', 'sembunyikan', '', '', '18043*', '14', '4', '13', ''),
(4612, '18044', 'e629f3855f1fd8453448219623a66f5c', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'GABRIEL ANGELINA PRAYITNO', '', 'sembunyikan', 'sembunyikan', '', '', '18044*', '14', '4', '14', ''),
(4613, '18048', 'd1f7da842fce32e14d2afc99a815ba3d', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'GIOVANNI NOVELIAN', '', 'sembunyikan', 'sembunyikan', '', '', '18048*', '14', '4', '15', ''),
(4614, '18084', '81852d0159a55362a6eb901046c32274', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'JESSICA FRISIANTI SETIADY', '', 'sembunyikan', 'sembunyikan', '', '', '18084*', '14', '4', '16', ''),
(4615, '18091', '91513b22ebc14235c096686c87c57150', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'JOHANES GEMMA GAUDIUS BISOWARNO', '', 'sembunyikan', 'sembunyikan', '', '', '18091*', '14', '4', '17', ''),
(4616, '18108', '8fda73dbafb1de22b39f34cb12038734', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'KENNETH SURYA KUSUMA', '', 'sembunyikan', 'sembunyikan', '', '', '18108*', '14', '4', '18', ''),
(4617, '18111', '99435b10a3c6e0b01d4f5cf55c7da931', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'KEVIN OWEN SANTOSO', '', 'sembunyikan', 'sembunyikan', '', '', '18111*', '14', '4', '19', ''),
(4618, '18113', 'e2e9e1d09be60bd68414b319d3cd9785', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LAURENCIA GABRIELLE', '', 'sembunyikan', 'sembunyikan', '', '', '18113*', '14', '4', '20', ''),
(4619, '18122', 'a64a19c340e4a29fba0e881fff6860c4', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LOUIS MICHAEL', '', 'sembunyikan', 'sembunyikan', '', '', '18122*', '14', '4', '21', ''),
(4620, '18126', 'c5e84f6ff3691104c3e087ab0c117c21', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'MARGARETHA DESMONDA', '', 'sembunyikan', 'sembunyikan', '', '', '18126*', '14', '4', '22', ''),
(4621, '18132', '7f7c15025e692f65d62165fa656ca097', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'MEILISA VALENTINA HANDOYO', '', 'sembunyikan', 'sembunyikan', '', '', '18132*', '14', '4', '23', ''),
(4622, '18138', '42b4099f44e2843100b5ea7be06374a3', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'MICHELLE KHOSASI', '', 'sembunyikan', 'sembunyikan', '', '', '18138*', '14', '4', '24', ''),
(4623, '18144', '033b45ec6ab5924421942e067932c010', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'NATASHA VERSYA', '', 'sembunyikan', 'sembunyikan', '', '', '18144*', '14', '4', '25', ''),
(4624, '18147', '24b2187a760c27a8c9db58e8f7d00f3b', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'NATHANAEL KENZIE CHRISTIAN LESMANA', '', 'sembunyikan', 'sembunyikan', '', '', '18147*', '14', '4', '26', ''),
(4625, '18162', '25d23f347ea93cb69a2be57ea93688bf', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'PRISCILLA ADELIA PADUDUNG', '', 'sembunyikan', 'sembunyikan', '', '', '18162*', '14', '4', '27', ''),
(4626, '18166', '953e432f9eac35962eb86cc976656e3a', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'RAFAEL JONATHAN', '', 'sembunyikan', 'sembunyikan', '', '', '18166*', '14', '4', '28', ''),
(4627, '18172', '2f9bbf3bcbbeb2e87a312a1b641a9674', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REYNALDO GANDI', '', 'sembunyikan', 'sembunyikan', '', '', '18172*', '14', '4', '29', ''),
(4628, '18174', 'b60456d88ec4e2bbd7bcdccc735d434c', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'RHETICE JANICE TRIXIE RETANUBUN', '', 'sembunyikan', 'sembunyikan', '', '', '18174*', '14', '4', '30', ''),
(4629, '18186', '4b8106e6ff1cd4f50e6bed6fbcfa9f6e', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'RYU APRIJANTO', '', 'sembunyikan', 'sembunyikan', '', '', '18186*', '14', '4', '31', ''),
(4630, '18194', '97f37f4cf7c1e71b0e5650c0608e4542', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'SINTIA', '', 'sembunyikan', 'sembunyikan', '', '', '18194*', '14', '4', '32', ''),
(4631, '18217', '298591b48aad670914d958869d1ae38c', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'VICTOR SEBASTIAN', '', 'sembunyikan', 'sembunyikan', '', '', '18217*', '14', '4', '33', ''),
(4632, '18223', '79d03fbccf24daccaa734ee7b6bf744e', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'VINCENTIUS NATHANAEL GUNAWAN', '', 'sembunyikan', 'sembunyikan', '', '', '18223*', '14', '4', '34', ''),
(4633, '17937', '8231cf9094987f3b15c5ab7629e937cc', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ALFIENA LIMAN PRASETYA', '', 'sembunyikan', 'sembunyikan', '', '', '17937*', '14', '5', '1', ''),
(4634, '17951', '61421adc023acfc645feaca614ed3044', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ANTHONY NICHOLAUS PRANOTO', '', 'sembunyikan', 'sembunyikan', '', '', '17951*', '14', '5', '2', ''),
(4635, '17967', '2d3b37d0605cbd05eeaed75af7420783', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'BONFILIO RISALVIN BAYU PRADANA', '', 'sembunyikan', 'sembunyikan', '', '', '17967*', '14', '5', '3', ''),
(4636, '17973', 'e040f58265579d178f8f31598803b55b', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'CALVIN ANDY SOEKANTO', '', 'sembunyikan', 'sembunyikan', '', '', '17973*', '14', '5', '4', ''),
(4637, '17983', '76eb29efef4dd83da3a28100aff4e426', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'CHARLIE HANS', '', 'sembunyikan', 'sembunyikan', '', '', '17983*', '14', '5', '5', ''),
(4638, '18017', 'f648f99eb4d8b940474fbc11516e1871', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'DYORRA STEVANY', '', 'sembunyikan', 'sembunyikan', '', '', '18017*', '14', '5', '6', ''),
(4639, '18038', 'd6640dfc2a6f6ad419c13bdda595219e', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'FREDERICK NELSON HALIM', '', 'sembunyikan', 'sembunyikan', '', '', '18038*', '14', '5', '7', ''),
(4640, '18039', 'e8f1cdbc2b44d89737e81ac8cd28ea11', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'FREDI SETYAWAN', '', 'sembunyikan', 'sembunyikan', '', '', '18039*', '14', '5', '8', ''),
(4641, '18040', '24460808ee32f1cc81f3a8c3dc32b495', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'FRELLY NIKOLAUS GILBERT', '', 'sembunyikan', 'sembunyikan', '', '', '18040*', '14', '5', '9', ''),
(4642, '18050', 'b5fdcc3eaf064c2af53224f81ba4ef22', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'GLORIA DHEA SUKMADEWI', '', 'sembunyikan', 'sembunyikan', '', '', '18050*', '14', '5', '10', ''),
(4643, '18059', 'df3123b19ab332cf5e3706ac7fadb7a5', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'HILLARY TATYANA CONSTANTIN S', '', 'sembunyikan', 'sembunyikan', '', '', '18059*', '14', '5', '11', ''),
(4644, '18071', 'f5e5a6b5af73f959a16ec02973b2cefb', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'JASON SUWANDI', '', 'sembunyikan', 'sembunyikan', '', '', '18071*', '14', '5', '12', ''),
(4645, '18080', 'f0073c52f32e600c198e382868d162cd', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'JESSICA ANGELINE', '', 'sembunyikan', 'sembunyikan', '', '', '18080*', '14', '5', '13', ''),
(4646, '18086', 'ed8c8cd4463af895381cadc691f5f2dc', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'JESSICA OLIVIA TAN', '', 'sembunyikan', 'sembunyikan', '', '', '18086*', '14', '5', '14', ''),
(4647, '18088', '4022104f715f12bbaca7f5bf5e8b772a', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'JESSY LARISSA CHEN', '', 'sembunyikan', 'sembunyikan', '', '', '18088*', '14', '5', '15', ''),
(4648, '18125', '4b37c4e49d1fe4cb46a7c2efdad0a953', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'MARCHELLO KUSUMO', '', 'sembunyikan', 'sembunyikan', '', '', '18125*', '14', '5', '16', ''),
(4649, '18131', '6b55cc47308859e832e6c4efb8a21344', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'MATTHEW SUGIHONO WIJAYA', '', 'sembunyikan', 'sembunyikan', '', '', '18131*', '14', '5', '17', ''),
(4650, '18148', '54b78f560d814d3a696fef0bf77cfda0', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'NICHOLAS HOKKI PUTRA', '', 'sembunyikan', 'sembunyikan', '', '', '18148*', '14', '5', '18', ''),
(4651, '18153', 'a23acd5599236739de04cb3ebcb32faa', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'PAMELA AUDREY', '', 'sembunyikan', 'sembunyikan', '', '', '18153*', '14', '5', '19', ''),
(4652, '18154', '1063984054c9dd458e4a46fce60b9dfa', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'PATRICK ANDERSON SUNARYO', '', 'sembunyikan', 'sembunyikan', '', '', '18154*', '14', '5', '20', ''),
(4653, '18163', '62fa20d5654bfb1dc7a088f62ca56998', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'PUTRI PATRICIA PATTISELANNO', '', 'sembunyikan', 'sembunyikan', '', '', '18163*', '14', '5', '21', ''),
(4654, '18165', '3283d8ebf5cd2679b346f819d5748240', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'RACHEL VIOLETTA STEPANIE', '', 'sembunyikan', 'sembunyikan', '', '', '18165*', '14', '5', '22', ''),
(4655, '18167', '09eef4c6bd5304b56479e18297bef2e7', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'RALLY DEWA MAULANA PARDI', '', 'sembunyikan', 'sembunyikan', '', '', '18167*', '14', '5', '23', ''),
(4656, '18171', '75a9822640c1159cc5415143bfc0728f', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REYNALDO ALVARES', '', 'sembunyikan', 'sembunyikan', '', '', '18171*', '14', '5', '24', ''),
(4657, '18177', '79850e7295b5db0c88ab25bcf77d75d9', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'RICHARD STEVEN BIANTORO', '', 'sembunyikan', 'sembunyikan', '', '', '18177*', '14', '5', '25', ''),
(4658, '18180', '49f45af4ffd37bc4aa74b45de21fc2f8', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'RIO ALVIN WIJAYA', '', 'sembunyikan', 'sembunyikan', '', '', '18180*', '14', '5', '26', ''),
(4659, '18185', '1ae4101839ac9e9531c1328187ea8452', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'RUBBEN LEONARDO KRISTANTO', '', 'sembunyikan', 'sembunyikan', '', '', '18185*', '14', '5', '27', ''),
(4660, '18187', '8e5216bba31f934a24b92c13406b2ee9', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'SCHATO VALENCIO SANBUDHI', '', 'sembunyikan', 'sembunyikan', '', '', '18187*', '14', '5', '28', ''),
(4661, '18193', '3cd81d19cf87b34e160afa7d60e91431', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'SHINTA VELINDA LUKITO', '', 'sembunyikan', 'sembunyikan', '', '', '18193*', '14', '5', '29', ''),
(4662, '18204', '9a55cda52adbec7e0fe447c92492fef6', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'THERESIA DWI PUTRIANI HANDOKO', '', 'sembunyikan', 'sembunyikan', '', '', '18204*', '14', '5', '30', ''),
(4663, '18216', 'b8c299ad9b79564eaf4124e502ab25e9', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'VICKY GIOVANNI SUMAYOUW', '', 'sembunyikan', 'sembunyikan', '', '', '18216*', '14', '5', '31', ''),
(4664, '18220', '8214cbcfdfc35ad8c67634390a008746', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'VINCENT WIJAYA', '', 'sembunyikan', 'sembunyikan', '', '', '18220*', '14', '5', '32', ''),
(4665, '18225', 'aee930834a05595c5425d6349fa0bb90', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'VIOLENA', '', 'sembunyikan', 'sembunyikan', '', '', '18225*', '14', '5', '33', ''),
(4666, '18226', '7d3cbc7209b4be267170973929ece204', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'VIONA PATRICIA', '', 'sembunyikan', 'sembunyikan', '', '', '18226*', '14', '5', '34', ''),
(4667, '17935', '2f599fc5570ddf6cf3620ca660c7132c', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ALEXANDER VINCENT SANTOSO', '', 'sembunyikan', 'sembunyikan', '', '', '17935*', '14', '6', '1', ''),
(4668, '17943', 'e3445c67739e46c56f4d9bb27737d52d', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ANASTHACIA CAROLINE ANTONNIETTA NAOMI TEDJAKUSUMA', '', 'sembunyikan', 'sembunyikan', '', '', '17943*', '14', '6', '2', ''),
(4669, '17965', '038089feedadef442987c8946ec9b880', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'BERNEDEXTUS EGBERT WINARDO', '', 'sembunyikan', 'sembunyikan', '', '', '17965*', '14', '6', '3', ''),
(4670, '17968', 'c5d2a892f65c6c482c141685e3b5725a', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'BRIAN SAMUEL STIADI', '', 'sembunyikan', 'sembunyikan', '', '', '17968*', '14', '6', '4', ''),
(4671, '17970', 'e4672f69d62f1265132be41a82b3e14b', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'BRYAN DANNI SETIAWAN', '', 'sembunyikan', 'sembunyikan', '', '', '17970*', '14', '6', '5', ''),
(4672, '17978', '90e02f94f8b3d9960c8bbc26ee3b5262', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'CARVIN ALDIANO', '', 'sembunyikan', 'sembunyikan', '', '', '17978*', '14', '6', '6', ''),
(4673, '17980', '0b76207ffbe8be499dacd9a263bfdffa', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'CECILIA', '', 'sembunyikan', 'sembunyikan', '', '', '17980*', '14', '6', '7', ''),
(4674, '17981', 'd9e7cc9fe8d1a0e31bbb1a5b842237cb', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'CHANDRA ARUNG WIDADYA', '', 'sembunyikan', 'sembunyikan', '', '', '17981*', '14', '6', '8', ''),
(4675, '17982', '8898411b462663dcf3c5cb03626841ec', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'CHARLENE FRANSILIA', '', 'sembunyikan', 'sembunyikan', '', '', '17982*', '14', '6', '9', ''),
(4676, '17986', 'fab738cec6ee47f759401d394caf8303', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'CHRISTIAN CALVIN ANGGRIAWAN', '', 'sembunyikan', 'sembunyikan', '', '', '17986*', '14', '6', '10', ''),
(4677, '17992', 'a18258510dcd421e8aab6db6cad295ab', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'CHRISTOPHER DERIAN MARCELIN', '', 'sembunyikan', 'sembunyikan', '', '', '17992*', '14', '6', '11', ''),
(4678, '18001', 'c25cc0a69f3000bf8c34f73e1edfa38b', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'CORNELIUS ROVALDO JOHNNY', '', 'sembunyikan', 'sembunyikan', '', '', '18001*', '14', '6', '12', ''),
(4679, '18008', 'ae2673d39c5bacdd526587d50dec3429', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'DAVID HARTONO SALIMUN', '', 'sembunyikan', 'sembunyikan', '', '', '18008*', '14', '6', '13', ''),
(4680, '18019', 'ab55a852c73c7c320efcab0165e6f552', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'EDWIN AUDY PRAYITNO', '', 'sembunyikan', 'sembunyikan', '', '', '18019*', '14', '6', '14', ''),
(4681, '18024', 'cc1316e09560405dd32dcb40016dd1eb', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ERICA MERLINDA', '', 'sembunyikan', 'sembunyikan', '', '', '18024*', '14', '6', '15', ''),
(4682, '18031', '3455d83bc2fa12b0cbaec5c4eb82765c', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'FELIX TANUJAYA', '', 'sembunyikan', 'sembunyikan', '', '', '18031*', '14', '6', '16', ''),
(4683, '18042', 'e041ffe957a2ef5e44751f0d84fa0f62', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'FRISCA NATASYA TANNIA', '', 'sembunyikan', 'sembunyikan', '', '', '18042*', '14', '6', '17', ''),
(4684, '18045', '0adf65874d45be655c8a60037684d7a1', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'GABRIEL RONALDO DOPO', '', 'sembunyikan', 'sembunyikan', '', '', '18045*', '14', '6', '18', ''),
(4685, '18046', 'b88026015f2b898851280cba322faeeb', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'GABRIELLE VIOLETA THIONARTO', '', 'sembunyikan', 'sembunyikan', '', '', '18046*', '14', '6', '19', ''),
(4686, '18051', '4413d3333914880272706f4fc662f820', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'GOLDWIN HAROLD SUTIKNO', '', 'sembunyikan', 'sembunyikan', '', '', '18051*', '14', '6', '20', ''),
(4687, '18053', '7354d6aaf8fc555a5fcb5b5ef713e8f8', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'GRACIELLA RAINA CHRISTANTO', '', 'sembunyikan', 'sembunyikan', '', '', '18053*', '14', '6', '21', ''),
(4688, '18063', 'a138321132dafec488b5f94f39d107aa', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'IMELSIA JENNYFER ANGELICA', '', 'sembunyikan', 'sembunyikan', '', '', '18063*', '14', '6', '22', ''),
(4689, '18082', '21e4921133604d4017eefe8bb555016f', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'JESSICA EUGINIA LIYANTO', '', 'sembunyikan', 'sembunyikan', '', '', '18082*', '14', '6', '23', ''),
(4690, '18092', '3e3f0fbc927bab721367f8475f254212', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'JONATHAN', '', 'sembunyikan', 'sembunyikan', '', '', '18092*', '14', '6', '24', ''),
(4691, '18109', '9e3e7b367f2f6ba75da0d2af5e5ba0b0', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'KENNETH WIBISONO WANGKE', '', 'sembunyikan', 'sembunyikan', '', '', '18109*', '14', '6', '25', '');
INSERT INTO `useraura` (`UserId`, `user`, `password`, `level`, `tipe`, `is_online`, `last_ping`, `start`, `exp`, `nama`, `photo`, `statusemail`, `statustelp`, `email`, `telp`, `password2`, `tahunajaran`, `kelas`, `absen`, `urutan`) VALUES
(4692, '18119', '09b293a4d61117b5f4da5dad3045eb5c', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIEVIA JANUARITA WENNY', '', 'sembunyikan', 'sembunyikan', '', '', '18119*', '14', '6', '26', ''),
(4693, '18120', '4a07b2e27893c84097c03430a52fe3cc', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIONI OLIVIA', '', 'sembunyikan', 'sembunyikan', '', '', '18120*', '14', '6', '27', ''),
(4694, '18123', '284c0a012056e735554cfe2932274954', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Marcellinus Yongkie Oentoro', '', 'sembunyikan', 'sembunyikan', '', '', '18123*', '14', '6', '28', ''),
(4695, '18152', '5bdb41254a6e13f7e5b8334f5a60504f', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'OKTANIA DEWI KIARTO', '', 'sembunyikan', 'sembunyikan', '', '', '18152*', '14', '6', '29', ''),
(4696, '18160', '1eb30c217a8661ec8d7d596779fd81e1', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'PRECYLIA WIETANTO', '', 'sembunyikan', 'sembunyikan', '', '', '18160*', '14', '6', '30', ''),
(4697, '18192', '757a8a08f3dd64c8bdc6fa18ee501486', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'SHANE PATRICK THERUTTY', '', 'sembunyikan', 'sembunyikan', '', '', '18192*', '14', '6', '31', ''),
(4698, '18195', '8dd1855067840713066d8576f25c14cc', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'STEFANUS', '', 'sembunyikan', 'sembunyikan', '', '', '18195*', '14', '6', '32', ''),
(4699, '18197', '6d5f4e2510031ab7b15256d102e14137', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'STEVEN JONATHAN', '', 'sembunyikan', 'sembunyikan', '', '', '18197*', '14', '6', '33', ''),
(4700, '18202', 'db58cdb7cfe06f6f58a0379fa2c39e93', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'TANIA IRA CARISSA', '', 'sembunyikan', 'sembunyikan', '', '', '18202*', '14', '6', '34', ''),
(4701, '18203', 'dccc1966c31f64fb32fe5995f22dcfd1', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'TANU ERWYN SUNYOTO', '', 'sembunyikan', 'sembunyikan', '', '', '18203*', '14', '6', '35', ''),
(4702, '18208', '657b256b9bce9b25812363ff66d6c1ae', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'VALENTIUS RONALDO ARIF', '', 'sembunyikan', 'sembunyikan', '', '', '18208*', '14', '6', '36', ''),
(4703, '18210', 'c7b2dbba7c121f5103702d29d13c8023', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'VANESSA CAITLIN WIRATAMA', '', 'sembunyikan', 'sembunyikan', '', '', '18210*', '14', '6', '37', ''),
(4704, '18227', 'cffc2e09609a1c88c89ccebd51f9fad6', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'VIVICA TABITHA WAHYU FEBRIAN', '', 'sembunyikan', 'sembunyikan', '', '', '18227*', '14', '6', '38', ''),
(4705, '17939', 'a3f2d2f182cc594f519c15275908cc88', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ALVIN WINARDIARTA', '', 'sembunyikan', 'sembunyikan', '', '', '17939*', '14', '7', '1', ''),
(4706, '17955', '2cab4f9cfcf314ce84057d79ee4844b2', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ashley Juliet', '', 'sembunyikan', 'sembunyikan', '', '', '17955*', '14', '7', '2', ''),
(4707, '17959', '370f772fe31fd177d9eb976ede8cad5b', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'AURELIA OCTAVIANI PRIYANTO', '', 'sembunyikan', 'sembunyikan', '', '', '17959*', '14', '7', '3', ''),
(4708, '17964', '7fc80d447b8b31477771151d99b9dcc0', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'BERLIAN NOVA KOESUMA', '', 'sembunyikan', 'sembunyikan', '', '', '17964*', '14', '7', '4', ''),
(4709, '17976', 'a447088324956581a4fbed7a0725fa35', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'CARISSA ERIKA', '', 'sembunyikan', 'sembunyikan', '', '', '17976*', '14', '7', '5', ''),
(4710, '17979', '802756408804e6d28752bdc64efd6979', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'CATHLIN CELESTA SIANTO', '', 'sembunyikan', 'sembunyikan', '', '', '17979*', '14', '7', '6', ''),
(4711, '17985', '74597928a18d63bf792d71fa8220c79d', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'CHERYL EVANLIE', '', 'sembunyikan', 'sembunyikan', '', '', '17985*', '14', '7', '7', ''),
(4712, '17989', '51bedebb6dee68c9e9cbfa61dc2f2cb5', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'CHRISTIAN THEOFILUS', '', 'sembunyikan', 'sembunyikan', '', '', '17989*', '14', '7', '8', ''),
(4713, '17994', '48ffc2fada994b768c92c0fff2881d73', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'CHRISTOPHER MATTHEW SUGIARTO', '', 'sembunyikan', 'sembunyikan', '', '', '17994*', '14', '7', '9', ''),
(4714, '17998', 'd58c354d7d2d729737d63893bc623ede', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'CINDY YESICA', '', 'sembunyikan', 'sembunyikan', '', '', '17998*', '14', '7', '10', ''),
(4715, '17999', '56e438e719719c30d070a656e6d90dce', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'CLAIRINE', '', 'sembunyikan', 'sembunyikan', '', '', '17999*', '14', '7', '11', ''),
(4716, '18003', '526861e16fd985d790bbd9107299b9d4', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'CYNTHIA SENTOSA', '', 'sembunyikan', 'sembunyikan', '', '', '18003*', '14', '7', '12', ''),
(4717, '18028', '3b45cb699a9e0488d514874f0a17654c', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'F. FERDINAND YODAWIJAYA', '', 'sembunyikan', 'sembunyikan', '', '', '18028*', '14', '7', '13', ''),
(4718, '18036', 'a3a143fa574ea223dabdfa647bcedc23', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'FLORENSIA ADARA PUTRI BESTARI', '', 'sembunyikan', 'sembunyikan', '', '', '18036*', '14', '7', '14', ''),
(4719, '18037', '76435d3e5af707b184ea20a56eeed943', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'FLORENSIA CATHERINE ANGYANI', '', 'sembunyikan', 'sembunyikan', '', '', '18037*', '14', '7', '15', ''),
(4720, '18060', 'b4ff1142ee1abfc982dc8637aae3224f', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'HIZKIA TYRONE SANDERS LUNTUNGAN', '', 'sembunyikan', 'sembunyikan', '', '', '18060*', '14', '7', '16', ''),
(4721, '18072', '067a258aaae230b295ab88e37e059908', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'JEANICE CECILIA SETIAWAN', '', 'sembunyikan', 'sembunyikan', '', '', '18072*', '14', '7', '17', ''),
(4722, '18074', 'bf2a859258b9c913e74805a2ef4aaeee', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'JEANNETE GUNADI', '', 'sembunyikan', 'sembunyikan', '', '', '18074*', '14', '7', '18', ''),
(4723, '18081', '79cc95e72f1e5e4848da6bf89f88df86', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'JESSICA AUDREY OCTAVIA SAPUTRA', '', 'sembunyikan', 'sembunyikan', '', '', '18081*', '14', '7', '19', ''),
(4724, '18085', '99eb7527d7422c73e235539ffafee6d1', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'JESSICA HANURANDA SUTANTO', '', 'sembunyikan', 'sembunyikan', '', '', '18085*', '14', '7', '20', ''),
(4725, '18090', '8aa931e8dea01ec01547976b678ebaeb', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'JOHANES', '', 'sembunyikan', 'sembunyikan', '', '', '18090*', '14', '7', '21', ''),
(4726, '18098', '163e06fb7af879cba04212ff0d381f5f', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'JOVANO WU', '', 'sembunyikan', 'sembunyikan', '', '', '18098*', '14', '7', '22', ''),
(4727, '18100', '978c98b8ade958a3b6e353fa69438e54', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'JUAN ARNO', '', 'sembunyikan', 'sembunyikan', '', '', '18100*', '14', '7', '23', ''),
(4728, '18116', 'd01c4bbd0b11eba7b82d432dc0668c7d', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LEANDRO MICKHAEL S', '', 'sembunyikan', 'sembunyikan', '', '', '18116*', '14', '7', '24', ''),
(4729, '18129', '1e640b4aceb557f333d51802eb9daafa', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'MARLIN MANUELA MULYADI', '', 'sembunyikan', 'sembunyikan', '', '', '18129*', '14', '7', '25', ''),
(4730, '18133', '770f4713aec67fadcf3ddfc7efd9ea08', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'MELLISA INDAH PRATIWI', '', 'sembunyikan', 'sembunyikan', '', '', '18133*', '14', '7', '26', ''),
(4731, '18142', 'f464bd4836a6cb9c5a2533da9ca3b215', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'MUHAMMAD BRYANKING KUSUMA', '', 'sembunyikan', 'sembunyikan', '', '', '18142*', '14', '7', '27', ''),
(4732, '18156', 'c0b4b2dc696a4df207b8b82ec31165d8', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'PEDRO HARDI KUSUMA', '', 'sembunyikan', 'sembunyikan', '', '', '18156*', '14', '7', '28', ''),
(4733, '18173', 'f18d360251965edb2a8c3dc8d43ec8fb', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REYNALDUS DAVITO TULASI', '', 'sembunyikan', 'sembunyikan', '', '', '18173*', '14', '7', '29', ''),
(4734, '18196', '3e4b4422a251cff539a09a69f93241e8', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'STEVEN HARTONO', '', 'sembunyikan', 'sembunyikan', '', '', '18196*', '14', '7', '30', ''),
(4735, '18199', 'da658dd4d88cb891bd313e0452bb65ae', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'STEVEN NATANAEL HERMANTO', '', 'sembunyikan', 'sembunyikan', '', '', '18199*', '14', '7', '31', ''),
(4736, '18207', '3dc2933b78234c15b880835f51993f36', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'TONY ERWANTO', '', 'sembunyikan', 'sembunyikan', '', '', '18207*', '14', '7', '32', ''),
(4737, '18221', 'cc3b8b066dd209de567844199d27f060', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'VINCENT WIJAYA PUTRA', '', 'sembunyikan', 'sembunyikan', '', '', '18221*', '14', '7', '33', ''),
(4738, '18224', '681a32a37f678b09daaa63f7c97bf7ea', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'VINCENTIUS RAINALDY ARIF', '', 'sembunyikan', 'sembunyikan', '', '', '18224*', '14', '7', '34', ''),
(4739, '18228', '01fecb80e798c7b30c7766144f5c8e77', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'WELUN CHANDRA GARETMA', '', 'sembunyikan', 'sembunyikan', '', '', '18228*', '14', '7', '35', ''),
(4740, '18229', 'b31dad44993155ed822fefbbd6f10797', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'WILLY HARTADI', '', 'sembunyikan', 'sembunyikan', '', '', '18229*', '14', '7', '36', ''),
(4741, '18231', 'b01f2caa3e43758af341c2ff1894859f', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'WILSON TAKHTA', '', 'sembunyikan', 'sembunyikan', '', '', '18231*', '14', '7', '37', ''),
(4742, '18233', '18efb024fdac8ae576d05e01e804cda8', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'YOHANA DEBRINA ANGELA', '', 'sembunyikan', 'sembunyikan', '', '', '18233*', '14', '7', '38', ''),
(5642, '18201', 'e4fc6f4d38a75848996c0d47938681a8', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'SUSAN JAYA WITAMA', '', 'sembunyikan', 'sembunyikan', '', '', '18201*', '14', '1', '34', ''),
(5643, '17933', '4c471455658335152fc5f8ca66ca3f14', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ALBERTUS MARCO PENOLLA RUSLIE', '', 'sembunyikan', 'sembunyikan', '', '', '17933*', '14', '2', '1', ''),
(5641, '18200', 'a16325fdeda85af05cbf6cf173c28b53', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'MARIA CECILIA SURYADINATA', '', 'sembunyikan', 'sembunyikan', '', '', '18200*', '14', '1', '33', ''),
(5640, '18198', 'e8afa9b7335506991edebe36cb491e63', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'STEVEN MULYA TJENDRATAMA', '', 'sembunyikan', 'sembunyikan', '', '', '18198*', '14', '1', '32', ''),
(5639, '18182', 'bc037b5f82fb60287e9752701ea8ca4f', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'RIZKI YULIANSYAH PRASETYONO', '', 'sembunyikan', 'sembunyikan', '', '', '18182*', '14', '1', '31', ''),
(5638, '18159', '10e6a8d44000aa54c64f7d11e7ba0675', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'PRANAYA ADITYA BHANU BESARIYANTO', '', 'sembunyikan', 'sembunyikan', '', '', '18159*', '14', '1', '30', ''),
(5636, '18137', '3c057d30f17d6ce842f728e5becb1f8c', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'MICHELLE FLORENSIA EFENDY', '', 'sembunyikan', 'sembunyikan', '', '', '18137*', '14', '1', '28', ''),
(5637, '18157', '0595360ec71c238f67874010195fb77c', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'PHILIP GEORGE SUSANTO', '', 'sembunyikan', 'sembunyikan', '', '', '18157*', '14', '1', '29', ''),
(5635, '18130', 'a6ab15e42d05b01d6c5dc77f941f2573', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'MARVELLIN PUTRI ANTONIUS', '', 'sembunyikan', 'sembunyikan', '', '', '18130*', '14', '1', '27', ''),
(5634, '18127', 'bda585a0b9ac36872aea82d0f5099af9', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'MARIA CLAUDIA SUNUR', '', 'sembunyikan', 'sembunyikan', '', '', '18127*', '14', '1', '26', ''),
(5632, '18110', 'dab9d637f478573ea461aecd7581867b', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'KEVIN', '', 'sembunyikan', 'sembunyikan', '', '', '18110*', '14', '1', '24', ''),
(5633, '18117', '6692c8d64f6236f0cc3764ded0a97af2', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LETETIA EUGINIA THEA ANDARIA', '', 'sembunyikan', 'sembunyikan', '', '', '18117*', '14', '1', '25', ''),
(5631, '18107', 'c48442952e7c4ab5fd245a25dac93eb1', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'KELVIN JOSEPH HARTANTO LAPIAN', '', 'sembunyikan', 'sembunyikan', '', '', '18107*', '14', '1', '23', ''),
(5630, '18104', '9946b5ceae1710d6ac8d87ef5ac44097', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'KANAYA ANGELIQUE GUNAWAN', '', 'sembunyikan', 'sembunyikan', '', '', '18104*', '14', '1', '22', ''),
(5629, '18093', '8ad0cac2fbf0ff529e1600f347d77b58', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'JONATHAN EDWARD SURYA HADI', '', 'sembunyikan', 'sembunyikan', '', '', '18093*', '14', '1', '21', ''),
(5628, '18069', '522af0786566299296c70fd7472922c9', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'IVANDER BERWYN WIJAYA', '', 'sembunyikan', 'sembunyikan', '', '', '18069*', '14', '1', '20', ''),
(5627, '18068', 'da004335e3df67feacfaf5efcf8570a9', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'IVANA MARCELIA TANWIJAYA', '', 'sembunyikan', 'sembunyikan', '', '', '18068*', '14', '1', '19', ''),
(5626, '18057', '434c898c76d6b7e174a25f9cc4063427', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'HANSEN WIJAYA', '', 'sembunyikan', 'sembunyikan', '', '', '18057*', '14', '1', '18', ''),
(5625, '18052', 'b43dab771a6d63fa95c308fbe602f5f4', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'GRACE MAUREN FABIOLA', '', 'sembunyikan', 'sembunyikan', '', '', '18052*', '14', '1', '17', ''),
(5624, '18041', '1653fb7a503864cd2984a02ab26dccc9', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'FRENCY IMANUEL', '', 'sembunyikan', 'sembunyikan', '', '', '18041*', '14', '1', '16', ''),
(5622, '18026', 'cc0f2edc51792c32967b9044c114372b', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'EUGENE', '', 'sembunyikan', 'sembunyikan', '', '', '18026*', '14', '1', '14', ''),
(5623, '18029', '53c9b93f4316251c548c9e6a2eeae21a', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'FEBRIANTO NUR HADITJAHJONO', '', 'sembunyikan', 'sembunyikan', '', '', '18029*', '14', '1', '15', ''),
(5620, '18011', '14cc5f2696041f44b554b0879ead39d3', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'DEVERREL RYANVIANDA', '', 'sembunyikan', 'sembunyikan', '', '', '18011*', '14', '1', '12', ''),
(5621, '18016', '77231e6ad7c6a0fdeac5c8d32c7cc377', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'DONY WIJAYA', '', 'sembunyikan', 'sembunyikan', '', '', '18016*', '14', '1', '13', ''),
(5619, '18006', '779e401ea08f4e94be83a77c0ddbbda7', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'DANIEL PRIYOADI NUGROHO', '', 'sembunyikan', 'sembunyikan', '', '', '18006*', '14', '1', '11', ''),
(5518, '18234', '6f381084d41f0da6eb2fb78cb62025fa', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'YURIKO GRACIA NISHIMORI', '', 'sembunyikan', 'sembunyikan', '', '', '18234*', '14', '3', '34', ''),
(5517, '18232', '39070e3ff298a9219470c3e703b3f5ac', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'YOHAN TANDRA WIJAYA', '', 'sembunyikan', 'sembunyikan', '', '', '18232*', '14', '3', '33', ''),
(5516, '18211', '20c705ca1f70af0b7e44e86cb7b7b6d6', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'VANESSA HANDAYANI', '', 'sembunyikan', 'sembunyikan', '', '', '18211*', '14', '3', '32', ''),
(5515, '18188', '08491391cac83ad2e6fc266ce52f3d61', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'SEAN MICHAEL YULIANADI SUSANTO', '', 'sembunyikan', 'sembunyikan', '', '', '18188*', '14', '3', '31', ''),
(5514, '18184', 'a5afff7af43742fe6a6f39e9dd4d425d', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'RONALD KRISNAYODI', '', 'sembunyikan', 'sembunyikan', '', '', '18184*', '14', '3', '30', ''),
(5662, '18114', 'b544c297daaf46e8867d4604f1901840', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LAURENSIUS BRIAN', '', 'sembunyikan', 'sembunyikan', '', '', '18114*', '14', '2', '20', ''),
(5661, '18106', '810ff9f772a2bca227b03bd98c20ae0b', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'KELLY GRAYSEN RAHARJO', '', 'sembunyikan', 'sembunyikan', '', '', '18106*', '14', '2', '19', ''),
(5659, '18061', '13dcaaf06554c2897e74329f9575ddb2', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'HUGO', '', 'sembunyikan', 'sembunyikan', '', '', '18061*', '14', '2', '17', ''),
(5660, '18079', '7c612baa833f8b7ded405764ff06b46b', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'JESSICA', '', 'sembunyikan', 'sembunyikan', '', '', '18079*', '14', '2', '18', ''),
(5657, '18047', 'd80bf3024d4358d60138554f51a0ef78', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'GEORGE OWEN ERITAM', '', 'sembunyikan', 'sembunyikan', '', '', '18047*', '14', '2', '15', ''),
(5658, '18056', '2d045af6ba6bb16e9a02a1705feaf5ad', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'HANS MARTIN TANAEM', '', 'sembunyikan', 'sembunyikan', '', '', '18056*', '14', '2', '16', ''),
(5653, '18013', 'b9e6bf45c6badc41806e35dcfe66585b', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'DIONISIUS ARDIAN', '', 'sembunyikan', 'sembunyikan', '', '', '18013*', '14', '2', '11', ''),
(5654, '18014', '6321f2837b3c816960eaabd5ddc86d9c', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'DOMINIC DYLAN', '', 'sembunyikan', 'sembunyikan', '', '', '18014*', '14', '2', '12', ''),
(5655, '18018', '81cbe768b5464c492c4a5c04c63a55dd', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'EDWARD HIROSHI', '', 'sembunyikan', 'sembunyikan', '', '', '18018*', '14', '2', '13', ''),
(4801, '17651', 'ad596d458df50070018a60627062d698', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Alexander Christian Jibran', '', 'sembunyikan', 'sembunyikan', '', '', '17651*', '14', '10', '1', ''),
(4802, '17678', '26e73627b94e2d3f7a5afc736509b8d8', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Aubrey Fiorentia Hokgiono', '', 'sembunyikan', 'sembunyikan', '', '', '17678*', '14', '10', '2', ''),
(4803, '17679', 'ddb774dbbcf0f2060a5ea01421d9a762', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'AUDI JUNITA OLIVIA', '', 'sembunyikan', 'sembunyikan', '', '', '17679*', '14', '10', '3', ''),
(4804, '17700', '111b05e07826b21dea605565c2c326d7', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'GISELLA CLARISSA', '', 'sembunyikan', 'sembunyikan', '', '', '17700*', '14', '10', '4', ''),
(4805, '17705', '0ca9f85405f3527ae157e0090e109ef2', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'DENNIS CHANDRA', '', 'sembunyikan', 'sembunyikan', '', '', '17705*', '14', '10', '5', ''),
(4806, '17708', '9404d9440adcdc2a44dea2d337daef99', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Dionisius Hoshiko Bryan Santoso', '', 'sembunyikan', 'sembunyikan', '', '', '17708*', '14', '10', '6', ''),
(4807, '17717', '6efbec3a7b963e67d779ab717ff3a07a', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Falentina Ifoni Seran', '', 'sembunyikan', 'sembunyikan', '', '', '17717*', '14', '10', '7', ''),
(4808, '17726', 'ab0bec2ecd31de58194be9dbdb0e03ce', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Felicia Natakusuma', '', 'sembunyikan', 'sembunyikan', '', '', '17726*', '14', '10', '8', ''),
(4809, '17744', '20ad8e36bd9166a56e578c6f19f0855b', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Gabriel Julio Caesar', '', 'sembunyikan', 'sembunyikan', '', '', '17744*', '14', '10', '9', ''),
(4810, '17751', '761ca330cb24c6a963aacee19a55c378', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Gracia Florentina Denise Gunardi', '', 'sembunyikan', 'sembunyikan', '', '', '17751*', '14', '10', '10', ''),
(4811, '17753', '21ee029a797a8200c1543c5f0c126fed', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'GUNAWAN', '', 'sembunyikan', 'sembunyikan', '', '', '17753*', '14', '10', '11', ''),
(4812, '17764', '9e065f1518c3040f4a2c708d29716df8', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Isabella Charmelitamuis Lamanepa', '', 'sembunyikan', 'sembunyikan', '', '', '17764*', '14', '10', '12', ''),
(4813, '17766', '8bb0442a15b44d2dd906182a875146c0', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'IVENA SUNYOTO', '', 'sembunyikan', 'sembunyikan', '', '', '17766*', '14', '10', '13', ''),
(4814, '17771', 'fb019f8e585603b8b2725459c32993a3', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jason Yapranata', '', 'sembunyikan', 'sembunyikan', '', '', '17771*', '14', '10', '14', ''),
(4815, '17774', '3e418d51b266a3ab10f73aca894c4b29', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jerry Kantona T.', '', 'sembunyikan', 'sembunyikan', '', '', '17774*', '14', '10', '15', ''),
(4816, '17779', '699aa9f2ae92fdecd8eb88df807da7ad', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'JOERDY SIM', '', 'sembunyikan', 'sembunyikan', '', '', '17779*', '14', '10', '16', ''),
(4817, '17788', '0dc8a7a9f4c4e520efa094db6a5ea03e', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Kariszha Serafin', '', 'sembunyikan', 'sembunyikan', '', '', '17788*', '14', '10', '17', ''),
(4818, '17810', 'cf1c536c5b9c1dee8cc4b56dfd13eff3', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Marcelino Kevin Yonatan', '', 'sembunyikan', 'sembunyikan', '', '', '17810*', '14', '10', '18', ''),
(4819, '17817', 'dd69bc9891c852267080d218b4ad69f5', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'MARIA IRENE PUTRI TUMBILUNG', '', 'sembunyikan', 'sembunyikan', '', '', '17817*', '14', '10', '19', ''),
(4820, '17835', '67d84915dd55c036792fbf4921be795c', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Michelle Ivana Susilo', '', 'sembunyikan', 'sembunyikan', '', '', '17835*', '14', '10', '20', ''),
(4821, '17845', '34378983d13fcd3476a5afc4b2083344', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Nathanael Hadi Jaya', '', 'sembunyikan', 'sembunyikan', '', '', '17845*', '14', '10', '21', ''),
(4822, '17847', 'b5a32ade04d3753c11a20f55ceb1d166', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Nathania Oetomo', '', 'sembunyikan', 'sembunyikan', '', '', '17847*', '14', '10', '22', ''),
(4823, '17853', 'f5f430cd9840fa61bfcb85616d14bee9', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Nicolas Valentino Fonda', '', 'sembunyikan', 'sembunyikan', '', '', '17853*', '14', '10', '23', ''),
(4824, '17861', '0428f666ff93c3f7a95a033a476d365f', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'PATRICIA SANNI YONG', '', 'sembunyikan', 'sembunyikan', '', '', '17861*', '14', '10', '24', ''),
(4825, '17871', '4a60adef30137053c576a8f175b696b7', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Rosario Cahyaningtias Baene', '', 'sembunyikan', 'sembunyikan', '', '', '17871*', '14', '10', '25', ''),
(4826, '17872', '7bb5b10f19bd6731407cc4e6d418e7cd', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Samuel Ferdinan Layantara', '', 'sembunyikan', 'sembunyikan', '', '', '17872*', '14', '10', '26', ''),
(4827, '17873', '84e52dfe2ad56cdb395c05fd9c22e06a', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Selig Rafael Prajogo', '', 'sembunyikan', 'sembunyikan', '', '', '17873*', '14', '10', '27', ''),
(4828, '17883', '2de8fd7040a8749f8f1177da3573b9ad', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Stefanie Hanna Tjahjadi', '', 'sembunyikan', 'sembunyikan', '', '', '17883*', '14', '10', '28', ''),
(4829, '17897', 'c762225040709ca9bae81f6d17571071', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Timothy Krisnadi', '', 'sembunyikan', 'sembunyikan', '', '', '17897*', '14', '10', '29', ''),
(4830, '17900', '92bcc25f43474aaa8fa6517529abbeb6', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Valensia Merry Alverina', '', 'sembunyikan', 'sembunyikan', '', '', '17900*', '14', '10', '30', ''),
(4831, '17912', '4ec91d625625d81c6bfd26c95ef3c448', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Vio Alvonso Argentino', '', 'sembunyikan', 'sembunyikan', '', '', '17912*', '14', '10', '31', ''),
(4832, '17914', 'aa3044e0e811ab56efa50fd789419322', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Virginia Lorenza', '', 'sembunyikan', 'sembunyikan', '', '', '17914*', '14', '10', '32', ''),
(4833, '17650', '87f3e644c70b8cc25e687ea36361fb0c', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Alexander Agung', '', 'sembunyikan', 'sembunyikan', '', '', '17650*', '14', '11', '1', ''),
(4834, '17672', '17845fda888049f71e0bf42a6195f18e', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Anno Eduardo Wuwung', '', 'sembunyikan', 'sembunyikan', '', '', '17672*', '14', '11', '2', ''),
(4835, '17682', '975636fecb79ab5c6265290eeb785b59', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Audrey Ratnawulan Shabilla', '', 'sembunyikan', 'sembunyikan', '', '', '17682*', '14', '11', '3', ''),
(4836, '17694', '31d9aefdc6f4764f756c5d48ced535f0', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Chandra Steven Harley', '', 'sembunyikan', 'sembunyikan', '', '', '17694*', '14', '11', '4', ''),
(4837, '17706', '02ea84689f295f37597d42a90a2e6ebc', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Dewi Agustina Putri Tanaga', '', 'sembunyikan', 'sembunyikan', '', '', '17706*', '14', '11', '5', ''),
(4838, '17709', '2270816d786b7d4df904936299549efa', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'DUSTIN RICHARDO', '', 'sembunyikan', 'sembunyikan', '', '', '17709*', '14', '11', '6', ''),
(4839, '17725', '0825699cd463ddae953c1d95609ab556', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Felicia Angeline Halim', '', 'sembunyikan', 'sembunyikan', '', '', '17725*', '14', '11', '7', ''),
(4840, '17732', 'd5e02ca0006d3afa78be86f98d122a7e', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Felix Mulia', '', 'sembunyikan', 'sembunyikan', '', '', '17732*', '14', '11', '8', ''),
(4841, '17737', 'c7bb5652a7c718f4decd12a4b4a096b2', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'FIALDI WAHYUDI', '', 'sembunyikan', 'sembunyikan', '', '', '17737*', '14', '11', '9', ''),
(4842, '17756', '85c51a003da4c493139e10897168297f', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Hansen Valentino', '', 'sembunyikan', 'sembunyikan', '', '', '17756*', '14', '11', '10', ''),
(4843, '17777', '8c9a1476055ffdbb09889db88e3be834', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jody Prasetyo', '', 'sembunyikan', 'sembunyikan', '', '', '17777*', '14', '11', '11', ''),
(4844, '17803', '56f955b05acac0886ef46de2d0c6d3f2', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LEONY RUSTANDY', '', 'sembunyikan', 'sembunyikan', '', '', '17803*', '14', '11', '12', ''),
(4845, '17808', 'adfe266d341ff82168912b1da1c52290', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Made Dwieka Octamevia', '', 'sembunyikan', 'sembunyikan', '', '', '17808*', '14', '11', '13', ''),
(4846, '17814', '95b4c476b436c3314dc9113d660f9302', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Maria Angelita Karenina Djaminta', '', 'sembunyikan', 'sembunyikan', '', '', '17814*', '14', '11', '14', ''),
(4847, '17829', 'c820742d7fcda9e40860ae1f339b65ec', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'MICHAEL MARCELLINO ARELLA', '', 'sembunyikan', 'sembunyikan', '', '', '17829*', '14', '11', '15', ''),
(4848, '17832', '3cdc507205127e7b502bad14b85234bc', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Michelle Annabelle Surya Atmaja', '', 'sembunyikan', 'sembunyikan', '', '', '17832*', '14', '11', '16', ''),
(4849, '17839', '0d995fb3aeb0d5b25821ffe9824537cb', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'MONICA HALIM', '', 'sembunyikan', 'sembunyikan', '', '', '17839*', '14', '11', '17', ''),
(4850, '17842', 'b87b5bdc98531cad3687c9bfe6b2d6a6', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Natalia Poernomo', '', 'sembunyikan', 'sembunyikan', '', '', '17842*', '14', '11', '18', ''),
(4851, '17844', 'bc6861d8075173444f55eecabbe0b1ec', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Natasya Octaviani Tjoeng', '', 'sembunyikan', 'sembunyikan', '', '', '17844*', '14', '11', '19', ''),
(4852, '17855', '344862eb9dfc7d91bc19b4a6fd4323d6', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'NIKKO DWI HERMAWAN', '', 'sembunyikan', 'sembunyikan', '', '', '17855*', '14', '11', '20', ''),
(4853, '17865', '76e6898426966df263d88fdb605a8a6f', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Philbertha Phedra', '', 'sembunyikan', 'sembunyikan', '', '', '17865*', '14', '11', '21', ''),
(4854, '17866', '9cacfebb7d2c9a8861b83deb6bc9b9ab', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Philipus Hendrawan', '', 'sembunyikan', 'sembunyikan', '', '', '17866*', '14', '11', '22', ''),
(4855, '17875', 'a0783dc6516cfcaa8df801a706694eef', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Shelly Jocelyn Christina', '', 'sembunyikan', 'sembunyikan', '', '', '17875*', '14', '11', '23', ''),
(4856, '17877', 'ef85475bdd7f301d3054b7e2659c6297', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Sherina Suharto Jo', '', 'sembunyikan', 'sembunyikan', '', '', '17877*', '14', '11', '24', ''),
(4857, '17882', 'c3be2694a8540eaea5faace65ba539c2', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Stanley Bryan Kurniawan', '', 'sembunyikan', 'sembunyikan', '', '', '17882*', '14', '11', '25', ''),
(4858, '17885', '9f3774e0c144557a3decc0b8fcec083f', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Stepany Ellen Kurniawati', '', 'sembunyikan', 'sembunyikan', '', '', '17885*', '14', '11', '26', ''),
(4859, '17887', '7780f49cf4a38728d4c272b407389640', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Stephanus Christawan', '', 'sembunyikan', 'sembunyikan', '', '', '17887*', '14', '11', '27', ''),
(4860, '17890', '97ddf13eeb103c28aff9c7f02c722664', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Surya Bumantara', '', 'sembunyikan', 'sembunyikan', '', '', '17890*', '14', '11', '28', ''),
(4861, '17891', '068670546daea7baaa4d67a9992967b3', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Sylviana Geraldine', '', 'sembunyikan', 'sembunyikan', '', '', '17891*', '14', '11', '29', ''),
(4862, '17902', 'ce7c0ab49b30cb8a226eea66202ff060', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Vania Alvabella Wijaya', '', 'sembunyikan', 'sembunyikan', '', '', '17902*', '14', '11', '30', ''),
(4863, '17915', 'aac34f527412578d9a7133d8a1441a11', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Viriya Lorensia', '', 'sembunyikan', 'sembunyikan', '', '', '17915*', '14', '11', '31', ''),
(4864, '17790', 'c5cc9292579883d3ad567493b2084d7d', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Kelvin', '', 'sembunyikan', 'sembunyikan', '', '', '17790*', '14', '11', '32', ''),
(4865, '17645', 'ec60eea3df0b06d929778a32f615c664', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Advent Chandra Kurniawan', '', 'sembunyikan', 'sembunyikan', '', '', '17645*', '14', '13', '1', ''),
(4866, '17665', 'e7a740061bf78e991aa7d703e27f5a46', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Angelia', '', 'sembunyikan', 'sembunyikan', '', '', '17665*', '14', '13', '2', ''),
(4867, '17690', '6f87db037cae98c26ce475504bfb3c28', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Catherine Angel Putri Tandiawan', '', 'sembunyikan', 'sembunyikan', '', '', '17690*', '14', '13', '3', ''),
(4868, '17703', '7414ffaa2253e4617d878637d937c038', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Daniella Gloria Thresdy Wijaya', '', 'sembunyikan', 'sembunyikan', '', '', '17703*', '14', '13', '4', ''),
(4869, '17718', '9748b520162cef8dd8cfa8d258d303b1', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Farel Hansel Taner', '', 'sembunyikan', 'sembunyikan', '', '', '17718*', '14', '13', '5', ''),
(4870, '17721', 'a39a7341446efeb22805f9a4adaf50f9', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Febri', '', 'sembunyikan', 'sembunyikan', '', '', '17721*', '14', '13', '6', ''),
(4871, '17730', 'd32b5a90e893a302d6d93f478ea49518', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Felix Liman', '', 'sembunyikan', 'sembunyikan', '', '', '17730*', '14', '13', '7', ''),
(4872, '17738', 'e11a2b4a691bbaf3b28ae9d8a311f6ea', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Fidelia Christina', '', 'sembunyikan', 'sembunyikan', '', '', '17738*', '14', '13', '8', ''),
(4873, '17740', '58fa78482c8115dce6a8730cccc87c49', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Florensia Vivian The', '', 'sembunyikan', 'sembunyikan', '', '', '17740*', '14', '13', '9', ''),
(4874, '17750', 'f7696df45d11bb9eff52b759502d65c3', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Giselle Angelin', '', 'sembunyikan', 'sembunyikan', '', '', '17750*', '14', '13', '10', ''),
(4875, '17760', '0d0b189e5c3af427040e9d26d6f7b59b', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Imannuel Michraga Freando', '', 'sembunyikan', 'sembunyikan', '', '', '17760*', '14', '13', '11', ''),
(4876, '17763', 'fb80f1ebb8ddf23e9bd30b23d76cad6e', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Irwan Anggara Herman', '', 'sembunyikan', 'sembunyikan', '', '', '17763*', '14', '13', '12', ''),
(4877, '17773', '5d3b85a7de85f7fc7fa2f80032e45143', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jennifer Yauwnita', '', 'sembunyikan', 'sembunyikan', '', '', '17773*', '14', '13', '13', ''),
(4878, '17776', '5868470b5975055ad014da244d78600a', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Joan Cristopall', '', 'sembunyikan', 'sembunyikan', '', '', '17776*', '14', '13', '14', ''),
(4879, '17778', '6904798190dd80503266c31c8c28a3ed', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Joe Billy Agung Wibowo', '', 'sembunyikan', 'sembunyikan', '', '', '17778*', '14', '13', '15', ''),
(4880, '17791', '90be47d8a1f83d13282f96539e0fbaf0', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Kennard Fiorano', '', 'sembunyikan', 'sembunyikan', '', '', '17791*', '14', '13', '16', ''),
(4881, '17793', '2847de01069b591112fee090c2ceafa5', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Kevin', '', 'sembunyikan', 'sembunyikan', '', '', '17793*', '14', '13', '17', ''),
(4882, '17799', '47d178602858ff7ccb3ee7cf3931de46', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LAMBERTUS WINDY SAPUTRA', '', 'sembunyikan', 'sembunyikan', '', '', '17799*', '14', '13', '18', ''),
(4883, '17800', '993e09040a6e82b1c4c0cbed4339e585', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Laurentius Bima Anggoro', '', 'sembunyikan', 'sembunyikan', '', '', '17800*', '14', '13', '19', ''),
(4884, '17805', 'bf86dcf80b92e094357b0864cee63323', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Lidya Kristalia', '', 'sembunyikan', 'sembunyikan', '', '', '17805*', '14', '13', '20', ''),
(4885, '17809', '4f5b8bac8133ed431a6eec617d6a2ecc', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Marcelia Tifany Margo', '', 'sembunyikan', 'sembunyikan', '', '', '17809*', '14', '13', '21', ''),
(4886, '17836', 'f05019d5e7d7d04e238260492e2d3aeb', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'MICHELLE MARIA LINA MAKURODJA', '', 'sembunyikan', 'sembunyikan', '', '', '17836*', '14', '13', '22', ''),
(4887, '17837', '3074ab041dd27f4208155b42ef0ea925', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Mikhael', '', 'sembunyikan', 'sembunyikan', '', '', '17837*', '14', '13', '23', ''),
(4888, '17858', '8f3077b0ffd38c94e7f75cc758c8a66e', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Nugroho Pangestu Gunawan', '', 'sembunyikan', 'sembunyikan', '', '', '17858*', '14', '13', '24', ''),
(4889, '17860', 'c22d1b2e701a576191fd25a8d039a6ab', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Olivia Mettadewi Lindarto', '', 'sembunyikan', 'sembunyikan', '', '', '17860*', '14', '13', '25', ''),
(4890, '17881', '72353e53a82de3f34447b38639c2a4f9', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Skolastika Kezia', '', 'sembunyikan', 'sembunyikan', '', '', '17881*', '14', '13', '26', ''),
(4891, '17886', '9a5da150949e713e5d9dfc27421e67ba', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Stephanie Micheline Wongge', '', 'sembunyikan', 'sembunyikan', '', '', '17886*', '14', '13', '27', ''),
(4892, '17893', 'd9bb6da511b6b32b01cd26e6c435e10d', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Tesa Jessica', '', 'sembunyikan', 'sembunyikan', '', '', '17893*', '14', '13', '28', ''),
(4893, '17895', 'b2b1eac7fd9ca4c2c8718948de12dfd3', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Theresia Oliviya Sharoom', '', 'sembunyikan', 'sembunyikan', '', '', '17895*', '14', '13', '29', ''),
(4894, '17903', 'e9edfa649117c817dbe8b02e04567e38', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'VANIA CECILIA SUTANTO', '', 'sembunyikan', 'sembunyikan', '', '', '17903*', '14', '13', '30', ''),
(4895, '17907', '9701fadc3d922b9f173a96cdcff76553', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Elvina Fernanda', '', 'sembunyikan', 'sembunyikan', '', '', '17907*', '14', '13', '31', ''),
(4896, '17928', '396ac5cb10f0273562910b1c5938d797', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Yosafat Gary Tegar Harijono', '', 'sembunyikan', 'sembunyikan', '', '', '17928*', '14', '13', '32', ''),
(4897, '17648', 'bc5b71f6f8fcc83a678ebbba73fe3eb6', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Agustino Leo Sutanto', '', 'sembunyikan', 'sembunyikan', '', '', '17648*', '14', '14', '1', ''),
(4898, '17652', 'fd02ec742c9b7f57739919a67f3c5a1a', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Alexander Enrico Yohanes', '', 'sembunyikan', 'sembunyikan', '', '', '17652*', '14', '14', '2', ''),
(4899, '17656', '9490aa5ab8eeb3a21476c1c0ce5f1a5e', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Alvis Baran', '', 'sembunyikan', 'sembunyikan', '', '', '17656*', '14', '14', '3', ''),
(4900, '17658', 'ea4621bc0a3a81837a230245c1a53c11', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Andre', '', 'sembunyikan', 'sembunyikan', '', '', '17658*', '14', '14', '4', ''),
(4901, '17664', 'f1bbeb5c44141f7e32814e53c15935a0', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Angela Stephanie Yahono', '', 'sembunyikan', 'sembunyikan', '', '', '17664*', '14', '14', '5', ''),
(4902, '17667', 'c6244a948e512b043e3d3ad7d33aad18', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Angelina Mulyadewi Tjendratama', '', 'sembunyikan', 'sembunyikan', '', '', '17667*', '14', '14', '6', ''),
(4903, '17669', '5e8543265d3691225f0d1d94285de3fe', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Anita', '', 'sembunyikan', 'sembunyikan', '', '', '17669*', '14', '14', '7', ''),
(4904, '17689', 'c8bc75bc377216d3665891b3dc1495c4', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Bryant Septiyan Budiharjo', '', 'sembunyikan', 'sembunyikan', '', '', '17689*', '14', '14', '8', ''),
(4905, '17697', 'cab8419d4edb2dd8c264a842072bd1a6', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Cicely Indriyo', '', 'sembunyikan', 'sembunyikan', '', '', '17697*', '14', '14', '9', ''),
(4906, '17727', '155d364760e4e2374cd2f939f84bd538', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Felicia Natania', '', 'sembunyikan', 'sembunyikan', '', '', '17727*', '14', '14', '10', ''),
(4907, '17733', '15abbdfb2368e828f2e41423e5826347', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'FELYANA TANALIN', '', 'sembunyikan', 'sembunyikan', '', '', '17733*', '14', '14', '11', ''),
(4908, '17739', '41be611b79c0af8c8239b68f5871da67', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Florencia Irena', '', 'sembunyikan', 'sembunyikan', '', '', '17739*', '14', '14', '12', ''),
(4909, '17743', 'f8a44825a09b332e4218b1c93d3da719', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'F.X. MARIA BUDI CHRISTIYANTO', '', 'sembunyikan', 'sembunyikan', '', '', '17743*', '14', '14', '13', ''),
(4910, '17748', 'c50398b19442f93e8f66177ab3cfd171', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Geraldo Yosia Tuwoh', '', 'sembunyikan', 'sembunyikan', '', '', '17748*', '14', '14', '14', ''),
(4911, '17752', '236d19315b0f77a4be902313efeefbe6', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Graciela Stephanie', '', 'sembunyikan', 'sembunyikan', '', '', '17752*', '14', '14', '15', ''),
(4912, '17754', 'a9dfa26bb9dc1f7090b6b1883de8b431', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Hani Lesmana', '', 'sembunyikan', 'sembunyikan', '', '', '17754*', '14', '14', '16', ''),
(4913, '17775', '421671fa324614320dac563a6e8dd59b', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jessica Marbella Lianto', '', 'sembunyikan', 'sembunyikan', '', '', '17775*', '14', '14', '17', ''),
(4914, '17782', '7c827b8ff711002a1cfe295eb86c5502', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Joscelind Nathania', '', 'sembunyikan', 'sembunyikan', '', '', '17782*', '14', '14', '18', ''),
(4915, '17795', 'c6219c58a8c7c2f513f97554bc9fd8cf', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Kevin Nagano', '', 'sembunyikan', 'sembunyikan', '', '', '17795*', '14', '14', '19', ''),
(4916, '17796', '30348173512271f40c7332cd631ed88a', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Kezia Graceilla', '', 'sembunyikan', 'sembunyikan', '', '', '17796*', '14', '14', '20', ''),
(4917, '17824', '65dd5de69bd237149cd8149cfda294fc', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Melisa Tirto', '', 'sembunyikan', 'sembunyikan', '', '', '17824*', '14', '14', '21', ''),
(4918, '17828', '52b43c37d654ad18d1f26534052f449b', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Michael Joseph Konstantinus', '', 'sembunyikan', 'sembunyikan', '', '', '17828*', '14', '14', '22', ''),
(4919, '17838', 'c7643e52fe0c441a81ef740823c8dfa5', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'MOCH. RAMADHANA UTOMO', '', 'sembunyikan', 'sembunyikan', '', '', '17838*', '14', '14', '23', ''),
(4920, '17841', 'c1519263f66e03b795b5b96fb483dd15', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Monicha Septyagintha Br Sembiring', '', 'sembunyikan', 'sembunyikan', '', '', '17841*', '14', '14', '24', ''),
(4921, '17852', '25abf20f976363c479454d0c0d56408b', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Nicholas Denzel Sie', '', 'sembunyikan', 'sembunyikan', '', '', '17852*', '14', '14', '25', ''),
(4922, '17876', '144c67070e4955e267d50b8ba6139cd8', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'SHEREN', '', 'sembunyikan', 'sembunyikan', '', '', '17876*', '14', '14', '26', ''),
(4923, '17879', '0a3122a4a519358ddb11e5a8766c6227', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Sherry Trisya Horas', '', 'sembunyikan', 'sembunyikan', '', '', '17879*', '14', '14', '27', ''),
(4924, '17880', 'd8fc9367fa7ad71281d4bd3b249e88b7', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Skolastika Gabriella Theresandia Prasetyo', '', 'sembunyikan', 'sembunyikan', '', '', '17880*', '14', '14', '28', ''),
(4925, '17889', '6140821e236efca3a0b2178ffb81f38f', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Surya Amazona Tahoma Yeremia Situngkir', '', 'sembunyikan', 'sembunyikan', '', '', '17889*', '14', '14', '29', ''),
(4926, '17906', '6c8548b63214d24c1233eaf11e1a9866', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Veronica Nixie', '', 'sembunyikan', 'sembunyikan', '', '', '17906*', '14', '14', '30', ''),
(4927, '17918', '0ea8c6e2b0ad0aef99e8fb7dc639502b', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Wiliam Marcellino', '', 'sembunyikan', 'sembunyikan', '', '', '17918*', '14', '14', '31', ''),
(4928, '17919', '0979de53410675dbf6b0f4300921c563', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Williandy Takhta', '', 'sembunyikan', 'sembunyikan', '', '', '17919*', '14', '14', '32', ''),
(4929, '17924', '2f4c52025649efd58e299b561bd62836', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Yanuar Kristian', '', 'sembunyikan', 'sembunyikan', '', '', '17924*', '14', '14', '33', ''),
(4930, '17927', '701686742757147c1635130a12d9d413', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'YOLANDA ONGKOWIDJOJO', '', 'sembunyikan', 'sembunyikan', '', '', '17927*', '14', '14', '34', ''),
(4931, '17647', '9d49a0a1b4596866e4e5755b9cf569e4', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Agnes Cahyaning Rosari', '', 'sembunyikan', 'sembunyikan', '', '', '17647*', '14', '15', '1', ''),
(4932, '17653', '702ce9d4ba3374eba6d5f1eacdb9866c', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Alfred', '', 'sembunyikan', 'sembunyikan', '', '', '17653*', '14', '15', '2', ''),
(4933, '17660', 'e1f6e43b3a95b8f4b4d4e3ac06c05b77', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Andreas Nicola Chandra', '', 'sembunyikan', 'sembunyikan', '', '', '17660*', '14', '15', '3', ''),
(4934, '17668', '91f8eb5d7720eb8f5d8455243638d83e', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Angeline Noviana Samsuni', '', 'sembunyikan', 'sembunyikan', '', '', '17668*', '14', '15', '4', ''),
(4935, '17676', 'f85cf08359c96d41586a220bab89d83c', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ARIEL BENNY PRIYANTONO', '', 'sembunyikan', 'sembunyikan', '', '', '17676*', '14', '15', '5', ''),
(4936, '17695', '253af8feb990a9e87aae216fa51afd97', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Chatarina Aileen', '', 'sembunyikan', 'sembunyikan', '', '', '17695*', '14', '15', '6', ''),
(4937, '17696', 'ea40cc43adab34269ef26e91c0282c50', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Christopher Adriel Justin', '', 'sembunyikan', 'sembunyikan', '', '', '17696*', '14', '15', '7', '');
INSERT INTO `useraura` (`UserId`, `user`, `password`, `level`, `tipe`, `is_online`, `last_ping`, `start`, `exp`, `nama`, `photo`, `statusemail`, `statustelp`, `email`, `telp`, `password2`, `tahunajaran`, `kelas`, `absen`, `urutan`) VALUES
(4938, '17698', 'd58e77e37e60414197a8265717fef34c', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Cindy Laurent Tanoyo', '', 'sembunyikan', 'sembunyikan', '', '', '17698*', '14', '15', '8', ''),
(4939, '17702', '2e19c1992d96dfa0207a06959ab170a6', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Clifford Theofanis', '', 'sembunyikan', 'sembunyikan', '', '', '17702*', '14', '15', '9', ''),
(4940, '17704', 'f34b1040b3bdd4afcafe72deaefba5a9', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Delisia Christabel', '', 'sembunyikan', 'sembunyikan', '', '', '17704*', '14', '15', '10', ''),
(4941, '17713', '9a0c4d7906fec4b897fc1946146c7c95', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Emanuel Gerardo Kristel Tanjung', '', 'sembunyikan', 'sembunyikan', '', '', '17713*', '14', '15', '11', ''),
(4942, '17720', '458d9f2a939c93bdfa31bb1cc240517b', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Febby Felisa Tarigan', '', 'sembunyikan', 'sembunyikan', '', '', '17720*', '14', '15', '12', ''),
(4943, '17742', 'bd430426a42001d513a577f2df1bd9ca', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'FRANSISCA KARTIKA WIHARTO', '', 'sembunyikan', 'sembunyikan', '', '', '17742*', '14', '15', '13', ''),
(4944, '17755', '1cfb8d9d72baf3a724d90652b2f8e821', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Hansel Davin Sugiarto', '', 'sembunyikan', 'sembunyikan', '', '', '17755*', '14', '15', '14', ''),
(4945, '17758', '59835453084d23876247f4769100fd6a', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Helen Margaret', '', 'sembunyikan', 'sembunyikan', '', '', '17758*', '14', '15', '15', ''),
(4946, '17765', '560bb5637667c2447f4dbf3dd5c20ae6', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ivana Adena', '', 'sembunyikan', 'sembunyikan', '', '', '17765*', '14', '15', '16', ''),
(4947, '17767', '2a18471e71819584a6426e6d3b3e1fde', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'JACKO MATTEW', '', 'sembunyikan', 'sembunyikan', '', '', '17767*', '14', '15', '17', ''),
(4948, '17768', '986b13bda1c271f20d632f65e2b49cd6', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'James Eduard Garciano', '', 'sembunyikan', 'sembunyikan', '', '', '17768*', '14', '15', '18', ''),
(4949, '17794', '84bd8cf468dd3e68c0fa9188d2c070e0', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Kevin Heryadi Yunior', '', 'sembunyikan', 'sembunyikan', '', '', '17794*', '14', '15', '19', ''),
(4950, '17806', '35f3cf65d9a9a27d8944bf25973089bc', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Lourenzia Betsy Situmorang', '', 'sembunyikan', 'sembunyikan', '', '', '17806*', '14', '15', '20', ''),
(4951, '17807', 'a6f5e47f72968d80aa8cab29f076db84', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Luis Frentzen Salim', '', 'sembunyikan', 'sembunyikan', '', '', '17807*', '14', '15', '21', ''),
(4952, '17813', 'f20a86f621b5302aecf5913e7165e337', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Margaretha Davina Emilia Putri Pospos', '', 'sembunyikan', 'sembunyikan', '', '', '17813*', '14', '15', '22', ''),
(4953, '17820', '6b167c2ea6f1b6505cd9e4cf2fd5dbca', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'MARTIN LUCKYANTO SOEPHOMO', '', 'sembunyikan', 'sembunyikan', '', '', '17820*', '14', '15', '23', ''),
(4954, '17827', 'aca00988473be4c691748c39fbe8f87c', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Michael Halim Senatra', '', 'sembunyikan', 'sembunyikan', '', '', '17827*', '14', '15', '24', ''),
(4955, '17834', '0e88d2c1b8a27f8224b94635a06bc1ab', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Michelle Florencia Soetikno', '', 'sembunyikan', 'sembunyikan', '', '', '17834*', '14', '15', '25', ''),
(4956, '17846', 'de0227cf210aabb25e7d23fa2966ef07', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Nathania Margareta Tanujaya', '', 'sembunyikan', 'sembunyikan', '', '', '17846*', '14', '15', '26', ''),
(4957, '17848', '56e2fc75d25b6d70b7b62b4c0c9a8c58', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Nathaniel Grant Smith', '', 'sembunyikan', 'sembunyikan', '', '', '17848*', '14', '15', '27', ''),
(4958, '17863', '20d074de80fe90cda42a315a471b1b60', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Patrick Philip', '', 'sembunyikan', 'sembunyikan', '', '', '17863*', '14', '15', '28', ''),
(4959, '17874', '6fdefa3675275b0d928536ad60fc8020', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Sheannen Tirza Eunique', '', 'sembunyikan', 'sembunyikan', '', '', '17874*', '14', '15', '29', ''),
(4960, '17878', '6ddabebca63b64b7520ed54a00fcde11', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Sheron Leviany Dusia', '', 'sembunyikan', 'sembunyikan', '', '', '17878*', '14', '15', '30', ''),
(4961, '17892', '8c6ae0edd0f3a42d9c8aaed1c46b25b5', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Tania Angelina Hostiadi', '', 'sembunyikan', 'sembunyikan', '', '', '17892*', '14', '15', '31', ''),
(4962, '17904', 'e066f0c942616d316e5b3ac275385668', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Veronica Anggreani Suhardono', '', 'sembunyikan', 'sembunyikan', '', '', '17904*', '14', '15', '32', ''),
(4963, '17908', '33bbdbacdad3df34364b78cf521f6d88', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Victoria Octaviani Putri Tanaga', '', 'sembunyikan', 'sembunyikan', '', '', '17908*', '14', '15', '33', ''),
(4964, '17916', 'e90fc4fce80c8a2bd944f6f155bcb598', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Vonny Maharani Handoyo', '', 'sembunyikan', 'sembunyikan', '', '', '17916*', '14', '15', '34', ''),
(4965, '17655', '287f2fdeb5e386c5d9e3b51b0f52d68c', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Alvin', '', 'sembunyikan', 'sembunyikan', '', '', '17655*', '14', '12', '1', ''),
(4966, '17677', 'c5103199c2de4f057273c227c24b39c3', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Arnold Antonius Sunarkho', '', 'sembunyikan', 'sembunyikan', '', '', '17677*', '14', '12', '2', ''),
(4967, '17688', 'cb521962f3a5f28c8ec05bc02f9977a1', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Bryan Nixon Liem', '', 'sembunyikan', 'sembunyikan', '', '', '17688*', '14', '12', '3', ''),
(4968, '17701', '85aba01efe746ca3f89a9dff17a805fe', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Claudya Meylinia', '', 'sembunyikan', 'sembunyikan', '', '', '17701*', '14', '12', '4', ''),
(4969, '17714', 'c0f5da1acb2018fd017f1f488d62c17a', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Eric', '', 'sembunyikan', 'sembunyikan', '', '', '17714*', '14', '12', '5', ''),
(4970, '17719', '34738ddf7b48dd9b68b6e32fe1755089', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Faustinus Felix', '', 'sembunyikan', 'sembunyikan', '', '', '17719*', '14', '12', '6', ''),
(4971, '17731', '2441b5267283534b81ca21d27aebc80e', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Felix Lukito', '', 'sembunyikan', 'sembunyikan', '', '', '17731*', '14', '12', '7', ''),
(4972, '17736', 'bdff78c3f5fac649407830a7e97a0553', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Fernando Wijaya', '', 'sembunyikan', 'sembunyikan', '', '', '17736*', '14', '12', '8', ''),
(4973, '17741', 'e02a33041caa5a0078276bae6d3414f3', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Francisco Allenxeon', '', 'sembunyikan', 'sembunyikan', '', '', '17741*', '14', '12', '9', ''),
(4974, '17757', 'c54efb3d90840c0abab471791c5417a9', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Hartanto Wijaya', '', 'sembunyikan', 'sembunyikan', '', '', '17757*', '14', '12', '10', ''),
(4975, '17770', 'b0242bd21d7450f6b187928831ee17b8', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jason Putra Pratama', '', 'sembunyikan', 'sembunyikan', '', '', '17770*', '14', '12', '11', ''),
(4976, '17801', 'c422e65f58f96387faa06981b6c61e10', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Lawrence Patrick Sianto', '', 'sembunyikan', 'sembunyikan', '', '', '17801*', '14', '12', '12', ''),
(4977, '17826', 'f910ca3f3507d1845dcca486d5a61f9e', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'MICHAEL GABRIEL', '', 'sembunyikan', 'sembunyikan', '', '', '17826*', '14', '12', '13', ''),
(4978, '17831', '599c40ca3435e82a545b45d377872dbc', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Michael Stephen Lui', '', 'sembunyikan', 'sembunyikan', '', '', '17831*', '14', '12', '14', ''),
(4979, '17840', '9dd2b36b323931ef6b714ccf0479108d', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'MONICA SANDRA NENCY', '', 'sembunyikan', 'sembunyikan', '', '', '17840*', '14', '12', '15', ''),
(4980, '17851', 'dbf9fc6acc26565f2625bb4b05b6413f', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'NICHOLAS WONGSONEGORO', '', 'sembunyikan', 'sembunyikan', '', '', '17851*', '14', '12', '16', ''),
(4981, '17856', '84c6f1a094a0bea7008fc17ab6b8bb65', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Nikko Gunawan', '', 'sembunyikan', 'sembunyikan', '', '', '17856*', '14', '12', '17', ''),
(4982, '17884', '146af74002970ddfc9344a4d5f140d33', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Stefanie Muliadji', '', 'sembunyikan', 'sembunyikan', '', '', '17884*', '14', '12', '18', ''),
(4983, '17926', '767a04e4bf392ac43e39b9a3da8209e0', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Yohanes Adryan Lamury Hadjon', '', 'sembunyikan', 'sembunyikan', '', '', '17926*', '14', '12', '19', ''),
(4984, '17659', '895ca49654ffcace69d34596d72b00d9', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Andre Winarto', '', 'sembunyikan', 'sembunyikan', '', '', '17659*', '14', '16', '1', ''),
(4985, '17663', '2e8873ce63e445b581d96f68a7a3da76', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Angela Marvellia', '', 'sembunyikan', 'sembunyikan', '', '', '17663*', '14', '16', '2', ''),
(4986, '17673', 'cb34e550182fbd6bc5a4e46b33ddb9e2', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Antonio Jason Sucianto', '', 'sembunyikan', 'sembunyikan', '', '', '17673*', '14', '16', '3', ''),
(4987, '17686', '71acf9008f05c3beb40b7b8fa3acfca7', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Brigita Pramesthi Pranoto', '', 'sembunyikan', 'sembunyikan', '', '', '17686*', '14', '16', '4', ''),
(4988, '17691', '2ce3f17c17dc7d867eeb35166fc5195b', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Catherine Christy Ryanthio', '', 'sembunyikan', 'sembunyikan', '', '', '17691*', '14', '16', '5', ''),
(4989, '17699', 'ef898372d9999891d1a1bc2449ddeed3', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Clara Calista', '', 'sembunyikan', 'sembunyikan', '', '', '17699*', '14', '16', '6', ''),
(4990, '17716', '43fb29535674467bd7ead985710491e6', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'FABRIZIO ROBBIE SUMAWAN', '', 'sembunyikan', 'sembunyikan', '', '', '17716*', '14', '16', '7', ''),
(4991, '17728', '3fe6529fc99014c0a2c8695af9e5e803', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Felita Alodia Andrianti', '', 'sembunyikan', 'sembunyikan', '', '', '17728*', '14', '16', '8', ''),
(4992, '17729', '3fdbfa613840da11daa7ecab427c30db', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Felix Adrian Prayogo', '', 'sembunyikan', 'sembunyikan', '', '', '17729*', '14', '16', '9', ''),
(4993, '17749', 'f9df20eeee8bee69bdc852a319efd846', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Giovani Kerensa', '', 'sembunyikan', 'sembunyikan', '', '', '17749*', '14', '16', '10', ''),
(4994, '17780', 'e7fe35034fb4f24a05b51f6ae3f2507a', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Johana Sugihono Wijaya', '', 'sembunyikan', 'sembunyikan', '', '', '17780*', '14', '16', '11', ''),
(4995, '17786', 'e92e7ec827eb8f50076287f4eeddc221', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Julius Winarto Chandra', '', 'sembunyikan', 'sembunyikan', '', '', '17786*', '14', '16', '12', ''),
(4996, '17789', 'd2fdf0c995ea7dea9d0a98d8a564c048', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Kathleen Wijaya', '', 'sembunyikan', 'sembunyikan', '', '', '17789*', '14', '16', '13', ''),
(4997, '17792', '7dcfba0d815db49e2b96f259b17c4b7d', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Kenny Kuanggrawidjaya Tanto', '', 'sembunyikan', 'sembunyikan', '', '', '17792*', '14', '16', '14', ''),
(4998, '17802', 'e27216055269d970a77303d905daf0d2', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Leonardus Dimas', '', 'sembunyikan', 'sembunyikan', '', '', '17802*', '14', '16', '15', ''),
(4999, '17811', '4e74f092a769b111507d976e8368dc61', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'MARCELINO NYOTO PRAWIRO', '', 'sembunyikan', 'sembunyikan', '', '', '17811*', '14', '16', '16', ''),
(5000, '17816', 'f23e6f75cea5713b7424a2b9f41221a4', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Maria Florensia Soewijono', '', 'sembunyikan', 'sembunyikan', '', '', '17816*', '14', '16', '17', ''),
(5001, '17818', 'a8e08839ae8540c44a93a9cf38172921', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Mario Leonardo Tjayadi', '', 'sembunyikan', 'sembunyikan', '', '', '17818*', '14', '16', '18', ''),
(5002, '17821', 'd72413d005b9ba4496bca5219a389617', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Marvella', '', 'sembunyikan', 'sembunyikan', '', '', '17821*', '14', '16', '19', ''),
(5003, '17825', 'c191e7ff00a4f4ca1155a8f0dc6a8492', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Melva Renata Margaretha Panjaitan', '', 'sembunyikan', 'sembunyikan', '', '', '17825*', '14', '16', '20', ''),
(5004, '17857', 'f7b30d0d83eb46e70b8694c48c6d9677', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Noviandi', '', 'sembunyikan', 'sembunyikan', '', '', '17857*', '14', '16', '21', ''),
(5005, '17864', '6e8922c076830c31f2129f5fb476f563', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Paulina Cecilia', '', 'sembunyikan', 'sembunyikan', '', '', '17864*', '14', '16', '22', ''),
(5006, '17867', '9d0c70259f89ca56322b6f6fb0c1f75d', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'PRISCYLIA TANAKA', '', 'sembunyikan', 'sembunyikan', '', '', '17867*', '14', '16', '23', ''),
(5007, '17870', '2301fba9b75fb6a2946973fc8b678c32', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ricky Wijaya Tebiantoro', '', 'sembunyikan', 'sembunyikan', '', '', '17870*', '14', '16', '24', ''),
(5008, '17888', '2be3b7f68df22b4a7d980c7809f74eff', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Steven Kurnia Dwinata', '', 'sembunyikan', 'sembunyikan', '', '', '17888*', '14', '16', '25', ''),
(5009, '17894', '144592b06aed0bf7949ad207b37ed9cd', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Theresella Evelyn Wibowo', '', 'sembunyikan', 'sembunyikan', '', '', '17894*', '14', '16', '26', ''),
(5010, '17896', 'd4b2799471f630255a9b2b1460abebe6', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Theresia Tan', '', 'sembunyikan', 'sembunyikan', '', '', '17896*', '14', '16', '27', ''),
(5011, '17898', 'bc7d2f06b7a87c51ebbba00a754c9f6b', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Tito Raja Hasudungan Sianturi', '', 'sembunyikan', 'sembunyikan', '', '', '17898*', '14', '16', '28', ''),
(5012, '17899', 'afc9aa3c5180990482553c47418804a1', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Valencia Angelica', '', 'sembunyikan', 'sembunyikan', '', '', '17899*', '14', '16', '29', ''),
(5013, '17909', '8aaa500a840ee518067497a2c4e36fed', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Vincent Evan Christopher', '', 'sembunyikan', 'sembunyikan', '', '', '17909*', '14', '16', '30', ''),
(5014, '17913', '981b29d5ec99d9b5d7028524482a3c6e', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Virginia Angelique', '', 'sembunyikan', 'sembunyikan', '', '', '17913*', '14', '16', '31', ''),
(5015, '17920', 'b3ed52169f376109f8e3416607e4ec66', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Wilren Thomas', '', 'sembunyikan', 'sembunyikan', '', '', '17920*', '14', '16', '32', ''),
(5016, '17921', '7dc49c9b1a6fd7c42369593ca21e17aa', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Wilson', '', 'sembunyikan', 'sembunyikan', '', '', '17921*', '14', '16', '33', ''),
(5017, '17930', '1a11cf90bd9de9f45238775f5fe3d8af', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Yowen Putra Wilopo', '', 'sembunyikan', 'sembunyikan', '', '', '17930*', '14', '16', '34', ''),
(5018, '17502', '6228391b90bbcbfe3f333e8a9599ea4f', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Maximilianus Vigo', '', 'sembunyikan', 'sembunyikan', '', '', '17502*', '14', '17', '1', ''),
(5019, '17646', 'e4725d8d7d86ef1cb721ebb81e792804', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Agatha Christine Prayitno', '', 'sembunyikan', 'sembunyikan', '', '', '17646*', '14', '17', '2', ''),
(5020, '17649', '401d99ac4c30752765c08ff2f045cc38', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Albertus Nicholaus Pranoto', '', 'sembunyikan', 'sembunyikan', '', '', '17649*', '14', '17', '3', ''),
(5021, '17662', '8f8648e1b917c1c757fd322127934681', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Angela Dionne Antoinette R.S', '', 'sembunyikan', 'sembunyikan', '', '', '17662*', '14', '17', '4', ''),
(5022, '17671', '8c12ab0b47b111a85b73e2f1581597fb', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Anne Emmanueline Audrey', '', 'sembunyikan', 'sembunyikan', '', '', '17671*', '14', '17', '5', ''),
(5023, '17680', 'b230b3e548d56a2bd0ac3015ac2f241f', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'AUDREY GABRIELLA', '', 'sembunyikan', 'sembunyikan', '', '', '17680*', '14', '17', '6', ''),
(5024, '17684', '88be470939826969fc768b90d293256d', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Billy Cannavaro Ferguzen', '', 'sembunyikan', 'sembunyikan', '', '', '17684*', '14', '17', '7', ''),
(5025, '17685', '1a3bde945b2e529e1f25a956f056a7d2', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'BRANDON SOEKRESNO', '', 'sembunyikan', 'sembunyikan', '', '', '17685*', '14', '17', '8', ''),
(5026, '17687', '39bf65a86551cb988f2f7a7d4062a9d3', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Brilliant Hartanto', '', 'sembunyikan', 'sembunyikan', '', '', '17687*', '14', '17', '9', ''),
(5027, '17707', '4f0fa24a0f36b61e8601facd0072c200', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Dion Putra Kusumo', '', 'sembunyikan', 'sembunyikan', '', '', '17707*', '14', '17', '10', ''),
(5028, '17710', '6b8f36b7d976f09b2e98f247d24ea665', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Edrick Soegianto', '', 'sembunyikan', 'sembunyikan', '', '', '17710*', '14', '17', '11', ''),
(5029, '17715', 'e3ec52fc53708934503c2983904e5769', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ERIC JUNIOR', '', 'sembunyikan', 'sembunyikan', '', '', '17715*', '14', '17', '12', ''),
(5030, '17723', '6e78db2d698556db4b543a89cbfa944c', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'FEBRIN CANDRA', '', 'sembunyikan', 'sembunyikan', '', '', '17723*', '14', '17', '13', ''),
(5031, '17724', '309a50e8aca3516f6ca86efc09ba9257', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Felicia', '', 'sembunyikan', 'sembunyikan', '', '', '17724*', '14', '17', '14', ''),
(5032, '17734', '4fdf51273f860c24cf5975d2149ddc0a', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Fenny Marchela Pang', '', 'sembunyikan', 'sembunyikan', '', '', '17734*', '14', '17', '15', ''),
(5033, '17745', 'f62bbd9616e924a25b352e42660cd5df', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'GANDHI GAUTAMA', '', 'sembunyikan', 'sembunyikan', '', '', '17745*', '14', '17', '16', ''),
(5034, '17759', '040ceca5df92a78f6f35e30bd5a9c9d0', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Hellen Agustin', '', 'sembunyikan', 'sembunyikan', '', '', '17759*', '14', '17', '17', ''),
(5035, '17769', '13c71db8553b38ba7dde1cb9999c023f', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jason Firstly Kurniawan', '', 'sembunyikan', 'sembunyikan', '', '', '17769*', '14', '17', '18', ''),
(5036, '17783', 'f4f4bdb8fbd7f9735aee16e4cc626865', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Joy Johannes', '', 'sembunyikan', 'sembunyikan', '', '', '17783*', '14', '17', '19', ''),
(5037, '17785', 'fc35f27e8d3885af6f4913facb58f3c3', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Julius Kevin Parulian Sianipar', '', 'sembunyikan', 'sembunyikan', '', '', '17785*', '14', '17', '20', ''),
(5038, '17804', '13516cbc17643053c27a363cb24a2678', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Levina Aurellia', '', 'sembunyikan', 'sembunyikan', '', '', '17804*', '14', '17', '21', ''),
(5039, '17812', '6f97a75d5640c9dd4462e1e7dedaac94', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Marcellino Advendra Widyo Nugroho', '', 'sembunyikan', 'sembunyikan', '', '', '17812*', '14', '17', '22', ''),
(5040, '17815', 'cc3d848e5f1a64b36944e8d8c3cd37c4', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Maria Cathy Budiman', '', 'sembunyikan', 'sembunyikan', '', '', '17815*', '14', '17', '23', ''),
(5041, '17822', '7b965db594aac9b32a5a8111dfccdd72', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'MATTHEW IMANUEL NUGRAHA', '', 'sembunyikan', 'sembunyikan', '', '', '17822*', '14', '17', '24', ''),
(5042, '17833', '29d36c9f00d49203573623c9e3ba30b5', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'MICHELLE FLORENCIA', '', 'sembunyikan', 'sembunyikan', '', '', '17833*', '14', '17', '25', ''),
(5043, '17843', '328e5ec987ae60c20f49e98791be0d5c', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Natashya Geiska Putri', '', 'sembunyikan', 'sembunyikan', '', '', '17843*', '14', '17', '26', ''),
(5044, '17849', '5c74eca8733f5f13d8dab1795dd94371', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Nensy Clear Field Raharjo', '', 'sembunyikan', 'sembunyikan', '', '', '17849*', '14', '17', '27', ''),
(5045, '17850', 'e55bd397e520556ee8be667fdc6e627d', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Neohara Elasta', '', 'sembunyikan', 'sembunyikan', '', '', '17850*', '14', '17', '28', ''),
(5046, '17854', 'f37d1457e960f1f7f4483cb9f1da9172', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Nicole Ivanka Aurelia Tannaya', '', 'sembunyikan', 'sembunyikan', '', '', '17854*', '14', '17', '29', ''),
(5047, '17859', 'c0dd048c6d731415f1a0ee2f4b93905c', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Olivia Graciela Go', '', 'sembunyikan', 'sembunyikan', '', '', '17859*', '14', '17', '30', ''),
(5048, '17910', 'a8bb140ed0978cf4d4cf43ff0684e7b4', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Vincent Sebastian Hadi', '', 'sembunyikan', 'sembunyikan', '', '', '17910*', '14', '17', '31', ''),
(5049, '17911', 'c891c81d16fe6e31c957684a5291f73f', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Vinny Olive Prajogo', '', 'sembunyikan', 'sembunyikan', '', '', '17911*', '14', '17', '32', ''),
(5050, '17922', 'a20aac25ca84bf726d85204ed9597977', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Winda Christina Rosalim', '', 'sembunyikan', 'sembunyikan', '', '', '17922*', '14', '17', '33', ''),
(5051, '17923', '41a33c6e8a74bc13e46db9c9fa28689f', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Yansen', '', 'sembunyikan', 'sembunyikan', '', '', '17923*', '14', '17', '34', ''),
(5052, '17925', '186f1d5d7d98928d1fd33d799b1dfd4f', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Yohana Patricia Chaniago', '', 'sembunyikan', 'sembunyikan', '', '', '17925*', '14', '17', '35', ''),
(5053, '17654', 'fa28fad18e636dc21358cca714319436', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Alissa Mega Chandra', '', 'sembunyikan', 'sembunyikan', '', '', '17654*', '14', '18', '1', ''),
(5054, '17657', '307fef06fc907c2fd979a64194450707', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Anastasia Nicole', '', 'sembunyikan', 'sembunyikan', '', '', '17657*', '14', '18', '2', ''),
(5055, '17661', '85c4311b8892222957f640a4d9693458', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Andy Charitos Shawlong Soejunus', '', 'sembunyikan', 'sembunyikan', '', '', '17661*', '14', '18', '3', ''),
(5056, '17666', '8217956a06ea8df6a0d8bfd4a0f72b83', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Angelina Laurencia Iskandar', '', 'sembunyikan', 'sembunyikan', '', '', '17666*', '14', '18', '4', ''),
(5057, '17670', '43a30514e8acc458261476d7ded3be2c', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Anlika Asalie', '', 'sembunyikan', 'sembunyikan', '', '', '17670*', '14', '18', '5', ''),
(5058, '17674', '141f632d6206243f6c4d9eb4e4aeafb5', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Antonio Louis Benjamin', '', 'sembunyikan', 'sembunyikan', '', '', '17674*', '14', '18', '6', ''),
(5059, '17681', '803c8594910f8c472e31a9c992052218', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'AUDREY LAURENIA CAHYONO', '', 'sembunyikan', 'sembunyikan', '', '', '17681*', '14', '18', '7', ''),
(5060, '17683', 'b3486295a98a2999b0c9560eac44a306', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Bernadet Kumalasari', '', 'sembunyikan', 'sembunyikan', '', '', '17683*', '14', '18', '8', ''),
(5061, '17692', 'ad4dc0bff2b7150572ed49f1644b6578', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Catherine Ongko Wijaya', '', 'sembunyikan', 'sembunyikan', '', '', '17692*', '14', '18', '9', ''),
(5062, '17693', '4d0e2be6ac4c0957bec30d4fba02a879', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'CHANDRA DARMAWAN', '', 'sembunyikan', 'sembunyikan', '', '', '17693*', '14', '18', '10', ''),
(5063, '17711', '1e3e95ed8127bf9c1a934ac00de304e8', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Edward Christopher Kudrati', '', 'sembunyikan', 'sembunyikan', '', '', '17711*', '14', '18', '11', ''),
(5064, '17712', 'bc3c758d3e85d1ad30fc68b82efb8760', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Eliza Valentinus', '', 'sembunyikan', 'sembunyikan', '', '', '17712*', '14', '18', '12', ''),
(5065, '17722', '0f399d6644d877bd68002199b7c3de89', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'FEBRI CHANDRA', '', 'sembunyikan', 'sembunyikan', '', '', '17722*', '14', '18', '13', ''),
(5066, '17735', 'a715bbe9979e8c1dafeb5f0989cefa5f', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'FERAWATI KUSUMA', '', 'sembunyikan', 'sembunyikan', '', '', '17735*', '14', '18', '14', ''),
(5067, '17746', '788c38ef567eb2a14ef9531c4c8b31e4', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Geofanny Ariesta Manalu', '', 'sembunyikan', 'sembunyikan', '', '', '17746*', '14', '18', '15', ''),
(5068, '17747', '469e5af20b01c509a381893afd62ff27', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'George Alehandro', '', 'sembunyikan', 'sembunyikan', '', '', '17747*', '14', '18', '16', ''),
(5069, '17761', 'f7af70a87fc03146d11198f18fe6495f', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'INNEKE FLORENTSIA DHARMA LIANTO', '', 'sembunyikan', 'sembunyikan', '', '', '17761*', '14', '18', '17', ''),
(5070, '17762', 'd09206c1601f4f6a8a3030a166796311', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Irene Jessica Giseline', '', 'sembunyikan', 'sembunyikan', '', '', '17762*', '14', '18', '18', ''),
(5071, '17772', '3581d74b90fade8c81a8d010c4bfd4a1', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'JAY ALFI BONTILAO', '', 'sembunyikan', 'sembunyikan', '', '', '17772*', '14', '18', '19', ''),
(5072, '17781', 'efb3ece83b7bef80954ea19baf7a7df1', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Joppy Wijaya', '', 'sembunyikan', 'sembunyikan', '', '', '17781*', '14', '18', '20', ''),
(5073, '17784', '5afcb2b58f0d0e1792eaa135a7d30dae', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Julietta Cesilia Wahyudi', '', 'sembunyikan', 'sembunyikan', '', '', '17784*', '14', '18', '21', ''),
(5074, '17787', 'c96bf022f8d1d891a7df6f160cdeb31f', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'KARINA ANGELINA PUTRA', '', 'sembunyikan', 'sembunyikan', '', '', '17787*', '14', '18', '22', ''),
(5075, '17797', 'faf305344aa3e0b7c7cef76e65a1466c', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Kheren Yohana Christina', '', 'sembunyikan', 'sembunyikan', '', '', '17797*', '14', '18', '23', ''),
(5076, '17798', '2f4a4cc9f33046b7c1329492259e404e', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Kristiadi Sadeli', '', 'sembunyikan', 'sembunyikan', '', '', '17798*', '14', '18', '24', ''),
(5077, '17819', '727e95260567937a65530ff69db278c8', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Martda Angelia Veronika', '', 'sembunyikan', 'sembunyikan', '', '', '17819*', '14', '18', '25', ''),
(5078, '17823', 'da1972bebcd4306e8c12210884f97cfa', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Matthew Kent Alesandro', '', 'sembunyikan', 'sembunyikan', '', '', '17823*', '14', '18', '26', ''),
(5079, '17830', 'f2c6800769ae215bb5ffa0164f9e71ee', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Michael Oktavianus Milliarto Jaya', '', 'sembunyikan', 'sembunyikan', '', '', '17830*', '14', '18', '27', ''),
(5080, '17862', 'f0e805b123dfa075096528f896d9b0b6', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'PATRICIUS JASSON', '', 'sembunyikan', 'sembunyikan', '', '', '17862*', '14', '18', '28', ''),
(5081, '17868', '3a61d0a0d0c7ca877d758aef30054d98', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Regina Christie', '', 'sembunyikan', 'sembunyikan', '', '', '17868*', '14', '18', '29', ''),
(5082, '17869', 'e5c4e846e539b031465ef79cd9fd9094', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'REYNALDI SUDIGDO', '', 'sembunyikan', 'sembunyikan', '', '', '17869*', '14', '18', '30', ''),
(5083, '17901', '66dd49efe0845ef2c181b7c6101e100e', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Valerie Vanessa Wibisono', '', 'sembunyikan', 'sembunyikan', '', '', '17901*', '14', '18', '31', ''),
(5084, '17905', '32d230373b680ca8d15660d1c0c6bb25', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Veronica Cyntia Margaretha Wijaya', '', 'sembunyikan', 'sembunyikan', '', '', '17905*', '14', '18', '32', ''),
(5085, '17917', '57f69892987e5c15e0998b1920c6aac5', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Wiliam', '', 'sembunyikan', 'sembunyikan', '', '', '17917*', '14', '18', '33', ''),
(5086, '17929', 'a432cccb9d87905fe17b6e231784bea3', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'YOSUA WITANTO', '', 'sembunyikan', 'sembunyikan', '', '', '17929*', '14', '18', '34', ''),
(5087, '17255', 'c02f5be9be59c3565e3713179abedb4c', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Abraham Nico', '', 'sembunyikan', 'sembunyikan', '', '', '17255*', '14', '25', '1', ''),
(5088, '17267', '6621481879a5357fddde973546815884', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Alessandro Gontay', '', 'sembunyikan', 'sembunyikan', '', '', '17267*', '14', '25', '2', ''),
(5089, '17272', '99f8e297ecac804925b89e15e00eeac1', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Alexander Yonathan Nugroho', '', 'sembunyikan', 'sembunyikan', '', '', '17272*', '14', '25', '3', ''),
(5090, '17286', '45410d80d24268cc84ff35a35fd31fb9', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Andreas Krisnata', '', 'sembunyikan', 'sembunyikan', '', '', '17286*', '14', '25', '4', ''),
(5091, '17290', '9ab3c2240a8db27dd95a9d18b8154af3', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Angela Cynthia Maharani', '', 'sembunyikan', 'sembunyikan', '', '', '17290*', '14', '25', '5', ''),
(5092, '17332', '197846b7039a461f50cf7f6450aa9dc2', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Christianus Jodi Yonathan', '', 'sembunyikan', 'sembunyikan', '', '', '17332*', '14', '25', '6', ''),
(5093, '17385', '47801290127bf6a9cf9cbbe92ab53dc1', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Felix Halim', '', 'sembunyikan', 'sembunyikan', '', '', '17385*', '14', '25', '7', ''),
(5094, '17393', 'ae732a77492c9652009bad9584216924', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Filbert Dick Cavanugh Huang', '', 'sembunyikan', 'sembunyikan', '', '', '17393*', '14', '25', '8', ''),
(5095, '17411', 'e3f1cf854627bf2f04a0cdf598fd04bb', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Gloria Ekaputri Susilo', '', 'sembunyikan', 'sembunyikan', '', '', '17411*', '14', '25', '9', ''),
(5096, '17420', '6c179ddf30e53eaa3b7be7c6d7166df3', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Gunawan Adinata', '', 'sembunyikan', 'sembunyikan', '', '', '17420*', '14', '25', '10', ''),
(5097, '17425', '5129c0147f2127dacc1ac47947279a5b', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Helen Hadi', '', 'sembunyikan', 'sembunyikan', '', '', '17425*', '14', '25', '11', ''),
(5098, '17434', '4241819469ff9ead87113abdf4b321da', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Imanuel Kevin Subiantoro', '', 'sembunyikan', 'sembunyikan', '', '', '17434*', '14', '25', '12', ''),
(5099, '17436', '12f75d19d895bd8b6f4f9e6a529f2a48', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Intansari Puspawijaya', '', 'sembunyikan', 'sembunyikan', '', '', '17436*', '14', '25', '13', ''),
(5100, '17449', '222c62940632bf956231dc11da0380b3', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jimmy Chang Liong', '', 'sembunyikan', 'sembunyikan', '', '', '17449*', '14', '25', '14', ''),
(5101, '17509', '275061693d3bffc59ed77c0a167aaa9a', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Merissa Bhernaded Lie', '', 'sembunyikan', 'sembunyikan', '', '', '17509*', '14', '25', '15', ''),
(5102, '17517', '80b1c5a0009d970d692c83adc63b31dd', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Michael Tanujaya', '', 'sembunyikan', 'sembunyikan', '', '', '17517*', '14', '25', '16', ''),
(5103, '17530', '9a5840f24dfe320b49f3b6ca60048f55', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Nikita Luisa', '', 'sembunyikan', 'sembunyikan', '', '', '17530*', '14', '25', '17', ''),
(5104, '17539', 'a892e9d3a87d7d0f98462072b52ceab3', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Patricia Samantha', '', 'sembunyikan', 'sembunyikan', '', '', '17539*', '14', '25', '18', ''),
(5105, '17562', 'df6dc78e6fa5014f02785d0cc137cc36', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Savira Ratna Nurlita', '', 'sembunyikan', 'sembunyikan', '', '', '17562*', '14', '25', '19', ''),
(5106, '17574', '86784a04963961a2c2646256262dcb15', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Stefanus Shanny', '', 'sembunyikan', 'sembunyikan', '', '', '17574*', '14', '25', '20', ''),
(5107, '17593', '4241655ba8807a45882c7cfb32dceef9', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Teresa Wongso', '', 'sembunyikan', 'sembunyikan', '', '', '17593*', '14', '25', '21', ''),
(5108, '17642', 'b66976180392b3cc8715bcad456b7302', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Yovan Theo', '', 'sembunyikan', 'sembunyikan', '', '', '17642*', '14', '25', '22', ''),
(5109, '17257', 'd7afbeb5986ba7d3f07a13186797f4b0', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Adi Setyo Nugroho', '', 'sembunyikan', 'sembunyikan', '', '', '17257*', '14', '19', '1', ''),
(5110, '17274', '79bcd661541a9e71dd6025f6797b493d', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Alim Raharjo', '', 'sembunyikan', 'sembunyikan', '', '', '17274*', '14', '19', '2', ''),
(5111, '17276', 'd28a82f11b01998fdf486a0c3ef37cfa', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Alvin Christopher', '', 'sembunyikan', 'sembunyikan', '', '', '17276*', '14', '19', '3', ''),
(5112, '17294', '054f5d482a79da7bb0ba858c636c96ce', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Angga Yuristian', '', 'sembunyikan', 'sembunyikan', '', '', '17294*', '14', '19', '4', ''),
(5113, '17299', '5acaff2f3d46eb7465559cbdfd3ce77d', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Anthony Sanjaya', '', 'sembunyikan', 'sembunyikan', '', '', '17299*', '14', '19', '5', ''),
(5114, '17310', 'e43c78fe0dd606583d111753d7e0d49b', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Belinda Aniela Reynardi', '', 'sembunyikan', 'sembunyikan', '', '', '17310*', '14', '19', '6', ''),
(5115, '17322', '3264512349a1eac5f5f8d9695a9d568e', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Bryan Kurniawan', '', 'sembunyikan', 'sembunyikan', '', '', '17322*', '14', '19', '7', ''),
(5116, '17325', '9efe64075369d0b58141514ed204a440', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Caroline Chikita Kezia Sila', '', 'sembunyikan', 'sembunyikan', '', '', '17325*', '14', '19', '8', ''),
(5117, '17334', '360633b3eac94c971d7e92f8c93259cf', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Christoper Putera', '', 'sembunyikan', 'sembunyikan', '', '', '17334*', '14', '19', '9', ''),
(5118, '17336', '3338fef58ce77b3225a981cd56d3f03f', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Cindy Yustisia', '', 'sembunyikan', 'sembunyikan', '', '', '17336*', '14', '19', '10', ''),
(5119, '17357', '15b12c383d2141eb32bc64bd95122470', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Dylan Sherwood Hanenkang', '', 'sembunyikan', 'sembunyikan', '', '', '17357*', '14', '19', '11', ''),
(5120, '17371', '5b07148b30ebbcac127124f77b6d9d9b', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Enrico Dave Dunda', '', 'sembunyikan', 'sembunyikan', '', '', '17371*', '14', '19', '12', ''),
(5121, '17382', 'f1af4902e840717cf40d1e59474c2711', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Felicia Irawan', '', 'sembunyikan', 'sembunyikan', '', '', '17382*', '14', '19', '13', ''),
(5122, '17394', '21f8c4b5f91225a7dd7f86bdab325dc3', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Finka Evania', '', 'sembunyikan', 'sembunyikan', '', '', '17394*', '14', '19', '14', ''),
(5123, '17408', '617338f3a485c6e7df9178f191242d1d', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Gilbert Anthoni Axel', '', 'sembunyikan', 'sembunyikan', '', '', '17408*', '14', '19', '15', ''),
(5124, '17414', '25b8ac0491b729a0292ae36a01904e3f', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Grace shella jasiman', '', 'sembunyikan', 'sembunyikan', '', '', '17414*', '14', '19', '16', ''),
(5125, '17422', 'aa79a26e85342083f0154f5a5a1ff190', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Hana July Suryani', '', 'sembunyikan', 'sembunyikan', '', '', '17422*', '14', '19', '17', ''),
(5126, '17423', 'd4a90bda0dd0053e39f31924f2c4413a', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Haris Pratama', '', 'sembunyikan', 'sembunyikan', '', '', '17423*', '14', '19', '18', ''),
(5127, '17438', '8ca147195d4de7fbad7dc6a0b37a0e0e', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ivena Aurellia Gunawan', '', 'sembunyikan', 'sembunyikan', '', '', '17438*', '14', '19', '19', ''),
(5128, '17453', '42cd53f59867675b1c2adf1b738c27dc', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'JONATHAN CHANDRA', '', 'sembunyikan', 'sembunyikan', '', '', '17453*', '14', '19', '20', ''),
(5129, '17466', '023977ad3053fc78362a8fe886f11bbb', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Kevin Santoso', '', 'sembunyikan', 'sembunyikan', '', '', '17466*', '14', '19', '21', ''),
(5130, '17471', 'fd697c37e1045549724c37d0f7a6f7f5', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'KIREINA KAMELOEH N.O.S GARANG', '', 'sembunyikan', 'sembunyikan', '', '', '17471*', '14', '19', '22', ''),
(5131, '17477', '75aac232225d6cdd38409504b789b2b4', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Laurencia Gavriella', '', 'sembunyikan', 'sembunyikan', '', '', '17477*', '14', '19', '23', ''),
(5132, '17481', 'f0769fdce1c9b14265505518679006c2', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Leonardo Indra Wijaya', '', 'sembunyikan', 'sembunyikan', '', '', '17481*', '14', '19', '24', ''),
(5133, '17483', 'd1b707b65d19e0aacf41e7192f1740ff', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Lie Adelia Chinvika Belawati', '', 'sembunyikan', 'sembunyikan', '', '', '17483*', '14', '19', '25', ''),
(5134, '17484', 'd226da66261ce2239f3c3503f2780092', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Lienny Ferlinda', '', 'sembunyikan', 'sembunyikan', '', '', '17484*', '14', '19', '26', ''),
(5135, '17510', '5f82ca39e7493bca3c0fd86372af4f1e', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Michael', '', 'sembunyikan', 'sembunyikan', '', '', '17510*', '14', '19', '27', ''),
(5136, '17514', 'da8a61501453d61eadd4979aabfef000', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Michael Louis Chandra', '', 'sembunyikan', 'sembunyikan', '', '', '17514*', '14', '19', '28', ''),
(5137, '17527', '4a23ff5ff429e2322fc9eed44d264644', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Nicholas Ferdinand', '', 'sembunyikan', 'sembunyikan', '', '', '17527*', '14', '19', '29', ''),
(5138, '17560', '616fedd662383ebedc34693d836fc971', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Samuel Calvin Hasiando Sinaga', '', 'sembunyikan', 'sembunyikan', '', '', '17560*', '14', '19', '30', ''),
(5139, '17572', '7f6dbb9fe7e7e1c1d330ffe471340c7a', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Stefanie Wibowo', '', 'sembunyikan', 'sembunyikan', '', '', '17572*', '14', '19', '31', ''),
(5140, '17576', '5939a60fca48cdf3f769510885e0805e', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Steffi Elizabeth Hermanto', '', 'sembunyikan', 'sembunyikan', '', '', '17576*', '14', '19', '32', ''),
(5141, '17611', 'b7be659daf2df87e4e3c47ac9ba3c878', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Victoria Brigifine Valiant Tantra', '', 'sembunyikan', 'sembunyikan', '', '', '17611*', '14', '19', '33', ''),
(5142, '17627', 'd2f1d826fab2ff3a823033d75b49a5cd', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'William Sintan Sutanto', '', 'sembunyikan', 'sembunyikan', '', '', '17627*', '14', '19', '34', ''),
(5143, '17629', '016b3ccb1837bc3071cdb6f3981b7eaf', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Wilson Suryawan', '', 'sembunyikan', 'sembunyikan', '', '', '17629*', '14', '19', '35', ''),
(5144, '17640', '08d6c5ba3df458d82a46d4a3171b2342', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Yongki Chandra', '', 'sembunyikan', 'sembunyikan', '', '', '17640*', '14', '19', '36', ''),
(5145, '17644', '49a153dd8009ef552d68c33d68d7d1f7', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Vincent Aristo', '', 'sembunyikan', 'sembunyikan', '', '', '17644*', '14', '19', '37', ''),
(5146, '17266', 'a788255cf522527124098be6afb76933', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Aldo Setyawan Jaya', '', 'sembunyikan', 'sembunyikan', '', '', '17266*', '14', '20', '1', ''),
(5147, '17278', 'c088f2242e8b90a976c8302d332e15e7', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Amadeo Maheswara Balapradhana', '', 'sembunyikan', 'sembunyikan', '', '', '17278*', '14', '20', '2', ''),
(5148, '17279', 'b02cc668e60be7ea92a9460fd237292b', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Amanda Tosya', '', 'sembunyikan', 'sembunyikan', '', '', '17279*', '14', '20', '3', ''),
(5149, '17284', '33c955c9b03f01364eea4bbc08fc83ed', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Andre Gunawan', '', 'sembunyikan', 'sembunyikan', '', '', '17284*', '14', '20', '4', ''),
(5150, '17330', '341809c0e1f9ea09c9983998a7eb3b38', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Christian Felix Tjandra', '', 'sembunyikan', 'sembunyikan', '', '', '17330*', '14', '20', '5', ''),
(5151, '17337', '12d60ebff4b62543cd89a41ae3407699', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Citra Kharisma Dewi', '', 'sembunyikan', 'sembunyikan', '', '', '17337*', '14', '20', '6', ''),
(5152, '17345', '18ebd09daa9cb46c03ffd067f9794c18', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Dariel Syah Putra Sudjono', '', 'sembunyikan', 'sembunyikan', '', '', '17345*', '14', '20', '7', ''),
(5153, '17367', '648b825571f051527735d6688feb4297', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Elvina Irine Anggaraini Winata', '', 'sembunyikan', 'sembunyikan', '', '', '17367*', '14', '20', '8', ''),
(5154, '17372', '7c27c41abcb49f2c512b150cee540b54', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Erinne Natasha Yonanda Henoek', '', 'sembunyikan', 'sembunyikan', '', '', '17372*', '14', '20', '9', ''),
(5155, '17379', '69dea1397236a2e12da93d1389e1c1b3', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Feilycia Soedrajad', '', 'sembunyikan', 'sembunyikan', '', '', '17379*', '14', '20', '10', ''),
(5156, '17386', 'e449d5d409b24396bb9b7cee2ceefad0', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Felix Hartanto', '', 'sembunyikan', 'sembunyikan', '', '', '17386*', '14', '20', '11', ''),
(5157, '17397', '8b77e968bfba08b6306b06f3ce3c5b80', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Florencia Lianggono', '', 'sembunyikan', 'sembunyikan', '', '', '17397*', '14', '20', '12', ''),
(5158, '17401', '9b22de682ed6f072a36d908273cd66c1', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Fransiskus Rodriggo J.', '', 'sembunyikan', 'sembunyikan', '', '', '17401*', '14', '20', '13', ''),
(5159, '17409', 'c8aef2341932422a7f9f1a669a6ed6cf', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Giovanni Ivo Devito Putra', '', 'sembunyikan', 'sembunyikan', '', '', '17409*', '14', '20', '14', ''),
(5160, '17427', '5dbad8581c78152da6db8075a4729e66', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Hilda Lukito', '', 'sembunyikan', 'sembunyikan', '', '', '17427*', '14', '20', '15', ''),
(5161, '17432', '6e8bc0c63740acc865eeb22994c99793', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ignatius Reinaldo Lemuel', '', 'sembunyikan', 'sembunyikan', '', '', '17432*', '14', '20', '16', ''),
(5162, '17440', '75ae8f5ad4f2c0d75eaed72154b6f612', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jacqueline Vivi Gunawan', '', 'sembunyikan', 'sembunyikan', '', '', '17440*', '14', '20', '17', ''),
(5163, '17452', 'e73443450d16a627a9f703d698157f25', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jonathan Adrianus', '', 'sembunyikan', 'sembunyikan', '', '', '17452*', '14', '20', '18', ''),
(5164, '17464', '7f6faec34fa31508e27ebef3c8605cc1', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Kevin Lunganto', '', 'sembunyikan', 'sembunyikan', '', '', '17464*', '14', '20', '19', '');
INSERT INTO `useraura` (`UserId`, `user`, `password`, `level`, `tipe`, `is_online`, `last_ping`, `start`, `exp`, `nama`, `photo`, `statusemail`, `statustelp`, `email`, `telp`, `password2`, `tahunajaran`, `kelas`, `absen`, `urutan`) VALUES
(5165, '17478', 'c869bc2b7db2a9a56aa63af6a420bb8e', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Laurensius Alexander', '', 'sembunyikan', 'sembunyikan', '', '', '17478*', '14', '20', '20', ''),
(5166, '17492', '5f8f66acfdf2909505f7ba21d5423fa1', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Marcelino Hefialdo Soetikno', '', 'sembunyikan', 'sembunyikan', '', '', '17492*', '14', '20', '21', ''),
(5167, '17498', 'e2b662b1e5afb919c148c67d60beedb3', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Matias Irvan Rivaldy', '', 'sembunyikan', 'sembunyikan', '', '', '17498*', '14', '20', '22', ''),
(5168, '17500', '1339da62612e96994b9882168d508d0b', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Maxi Millian Haris', '', 'sembunyikan', 'sembunyikan', '', '', '17500*', '14', '20', '23', ''),
(5169, '17504', '8ac874e578cb55997456ede3893521b2', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Melisa Krisnawati', '', 'sembunyikan', 'sembunyikan', '', '', '17504*', '14', '20', '24', ''),
(5170, '17511', '73260028c908b3c53c665b9ce04b54a8', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Michael Christawan', '', 'sembunyikan', 'sembunyikan', '', '', '17511*', '14', '20', '25', ''),
(5171, '17515', '716c6109e1e7deb90bb154b1baf8bb38', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Michael Sanjaya', '', 'sembunyikan', 'sembunyikan', '', '', '17515*', '14', '20', '26', ''),
(5172, '17520', '74bd696d6e9debde4205ea0a2ea28800', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Michelle Hendrawan', '', 'sembunyikan', 'sembunyikan', '', '', '17520*', '14', '20', '27', ''),
(5173, '17537', '5343a796e0f5085390f0fad434f85049', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Patricia Claudiana Bulin', '', 'sembunyikan', 'sembunyikan', '', '', '17537*', '14', '20', '28', ''),
(5174, '17538', '63ecb2babf2a199d6a0c8f87b05941e9', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Patricia Khantijaya Lindarto', '', 'sembunyikan', 'sembunyikan', '', '', '17538*', '14', '20', '29', ''),
(5175, '17547', 'd9194de9fd25550b7a5679f8a7a5b524', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Richard Christian Soedjono', '', 'sembunyikan', 'sembunyikan', '', '', '17547*', '14', '20', '30', ''),
(5176, '17587', 'aab9c88be156b5e6b7ef538d74888f24', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Sylvia Novencia Shally Wilona', '', 'sembunyikan', 'sembunyikan', '', '', '17587*', '14', '20', '31', ''),
(5177, '17589', 'c1cf0230345fa732a8e763538ef96c9f', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'TANIA', '', 'sembunyikan', 'sembunyikan', '', '', '17589*', '14', '20', '32', ''),
(5178, '17598', '8dbe420c494dd8c0f1c4902c19a342b6', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Thomas Rio Erdian', '', 'sembunyikan', 'sembunyikan', '', '', '17598*', '14', '20', '33', ''),
(5179, '17631', '4fb67357f7dd20830305c3be4e1914ad', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Yemima Lidya Veronica', '', 'sembunyikan', 'sembunyikan', '', '', '17631*', '14', '20', '34', ''),
(5180, '17641', '8e5b294a1c801aa3529a3b15b5058b9d', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Yongki Tanumiarjo', '', 'sembunyikan', 'sembunyikan', '', '', '17641*', '14', '20', '35', ''),
(5181, '17259', '8825918286047875990aad9b901c651c', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Aicie Ogilvy', '', 'sembunyikan', 'sembunyikan', '', '', '17259*', '14', '21', '1', ''),
(5182, '17260', 'af22f5bfde6cf1e9e9cdea38389ca760', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Alan Dharma Saputra Wijaya', '', 'sembunyikan', 'sembunyikan', '', '', '17260*', '14', '21', '2', ''),
(5183, '17280', '1899ad8d4ef6814924558627ab82ccab', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Amelia Elisabeth Meliangan', '', 'sembunyikan', 'sembunyikan', '', '', '17280*', '14', '21', '3', ''),
(5184, '17296', '6857a8a7751e562cdbb59557f1cd09fa', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Anggraeni S.L', '', 'sembunyikan', 'sembunyikan', '', '', '17296*', '14', '21', '4', ''),
(5185, '17300', 'f688527e4824bcdd3e22879a9162a58e', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Anthony Surya Anggono', '', 'sembunyikan', 'sembunyikan', '', '', '17300*', '14', '21', '5', ''),
(5186, '17319', '93f2ff5d3d6a6d20b50f7f176547189b', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Brigitta Angeline', '', 'sembunyikan', 'sembunyikan', '', '', '17319*', '14', '21', '6', ''),
(5187, '17320', 'e33794022823a086a87c58145e8baf66', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Brillian Haryanto', '', 'sembunyikan', 'sembunyikan', '', '', '17320*', '14', '21', '7', ''),
(5188, '17321', 'a265ca40ec10ae80594063a2ed3cf8a7', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Bryan Kristanto', '', 'sembunyikan', 'sembunyikan', '', '', '17321*', '14', '21', '8', ''),
(5189, '17338', '097eb5ec8f8edd13b2bff2715ec29caa', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Cliffaye Aurellia Wheatley', '', 'sembunyikan', 'sembunyikan', '', '', '17338*', '14', '21', '9', ''),
(5190, '17359', '730fb81c6bf68e48ab5bd8a71e88617a', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Elisa Renaldo Andriessen', '', 'sembunyikan', 'sembunyikan', '', '', '17359*', '14', '21', '10', ''),
(5191, '17361', '0c2e528e4f5be42a208885354fa10a41', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Elisabeth Novianti', '', 'sembunyikan', 'sembunyikan', '', '', '17361*', '14', '21', '11', ''),
(5192, '17374', 'd8a85d2308f56ca5d58b930fac61deb8', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Eugene Jappy', '', 'sembunyikan', 'sembunyikan', '', '', '17374*', '14', '21', '12', ''),
(5193, '17392', 'e5f1f73ece880187d6f2e909489501a1', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Fernando Tanujaya', '', 'sembunyikan', 'sembunyikan', '', '', '17392*', '14', '21', '13', ''),
(5194, '17398', '68a3a71180242e6b06cb52af18ffeab2', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Francisca Meliani', '', 'sembunyikan', 'sembunyikan', '', '', '17398*', '14', '21', '14', ''),
(5195, '17399', '56d460592b6f8c83a688f072937415d3', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'FRANCISCO AARON', '', 'sembunyikan', 'sembunyikan', '', '', '17399*', '14', '21', '15', ''),
(5196, '17402', '738e90d91050f21dfce4d04cff7aefa3', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Gabriel Adisurya', '', 'sembunyikan', 'sembunyikan', '', '', '17402*', '14', '21', '16', ''),
(5197, '17406', 'f99dab421c5073ad827b7d27077b7808', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Georgia Nikita', '', 'sembunyikan', 'sembunyikan', '', '', '17406*', '14', '21', '17', ''),
(5198, '17413', '938e135f039de311299f6db21a668aa5', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Grace Priscillia', '', 'sembunyikan', 'sembunyikan', '', '', '17413*', '14', '21', '18', ''),
(5199, '17415', 'c02f310785ba322f249d63953d25aa24', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Graciella Meilia', '', 'sembunyikan', 'sembunyikan', '', '', '17415*', '14', '21', '19', ''),
(5200, '17424', '008881cb93c96ddac6880381617d1dcd', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Heinrich Wisesa', '', 'sembunyikan', 'sembunyikan', '', '', '17424*', '14', '21', '20', ''),
(5201, '17433', '5156894fadbc9e7b1721ccb950314224', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ignatius Steven Go', '', 'sembunyikan', 'sembunyikan', '', '', '17433*', '14', '21', '21', ''),
(5202, '17441', 'a8bd97510a2b2602eaf81339a7e4915e', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jane Tennia Dwi Putri', '', 'sembunyikan', 'sembunyikan', '', '', '17441*', '14', '21', '22', ''),
(5203, '17448', 'ed1109b7cf0f094fa129f9318b586e31', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jevon', '', 'sembunyikan', 'sembunyikan', '', '', '17448*', '14', '21', '23', ''),
(5204, '17460', 'd094b648a9512ac5b9e82b4e441047e3', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Kenny Susanto', '', 'sembunyikan', 'sembunyikan', '', '', '17460*', '14', '21', '24', ''),
(5205, '17472', '209dde9b61fa441247b888c316bd9701', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Kornelius Vieno Zico Wahono', '', 'sembunyikan', 'sembunyikan', '', '', '17472*', '14', '21', '25', ''),
(5206, '17521', 'c46bd41c66ff0f2c0c620a6164ea1bc7', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Michelle Natajaya Hermawan', '', 'sembunyikan', 'sembunyikan', '', '', '17521*', '14', '21', '26', ''),
(5207, '17524', '3964ddbebeeb9dd61b2e1284c0c2fd4b', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Monica Gabriel Widiyowati', '', 'sembunyikan', 'sembunyikan', '', '', '17524*', '14', '21', '27', ''),
(5208, '17534', 'a30d9a77300e9a82d9c3d1528c0c8e3e', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Olivia Michaela', '', 'sembunyikan', 'sembunyikan', '', '', '17534*', '14', '21', '28', ''),
(5209, '17541', 'd383767b9d78652f2bf82e247a2b1555', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Pieter Bryan Ang', '', 'sembunyikan', 'sembunyikan', '', '', '17541*', '14', '21', '29', ''),
(5210, '17553', 'de3f0af91f25d23595ccd11222bba352', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Rizky Ryan Kurniawan', '', 'sembunyikan', 'sembunyikan', '', '', '17553*', '14', '21', '30', ''),
(5211, '17559', '6c6aca6521c65a60d8157d401f7108fe', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ryo Alvin Suritiono', '', 'sembunyikan', 'sembunyikan', '', '', '17559*', '14', '21', '31', ''),
(5212, '17588', '399e414f437bbd55f084475ce19906de', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Tan Tau Siang', '', 'sembunyikan', 'sembunyikan', '', '', '17588*', '14', '21', '32', ''),
(5213, '17607', '1fd5b2816440f401004d548fe98bedac', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Vanessa Gunawan', '', 'sembunyikan', 'sembunyikan', '', '', '17607*', '14', '21', '33', ''),
(5214, '17614', '2fbfb2b50eae95a65f6c9bbabb061eb8', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Vincentius Edbert Arijaya', '', 'sembunyikan', 'sembunyikan', '', '', '17614*', '14', '21', '34', ''),
(5215, '17628', '4b1b4a307bc1b475f783d22c6d2f781e', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'William Tandio Putra', '', 'sembunyikan', 'sembunyikan', '', '', '17628*', '14', '21', '35', ''),
(5216, '17635', 'd781f7b110651a29c0d918e8594a126c', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Yoggi Kuncoro', '', 'sembunyikan', 'sembunyikan', '', '', '17635*', '14', '21', '36', ''),
(5217, '17275', '1d48aa588522125076a4e03129ec6ad1', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Aloysius Seno Aji Pambudi', '', 'sembunyikan', 'sembunyikan', '', '', '17275*', '14', '22', '1', ''),
(5218, '17283', '837f63113caf24b382ff4c59f315a724', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Andi Livianto Halim', '', 'sembunyikan', 'sembunyikan', '', '', '17283*', '14', '22', '2', ''),
(5219, '17289', '9d68ae8e0f3d3f8bc4a4c8c62564096e', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Andrew Limorita', '', 'sembunyikan', 'sembunyikan', '', '', '17289*', '14', '22', '3', ''),
(5220, '17292', '178970889ee0cb5abe3d897cf0b77e23', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Angelo Alexander', '', 'sembunyikan', 'sembunyikan', '', '', '17292*', '14', '22', '4', ''),
(5221, '17306', 'b34c965c0de2438fca5fcdfb5a89d4c9', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Audricahma Theressa Arus Decstracountanty', '', 'sembunyikan', 'sembunyikan', '', '', '17306*', '14', '22', '5', ''),
(5222, '17313', '423a2729e2cf073745ea0d6dd15a8da0', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Billgay Flegon Patrobas Tambengi', '', 'sembunyikan', 'sembunyikan', '', '', '17313*', '14', '22', '6', ''),
(5223, '17316', 'e34f1bb55f3b9ae4fec5653d6fd56d5b', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Bobby Hartanto', '', 'sembunyikan', 'sembunyikan', '', '', '17316*', '14', '22', '7', ''),
(5224, '17333', '4d30b5ca4a90cb33a0c862a0fa9d8e6f', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Christina Yunita Widjaja', '', 'sembunyikan', 'sembunyikan', '', '', '17333*', '14', '22', '8', ''),
(5225, '17340', '2812f0df9baa4d4ecf5c9086f88f1eff', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Cornelius Ardian', '', 'sembunyikan', 'sembunyikan', '', '', '17340*', '14', '22', '9', ''),
(5226, '17348', 'f56f3cf574f49fafa04bae6af95a5360', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'David Wiyono', '', 'sembunyikan', 'sembunyikan', '', '', '17348*', '14', '22', '10', ''),
(5227, '17352', 'e09235be0262cdb92f2d1f80df982c5d', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'DEVIANA NATALIA WIDAYAT', '', 'sembunyikan', 'sembunyikan', '', '', '17352*', '14', '22', '11', ''),
(5228, '17353', 'dbf26fe859944cedce7ec8eeb62a8654', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Devina Aprilya', '', 'sembunyikan', 'sembunyikan', '', '', '17353*', '14', '22', '12', ''),
(5229, '17363', 'ae1664bcb185066642074ca804d6ef4e', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ellen Angelina', '', 'sembunyikan', 'sembunyikan', '', '', '17363*', '14', '22', '13', ''),
(5230, '17365', 'e2718afbee8fd45c0bd9e4baa5dd5343', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ellen Yovita Tedjo', '', 'sembunyikan', 'sembunyikan', '', '', '17365*', '14', '22', '14', ''),
(5231, '17387', '788e63d4da57b2663fd52b0f59a3f8e1', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Felix Shan', '', 'sembunyikan', 'sembunyikan', '', '', '17387*', '14', '22', '15', ''),
(5232, '17405', 'f958287125430a796af513317d6a1650', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Gary Owen Milawijaya', '', 'sembunyikan', 'sembunyikan', '', '', '17405*', '14', '22', '16', ''),
(5233, '17428', '9581c18f55246b2c5804c23287ff27cc', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'I Putu Charles Yuanuar', '', 'sembunyikan', 'sembunyikan', '', '', '17428*', '14', '22', '17', ''),
(5234, '17445', 'bfc34d47d6016be08a05f70e1a919692', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jessica Amanda Wohon', '', 'sembunyikan', 'sembunyikan', '', '', '17445*', '14', '22', '18', ''),
(5235, '17450', 'd9c8f3a0979923ce1a7daeceead16288', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Johanes', '', 'sembunyikan', 'sembunyikan', '', '', '17450*', '14', '22', '19', ''),
(5236, '17454', '04855fdffc167c5e0e09e4f42e7d86da', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jonathan Stanley', '', 'sembunyikan', 'sembunyikan', '', '', '17454*', '14', '22', '20', ''),
(5237, '17486', '6d5d450031151a72608297eb6301b51b', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Lourensia Wijaya', '', 'sembunyikan', 'sembunyikan', '', '', '17486*', '14', '22', '21', ''),
(5238, '17491', '42df43b512b731584081396537058775', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Madeline Audryana', '', 'sembunyikan', 'sembunyikan', '', '', '17491*', '14', '22', '22', ''),
(5239, '17501', '749fd354de7da10dc936644b2b290d67', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Maximillian Arthur Ardi Prakoso', '', 'sembunyikan', 'sembunyikan', '', '', '17501*', '14', '22', '23', ''),
(5240, '17505', '66cac5f656e26892ce24e1c82b41a50b', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Melissa Marvella', '', 'sembunyikan', 'sembunyikan', '', '', '17505*', '14', '22', '24', ''),
(5241, '17526', 'd2ad0887eda4fb4fa53f4a7c4658d79a', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Neillen Yang', '', 'sembunyikan', 'sembunyikan', '', '', '17526*', '14', '22', '25', ''),
(5242, '17531', '3c108fbb67fef913c3b763a8fde8ec7f', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Novy Prameswari Regina Dermawan', '', 'sembunyikan', 'sembunyikan', '', '', '17531*', '14', '22', '26', ''),
(5243, '17533', '5bf775f95830f873cc021f659f538f00', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Olivia Madeleine', '', 'sembunyikan', 'sembunyikan', '', '', '17533*', '14', '22', '27', ''),
(5244, '17546', '4dc39fafd0d5fdffc3fe83a43be6b7d6', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Reynaldy Susiandi', '', 'sembunyikan', 'sembunyikan', '', '', '17546*', '14', '22', '28', ''),
(5245, '17549', 'bec0d7139993b55e13b8003313641953', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Richard Gunawan', '', 'sembunyikan', 'sembunyikan', '', '', '17549*', '14', '22', '29', ''),
(5246, '17556', '1b9a0ee0005384736dc272adcfffabfe', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Rosseline Veronica', '', 'sembunyikan', 'sembunyikan', '', '', '17556*', '14', '22', '30', ''),
(5247, '17563', 'a26171cffcfb05ef607788431a209996', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Sharon Dorothy Sacharissa', '', 'sembunyikan', 'sembunyikan', '', '', '17563*', '14', '22', '31', ''),
(5248, '17577', '294ed27798e58b920f864dc680beda7e', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Stefhanie Florencia Enggano', '', 'sembunyikan', 'sembunyikan', '', '', '17577*', '14', '22', '32', ''),
(5249, '17580', '3966755b78dfc2b0e612e9b5a21bf7dc', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Stephen Jaya Saputra', '', 'sembunyikan', 'sembunyikan', '', '', '17580*', '14', '22', '33', ''),
(5250, '17583', 'fd3a9bd6c2690621b33f4731f9373b9c', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Steven Febrianto Goenawan', '', 'sembunyikan', 'sembunyikan', '', '', '17583*', '14', '22', '34', ''),
(5251, '17636', '34d36f737cd6e3a13b8b83435c2c6110', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Yohanes David Winata', '', 'sembunyikan', 'sembunyikan', '', '', '17636*', '14', '22', '35', ''),
(5252, '17639', '79577411f503be129fe5199140bd8fc3', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Yonathan Sutanto', '', 'sembunyikan', 'sembunyikan', '', '', '17639*', '14', '22', '36', ''),
(5253, '17256', '596ebdae1f669046c73013c20c754664', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Adhytia Dwi Dharma Putra', '', 'sembunyikan', 'sembunyikan', '', '', '17256*', '14', '23', '1', ''),
(5254, '17263', '4aa1f7f22af956d461c7d7ec36bc5425', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Albert Sukadi', '', 'sembunyikan', 'sembunyikan', '', '', '17263*', '14', '23', '2', ''),
(5255, '17285', 'a530ef8865919cde359843fb1ac250e0', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Andre Luciano F. Chaery', '', 'sembunyikan', 'sembunyikan', '', '', '17285*', '14', '23', '3', ''),
(5256, '17288', 'bc0e5e28b9c2556011e2267740bbc14a', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ANDREW ANGGADA', '', 'sembunyikan', 'sembunyikan', '', '', '17288*', '14', '23', '4', ''),
(5257, '17307', '414b468682192dee9f19df0c961c8d9e', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ayliana Virrena Halim', '', 'sembunyikan', 'sembunyikan', '', '', '17307*', '14', '23', '5', ''),
(5258, '17329', '321233178066cc5979394d20dad38a9e', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Christian Alvin', '', 'sembunyikan', 'sembunyikan', '', '', '17329*', '14', '23', '6', ''),
(5259, '17331', 'ac38af2dbf1a89c180d72552e9c47bbb', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Christian LImantara', '', 'sembunyikan', 'sembunyikan', '', '', '17331*', '14', '23', '7', ''),
(5260, '17349', 'b61777f7a301e1e44d9ee2369be24583', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Delvin Laurence', '', 'sembunyikan', 'sembunyikan', '', '', '17349*', '14', '23', '8', ''),
(5261, '17351', '63ac864b079725c40ca4a7f6fb41ca68', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Deogracianno Lucky', '', 'sembunyikan', 'sembunyikan', '', '', '17351*', '14', '23', '9', ''),
(5262, '17364', 'ca605ff1f701738cecec4258dd004fbd', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ELLEN FELIANA', '', 'sembunyikan', 'sembunyikan', '', '', '17364*', '14', '23', '10', ''),
(5263, '17366', '4aefaf8fc219e363e8a857e00146dc4c', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ELVARETHA AURELLIE', '', 'sembunyikan', 'sembunyikan', '', '', '17366*', '14', '23', '11', ''),
(5264, '17383', '55d8f930963a443d4009f726ae23040f', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Felicya Christina Wjaya', '', 'sembunyikan', 'sembunyikan', '', '', '17383*', '14', '23', '12', ''),
(5265, '17388', '6176c5116780d8fdf10d96fcba41c385', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Felix Tanjiro Sutanto', '', 'sembunyikan', 'sembunyikan', '', '', '17388*', '14', '23', '13', ''),
(5266, '17412', '5f922f173fed4a21b7afd776ab98da07', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Grace Layrensius', '', 'sembunyikan', 'sembunyikan', '', '', '17412*', '14', '23', '14', ''),
(5267, '17443', 'c47624bc289d46f3d0895cddc86e936f', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jenneta Virenna Rachmad', '', 'sembunyikan', 'sembunyikan', '', '', '17443*', '14', '23', '15', ''),
(5268, '17446', '1095af76927dd9c834cdbd721a6a19e8', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jessica Christian', '', 'sembunyikan', 'sembunyikan', '', '', '17446*', '14', '23', '16', ''),
(5269, '17465', '7c9918bd08090da962ee16ea4866807c', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Kevin Reinaldo Santoso', '', 'sembunyikan', 'sembunyikan', '', '', '17465*', '14', '23', '17', ''),
(5270, '17469', 'b8c9ca802a10b1950066021922436e1d', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Kimberly Aprilia Harianto', '', 'sembunyikan', 'sembunyikan', '', '', '17469*', '14', '23', '18', ''),
(5271, '17476', '44cd067c975ca02b313c9914e9475f27', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'KRISTIAN KEVIN SUYONO', '', 'sembunyikan', 'sembunyikan', '', '', '17476*', '14', '23', '19', ''),
(5272, '17482', '6a8335b46c372e272a7f9bf98a622b61', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'LIDYA YONATAN', '', 'sembunyikan', 'sembunyikan', '', '', '17482*', '14', '23', '20', ''),
(5273, '17488', '595d82baccecad794281729d740f19d1', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Lucas himawan Yonathan Kahar', '', 'sembunyikan', 'sembunyikan', '', '', '17488*', '14', '23', '21', ''),
(5274, '17507', 'e24b9abe029b195ed497edac0faf0ba0', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Melly Mar William', '', 'sembunyikan', 'sembunyikan', '', '', '17507*', '14', '23', '22', ''),
(5275, '17519', '43766e51803ccc399767210169bdaa62', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Michelle Elvira', '', 'sembunyikan', 'sembunyikan', '', '', '17519*', '14', '23', '23', ''),
(5276, '17532', '92a393546263669da5ce924528e85acd', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Oliver Christian', '', 'sembunyikan', 'sembunyikan', '', '', '17532*', '14', '23', '24', ''),
(5277, '17540', '21eb8e86e1a0358a7fcb8c95484e0a47', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Patrick Hartono', '', 'sembunyikan', 'sembunyikan', '', '', '17540*', '14', '23', '25', ''),
(5278, '17543', 'e97de2a0bda70d4f0280c26d64e404ec', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Regine Audrea', '', 'sembunyikan', 'sembunyikan', '', '', '17543*', '14', '23', '26', ''),
(5279, '17554', 'b5c073424486c59eefa1297772fd9f35', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ronaldo Alexander', '', 'sembunyikan', 'sembunyikan', '', '', '17554*', '14', '23', '27', ''),
(5280, '17555', '9f40f3d9928587a457c4ce8cc707d8aa', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ronaldo Davincent Tandiono', '', 'sembunyikan', 'sembunyikan', '', '', '17555*', '14', '23', '28', ''),
(5281, '17571', '871ea32c489419474e0ff6326f6a951d', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Stefanie Angelina Gunarto', '', 'sembunyikan', 'sembunyikan', '', '', '17571*', '14', '23', '29', ''),
(5282, '17573', '1e6d209099d270143e840c0535fa9019', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Stefanus Fany Nagas Pamungkas', '', 'sembunyikan', 'sembunyikan', '', '', '17573*', '14', '23', '30', ''),
(5283, '17585', 'e96ed81a179310b28576c99bfed8bab1', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Steven Lie', '', 'sembunyikan', 'sembunyikan', '', '', '17585*', '14', '23', '31', ''),
(5284, '17595', '34ce24c6aa38dba361baf791aae9e1cd', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Thalia Marvelyn Satya', '', 'sembunyikan', 'sembunyikan', '', '', '17595*', '14', '23', '32', ''),
(5285, '17596', '9f4a82875408a6602de565f79fcf6b96', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'THEODORUS WIDYAWAN', '', 'sembunyikan', 'sembunyikan', '', '', '17596*', '14', '23', '33', ''),
(5286, '17616', '24b89f5f2a8508f4b3dd1b22ca24e127', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'VINCENTIUS MARCO GOSAL', '', 'sembunyikan', 'sembunyikan', '', '', '17616*', '14', '23', '34', ''),
(5287, '17619', 'd5d9aae0ea84820414abf9ff5a232d20', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Vodalus Parameswara', '', 'sembunyikan', 'sembunyikan', '', '', '17619*', '14', '23', '35', ''),
(5288, '17638', 'adb7bb91b7ffaf5e31029f53e0c5d61b', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Yolanda Katharina Constantin S', '', 'sembunyikan', 'sembunyikan', '', '', '17638*', '14', '23', '36', ''),
(5289, '17006', '5d65861739674d41086f4fad838e6b65', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Daniel Agustinus Wijaya', '', 'sembunyikan', 'sembunyikan', '', '', '17006*', '14', '24', '1', ''),
(5290, '17262', '7be4bbf141e01302118b7c59a118a6bd', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Alber Tjan', '', 'sembunyikan', 'sembunyikan', '', '', '17262*', '14', '24', '2', ''),
(5291, '17271', '1b9ad370e0ed34ea2435a45f4728716d', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Alxander Reynard Likawijaya', '', 'sembunyikan', 'sembunyikan', '', '', '17271*', '14', '24', '3', ''),
(5292, '17302', 'bd49c92a44b3dfd079fedac3ec5f3600', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Antonius Richard Hutomo', '', 'sembunyikan', 'sembunyikan', '', '', '17302*', '14', '24', '4', ''),
(5293, '17311', '6084971d2c24d22df6cd522673ca45f4', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Bella Leticia', '', 'sembunyikan', 'sembunyikan', '', '', '17311*', '14', '24', '5', ''),
(5294, '17317', '031f42f0fc3392494375ee4151bd914c', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Brama Andika', '', 'sembunyikan', 'sembunyikan', '', '', '17317*', '14', '24', '6', ''),
(5295, '17326', 'f4a12edfc23acf211d39988c3022969e', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Caroline Claudia Christofan', '', 'sembunyikan', 'sembunyikan', '', '', '17326*', '14', '24', '7', ''),
(5296, '17339', 'cd2cb33d38fa8ecbf8c9f64ba7e4283a', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Cornelia Geraldine', '', 'sembunyikan', 'sembunyikan', '', '', '17339*', '14', '24', '8', ''),
(5297, '17341', 'dddc1e9d122a63873c0c0463f7a68479', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Cornelius Bryan DK', '', 'sembunyikan', 'sembunyikan', '', '', '17341*', '14', '24', '9', ''),
(5298, '17346', '802cf2d9737c5b524f667cdc0a4d5b90', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Darmadi Pranata', '', 'sembunyikan', 'sembunyikan', '', '', '17346*', '14', '24', '10', ''),
(5299, '17350', '833aaeda4054a3c1677da0367d09a2c7', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Demetria Stacey', '', 'sembunyikan', 'sembunyikan', '', '', '17350*', '14', '24', '11', ''),
(5300, '17358', '71b51b99141e0c8f821ac5efe12fe24d', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Edvardo Peter Handojo', '', 'sembunyikan', 'sembunyikan', '', '', '17358*', '14', '24', '12', ''),
(5301, '17362', 'dd6a2f1d1b9b449541b7e2fb380d12db', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Elizabeth Fiona Cahyadi', '', 'sembunyikan', 'sembunyikan', '', '', '17362*', '14', '24', '13', ''),
(5302, '17375', '73206f4caf9c8bc7f9a44c0137142441', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Evelina Larisa', '', 'sembunyikan', 'sembunyikan', '', '', '17375*', '14', '24', '14', ''),
(5303, '17377', 'f9deff845a70ca5506c2ae58c444e41f', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Evelyn Tjitrodjojo', '', 'sembunyikan', 'sembunyikan', '', '', '17377*', '14', '24', '15', ''),
(5304, '17390', 'e1b2eea7bb1df22cde172d226d6624fd', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Feressa Priscilla Horman', '', 'sembunyikan', 'sembunyikan', '', '', '17390*', '14', '24', '16', ''),
(5305, '17421', '66bcf9293a62e1021516e3e799678f7f', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Gwyneth Audrey', '', 'sembunyikan', 'sembunyikan', '', '', '17421*', '14', '24', '17', ''),
(5306, '17431', '8f09d1d12455ed88890b7f24364c7ec0', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ignatius Leonard Oeijaya', '', 'sembunyikan', 'sembunyikan', '', '', '17431*', '14', '24', '18', ''),
(5307, '17442', 'a1ce49feddd728142817bedb7cfb52fc', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jennisca Hendrawan', '', 'sembunyikan', 'sembunyikan', '', '', '17442*', '14', '24', '19', ''),
(5308, '17451', '46fcfbcf04d1e163dcbf1078ba19477d', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Johanes Teddy', '', 'sembunyikan', 'sembunyikan', '', '', '17451*', '14', '24', '20', ''),
(5309, '17455', '94817891d27c47e8b8b40125d1b4e2fc', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jovan Zachary Winarno', '', 'sembunyikan', 'sembunyikan', '', '', '17455*', '14', '24', '21', ''),
(5310, '17461', 'a90c794e078061fec5a22384bbd7c7a5', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Kevin Angka Wijaya', '', 'sembunyikan', 'sembunyikan', '', '', '17461*', '14', '24', '22', ''),
(5311, '17473', '73c2e8f48c4d8c3978a667b8ef116433', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Kreszens Hidayat', '', 'sembunyikan', 'sembunyikan', '', '', '17473*', '14', '24', '23', ''),
(5312, '17489', '9c69c3b30b83700182f41a75185b63f4', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ludwina Asaleo', '', 'sembunyikan', 'sembunyikan', '', '', '17489*', '14', '24', '24', ''),
(5313, '17490', '0187c58626efd1bb49e5cee9e2c64a3a', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Luist Yansen', '', 'sembunyikan', 'sembunyikan', '', '', '17490*', '14', '24', '25', ''),
(5314, '17496', 'aec425051788f518220c73bb1e3a1f79', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Martha Aji Kuntadewi', '', 'sembunyikan', 'sembunyikan', '', '', '17496*', '14', '24', '26', ''),
(5315, '17536', '5c8c37f9781d37cc6757238a74cf658c', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Owen Rahadiyan Budi', '', 'sembunyikan', 'sembunyikan', '', '', '17536*', '14', '24', '27', ''),
(5316, '17551', 'dfc60fa544bedccfcf404d8326ae58fe', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'RICHARD SOEGITO', '', 'sembunyikan', 'sembunyikan', '', '', '17551*', '14', '24', '28', ''),
(5317, '17557', '28ab4140dc2ad7b60d3b4b7dde8353c3', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ruddy Darmana', '', 'sembunyikan', 'sembunyikan', '', '', '17557*', '14', '24', '29', ''),
(5318, '17561', 'c3196f507fc872701165041e1c7b5064', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Satria Setyo', '', 'sembunyikan', 'sembunyikan', '', '', '17561*', '14', '24', '30', ''),
(5319, '17564', 'adf23a7a33beee94eb81044fcbcb92b3', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Sherina Angelina', '', 'sembunyikan', 'sembunyikan', '', '', '17564*', '14', '24', '31', ''),
(5320, '17600', '8a1a860a330aac143bd843fb7d1523b2', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Tiffany Halim', '', 'sembunyikan', 'sembunyikan', '', '', '17600*', '14', '24', '32', ''),
(5321, '17603', 'dfa14bf59afbfee74ddc6599d88b724d', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Valensia Stevin Kristsyella Poernomo', '', 'sembunyikan', 'sembunyikan', '', '', '17603*', '14', '24', '33', ''),
(5322, '17621', '113976bece1908874199e96ec2e13b0d', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Wibowo', '', 'sembunyikan', 'sembunyikan', '', '', '17621*', '14', '24', '34', ''),
(5323, '17625', 'b1f182947d1fc83cf1cd3833636ff6f8', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'William Giovanno', '', 'sembunyikan', 'sembunyikan', '', '', '17625*', '14', '24', '35', ''),
(5324, '17626', '8faa3e7a6e550f2431a43d1750e7ed20', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'William Gondowidjaja', '', 'sembunyikan', 'sembunyikan', '', '', '17626*', '14', '24', '36', ''),
(5325, '16942', '2df26be3d6ed6c2c2ab5ce748d29f412', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Alexander Diga Simamora', '', 'sembunyikan', 'sembunyikan', '', '', '16942*', '14', '26', '1', ''),
(5326, '17261', '4789dec60691ad89539012cc17410c62', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Albella Valeria', '', 'sembunyikan', 'sembunyikan', '', '', '17261*', '14', '26', '2', ''),
(5327, '17269', '458403cca398a199daf6f32190282a5a', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Alexander Hartono', '', 'sembunyikan', 'sembunyikan', '', '', '17269*', '14', '26', '3', ''),
(5328, '17281', 'b0368396d0fb23e571f01f7241b7ef5c', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Anastasya Sienny Citra Anggoro', '', 'sembunyikan', 'sembunyikan', '', '', '17281*', '14', '26', '4', ''),
(5329, '17301', 'fc6544252b8769aaee03ecdb9a63f4af', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Antonius Johan Suyanto', '', 'sembunyikan', 'sembunyikan', '', '', '17301*', '14', '26', '5', ''),
(5330, '17309', 'c8dc7b677ab421fe286424d8faeca00c', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Beatrix Gotama', '', 'sembunyikan', 'sembunyikan', '', '', '17309*', '14', '26', '6', ''),
(5331, '17315', 'f813e86314ebada1f45fb216db468ac7', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Birgitha Dewi Mandaring', '', 'sembunyikan', 'sembunyikan', '', '', '17315*', '14', '26', '7', ''),
(5332, '17335', 'b29a94ba7d230bf1ebe569431e806271', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Christy Cayadi', '', 'sembunyikan', 'sembunyikan', '', '', '17335*', '14', '26', '8', ''),
(5333, '17343', '7bc5ab47d946f9a2ef9c9d9cf9bf6808', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Daniel Sefrandov Simatauw', '', 'sembunyikan', 'sembunyikan', '', '', '17343*', '14', '26', '9', ''),
(5334, '17369', 'c8a0a443c89841dcfb8133b6fbe74f4e', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Enrico', '', 'sembunyikan', 'sembunyikan', '', '', '17369*', '14', '26', '10', ''),
(5335, '17373', '8f69f7c5d236dc9cd06cba7d14f25d3a', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ervina Veronica', '', 'sembunyikan', 'sembunyikan', '', '', '17373*', '14', '26', '11', ''),
(5336, '17395', '5ed9aca8207551a05de83929b28931ae', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Florence Pangestu', '', 'sembunyikan', 'sembunyikan', '', '', '17395*', '14', '26', '12', ''),
(5337, '17404', '81832c325cee1837bf49ee341bb2d4d0', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Garald Lee', '', 'sembunyikan', 'sembunyikan', '', '', '17404*', '14', '26', '13', ''),
(5338, '17417', 'eb57d4461f9dd27d1b759e6beb834b24', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Gracielle Vincentia', '', 'sembunyikan', 'sembunyikan', '', '', '17417*', '14', '26', '14', ''),
(5339, '17426', '6fc982af033f286465f15dcc477bac4c', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Hendri Tanwiwin', '', 'sembunyikan', 'sembunyikan', '', '', '17426*', '14', '26', '15', ''),
(5340, '17430', '7d99c2fe732df1e96c445b71fef57198', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ignatius Hendy Prayogo', '', 'sembunyikan', 'sembunyikan', '', '', '17430*', '14', '26', '16', ''),
(5341, '17457', '210e067c30998f4500bc9b2792c7bffc', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Juan Richard Alexander Setiawan', '', 'sembunyikan', 'sembunyikan', '', '', '17457*', '14', '26', '17', ''),
(5342, '17459', 'de70de3fc6f77cd90b6d42171eb69e40', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'KAROLINA MELIAWATI', '', 'sembunyikan', 'sembunyikan', '', '', '17459*', '14', '26', '18', ''),
(5343, '17470', '8021c3dd46d3263c5a7812a439a001a6', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Kimberly Nikita', '', 'sembunyikan', 'sembunyikan', '', '', '17470*', '14', '26', '19', ''),
(5344, '17487', 'd41a5ecfd0006e203ecb6e31ebe076e3', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Lourra Gusmar', '', 'sembunyikan', 'sembunyikan', '', '', '17487*', '14', '26', '20', ''),
(5345, '17493', 'c7a2b7488aeb6ce48f3a90a29fe6b34d', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Marco leon kusuma', '', 'sembunyikan', 'sembunyikan', '', '', '17493*', '14', '26', '21', ''),
(5346, '17503', '3dc2690e961126d02e38cb6f7469a0db', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Mega Permata Octaxena Dinarsis P.P.', '', 'sembunyikan', 'sembunyikan', '', '', '17503*', '14', '26', '22', ''),
(5347, '17518', '5bc952e3a2303cdc297a7dd363aac898', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Michelle Christabel Munadi', '', 'sembunyikan', 'sembunyikan', '', '', '17518*', '14', '26', '23', ''),
(5348, '17529', 'a45ec7f74cbdb2fbdbc26a8946845672', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Nico Sanjaya', '', 'sembunyikan', 'sembunyikan', '', '', '17529*', '14', '26', '24', ''),
(5349, '17548', '1ecce74ea05ccfc6c66c6d4954d1488f', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Richard Franklin', '', 'sembunyikan', 'sembunyikan', '', '', '17548*', '14', '26', '25', ''),
(5350, '17550', '326956e050263647cafeddbeb25fbcf1', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Richard Manuel Listijo', '', 'sembunyikan', 'sembunyikan', '', '', '17550*', '14', '26', '26', ''),
(5351, '17568', 'f0292050bd35734b195f21712976753e', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Shieryn Fiorenza', '', 'sembunyikan', 'sembunyikan', '', '', '17568*', '14', '26', '27', ''),
(5352, '17590', '865ce02afd9e53342a18a153560a51c9', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Tania Agustin Sutanto', '', 'sembunyikan', 'sembunyikan', '', '', '17590*', '14', '26', '28', ''),
(5353, '17592', '37b68799160220d1b979ee1ecfb230d1', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Teddy Wijaya pangestu', '', 'sembunyikan', 'sembunyikan', '', '', '17592*', '14', '26', '29', ''),
(5354, '17602', 'a591dde837cbde4fa4a78f54b6b4a0b8', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Timothy Natanael Sebastian', '', 'sembunyikan', 'sembunyikan', '', '', '17602*', '14', '26', '30', ''),
(5355, '17605', '220e7b4e30a13a309f39d638a518d361', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Valerie', '', 'sembunyikan', 'sembunyikan', '', '', '17605*', '14', '26', '31', ''),
(5356, '17610', 'f0dd81fb1c3a2bbd6d0689bf467d7d4c', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Veronica Cyntia', '', 'sembunyikan', 'sembunyikan', '', '', '17610*', '14', '26', '32', ''),
(5357, '17615', 'eeabcfaf6816d07942d6679a1751ddf7', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Vincentius Eric Sutanto', '', 'sembunyikan', 'sembunyikan', '', '', '17615*', '14', '26', '33', ''),
(5358, '17623', '2da737f4951e05e88f7790a0db063d75', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'William', '', 'sembunyikan', 'sembunyikan', '', '', '17623*', '14', '26', '34', ''),
(5359, '17630', 'c62bae2d7e66bb30cbfdbdcb567ad6c6', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Xavier Angwyn', '', 'sembunyikan', 'sembunyikan', '', '', '17630*', '14', '26', '35', ''),
(5360, '17637', '539c63811a4b81ddef64cab8721b506b', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Yohanes Kelvin Hofianto', '', 'sembunyikan', 'sembunyikan', '', '', '17637*', '14', '26', '36', ''),
(5361, '17012', '1c5b58e11e34df5d01e62e90a6e54272', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Deni Witono', '', 'sembunyikan', 'sembunyikan', '', '', '17012*', '14', '27', '1', ''),
(5362, '17258', '7f794fda52e6e36b549ed3a289a7eb62', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Agus Surya Wargono', '', 'sembunyikan', 'sembunyikan', '', '', '17258*', '14', '27', '2', ''),
(5363, '17282', '7ab46fc33c4f93d0a36755c96fb107a9', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Anastasia Mitha Ayuwanda', '', 'sembunyikan', 'sembunyikan', '', '', '17282*', '14', '27', '3', ''),
(5364, '17291', '0b7ca18f1e165448876876fda379eec5', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Angela Nathania', '', 'sembunyikan', 'sembunyikan', '', '', '17291*', '14', '27', '4', ''),
(5365, '17293', '1be49304d2ab9454836dc8e68a4a3a77', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Angga Satria Nugraha Sugeng', '', 'sembunyikan', 'sembunyikan', '', '', '17293*', '14', '27', '5', ''),
(5366, '17308', 'd13bcaa203df409a057a9cb66e83e0b7', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Beata Angela Ajinata', '', 'sembunyikan', 'sembunyikan', '', '', '17308*', '14', '27', '6', ''),
(5367, '17324', 'aa4d94ccff2f9478501e25287ac7a419', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Carly Stacialie', '', 'sembunyikan', 'sembunyikan', '', '', '17324*', '14', '27', '7', ''),
(5368, '17342', 'd00bcdb3b093303e24864b3c3784d387', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Cristina Lawby', '', 'sembunyikan', 'sembunyikan', '', '', '17342*', '14', '27', '8', ''),
(5369, '17356', '2615462383076540c0f6777681f315fe', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Diva Claudia Willyan', '', 'sembunyikan', 'sembunyikan', '', '', '17356*', '14', '27', '9', ''),
(5370, '17389', 'f792e16f7c401ce02a1c2c1d75ed0bef', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ferdinan Dwi Ardiyanto', '', 'sembunyikan', 'sembunyikan', '', '', '17389*', '14', '27', '10', ''),
(5371, '17391', 'e2885c1c09076162ea063fe5fc1a9824', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ferly Saputra', '', 'sembunyikan', 'sembunyikan', '', '', '17391*', '14', '27', '11', ''),
(5372, '17400', 'dd25fb334ed2078ccdb605665d051922', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Franciskus Mario Santosa', '', 'sembunyikan', 'sembunyikan', '', '', '17400*', '14', '27', '12', ''),
(5373, '17418', '4209cfbeb1b8abd412c7607db0a1ded6', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Gregorius Dwikurniawan', '', 'sembunyikan', 'sembunyikan', '', '', '17418*', '14', '27', '13', ''),
(5374, '17456', '93a5bfe5dae752d378b46cdfca96ccb9', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jovita Nathania Gunawan', '', 'sembunyikan', 'sembunyikan', '', '', '17456*', '14', '27', '14', ''),
(5375, '17462', 'db11a7bde9884068b943e27816158098', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Kevin Halim', '', 'sembunyikan', 'sembunyikan', '', '', '17462*', '14', '27', '15', ''),
(5376, '17463', 'd024fe78e9803445d173ef20d0df840a', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Kevin Harnandi Lukito', '', 'sembunyikan', 'sembunyikan', '', '', '17463*', '14', '27', '16', ''),
(5377, '17474', '5bde4a1d67aa94940f11fa790e1396a1', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Kristanto', '', 'sembunyikan', 'sembunyikan', '', '', '17474*', '14', '27', '17', ''),
(5378, '17475', '7188f723c3b6b3dc36a9da4340263870', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Kristian Flash Go Swie', '', 'sembunyikan', 'sembunyikan', '', '', '17475*', '14', '27', '18', ''),
(5379, '17494', '5b0749646a3e45f276e7838e395ec03e', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Maria Angela Kalangie', '', 'sembunyikan', 'sembunyikan', '', '', '17494*', '14', '27', '19', ''),
(5380, '17506', '689435ae902433b7f0ad3b6bf9262fed', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Mellisa Listya', '', 'sembunyikan', 'sembunyikan', '', '', '17506*', '14', '27', '20', ''),
(5381, '17522', '22f08ddbd7c994c109621f87e76ec94a', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Michellia Lois Dayoh', '', 'sembunyikan', 'sembunyikan', '', '', '17522*', '14', '27', '21', ''),
(5382, '17545', 'b29afbedb5d6f2398cdaf95ce1cd19c4', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Reynaldi Fernando', '', 'sembunyikan', 'sembunyikan', '', '', '17545*', '14', '27', '22', ''),
(5383, '17552', '3b300448893e515b8220fcbc75ed6357', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ritchie Jasper liem', '', 'sembunyikan', 'sembunyikan', '', '', '17552*', '14', '27', '23', ''),
(5384, '17558', '0a3e18ed88bbe1083ce3f51847de5b1a', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ryan Pratama', '', 'sembunyikan', 'sembunyikan', '', '', '17558*', '14', '27', '24', ''),
(5385, '17566', 'b2a2cd5fb43ae1b1f1ed1df64c1fee9c', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Sherly widyawati', '', 'sembunyikan', 'sembunyikan', '', '', '17566*', '14', '27', '25', ''),
(5386, '17570', '5cc8f2f7925869e7e3798f001a974136', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'STEFANI MILENIA ANDREANI', '', 'sembunyikan', 'sembunyikan', '', '', '17570*', '14', '27', '26', ''),
(5387, '17591', 'ec55c9f2249336e00b19ad5c98c5b1a3', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Tasya Yunita Lie', '', 'sembunyikan', 'sembunyikan', '', '', '17591*', '14', '27', '27', ''),
(5388, '17601', '2deff1e0b8a1539f9d6237f3d37a8577', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Tiffany Vianetta', '', 'sembunyikan', 'sembunyikan', '', '', '17601*', '14', '27', '28', ''),
(5389, '17609', '069f7514c0d8fa7a9dcfa5a980cfa226', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Velisa Tanaya', '', 'sembunyikan', 'sembunyikan', '', '', '17609*', '14', '27', '29', ''),
(5390, '17612', '2118ea5f192b530295b9db3e86cc451d', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Vincensius Steven Vianaldo P', '', 'sembunyikan', 'sembunyikan', '', '', '17612*', '14', '27', '30', ''),
(5391, '17617', '2c25bb136fb0643344655fc6424d4539', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Vincentius Yoga Giantoro Putra', '', 'sembunyikan', 'sembunyikan', '', '', '17617*', '14', '27', '31', '');
INSERT INTO `useraura` (`UserId`, `user`, `password`, `level`, `tipe`, `is_online`, `last_ping`, `start`, `exp`, `nama`, `photo`, `statusemail`, `statustelp`, `email`, `telp`, `password2`, `tahunajaran`, `kelas`, `absen`, `urutan`) VALUES
(5392, '17618', 'd0d208aaece82ae973e97b51f0239d77', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Vivian', '', 'sembunyikan', 'sembunyikan', '', '', '17618*', '14', '27', '32', ''),
(5393, '17624', '0197686c71e3bb9b6a32fffd8136861b', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'William Axel Rinaldi', '', 'sembunyikan', 'sembunyikan', '', '', '17624*', '14', '27', '33', ''),
(5394, '17632', '523a94d64ffba14849c1b364c145948a', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'YESAYA IMANUEL NUGRAHA', '', 'sembunyikan', 'sembunyikan', '', '', '17632*', '14', '27', '34', ''),
(5395, '17634', '5fbd20075b986c8f72bfdbd52ea72195', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Yobel Budining Rahmadi', '', 'sembunyikan', 'sembunyikan', '', '', '17634*', '14', '27', '35', ''),
(5396, '17643', 'b7608c5892e6eeab30e214dfcc4d4ed0', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Mario Billy T', '', 'sembunyikan', 'sembunyikan', '', '', '17643*', '14', '27', '36', ''),
(5397, '17177', '97829550473cb6ae55bb045f28d80732', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Primus Khrisna Murti Wibowo', '', 'sembunyikan', 'sembunyikan', '', '', '17177*', '14', '28', '1', ''),
(5398, '17264', 'e44a2402685bcc7db40503e2571f90b9', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Aldi Ongkojaya', '', 'sembunyikan', 'sembunyikan', '', '', '17264*', '14', '28', '2', ''),
(5399, '17270', '5247d8952c82e2e4b97cc6ec78afb3e9', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Alexander Krisnayodi', '', 'sembunyikan', 'sembunyikan', '', '', '17270*', '14', '28', '3', ''),
(5400, '17273', '7a45f8bf3ca2b579c696740c22bbce2d', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Alexandro Glen Da Costa Rao', '', 'sembunyikan', 'sembunyikan', '', '', '17273*', '14', '28', '4', ''),
(5401, '17277', '1c3c1fc493595b5aedbd8bb8a9338e97', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Alvin Hadi Setiawan', '', 'sembunyikan', 'sembunyikan', '', '', '17277*', '14', '28', '5', ''),
(5402, '17287', 'aa1d05a0bb53df9279d7a3e9992765ec', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Andreas Susilo', '', 'sembunyikan', 'sembunyikan', '', '', '17287*', '14', '28', '6', ''),
(5403, '17295', '1cb6a26de4dcc5391f361eb54110e686', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Anggie Nicoline', '', 'sembunyikan', 'sembunyikan', '', '', '17295*', '14', '28', '7', ''),
(5404, '17303', '6b86783151a4ae350b3d8fa0ab8a813a', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Antonius William Sugijanto', '', 'sembunyikan', 'sembunyikan', '', '', '17303*', '14', '28', '8', ''),
(5405, '17304', '33dae29260767d4c04fe6fb116e6622a', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Antony Candra Halim', '', 'sembunyikan', 'sembunyikan', '', '', '17304*', '14', '28', '9', ''),
(5406, '17323', 'bd48b21ac6370d8e964fadd46b1510c4', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Bryan Marcellino', '', 'sembunyikan', 'sembunyikan', '', '', '17323*', '14', '28', '10', ''),
(5407, '17328', '904c64571c0cf5cb4e6f46c38a9fb0eb', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Caroline Vania Angela', '', 'sembunyikan', 'sembunyikan', '', '', '17328*', '14', '28', '11', ''),
(5408, '17360', '96f9ea7023a6262cbc3241cb3e0a840c', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Elisabeth Chindy Moelia Goenardie', '', 'sembunyikan', 'sembunyikan', '', '', '17360*', '14', '28', '12', ''),
(5409, '17368', '2c827a643df275fd8e883b4807351ed6', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Elyzabeth Natalia Hartanto Lapian', '', 'sembunyikan', 'sembunyikan', '', '', '17368*', '14', '28', '13', ''),
(5410, '17370', 'd0e5dd07ec6507051d19c747ebd15028', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Enrico Austria Lieger', '', 'sembunyikan', 'sembunyikan', '', '', '17370*', '14', '28', '14', ''),
(5411, '17384', 'e020654f82f0107365660917bd71f83e', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Felix Avellino', '', 'sembunyikan', 'sembunyikan', '', '', '17384*', '14', '28', '15', ''),
(5412, '17403', '39cf6caaecfb5d300c745764553d2bb3', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'GABRIEL FEBY SETIAWAN', '', 'sembunyikan', 'sembunyikan', '', '', '17403*', '14', '28', '16', ''),
(5413, '17416', 'af198b113511ca872c8cbdb67d5d1f74', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Graciella Vernanda', '', 'sembunyikan', 'sembunyikan', '', '', '17416*', '14', '28', '17', ''),
(5414, '17435', 'eb3f627c80d675186a83145ac458ce47', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ingrid Gotama', '', 'sembunyikan', 'sembunyikan', '', '', '17435*', '14', '28', '18', ''),
(5415, '17437', '1db4afd803baed860861770c375bd443', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Irene Carolina', '', 'sembunyikan', 'sembunyikan', '', '', '17437*', '14', '28', '19', ''),
(5416, '17447', 'd07551a531212b71907e07a20dbdf177', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jessica Meidy Angelina', '', 'sembunyikan', 'sembunyikan', '', '', '17447*', '14', '28', '20', ''),
(5417, '17468', 'cb3c3285409f0d85677c8801b5d4188b', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Keziah Glenys Smith', '', 'sembunyikan', 'sembunyikan', '', '', '17468*', '14', '28', '21', ''),
(5418, '17479', 'cb5a5e149f2319fc380fd0b06cc65c15', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Lay Reinaldy Limina', '', 'sembunyikan', 'sembunyikan', '', '', '17479*', '14', '28', '22', ''),
(5419, '17497', '8a85948c09f69395ebe0a22e7bfe2cde', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Martin Digdaya Mandraguna', '', 'sembunyikan', 'sembunyikan', '', '', '17497*', '14', '28', '23', ''),
(5420, '17508', 'b23e47afedd3e7cb32f3531bdbc286c7', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Mellynia Amzali', '', 'sembunyikan', 'sembunyikan', '', '', '17508*', '14', '28', '24', ''),
(5421, '17516', 'd84651a9e1ab7276313b3ab06deb6bae', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Michael Suseno', '', 'sembunyikan', 'sembunyikan', '', '', '17516*', '14', '28', '25', ''),
(5422, '17525', '70fafc345fb6790dda0734fab8e71c12', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Nadia Cynthia Larasati', '', 'sembunyikan', 'sembunyikan', '', '', '17525*', '14', '28', '26', ''),
(5423, '17565', 'ad13a1af90e10d47e037e48100823048', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Sherly Leonardo', '', 'sembunyikan', 'sembunyikan', '', '', '17565*', '14', '28', '27', ''),
(5424, '17569', '5bbd9b4dc1e94fd6df45f7367f4692f5', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Silvio Hermawan', '', 'sembunyikan', 'sembunyikan', '', '', '17569*', '14', '28', '28', ''),
(5425, '17578', 'db1e28b295050982857f05b4bca590b4', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Stephanie Nathaniel', '', 'sembunyikan', 'sembunyikan', '', '', '17578*', '14', '28', '29', ''),
(5426, '17582', 'a7528f560b3ff5978859d1654f017861', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Steven Andreas Tedja', '', 'sembunyikan', 'sembunyikan', '', '', '17582*', '14', '28', '30', ''),
(5427, '17599', '00220cc59314593975b71325af40b071', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'TIFFANI AUDREY', '', 'sembunyikan', 'sembunyikan', '', '', '17599*', '14', '28', '31', ''),
(5428, '17613', '1fa6b47979a263b08ce27cee005ec266', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Vincent Gerardy Lenggono', '', 'sembunyikan', 'sembunyikan', '', '', '17613*', '14', '28', '32', ''),
(5429, '17633', 'd13f27edd122fbdc63a9edba912472e8', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Yoana Dian Pramestuti', '', 'sembunyikan', 'sembunyikan', '', '', '17633*', '14', '28', '33', ''),
(5430, '16974', 'd19370cb72c80d75193679281e809101', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Bagus Bingharjo', '', 'sembunyikan', 'sembunyikan', '', '', '16974*', '14', '29', '1', ''),
(5431, '17254', 'd65db89707b5e91bfa3c6cd810291360', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Aaron Patrick.', '', 'sembunyikan', 'sembunyikan', '', '', '17254*', '14', '29', '2', ''),
(5432, '17265', 'a9b991abcbfab56b603d256724a2c2b9', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Aldo Nova Widodo', '', 'sembunyikan', 'sembunyikan', '', '', '17265*', '14', '29', '3', ''),
(5433, '17297', '007b647bc5ccc2c3fc8301af21694380', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Anthony Aurerlius Tene', '', 'sembunyikan', 'sembunyikan', '', '', '17297*', '14', '29', '4', ''),
(5434, '17312', '0dc2636d77bbd995e776fd1a92fe8881', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Benedict Deo Tanasha', '', 'sembunyikan', 'sembunyikan', '', '', '17312*', '14', '29', '5', ''),
(5435, '17314', 'f14ded01220ea90da98b7454b216029d', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'BILLY PRASETIO', '', 'sembunyikan', 'sembunyikan', '', '', '17314*', '14', '29', '6', ''),
(5436, '17327', '4653bac45e3b55d57c1fdb733d286794', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Caroline Salsabila', '', 'sembunyikan', 'sembunyikan', '', '', '17327*', '14', '29', '7', ''),
(5437, '17344', '920589cb839d1b75902075a3a0deed97', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Daniel Yoga Eka Putra', '', 'sembunyikan', 'sembunyikan', '', '', '17344*', '14', '29', '8', ''),
(5438, '17355', 'ec6648b812a5ad7434e3b1f8c1c065ea', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Dionisius Rocky Cahyadi', '', 'sembunyikan', 'sembunyikan', '', '', '17355*', '14', '29', '9', ''),
(5439, '17381', '78334746f470d9d07fa7a4e47422e3d4', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Felicia', '', 'sembunyikan', 'sembunyikan', '', '', '17381*', '14', '29', '10', ''),
(5440, '17396', '6225238ebb6db6b60617d1f64246c596', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Florencia Elanie', '', 'sembunyikan', 'sembunyikan', '', '', '17396*', '14', '29', '11', ''),
(5441, '17407', 'e2c3d9c9d9ca253249ef5cade39796e8', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Gerry Christian wibisono', '', 'sembunyikan', 'sembunyikan', '', '', '17407*', '14', '29', '12', ''),
(5442, '17410', '61fb94bfc9b29b0738c36efaab4ea319', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Glenn Evan', '', 'sembunyikan', 'sembunyikan', '', '', '17410*', '14', '29', '13', ''),
(5443, '17419', '471e9be28718d0830783585fa76eafd6', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Gregorius Melvin', '', 'sembunyikan', 'sembunyikan', '', '', '17419*', '14', '29', '14', ''),
(5444, '17429', 'e5d0a17afbd07d2fd24b8c07c28798f1', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ignasius Reynold Sevtiando Geraldy', '', 'sembunyikan', 'sembunyikan', '', '', '17429*', '14', '29', '15', ''),
(5445, '17439', '560cf8ca6a7ef1861ae425623981825f', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ivone', '', 'sembunyikan', 'sembunyikan', '', '', '17439*', '14', '29', '16', ''),
(5446, '17444', 'a640319249a889d6ccb0f50e47ec60e8', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jerry Indrawan', '', 'sembunyikan', 'sembunyikan', '', '', '17444*', '14', '29', '17', ''),
(5447, '17458', '4f012f8cdc6b651789689cb781fef49e', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Julia Shannon Lee', '', 'sembunyikan', 'sembunyikan', '', '', '17458*', '14', '29', '18', ''),
(5448, '17467', '5dbbbeb06c0cae741ad1cf1385b2d02b', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Kezia Fidelia', '', 'sembunyikan', 'sembunyikan', '', '', '17467*', '14', '29', '19', ''),
(5449, '17485', '84ae23ab55df522293a3dac5a1fc6578', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Louisa de Marrilac Arianto', '', 'sembunyikan', 'sembunyikan', '', '', '17485*', '14', '29', '20', ''),
(5450, '17512', '18994a116d977dd1ae751a95fc7e5d84', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Michael Kesuma Karman', '', 'sembunyikan', 'sembunyikan', '', '', '17512*', '14', '29', '21', ''),
(5451, '17513', '5dec89819d3f92dddb9c08c0b17570a0', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Michael LIegantara', '', 'sembunyikan', 'sembunyikan', '', '', '17513*', '14', '29', '22', ''),
(5452, '17528', '6f125ad93d24e399e6bb04c463789b0a', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Nicholas LImdianda', '', 'sembunyikan', 'sembunyikan', '', '', '17528*', '14', '29', '23', ''),
(5453, '17535', 'bae284b064944b2164fd724fb6b87e0a', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Olivia Wijayanti', '', 'sembunyikan', 'sembunyikan', '', '', '17535*', '14', '29', '24', ''),
(5454, '17542', '3212315be128d8a125eb37d24ff9c4de', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Queeny Alexandra', '', 'sembunyikan', 'sembunyikan', '', '', '17542*', '14', '29', '25', ''),
(5455, '17544', '3e34808352042674c5ec0b949404cf06', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Renhard H. Silitonga', '', 'sembunyikan', 'sembunyikan', '', '', '17544*', '14', '29', '26', ''),
(5456, '17575', '899d782818e4857c32796e6a6860b1b4', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Steffany Brenda', '', 'sembunyikan', 'sembunyikan', '', '', '17575*', '14', '29', '27', ''),
(5457, '17579', '9dff7a7c8a0ac03844f20882485b85cc', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Stephanie Yustine Tanjung', '', 'sembunyikan', 'sembunyikan', '', '', '17579*', '14', '29', '28', ''),
(5458, '17581', 'b9d7c039286f46308d979f6d33611ea1', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Stevania Vorensia Wijaya', '', 'sembunyikan', 'sembunyikan', '', '', '17581*', '14', '29', '29', ''),
(5459, '17584', 'e28b46ab917409ab6dfa7e48d77343fb', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Steven Julianto', '', 'sembunyikan', 'sembunyikan', '', '', '17584*', '14', '29', '30', ''),
(5460, '17586', '3cfffc2c2f5d76363f9a0757723c0aff', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Steven Samuel Anggrek', '', 'sembunyikan', 'sembunyikan', '', '', '17586*', '14', '29', '31', ''),
(5461, '17594', '20465f9637e6a6d5bfedcc271d2341a7', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Tessa Tania', '', 'sembunyikan', 'sembunyikan', '', '', '17594*', '14', '29', '32', ''),
(5462, '17604', '3dbb633806f39a33bb8ac2cea34db12a', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Valentine Hartanto', '', 'sembunyikan', 'sembunyikan', '', '', '17604*', '14', '29', '33', ''),
(5463, '17606', 'f48259f8e25f45ef8f38bec46776475a', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Vanessa Cicilia Halim', '', 'sembunyikan', 'sembunyikan', '', '', '17606*', '14', '29', '34', ''),
(5464, '17608', 'a75c448741769b6ff8c981b3060efa56', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Vania Budiharjo', '', 'sembunyikan', 'sembunyikan', '', '', '17608*', '14', '29', '35', ''),
(5465, '17620', 'a0af8e2a61a8b4f556b6eb1566866adb', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'WIBISONO HARTADI', '', 'sembunyikan', 'sembunyikan', '', '', '17620*', '14', '29', '36', ''),
(5656, '18030', '0ba525a5ada629ff301fb63d827dd83e', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'FELIX SHINDU DHARMA', '', 'sembunyikan', 'sembunyikan', '', '', '18030*', '14', '2', '14', ''),
(5652, '18002', 'cc0ca1405ad9057d531d14dc8f431aad', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'CRISTHALITA PEPINA TANDOKO', '', 'sembunyikan', 'sembunyikan', '', '', '18002*', '14', '2', '10', ''),
(5651, '17991', '847f805c761978ccce35d655dd1accbf', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'CHRISTOPHER ALLEN', '', 'sembunyikan', 'sembunyikan', '', '', '17991*', '14', '2', '9', ''),
(5650, '17977', '43e7c9f9fd8d9c0a11ec41f3802ddd2f', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'CAROLINE TANAZAL', '', 'sembunyikan', 'sembunyikan', '', '', '17977*', '14', '2', '8', ''),
(5649, '17975', 'f8e6bd50a367290b8fbe3ef38b8b9782', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'CARENS SHINTA IRALIN DE IVANKA', '', 'sembunyikan', 'sembunyikan', '', '', '17975*', '14', '2', '7', ''),
(5648, '17950', '6bb55bb0c9bab89706b7d2eccaabb217', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ANGELINE RIVIA SIMANJUNTAK', '', 'sembunyikan', 'sembunyikan', '', '', '17950*', '14', '2', '6', ''),
(5645, '17936', '9b3de330e92edebc6ddcf791000c5622', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ALEXANDRA KIM ROSSHELIA LAWANG', '', 'sembunyikan', 'sembunyikan', '', '', '17936*', '14', '2', '3', ''),
(5644, '17934', 'efd6aab0632cd5dab938723ceb5ee9d4', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ALEXANDER MICHAEL JACOB', '', 'sembunyikan', 'sembunyikan', '', '', '17934*', '14', '2', '2', ''),
(5618, '17997', 'ca5e08f03f9cdd27903233110c3dca46', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'CINDY YAPRANATA', '', 'sembunyikan', 'sembunyikan', '', '', '17997*', '14', '1', '10', ''),
(5617, '17995', '401bd8ed7227745868d79a441fdacd2c', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'CICILIA ALVERINA HARIJADI', '', 'sembunyikan', 'sembunyikan', '', '', '17995*', '14', '1', '9', ''),
(5616, '17988', '290b8abb2c46b6fe09501a135c1055ae', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'CHRISTIAN MOSES', '', 'sembunyikan', 'sembunyikan', '', '', '17988*', '14', '1', '8', ''),
(5615, '17987', 'cb198d65cb4efd4c313c45577d20f214', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'CHRISTIAN KELVIN', '', 'sembunyikan', 'sembunyikan', '', '', '17987*', '14', '1', '7', ''),
(5614, '17969', 'cab61ac4797ccd73fb347c95f58e65cc', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'BRIAN SAPUTRA HENDRA', '', 'sembunyikan', 'sembunyikan', '', '', '17969*', '14', '1', '6', ''),
(5613, '17960', 'd799c3e6b62bab4a6e30c52afaf70503', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'AVRILYANDI ERNEST FRANDYKA', '', 'sembunyikan', 'sembunyikan', '', '', '17960*', '14', '1', '5', ''),
(5612, '17956', '0c1da998306fbbdedfa6eef54c28c84c', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ASTARIKA DWI FEBRIANA', '', 'sembunyikan', 'sembunyikan', '', '', '17956*', '14', '1', '4', ''),
(5611, '17947', '1e0b96767e6c2826eeaa5eea05901b09', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ANGELINA IMMACULATA MARVIN', '', 'sembunyikan', 'sembunyikan', '', '', '17947*', '14', '1', '3', ''),
(5610, '17946', 'dae312ba9b0ad8f2593229924d450216', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ANGELICA CELINE', '', 'sembunyikan', 'sembunyikan', '', '', '17946*', '14', '1', '2', ''),
(5609, '17940', '48ad0a0e194c5f4be8f875f2af8efb94', 'Siswa', 'aktif', 1, '2017-10-21 13:23:15', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ANASTACIA ANDREA WIJAYA', '', 'sembunyikan', 'sembunyikan', '', '', '17940*', '14', '1', '1', ''),
(5646, '17941', '5fe75f9475c666aae8a00899229e69f1', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ANASTASIA RATNA PUSPITA', '', 'sembunyikan', 'sembunyikan', '', '', '17941*', '14', '2', '4', ''),
(5724, '18136', 'c39f5905b688a3cbc9d38c1fa027d1d3', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'MICHAEL PUTERA SALIM', '', 'sembunyikan', 'sembunyikan', '', '', '18136*', '14', '9', '10', ''),
(5725, '18139', 'cea29a033bd548289cdedd5d7973c1c9', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'MICHELLE REBECCA', '', 'sembunyikan', 'sembunyikan', '', '', '18139*', '14', '9', '11', ''),
(5726, '18141', '65924df3210a47740f53f89e12037e30', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'MONICA SHERLY ANGGRAENI', '', 'sembunyikan', 'sembunyikan', '', '', '18141*', '14', '9', '12', ''),
(5727, '18145', 'f71f618c6e000f4c044565a12c5bd33e', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'NATASHYA AURELIA SUDIGDO', '', 'sembunyikan', 'sembunyikan', '', '', '18145*', '14', '9', '13', ''),
(5728, '18149', 'fff34e57d1091602e8df5307bab7eba8', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'NICHOLLA ALBERTA', '', 'sembunyikan', 'sembunyikan', '', '', '18149*', '14', '9', '14', ''),
(5729, '18151', '906e7de6b59433461898aef365978d49', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'NIRMALA DEWI KUSUMA', '', 'sembunyikan', 'sembunyikan', '', '', '18151*', '14', '9', '15', ''),
(5730, '18164', '6d002d5663047302f0f2bd9f76a83482', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'QWITRA LEONY ANGELINE', '', 'sembunyikan', 'sembunyikan', '', '', '18164*', '14', '9', '16', ''),
(5731, '18175', '0fd75281e48df84a3e2f278d80127294', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'RICARDO ANGELIO', '', 'sembunyikan', 'sembunyikan', '', '', '18175*', '14', '9', '17', ''),
(5732, '18178', '09938eb43d792cecd059f488c6328989', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'RICHI SASTRA SAMUDRA', '', 'sembunyikan', 'sembunyikan', '', '', '18178*', '14', '9', '18', ''),
(5733, '18183', '4cf9574bce2e9f7b0eaaa83cbf34c9a3', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'RIZKY SAPUTRA', '', 'sembunyikan', 'sembunyikan', '', '', '18183*', '14', '9', '19', ''),
(5734, '18189', '50373216c2bd14eda38db43a0722d05a', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'SEBASTIAN JONATHAN', '', 'sembunyikan', 'sembunyikan', '', '', '18189*', '14', '9', '20', ''),
(5735, '18230', '68896dfd94f560306f7978b0f929a209', 'Siswa', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'WILSON LUIS', '', 'sembunyikan', 'sembunyikan', '', '', '18230*', '14', '9', '21', ''),
(5740, 'budiadmin', 'aba400c9477b52f3d4dfa1a4bc690288', 'Administrator', 'aktif', 0, '2019-08-26 08:44:45', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Budi Santoso', '', 'sembunyikan', 'sembunyikan', 'budi@frateran.sch.id', '', 'budiadmin', '', '', '', '999'),
(5764, 'totowidijarto', '66a1d841f86fc66d3ab7f28cd80a83ba', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Drs. Toto Widijarto', '', 'sembunyikan', 'sembunyikan', '', '', 'totowidijarto3073', '', '', '', '24'),
(5741, 'gatotwibawanto', 'e6ef1a3cebecb5de30a31f8336aa1129', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'A. Gatot Wibawanto, S.Pd.', '', 'sembunyikan', 'sembunyikan', '', '', 'gatotwibawanto7433', '', '', '', '01'),
(5780, 'mateusananda', 'ee4ae38d88de5721787bdea8dd53f895', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Mateus Ananda Merfi Aditya, S.Pd.', '', 'sembunyikan', 'sembunyikan', '', '', 'mateusananda7807', '', '', '', '40'),
(5781, 'nurbetusdwi', '00997ceac92918c051c3c3a5ec709099', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Nurbetus Dwi Junianto , S.Pd.', '', 'sembunyikan', 'sembunyikan', '', '', 'nurbetusdwi7584', '', '', '', '41'),
(5782, 'octhansetyawan', '88d1648afdde25f89237e3d135bdbb1a', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Octhan Setyawan, S.Si.', '', 'sembunyikan', 'sembunyikan', '', '', 'octhansetyawan2497', '', '', '', '42'),
(5783, 'resticitraningtyas', 'da54e17c9396d5aa3d81cfd29ac468c7', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Resti Citraningtyas, S.Pd.', '', 'sembunyikan', 'sembunyikan', '', '', 'resticitraningtyas7481', '', '', '', '43'),
(5784, 'srisayekti', '7398064ed2074d12f9fc6f478ea60fe3', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Sri Sayekti, S.Pd.', '', 'sembunyikan', 'sembunyikan', '', '', 'srisayekti2318', '', '', '', '44'),
(5785, 'stephanussulistyantoro', '403a58d9ceb30271a2714cb014cbe064', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Stephanus Sulistyantoro , M.Pd.', '', 'sembunyikan', 'sembunyikan', '', '', 'stephanussulistyantoro5723', '', '', '', '45'),
(5786, 'estiningtyasutami', '5bfd63dcc4b59a4b0f81ba0c14fb94fa', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Th. Estiningtyas Utami , S.Pd.', '', 'sembunyikan', 'sembunyikan', '', '', 'estiningtyasutami9269', '', '', '', '46'),
(5787, 'theresiaanata', '59875df89eedc288ff089d92c9321955', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Theresia Anata, S. Pd.', '', 'sembunyikan', 'sembunyikan', '', '', 'theresiaanata4561', '', '', '', '47'),
(5788, 'veronicaervina', '9fd47f7b7b5c0b404f66564a3ae1e15f', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Veronica Ervina Pudjiastuti , S.Si.', '', 'sembunyikan', 'sembunyikan', '', '', 'veronicaervina8160', '', '', '', '48'),
(5789, 'andikadi', 'b1c1503c35429f066a53d3cdf74d86be', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Y.B. Andik Adi Cahyono , S.Pd.', '', 'sembunyikan', 'sembunyikan', '', '', 'andikadi7834', '', '', '', '49'),
(5790, 'anawatisusi', '938e3d4445aa45ad734d97ebc3b9a7aa', 'Guru', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Anawati Susi Astuti, S.Pd', '', 'sembunyikan', 'sembunyikan', '', '', 'anawatisusi6591', '', '', '', '50');

-- --------------------------------------------------------

--
-- Table structure for table `usercounter`
--

DROP TABLE IF EXISTS `usercounter`;
CREATE TABLE IF NOT EXISTS `usercounter` (
  `id` tinyint(11) NOT NULL AUTO_INCREMENT,
  `ip` text NOT NULL,
  `counter` int(11) NOT NULL DEFAULT '0',
  `hits` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipproxy` varchar(100) DEFAULT NULL,
  `host` varchar(100) DEFAULT NULL,
  `ipanda` varchar(100) DEFAULT NULL,
  `proxyserver` varchar(100) DEFAULT NULL,
  `timevisit` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ipanda` (`ipanda`),
  KEY `timevisit` (`timevisit`),
  KEY `ipproxy` (`ipproxy`)
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipproxy` varchar(100) DEFAULT NULL,
  `host` varchar(100) DEFAULT NULL,
  `ipanda` varchar(100) DEFAULT NULL,
  `proxyserver` varchar(100) DEFAULT NULL,
  `timevisit` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ipanda` (`ipanda`),
  KEY `timevisit` (`timevisit`),
  KEY `ipproxy` (`ipproxy`)
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipproxy` varchar(100) DEFAULT NULL,
  `host` varchar(100) DEFAULT NULL,
  `ipanda` varchar(100) DEFAULT NULL,
  `proxyserver` varchar(100) DEFAULT NULL,
  `timevisit` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ipanda` (`ipanda`),
  KEY `timevisit` (`timevisit`),
  KEY `ipproxy` (`ipproxy`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3871 ;

--
-- Dumping data for table `useronlinemonth`
--

INSERT INTO `useronlinemonth` (`id`, `ipproxy`, `host`, `ipanda`, `proxyserver`, `timevisit`) VALUES
(3870, '::1', 'nafisah-PC', '::1', '', 1406996355);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

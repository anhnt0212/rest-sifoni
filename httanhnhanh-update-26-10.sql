-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 26, 2015 at 02:39 
-- Server version: 5.6.14
-- PHP Version: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `httanhnhanh`
--

-- --------------------------------------------------------

--
-- Table structure for table `adv`
--

CREATE TABLE IF NOT EXISTS `adv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `position` varchar(45) COLLATE utf8_unicode_ci DEFAULT 'top',
  `updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `adv`
--

INSERT INTO `adv` (`id`, `link`, `img`, `status`, `position`, `updated`) VALUES
(1, 'phuongnamdigital.com', '/uploads/quang-cao/quangcao.jpg', 1, 'left', '2015-10-15 04:07:13');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `target` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT '1',
  `keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT '0',
  `sort` int(11) DEFAULT '0',
  `f_post` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `target`, `updated`, `status`, `keywords`, `parent_id`, `sort`, `f_post`) VALUES
(1, 'Khóa Học', 'khoa-hoc.html', '2015-10-14 01:25:24', 1, 'khoa hoc,tieng anh', 0, 1, 1),
(2, 'Lịch Khai Giảng', 'lich-khai-giang.html', '0000-00-00 00:00:00', 1, 'lich khai giang', 0, 0, 2),
(3, 'Học Phí', 'hoc-phi.html', '2015-10-14 03:42:39', 1, 'học phí', 0, 3, 0),
(4, 'Tiếng Anh Giao Tiếp', 'tieng-anh-giao-tiep.html', '2015-10-15 02:16:57', 1, 'Tiếng Anh Giao Tiếp', 1, 1, 0),
(5, 'Tiếng Anh Thương Mại', 'tieng-anh-thuong-mai.html', '2015-10-15 03:00:13', 1, 'Tiếng Anh Thương Mại', 1, 2, 0),
(6, 'Kỹ Năng Viết CV & Phỏng Vấn', 'ky-nang-viet-cv-phong-van.html', '2015-10-15 03:00:49', 1, 'Kỹ Năng Viết CV & Phỏng Vấn', 1, 3, 0),
(7, 'Bí Kíp Tiếng Anh', 'bi-kip-tieng-anh.html', '2015-10-15 03:01:25', 1, 'Bí Kíp Tiếng Anh', 0, 4, 0),
(8, 'Liên Hệ', 'lien-he.html', '2015-10-15 03:01:41', 1, 'Liên Hệ', 0, 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotline` varchar(45) COLLATE utf8_unicode_ci DEFAULT '0909999999',
  `facebook` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'facebook.com',
  `google` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'google.com',
  `contact` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `hotline`, `facebook`, `google`, `contact`) VALUES
(1, '0909990991', 'facebook.com/phuongnamdigital', 'google.com', '<strong><span style="background-color:rgb(243, 243, 243); color:rgb(152, 152, 152); font-family:arial">7 Nam Quốc Cang, p.Phạm Ngũ L&atilde;o, Q.1, Tp. HCM</span><br />\r\n<span style="background-color:rgb(243, 243, 243); color:rgb(152, 152, 152); font-family:arial">ĐT: (08) 3925 6284 &ndash; (08) 3925 9688</span><br />\r\n<span style="background-color:rgb(243, 243, 243); color:rgb(152, 152, 152); font-family:arial">Hotline: 0914.098.008</span><br />\r\n<span style="background-color:rgb(243, 243, 243); color:rgb(152, 152, 152); font-family:arial">Website: hoctienganhnhanh.com.vn&nbsp;</span><br />\r\n<span style="background-color:rgb(243, 243, 243); color:rgb(152, 152, 152); font-family:arial">Email: info@hoctienganhnhanh.com.vn</span></strong>');

-- --------------------------------------------------------

--
-- Table structure for table `lesson`
--

CREATE TABLE IF NOT EXISTS `lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `target` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `lesson`
--

INSERT INTO `lesson` (`id`, `name`, `parent_id`, `status`, `target`, `sort`) VALUES
(1, 'Tiếng Anh Giao Tiếp', 0, 1, 'bai-hoc-tieng-anh-giao-tiep.html', 1),
(2, 'Tiếng Anh Thương Mại', 0, 1, 'bai-hoc-tieng-anh-thuong-mai.html', 2),
(3, 'Kỹ Năng Viết CV & Phỏng Vấn', 0, 1, 'bai-hoc-ky-nang-vet-cv-phong-van.html', 3),
(4, 'Cơ Bản', 1, 1, 'bai-hoc-tieng-anh-giao-tiep-co-ban.html', 1),
(5, 'Nâng Cao', 1, 1, 'bai-hoc-tieng-anh-giao-tiep-nang-cao.html', 2),
(6, 'Cơ Bản', 2, 1, 'bai-hoc-tieng-anh-thuong-mai-co-ban.html', 1),
(7, 'Nâng Cao', 2, 1, 'bai-hoc-tieng-anh-thuong-mai-nang-cao.html', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orther_post`
--

CREATE TABLE IF NOT EXISTS `orther_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) COLLATE utf8_unicode_ci DEFAULT '1',
  `category` varchar(500) COLLATE utf8_unicode_ci DEFAULT '2',
  `description` varchar(500) COLLATE utf8_unicode_ci DEFAULT '1',
  `status` int(11) DEFAULT '1',
  `teacher` varchar(500) COLLATE utf8_unicode_ci DEFAULT '1',
  `datetime` varchar(500) COLLATE utf8_unicode_ci DEFAULT '1',
  `time_start` varchar(500) COLLATE utf8_unicode_ci DEFAULT '1',
  `content` longtext COLLATE utf8_unicode_ci,
  `alias` varchar(500) COLLATE utf8_unicode_ci DEFAULT '1',
  `time` varchar(500) COLLATE utf8_unicode_ci DEFAULT '1',
  `updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `orther_post`
--

INSERT INTO `orther_post` (`id`, `name`, `category`, `description`, `status`, `teacher`, `datetime`, `time_start`, `content`, `alias`, `time`, `updated`) VALUES
(1, 'Tiếng Anh Thương Mại', '2', 'Khai giảng khoá Tiếng Anh Thương Mại: 20/09/2015 , thời gian: 18h30 - 19h30', 1, 'Có', '20/9/2015', '8h-10h', '<div class="short_intro txt_666">Đặc nhiệm Mỹ chỉ đưa ra quyết định tham chiến v&agrave;o ph&uacute;t ch&oacute;t, khi thấy c&aacute;c chiến binh người Kurd bị hỏa lực IS &aacute;p s&aacute;t.</div>\r\n\r\n<div class="relative_new">\r\n<ul>\r\n	<li><a href="http://vnexpress.net/tin-tuc/the-gioi/dac-nhiem-my-thiet-mang-khi-giai-cuu-tu-nhan-is-3300311.html" tabindex="1">Đặc nhiệm Mỹ thiệt mạng khi giải cứu t&ugrave; nh&acirc;n IS</a>&nbsp; / &nbsp;<a href="http://vnexpress.net/tin-tuc/the-gioi/dac-nhiem-tieu-diet-bin-laden-bi-phien-quan-is-doa-giet-3292900.html" tabindex="2">Đặc nhiệm &#39;ti&ecirc;u diệt bin Laden&#39; bị phiến qu&acirc;n IS dọa giết</a></li>\r\n</ul>\r\n</div>\r\n\r\n<table align="center" border="0" cellpadding="3" cellspacing="0" class="tplCaption" style="width:100%">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt="cuoc-dot-kich-is-trong-dem-khien-dac-nhiem-my-thiet-mang" src="http://m.f29.img.vnecdn.net/2015/10/23/1-7946-1445566374.jpg" style="width:100%" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Lực lượng đặc nhiệm Delta của lục qu&acirc;n Mỹ. Ảnh: <em>Wikipedia</em></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Ng&agrave;y 22/10, một l&iacute;nh đặc nhiệm Mỹ đ&atilde; thiệt mạng khi tham gia cuộc đột k&iacute;ch bất ngờ, t&aacute;o bạo v&agrave;o một căn cứ của phiến qu&acirc;n Nh&agrave; nước Hồi gi&aacute;o (IS) để giải cứu t&ugrave; nh&acirc;n sắp bị phiến qu&acirc;n h&agrave;nh h&igrave;nh. Đ&acirc;y l&agrave; l&iacute;nh Mỹ đầu ti&ecirc;n tử trận tr&ecirc;n chiến trường Iraq kể từ khi qu&acirc;n đội Mỹ r&uacute;t khỏi nước n&agrave;y v&agrave;o năm 2011,<em> Wall Street Journal</em> đưa tin.</p>\r\n\r\n<p>Cầu cứu trong đ&ecirc;m</p>\r\n\r\n<p>Theo tờ <em>Foreign Policy</em>, cuộc giao chiến giữa l&iacute;nh Mỹ v&agrave; phiến qu&acirc;n IS kh&ocirc;ng phải l&agrave; h&agrave;nh động đ&atilde; được l&ecirc;n kế hoạch từ trước. Đặc nhiệm Mỹ chỉ đưa ra quyết định giao chiến v&agrave;o ph&uacute;t ch&oacute;t của cuộc đấu s&uacute;ng giữa d&acirc;n qu&acirc;n người Kurd v&agrave; phiến qu&acirc;n IS.</p>\r\n\r\n<p>Theo đ&oacute;, 30 l&iacute;nh đặc nhiệm Mỹ - được cho l&agrave; thuộc lực lượng đặc nhiệm Delta của lục qu&acirc;n - đang thực hiện nhiệm vụ cố vấn v&agrave; hỗ trợ cho d&acirc;n qu&acirc;n người Kurd (Peshmerga) ở gần thị trấn Hawijah, ph&iacute;a nam tỉnh Kirkuk v&agrave;o s&aacute;ng thứ năm. Tuy nhi&ecirc;n một biến cố đ&atilde; xảy ra buộc đặc nhiệm Mỹ phải trực tiếp ra tay tham chiến, một quan chức qu&acirc;n sự Mỹ tiết lộ.</p>\r\n\r\n<p>T&igrave;nh b&aacute;o Mỹ ph&aacute;t hiện thấy những hố ch&ocirc;n tập thể lớn đ&atilde; được đ&agrave;o b&ecirc;n trong một căn cứ của phiến qu&acirc;n IS ở gần đ&oacute;, v&agrave; họ dự đo&aacute;n rằng những t&ugrave; nh&acirc;n bị giam giữ trong căn cứ n&agrave;y c&oacute; thể bị h&agrave;nh quyết v&agrave;o s&aacute;ng sớm ng&agrave;y h&ocirc;m sau. Peshmerga quyết định thực hiện chiến dịch giải cứu v&igrave; tin rằng trong số những t&ugrave; nh&acirc;n n&agrave;y c&oacute; c&aacute;c chiến binh người Kurd.</p>\r\n\r\n<p>Đặc nhiệm Mỹ với vai tr&ograve; l&agrave; cố vấn đ&atilde; gi&uacute;p Peshmerga l&ecirc;n kế hoạch giải cứu. Cuộc đột k&iacute;ch diễn ra v&agrave;o nửa đ&ecirc;m. Họ v&agrave; c&aacute;c chiến binh người Kurd l&ecirc;n c&aacute;c trực thăng Night Stalker của trung đo&agrave;n đặc nhiệm kh&ocirc;ng qu&acirc;n 160 của qu&acirc;n đội Mỹ, đổ bộ xuống gần căn cứ c&oacute; tường r&agrave;o bao quanh của IS. Đặc nhiệm Mỹ ẩn nấp tại c&aacute;c vị tr&iacute; k&iacute;n đ&aacute;o sau một bức tường để quan s&aacute;t cuộc tấn c&ocirc;ng của Peshmerga.</p>\r\n\r\n<p>T&igrave;nh h&igrave;nh thay đổi nhanh ch&oacute;ng khi d&acirc;n qu&acirc;n người Kurd &nbsp;đọ s&uacute;ng với phiến qu&acirc;n IS ẩn nấp trong căn cứ. Từ sau bức tường, họ thấy r&otilde; c&aacute;c chiến binh Peshmerga bị hỏa lực mạnh của IS chế &aacute;p v&agrave; kh&ocirc;ng thể tiến được v&agrave;o căn cứ. Bị bắn dữ dội, Peshmerga quyết định cầu cứu đặc nhiệm Mỹ. &quot;Lời cầu cứu đ&oacute; được đưa ra ngay tr&ecirc;n chiến trường&quot;, quan chức quốc ph&ograve;ng giấu t&ecirc;n của Mỹ cho hay.</p>\r\n\r\n<p>Đ&acirc;y l&agrave; lần đầu ti&ecirc;n Peshmerga y&ecirc;u cầu Mỹ gi&uacute;p đỡ trong một chiến dịch giải cứu con tin. 30 đặc nhiệm Mỹ c&oacute; mặt tại hiện trường đ&atilde; nhanh ch&oacute;ng đưa ra quyết định, v&agrave; đ&acirc;y l&agrave; lần đầu ti&ecirc;n l&iacute;nh Mỹ trực tiếp tham chiến với phiến qu&acirc;n IS tr&ecirc;n chiến trường Iraq.</p>\r\n\r\n<p>Trong l&uacute;c trận đọ s&uacute;ng diễn ra, một đặc nhiệm Mỹ đ&atilde; bị tr&uacute;ng đạn v&agrave; bị thương nặng. Anh n&agrave;y lập tức được chuyển bằng trực thăng tới Irbil nhưng kh&ocirc;ng qua khỏi. Danh t&iacute;nh v&agrave; cấp bậc của anh vẫn chưa được Lầu Năm G&oacute;c c&ocirc;ng bố, v&agrave; c&aacute;c quan chức m&ocirc; tả anh l&agrave; một đặc nhiệm gi&agrave;u kinh nghiệm.</p>\r\n', 'tieng-anh-thuong-mai.html', '6 tuần', '2015-10-22 17:00:00'),
(2, 'Tiếng Anh Giao Tiếp', '2', 'Tiếng Anh Giao Tiếp căn bản', 1, 'Không', '23/10/2015', '19h30', '<div class="short_intro txt_666">Đặc nhiệm Mỹ chỉ đưa ra quyết định tham chiến v&agrave;o ph&uacute;t ch&oacute;t, khi thấy c&aacute;c chiến binh người Kurd bị hỏa lực IS &aacute;p s&aacute;t.</div>\r\n\r\n<div class="relative_new">\r\n<ul>\r\n	<li><a href="http://vnexpress.net/tin-tuc/the-gioi/dac-nhiem-my-thiet-mang-khi-giai-cuu-tu-nhan-is-3300311.html" tabindex="1">Đặc nhiệm Mỹ thiệt mạng khi giải cứu t&ugrave; nh&acirc;n IS</a>&nbsp; / &nbsp;<a href="http://vnexpress.net/tin-tuc/the-gioi/dac-nhiem-tieu-diet-bin-laden-bi-phien-quan-is-doa-giet-3292900.html" tabindex="2">Đặc nhiệm &#39;ti&ecirc;u diệt bin Laden&#39; bị phiến qu&acirc;n IS dọa giết</a></li>\r\n</ul>\r\n</div>\r\n\r\n<table align="center" border="0" cellpadding="3" cellspacing="0" class="tplCaption" style="width:100%">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt="cuoc-dot-kich-is-trong-dem-khien-dac-nhiem-my-thiet-mang" src="http://m.f29.img.vnecdn.net/2015/10/23/1-7946-1445566374.jpg" style="width:100%" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Lực lượng đặc nhiệm Delta của lục qu&acirc;n Mỹ. Ảnh: <em>Wikipedia</em></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Ng&agrave;y 22/10, một l&iacute;nh đặc nhiệm Mỹ đ&atilde; thiệt mạng khi tham gia cuộc đột k&iacute;ch bất ngờ, t&aacute;o bạo v&agrave;o một căn cứ của phiến qu&acirc;n Nh&agrave; nước Hồi gi&aacute;o (IS) để giải cứu t&ugrave; nh&acirc;n sắp bị phiến qu&acirc;n h&agrave;nh h&igrave;nh. Đ&acirc;y l&agrave; l&iacute;nh Mỹ đầu ti&ecirc;n tử trận tr&ecirc;n chiến trường Iraq kể từ khi qu&acirc;n đội Mỹ r&uacute;t khỏi nước n&agrave;y v&agrave;o năm 2011,<em> Wall Street Journal</em> đưa tin.</p>\r\n\r\n<p>Cầu cứu trong đ&ecirc;m</p>\r\n\r\n<p>Theo tờ <em>Foreign Policy</em>, cuộc giao chiến giữa l&iacute;nh Mỹ v&agrave; phiến qu&acirc;n IS kh&ocirc;ng phải l&agrave; h&agrave;nh động đ&atilde; được l&ecirc;n kế hoạch từ trước. Đặc nhiệm Mỹ chỉ đưa ra quyết định giao chiến v&agrave;o ph&uacute;t ch&oacute;t của cuộc đấu s&uacute;ng giữa d&acirc;n qu&acirc;n người Kurd v&agrave; phiến qu&acirc;n IS.</p>\r\n\r\n<p>Theo đ&oacute;, 30 l&iacute;nh đặc nhiệm Mỹ - được cho l&agrave; thuộc lực lượng đặc nhiệm Delta của lục qu&acirc;n - đang thực hiện nhiệm vụ cố vấn v&agrave; hỗ trợ cho d&acirc;n qu&acirc;n người Kurd (Peshmerga) ở gần thị trấn Hawijah, ph&iacute;a nam tỉnh Kirkuk v&agrave;o s&aacute;ng thứ năm. Tuy nhi&ecirc;n một biến cố đ&atilde; xảy ra buộc đặc nhiệm Mỹ phải trực tiếp ra tay tham chiến, một quan chức qu&acirc;n sự Mỹ tiết lộ.</p>\r\n\r\n<p>T&igrave;nh b&aacute;o Mỹ ph&aacute;t hiện thấy những hố ch&ocirc;n tập thể lớn đ&atilde; được đ&agrave;o b&ecirc;n trong một căn cứ của phiến qu&acirc;n IS ở gần đ&oacute;, v&agrave; họ dự đo&aacute;n rằng những t&ugrave; nh&acirc;n bị giam giữ trong căn cứ n&agrave;y c&oacute; thể bị h&agrave;nh quyết v&agrave;o s&aacute;ng sớm ng&agrave;y h&ocirc;m sau. Peshmerga quyết định thực hiện chiến dịch giải cứu v&igrave; tin rằng trong số những t&ugrave; nh&acirc;n n&agrave;y c&oacute; c&aacute;c chiến binh người Kurd.</p>\r\n\r\n<p>Đặc nhiệm Mỹ với vai tr&ograve; l&agrave; cố vấn đ&atilde; gi&uacute;p Peshmerga l&ecirc;n kế hoạch giải cứu. Cuộc đột k&iacute;ch diễn ra v&agrave;o nửa đ&ecirc;m. Họ v&agrave; c&aacute;c chiến binh người Kurd l&ecirc;n c&aacute;c trực thăng Night Stalker của trung đo&agrave;n đặc nhiệm kh&ocirc;ng qu&acirc;n 160 của qu&acirc;n đội Mỹ, đổ bộ xuống gần căn cứ c&oacute; tường r&agrave;o bao quanh của IS. Đặc nhiệm Mỹ ẩn nấp tại c&aacute;c vị tr&iacute; k&iacute;n đ&aacute;o sau một bức tường để quan s&aacute;t cuộc tấn c&ocirc;ng của Peshmerga.</p>\r\n\r\n<p>T&igrave;nh h&igrave;nh thay đổi nhanh ch&oacute;ng khi d&acirc;n qu&acirc;n người Kurd &nbsp;đọ s&uacute;ng với phiến qu&acirc;n IS ẩn nấp trong căn cứ. Từ sau bức tường, họ thấy r&otilde; c&aacute;c chiến binh Peshmerga bị hỏa lực mạnh của IS chế &aacute;p v&agrave; kh&ocirc;ng thể tiến được v&agrave;o căn cứ. Bị bắn dữ dội, Peshmerga quyết định cầu cứu đặc nhiệm Mỹ. &quot;Lời cầu cứu đ&oacute; được đưa ra ngay tr&ecirc;n chiến trường&quot;, quan chức quốc ph&ograve;ng giấu t&ecirc;n của Mỹ cho hay.</p>\r\n\r\n<p>Đ&acirc;y l&agrave; lần đầu ti&ecirc;n Peshmerga y&ecirc;u cầu Mỹ gi&uacute;p đỡ trong một chiến dịch giải cứu con tin. 30 đặc nhiệm Mỹ c&oacute; mặt tại hiện trường đ&atilde; nhanh ch&oacute;ng đưa ra quyết định, v&agrave; đ&acirc;y l&agrave; lần đầu ti&ecirc;n l&iacute;nh Mỹ trực tiếp tham chiến với phiến qu&acirc;n IS tr&ecirc;n chiến trường Iraq.</p>\r\n\r\n<p>Trong l&uacute;c trận đọ s&uacute;ng diễn ra, một đặc nhiệm Mỹ đ&atilde; bị tr&uacute;ng đạn v&agrave; bị thương nặng. Anh n&agrave;y lập tức được chuyển bằng trực thăng tới Irbil nhưng kh&ocirc;ng qua khỏi. Danh t&iacute;nh v&agrave; cấp bậc của anh vẫn chưa được Lầu Năm G&oacute;c c&ocirc;ng bố, v&agrave; c&aacute;c quan chức m&ocirc; tả anh l&agrave; một đặc nhiệm gi&agrave;u kinh nghiệm.</p>\r\n', 'tieng-anh-giao-tiep.html', '3 tháng', '2015-10-18 17:00:00'),
(3, 'LUYỆN THI A1', '2', 'LUYỆN THI A1', 1, 'Có', '22/10/2015', '10h30', '<div class="short_intro txt_666">Đặc nhiệm Mỹ chỉ đưa ra quyết định tham chiến v&agrave;o ph&uacute;t ch&oacute;t, khi thấy c&aacute;c chiến binh người Kurd bị hỏa lực IS &aacute;p s&aacute;t.</div>\r\n\r\n<div class="relative_new">\r\n<ul>\r\n	<li><a href="http://vnexpress.net/tin-tuc/the-gioi/dac-nhiem-my-thiet-mang-khi-giai-cuu-tu-nhan-is-3300311.html" tabindex="1">Đặc nhiệm Mỹ thiệt mạng khi giải cứu t&ugrave; nh&acirc;n IS</a>&nbsp; / &nbsp;<a href="http://vnexpress.net/tin-tuc/the-gioi/dac-nhiem-tieu-diet-bin-laden-bi-phien-quan-is-doa-giet-3292900.html" tabindex="2">Đặc nhiệm &#39;ti&ecirc;u diệt bin Laden&#39; bị phiến qu&acirc;n IS dọa giết</a></li>\r\n</ul>\r\n</div>\r\n\r\n<table align="center" border="0" cellpadding="3" cellspacing="0" class="tplCaption" style="width:100%">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt="cuoc-dot-kich-is-trong-dem-khien-dac-nhiem-my-thiet-mang" src="http://m.f29.img.vnecdn.net/2015/10/23/1-7946-1445566374.jpg" style="width:100%" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Lực lượng đặc nhiệm Delta của lục qu&acirc;n Mỹ. Ảnh: <em>Wikipedia</em></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Ng&agrave;y 22/10, một l&iacute;nh đặc nhiệm Mỹ đ&atilde; thiệt mạng khi tham gia cuộc đột k&iacute;ch bất ngờ, t&aacute;o bạo v&agrave;o một căn cứ của phiến qu&acirc;n Nh&agrave; nước Hồi gi&aacute;o (IS) để giải cứu t&ugrave; nh&acirc;n sắp bị phiến qu&acirc;n h&agrave;nh h&igrave;nh. Đ&acirc;y l&agrave; l&iacute;nh Mỹ đầu ti&ecirc;n tử trận tr&ecirc;n chiến trường Iraq kể từ khi qu&acirc;n đội Mỹ r&uacute;t khỏi nước n&agrave;y v&agrave;o năm 2011,<em> Wall Street Journal</em> đưa tin.</p>\r\n\r\n<p>Cầu cứu trong đ&ecirc;m</p>\r\n\r\n<p>Theo tờ <em>Foreign Policy</em>, cuộc giao chiến giữa l&iacute;nh Mỹ v&agrave; phiến qu&acirc;n IS kh&ocirc;ng phải l&agrave; h&agrave;nh động đ&atilde; được l&ecirc;n kế hoạch từ trước. Đặc nhiệm Mỹ chỉ đưa ra quyết định giao chiến v&agrave;o ph&uacute;t ch&oacute;t của cuộc đấu s&uacute;ng giữa d&acirc;n qu&acirc;n người Kurd v&agrave; phiến qu&acirc;n IS.</p>\r\n\r\n<p>Theo đ&oacute;, 30 l&iacute;nh đặc nhiệm Mỹ - được cho l&agrave; thuộc lực lượng đặc nhiệm Delta của lục qu&acirc;n - đang thực hiện nhiệm vụ cố vấn v&agrave; hỗ trợ cho d&acirc;n qu&acirc;n người Kurd (Peshmerga) ở gần thị trấn Hawijah, ph&iacute;a nam tỉnh Kirkuk v&agrave;o s&aacute;ng thứ năm. Tuy nhi&ecirc;n một biến cố đ&atilde; xảy ra buộc đặc nhiệm Mỹ phải trực tiếp ra tay tham chiến, một quan chức qu&acirc;n sự Mỹ tiết lộ.</p>\r\n\r\n<p>T&igrave;nh b&aacute;o Mỹ ph&aacute;t hiện thấy những hố ch&ocirc;n tập thể lớn đ&atilde; được đ&agrave;o b&ecirc;n trong một căn cứ của phiến qu&acirc;n IS ở gần đ&oacute;, v&agrave; họ dự đo&aacute;n rằng những t&ugrave; nh&acirc;n bị giam giữ trong căn cứ n&agrave;y c&oacute; thể bị h&agrave;nh quyết v&agrave;o s&aacute;ng sớm ng&agrave;y h&ocirc;m sau. Peshmerga quyết định thực hiện chiến dịch giải cứu v&igrave; tin rằng trong số những t&ugrave; nh&acirc;n n&agrave;y c&oacute; c&aacute;c chiến binh người Kurd.</p>\r\n\r\n<p>Đặc nhiệm Mỹ với vai tr&ograve; l&agrave; cố vấn đ&atilde; gi&uacute;p Peshmerga l&ecirc;n kế hoạch giải cứu. Cuộc đột k&iacute;ch diễn ra v&agrave;o nửa đ&ecirc;m. Họ v&agrave; c&aacute;c chiến binh người Kurd l&ecirc;n c&aacute;c trực thăng Night Stalker của trung đo&agrave;n đặc nhiệm kh&ocirc;ng qu&acirc;n 160 của qu&acirc;n đội Mỹ, đổ bộ xuống gần căn cứ c&oacute; tường r&agrave;o bao quanh của IS. Đặc nhiệm Mỹ ẩn nấp tại c&aacute;c vị tr&iacute; k&iacute;n đ&aacute;o sau một bức tường để quan s&aacute;t cuộc tấn c&ocirc;ng của Peshmerga.</p>\r\n\r\n<p>T&igrave;nh h&igrave;nh thay đổi nhanh ch&oacute;ng khi d&acirc;n qu&acirc;n người Kurd &nbsp;đọ s&uacute;ng với phiến qu&acirc;n IS ẩn nấp trong căn cứ. Từ sau bức tường, họ thấy r&otilde; c&aacute;c chiến binh Peshmerga bị hỏa lực mạnh của IS chế &aacute;p v&agrave; kh&ocirc;ng thể tiến được v&agrave;o căn cứ. Bị bắn dữ dội, Peshmerga quyết định cầu cứu đặc nhiệm Mỹ. &quot;Lời cầu cứu đ&oacute; được đưa ra ngay tr&ecirc;n chiến trường&quot;, quan chức quốc ph&ograve;ng giấu t&ecirc;n của Mỹ cho hay.</p>\r\n\r\n<p>Đ&acirc;y l&agrave; lần đầu ti&ecirc;n Peshmerga y&ecirc;u cầu Mỹ gi&uacute;p đỡ trong một chiến dịch giải cứu con tin. 30 đặc nhiệm Mỹ c&oacute; mặt tại hiện trường đ&atilde; nhanh ch&oacute;ng đưa ra quyết định, v&agrave; đ&acirc;y l&agrave; lần đầu ti&ecirc;n l&iacute;nh Mỹ trực tiếp tham chiến với phiến qu&acirc;n IS tr&ecirc;n chiến trường Iraq.</p>\r\n\r\n<p>Trong l&uacute;c trận đọ s&uacute;ng diễn ra, một đặc nhiệm Mỹ đ&atilde; bị tr&uacute;ng đạn v&agrave; bị thương nặng. Anh n&agrave;y lập tức được chuyển bằng trực thăng tới Irbil nhưng kh&ocirc;ng qua khỏi. Danh t&iacute;nh v&agrave; cấp bậc của anh vẫn chưa được Lầu Năm G&oacute;c c&ocirc;ng bố, v&agrave; c&aacute;c quan chức m&ocirc; tả anh l&agrave; một đặc nhiệm gi&agrave;u kinh nghiệm.</p>\r\n', 'luyen-thi-a1.html', '5 tuần', '2015-10-25 17:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE IF NOT EXISTS `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) COLLATE utf8_unicode_ci DEFAULT '0',
  `keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci,
  `status` int(11) DEFAULT '1',
  `updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT '0',
  `viewed` int(11) DEFAULT '100',
  `images` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `content_short` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `fk_post_category_idx` (`category`),
  KEY `fk_post_user_idx` (`user`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `title`, `keywords`, `description`, `alias`, `content`, `status`, `updated`, `user`, `category`, `sort`, `viewed`, `images`, `content_short`) VALUES
(1, 'Cuộc đột kích IS trong đêm khiến đặc nhiệm Mỹ thiệt mạng', 'Cuộc đột kích IS trong đêm khiến đặc nhiệm Mỹ thiệt mạng', 'Cuộc đột kích IS trong đêm khiến đặc nhiệm Mỹ thiệt mạng', 'cuoc-dot-kich-is-trong-dem-khien-dac-nhiem-my-thiet-mang.html', '<div class="short_intro txt_666">Đặc nhiệm Mỹ chỉ đưa ra quyết định tham chiến v&agrave;o ph&uacute;t ch&oacute;t, khi thấy c&aacute;c chiến binh người Kurd bị hỏa lực IS &aacute;p s&aacute;t.</div>\r\n\r\n<div class="relative_new">\r\n<ul>\r\n	<li><a href="http://vnexpress.net/tin-tuc/the-gioi/dac-nhiem-my-thiet-mang-khi-giai-cuu-tu-nhan-is-3300311.html" tabindex="1">Đặc nhiệm Mỹ thiệt mạng khi giải cứu t&ugrave; nh&acirc;n IS</a>&nbsp; / &nbsp;<a href="http://vnexpress.net/tin-tuc/the-gioi/dac-nhiem-tieu-diet-bin-laden-bi-phien-quan-is-doa-giet-3292900.html" tabindex="2">Đặc nhiệm &#39;ti&ecirc;u diệt bin Laden&#39; bị phiến qu&acirc;n IS dọa giết</a></li>\r\n</ul>\r\n</div>\r\n\r\n<table align="center" border="0" cellpadding="3" cellspacing="0" class="tplCaption" style="width:100%">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt="cuoc-dot-kich-is-trong-dem-khien-dac-nhiem-my-thiet-mang" src="http://m.f29.img.vnecdn.net/2015/10/23/1-7946-1445566374.jpg" style="width:100%" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Lực lượng đặc nhiệm Delta của lục qu&acirc;n Mỹ. Ảnh: <em>Wikipedia</em></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Ng&agrave;y 22/10, một l&iacute;nh đặc nhiệm Mỹ đ&atilde; thiệt mạng khi tham gia cuộc đột k&iacute;ch bất ngờ, t&aacute;o bạo v&agrave;o một căn cứ của phiến qu&acirc;n Nh&agrave; nước Hồi gi&aacute;o (IS) để giải cứu t&ugrave; nh&acirc;n sắp bị phiến qu&acirc;n h&agrave;nh h&igrave;nh. Đ&acirc;y l&agrave; l&iacute;nh Mỹ đầu ti&ecirc;n tử trận tr&ecirc;n chiến trường Iraq kể từ khi qu&acirc;n đội Mỹ r&uacute;t khỏi nước n&agrave;y v&agrave;o năm 2011,<em> Wall Street Journal</em> đưa tin.</p>\r\n\r\n<p>Cầu cứu trong đ&ecirc;m</p>\r\n\r\n<p>Theo tờ <em>Foreign Policy</em>, cuộc giao chiến giữa l&iacute;nh Mỹ v&agrave; phiến qu&acirc;n IS kh&ocirc;ng phải l&agrave; h&agrave;nh động đ&atilde; được l&ecirc;n kế hoạch từ trước. Đặc nhiệm Mỹ chỉ đưa ra quyết định giao chiến v&agrave;o ph&uacute;t ch&oacute;t của cuộc đấu s&uacute;ng giữa d&acirc;n qu&acirc;n người Kurd v&agrave; phiến qu&acirc;n IS.</p>\r\n\r\n<p>Theo đ&oacute;, 30 l&iacute;nh đặc nhiệm Mỹ - được cho l&agrave; thuộc lực lượng đặc nhiệm Delta của lục qu&acirc;n - đang thực hiện nhiệm vụ cố vấn v&agrave; hỗ trợ cho d&acirc;n qu&acirc;n người Kurd (Peshmerga) ở gần thị trấn Hawijah, ph&iacute;a nam tỉnh Kirkuk v&agrave;o s&aacute;ng thứ năm. Tuy nhi&ecirc;n một biến cố đ&atilde; xảy ra buộc đặc nhiệm Mỹ phải trực tiếp ra tay tham chiến, một quan chức qu&acirc;n sự Mỹ tiết lộ.</p>\r\n\r\n<p>T&igrave;nh b&aacute;o Mỹ ph&aacute;t hiện thấy những hố ch&ocirc;n tập thể lớn đ&atilde; được đ&agrave;o b&ecirc;n trong một căn cứ của phiến qu&acirc;n IS ở gần đ&oacute;, v&agrave; họ dự đo&aacute;n rằng những t&ugrave; nh&acirc;n bị giam giữ trong căn cứ n&agrave;y c&oacute; thể bị h&agrave;nh quyết v&agrave;o s&aacute;ng sớm ng&agrave;y h&ocirc;m sau. Peshmerga quyết định thực hiện chiến dịch giải cứu v&igrave; tin rằng trong số những t&ugrave; nh&acirc;n n&agrave;y c&oacute; c&aacute;c chiến binh người Kurd.</p>\r\n', 1, '2015-10-23 04:27:44', 1, 7, 1, 100, '/uploads/slider/slide.png', 'Cuộc đột kích IS trong đêm khiến đặc nhiệm Mỹ thiệt mạng'),
(2, '3 tai nạn liên tiếp giữa ngã tư, đường kẹt cứng ', '3 tai nạn liên tiếp giữa ngã tư, đường kẹt cứng ', '3 tai nạn liên tiếp giữa ngã tư, đường kẹt cứng ', '3-tai-nan-lien-tiep-giua-nga-tu-duong-ket-cung.html', '<div class="short_intro txt_666">Đặc nhiệm Mỹ chỉ đưa ra quyết định tham chiến v&agrave;o ph&uacute;t ch&oacute;t, khi thấy c&aacute;c chiến binh người Kurd bị hỏa lực IS &aacute;p s&aacute;t.</div>\r\n\r\n<div class="relative_new">\r\n<ul>\r\n	<li><a href="http://vnexpress.net/tin-tuc/the-gioi/dac-nhiem-my-thiet-mang-khi-giai-cuu-tu-nhan-is-3300311.html" tabindex="1">Đặc nhiệm Mỹ thiệt mạng khi giải cứu t&ugrave; nh&acirc;n IS</a>&nbsp; / &nbsp;<a href="http://vnexpress.net/tin-tuc/the-gioi/dac-nhiem-tieu-diet-bin-laden-bi-phien-quan-is-doa-giet-3292900.html" tabindex="2">Đặc nhiệm &#39;ti&ecirc;u diệt bin Laden&#39; bị phiến qu&acirc;n IS dọa giết</a></li>\r\n</ul>\r\n</div>\r\n\r\n<table align="center" border="0" cellpadding="3" cellspacing="0" class="tplCaption" style="width:100%">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt="cuoc-dot-kich-is-trong-dem-khien-dac-nhiem-my-thiet-mang" src="http://m.f29.img.vnecdn.net/2015/10/23/1-7946-1445566374.jpg" style="width:100%" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Lực lượng đặc nhiệm Delta của lục qu&acirc;n Mỹ. Ảnh: <em>Wikipedia</em></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Ng&agrave;y 22/10, một l&iacute;nh đặc nhiệm Mỹ đ&atilde; thiệt mạng khi tham gia cuộc đột k&iacute;ch bất ngờ, t&aacute;o bạo v&agrave;o một căn cứ của phiến qu&acirc;n Nh&agrave; nước Hồi gi&aacute;o (IS) để giải cứu t&ugrave; nh&acirc;n sắp bị phiến qu&acirc;n h&agrave;nh h&igrave;nh. Đ&acirc;y l&agrave; l&iacute;nh Mỹ đầu ti&ecirc;n tử trận tr&ecirc;n chiến trường Iraq kể từ khi qu&acirc;n đội Mỹ r&uacute;t khỏi nước n&agrave;y v&agrave;o năm 2011,<em> Wall Street Journal</em> đưa tin.</p>\r\n\r\n<p>Cầu cứu trong đ&ecirc;m</p>\r\n\r\n<p>Theo tờ <em>Foreign Policy</em>, cuộc giao chiến giữa l&iacute;nh Mỹ v&agrave; phiến qu&acirc;n IS kh&ocirc;ng phải l&agrave; h&agrave;nh động đ&atilde; được l&ecirc;n kế hoạch từ trước. Đặc nhiệm Mỹ chỉ đưa ra quyết định giao chiến v&agrave;o ph&uacute;t ch&oacute;t của cuộc đấu s&uacute;ng giữa d&acirc;n qu&acirc;n người Kurd v&agrave; phiến qu&acirc;n IS.</p>\r\n\r\n<p>Theo đ&oacute;, 30 l&iacute;nh đặc nhiệm Mỹ - được cho l&agrave; thuộc lực lượng đặc nhiệm Delta của lục qu&acirc;n - đang thực hiện nhiệm vụ cố vấn v&agrave; hỗ trợ cho d&acirc;n qu&acirc;n người Kurd (Peshmerga) ở gần thị trấn Hawijah, ph&iacute;a nam tỉnh Kirkuk v&agrave;o s&aacute;ng thứ năm. Tuy nhi&ecirc;n một biến cố đ&atilde; xảy ra buộc đặc nhiệm Mỹ phải trực tiếp ra tay tham chiến, một quan chức qu&acirc;n sự Mỹ tiết lộ.</p>\r\n\r\n<p>T&igrave;nh b&aacute;o Mỹ ph&aacute;t hiện thấy những hố ch&ocirc;n tập thể lớn đ&atilde; được đ&agrave;o b&ecirc;n trong một căn cứ của phiến qu&acirc;n IS ở gần đ&oacute;, v&agrave; họ dự đo&aacute;n rằng những t&ugrave; nh&acirc;n bị giam giữ trong căn cứ n&agrave;y c&oacute; thể bị h&agrave;nh quyết v&agrave;o s&aacute;ng sớm ng&agrave;y h&ocirc;m sau. Peshmerga quyết định thực hiện chiến dịch giải cứu v&igrave; tin rằng trong số những t&ugrave; nh&acirc;n n&agrave;y c&oacute; c&aacute;c chiến binh người Kurd.</p>\r\n', 1, '2015-10-23 04:28:24', 1, 7, 2, 100, '/uploads/slider/slide-img.png', '3 tai nạn liên tiếp giữa ngã tư, đường kẹt cứng '),
(4, 'Bé ba tuổi lái xe vì mẹ say rượu', 'Bé ba tuổi lái xe vì mẹ say rượu', 'Bé ba tuổi lái xe vì mẹ say rượu', 'be-ba-tuoi-lai-xe-vi-me-say-ruou.html', '<div class="short_intro txt_666">Cậu b&eacute; ba tuổi ở bang Oklahoma, Mỹ, đ&atilde; điều khiển chiếc xe b&aacute;n tải khi người mẹ say xỉn.</div>\r\n\r\n<div class="relative_new">\r\n<ul>\r\n	<li><a href="http://vnexpress.net/tin-tuc/the-gioi/cuoc-song-do-day/linh-nga-say-ruou-lai-xe-boc-thep-gay-nao-loan-duong-pho-3266785.html" tabindex="1">L&iacute;nh Nga say rượu l&aacute;i xe bọc th&eacute;p g&acirc;y n&aacute;o loạn đường phố</a>&nbsp; / &nbsp;<a href="http://vnexpress.net/tin-tuc/the-gioi/cuoc-song-do-day/nguoi-dan-ong-say-ruou-vo-tinh-bi-chon-song-3283716.html" tabindex="2">Người đ&agrave;n &ocirc;ng say rượu v&ocirc; t&igrave;nh bị ch&ocirc;n sống</a></li>\r\n</ul>\r\n</div>\r\n\r\n<div class="fck_detail width_common">\r\n<table align="center" border="0" cellpadding="3" cellspacing="0" class="tplCaption" style="width:100%">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt="be-ba-tuoi-lai-xe-vi-me-say-ruou" src="http://m.f29.img.vnecdn.net/2015/10/23/12177918-1008512222504384-1931-2477-6550-1445568771.jpg" style="width:100%" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Chiếc xe lao v&agrave;o lề đường nhưng hai đứa trẻ may mắn kh&ocirc;ng bị thương. Ảnh: <em>Ada News</em></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Cảnh s&aacute;t Oklahoma h&ocirc;m 21/10 bắt giữ Taloa Foster, 33 tuổi, sau khi c&aacute;c nh&acirc;n chứng nh&igrave;n thấy cậu con trai ba tuổi của người phụ nữ n&agrave;y điều khiển chiếc xe nhỏ tr&ecirc;n đường cao tốc gần Ada, c&aacute;ch th&agrave;nh phố Oklahoma khoảng 130 km về ph&iacute;a đ&ocirc;ng nam.</p>\r\n\r\n<p>Theo<em> Reuters</em>, Foster bị bắt v&igrave; h&agrave;nh vi g&acirc;y nguy hiểm cho trẻ em v&agrave; nghi vấn say rượu khi đang l&aacute;i xe. Foster trả lời ch&iacute;nh quyền địa phương rằng con trai tự th&aacute;o d&acirc;y an to&agrave;n, c&ocirc; bị mất kiểm so&aacute;t v&agrave; ng&atilde; ra khỏi xe khi cố gắng thắt lại d&acirc;y cho con.</p>\r\n\r\n<p>Cặp sinh đ&ocirc;i của Foster ở trong xe v&agrave; một đứa trẻ đ&atilde; đứng l&ecirc;n ghế sau tay l&aacute;i, l&aacute;i chiếc xe vượt qua đường cao tốc trước khi đ&acirc;m sầm v&agrave;o lề đường. Hai đứa trẻ may mắn kh&ocirc;ng bị thương. Foster hiện đ&atilde; được tại ngoại v&agrave; hai đứa trẻ được &ocirc;ng chăm s&oacute;c.</p>\r\n\r\n<p style="text-align:right"><strong>Th&ugrave;y Linh</strong></p>\r\n</div>\r\n', 1, '2015-10-23 04:30:24', 1, 7, 4, 100, '/uploads/quang-cao/12177918-1008512222504384-1931-2477-6550-1445568771.jpg', 'Bé ba tuổi lái xe vì mẹ say rượu'),
(5, 'Học Phí Tháng 10', 'Học Phí Tháng 10', 'Học Phí Tháng 10', 'hoc-phi-thang-10.html', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>\r\n&nbsp;\r\n\r\n<p style="text-align:center"><img alt="about" src="http://hoctienganhnhanh.com.vn/uploads/configs/about-img.jpg" /></p>\r\n&nbsp;\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>\r\n', 1, '2015-10-23 08:34:24', 1, 3, 1, 100, '/uploads/image/12177918-1008512222504384-1931-2477-6550-1445568771.jpg', 'Học Phí Tháng 10'),
(6, 'Chính phủ mở tài khoản thử nghiệm trên Facebook', 'Chính phủ mở tài khoản thử nghiệm trên Facebook', 'Chính phủ mở tài khoản thử nghiệm trên Facebook', 'chinh-phu-mo-tai-khoan-thu-nghiem-tren-facebook.html', '<p style="text-align:justify"><span style="font-family:arial,helvetica,sans-serif"><span style="font-size:14px">Trong buổi họp b&aacute;o cung cấp th&ocirc;ng tin xung quanh việc ban h&agrave;nh <strong>Nghị quyết số 36a</strong> về Ch&iacute;nh phủ điện từ chiều ng&agrave;y 20/10, Tổng gi&aacute;m đốc Cổng th&ocirc;ng tin điện tử Ch&iacute;nh phủ Vi Quang Đạo cho biết, trang th&ocirc;ng tin điện tử Ch&iacute;nh phủ vừa c&oacute; t&agrave;i khoản tr&ecirc;n <a href="http://blogcongnghe.com.vn/post/41/tai-sao-quang-cao-tren-instagram-dat-gan-gap-doi-tren-facebook">Facebook</a> với t&ecirc;n gọi ch&iacute;nh thức <strong><em>&ldquo;Th&ocirc;ng tin Ch&iacute;nh phủ&rdquo;</em></strong> nhằm đưa th&ocirc;ng tin hoạt động của Ch&iacute;nh phủ rộng r&atilde;i hơn tr&ecirc;n Internet đến với người d&acirc;n.</span></span></p>\r\n\r\n<p style="text-align:center"><span style="font-family:arial,helvetica,sans-serif"><span style="font-size:14px"><img alt="" src="http://blogcongnghe.com.vn/web/uploads/tin-tuc/tin-trong-nuoc/Facebook-Chinh-phu.PNG" style="height:471px; width:646px" /></span></span></p>\r\n\r\n<p style="text-align:justify"><span style="font-family:arial,helvetica,sans-serif"><span style="font-size:14px">Ngo&agrave;i ra, Ch&iacute;nh phủ c&ograve;n lập thử nghiệm trang<em><strong> &ldquo;Diễn đ&agrave;n Cạnh tranh quốc gia&rdquo;</strong></em>. Hai t&agrave;i khoản Facebook n&agrave;y sẽ cung cấp c&aacute;c th&ocirc;ng c&aacute;o b&aacute;o ch&iacute;, chỉ đạo của Thủ tướng, c&aacute;c ph&oacute; thủ tướng v&agrave; một số hoạt động của Ch&iacute;nh phủ. Bằng c&aacute;ch truyền tải th&ocirc;ng tin mới n&agrave;y, Ch&iacute;nh phủ kỳ vọng c&aacute;c tin tức quan trọng sẽ được người d&acirc;n tiếp cận dễ d&agrave;ng hơn.</span></span>&nbsp;<span style="font-family:arial,helvetica,sans-serif"><span style="font-size:14px">&Ocirc;ng Đạo cũng cho hay, t&ugrave;y v&agrave;o kết quả thử nghiệm lần n&agrave;y, Cổng th&ocirc;ng tin điện tử Ch&iacute;nh phủ sẽ lập dự &aacute;n, hợp t&aacute;c ch&iacute;nh thức với Facebook để khai th&aacute;c ứng dụng n&agrave;y.</span></span></p>\r\n\r\n<p style="text-align:justify"><span style="font-family:arial,helvetica,sans-serif"><span style="font-size:14px">Cũng theo&nbsp;<strong>Nghị quyết 36a</strong>, Ch&iacute;nh phủ đang t&iacute;ch cực đẩy mạnh ứng dụng khoa học c&ocirc;ng nghệ th&ocirc;ng tin nhằm cải c&aacute;ch h&agrave;nh ch&iacute;nh, r&uacute;t ngắn thời gian va chi ph&iacute; thực hiện c&aacute;c thủ tục vơi cơ quan c&ocirc;ng quyền. V&agrave; đề ra mục ti&ecirc;u kể từ năm 2017, tất cả dịch vụ c&ocirc;ng phải được cung cấp trực tuyến, cho ph&eacute;p người sử dụng điền v&agrave; gửi qua hệ thống điện tử c&aacute; mẫu văn bản đến cơ quan, tổ chứ cung cấp dịch vụ. Qu&aacute; tr&igrave;nh xử l&yacute; hồ sơ v&agrave; cung cấp dịch vụ được thực hiện tr&ecirc;n m&ocirc;i trường mạng. Việc thanh to&aacute;n lệ ph&iacute; v&agrave; nhận kết quả được thực hiện trực tiếp tại cơ quan, tổ chức cung cấp dịch vụ.</span></span></p>\r\n\r\n<p style="text-align:right"><strong><span style="font-family:arial,helvetica,sans-serif"><span style="font-size:14px"><em>Theo VnExpress.</em> </span></span></strong></p>\r\n', 1, '2015-10-23 08:35:09', 1, 5, 1, 100, '/uploads/image/12177918-1008512222504384-1931-2477-6550-1445568771.jpg', 'Chính phủ mở tài khoản thử nghiệm trên Facebook');

-- --------------------------------------------------------

--
-- Table structure for table `post_lesson`
--

CREATE TABLE IF NOT EXISTS `post_lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `content_short` text COLLATE utf8_unicode_ci,
  `updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT '1',
  `lesson_category` int(11) DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort` int(11) DEFAULT '1',
  `images` varchar(255) COLLATE utf8_unicode_ci DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_post_lesson_idx` (`lesson_category`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `post_lesson`
--

INSERT INTO `post_lesson` (`id`, `title`, `content`, `content_short`, `updated`, `status`, `lesson_category`, `alias`, `sort`, `images`) VALUES
(1, 'Bài học 1', '<a href="http://mp3" title="#mp3">b&agrave;i học 1 </a><br />\r\n&nbsp;', 'Bài học 1', '2015-10-23 09:42:26', 1, 7, 'bai-hoc-1.html', 1, '/uploads/image/12177918-1008512222504384-1931-2477-6550-1445568771.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE IF NOT EXISTS `setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_description` varchar(45) COLLATE utf8_unicode_ci DEFAULT '1',
  `page_keywords` varchar(45) COLLATE utf8_unicode_ci DEFAULT '1',
  `page_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `page_description`, `page_keywords`, `page_name`) VALUES
(1, 'Hoc tieng anh Nhanh', 'hoc tieng anh nhanh', 'hoc tieng anh nhanh cập nhật mới');

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE IF NOT EXISTS `slider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `images` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`id`, `images`) VALUES
(2, '/uploads/slider/slide.png'),
(7, '/uploads/slider/slide.png'),
(8, '/uploads/slider/slide.png');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permission` varchar(45) COLLATE utf8_unicode_ci DEFAULT 'admin',
  `status` int(11) DEFAULT '1',
  `fullname` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`, `permission`, `status`, `fullname`) VALUES
(1, 'admin', 'anhnt0212@gmail.com', '25f9e794323b453885f5181f1b624d0b', 'admin', 1, 'PNC');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `fk_post_category` FOREIGN KEY (`category`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_post_user` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `post_lesson`
--
ALTER TABLE `post_lesson`
  ADD CONSTRAINT `fk_post_lesson` FOREIGN KEY (`lesson_category`) REFERENCES `lesson` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

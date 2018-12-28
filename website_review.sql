-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 01, 2018 at 04:43 PM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `website_review`
--

-- --------------------------------------------------------

--
-- Table structure for table `ca_cloud`
--

CREATE TABLE `ca_cloud` (
  `wid` int(10) UNSIGNED NOT NULL,
  `words` mediumtext NOT NULL,
  `matrix` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ca_content`
--

CREATE TABLE `ca_content` (
  `wid` int(10) UNSIGNED NOT NULL,
  `headings` mediumtext NOT NULL,
  `total_img` smallint(5) UNSIGNED NOT NULL,
  `total_alt` smallint(5) UNSIGNED NOT NULL,
  `deprecated` mediumtext NOT NULL,
  `isset_headings` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ca_document`
--

CREATE TABLE `ca_document` (
  `wid` int(10) UNSIGNED NOT NULL,
  `doctype` varchar(100) DEFAULT NULL,
  `lang` varchar(2) DEFAULT NULL,
  `charset` varchar(20) DEFAULT NULL,
  `css` tinyint(3) UNSIGNED NOT NULL,
  `js` tinyint(3) UNSIGNED NOT NULL,
  `htmlratio` tinyint(3) UNSIGNED NOT NULL,
  `favicon` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ca_issetobject`
--

CREATE TABLE `ca_issetobject` (
  `wid` int(10) UNSIGNED NOT NULL,
  `flash` tinyint(1) DEFAULT NULL,
  `iframe` tinyint(1) DEFAULT NULL,
  `nestedtables` tinyint(1) DEFAULT NULL,
  `inlinecss` tinyint(1) DEFAULT NULL,
  `email` tinyint(1) DEFAULT NULL,
  `viewport` tinyint(1) DEFAULT NULL,
  `dublincore` tinyint(1) DEFAULT NULL,
  `printable` tinyint(1) DEFAULT NULL,
  `appleicons` tinyint(1) DEFAULT NULL,
  `robotstxt` tinyint(1) DEFAULT NULL,
  `gzip` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ca_links`
--

CREATE TABLE `ca_links` (
  `wid` int(10) UNSIGNED NOT NULL,
  `links` mediumblob NOT NULL,
  `internal` smallint(5) UNSIGNED NOT NULL,
  `external_dofollow` smallint(5) UNSIGNED NOT NULL,
  `external_nofollow` smallint(5) UNSIGNED NOT NULL,
  `isset_underscore` tinyint(1) NOT NULL,
  `files_count` smallint(5) UNSIGNED NOT NULL,
  `friendly` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ca_metatags`
--

CREATE TABLE `ca_metatags` (
  `wid` int(10) UNSIGNED NOT NULL,
  `title` mediumtext,
  `keyword` mediumtext,
  `description` mediumtext,
  `ogproperties` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ca_misc`
--

CREATE TABLE `ca_misc` (
  `wid` int(10) UNSIGNED NOT NULL,
  `sitemap` text NOT NULL,
  `analytics` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ca_pagespeed`
--

CREATE TABLE `ca_pagespeed` (
  `wid` int(10) UNSIGNED NOT NULL,
  `data` longtext NOT NULL,
  `lang_id` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ca_w3c`
--

CREATE TABLE `ca_w3c` (
  `wid` int(10) UNSIGNED NOT NULL,
  `validator` enum('html') NOT NULL,
  `valid` tinyint(1) NOT NULL,
  `errors` smallint(5) UNSIGNED NOT NULL,
  `warnings` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ca_website`
--

CREATE TABLE `ca_website` (
  `id` int(10) UNSIGNED NOT NULL,
  `domain` varchar(90) DEFAULT NULL,
  `idn` varchar(255) DEFAULT NULL,
  `md5domain` varchar(32) DEFAULT NULL,
  `added` timestamp NULL DEFAULT NULL,
  `modified` timestamp NULL DEFAULT NULL,
  `score` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ca_cloud`
--
ALTER TABLE `ca_cloud`
  ADD PRIMARY KEY (`wid`);

--
-- Indexes for table `ca_content`
--
ALTER TABLE `ca_content`
  ADD PRIMARY KEY (`wid`);

--
-- Indexes for table `ca_document`
--
ALTER TABLE `ca_document`
  ADD PRIMARY KEY (`wid`);

--
-- Indexes for table `ca_issetobject`
--
ALTER TABLE `ca_issetobject`
  ADD PRIMARY KEY (`wid`);

--
-- Indexes for table `ca_links`
--
ALTER TABLE `ca_links`
  ADD PRIMARY KEY (`wid`);

--
-- Indexes for table `ca_metatags`
--
ALTER TABLE `ca_metatags`
  ADD PRIMARY KEY (`wid`);

--
-- Indexes for table `ca_misc`
--
ALTER TABLE `ca_misc`
  ADD PRIMARY KEY (`wid`);

--
-- Indexes for table `ca_pagespeed`
--
ALTER TABLE `ca_pagespeed`
  ADD PRIMARY KEY (`wid`,`lang_id`);

--
-- Indexes for table `ca_w3c`
--
ALTER TABLE `ca_w3c`
  ADD PRIMARY KEY (`wid`);

--
-- Indexes for table `ca_website`
--
ALTER TABLE `ca_website`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_md5domain` (`md5domain`),
  ADD KEY `ix_rating` (`score`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ca_website`
--
ALTER TABLE `ca_website`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

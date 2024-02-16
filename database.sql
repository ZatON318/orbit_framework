SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mtasa`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `username` varchar(64) NOT NULL,
  `password` varchar(128) NOT NULL,
  `salt` varchar(30) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `registerdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ip` mediumtext,
  `admin` float NOT NULL DEFAULT '0',
  `supporter` float NOT NULL DEFAULT '0',
  `vct` float NOT NULL DEFAULT '0',
  `mapper` float NOT NULL DEFAULT '0',
  `scripter` float NOT NULL DEFAULT '0',
  `fmt` float NOT NULL DEFAULT '0',
  `credits` int(11) NOT NULL DEFAULT '0',
  `referrer` int(11) DEFAULT NULL,
  `activated` tinyint(1) NOT NULL DEFAULT '0',
  `forumid` int(11) DEFAULT NULL,
  `require_password_change` tinyint(1) NOT NULL DEFAULT '0',
  `ucp_lastlogin` datetime(6) DEFAULT NULL,
  `punishpoints` int(11) NOT NULL DEFAULT '0',
  `punishdate` datetime DEFAULT NULL,
  `avatar` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `account_details`
--

CREATE TABLE `account_details` (
  `account_id` int(11) NOT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `warn_style` int(1) NOT NULL DEFAULT '1',
  `hiddenadmin` tinyint(3) UNSIGNED DEFAULT '0',
  `adminjail` tinyint(3) UNSIGNED DEFAULT '0',
  `adminjail_time` int(11) DEFAULT NULL,
  `adminjail_by` text,
  `adminjail_reason` text,
  `muted` tinyint(3) UNSIGNED DEFAULT '0',
  `globalooc` tinyint(3) UNSIGNED DEFAULT '1',
  `friendsmessage` varchar(255) NOT NULL DEFAULT 'Hi!',
  `adminjail_permanent` tinyint(3) UNSIGNED DEFAULT '0',
  `adminreports` int(11) DEFAULT '0',
  `warns` tinyint(3) UNSIGNED DEFAULT '0',
  `chatbubbles` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `adminnote` text,
  `appstate` tinyint(1) DEFAULT '0',
  `appdatetime` datetime DEFAULT NULL,
  `appreason` longtext,
  `help` int(1) NOT NULL DEFAULT '1',
  `adblocked` int(1) NOT NULL DEFAULT '0',
  `newsblocked` int(1) DEFAULT '0',
  `mtaserial` text,
  `d_addiction` text,
  `loginhash` varchar(64) DEFAULT NULL,
  `transfers` int(11) DEFAULT '0',
  `monitored` varchar(255) NOT NULL DEFAULT '',
  `autopark` int(1) NOT NULL DEFAULT '1',
  `forceUpdate` smallint(1) NOT NULL DEFAULT '0',
  `anotes` text,
  `oldAdminRank` int(11) DEFAULT '0',
  `suspensionTime` bigint(20) DEFAULT NULL,
  `car_license` int(1) NOT NULL DEFAULT '0',
  `adminreports_saved` int(3) DEFAULT '0',
  `cpa_earned` double DEFAULT '0',
  `electionsvoted` int(11) NOT NULL DEFAULT '0',
  `serial_whitelist_cap` int(2) NOT NULL DEFAULT '2',
  `max_characters` int(10) UNSIGNED NOT NULL DEFAULT '30',
  `remember_token` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Table structure for table `account_loa`
--

CREATE TABLE `account_loa` (
  `loa_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `from` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `to` datetime NOT NULL,
  `reason` text NOT NULL,
  `effective` tinyint(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `account_settings`
--

CREATE TABLE `account_settings` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `value` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_settings`
--

--INSERT INTO `account_settings` (`id`, `name`, `value`) VALUES
--(1, 'graphic_motionblur', '0'),
--(1, 'graphic_skyclouds', '0'),
--(1, 'graphic_shaderradar', '0'),
--(1, 'graphic_shaderwater', '0'),
--(1, 'graphic_shaderveh', '0');

-- --------------------------------------------------------

--
-- Table structure for table `adminhistory`
--

CREATE TABLE `adminhistory` (
  `id` int(10) NOT NULL,
  `user` int(10) NOT NULL,
  `user_char` int(11) DEFAULT '0',
  `admin` int(10) DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `action` tinyint(3) NOT NULL DEFAULT '6',
  `duration` int(10) NOT NULL DEFAULT '0',
  `reason` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `admin_teleports`
--

CREATE TABLE `admin_teleports` (
  `id` int(11) NOT NULL,
  `location_value` text NOT NULL COMMENT '/gotoplace #v',
  `location_description` text,
  `location_creator` int(10) NOT NULL COMMENT 'User ID',
  `posX` float(10,6) NOT NULL DEFAULT '0.000000',
  `posY` float(10,6) NOT NULL DEFAULT '0.000000',
  `posZ` float(10,6) NOT NULL DEFAULT '0.000000',
  `rot` float(10,6) NOT NULL DEFAULT '0.000000' COMMENT 'rotation',
  `int` int(6) NOT NULL DEFAULT '0' COMMENT 'interior',
  `dim` int(6) NOT NULL DEFAULT '0' COMMENT 'dimension'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='/tps manager';

-- --------------------------------------------------------

--
-- Table structure for table `advertisements`
--

CREATE TABLE `advertisements` (
  `id` int(11) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `advertisement` varchar(200) NOT NULL,
  `start` int(11) NOT NULL,
  `expiry` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `section` int(11) NOT NULL,
  `faction` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `apb`
--

CREATE TABLE `apb` (
  `id` int(11) NOT NULL,
  `description` text NOT NULL,
  `doneby` int(11) NOT NULL,
  `time` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `id` int(11) NOT NULL,
  `applicant` int(11) NOT NULL DEFAULT '0',
  `dateposted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `datereviewed` datetime DEFAULT NULL,
  `reviewer` int(11) NOT NULL DEFAULT '0',
  `note` varchar(500) DEFAULT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `question1` varchar(500) DEFAULT NULL,
  `question2` varchar(500) DEFAULT NULL,
  `question3` varchar(500) DEFAULT NULL,
  `question4` varchar(500) DEFAULT NULL,
  `answer1` varchar(500) DEFAULT NULL,
  `answer2` varchar(500) DEFAULT NULL,
  `answer3` varchar(500) DEFAULT NULL,
  `answer4` varchar(500) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `applications_questions`
--

CREATE TABLE `applications_questions` (
  `id` int(4) NOT NULL,
  `question` text,
  `answer1` text,
  `answer2` text,
  `answer3` text,
  `key` tinyint(1) NOT NULL DEFAULT '1',
  `createdBy` int(8) NOT NULL DEFAULT '0',
  `updatedBy` int(8) NOT NULL DEFAULT '0',
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `part` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `atms`
--

CREATE TABLE `atms` (
  `id` int(11) NOT NULL,
  `x` decimal(10,6) DEFAULT '0.000000',
  `y` decimal(10,6) DEFAULT '0.000000',
  `z` decimal(10,6) DEFAULT '0.000000',
  `rotation` decimal(10,6) DEFAULT '0.000000',
  `dimension` int(5) DEFAULT '0',
  `interior` int(5) DEFAULT '0',
  `deposit` tinyint(3) UNSIGNED DEFAULT '0',
  `limit` int(10) UNSIGNED DEFAULT '5000'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `atm_cards`
--

CREATE TABLE `atm_cards` (
  `card_id` int(11) NOT NULL,
  `card_owner` int(11) DEFAULT NULL,
  `card_number` text,
  `card_pin` varchar(4) NOT NULL DEFAULT '0000',
  `card_locked` tinyint(1) NOT NULL DEFAULT '0',
  `card_type` tinyint(1) NOT NULL DEFAULT '1',
  `limit_type` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bans`
--

CREATE TABLE `bans` (
  `id` int(11) NOT NULL,
  `mta_serial` varchar(32) DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `account` int(11) DEFAULT NULL,
  `admin` int(11) DEFAULT NULL,
  `reason` mediumtext NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `until` datetime DEFAULT NULL,
  `threadid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Handle serial bans instead of using MTA built-in / Maxime';

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `book` text,
  `readOnly` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='This is used for the book system. // Chaos';

-- --------------------------------------------------------

--
-- Table structure for table `characters`
--

CREATE TABLE `characters` (
  `id` int(11) NOT NULL,
  `charactername` varchar(255) DEFAULT NULL,
  `account` int(11) DEFAULT '0',
  `x` float DEFAULT '1169.73',
  `y` float DEFAULT '-1413.91',
  `z` float DEFAULT '13.48',
  `rotation` float DEFAULT '359.388',
  `interior_id` int(5) DEFAULT '0',
  `dimension_id` int(5) DEFAULT '0',
  `health` float DEFAULT '100',
  `armor` float DEFAULT '0',
  `skin` int(3) DEFAULT '264',
  `money` bigint(20) DEFAULT '500',
  `gender` int(1) DEFAULT '0',
  `cuffed` int(11) DEFAULT '0',
  `duty` int(3) DEFAULT '0',
  `fightstyle` int(2) DEFAULT '4',
  `pdjail` int(1) DEFAULT '0',
  `pdjail_time` int(11) DEFAULT '0',
  `cked` int(1) DEFAULT '0',
  `lastarea` varchar(255) DEFAULT NULL,
  `age` int(3) DEFAULT '18',
  `skincolor` int(1) DEFAULT '0',
  `weight` int(3) DEFAULT '180',
  `height` int(3) DEFAULT '180',
  `description` text,
  `deaths` int(11) DEFAULT '0',
  `faction_leader` int(1) DEFAULT '0',
  `fingerprint` varchar(255) DEFAULT NULL,
  `casualskin` int(3) DEFAULT '0',
  `bankmoney` bigint(20) DEFAULT '1000',
  `car_license` int(1) DEFAULT '0',
  `bike_license` int(1) DEFAULT '0',
  `pilot_license` int(1) DEFAULT '0',
  `fish_license` int(1) DEFAULT '0',
  `boat_license` int(1) DEFAULT '0',
  `gun_license` int(1) DEFAULT '0',
  `gun2_license` int(1) DEFAULT '0',
  `tag` int(3) DEFAULT '1',
  `hoursplayed` int(11) DEFAULT '0',
  `pdjail_station` int(1) DEFAULT '0',
  `timeinserver` int(2) DEFAULT '0',
  `restrainedobj` int(11) DEFAULT '0',
  `restrainedby` int(11) DEFAULT '0',
  `dutyskin` int(3) DEFAULT '-1',
  `fish` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `blindfold` tinyint(4) NOT NULL DEFAULT '0',
  `lang1` tinyint(2) DEFAULT '1',
  `lang1skill` tinyint(3) DEFAULT '100',
  `lang2` tinyint(2) DEFAULT '0',
  `lang2skill` tinyint(3) DEFAULT '0',
  `lang3` tinyint(2) DEFAULT '0',
  `lang3skill` tinyint(3) DEFAULT '0',
  `currlang` tinyint(1) DEFAULT '1',
  `lastlogin` datetime DEFAULT NULL,
  `creationdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `election_candidate` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `election_canvote` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `election_votedfor` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `marriedto` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `photos` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `maxvehicles` int(4) UNSIGNED NOT NULL DEFAULT '5',
  `ck_info` varchar(500) DEFAULT NULL,
  `alcohollevel` float NOT NULL DEFAULT '0',
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `recovery` int(1) DEFAULT '0',
  `recoverytime` bigint(20) DEFAULT NULL,
  `walkingstyle` int(3) NOT NULL DEFAULT '0',
  `job` int(3) NOT NULL DEFAULT '0',
  `day` tinyint(2) NOT NULL DEFAULT '1',
  `month` tinyint(2) NOT NULL DEFAULT '1',
  `maxinteriors` int(4) NOT NULL DEFAULT '10',
  `clothingid` int(10) UNSIGNED DEFAULT NULL,
  `death_date` datetime DEFAULT NULL,
  `max_clothes` int(10) UNSIGNED NOT NULL DEFAULT '3',
  `date_of_birth` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `characters_faction`
--

CREATE TABLE `characters_faction` (
  `id` int(11) NOT NULL,
  `character_id` int(11) NOT NULL,
  `faction_id` int(11) NOT NULL,
  `faction_rank` int(11) NOT NULL,
  `faction_leader` int(11) NOT NULL,
  `faction_phone` int(11) DEFAULT NULL,
  `faction_perks` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `character_settings`
--

CREATE TABLE `character_settings` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `value` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `clothing`
--

CREATE TABLE `clothing` (
  `id` int(11) UNSIGNED NOT NULL,
  `skin` int(11) UNSIGNED NOT NULL,
  `url` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT 'A set of clean clothes.',
  `price` int(11) UNSIGNED NOT NULL DEFAULT '50',
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator_char` int(10) NOT NULL DEFAULT '0',
  `for_sale_until` datetime DEFAULT NULL,
  `distribution` int(1) UNSIGNED NOT NULL DEFAULT '0',
  `manufactured_date` datetime DEFAULT NULL,
  `sold` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `commands`
--

CREATE TABLE `commands` (
  `id` int(11) NOT NULL,
  `command` text,
  `hotkey` text,
  `explanation` text,
  `permission` int(3) NOT NULL DEFAULT '0',
  `category` int(2) NOT NULL DEFAULT '1',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Saves all info about all kinds of supported commands and con';

-- --------------------------------------------------------

--
-- Table structure for table `dancers`
--

CREATE TABLE `dancers` (
  `id` int(10) UNSIGNED NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `rotation` float NOT NULL,
  `skin` smallint(5) UNSIGNED NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL,
  `interior` int(10) UNSIGNED NOT NULL,
  `dimension` int(10) UNSIGNED NOT NULL,
  `offset` tinyint(3) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dog_users`
--

CREATE TABLE `dog_users` (
  `id` int(11) NOT NULL,
  `charactername` varchar(45) NOT NULL,
  `attack` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `donators`
--

CREATE TABLE `donators` (
  `id` int(11) NOT NULL,
  `accountID` int(11) NOT NULL,
  `charID` int(11) NOT NULL DEFAULT '-1',
  `perkID` int(4) NOT NULL,
  `perkValue` varchar(10) NOT NULL DEFAULT '1',
  `expirationDate` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `don_purchases`
--

CREATE TABLE `don_purchases` (
  `id` int(11) NOT NULL,
  `name` text,
  `cost` int(11) DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `account` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `duty_allowed`
--

CREATE TABLE `duty_allowed` (
  `id` int(11) NOT NULL,
  `faction` int(11) NOT NULL,
  `itemID` int(11) NOT NULL,
  `itemValue` varchar(45) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Used for an admin allow list.';

-- --------------------------------------------------------

--
-- Table structure for table `duty_custom`
--

CREATE TABLE `duty_custom` (
  `id` int(11) NOT NULL,
  `factionid` int(11) NOT NULL,
  `name` text NOT NULL,
  `skins` text NOT NULL,
  `locations` text NOT NULL,
  `items` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Used for custom duties.';

-- --------------------------------------------------------

--
-- Table structure for table `duty_locations`
--

CREATE TABLE `duty_locations` (
  `id` int(11) NOT NULL,
  `factionid` int(11) NOT NULL,
  `name` text NOT NULL,
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  `z` int(11) DEFAULT NULL,
  `radius` int(11) DEFAULT NULL,
  `dimension` int(11) DEFAULT '0',
  `interior` int(11) DEFAULT '0',
  `vehicleid` int(11) DEFAULT NULL,
  `model` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Used for custom duty locations.';

-- --------------------------------------------------------

--
-- Table structure for table `elections`
--

CREATE TABLE `elections` (
  `id` int(11) NOT NULL,
  `electionsname` varchar(45) NOT NULL,
  `votes` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `elevators`
--

CREATE TABLE `elevators` (
  `id` int(11) NOT NULL,
  `x` decimal(10,6) DEFAULT '0.000000',
  `y` decimal(10,6) DEFAULT '0.000000',
  `z` decimal(10,6) DEFAULT '0.000000',
  `tpx` decimal(10,6) DEFAULT '0.000000',
  `tpy` decimal(10,6) DEFAULT '0.000000',
  `tpz` decimal(10,6) DEFAULT '0.000000',
  `dimensionwithin` int(5) DEFAULT '0',
  `interiorwithin` int(5) DEFAULT '0',
  `dimension` int(5) DEFAULT '0',
  `interior` int(5) DEFAULT '0',
  `car` tinyint(3) UNSIGNED DEFAULT '0',
  `disabled` tinyint(3) UNSIGNED DEFAULT '0',
  `rot` decimal(10,6) DEFAULT '0.000000',
  `tprot` decimal(10,6) DEFAULT '0.000000',
  `oneway` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `emailaccounts`
--

CREATE TABLE `emailaccounts` (
  `id` int(11) NOT NULL,
  `username` text,
  `password` text,
  `creator` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `sender` text,
  `receiver` text,
  `subject` text,
  `message` text,
  `inbox` int(1) NOT NULL DEFAULT '0',
  `outbox` int(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `faa_registry`
--

CREATE TABLE `faa_registry` (
  `codeid` int(11) NOT NULL,
  `owner` varchar(45) DEFAULT NULL,
  `condition` varchar(45) DEFAULT NULL,
  `notes` longtext,
  `x` float DEFAULT NULL,
  `y` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `factions`
--

CREATE TABLE `factions` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` text,
  `bankbalance` bigint(20) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `rank_order` text,
  `motd` text,
  `note` text,
  `fnote` text,
  `phone` varchar(20) DEFAULT NULL,
  `max_interiors` int(11) UNSIGNED NOT NULL DEFAULT '20',
  `max_vehicles` int(11) UNSIGNED NOT NULL DEFAULT '40',
  `free_custom_ints` tinyint(1) UNSIGNED DEFAULT '0',
  `free_custom_skins` tinyint(1) UNSIGNED DEFAULT '0',
  `before_tax_value` int(6) NOT NULL DEFAULT '0',
  `before_wage_charge` int(6) NOT NULL DEFAULT '0',
  `plugins` text,
  `active_plugins` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `faction_ranks`
--

CREATE TABLE `faction_ranks` (
  `id` int(11) NOT NULL,
  `faction_id` int(11) DEFAULT NULL,
  `name` text,
  `permissions` text,
  `isDefault` int(11) NOT NULL DEFAULT '0',
  `isLeader` int(11) NOT NULL DEFAULT '0',
  `wage` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(10) UNSIGNED NOT NULL,
  `uploaded_by` int(11) DEFAULT NULL,
  `file` mediumblob NOT NULL,
  `file_type` varchar(64) NOT NULL,
  `file_size` int(10) UNSIGNED NOT NULL,
  `dateline` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `connected_interior` int(11) DEFAULT NULL COMMENT 'The purpose of this field is to auto delete file record on interior delete.',
  `avatar_for_account` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Store file up to 21MB per record / By Maxime / Consult with him if you''re unsure of something.';

-- --------------------------------------------------------

--
-- Table structure for table `force_apps`
--

CREATE TABLE `force_apps` (
  `id` int(11) NOT NULL,
  `account` int(11) DEFAULT NULL,
  `forceapp_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Save forceapped players information to keep them from resubm' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

CREATE TABLE `friends` (
  `account_id` int(10) UNSIGNED NOT NULL,
  `friend_account_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `fuelpeds`
--

CREATE TABLE `fuelpeds` (
  `id` int(11) NOT NULL,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `posZ` float NOT NULL,
  `rotZ` float NOT NULL,
  `interior` int(11) NOT NULL DEFAULT '0',
  `dimension` int(11) NOT NULL DEFAULT '0',
  `skin` int(3) DEFAULT '50',
  `name` varchar(50) NOT NULL,
  `deletedBy` int(11) DEFAULT '0',
  `shop_link` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gates`
--

CREATE TABLE `gates` (
  `id` int(11) NOT NULL,
  `objectID` int(11) NOT NULL,
  `startX` float NOT NULL,
  `startY` float NOT NULL,
  `startZ` float NOT NULL,
  `startRX` float NOT NULL,
  `startRY` float NOT NULL,
  `startRZ` float NOT NULL,
  `endX` float NOT NULL,
  `endY` float NOT NULL,
  `endZ` float NOT NULL,
  `endRX` float NOT NULL,
  `endRY` float NOT NULL,
  `endRZ` float NOT NULL,
  `gateType` tinyint(3) UNSIGNED NOT NULL,
  `autocloseTime` int(4) NOT NULL,
  `movementTime` int(4) NOT NULL,
  `objectDimension` int(11) NOT NULL,
  `objectInterior` int(11) NOT NULL,
  `gateSecurityParameters` text,
  `creator` varchar(50) NOT NULL DEFAULT '',
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `adminNote` varchar(300) NOT NULL DEFAULT '',
  `triggerDistance` float DEFAULT NULL,
  `triggerDistanceVehicle` float DEFAULT NULL,
  `sound` varchar(50) DEFAULT 'metalgate'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `google_authenticator`
--

CREATE TABLE `google_authenticator` (
  `secret` varchar(16) NOT NULL,
  `userid` int(11) NOT NULL,
  `recovery_code` varchar(19) NOT NULL,
  `enabled` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Google Authenticator Integration By Maxime';

-- --------------------------------------------------------

--
-- Table structure for table `health_diagnose`
--

CREATE TABLE `health_diagnose` (
  `uniqueID` int(11) DEFAULT NULL,
  `int_diagnose` varchar(255) DEFAULT NULL,
  `ext_diagnose` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `insurance_data`
--

CREATE TABLE `insurance_data` (
  `policyid` int(11) NOT NULL,
  `customername` varchar(45) NOT NULL,
  `vehicleid` int(11) NOT NULL,
  `protection` varchar(45) NOT NULL,
  `deductible` int(11) NOT NULL,
  `date` date NOT NULL,
  `claims` float NOT NULL,
  `cashout` float NOT NULL,
  `premium` int(11) NOT NULL,
  `insurancefaction` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `insurance_factions`
--

CREATE TABLE `insurance_factions` (
  `factionID` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `gen_maxi` float NOT NULL DEFAULT '0.005',
  `news` text,
  `subscription` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `interiors`
--

CREATE TABLE `interiors` (
  `id` int(11) NOT NULL,
  `x` float DEFAULT '0',
  `y` float DEFAULT '0',
  `z` float DEFAULT '0',
  `type` int(1) DEFAULT '0',
  `owner` int(11) DEFAULT '-1',
  `locked` int(1) DEFAULT '0',
  `cost` int(11) DEFAULT '0',
  `name` text,
  `interior` int(5) DEFAULT '0',
  `interiorx` float DEFAULT '0',
  `interiory` float DEFAULT '0',
  `interiorz` float DEFAULT '0',
  `dimensionwithin` int(5) DEFAULT '0',
  `interiorwithin` int(5) DEFAULT '0',
  `angle` float DEFAULT '0',
  `angleexit` float DEFAULT '0',
  `supplies` text,
  `safepositionX` float DEFAULT NULL,
  `safepositionY` float DEFAULT NULL,
  `safepositionZ` float DEFAULT NULL,
  `safepositionRZ` float DEFAULT NULL,
  `disabled` tinyint(3) UNSIGNED DEFAULT '0',
  `lastused` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` varchar(45) NOT NULL DEFAULT '0',
  `deletedDate` datetime DEFAULT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` varchar(45) DEFAULT NULL,
  `isLightOn` tinyint(4) NOT NULL DEFAULT '0',
  `keypad_lock` int(11) DEFAULT NULL,
  `keypad_lock_pw` varchar(32) DEFAULT NULL,
  `keypad_lock_auto` tinyint(1) DEFAULT NULL,
  `faction` int(11) DEFAULT '0',
  `protected_until` datetime DEFAULT NULL,
  `furniture` int(1) NOT NULL DEFAULT '1',
  `interior_id` int(11) DEFAULT NULL,
  `tokenUsed` int(1) NOT NULL DEFAULT '0',
  `settings` text,
  `address` varchar(256) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `interior_business`
--

CREATE TABLE `interior_business` (
  `intID` int(11) NOT NULL,
  `businessNote` varchar(101) NOT NULL DEFAULT 'Welcome to our business!'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Saves info about businesses - Maxime';

-- --------------------------------------------------------

--
-- Table structure for table `interior_logs`
--

CREATE TABLE `interior_logs` (
  `log_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `intID` int(11) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `actor` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores all admin actions on interiors - Monitored by Interio';

-- --------------------------------------------------------

--
-- Table structure for table `interior_notes`
--

CREATE TABLE `interior_notes` (
  `id` int(11) NOT NULL,
  `intid` int(11) NOT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `note` varchar(500) NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `interior_textures`
--

CREATE TABLE `interior_textures` (
  `id` int(11) NOT NULL,
  `interior` int(11) NOT NULL,
  `texture` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `rotation` smallint(5) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ippc_airlines`
--

CREATE TABLE `ippc_airlines` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `code` varchar(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ippc_airline_pilots`
--

CREATE TABLE `ippc_airline_pilots` (
  `id` int(11) NOT NULL,
  `airline` int(11) NOT NULL,
  `character` int(11) NOT NULL,
  `leader` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ippc_flights`
--

CREATE TABLE `ippc_flights` (
  `id` int(11) NOT NULL,
  `callsign` varchar(50) NOT NULL,
  `adep` varchar(50) NOT NULL,
  `ades` varchar(50) NOT NULL,
  `etd` datetime NOT NULL,
  `eta` datetime DEFAULT NULL,
  `vin` int(11) NOT NULL,
  `pilot1` int(11) DEFAULT NULL,
  `pilot2` int(11) DEFAULT NULL,
  `remarks` text,
  `airline` int(11) NOT NULL,
  `category` varchar(50) NOT NULL,
  `tickets` tinyint(1) NOT NULL,
  `seats1` int(3) DEFAULT NULL,
  `seats2` int(3) DEFAULT NULL,
  `seats3` int(3) DEFAULT NULL,
  `price1` int(3) DEFAULT NULL,
  `price2` int(3) DEFAULT NULL,
  `price3` int(3) DEFAULT NULL,
  `submitter` int(11) NOT NULL,
  `submitted` datetime NOT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `index` int(10) UNSIGNED NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL,
  `owner` int(10) UNSIGNED NOT NULL,
  `itemID` int(10) NOT NULL,
  `itemValue` varchar(255) NOT NULL,
  `protected` int(100) NOT NULL DEFAULT '0',
  `metadata` text COMMENT 'additional data for the item that can be edited per individual item, JSON'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jailed`
--

CREATE TABLE `jailed` (
  `id` int(11) NOT NULL,
  `charid` int(11) NOT NULL,
  `charactername` text NOT NULL,
  `jail_time` bigint(12) NOT NULL,
  `jail_time_online` int(10) NOT NULL DEFAULT '0',
  `convictionDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text NOT NULL,
  `charges` text NOT NULL,
  `cell` text NOT NULL,
  `fine` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `jobID` int(11) NOT NULL DEFAULT '0',
  `jobCharID` int(11) NOT NULL DEFAULT '-1',
  `jobLevel` int(11) NOT NULL DEFAULT '1',
  `jobProgress` int(11) NOT NULL DEFAULT '0',
  `jobTruckingRuns` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Saves job info, skill level and progress - Maxime' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `jobs_trucker_orders`
--

CREATE TABLE `jobs_trucker_orders` (
  `orderID` int(11) NOT NULL,
  `orderX` float NOT NULL DEFAULT '0',
  `orderY` float NOT NULL DEFAULT '0',
  `orderZ` float NOT NULL DEFAULT '0',
  `orderName` text NOT NULL,
  `orderInterior` int(11) NOT NULL DEFAULT '0',
  `orderSupplies` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Saves info about customer orders to create markers for truck';

-- --------------------------------------------------------

--
-- Table structure for table `leo_impound_lot`
--

CREATE TABLE `leo_impound_lot` (
  `lane` int(11) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `rx` float NOT NULL,
  `ry` float NOT NULL,
  `rz` float NOT NULL,
  `int` float NOT NULL,
  `dim` float NOT NULL,
  `faction` int(11) NOT NULL,
  `veh` int(11) NOT NULL DEFAULT '0',
  `fine` int(11) NOT NULL DEFAULT '0',
  `release_date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lifts`
--

CREATE TABLE `lifts` (
  `id` int(11) NOT NULL,
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  `comment` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lift_floors`
--

CREATE TABLE `lift_floors` (
  `id` int(11) NOT NULL,
  `lift` int(11) NOT NULL,
  `x` float(10,6) DEFAULT '0.000000',
  `y` float(10,6) DEFAULT '0.000000',
  `z` float(10,6) DEFAULT '0.000000',
  `dimension` int(5) DEFAULT '0',
  `interior` int(5) DEFAULT '0',
  `floor` varchar(3) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lottery`
--

CREATE TABLE `lottery` (
  `characterid` int(255) NOT NULL,
  `ticketnumber` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `maps`
--

CREATE TABLE `maps` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `preview` text NOT NULL,
  `purposes` text NOT NULL,
  `used_by` text NOT NULL,
  `reasons` text NOT NULL,
  `approved` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `enabled` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `uploader` int(10) UNSIGNED NOT NULL,
  `type` varchar(45) NOT NULL DEFAULT 'exterior',
  `upload_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reviewer` int(10) UNSIGNED DEFAULT NULL,
  `note` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `maps_objects`
--

CREATE TABLE `maps_objects` (
  `index` int(10) UNSIGNED NOT NULL,
  `map_id` int(10) UNSIGNED NOT NULL,
  `id` text,
  `interior` int(11) NOT NULL,
  `dimension` int(11) DEFAULT NULL,
  `collisions` tinyint(1) DEFAULT NULL,
  `breakable` tinyint(1) DEFAULT NULL,
  `radius` double UNSIGNED DEFAULT NULL,
  `model` int(10) UNSIGNED NOT NULL,
  `lodModel` int(10) UNSIGNED DEFAULT NULL,
  `posX` double NOT NULL,
  `posY` double NOT NULL,
  `posZ` double NOT NULL,
  `rotX` double NOT NULL,
  `rotY` double NOT NULL,
  `rotZ` double NOT NULL,
  `doublesided` tinyint(1) UNSIGNED DEFAULT NULL,
  `scale` double UNSIGNED DEFAULT NULL,
  `alpha` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mdc_anpr`
--

CREATE TABLE `mdc_anpr` (
  `id` int(11) NOT NULL,
  `vehicle_plate` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `doneby` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `organization` varchar(10) NOT NULL DEFAULT 'LSPD'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mdc_apb`
--

CREATE TABLE `mdc_apb` (
  `id` int(11) NOT NULL,
  `person_involved` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `doneby` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `organization` varchar(10) NOT NULL DEFAULT 'LSPD'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mdc_calls`
--

CREATE TABLE `mdc_calls` (
  `id` int(11) NOT NULL,
  `caller` varchar(50) NOT NULL,
  `number` varchar(10) NOT NULL,
  `description` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mdc_crimes`
--

CREATE TABLE `mdc_crimes` (
  `id` int(11) NOT NULL,
  `crime` varchar(255) NOT NULL,
  `punishment` varchar(255) NOT NULL,
  `character` int(11) NOT NULL,
  `officer` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mdc_criminals`
--

CREATE TABLE `mdc_criminals` (
  `character` int(11) NOT NULL,
  `dob` varchar(10) NOT NULL DEFAULT 'mm/dd/yyyy',
  `ethnicity` varchar(50) NOT NULL DEFAULT 'Unknown',
  `phone` varchar(10) NOT NULL DEFAULT 'Unknown',
  `occupation` varchar(50) NOT NULL DEFAULT 'Unknown',
  `address` varchar(50) NOT NULL DEFAULT 'Unknown',
  `photo` int(11) NOT NULL DEFAULT '-1',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `wanted` int(11) NOT NULL DEFAULT '0',
  `wanted_by` int(11) NOT NULL DEFAULT '0',
  `wanted_details` varchar(255) DEFAULT NULL,
  `pilot_details` varchar(255) DEFAULT NULL,
  `details` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mdc_dmv`
--

CREATE TABLE `mdc_dmv` (
  `id` int(11) NOT NULL,
  `char` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `vehicle` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mdc_faa_events`
--

CREATE TABLE `mdc_faa_events` (
  `id` int(11) NOT NULL,
  `crime` varchar(255) NOT NULL,
  `punishment` varchar(255) NOT NULL,
  `character` int(11) NOT NULL,
  `officer` varchar(100) NOT NULL,
  `timestamp` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mdc_faa_licenses`
--

CREATE TABLE `mdc_faa_licenses` (
  `id` int(11) NOT NULL,
  `character` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `license` int(2) NOT NULL,
  `value` int(4) DEFAULT NULL,
  `officer` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mdc_groups`
--

CREATE TABLE `mdc_groups` (
  `faction_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(45) NOT NULL,
  `haveMdcInAllVehicles` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `canSeeWarrants` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `canSeeCalls` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `canAddAPB` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `canSeeVehicles` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `canSeeProperties` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `canSeeLicenses` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `canSeePilotStuff` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `impound_can_see` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `settingUsernameFormat` tinyint(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='User group''s permissions based on factions.';

-- --------------------------------------------------------

--
-- Table structure for table `mdc_impounds`
--

CREATE TABLE `mdc_impounds` (
  `id` int(11) NOT NULL,
  `veh` int(11) NOT NULL,
  `content` text,
  `reporter` text,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mdc_users`
--

CREATE TABLE `mdc_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `charid` int(11) UNSIGNED NOT NULL,
  `level` int(11) UNSIGNED NOT NULL,
  `organization` int(11) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mdc_users_old`
--

CREATE TABLE `mdc_users_old` (
  `id` int(11) NOT NULL,
  `user` varchar(30) NOT NULL,
  `pass` varchar(60) NOT NULL,
  `level` int(11) NOT NULL,
  `organization` varchar(30) NOT NULL DEFAULT 'LSPD'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(11) NOT NULL,
  `resource` varchar(45) DEFAULT NULL,
  `migration` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `resource`, `migration`) VALUES
(1, 'interior_system', 1),
(2, 'interior_system', 2),
(3, 'interior_system', 3),
(4, 'mdc', 1),
(5, 'npc', 1),
(6, 'vehicle_manager', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mobile_payments`
--

CREATE TABLE `mobile_payments` (
  `payment_id` int(11) UNSIGNED NOT NULL,
  `sender_phone` varchar(45) NOT NULL,
  `operator` varchar(45) DEFAULT 'N/A',
  `country` varchar(45) DEFAULT 'N/A',
  `game_coin` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `account` int(11) UNSIGNED NOT NULL,
  `currency` varchar(10) NOT NULL DEFAULT 'USD',
  `cost` double NOT NULL DEFAULT '0',
  `revenue` double NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `transaction_id` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `motds`
--

CREATE TABLE `motds` (
  `id` int(11) NOT NULL,
  `title` varchar(70) NOT NULL,
  `content` text NOT NULL,
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expiration_date` datetime DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  `dismissable` tinyint(1) NOT NULL DEFAULT '1',
  `audiences` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `motd_read`
--

CREATE TABLE `motd_read` (
  `id` int(11) NOT NULL,
  `motdid` int(11) NOT NULL,
  `userid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Note down everyone that read and dismissed the motd.';

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `details` text,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(50) NOT NULL DEFAULT 'other'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `objects`
--

CREATE TABLE `objects` (
  `id` int(11) NOT NULL,
  `model` int(6) NOT NULL DEFAULT '0',
  `posX` float(12,7) NOT NULL DEFAULT '0.0000000',
  `posY` float(12,7) NOT NULL DEFAULT '0.0000000',
  `posZ` float(12,7) NOT NULL DEFAULT '0.0000000',
  `rotX` float(12,7) NOT NULL DEFAULT '0.0000000',
  `rotY` float(12,7) NOT NULL DEFAULT '0.0000000',
  `rotZ` float(12,7) NOT NULL DEFAULT '0.0000000',
  `interior` int(5) NOT NULL,
  `dimension` int(5) NOT NULL,
  `comment` varchar(50) DEFAULT NULL,
  `solid` int(1) NOT NULL DEFAULT '1',
  `doublesided` int(1) NOT NULL DEFAULT '0',
  `scale` float(12,7) DEFAULT NULL,
  `breakable` int(1) NOT NULL DEFAULT '0',
  `alpha` int(11) NOT NULL DEFAULT '255'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `online_sessions`
--

CREATE TABLE `online_sessions` (
  `id` int(10) UNSIGNED NOT NULL,
  `staff` int(10) UNSIGNED NOT NULL,
  `minutes_online` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `minutes_duty` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `paynspray`
--

CREATE TABLE `paynspray` (
  `id` int(11) NOT NULL,
  `x` decimal(10,6) DEFAULT '0.000000',
  `y` decimal(10,6) DEFAULT '0.000000',
  `z` decimal(10,6) DEFAULT '0.000000',
  `dimension` int(5) DEFAULT '0',
  `interior` int(5) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `paypal_ipn`
--

CREATE TABLE `paypal_ipn` (
  `id` int(11) NOT NULL,
  `business` varchar(127) NOT NULL,
  `charset` varchar(255) NOT NULL,
  `custom` varchar(256) NOT NULL,
  `notify_version` decimal(64,2) DEFAULT NULL,
  `parent_txn_id` varchar(19) NOT NULL,
  `receiver_email` varchar(254) NOT NULL,
  `receiver_id` varchar(255) NOT NULL,
  `residence_country` varchar(2) NOT NULL,
  `test_ipn` tinyint(1) NOT NULL,
  `txn_id` varchar(255) NOT NULL,
  `txn_type` varchar(255) NOT NULL,
  `verify_sign` varchar(255) NOT NULL,
  `address_country` varchar(64) NOT NULL,
  `address_city` varchar(40) NOT NULL,
  `address_country_code` varchar(64) NOT NULL,
  `address_name` varchar(128) NOT NULL,
  `address_state` varchar(40) NOT NULL,
  `address_status` varchar(255) NOT NULL,
  `address_street` varchar(200) NOT NULL,
  `address_zip` varchar(20) NOT NULL,
  `contact_phone` varchar(20) NOT NULL,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  `payer_business_name` varchar(127) NOT NULL,
  `payer_email` varchar(127) NOT NULL,
  `payer_id` varchar(13) NOT NULL,
  `auth_amount` decimal(64,2) DEFAULT NULL,
  `auth_exp` varchar(28) NOT NULL,
  `auth_id` varchar(19) NOT NULL,
  `auth_status` varchar(255) NOT NULL,
  `exchange_rate` decimal(64,16) DEFAULT NULL,
  `invoice` varchar(127) NOT NULL,
  `item_name` varchar(127) NOT NULL,
  `item_number` varchar(127) NOT NULL,
  `mc_currency` varchar(32) NOT NULL,
  `mc_fee` decimal(64,2) DEFAULT NULL,
  `mc_gross` decimal(64,2) DEFAULT NULL,
  `mc_handling` decimal(64,2) DEFAULT NULL,
  `mc_shipping` decimal(64,2) DEFAULT NULL,
  `memo` varchar(255) NOT NULL,
  `num_cart_items` int(11) DEFAULT NULL,
  `option_name1` varchar(64) NOT NULL,
  `option_name2` varchar(64) NOT NULL,
  `payer_status` varchar(255) NOT NULL,
  `payment_date` datetime(6) DEFAULT NULL,
  `payment_gross` decimal(64,2) DEFAULT NULL,
  `payment_status` varchar(255) NOT NULL,
  `payment_type` varchar(255) NOT NULL,
  `pending_reason` varchar(255) NOT NULL,
  `protection_eligibility` varchar(255) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `reason_code` varchar(255) NOT NULL,
  `remaining_settle` decimal(64,2) DEFAULT NULL,
  `settle_amount` decimal(64,2) DEFAULT NULL,
  `settle_currency` varchar(32) NOT NULL,
  `shipping` decimal(64,2) DEFAULT NULL,
  `shipping_method` varchar(255) NOT NULL,
  `tax` decimal(64,2) DEFAULT NULL,
  `transaction_entity` varchar(255) NOT NULL,
  `auction_buyer_id` varchar(64) NOT NULL,
  `auction_closing_date` datetime(6) DEFAULT NULL,
  `auction_multi_item` int(11) DEFAULT NULL,
  `for_auction` decimal(64,2) DEFAULT NULL,
  `amount` decimal(64,2) DEFAULT NULL,
  `amount_per_cycle` decimal(64,2) DEFAULT NULL,
  `initial_payment_amount` decimal(64,2) DEFAULT NULL,
  `next_payment_date` datetime(6) DEFAULT NULL,
  `outstanding_balance` decimal(64,2) DEFAULT NULL,
  `payment_cycle` varchar(255) NOT NULL,
  `period_type` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(255) NOT NULL,
  `profile_status` varchar(255) NOT NULL,
  `recurring_payment_id` varchar(255) NOT NULL,
  `rp_invoice_id` varchar(127) NOT NULL,
  `time_created` datetime(6) DEFAULT NULL,
  `amount1` decimal(64,2) DEFAULT NULL,
  `amount2` decimal(64,2) DEFAULT NULL,
  `amount3` decimal(64,2) DEFAULT NULL,
  `mc_amount1` decimal(64,2) DEFAULT NULL,
  `mc_amount2` decimal(64,2) DEFAULT NULL,
  `mc_amount3` decimal(64,2) DEFAULT NULL,
  `password` varchar(24) NOT NULL,
  `period1` varchar(255) NOT NULL,
  `period2` varchar(255) NOT NULL,
  `period3` varchar(255) NOT NULL,
  `reattempt` varchar(1) NOT NULL,
  `recur_times` int(11) DEFAULT NULL,
  `recurring` varchar(1) NOT NULL,
  `retry_at` datetime(6) DEFAULT NULL,
  `subscr_date` datetime(6) DEFAULT NULL,
  `subscr_effective` datetime(6) DEFAULT NULL,
  `subscr_id` varchar(19) NOT NULL,
  `username` varchar(64) NOT NULL,
  `case_creation_date` datetime(6) DEFAULT NULL,
  `case_id` varchar(255) NOT NULL,
  `case_type` varchar(255) NOT NULL,
  `receipt_id` varchar(255) NOT NULL,
  `currency_code` varchar(32) NOT NULL,
  `handling_amount` decimal(64,2) DEFAULT NULL,
  `transaction_subject` varchar(256) NOT NULL,
  `ipaddress` char(39) DEFAULT NULL,
  `flag` tinyint(1) NOT NULL,
  `flag_code` varchar(16) NOT NULL,
  `flag_info` longtext NOT NULL,
  `query` longtext NOT NULL,
  `response` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `from_view` varchar(6) DEFAULT NULL,
  `mp_id` varchar(128) DEFAULT NULL,
  `option_selection1` varchar(200) NOT NULL,
  `option_selection2` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pd_tickets`
--

CREATE TABLE `pd_tickets` (
  `id` int(11) NOT NULL,
  `vehid` int(11) NOT NULL,
  `reason` text NOT NULL,
  `amount` int(11) NOT NULL,
  `issuer` int(11) DEFAULT NULL,
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `peds`
--

CREATE TABLE `peds` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `behaviour` int(3) DEFAULT '1',
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `rotation` float NOT NULL,
  `interior` int(5) NOT NULL,
  `dimension` int(5) NOT NULL,
  `skin` int(1) DEFAULT NULL,
  `money` bigint(20) NOT NULL DEFAULT '0',
  `gender` int(1) DEFAULT NULL,
  `stats` text,
  `description` text,
  `owner_type` int(1) NOT NULL DEFAULT '0',
  `owner` int(11) DEFAULT NULL,
  `animation` varchar(255) DEFAULT NULL,
  `synced` tinyint(1) NOT NULL DEFAULT '0',
  `nametag` tinyint(1) NOT NULL DEFAULT '1',
  `frozen` tinyint(1) NOT NULL DEFAULT '0',
  `comment` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phones`
--

CREATE TABLE `phones` (
  `phonenumber` int(9) NOT NULL,
  `turnedon` smallint(1) NOT NULL DEFAULT '1',
  `secretnumber` smallint(1) NOT NULL DEFAULT '0',
  `phonebook` varchar(40) NOT NULL DEFAULT '0',
  `ringtone` smallint(1) NOT NULL DEFAULT '3',
  `contact_limit` int(5) NOT NULL DEFAULT '50',
  `boughtby` int(11) NOT NULL DEFAULT '-1',
  `bought_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sms_tone` smallint(1) NOT NULL DEFAULT '7',
  `keypress_tone` smallint(1) NOT NULL DEFAULT '1',
  `tone_volume` smallint(2) NOT NULL DEFAULT '10'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `phone_contacts`
--

CREATE TABLE `phone_contacts` (
  `id` int(11) NOT NULL,
  `phone` bigint(50) NOT NULL,
  `entryName` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `entryNumber` varchar(50) NOT NULL,
  `entryEmail` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `entryAddress` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `entryFavorited` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `phone_history`
--

CREATE TABLE `phone_history` (
  `id` int(11) NOT NULL,
  `from` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `to` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `private` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_sms`
--

CREATE TABLE `phone_sms` (
  `id` int(11) NOT NULL,
  `from` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `to` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `viewed` tinyint(1) NOT NULL DEFAULT '0',
  `private` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pilot_notams`
--

CREATE TABLE `pilot_notams` (
  `id` int(11) NOT NULL,
  `information` longtext
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `publicphones`
--

CREATE TABLE `publicphones` (
  `id` int(10) UNSIGNED NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `dimension` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `order_id` int(11) NOT NULL,
  `txn_id` varchar(50) NOT NULL,
  `payer_email` varchar(75) NOT NULL,
  `mc_gross` float(9,2) NOT NULL,
  `donor` int(11) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `donated_for` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `method` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `radio_stations`
--

CREATE TABLE `radio_stations` (
  `id` int(11) NOT NULL,
  `station_name` text,
  `source` text,
  `owner` int(11) NOT NULL DEFAULT '0',
  `register_date` datetime DEFAULT NULL,
  `expire_date` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `order` int(5) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Dynamic radio stations.';

-- --------------------------------------------------------

--
-- Table structure for table `ramps`
--

CREATE TABLE `ramps` (
  `id` int(2) NOT NULL,
  `position` text,
  `interior` int(2) DEFAULT NULL,
  `dimension` int(2) DEFAULT NULL,
  `rotation` int(5) DEFAULT NULL,
  `creator` text,
  `liftposition` int(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `handler` int(11) NOT NULL,
  `reporter` int(10) UNSIGNED NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `details` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `restricted_freqs`
--

CREATE TABLE `restricted_freqs` (
  `id` int(11) NOT NULL,
  `frequency` text,
  `limitedto` int(5) DEFAULT NULL,
  `addedby` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sapt_destinations`
--

CREATE TABLE `sapt_destinations` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `destinationID` varchar(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sapt_locations`
--

CREATE TABLE `sapt_locations` (
  `id` int(11) NOT NULL,
  `route` int(11) NOT NULL,
  `stopID` int(11) NOT NULL,
  `name` text NOT NULL,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `posZ` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sapt_routes`
--

CREATE TABLE `sapt_routes` (
  `id` int(11) NOT NULL,
  `line` int(11) NOT NULL,
  `route` int(11) NOT NULL,
  `destination` varchar(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `serial_whitelist`
--

CREATE TABLE `serial_whitelist` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `serial` varchar(32) NOT NULL,
  `creation_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_login_ip` varchar(15) DEFAULT NULL,
  `last_login_date` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `name` text,
  `value` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`) VALUES
(10, 'tax', '15'),
(11, 'incometax', '10'),
(12, 'lottery', '0'),
(13, 'lotteryNumber', '18');

-- --------------------------------------------------------

--
-- Table structure for table `sfia_pilots`
--

CREATE TABLE `sfia_pilots` (
  `id` int(11) NOT NULL,
  `charactername` varchar(45) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` int(11) NOT NULL,
  `x` float DEFAULT '0',
  `y` float DEFAULT '0',
  `z` float DEFAULT '0',
  `dimension` int(5) DEFAULT '0',
  `interior` int(5) DEFAULT '0',
  `shoptype` tinyint(4) DEFAULT '0',
  `rotationz` float NOT NULL DEFAULT '0',
  `skin` varchar(50) DEFAULT NULL,
  `sPendingWage` int(11) NOT NULL DEFAULT '0',
  `sIncome` bigint(20) NOT NULL DEFAULT '0',
  `sCapacity` int(11) NOT NULL DEFAULT '10',
  `sSales` varchar(5000) NOT NULL DEFAULT '',
  `pedName` varchar(255) DEFAULT NULL,
  `faction_belong` int(11) NOT NULL DEFAULT '0',
  `faction_access` tinyint(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shop_contacts_info`
--

CREATE TABLE `shop_contacts_info` (
  `npcID` int(11) NOT NULL,
  `sOwner` varchar(255) DEFAULT NULL,
  `sPhone` varchar(255) DEFAULT NULL,
  `sEmail` varchar(255) DEFAULT NULL,
  `sForum` varchar(500) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Saves data about business''s owners in shop system - MAXIME';

-- --------------------------------------------------------

--
-- Table structure for table `shop_products`
--

CREATE TABLE `shop_products` (
  `npcID` int(11) DEFAULT NULL,
  `pItemID` int(11) DEFAULT NULL,
  `pItemValue` varchar(500) DEFAULT NULL,
  `pMetadata` text,
  `pDesc` varchar(500) DEFAULT NULL,
  `pPrice` int(11) DEFAULT NULL,
  `pDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `pID` int(11) NOT NULL,
  `pQuantity` int(11) NOT NULL DEFAULT '1',
  `pSetQuantity` int(11) NOT NULL DEFAULT '1',
  `pRestockInterval` int(11) DEFAULT '0',
  `pRestockedDate` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Saves on-sale products from players, business system by Maxi';

-- --------------------------------------------------------

--
-- Table structure for table `speedcams`
--

CREATE TABLE `speedcams` (
  `id` int(11) NOT NULL,
  `x` float(11,7) NOT NULL DEFAULT '0.0000000',
  `y` float(11,7) NOT NULL DEFAULT '0.0000000',
  `z` float(11,7) NOT NULL DEFAULT '0.0000000',
  `interior` int(3) NOT NULL DEFAULT '0' COMMENT 'Stores the location of the pernament speedcams',
  `dimension` int(5) NOT NULL DEFAULT '0',
  `maxspeed` int(4) NOT NULL DEFAULT '120',
  `radius` int(4) NOT NULL DEFAULT '2',
  `enabled` smallint(1) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `speedingviolations`
--

CREATE TABLE `speedingviolations` (
  `id` int(11) NOT NULL,
  `carID` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `speed` int(5) NOT NULL,
  `area` varchar(50) NOT NULL,
  `personVisible` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staff_changelogs`
--

CREATE TABLE `staff_changelogs` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `team` int(11) NOT NULL,
  `from_rank` int(11) NOT NULL,
  `to_rank` int(11) DEFAULT NULL,
  `by` int(11) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Maxime 2015.01.08';

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `x` decimal(10,6) DEFAULT NULL,
  `y` decimal(10,6) DEFAULT NULL,
  `z` decimal(10,6) DEFAULT NULL,
  `interior` int(5) DEFAULT NULL,
  `dimension` int(5) DEFAULT NULL,
  `rx` decimal(10,6) DEFAULT NULL,
  `ry` decimal(10,6) DEFAULT NULL,
  `rz` decimal(10,6) DEFAULT NULL,
  `modelid` int(5) DEFAULT NULL,
  `creationdate` datetime DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '-1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tc_comments`
--

CREATE TABLE `tc_comments` (
  `id` int(11) NOT NULL,
  `poster` int(11) NOT NULL,
  `comment` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `internal` tinyint(1) NOT NULL DEFAULT '0',
  `tcid` int(11) NOT NULL,
  `system_message` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tc_subscribers`
--

CREATE TABLE `tc_subscribers` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tc_tickets`
--

CREATE TABLE `tc_tickets` (
  `id` int(11) NOT NULL,
  `creator` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `assign_to` int(11) DEFAULT NULL,
  `subscribers` varchar(500) DEFAULT ',',
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `subject` mediumtext NOT NULL,
  `content` mediumtext NOT NULL,
  `private` tinyint(1) NOT NULL DEFAULT '0',
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tempinteriors`
--

CREATE TABLE `tempinteriors` (
  `id` int(11) NOT NULL,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `posZ` float NOT NULL,
  `interior` int(5) NOT NULL,
  `uploaded_by` int(11) DEFAULT NULL,
  `uploaded_at` datetime NOT NULL,
  `amount_paid` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tempobjects`
--

CREATE TABLE `tempobjects` (
  `id` int(11) NOT NULL,
  `model` int(6) NOT NULL DEFAULT '0',
  `posX` float(12,7) NOT NULL DEFAULT '0.0000000',
  `posY` float(12,7) NOT NULL DEFAULT '0.0000000',
  `posZ` float(12,7) NOT NULL DEFAULT '0.0000000',
  `rotX` float(12,7) NOT NULL DEFAULT '0.0000000',
  `rotY` float(12,7) NOT NULL DEFAULT '0.0000000',
  `rotZ` float(12,7) NOT NULL DEFAULT '0.0000000',
  `interior` int(5) NOT NULL,
  `dimension` int(5) NOT NULL,
  `solid` int(1) NOT NULL DEFAULT '1',
  `doublesided` int(1) NOT NULL DEFAULT '0',
  `scale` float(12,7) NOT NULL DEFAULT '1.0000000',
  `breakable` int(1) NOT NULL DEFAULT '0',
  `alpha` tinyint(3) UNSIGNED NOT NULL DEFAULT '255'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `textures_animated`
--

CREATE TABLE `textures_animated` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `frames` text NOT NULL,
  `speed` int(4) NOT NULL,
  `createdBy` int(11) NOT NULL,
  `createdAt` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `towstats`
--

CREATE TABLE `towstats` (
  `id` int(11) NOT NULL,
  `character` int(11) NOT NULL,
  `vehicle` int(11) DEFAULT NULL,
  `vehicle_plate` varchar(8) DEFAULT NULL COMMENT 'vehicle plate at the time of towing, if any',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'date of towing'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Detailed information for TTR leaders who towed what and when';

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` int(11) NOT NULL,
  `model` int(3) DEFAULT '0',
  `x` decimal(10,6) DEFAULT '0.000000',
  `y` decimal(10,6) DEFAULT '0.000000',
  `z` decimal(10,6) DEFAULT '0.000000',
  `rotx` decimal(10,6) DEFAULT '0.000000',
  `roty` decimal(10,6) DEFAULT '0.000000',
  `rotz` decimal(10,6) DEFAULT '0.000000',
  `currx` decimal(10,6) DEFAULT '0.000000',
  `curry` decimal(10,6) DEFAULT '0.000000',
  `currz` decimal(10,6) DEFAULT '0.000000',
  `currrx` decimal(10,6) DEFAULT '0.000000',
  `currry` decimal(10,6) DEFAULT '0.000000',
  `currrz` decimal(10,6) NOT NULL DEFAULT '0.000000',
  `fuel` int(3) DEFAULT '100',
  `engine` int(1) DEFAULT '0',
  `locked` int(1) DEFAULT '0',
  `lights` int(1) DEFAULT '0',
  `sirens` int(1) DEFAULT '0',
  `paintjob` int(11) DEFAULT '0',
  `hp` float DEFAULT '1000',
  `color1` varchar(50) DEFAULT '0',
  `color2` varchar(50) DEFAULT '0',
  `color3` varchar(50) DEFAULT NULL,
  `color4` varchar(50) DEFAULT NULL,
  `plate` text,
  `faction` int(11) DEFAULT '-1',
  `owner` int(11) DEFAULT '-1',
  `job` int(11) DEFAULT '-1',
  `tintedwindows` int(1) DEFAULT '0',
  `dimension` int(5) DEFAULT '0',
  `interior` int(5) DEFAULT '0',
  `currdimension` int(5) DEFAULT '0',
  `currinterior` int(5) DEFAULT '0',
  `enginebroke` int(1) DEFAULT '0',
  `items` text,
  `itemvalues` text,
  `Impounded` int(3) DEFAULT '0',
  `handbrake` int(1) DEFAULT '0',
  `safepositionX` float DEFAULT NULL,
  `safepositionY` float DEFAULT NULL,
  `safepositionZ` float DEFAULT NULL,
  `safepositionRZ` float DEFAULT NULL,
  `upgrades` varchar(150) DEFAULT '[ [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ] ]',
  `wheelStates` varchar(30) DEFAULT '[ [ 0, 0, 0, 0 ] ]',
  `panelStates` varchar(40) DEFAULT '[ [ 0, 0, 0, 0, 0, 0, 0 ] ]',
  `doorStates` varchar(30) DEFAULT '[ [ 0, 0, 0, 0, 0, 0 ] ]',
  `odometer` int(15) DEFAULT '0',
  `headlights` varchar(30) DEFAULT '[ [ 255, 255, 255 ] ]',
  `variant1` int(3) DEFAULT NULL,
  `variant2` int(3) DEFAULT NULL,
  `descriptionadmin` varchar(300) DEFAULT NULL,
  `description1` varchar(300) NOT NULL DEFAULT '',
  `description2` varchar(300) NOT NULL DEFAULT '',
  `description3` varchar(300) NOT NULL DEFAULT '',
  `description4` varchar(300) NOT NULL DEFAULT '',
  `description5` varchar(300) NOT NULL DEFAULT '',
  `suspensionLowerLimit` float DEFAULT NULL,
  `driveType` char(5) DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `deletedDate` datetime DEFAULT NULL,
  `chopped` tinyint(4) NOT NULL DEFAULT '0',
  `stolen` tinyint(4) NOT NULL DEFAULT '0',
  `lastUsed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creationDate` datetime DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `trackingdevice` varchar(255) DEFAULT NULL,
  `registered` int(2) NOT NULL DEFAULT '1',
  `show_plate` int(2) NOT NULL DEFAULT '1',
  `show_vin` int(2) NOT NULL DEFAULT '1',
  `paintjob_url` varchar(255) DEFAULT NULL,
  `vehicle_shop_id` int(11) DEFAULT NULL,
  `bulletproof` tinyint(4) NOT NULL DEFAULT '0',
  `textures` varchar(300) NOT NULL DEFAULT '[ [ ] ]',
  `business` int(11) NOT NULL DEFAULT '-1',
  `protected_until` datetime DEFAULT NULL,
  `tokenUsed` int(1) NOT NULL DEFAULT '0',
  `settings` varchar(500) DEFAULT NULL,
  `hotwired` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vehicles_custom`
--

CREATE TABLE `vehicles_custom` (
  `id` int(11) NOT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `handling` varchar(1000) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `tax` int(11) DEFAULT NULL,
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL DEFAULT '0',
  `updatedate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedby` int(11) NOT NULL DEFAULT '0',
  `notes` text,
  `doortype` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vehicles_shop`
--

CREATE TABLE `vehicles_shop` (
  `id` int(11) NOT NULL,
  `vehmtamodel` int(11) DEFAULT '0',
  `vehbrand` varchar(255) DEFAULT NULL,
  `vehmodel` varchar(500) DEFAULT NULL,
  `vehyear` int(11) DEFAULT '2014',
  `vehprice` int(11) DEFAULT '0',
  `vehtax` int(11) DEFAULT '0',
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL DEFAULT '0',
  `updatedate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedby` int(11) NOT NULL DEFAULT '0',
  `notes` varchar(500) DEFAULT NULL,
  `handling` varchar(1000) DEFAULT NULL,
  `duration` int(11) NOT NULL DEFAULT '1000',
  `enabled` int(1) NOT NULL DEFAULT '0',
  `spawnto` tinyint(2) NOT NULL DEFAULT '0',
  `doortype` tinyint(4) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `spawn_rate` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_auctions`
--

CREATE TABLE `vehicle_auctions` (
  `id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `advertisement_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `starting_bid` int(11) NOT NULL,
  `minimum_increase` int(11) NOT NULL,
  `current_bid` int(11) DEFAULT NULL,
  `current_bidder_id` int(11) DEFAULT NULL COMMENT 'Character ID of current bidder.',
  `buyout` int(11) NOT NULL,
  `expiry` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_by_faction` int(11) DEFAULT NULL COMMENT 'Filled in when the vehicle belongs to a faction.',
  `awaiting_key_pickup` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'When the auction is completed, but the buyer has not picked up the car yet'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_logs`
--

CREATE TABLE `vehicle_logs` (
  `log_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `vehID` int(11) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `actor` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores all admin actions on vehicles - Monitored by Vehicle ';

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_notes`
--

CREATE TABLE `vehicle_notes` (
  `id` int(11) NOT NULL,
  `vehid` int(11) NOT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `note` varchar(500) NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wiretransfers`
--

CREATE TABLE `wiretransfers` (
  `id` int(10) UNSIGNED NOT NULL,
  `from` int(11) DEFAULT '0',
  `to` int(11) DEFAULT '0',
  `amount` int(11) NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` int(11) NOT NULL,
  `from_card` varchar(45) DEFAULT NULL,
  `to_card` varchar(45) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `worlditems`
--

CREATE TABLE `worlditems` (
  `id` int(11) NOT NULL,
  `itemid` int(11) DEFAULT '0',
  `itemvalue` text,
  `x` float DEFAULT '0',
  `y` float DEFAULT '0',
  `z` float DEFAULT '0',
  `dimension` int(5) DEFAULT '0',
  `interior` int(5) DEFAULT '0',
  `creationdate` datetime DEFAULT NULL,
  `rx` float DEFAULT '0',
  `ry` float DEFAULT '0',
  `rz` float DEFAULT '0',
  `creator` int(10) UNSIGNED DEFAULT '0',
  `protected` int(100) NOT NULL DEFAULT '0',
  `perm_use` int(2) NOT NULL DEFAULT '1',
  `perm_move` int(2) NOT NULL DEFAULT '1',
  `perm_pickup` int(2) NOT NULL DEFAULT '1',
  `perm_use_data` text,
  `perm_move_data` text,
  `perm_pickup_data` text,
  `useExactValues` int(1) NOT NULL DEFAULT '0',
  `metadata` text COMMENT 'additional data for the item that can be edited per individual item, JSON'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `worlditems_data`
--

CREATE TABLE `worlditems_data` (
  `id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `key` varchar(100) NOT NULL,
  `value` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_username_5a6e02bd_uniq` (`username`),
  ADD UNIQUE KEY `forumid_UNIQUE` (`forumid`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `account_admin` (`admin`);

--
-- Indexes for table `account_details`
--
ALTER TABLE `account_details`
  ADD PRIMARY KEY (`account_id`);

--
-- Indexes for table `account_loa`
--
ALTER TABLE `account_loa`
  ADD PRIMARY KEY (`loa_id`),
  ADD KEY `account_link_idx` (`account_id`);

--
-- Indexes for table `account_settings`
--
ALTER TABLE `account_settings`
  ADD PRIMARY KEY (`id`,`name`),
  ADD KEY `id_idx` (`id`);

--
-- Indexes for table `adminhistory`
--
ALTER TABLE `adminhistory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adminhistory_user_ea155d8a_uniq` (`user`),
  ADD KEY `adminhistory_user_char_c1d4310b_uniq` (`user_char`);

--
-- Indexes for table `admin_teleports`
--
ALTER TABLE `admin_teleports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `NAMEUNI` (`location_value`(100));

--
-- Indexes for table `advertisements`
--
ALTER TABLE `advertisements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `apb`
--
ALTER TABLE `apb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `applications_questions`
--
ALTER TABLE `applications_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `atms`
--
ALTER TABLE `atms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `atm_cards`
--
ALTER TABLE `atm_cards`
  ADD PRIMARY KEY (`card_id`),
  ADD UNIQUE KEY `card_id_UNIQUE` (`card_id`);

--
-- Indexes for table `bans`
--
ALTER TABLE `bans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `characters_faction`
--
ALTER TABLE `characters_faction`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `character_settings`
--
ALTER TABLE `character_settings`
  ADD PRIMARY KEY (`id`,`name`);

--
-- Indexes for table `clothing`
--
ALTER TABLE `clothing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commands`
--
ALTER TABLE `commands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dancers`
--
ALTER TABLE `dancers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_de54fa62` (`expire_date`);

--
-- Indexes for table `dog_users`
--
ALTER TABLE `dog_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `donators`
--
ALTER TABLE `donators`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `don_purchases`
--
ALTER TABLE `don_purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `duty_allowed`
--
ALTER TABLE `duty_allowed`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `duty_custom`
--
ALTER TABLE `duty_custom`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `duty_locations`
--
ALTER TABLE `duty_locations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `elections`
--
ALTER TABLE `elections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `elections_UNIQUE` (`electionsname`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `elevators`
--
ALTER TABLE `elevators`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emailaccounts`
--
ALTER TABLE `emailaccounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faa_registry`
--
ALTER TABLE `faa_registry`
  ADD PRIMARY KEY (`codeid`);

--
-- Indexes for table `factions`
--
ALTER TABLE `factions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `faction_ranks`
--
ALTER TABLE `faction_ranks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `connected_interior_UNIQUE` (`connected_interior`),
  ADD UNIQUE KEY `avatar_for_account_UNIQUE` (`avatar_for_account`);

--
-- Indexes for table `force_apps`
--
ALTER TABLE `force_apps`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `friends`
--
ALTER TABLE `friends`
  ADD PRIMARY KEY (`account_id`,`friend_account_id`),
  ADD UNIQUE KEY `friends_account_id_friend_account_id_unique` (`account_id`,`friend_account_id`),
  ADD KEY `friends_friend_account_id_accounts_foreign` (`friend_account_id`);

--
-- Indexes for table `fuelpeds`
--
ALTER TABLE `fuelpeds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gates`
--
ALTER TABLE `gates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `google_authenticator`
--
ALTER TABLE `google_authenticator`
  ADD PRIMARY KEY (`secret`),
  ADD UNIQUE KEY `secret_UNIQUE` (`secret`),
  ADD UNIQUE KEY `userid_UNIQUE` (`userid`);

--
-- Indexes for table `insurance_data`
--
ALTER TABLE `insurance_data`
  ADD PRIMARY KEY (`policyid`);

--
-- Indexes for table `insurance_factions`
--
ALTER TABLE `insurance_factions`
  ADD PRIMARY KEY (`factionID`);

--
-- Indexes for table `interiors`
--
ALTER TABLE `interiors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `interior_business`
--
ALTER TABLE `interior_business`
  ADD PRIMARY KEY (`intID`),
  ADD UNIQUE KEY `intID_UNIQUE` (`intID`);

--
-- Indexes for table `interior_logs`
--
ALTER TABLE `interior_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `log_interior` (`intID`);

--
-- Indexes for table `interior_notes`
--
ALTER TABLE `interior_notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `interior_textures`
--
ALTER TABLE `interior_textures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ippc_airlines`
--
ALTER TABLE `ippc_airlines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ippc_airline_pilots`
--
ALTER TABLE `ippc_airline_pilots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ippc_flights`
--
ALTER TABLE `ippc_flights`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`index`);

--
-- Indexes for table `jailed`
--
ALTER TABLE `jailed`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs_trucker_orders`
--
ALTER TABLE `jobs_trucker_orders`
  ADD PRIMARY KEY (`orderID`);

--
-- Indexes for table `leo_impound_lot`
--
ALTER TABLE `leo_impound_lot`
  ADD PRIMARY KEY (`lane`);

--
-- Indexes for table `lifts`
--
ALTER TABLE `lifts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lift_floors`
--
ALTER TABLE `lift_floors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maps`
--
ALTER TABLE `maps`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `maps_objects`
--
ALTER TABLE `maps_objects`
  ADD PRIMARY KEY (`index`),
  ADD UNIQUE KEY `index_UNIQUE` (`index`);

--
-- Indexes for table `mdc_apb`
--
ALTER TABLE `mdc_apb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdc_calls`
--
ALTER TABLE `mdc_calls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdc_crimes`
--
ALTER TABLE `mdc_crimes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdc_criminals`
--
ALTER TABLE `mdc_criminals`
  ADD UNIQUE KEY `name` (`character`),
  ADD KEY `phone` (`phone`);

--
-- Indexes for table `mdc_dmv`
--
ALTER TABLE `mdc_dmv`
  ADD UNIQUE KEY `entryid` (`id`);

--
-- Indexes for table `mdc_faa_events`
--
ALTER TABLE `mdc_faa_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdc_faa_licenses`
--
ALTER TABLE `mdc_faa_licenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdc_groups`
--
ALTER TABLE `mdc_groups`
  ADD PRIMARY KEY (`faction_id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`),
  ADD UNIQUE KEY `faction_id_UNIQUE` (`faction_id`),
  ADD KEY `idx_idx` (`faction_id`);

--
-- Indexes for table `mdc_impounds`
--
ALTER TABLE `mdc_impounds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdc_users`
--
ALTER TABLE `mdc_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdc_users_old`
--
ALTER TABLE `mdc_users_old`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQUE` (`resource`,`migration`);

--
-- Indexes for table `mobile_payments`
--
ALTER TABLE `mobile_payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD UNIQUE KEY `payment_id_UNIQUE` (`payment_id`);

--
-- Indexes for table `motds`
--
ALTER TABLE `motds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `motd_read`
--
ALTER TABLE `motd_read`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notification_user` (`userid`);

--
-- Indexes for table `objects`
--
ALTER TABLE `objects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `online_sessions`
--
ALTER TABLE `online_sessions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `paynspray`
--
ALTER TABLE `paynspray`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paypal_ipn`
--
ALTER TABLE `paypal_ipn`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paypal_ipn_8e113603` (`txn_id`);

--
-- Indexes for table `pd_tickets`
--
ALTER TABLE `pd_tickets`
  ADD PRIMARY KEY (`id`,`time`);

--
-- Indexes for table `peds`
--
ALTER TABLE `peds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phones`
--
ALTER TABLE `phones`
  ADD PRIMARY KEY (`phonenumber`),
  ADD UNIQUE KEY `phonenumber_UNIQUE` (`phonenumber`);

--
-- Indexes for table `phone_contacts`
--
ALTER TABLE `phone_contacts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `phone_history`
--
ALTER TABLE `phone_history`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ID_UNIQUE` (`id`);

--
-- Indexes for table `phone_sms`
--
ALTER TABLE `phone_sms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ID_UNIQUE` (`id`);

--
-- Indexes for table `pilot_notams`
--
ALTER TABLE `pilot_notams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `publicphones`
--
ALTER TABLE `publicphones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`order_id`),
  ADD UNIQUE KEY `txn_id` (`txn_id`);

--
-- Indexes for table `radio_stations`
--
ALTER TABLE `radio_stations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `ramps`
--
ALTER TABLE `ramps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `restricted_freqs`
--
ALTER TABLE `restricted_freqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sapt_destinations`
--
ALTER TABLE `sapt_destinations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sapt_locations`
--
ALTER TABLE `sapt_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sapt_routes`
--
ALTER TABLE `sapt_routes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `serial_whitelist`
--
ALTER TABLE `serial_whitelist`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `serial_whitelist_userid_4b8e2882_uniq` (`userid`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sfia_pilots`
--
ALTER TABLE `sfia_pilots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_contacts_info`
--
ALTER TABLE `shop_contacts_info`
  ADD PRIMARY KEY (`npcID`);

--
-- Indexes for table `shop_products`
--
ALTER TABLE `shop_products`
  ADD PRIMARY KEY (`pID`),
  ADD UNIQUE KEY `pID_UNIQUE` (`pID`);

--
-- Indexes for table `speedcams`
--
ALTER TABLE `speedcams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `speedingviolations`
--
ALTER TABLE `speedingviolations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_changelogs`
--
ALTER TABLE `staff_changelogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tc_comments`
--
ALTER TABLE `tc_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tcid_idx` (`tcid`),
  ADD KEY `comment_poster` (`poster`);

--
-- Indexes for table `tc_subscribers`
--
ALTER TABLE `tc_subscribers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscriber_ticket` (`ticket_id`),
  ADD KEY `subscriber_account` (`user_id`);

--
-- Indexes for table `tc_tickets`
--
ALTER TABLE `tc_tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_creator` (`creator`),
  ADD KEY `ticket_assignee` (`assign_to`),
  ADD KEY `ticket_status` (`status`);

--
-- Indexes for table `tempinteriors`
--
ALTER TABLE `tempinteriors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tempobjects`
--
ALTER TABLE `tempobjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dimension` (`dimension`);

--
-- Indexes for table `textures_animated`
--
ALTER TABLE `textures_animated`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `towstats`
--
ALTER TABLE `towstats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `character_idx` (`character`),
  ADD KEY `vehicle_idx` (`vehicle`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicles_custom`
--
ALTER TABLE `vehicles_custom`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `vehicles_shop`
--
ALTER TABLE `vehicles_shop`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `vehicle_auctions`
--
ALTER TABLE `vehicle_auctions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vehicle_auctions_advertisement_id_index` (`advertisement_id`),
  ADD KEY `vehicle_auctions_expiry_awaiting_key_pickup_index` (`expiry`,`awaiting_key_pickup`);

--
-- Indexes for table `vehicle_logs`
--
ALTER TABLE `vehicle_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `log_vehicle` (`vehID`);

--
-- Indexes for table `vehicle_notes`
--
ALTER TABLE `vehicle_notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wiretransfers`
--
ALTER TABLE `wiretransfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `worlditems`
--
ALTER TABLE `worlditems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `worlditems_data`
--
ALTER TABLE `worlditems_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `xitem_idx` (`item`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `account_details`
--
ALTER TABLE `account_details`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `account_loa`
--
ALTER TABLE `account_loa`
  MODIFY `loa_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adminhistory`
--
ALTER TABLE `adminhistory`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_teleports`
--
ALTER TABLE `admin_teleports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `advertisements`
--
ALTER TABLE `advertisements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `apb`
--
ALTER TABLE `apb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `applications_questions`
--
ALTER TABLE `applications_questions`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `atms`
--
ALTER TABLE `atms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `atm_cards`
--
ALTER TABLE `atm_cards`
  MODIFY `card_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bans`
--
ALTER TABLE `bans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `characters`
--
ALTER TABLE `characters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `characters_faction`
--
ALTER TABLE `characters_faction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clothing`
--
ALTER TABLE `clothing`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `commands`
--
ALTER TABLE `commands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dancers`
--
ALTER TABLE `dancers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dog_users`
--
ALTER TABLE `dog_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `donators`
--
ALTER TABLE `donators`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `don_purchases`
--
ALTER TABLE `don_purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `duty_allowed`
--
ALTER TABLE `duty_allowed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `duty_custom`
--
ALTER TABLE `duty_custom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `duty_locations`
--
ALTER TABLE `duty_locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `elections`
--
ALTER TABLE `elections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `elevators`
--
ALTER TABLE `elevators`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emailaccounts`
--
ALTER TABLE `emailaccounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `factions`
--
ALTER TABLE `factions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faction_ranks`
--
ALTER TABLE `faction_ranks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `force_apps`
--
ALTER TABLE `force_apps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fuelpeds`
--
ALTER TABLE `fuelpeds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gates`
--
ALTER TABLE `gates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `insurance_data`
--
ALTER TABLE `insurance_data`
  MODIFY `policyid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `interiors`
--
ALTER TABLE `interiors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `interior_logs`
--
ALTER TABLE `interior_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `interior_notes`
--
ALTER TABLE `interior_notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `interior_textures`
--
ALTER TABLE `interior_textures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ippc_airlines`
--
ALTER TABLE `ippc_airlines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ippc_airline_pilots`
--
ALTER TABLE `ippc_airline_pilots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ippc_flights`
--
ALTER TABLE `ippc_flights`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `index` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `jailed`
--
ALTER TABLE `jailed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs_trucker_orders`
--
ALTER TABLE `jobs_trucker_orders`
  MODIFY `orderID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leo_impound_lot`
--
ALTER TABLE `leo_impound_lot`
  MODIFY `lane` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lifts`
--
ALTER TABLE `lifts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lift_floors`
--
ALTER TABLE `lift_floors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `maps`
--
ALTER TABLE `maps`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `maps_objects`
--
ALTER TABLE `maps_objects`
  MODIFY `index` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdc_apb`
--
ALTER TABLE `mdc_apb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdc_calls`
--
ALTER TABLE `mdc_calls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdc_crimes`
--
ALTER TABLE `mdc_crimes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdc_dmv`
--
ALTER TABLE `mdc_dmv`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdc_faa_events`
--
ALTER TABLE `mdc_faa_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdc_faa_licenses`
--
ALTER TABLE `mdc_faa_licenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdc_groups`
--
ALTER TABLE `mdc_groups`
  MODIFY `faction_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdc_impounds`
--
ALTER TABLE `mdc_impounds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdc_users`
--
ALTER TABLE `mdc_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdc_users_old`
--
ALTER TABLE `mdc_users_old`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `mobile_payments`
--
ALTER TABLE `mobile_payments`
  MODIFY `payment_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `motds`
--
ALTER TABLE `motds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `motd_read`
--
ALTER TABLE `motd_read`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `objects`
--
ALTER TABLE `objects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `online_sessions`
--
ALTER TABLE `online_sessions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `paynspray`
--
ALTER TABLE `paynspray`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `paypal_ipn`
--
ALTER TABLE `paypal_ipn`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pd_tickets`
--
ALTER TABLE `pd_tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `peds`
--
ALTER TABLE `peds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_contacts`
--
ALTER TABLE `phone_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_history`
--
ALTER TABLE `phone_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_sms`
--
ALTER TABLE `phone_sms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `publicphones`
--
ALTER TABLE `publicphones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `radio_stations`
--
ALTER TABLE `radio_stations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ramps`
--
ALTER TABLE `ramps`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restricted_freqs`
--
ALTER TABLE `restricted_freqs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sapt_destinations`
--
ALTER TABLE `sapt_destinations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sapt_locations`
--
ALTER TABLE `sapt_locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sapt_routes`
--
ALTER TABLE `sapt_routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `serial_whitelist`
--
ALTER TABLE `serial_whitelist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `sfia_pilots`
--
ALTER TABLE `sfia_pilots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shop_products`
--
ALTER TABLE `shop_products`
  MODIFY `pID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `speedcams`
--
ALTER TABLE `speedcams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `speedingviolations`
--
ALTER TABLE `speedingviolations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_changelogs`
--
ALTER TABLE `staff_changelogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tc_comments`
--
ALTER TABLE `tc_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tc_subscribers`
--
ALTER TABLE `tc_subscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tc_tickets`
--
ALTER TABLE `tc_tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tempobjects`
--
ALTER TABLE `tempobjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `textures_animated`
--
ALTER TABLE `textures_animated`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `towstats`
--
ALTER TABLE `towstats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicles_custom`
--
ALTER TABLE `vehicles_custom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicles_shop`
--
ALTER TABLE `vehicles_shop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicle_auctions`
--
ALTER TABLE `vehicle_auctions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicle_logs`
--
ALTER TABLE `vehicle_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicle_notes`
--
ALTER TABLE `vehicle_notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wiretransfers`
--
ALTER TABLE `wiretransfers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `worlditems`
--
ALTER TABLE `worlditems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `worlditems_data`
--
ALTER TABLE `worlditems_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;


--Elevator fix
INSERT INTO mta.elevators (id)
	VALUES (1);


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
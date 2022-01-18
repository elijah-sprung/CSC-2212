-- MySQL dump 10.19  Distrib 10.3.31-MariaDB, for debian-linux-gnueabihf (armv8l)
--
-- Host: localhost    Database: Final_Project
-- ------------------------------------------------------
-- Server version	10.3.31-MariaDB-0+deb10u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ANOMALY`
--

DROP TABLE IF EXISTS `ANOMALY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANOMALY` (
  `ANOMALY_ID` int(11) NOT NULL,
  `ANOMALY_NAME` varchar(75) NOT NULL,
  `ANOMALY_DESCRIPT` varchar(300) DEFAULT NULL,
  `ANOMALY_CHARACTER` int(11) DEFAULT NULL,
  `ANOMALY_CONTAIN` varchar(30) NOT NULL,
  `ANOMALY_RISK` varchar(30) DEFAULT NULL,
  `ANOMALY_DISRUPTION` varchar(30) DEFAULT NULL,
  `ANOMALY_CREATE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ANOMALY_ID`),
  KEY `ANOMALY_ibfk_1` (`ANOMALY_CHARACTER`),
  KEY `ANOMALY_ibfk_2` (`ANOMALY_CONTAIN`),
  KEY `ANOMALY_ibfk_3` (`ANOMALY_RISK`),
  KEY `ANOMALY_ibfk_4` (`ANOMALY_DISRUPTION`),
  KEY `ANOMALY_ibfk_6` (`ANOMALY_CREATE_ID`),
  CONSTRAINT `ANOMALY_ibfk_1` FOREIGN KEY (`ANOMALY_CHARACTER`) REFERENCES `KNOWN_CHARACTERS` (`CHARACTER_ID`),
  CONSTRAINT `ANOMALY_ibfk_2` FOREIGN KEY (`ANOMALY_CONTAIN`) REFERENCES `CONTAIN` (`CONTAIN_CLASS`),
  CONSTRAINT `ANOMALY_ibfk_3` FOREIGN KEY (`ANOMALY_RISK`) REFERENCES `RISK` (`RISK_CLASS`),
  CONSTRAINT `ANOMALY_ibfk_4` FOREIGN KEY (`ANOMALY_DISRUPTION`) REFERENCES `DISRUPTION` (`DISRUPTION_CLASS`),
  CONSTRAINT `ANOMALY_ibfk_6` FOREIGN KEY (`ANOMALY_CREATE_ID`) REFERENCES `ANOMALY` (`ANOMALY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ANOMALY`
--

LOCK TABLES `ANOMALY` WRITE;
/*!40000 ALTER TABLE `ANOMALY` DISABLE KEYS */;
INSERT INTO `ANOMALY` VALUES (1,'Builder Bear','A small teddy bear, approximately 33 cm in height.',NULL,'Keter',NULL,NULL,2),(2,'1048-A','Similar to Builder Bear but made entirely of human ears.',NULL,'Keter',NULL,NULL,NULL),(3,'Sammy the Superfluous Serpent, by Sr. Supertainment','A non-venomous snake of an unidentified species. It is 1.1 meters in length.',NULL,'Safe','Notice','VLAM',NULL),(4,'Ruby Amulet','An ornate amulet approximately 15 centimeters in circumference made from white gold.',1,'Euclid',NULL,NULL,NULL),(5,'Paired Brass Guard Cats','Several paired sets of brass statues depicting stylized felines.',NULL,'Safe',NULL,NULL,5),(6,'The Pattern Screamer','A static void located within a 1km perimeter near \nUsinsk, Russia established by Soviet scientists in the early 1970s.',NULL,'Esoteric','Critical','Ekhi',NULL),(7,'The Hateful Star','An anomalous, memetic, cosmological phenomenon with adverse effects on human cognition',NULL,'Keter','Critical','Ekhi',NULL),(8,'Hereafter','A temporal anomaly existing within the Sankuru Nature Preserve in the Democratic Republic of Congo',NULL,'Euclid','Caution','Vlam',NULL),(9,'The Perpetual Circle','A sphere made of an unknown stone, flecked with blue, of approximately 3cm in height.',NULL,'Safe',NULL,NULL,NULL),(10,'Cat People','A door which, if uncovered, will produce an individual (labelled as \nan SCP-2213-1 instance) at intervals approximately two minutes apart.',NULL,'Euclid',NULL,NULL,11),(11,'2213-1','Creatures superficially similar to humans',NULL,'Euclid',NULL,NULL,NULL),(12,'Flute','A flute made from bone.',NULL,'Euclid',NULL,NULL,NULL),(13,'Old Greatcoat','A light brown, European military-style greatcoat from a period between the late 1500s to the early 1900s.',NULL,'Euclid',NULL,NULL,NULL),(14,'Fleshy Growth','A tumorous, fleshy growth with a volume of roughly 60 m³ (or 2000 ft³).',NULL,'Euclid',NULL,NULL,NULL),(15,'Major Alexei Belitrov, of the Red Army','A humanoid entity believed to be of extra-universal origin.',5,'Euclid',NULL,NULL,NULL);
/*!40000 ALTER TABLE `ANOMALY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ANOMALY_HIST`
--

DROP TABLE IF EXISTS `ANOMALY_HIST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANOMALY_HIST` (
  `ANOMALY_ID` int(11) NOT NULL,
  `ANOMALY_NAME` varchar(30) DEFAULT NULL,
  `ANOMALY_DESCRIPT` varchar(300) DEFAULT NULL,
  `ANOMALY_CHARACTER` int(11) DEFAULT NULL,
  `ANOMALY_CONTAIN` varchar(30) NOT NULL,
  `ANOMALY_RISK` varchar(30) DEFAULT NULL,
  `ANOMALY_DISRUPTION` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ANOMALY_ID`),
  CONSTRAINT `ANOMALY_HIST_ibfk_1` FOREIGN KEY (`ANOMALY_ID`) REFERENCES `ANOMALY` (`ANOMALY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ANOMALY_HIST`
--

LOCK TABLES `ANOMALY_HIST` WRITE;
/*!40000 ALTER TABLE `ANOMALY_HIST` DISABLE KEYS */;
INSERT INTO `ANOMALY_HIST` VALUES (1,'Builder Bear','A small teddy bear, approximately 33 cm in height.',NULL,'Safe',NULL,NULL),(12,'Flute','A flute made from bone.',NULL,'Safe',NULL,NULL);
/*!40000 ALTER TABLE `ANOMALY_HIST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ANOMALY_IN_SCP`
--

DROP TABLE IF EXISTS `ANOMALY_IN_SCP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANOMALY_IN_SCP` (
  `SCP_DESIGNATION` varchar(8) NOT NULL,
  `ANOMALY_ID` int(11) NOT NULL,
  PRIMARY KEY (`SCP_DESIGNATION`,`ANOMALY_ID`),
  KEY `ANOMALY_IN_SCP_ibfk_2` (`ANOMALY_ID`),
  CONSTRAINT `ANOMALY_IN_SCP_ibfk_1` FOREIGN KEY (`SCP_DESIGNATION`) REFERENCES `SCP` (`SCP_DESIGNATION`),
  CONSTRAINT `ANOMALY_IN_SCP_ibfk_2` FOREIGN KEY (`ANOMALY_ID`) REFERENCES `ANOMALY` (`ANOMALY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ANOMALY_IN_SCP`
--

LOCK TABLES `ANOMALY_IN_SCP` WRITE;
/*!40000 ALTER TABLE `ANOMALY_IN_SCP` DISABLE KEYS */;
INSERT INTO `ANOMALY_IN_SCP` VALUES ('1048',1),('1048',2),('2',14),('2213',10),('262',13),('3930',6),('4225',3),('4548',7),('4935',8),('531',5),('573',12),('627',9),('963',4);
/*!40000 ALTER TABLE `ANOMALY_IN_SCP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ARTICLE`
--

DROP TABLE IF EXISTS `ARTICLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ARTICLE` (
  `ARTICLE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ARTICLE_TITLE` varchar(100) NOT NULL,
  `ARTICLE_TYPE` varchar(20) NOT NULL,
  `AUTHOR_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ARTICLE_ID`),
  KEY `ARTICLE_ibfk_1` (`AUTHOR_ID`),
  CONSTRAINT `ARTICLE_ibfk_1` FOREIGN KEY (`AUTHOR_ID`) REFERENCES `AUTHOR` (`AUTHOR_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ARTICLE`
--

LOCK TABLES `ARTICLE` WRITE;
/*!40000 ALTER TABLE `ARTICLE` DISABLE KEYS */;
INSERT INTO `ARTICLE` VALUES (1,'SCP-1048','SCP',1),(2,'SCP-4225','SCP',NULL),(3,'SCP-963','SCP',NULL),(4,'About the SCP Foundation','Guide',2),(5,'Groups of Interest','Guide',4),(6,'SCP-531','SCP',3),(7,'Denouement and Epilogue','Tale',6),(8,'Digital Children','Tale',7),(9,'I Finally Landed, But This Place Is Not Home','Tale',8),(10,'Lost','Tale',9),(11,'SCP-3930','SCP',10),(12,'SCP-4548','SCP',10),(13,'SCP-4935','SCP',10),(14,'Audio of War','Tale',11),(15,'The Body and Blood','Tale',12),(16,'SCP-627','SCP',1),(17,'SCP-2213','SCP',13),(18,'SCP-573','SCP',1),(19,'SCP-262','SCP',2),(20,'SCP-2273','SCP',14),(21,'SCP-002','SCP',2),(22,'Diary of a Young Girl','Tale',15),(23,'The Executions of Doctor Bright','Tale',16),(24,'Stories of a World After Death','Tale',17),(25,'The Midnight Curve','Tale',17);
/*!40000 ALTER TABLE `ARTICLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHOR`
--

DROP TABLE IF EXISTS `AUTHOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTHOR` (
  `AUTHOR_ID` int(11) NOT NULL AUTO_INCREMENT,
  `AUTHOR_NAME` varchar(50) NOT NULL,
  PRIMARY KEY (`AUTHOR_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHOR`
--

LOCK TABLES `AUTHOR` WRITE;
/*!40000 ALTER TABLE `AUTHOR` DISABLE KEYS */;
INSERT INTO `AUTHOR` VALUES (1,'AdminBright'),(2,'The Administrator'),(3,'BeeDee'),(4,'Sirens'),(5,'DrClef'),(6,'Eskobar'),(7,'DesperadoZod'),(8,'Azmoeth Jikandia'),(9,'Dr Moned'),(10,'djkaktus'),(11,'TroyL'),(12,'Trotskyeet'),(13,'Dr. Cimmerian'),(14,'Agent MacLeod'),(15,'RJB_R'),(16,'DrEverettMann'),(17,'Tufto');
/*!40000 ALTER TABLE `AUTHOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CHARACTER_HIST`
--

DROP TABLE IF EXISTS `CHARACTER_HIST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CHARACTER_HIST` (
  `CHARACTER_ID` int(11) NOT NULL,
  `CHARACTER_NAME` varchar(50) NOT NULL,
  `CHARACTER_ANOMALY` int(11) DEFAULT NULL,
  `CHARACTER_LIFE_STATUS` varchar(45) DEFAULT NULL,
  `CHARACTER_GOI_AFFILITATION` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CHARACTER_ID`),
  CONSTRAINT `CHARACTER_HIST_ibfk_1` FOREIGN KEY (`CHARACTER_ID`) REFERENCES `KNOWN_CHARACTERS` (`CHARACTER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CHARACTER_HIST`
--

LOCK TABLES `CHARACTER_HIST` WRITE;
/*!40000 ALTER TABLE `CHARACTER_HIST` DISABLE KEYS */;
INSERT INTO `CHARACTER_HIST` VALUES (2,'Ukulele Man',NULL,'Alive','Global Occult Coalition');
/*!40000 ALTER TABLE `CHARACTER_HIST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CHAR_IN_GOI`
--

DROP TABLE IF EXISTS `CHAR_IN_GOI`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CHAR_IN_GOI` (
  `CHARACTER_ID` int(11) NOT NULL,
  `GOI_NUM` int(11) NOT NULL,
  PRIMARY KEY (`CHARACTER_ID`,`GOI_NUM`),
  KEY `CHAR_IN_GOI_ibfk_2` (`GOI_NUM`),
  CONSTRAINT `CHAR_IN_GOI_ibfk_1` FOREIGN KEY (`CHARACTER_ID`) REFERENCES `KNOWN_CHARACTERS` (`CHARACTER_ID`),
  CONSTRAINT `CHAR_IN_GOI_ibfk_2` FOREIGN KEY (`GOI_NUM`) REFERENCES `GOI` (`GOI_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CHAR_IN_GOI`
--

LOCK TABLES `CHAR_IN_GOI` WRITE;
/*!40000 ALTER TABLE `CHAR_IN_GOI` DISABLE KEYS */;
INSERT INTO `CHAR_IN_GOI` VALUES (2,1);
/*!40000 ALTER TABLE `CHAR_IN_GOI` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CONTAIN`
--

DROP TABLE IF EXISTS `CONTAIN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CONTAIN` (
  `CONTAIN_CLASS` varchar(30) NOT NULL,
  `CONTAIN_DESCRIPT` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`CONTAIN_CLASS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CONTAIN`
--

LOCK TABLES `CONTAIN` WRITE;
/*!40000 ALTER TABLE `CONTAIN` DISABLE KEYS */;
INSERT INTO `CONTAIN` VALUES ('Apollyon','Anomalies that cannot be contained, are expected to breach containment imminently, or some other similar scenario.'),('Archon','Anomalies that could theoretically be contained but are best left uncontained for some reason.'),('Esoteric','Anomalies that do not fall into any other containment class.'),('Euclid','Anomalies that require more resources to contain completely or where containment isn\'t always reliable.'),('Keter','Anomalies that are exceedingly difficult to contain consistently or reliably, with containment procedures often being extensive and complex.'),('Neutralized','Anomalies that are no longer anomalous, either through having been intentionally or accidentally destroyed, or disabled.'),('Safe','Anomalies that are easily and safely contained.'),('Thaumiel','Anomalies that the Foundation specifically uses to contain other SCPs.');
/*!40000 ALTER TABLE `CONTAIN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DISRUPTION`
--

DROP TABLE IF EXISTS `DISRUPTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DISRUPTION` (
  `DISRUPTION_CLASS` varchar(30) NOT NULL,
  `DISRUPTION_DESCRIPT` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`DISRUPTION_CLASS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DISRUPTION`
--

LOCK TABLES `DISRUPTION` WRITE;
/*!40000 ALTER TABLE `DISRUPTION` DISABLE KEYS */;
INSERT INTO `DISRUPTION` VALUES ('Amida','The entire known world and possibly the entire universe.'),('Dark','So low as not to be a concern.'),('Ekhi','Roughly the size of a large metropolitan area to an entire country.'),('Keneq','Roughly defined as a city.'),('Vlam','Localized to a small handful of people.');
/*!40000 ALTER TABLE `DISRUPTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GOI`
--

DROP TABLE IF EXISTS `GOI`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GOI` (
  `GOI_NUM` int(11) NOT NULL AUTO_INCREMENT,
  `GOI_NAME` varchar(100) NOT NULL,
  PRIMARY KEY (`GOI_NUM`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GOI`
--

LOCK TABLES `GOI` WRITE;
/*!40000 ALTER TABLE `GOI` DISABLE KEYS */;
INSERT INTO `GOI` VALUES (1,'Global Occult Coalition'),(2,'The Chaos Insurgency'),(3,'The Three Moons Initiative'),(4,'The Serpent\'s Hand'),(5,'The Horizon Initiative'),(6,'The Church of the Broken God'),(7,'Arcadia'),(8,'Are We Cool Yet?');
/*!40000 ALTER TABLE `GOI` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GUIDE`
--

DROP TABLE IF EXISTS `GUIDE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GUIDE` (
  `GUIDE_TYPE` varchar(30) DEFAULT NULL,
  `ARTICLE_ID` int(11) DEFAULT NULL,
  `GUIDE_ID` int(11) NOT NULL,
  PRIMARY KEY (`GUIDE_ID`),
  KEY `GUIDE_ibfk_1` (`ARTICLE_ID`),
  CONSTRAINT `GUIDE_ibfk_1` FOREIGN KEY (`ARTICLE_ID`) REFERENCES `ARTICLE` (`ARTICLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GUIDE`
--

LOCK TABLES `GUIDE` WRITE;
/*!40000 ALTER TABLE `GUIDE` DISABLE KEYS */;
INSERT INTO `GUIDE` VALUES ('Writing Guides',4,1),('Writing Guides',5,2);
/*!40000 ALTER TABLE `GUIDE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KNOWN_CHARACTERS`
--

DROP TABLE IF EXISTS `KNOWN_CHARACTERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KNOWN_CHARACTERS` (
  `CHARACTER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CHARACTER_NAME` varchar(50) NOT NULL,
  `CHARACTER_ANOMALY` int(11) DEFAULT NULL,
  `CHARACTER_AUTHOR` int(11) NOT NULL,
  `CHARACTER_LIFE_STATUS` varchar(45) DEFAULT NULL,
  `CHARACTER_GOI_AFFILIATION` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CHARACTER_ID`),
  KEY `KNOWN_CHARACTERS_ibfk_1` (`CHARACTER_AUTHOR`),
  CONSTRAINT `KNOWN_CHARACTERS_ibfk_1` FOREIGN KEY (`CHARACTER_AUTHOR`) REFERENCES `AUTHOR` (`AUTHOR_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KNOWN_CHARACTERS`
--

LOCK TABLES `KNOWN_CHARACTERS` WRITE;
/*!40000 ALTER TABLE `KNOWN_CHARACTERS` DISABLE KEYS */;
INSERT INTO `KNOWN_CHARACTERS` VALUES (1,'Dr. Bright',4,1,'Immortal',NULL),(2,'Dr. Clef',NULL,5,NULL,NULL),(3,'Giovanni Sorrento',NULL,4,'Alive','2'),(4,'General Janet Spiegel',NULL,10,'Alive','3'),(5,'Major Alexei Belitrov, of the Red Army',15,14,'Alive',NULL);
/*!40000 ALTER TABLE `KNOWN_CHARACTERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RISK`
--

DROP TABLE IF EXISTS `RISK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RISK` (
  `RISK_CLASS` varchar(30) NOT NULL,
  `RISK_DESCRIPT` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`RISK_CLASS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RISK`
--

LOCK TABLES `RISK` WRITE;
/*!40000 ALTER TABLE `RISK` DISABLE KEYS */;
INSERT INTO `RISK` VALUES ('Caution','Mild to moderate.'),('Critical','Near instant and/or extremely severe.'),('Danger','Significant to extreme.'),('Notice','Nearly non-existant to mild.'),('Warning','Moderate to significant.');
/*!40000 ALTER TABLE `RISK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCP`
--

DROP TABLE IF EXISTS `SCP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SCP` (
  `SCP_DESIGNATION` varchar(8) NOT NULL,
  `SCP_SERIES` int(11) NOT NULL,
  `ARTICLE_ID` int(11) NOT NULL,
  PRIMARY KEY (`SCP_DESIGNATION`),
  KEY `SCP_ibfk_1` (`ARTICLE_ID`),
  CONSTRAINT `SCP_ibfk_1` FOREIGN KEY (`ARTICLE_ID`) REFERENCES `ARTICLE` (`ARTICLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCP`
--

LOCK TABLES `SCP` WRITE;
/*!40000 ALTER TABLE `SCP` DISABLE KEYS */;
INSERT INTO `SCP` VALUES ('1048',2,1),('2',1,21),('2213',3,17),('2273',3,14),('262',1,19),('3930',4,11),('4225',5,2),('4548',5,12),('4935',5,13),('531',1,6),('573',1,18),('627',1,16),('963',1,3);
/*!40000 ALTER TABLE `SCP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SITE`
--

DROP TABLE IF EXISTS `SITE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SITE` (
  `SITE_ID` int(11) NOT NULL,
  `SITE_LOCATION` varchar(30) DEFAULT NULL,
  `ANOMALY_ID` int(11) NOT NULL,
  PRIMARY KEY (`SITE_ID`,`ANOMALY_ID`),
  KEY `ANOMALY_ID` (`ANOMALY_ID`),
  CONSTRAINT `SITE_ibfk_1` FOREIGN KEY (`ANOMALY_ID`) REFERENCES `ANOMALY` (`ANOMALY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SITE`
--

LOCK TABLES `SITE` WRITE;
/*!40000 ALTER TABLE `SITE` DISABLE KEYS */;
INSERT INTO `SITE` VALUES (15,'Black Rock Desert, Nevada',6),(17,'Neath Port Talbot, Whales',8),(24,'n/a',1),(24,'n/a',2),(42,'n/a',6),(66,'n/a',3);
/*!40000 ALTER TABLE `SITE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SITES_IN_TALES`
--

DROP TABLE IF EXISTS `SITES_IN_TALES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SITES_IN_TALES` (
  `SITE_ID` int(11) NOT NULL,
  `TALE_ID` int(11) NOT NULL,
  PRIMARY KEY (`SITE_ID`,`TALE_ID`),
  KEY `SITES_IN_TALES_ibfk_2` (`TALE_ID`),
  CONSTRAINT `SITES_IN_TALES_ibfk_1` FOREIGN KEY (`SITE_ID`) REFERENCES `SITE` (`SITE_ID`),
  CONSTRAINT `SITES_IN_TALES_ibfk_2` FOREIGN KEY (`TALE_ID`) REFERENCES `TALE` (`TALE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SITES_IN_TALES`
--

LOCK TABLES `SITES_IN_TALES` WRITE;
/*!40000 ALTER TABLE `SITES_IN_TALES` DISABLE KEYS */;
INSERT INTO `SITES_IN_TALES` VALUES (15,1),(17,3),(24,1),(42,2),(66,1);
/*!40000 ALTER TABLE `SITES_IN_TALES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TALE`
--

DROP TABLE IF EXISTS `TALE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TALE` (
  `CANON_ID` int(11) DEFAULT NULL,
  `CANON_TITLE` varchar(30) DEFAULT NULL,
  `TALE_GENRE` varchar(30) DEFAULT NULL,
  `TALE_ID` int(11) NOT NULL,
  `ARTICLE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`TALE_ID`),
  KEY `TALE_ibfk_1` (`ARTICLE_ID`),
  CONSTRAINT `TALE_ibfk_1` FOREIGN KEY (`ARTICLE_ID`) REFERENCES `ARTICLE` (`ARTICLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TALE`
--

LOCK TABLES `TALE` WRITE;
/*!40000 ALTER TABLE `TALE` DISABLE KEYS */;
INSERT INTO `TALE` VALUES (1,'Bellerverse','Fiction',1,7),(1,'Bellerverse','Fiction',2,8),(1,'Bellerverse','Fiction',3,9),(1,'Bellerverse','Fiction',4,10),(2,'The Coldest War','Fiction',5,14),(3,'Doctors of the Church Hub','Fiction',6,15),(4,NULL,'Fiction',7,22),(5,NULL,'Horror',8,23),(6,'End of Death Hub','Fiction',9,25);
/*!40000 ALTER TABLE `TALE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `three_or_more_anomalies`
--

DROP TABLE IF EXISTS `three_or_more_anomalies`;
/*!50001 DROP VIEW IF EXISTS `three_or_more_anomalies`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `three_or_more_anomalies` (
  `Anomaly Containment Levels with 3 or more Anomalies in level` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `top_three_authors`
--

DROP TABLE IF EXISTS `top_three_authors`;
/*!50001 DROP VIEW IF EXISTS `top_three_authors`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `top_three_authors` (
  `AUTHOR_NAME` tinyint NOT NULL,
  `Number of Articles` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `three_or_more_anomalies`
--

/*!50001 DROP TABLE IF EXISTS `three_or_more_anomalies`*/;
/*!50001 DROP VIEW IF EXISTS `three_or_more_anomalies`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
CREATE VIEW three_or_more_anomalies AS
    SELECT 
        a.ANOMALY_CONTAIN AS 'Anomaly Containment Levels with 3 or more Anomalies in level'
    FROM
        ANOMALY a
            JOIN
        ANOMALY_IN_SCP ai ON a.ANOMALY_ID = ai.ANOMALY_ID
            JOIN
        SCP s ON ai.SCP_DESIGNATION = s.SCP_DESIGNATION
    GROUP BY a.ANOMALY_CONTAIN
    HAVING COUNT(a.ANOMALY_CONTAIN) > 2
    ORDER BY a.ANOMALY_CONTAIN;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `top_three_authors`
--

/*!50001 DROP TABLE IF EXISTS `top_three_authors`*/;
/*!50001 DROP VIEW IF EXISTS `top_three_authors`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
CREATE VIEW top_three_authors AS
    SELECT 
        *
    FROM
        (SELECT 
            AUTHOR.AUTHOR_NAME,
                COUNT(ARTICLE_ID) AS 'Number of Articles'
        FROM
            AUTHOR
        JOIN ARTICLE ON ARTICLE.AUTHOR_ID = AUTHOR.AUTHOR_ID
        GROUP BY AUTHOR_NAME
        ORDER BY `Number of Articles` DESC
        LIMIT 3) tmp;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-10  0:02:51
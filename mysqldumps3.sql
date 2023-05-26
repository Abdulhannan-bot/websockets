-- MySQL dump 10.13  Distrib 8.0.32, for macos10.15 (x86_64)
--
-- Host: localhost    Database: websockets
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add message',7,'add_message'),(26,'Can change message',7,'change_message'),(27,'Can delete message',7,'delete_message'),(28,'Can view message',7,'view_message'),(29,'Can add contact',8,'add_contact'),(30,'Can change contact',8,'change_contact'),(31,'Can delete contact',8,'delete_contact'),(32,'Can view contact',8,'view_contact'),(33,'Can add Token',9,'add_token'),(34,'Can change Token',9,'change_token'),(35,'Can delete Token',9,'delete_token'),(36,'Can view Token',9,'view_token'),(37,'Can add token',10,'add_tokenproxy'),(38,'Can change token',10,'change_tokenproxy'),(39,'Can delete token',10,'delete_tokenproxy'),(40,'Can view token',10,'view_tokenproxy');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$Xlvl5rRCyc2O8Hntb7wdHk$apNmRmv+e4MS+Z50xW6aMvMv/urrhwG8+KkXV0QGlmU=','2023-05-22 17:07:08.133957',1,'admin','','','',1,1,'2023-05-15 17:38:52.649387'),(2,'pbkdf2_sha256$260000$DDku4obaUa6v2r8FYwvq5n$T8BdwQfUf0iF0QYwzIdDvlHgHQU0dgn4uCr08mwwYM4=','2023-05-26 02:29:45.566634',0,'abdullah9912','Abdullah','Khan','',0,1,'2023-05-15 17:51:02.780911'),(3,'pbkdf2_sha256$260000$XTYl1FECzX6BxgbqHVAB8I$ANuhjKf1zVJZBrFPJ7KBULpop8IMeewn0T8UWnDvkuk=','2023-05-26 02:50:46.245048',0,'syedfaisal','Syed','Faisal','',0,1,'2023-05-15 17:52:15.290854'),(4,'pbkdf2_sha256$260000$vNeIrDPz5pM796yTSUFFgW$zz71RO8Www2/9twaZj70LRU7pNrethgQYqfa6NGIIOk=',NULL,0,'nabeelshareef','Nabeel','Shareef','',0,1,'2023-05-15 17:59:37.832191'),(5,'pbkdf2_sha256$260000$KReUYHsYNBDwx2oo18u87n$TTJ7lHinHtpakrAGO5TU4owpp9ZiFDRZBYEUWF5gaAY=','2023-05-26 03:07:49.000595',0,'abdulhannan','Abdul Hannan','Mujawar','',0,1,'2023-05-15 18:00:58.325994'),(6,'pbkdf2_sha256$260000$c4QoIfOBk0I2PomUnxhbX3$sTw2UxbH0BSIx8AUOhqtFV1fH7dE5JLYLi44tQAS/bQ=','2023-05-26 01:59:17.895830',0,'indianajones','Indiana','Jones','',0,1,'2023-05-15 18:02:05.028817'),(7,'pbkdf2_sha256$260000$JIooScdMD5SNbHh4fOB01Z$XChwO1bgvxcELmWKb7XT8Fgik+FMT0vXDNXPQ9RPExw=',NULL,0,'shahbazhaidar','Shahbaz','Haidar','',0,1,'2023-05-26 03:19:54.809774');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` VALUES ('c3ac3f0cee74b12a64bc3ef97a328e4cbb15415d','2023-05-26 02:51:04.951245',5),('d4fff72471f3f92a9edf5ea52cdf311c3538beab','2023-05-25 09:24:16.936170',6);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-05-15 18:03:39.169925','1','Contact object (1)',3,'',8,1),(2,'2023-05-16 02:54:21.798755','4','Message object (4)',2,'[{\"changed\": {\"fields\": [\"Read by\"]}}]',7,1),(3,'2023-05-16 02:54:26.842035','3','Message object (3)',2,'[{\"changed\": {\"fields\": [\"Read by\"]}}]',7,1),(4,'2023-05-17 04:49:05.458661','6','indianajones',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(9,'authtoken','token'),(10,'authtoken','tokenproxy'),(5,'contenttypes','contenttype'),(8,'myapp','contact'),(7,'myapp','message'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-05-15 17:38:11.777135'),(2,'auth','0001_initial','2023-05-15 17:38:13.118297'),(3,'admin','0001_initial','2023-05-15 17:38:13.518749'),(4,'admin','0002_logentry_remove_auto_add','2023-05-15 17:38:13.564226'),(5,'admin','0003_logentry_add_action_flag_choices','2023-05-15 17:38:13.628970'),(6,'contenttypes','0002_remove_content_type_name','2023-05-15 17:38:14.003882'),(7,'auth','0002_alter_permission_name_max_length','2023-05-15 17:38:14.228324'),(8,'auth','0003_alter_user_email_max_length','2023-05-15 17:38:14.408855'),(9,'auth','0004_alter_user_username_opts','2023-05-15 17:38:14.472277'),(10,'auth','0005_alter_user_last_login_null','2023-05-15 17:38:14.697800'),(11,'auth','0006_require_contenttypes_0002','2023-05-15 17:38:14.710459'),(12,'auth','0007_alter_validators_add_error_messages','2023-05-15 17:38:14.780663'),(13,'auth','0008_alter_user_username_max_length','2023-05-15 17:38:15.015965'),(14,'auth','0009_alter_user_last_name_max_length','2023-05-15 17:38:15.231507'),(15,'auth','0010_alter_group_name_max_length','2023-05-15 17:38:15.370901'),(16,'auth','0011_update_proxy_permissions','2023-05-15 17:38:15.522810'),(17,'auth','0012_alter_user_first_name_max_length','2023-05-15 17:38:15.776145'),(18,'myapp','0001_initial','2023-05-15 17:38:16.328821'),(19,'myapp','0002_auto_20230421_0949','2023-05-15 17:38:16.870445'),(20,'myapp','0003_message_read','2023-05-15 17:38:17.036683'),(21,'myapp','0004_alter_message_created_at','2023-05-15 17:38:17.230709'),(22,'myapp','0005_alter_message_created_at','2023-05-15 17:38:17.301870'),(23,'myapp','0006_alter_message_read','2023-05-15 17:38:17.750683'),(24,'myapp','0007_remove_message_read','2023-05-15 17:38:18.006980'),(25,'myapp','0008_message_read','2023-05-15 17:38:18.278594'),(26,'myapp','0009_rename_read_message_read_by','2023-05-15 17:38:18.649738'),(27,'myapp','0010_rename_read_by_message_read','2023-05-15 17:38:18.934951'),(28,'sessions','0001_initial','2023-05-15 17:38:19.043678'),(29,'myapp','0011_rename_read_message_read_by','2023-05-15 17:45:28.659790'),(30,'myapp','0012_alter_message_read_by','2023-05-16 02:40:33.308130'),(31,'authtoken','0001_initial','2023-05-17 17:17:06.719178'),(32,'authtoken','0002_auto_20160226_1747','2023-05-17 17:17:06.809204'),(33,'authtoken','0003_tokenproxy','2023-05-17 17:17:06.815259'),(34,'myapp','0013_alter_contact_user','2023-05-18 02:15:16.113312');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1i3qvxw3cfpihwadmq3zzp3uy9kbr89q','.eJxVjDsOwyAQBe9CHaHlZ3DK9D4DWlgITiKQjF1FuXtsyUXSvpl5b-ZxW4vfelr8TOzKDLv8bgHjM9UD0APrvfHY6rrMgR8KP2nnU6P0up3u30HBXvY6DgQ6aScwCwuUBmkhQDYYZHDKhDGPAAp3C5FEJkORIhplrJNJA7HPF_MmOHc:1q19oy:Be2zJpGgVoKWsET8-sOafixEWVGDzF_W3xInZfCkFgE','2023-06-05 17:59:48.450328'),('35rw5vwxntz2oyx95qbf97y6winxy5ew','.eJxVjEEOwiAQRe_C2hCYMnRw6d4zEBhAqoYmpV0Z765NutDtf-_9l_BhW6vfel78lMRZgDj9bjHwI7cdpHtot1ny3NZlinJX5EG7vM4pPy-H-3dQQ6_f2jmiYAlMMoNTpBANREBdMNM4aGC22mIelUUwBRA1AllEZ6Llwkm8P5Q6Ngw:1pyqLE:VKtDm_1MDUlHJRwp1wnSm7SL42HkqISSDexGiVLq0G0','2023-05-30 08:47:32.404014'),('3cp158z3som9xafhywvrwh58kzf8ugbx','.eJxVjDsOwyAQBe9CHaHlZ3DK9D4DWlgITiKQjF1FuXtsyUXSvpl5b-ZxW4vfelr8TOzKDLv8bgHjM9UD0APrvfHY6rrMgR8KP2nnU6P0up3u30HBXvY6DgQ6aScwCwuUBmkhQDYYZHDKhDGPAAp3C5FEJkORIhplrJNJA7HPF_MmOHc:1q2Nnx:HgMYx61B_kJJij89SlzFBBVZw0YIUiePxssXUX1V-78','2023-06-09 03:07:49.011725'),('782oocywbvxkiumsugona6zh45p44i05','.eJxVjDsOwyAQBe9CHaHlZ3DK9D4DWlgITiKQjF1FuXtsyUXSvpl5b-ZxW4vfelr8TOzKDLv8bgHjM9UD0APrvfHY6rrMgR8KP2nnU6P0up3u30HBXvY6DgQ6aScwCwuUBmkhQDYYZHDKhDGPAAp3C5FEJkORIhplrJNJA7HPF_MmOHc:1q0Fkr:SW1Srwjvkq9Wkrwb7svUPyVcd_7TSByeG7WvTNZHL1k','2023-06-03 06:07:49.514166'),('97e6wb2ekrg6q234pu8z3d9i80xbhojo','.eJxVjDsOwjAQBe_iGln-fyjpOYO1u7ZxADlSnFSIu0OkFNC-mXkvlmBbW9pGWdKU2ZlpdvrdEOhR-g7yHfpt5jT3dZmQ7wo_6ODXOZfn5XD_DhqM9q2rL5WiU6Bz1tqRFwodymhlDMFHIFfRymyFUkGDwOCEMySqVWS9NYa9P98dNxk:1q1iyw:pWMvgBLFQ5rUi2xixAFUztMbxWWMGFAL1KpyrGBwcqM','2023-06-07 07:32:26.460332'),('9nmw1mwmb5p0j1nd1ixca2qs808c3onm','.eJxVjDsOwyAQBe9CHaHlZ3DK9D4DWlgITiKQjF1FuXtsyUXSvpl5b-ZxW4vfelr8TOzKDLv8bgHjM9UD0APrvfHY6rrMgR8KP2nnU6P0up3u30HBXvY6DgQ6aScwCwuUBmkhQDYYZHDKhDGPAAp3C5FEJkORIhplrJNJA7HPF_MmOHc:1pzXmB:3i07wXFFMcAAtUtjMHLxrKPZ-AdMkDHC1yGocAuurSc','2023-06-01 07:10:15.095637'),('bsjmcli1aeilwem8egvbo7f4037or4bu','.eJxVjDsOwyAQBe9CHaHlZ3DK9D4DWlgITiKQjF1FuXtsyUXSvpl5b-ZxW4vfelr8TOzKDLv8bgHjM9UD0APrvfHY6rrMgR8KP2nnU6P0up3u30HBXvY6DgQ6aScwCwuUBmkhQDYYZHDKhDGPAAp3C5FEJkORIhplrJNJA7HPF_MmOHc:1q0hMo:WR5qs1OWUAqdr65sJljdr7EkgOd7luBxoIQtzntphgg','2023-06-04 11:36:50.548104'),('civojsgbunvsm29upaidh15n4g2qcpca','.eJxVjDsOwyAQBe9CHaHlZ3DK9D4DWlgITiKQjF1FuXtsyUXSvpl5b-ZxW4vfelr8TOzKDLv8bgHjM9UD0APrvfHY6rrMgR8KP2nnU6P0up3u30HBXvY6DgQ6aScwCwuUBmkhQDYYZHDKhDGPAAp3C5FEJkORIhplrJNJA7HPF_MmOHc:1q1iyj:KkevEtMglRY3ocaOYa4SiJbxzq7ct5mrf5xm65kTkws','2023-06-07 07:32:13.070940'),('gljbclb6ak3kc357lyw3whvelislzlge','.eJxVjDsOwjAQBe_iGln-fyjpOYO1u7ZxADlSnFSIu0OkFNC-mXkvlmBbW9pGWdKU2ZlpdvrdEOhR-g7yHfpt5jT3dZmQ7wo_6ODXOZfn5XD_DhqM9q2rL5WiU6Bz1tqRFwodymhlDMFHIFfRymyFUkGDwOCEMySqVWS9NYa9P98dNxk:1q2ENV:9zruIJO4ppL_6WhkW3rdzVC6cakoP9WsZAzSdrS0PdI','2023-06-08 17:03:53.805365'),('ji5dhe6hlxt7b91au3hwwt194qz7gh5g','.eJxVjDsOwyAQBe9CHaHlZ3DK9D4DWlgITiKQjF1FuXtsyUXSvpl5b-ZxW4vfelr8TOzKDLv8bgHjM9UD0APrvfHY6rrMgR8KP2nnU6P0up3u30HBXvY6DgQ6aScwCwuUBmkhQDYYZHDKhDGPAAp3C5FEJkORIhplrJNJA7HPF_MmOHc:1q0RCs:1be7GckLyWe1ePFl4IZnxTIBkjJdFVAjXhOYPEooBj4','2023-06-03 18:21:30.915984'),('jpo6j0wcidve47uenra2ukyizg9hg9zx','.eJxVjDsOwjAQBe_iGln-fyjpOYO1u7ZxADlSnFSIu0OkFNC-mXkvlmBbW9pGWdKU2ZlpdvrdEOhR-g7yHfpt5jT3dZmQ7wo_6ODXOZfn5XD_DhqM9q2rL5WiU6Bz1tqRFwodymhlDMFHIFfRymyFUkGDwOCEMySqVWS9NYa9P98dNxk:1q16e6:FmlgRy_i7mFG9LgPjZJqdRuat94OvJAl3faI9nKARww','2023-06-05 14:36:22.277559'),('lgst31x4wxav27ju1818bnff2tcznu7k','.eJxVjEEOwiAQRe_C2hCYMnRw6d4zEBhAqoYmpV0Z765NutDtf-_9l_BhW6vfel78lMRZgDj9bjHwI7cdpHtot1ny3NZlinJX5EG7vM4pPy-H-3dQQ6_f2jmiYAlMMoNTpBANREBdMNM4aGC22mIelUUwBRA1AllEZ6Llwkm8P5Q6Ngw:1q0PSG:Pwm7lHnTaSSV7Io73Siagf-NEDF_bCwoyM-9ufemJ4o','2023-06-03 16:29:16.148627'),('lm0935vsm3o1tdf53mdiobx7jfvlclrq','.eJxVjEEOwiAQRe_C2hCYMnRw6d4zEBhAqoYmpV0Z765NutDtf-_9l_BhW6vfel78lMRZgDj9bjHwI7cdpHtot1ny3NZlinJX5EG7vM4pPy-H-3dQQ6_f2jmiYAlMMoNTpBANREBdMNM4aGC22mIelUUwBRA1AllEZ6Llwkm8P5Q6Ngw:1q1Lhk:crohyrmFrnrNSUemmHSTzep-sue6-4n9WymQoOIpMCU','2023-06-06 06:41:08.667432'),('nzbfo7b7vc4q4nor0cjcwwafohacilcw','.eJxVjEEOwiAQRe_C2hCYMnRw6d4zEBhAqoYmpV0Z765NutDtf-_9l_BhW6vfel78lMRZgDj9bjHwI7cdpHtot1ny3NZlinJX5EG7vM4pPy-H-3dQQ6_f2jmiYAlMMoNTpBANREBdMNM4aGC22mIelUUwBRA1AllEZ6Llwkm8P5Q6Ngw:1q11zH:yJrtJ66uVKgfOwNcD8axNzRrcE7UpnGrPZLx4jlK0xc','2023-06-05 09:37:55.050384'),('o4zk98bdcy6h83nwzrr3zrnr8wxn114k','.eJxVjEEOwiAQRe_C2hAYQkGX7j1DM8wwUjWQlHbVeHdt0oVu_3vvb2rEdSnj2vM8TqwualCn3y0hPXPdAT-w3pumVpd5SnpX9EG7vjXOr-vh_h0U7OVbSx4I2AfnDQWUZEXIm0wYzmCAbGQnPoAFjBGzELMLHsglgzKAF_X-AAdROLo:1q219B:2pxNbufuhqdZa8If5D9-rbh-AoRZmKWpZgMBTl4XHoI','2023-06-08 02:56:13.049999'),('qqv0joayu5la5iukalf9zvh6hkeusoka','.eJxVjDsOwyAQBe9CHaHlZ3DK9D4DWlgITiKQjF1FuXtsyUXSvpl5b-ZxW4vfelr8TOzKDLv8bgHjM9UD0APrvfHY6rrMgR8KP2nnU6P0up3u30HBXvY6DgQ6aScwCwuUBmkhQDYYZHDKhDGPAAp3C5FEJkORIhplrJNJA7HPF_MmOHc:1q0faD:l9mhnqTEkqYGGtXkdCV9e9m2RT-5NNdFcODPuI8munY','2023-06-04 09:42:33.977871'),('retfs0z3axot22o2zpewlmhwf60l8zjn','.eJxVjEEOwiAQRe_C2hCYMnRw6d4zEBhAqoYmpV0Z765NutDtf-_9l_BhW6vfel78lMRZgDj9bjHwI7cdpHtot1ny3NZlinJX5EG7vM4pPy-H-3dQQ6_f2jmiYAlMMoNTpBANREBdMNM4aGC22mIelUUwBRA1AllEZ6Llwkm8P5Q6Ngw:1q2NC4:9NmQr-ZiMds2LkVZ22azjxZZeav4lqt-gQIMJj2giZc','2023-06-09 02:28:40.273227'),('smwpjui3eg0hzk0wvnuu0it4rcc2c2n4','.eJxVjEEOwiAQRe_C2hCYMnRw6d4zEBhAqoYmpV0Z765NutDtf-_9l_BhW6vfel78lMRZgDj9bjHwI7cdpHtot1ny3NZlinJX5EG7vM4pPy-H-3dQQ6_f2jmiYAlMMoNTpBANREBdMNM4aGC22mIelUUwBRA1AllEZ6Llwkm8P5Q6Ngw:1pzYtR:5JxmKzyYwALsLWrVc0_y1_dG-w7UMyMlmqZjZizkFRI','2023-06-01 08:21:49.518544'),('t9rjksgotr5fhtiqahh8wbyhau8h35jk','.eJxVjEEOwiAQRe_C2hAYQkGX7j1DM8wwUjWQlHbVeHdt0oVu_3vvb2rEdSnj2vM8TqwualCn3y0hPXPdAT-w3pumVpd5SnpX9EG7vjXOr-vh_h0U7OVbSx4I2AfnDQWUZEXIm0wYzmCAbGQnPoAFjBGzELMLHsglgzKAF_X-AAdROLo:1pz96N:SmjavIRxXzReHkvXw_KOrtI5yVBDNwkqV4d70gMfcUE','2023-05-31 04:49:27.339990'),('xj249ncn7911mrc5zwfimzrmxmmq7n48','.eJxVjEEOwiAQRe_C2hCYMnRw6d4zEBhAqoYmpV0Z765NutDtf-_9l_BhW6vfel78lMRZgDj9bjHwI7cdpHtot1ny3NZlinJX5EG7vM4pPy-H-3dQQ6_f2jmiYAlMMoNTpBANREBdMNM4aGC22mIelUUwBRA1AllEZ6Llwkm8P5Q6Ngw:1pzXls:5ZqqVgYk1yQnUrBiTus10GQAZGGHGASjKD0Z-52K9Ng','2023-06-01 07:09:56.905403'),('xzd2fz8ynr0u9q5koldh44ypvogsnpzm','.eJxVjDsOwyAQBe9CHaHlZ3DK9D4DWlgITiKQjF1FuXtsyUXSvpl5b-ZxW4vfelr8TOzKDLv8bgHjM9UD0APrvfHY6rrMgR8KP2nnU6P0up3u30HBXvY6DgQ6aScwCwuUBmkhQDYYZHDKhDGPAAp3C5FEJkORIhplrJNJA7HPF_MmOHc:1q23uo:CqRvN1qrLKWVzbVkeBa8i_q2ffkomrSW3K2jmVC5UpQ','2023-06-08 05:53:34.197664'),('ze7u55lwfi85r3huxhb2dp853eq3ezwm','e30:1pzSvp:_L2idLJuFuy9gndVGXA3rDDBDCkwrKo8hjvdHw-YKYE','2023-06-01 01:59:53.383769'),('zlopyjg304als43w45op7kscbtjoq9yr','.eJxVjEEOwiAQRe_C2hCYMnRw6d4zEBhAqoYmpV0Z765NutDtf-_9l_BhW6vfel78lMRZgDj9bjHwI7cdpHtot1ny3NZlinJX5EG7vM4pPy-H-3dQQ6_f2jmiYAlMMoNTpBANREBdMNM4aGC22mIelUUwBRA1AllEZ6Llwkm8P5Q6Ngw:1pzWbo:RxgGI41pbU1ZVuxUcz4BD84dZboDtSbr-1WB75a3AP4','2023-06-01 05:55:28.452000'),('zs2shtvp7vxt96jn00taklh9qvzimd97','.eJxVjDsOwyAQBe9CHaHlZ3DK9D4DWlgITiKQjF1FuXtsyUXSvpl5b-ZxW4vfelr8TOzKDLv8bgHjM9UD0APrvfHY6rrMgR8KP2nnU6P0up3u30HBXvY6DgQ6aScwCwuUBmkhQDYYZHDKhDGPAAp3C5FEJkORIhplrJNJA7HPF_MmOHc:1pycY8:9FkX7jKbJ967vV3CS3a1vR7QVT5cqGN0dMd96p7us6k','2023-05-29 18:03:56.335568');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_contact`
--

DROP TABLE IF EXISTS `myapp_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_contact` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` longtext,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `myapp_contact_user_id_706cf770_uniq` (`user_id`),
  CONSTRAINT `myapp_contact_user_id_706cf770_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_contact`
--

LOCK TABLES `myapp_contact` WRITE;
/*!40000 ALTER TABLE `myapp_contact` DISABLE KEYS */;
INSERT INTO `myapp_contact` VALUES (2,'Abdullah Khan',2),(3,'Syed Faisal',3),(4,'Nabeel Shareef',4),(5,'Abdul Hannan Mujawar',5),(6,'Indiana Jones',6),(7,'Shahbaz Haidar',7);
/*!40000 ALTER TABLE `myapp_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_message`
--

DROP TABLE IF EXISTS `myapp_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_message` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sms` longtext,
  `created_at` datetime(6) NOT NULL,
  `from_user_id` int DEFAULT NULL,
  `to_user_id` int DEFAULT NULL,
  `read_by` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_message_from_user_id_e5962b9a_fk_auth_user_id` (`from_user_id`),
  KEY `myapp_message_to_user_id_f335846b_fk_auth_user_id` (`to_user_id`),
  CONSTRAINT `myapp_message_from_user_id_e5962b9a_fk_auth_user_id` FOREIGN KEY (`from_user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `myapp_message_to_user_id_f335846b_fk_auth_user_id` FOREIGN KEY (`to_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=538 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_message`
--

LOCK TABLES `myapp_message` WRITE;
/*!40000 ALTER TABLE `myapp_message` DISABLE KEYS */;
INSERT INTO `myapp_message` VALUES (1,'Hello there......how we doing this moring??','2023-05-16 02:26:02.669111',5,2,1),(2,'Hello','2023-05-16 02:26:29.108118',5,3,1),(3,'sorry to disturb you','2023-05-16 02:27:01.000000',5,2,1),(4,'Hello how are you','2023-05-16 02:50:47.000000',3,5,1),(5,'Greetings','2023-05-16 02:57:28.248369',3,5,1),(6,'How are you doing','2023-05-16 02:58:23.524149',3,5,1),(7,'Hi again','2023-05-16 02:58:51.903579',3,5,1),(8,'hello there','2023-05-16 02:59:01.672385',3,5,1),(9,'Jolly good day','2023-05-16 03:03:50.991469',3,5,1),(10,'Mac and Cheese','2023-05-16 03:03:54.300799',3,5,1),(11,'Hi are you there','2023-05-16 03:05:20.391203',3,5,1),(12,'Jolly good day','2023-05-16 03:58:27.596125',3,5,1),(13,'Bonjour','2023-05-16 03:58:31.451852',3,5,1),(14,'Trying again','2023-05-16 04:05:16.754917',3,5,1),(15,'One','2023-05-16 05:18:42.505051',3,5,1),(16,'Two','2023-05-16 05:18:45.712469',3,5,1),(17,'Three','2023-05-16 05:18:48.685460',3,5,1),(18,'One','2023-05-16 05:24:09.392049',2,5,1),(19,'Two','2023-05-16 05:24:16.114424',2,5,1),(20,'Three','2023-05-16 05:24:22.268002',2,5,1),(21,'Hello there','2023-05-16 05:26:20.198039',3,5,1),(22,'Hello ','2023-05-16 05:39:51.172657',5,2,1),(23,'How are you','2023-05-16 05:39:56.658513',5,2,1),(24,'Jolly good day','2023-05-16 06:08:47.665686',2,5,1),(25,'Bonjour','2023-05-16 06:08:52.176916',2,5,1),(26,'Hello there','2023-05-16 06:09:04.659065',2,5,1),(27,'Hi there hello how are you','2023-05-16 06:11:23.384976',2,5,1),(28,'Jolly good day','2023-05-16 06:12:06.115297',2,5,1),(29,'Seen your mesages','2023-05-16 06:12:25.862778',5,2,1),(30,'Hi there','2023-05-16 06:47:59.513863',2,5,1),(31,'Hello trying again','2023-05-16 06:49:44.319750',2,5,1),(32,'Yeah received','2023-05-16 07:09:33.612872',5,2,1),(33,'Jolly good day','2023-05-16 07:11:15.467554',5,2,1),(34,'Bonjour','2023-05-16 07:14:14.476686',5,2,1),(35,'Mac and Cheese','2023-05-16 07:14:35.187012',5,2,1),(36,'Hello','2023-05-16 07:14:59.852055',5,2,1),(37,'Hello there','2023-05-16 09:59:14.099826',2,5,1),(38,'Are you there','2023-05-16 10:01:45.937246',2,5,1),(39,'Ignore if received','2023-05-16 10:01:56.759544',2,5,1),(40,'totally fine','2023-05-16 10:02:13.258456',2,5,1),(41,'Jolly good day','2023-05-16 10:02:17.094593',2,5,1),(42,'Mac and Cheese','2023-05-16 10:02:19.113649',2,5,1),(43,'Bonjour','2023-05-16 10:02:21.677563',2,5,1),(44,'Jolly good day','2023-05-16 10:02:24.059166',2,5,1),(45,'Hello','2023-05-16 10:02:26.333032',2,5,1),(46,'make it a ten','2023-05-16 10:02:41.885024',2,5,1),(47,'make it a twelve','2023-05-16 10:02:59.499427',2,5,1),(48,'one more message','2023-05-16 12:49:10.639754',2,5,1),(49,'another message','2023-05-16 12:49:16.197367',2,5,1),(50,'Anothr message for you','2023-05-16 12:55:38.349841',2,5,1),(51,'Jolly good day','2023-05-16 13:00:58.841477',2,5,1),(52,'Jolly good day','2023-05-16 13:41:27.843418',2,5,1),(53,'Hello there','2023-05-16 14:01:20.740486',2,5,1),(54,'Bonjour','2023-05-16 14:05:16.620244',2,5,1),(55,'Bonjour','2023-05-16 14:05:40.965001',2,5,1),(56,'Bonjour','2023-05-16 14:06:38.893992',2,5,1),(57,'Hello','2023-05-16 14:16:04.690618',2,5,1),(58,'Bonjour','2023-05-16 14:18:12.616784',2,5,1),(59,'Hello there neighbour','2023-05-16 14:27:09.771256',2,5,1),(60,'Mac and cheese','2023-05-16 14:28:07.827738',2,5,1),(61,'Jolly good day','2023-05-16 14:29:53.434259',2,5,1),(62,'this is testing 101','2023-05-16 14:33:26.185391',2,5,1),(63,'hi there','2023-05-16 14:35:33.840041',2,5,1),(64,'Jolly good day','2023-05-16 16:41:47.524632',2,5,1),(65,'Hello there','2023-05-16 16:46:29.805522',2,5,1),(66,'Jolly good day','2023-05-16 16:47:14.807090',2,5,1),(67,'Hello there','2023-05-16 16:51:34.860256',2,5,1),(68,'Hello there','2023-05-16 16:54:32.729908',2,5,1),(69,'He I\'m Jesse','2023-05-16 16:56:35.940421',2,5,1),(70,'this is 101 testing','2023-05-16 16:58:19.829813',2,5,1),(71,'it\'s a happy ending after all','2023-05-16 17:00:10.526903',2,5,1),(72,'Jolly good day','2023-05-16 17:01:06.656243',2,5,1),(73,'Hi there','2023-05-16 17:01:58.749581',2,5,1),(74,'Hello there','2023-05-16 17:28:46.573614',5,2,1),(75,'Bonjour','2023-05-16 17:31:38.010760',2,5,1),(76,'Jolly good day','2023-05-16 17:35:10.853454',2,5,1),(77,'Jolly good day','2023-05-16 17:37:52.466140',2,5,1),(78,'Mac and Cheese','2023-05-16 17:39:24.013018',2,5,1),(79,'Jolly good day','2023-05-16 17:47:28.101148',2,5,1),(80,'Mac and Cheese','2023-05-16 17:56:02.468948',2,6,1),(81,'Hello there','2023-05-17 04:42:06.956521',2,5,1),(82,'Mac and Cheese','2023-05-17 04:43:06.314970',2,5,1),(83,'Hi its indianajones','2023-05-17 04:50:49.813012',6,5,1),(84,'hi its syed Faisal','2023-05-17 04:51:12.334474',3,5,1),(85,'Hi its abdullah','2023-05-17 04:51:22.400544',2,5,1),(86,'indiainajones','2023-05-17 04:56:51.529012',6,5,1),(87,'syedfaisal','2023-05-17 04:56:57.370125',3,5,1),(88,'abdullah9912','2023-05-17 04:57:02.723430',2,5,1),(89,'hi there','2023-05-17 05:01:21.846132',6,5,1),(90,'hola','2023-05-17 05:01:28.935691',3,5,1),(91,'bonjour','2023-05-17 05:01:34.766103',2,5,1),(92,'Jolly good day','2023-05-17 05:03:05.151821',2,5,1),(93,'Bonjour','2023-05-17 05:37:44.614751',2,5,1),(94,'Jolly good day','2023-05-17 05:39:42.714074',2,5,1),(95,'Bonjour','2023-05-17 06:05:53.315201',2,5,1),(96,'Hello from Syed Faisal','2023-05-17 06:06:54.616300',3,5,1),(97,'Hello from Indiana Jones','2023-05-17 06:07:06.302969',6,5,1),(98,'Hello from Abdullah','2023-05-17 06:07:20.224926',2,5,1),(99,'Hello there','2023-05-19 04:19:51.008839',2,5,1),(100,NULL,'2023-05-19 17:57:14.967055',NULL,NULL,1),(101,NULL,'2023-05-19 17:58:17.488877',NULL,NULL,1),(102,NULL,'2023-05-19 17:59:47.618803',NULL,NULL,1),(103,NULL,'2023-05-19 18:00:27.540843',NULL,NULL,1),(104,NULL,'2023-05-19 18:00:41.036495',NULL,NULL,1),(105,NULL,'2023-05-19 18:00:52.134917',NULL,NULL,1),(106,NULL,'2023-05-19 18:01:33.781194',NULL,NULL,1),(107,'Testing via API again','2023-05-19 18:06:46.440393',5,2,1),(108,'Testing from react native app','2023-05-19 18:39:08.600361',5,2,1),(109,'Hello sending message to app','2023-05-20 06:03:24.893800',2,5,1),(110,'Hello testing again','2023-05-20 06:04:59.874816',2,5,1),(111,'Hello there','2023-05-20 06:13:12.366493',2,3,1),(112,'hello','2023-05-20 14:15:00.077878',2,3,1),(113,'Jolly good day','2023-05-20 15:56:17.414190',2,5,1),(114,'message','2023-05-20 16:29:44.929807',5,2,1),(115,'Hello','2023-05-20 18:21:37.719633',5,2,1),(116,'Hi there','2023-05-21 10:45:00.702546',2,5,1),(117,NULL,'2023-05-21 10:45:22.199674',2,5,1),(118,'Great work','2023-05-21 10:48:05.979796',2,5,1),(119,'Hello testing to see if message is read','2023-05-22 09:39:17.152411',5,2,1),(120,'Hello testing for new messages','2023-05-22 11:20:49.675849',2,5,1),(121,'counting on unread messages','2023-05-22 11:21:07.360253',2,5,1),(122,'lets start over','2023-05-22 11:23:59.199401',2,5,1),(123,'Hello my friend','2023-05-22 14:13:45.687743',2,3,1),(124,'Hello Abdullah','2023-05-22 14:27:23.672619',3,2,1),(125,'Hello there','2023-05-22 14:31:07.699278',2,3,1),(126,'Jolly good day','2023-05-22 14:36:37.642958',3,2,1),(127,'Hello there','2023-05-22 16:47:56.387462',3,5,1),(128,'Bonjour','2023-05-22 16:49:29.195582',3,5,1),(129,'Mac and Cheese','2023-05-22 16:49:51.090143',3,5,1),(130,'Hello there','2023-05-22 17:20:15.583128',3,5,1),(131,'Hi there','2023-05-22 17:22:02.157504',3,5,1),(132,'Bonjour','2023-05-22 17:22:36.924184',3,5,1),(133,'Hi there','2023-05-22 17:31:02.183210',3,5,1),(134,'Testing out the modified data','2023-05-22 17:32:18.234539',3,5,1),(135,'Hello....... retrying again','2023-05-22 17:38:07.603729',3,5,1),(136,'Jolly good day','2023-05-22 17:55:02.026092',3,5,1),(137,'Mac and Cheese','2023-05-22 17:58:03.592524',3,5,1),(138,'Jolly good day','2023-05-22 17:59:24.997213',3,5,1),(139,'Hi there lets see','2023-05-22 18:00:01.288310',3,5,1),(140,'Mac and Cheese','2023-05-22 18:00:38.585160',3,5,1),(141,'Bonjour','2023-05-22 18:01:19.702006',3,5,1),(142,'hola','2023-05-22 18:01:50.638664',3,5,1),(143,'kudos','2023-05-22 18:03:34.839834',3,5,1),(144,'Bonjour','2023-05-22 18:05:38.085800',3,5,1),(145,'bon voyage','2023-05-22 18:06:37.922956',3,5,1),(146,'Bonjour','2023-05-22 18:11:38.037360',3,5,1),(147,'Hi there','2023-05-22 18:12:43.153382',3,5,1),(148,'Bonjour','2023-05-22 18:20:29.237332',3,2,1),(149,'Mac and Cheese','2023-05-22 18:21:04.163793',3,2,1),(150,'Bonjour','2023-05-22 18:21:22.146296',3,2,1),(151,'Let\'s hear from you','2023-05-22 18:23:35.337440',3,5,1),(152,'Helle there','2023-05-23 01:49:39.599848',3,2,1),(153,'Hi how are you','2023-05-23 01:50:18.467408',3,5,1),(154,'Jolly good day','2023-05-23 01:50:48.696693',3,5,1),(155,'Mac and Cheese','2023-05-23 01:51:32.023801',3,5,1),(156,'Hello there','2023-05-23 01:52:12.699677',3,5,1),(157,'Hello there','2023-05-23 02:06:09.358057',3,5,1),(158,'Jolly good day','2023-05-23 02:07:45.543245',3,5,1),(159,'Mac and Cheese','2023-05-23 02:09:04.744095',3,5,1),(160,'Jolly good day','2023-05-23 02:10:02.933286',3,5,1),(161,'Hello','2023-05-23 02:11:20.632275',3,5,1),(162,'Mac and Cheese','2023-05-23 02:17:59.134659',3,5,1),(163,'Bonjour','2023-05-23 03:06:44.818703',3,5,1),(164,'Hello there just trying some new things','2023-05-23 04:59:38.973903',5,3,1),(165,'Jolly good day','2023-05-23 05:01:04.843514',3,5,1),(166,'Bonjour','2023-05-23 05:01:45.787049',3,5,1),(167,'Hello there','2023-05-23 05:03:21.625685',3,5,1),(168,'Hello there','2023-05-23 05:06:41.117334',3,5,1),(169,'Hello there','2023-05-23 05:57:37.417660',5,3,1),(170,'Mac and Cheese','2023-05-23 06:00:20.667850',5,3,1),(171,'Lets try again','2023-05-23 06:02:37.964420',5,3,1),(172,'Sent you a text','2023-05-23 06:40:07.431026',5,3,1),(173,'sent you a text','2023-05-23 06:41:25.876548',5,2,1),(174,'sent you a text','2023-05-23 06:41:59.090016',5,6,1),(175,'Bonjour','2023-05-23 06:43:49.768201',5,2,1),(176,'Hello there','2023-05-23 06:45:05.901478',5,3,1),(177,'Mac and Cheese','2023-05-23 06:45:47.872012',5,6,1),(178,'How are you','2023-05-23 06:46:16.300435',5,6,1),(179,'Mac and Cheese','2023-05-23 06:47:13.679863',5,6,1),(180,'Mac and Cheese','2023-05-23 06:47:33.413949',5,3,1),(181,'Bonjour mon ami','2023-05-23 06:47:59.088568',5,2,1),(182,'Hello there','2023-05-23 06:49:29.732712',5,3,1),(183,'Mac and Cheese','2023-05-23 06:50:21.372353',5,3,1),(184,'hi faisal','2023-05-23 06:52:57.315309',5,3,1),(185,'Mac and Cheese','2023-05-23 06:56:00.335568',5,3,1),(186,'Bonjour','2023-05-23 06:56:18.010700',5,3,1),(187,'Hello there','2023-05-23 06:56:35.778055',5,3,1),(188,'Hello Abdul Hannan','2023-05-23 06:58:06.593858',2,5,1),(189,'Hi Syed Faisal','2023-05-23 08:24:55.894379',5,3,1),(190,'HI again','2023-05-23 08:25:43.878611',5,3,1),(191,'Bonjour','2023-05-23 08:26:39.946428',5,3,1),(192,'Mac and Cheese','2023-05-23 08:28:51.230329',5,3,1),(193,'Bonjour','2023-05-23 08:31:26.777888',5,3,1),(194,'Jolly good day','2023-05-23 08:32:38.916063',5,3,1),(195,'Mac and Cheese','2023-05-23 08:34:36.469262',5,3,1),(196,'Bonjour','2023-05-23 08:37:04.632706',5,3,1),(197,'Hola','2023-05-23 08:37:22.238590',3,5,1),(198,'Mac and Cheese','2023-05-23 08:37:59.885143',5,3,1),(199,'Mac and Cheese','2023-05-23 08:38:30.553518',5,3,1),(200,'Hi how are you','2023-05-23 08:40:59.789560',5,3,1),(201,'Bonjour','2023-05-23 08:41:27.479821',5,3,1),(202,'Mac and Cheese','2023-05-23 08:41:55.087648',5,3,1),(203,'Mac and Cheese','2023-05-23 08:42:50.456460',5,3,1),(204,'Bonjour','2023-05-23 08:43:16.631060',5,3,1),(205,'Hello there','2023-05-23 08:44:02.440977',5,3,1),(206,'Mac and Cheese','2023-05-23 08:45:28.761156',5,3,1),(207,'Hi there','2023-05-23 08:46:13.643468',5,3,1),(208,'Bonjour','2023-05-23 08:46:28.356348',5,3,1),(209,'Mac and Cheese','2023-05-23 08:47:19.414182',5,3,1),(210,'Bonjour','2023-05-23 08:48:43.154316',3,5,1),(211,'Hola','2023-05-23 08:48:56.685368',6,5,1),(212,'Hi there','2023-05-23 08:49:09.247865',2,5,1),(213,'Bonjour','2023-05-23 08:51:22.154575',3,5,1),(214,'Mac and Cheese','2023-05-23 08:51:33.937492',6,5,1),(215,'Hello my friend','2023-05-23 08:51:48.816987',2,5,1),(216,'Mac and Cheese','2023-05-23 08:55:03.378801',3,5,1),(217,'Hola','2023-05-23 08:55:11.711580',6,5,1),(218,'Hi there','2023-05-23 08:55:20.367013',2,5,1),(219,'Bonjour','2023-05-23 08:57:43.280198',3,5,1),(220,'Hello','2023-05-23 08:58:00.389447',6,5,1),(221,'I am indianajones','2023-05-23 08:58:20.229979',6,5,1),(222,'I am Abdullah','2023-05-23 08:58:53.477809',2,5,1),(223,'from syedfaisal to abdulhannan','2023-05-23 09:01:51.228820',3,5,1),(224,'from syedfaisal to abdulhannan','2023-05-23 09:04:26.891333',3,5,1),(225,'from syedfaisal to abdulhannan','2023-05-23 09:06:19.523497',3,5,1),(226,'Bonjour','2023-05-23 09:44:08.595257',5,3,1),(227,'from Abdullah to Abdul Hannan','2023-05-23 09:56:09.386702',2,5,1),(228,'from Abdullah to Abdul Hannan','2023-05-23 10:21:33.281326',2,5,1),(229,'From Abdul Hannan to Abdullah','2023-05-23 10:21:57.037446',5,3,1),(230,'from Indiana jones to Abdul Hannan','2023-05-23 12:09:09.054520',6,5,1),(231,'Hello Indiana Jones','2023-05-23 12:36:30.174008',5,6,1),(232,'Hello Indiana Jones','2023-05-23 12:37:16.409422',5,6,1),(233,'Bonjour Indiana Jones','2023-05-23 12:42:40.479979',5,6,1),(234,'Hi Indiana','2023-05-23 12:44:09.420258',5,6,1),(235,'Jolly good day','2023-05-23 12:46:45.613845',5,6,1),(236,'Hello there Indiana','2023-05-23 12:53:40.852513',5,6,1),(237,'Hello there','2023-05-23 12:55:47.299329',5,6,1),(238,'Hi Indiana, this is Faisal','2023-05-23 12:58:28.456510',3,6,1),(239,'Hi Faisal this is Abdul Hannan','2023-05-23 13:00:32.736219',5,3,1),(240,'Hello There Faisal','2023-05-23 13:02:54.062427',5,3,1),(241,'Hello This is Syed Faisal','2023-05-23 13:04:24.754410',5,3,1),(242,'Hello lets try this again','2023-05-23 13:04:52.828079',5,3,1),(243,'Hello there','2023-05-23 13:07:54.428597',5,3,1),(244,'Bonjour','2023-05-23 13:08:13.541531',5,3,1),(245,'Hello there','2023-05-23 13:08:24.457307',5,3,1),(246,'Hello there','2023-05-23 13:44:01.434761',3,6,1),(247,'Mac and Cheese','2023-05-23 13:44:51.797275',3,6,1),(248,'Hi there','2023-05-23 13:45:28.821913',3,6,1),(249,'Hi there','2023-05-23 13:48:38.394180',5,3,1),(250,'Hi there','2023-05-23 13:51:56.911165',5,3,1),(251,'Hi there','2023-05-23 13:52:37.598514',5,3,1),(252,'Bonjour','2023-05-23 13:53:34.821095',5,3,1),(253,'Mac and Cheese','2023-05-23 13:56:18.304983',5,3,1),(254,'Jolly good day','2023-05-23 13:57:03.160398',5,3,1),(255,'Hello there','2023-05-23 13:57:50.251941',5,3,1),(256,'Jolly good day','2023-05-23 13:58:15.263475',5,3,1),(257,'Jolly good day','2023-05-23 13:59:04.599968',5,3,1),(258,'Mac and Cheese','2023-05-23 13:59:59.678709',5,3,1),(259,'Bonjour','2023-05-23 14:00:37.101751',5,3,1),(260,'Hi there','2023-05-23 14:01:15.012273',5,3,1),(261,'Mac and Cheese','2023-05-23 14:01:46.836743',5,3,1),(262,'Bonjour','2023-05-23 14:06:18.988893',5,3,1),(263,'Jolly good day','2023-05-23 14:07:14.589590',5,3,1),(264,'Hi there','2023-05-23 14:07:44.043451',5,3,1),(265,'Jolly good day','2023-05-23 14:08:10.930619',5,3,1),(266,'Hello there','2023-05-23 14:09:08.731277',5,3,1),(267,'Hello there','2023-05-23 14:09:40.928665',5,3,1),(268,'Mac and Cheese','2023-05-23 14:10:15.912114',5,3,1),(269,'','2023-05-23 14:10:19.964288',5,3,1),(270,'','2023-05-23 14:10:31.130530',3,5,1),(271,'Bonjour','2023-05-23 14:10:50.022252',5,3,1),(272,'Hello there','2023-05-23 14:11:04.974580',5,3,1),(273,'Hello','2023-05-23 14:12:23.610136',5,3,1),(274,'Jolly good day','2023-05-23 14:13:06.718238',5,3,1),(275,'Hello there','2023-05-23 14:13:15.817433',3,5,1),(276,'Hello there','2023-05-23 14:15:33.223657',5,3,1),(277,'Hello','2023-05-23 14:15:51.262388',5,3,1),(278,'Mac and Cheese','2023-05-23 14:27:50.013630',5,3,1),(279,'Hello','2023-05-23 14:28:02.872295',5,3,1),(280,'Hi indianajones','2023-05-23 16:14:05.800540',6,3,1),(281,'I meant Hi Faisal','2023-05-23 16:14:45.285910',6,3,1),(282,'whatsuppp','2023-05-23 16:14:53.896838',3,6,1),(283,'Hello there','2023-05-23 16:19:58.008394',5,6,1),(284,'Jolly good day','2023-05-23 16:20:23.209793',5,6,1),(285,'it is ','2023-05-23 16:20:28.401364',6,5,1),(286,'Jolly good day','2023-05-23 16:27:28.600272',5,6,1),(287,'Hi there','2023-05-24 06:47:51.947111',5,6,1),(288,'Jolly good day','2023-05-24 06:48:11.269366',5,6,1),(289,'Hi','2023-05-24 06:48:19.134442',5,3,1),(290,'Hi ','2023-05-24 07:11:43.687125',5,6,1),(291,'Great working','2023-05-24 07:11:50.190607',5,6,1),(292,'Wow it\'s fast ','2023-05-24 07:11:55.439860',5,6,1),(293,'Hi there','2023-05-24 07:13:25.928484',5,3,1),(294,'Hello','2023-05-24 07:13:30.015824',5,3,1),(295,'Are you ready for school','2023-05-24 07:13:38.582409',5,3,1),(296,'To be or not to be that is the question wether tis nobler in the mind to see the slings and arrows of outrageous fortune or to take arms against the sea of troubles ...to sleep ..to sleep ....perchance to dream aye the there\'s the rub','2023-05-24 07:15:37.879805',5,6,1),(297,'Yes I am','2023-05-24 07:32:47.156991',3,5,1),(298,'Are you ready though ','2023-05-24 07:33:50.086047',5,3,1),(299,'Sure','2023-05-24 07:34:03.405896',3,5,1),(300,'Okay whatever ','2023-05-24 07:34:14.253932',5,3,1),(301,'Hi there','2023-05-24 07:35:25.322785',3,5,1),(302,'What are you upto','2023-05-24 07:35:38.429113',5,3,1),(303,'Hello indianajones','2023-05-24 07:36:15.693852',5,6,1),(304,'Hi','2023-05-24 07:36:35.670122',3,5,1),(305,'What\'s happening ','2023-05-24 07:36:50.898710',3,5,1),(306,'Hi Indiana','2023-05-24 07:37:29.939286',5,6,1),(307,'Hi','2023-05-24 07:37:35.780178',5,6,1),(308,'Try again','2023-05-24 07:37:56.772406',3,5,1),(309,'Hi faisal','2023-05-24 07:38:57.393759',5,3,1),(310,'Hello there','2023-05-24 07:39:13.470886',3,6,1),(311,'Hello ','2023-05-24 07:39:49.209537',3,2,1),(312,'Jolly good day','2023-05-24 16:47:11.694384',3,6,1),(313,'Hello there','2023-05-24 16:51:38.455097',3,6,1),(314,'Mac and Cheese','2023-05-24 16:54:16.793406',3,6,1),(315,'Hello there','2023-05-24 16:54:54.246136',3,6,1),(316,'Bonjour','2023-05-24 16:58:30.940446',3,6,1),(317,'Bonjour','2023-05-24 17:01:17.377308',3,6,1),(318,'Mac and Cheese','2023-05-24 17:02:19.300756',3,6,1),(319,'Jolly good day','2023-05-24 17:03:58.874925',3,6,1),(320,'Hello','2023-05-24 17:04:35.502148',3,6,1),(321,'Bonjour','2023-05-24 17:05:00.507968',3,6,1),(322,'Hello there','2023-05-24 17:07:09.429822',3,6,1),(323,'Bonjour','2023-05-24 17:16:55.345250',3,6,1),(324,'Jolly good day','2023-05-24 17:18:01.998342',3,6,1),(325,'Hi there','2023-05-24 17:18:41.725981',3,6,1),(326,'Jolly good day','2023-05-24 17:25:40.960996',3,6,1),(327,'Mac and Cheese','2023-05-24 17:28:36.679683',3,6,1),(328,'Mac and Cheese','2023-05-24 17:29:09.524791',3,6,1),(329,'Hello there','2023-05-24 17:30:01.474394',3,6,1),(330,'Hello there','2023-05-24 17:30:39.019779',3,6,1),(331,'Jolly good day','2023-05-24 17:32:24.612673',3,6,1),(332,'Hello','2023-05-24 17:34:18.898799',3,6,1),(333,'Glory','2023-05-24 17:36:20.037760',3,6,1),(334,'Great going','2023-05-24 17:37:28.532743',3,6,1),(335,'Hello there','2023-05-24 17:42:40.014315',3,4,1),(336,'Mac and Cheese','2023-05-24 17:45:39.805956',3,4,1),(337,'Mac and Cheese','2023-05-24 17:46:43.099139',3,4,1),(338,'Hello there','2023-05-24 17:51:13.727390',3,2,1),(339,'Jolly good day','2023-05-24 17:51:57.520335',3,5,1),(340,'Jolly good day','2023-05-24 17:52:50.262799',3,6,1),(341,'Hello Abdullah','2023-05-24 17:53:07.284477',3,2,1),(342,'Mac and Cheese','2023-05-24 17:56:30.431329',3,2,1),(343,'Bonjour','2023-05-24 17:56:43.684366',3,5,1),(344,'Jolly good day','2023-05-24 17:58:37.391728',3,5,1),(345,'Mac and Cheese','2023-05-24 18:05:46.870271',2,3,1),(346,'Bonjour','2023-05-24 18:06:02.261484',2,3,1),(347,'Mac and Cheese','2023-05-24 18:06:16.464751',3,4,1),(348,'Hello there','2023-05-24 18:06:32.518634',6,2,1),(349,'Bonjour','2023-05-24 18:07:11.727916',2,3,1),(350,'Bonjour','2023-05-24 18:07:18.518410',2,4,1),(351,'Hello there','2023-05-24 18:07:27.988914',2,6,1),(352,'How are you sad Faisal','2023-05-24 18:10:06.746215',6,3,1),(353,'Bonjour from Abdullah to Indiana Jones','2023-05-24 18:13:25.335011',2,6,1),(354,'Bonjour from Abdullah Khan to Indiana Jones','2023-05-24 18:14:47.137111',2,6,1),(355,'Hello there','2023-05-24 18:16:07.293955',2,3,1),(356,'Mac and Cheese','2023-05-24 18:17:02.830872',2,3,1),(357,'Hello there','2023-05-24 18:18:04.346427',2,3,1),(358,'Hello there','2023-05-24 18:18:43.860950',2,3,1),(359,'Mac and Cheese','2023-05-24 18:19:21.235397',2,3,1),(360,'Hi there','2023-05-24 18:19:53.650041',2,3,1),(361,'Bonjour','2023-05-24 18:20:32.657691',5,3,1),(362,'Hi there','2023-05-24 18:21:23.136756',5,3,1),(363,'Bonjour','2023-05-24 18:22:04.332844',5,3,1),(364,'Hi there you','2023-05-24 18:22:33.656161',5,3,1),(365,'I am Jones','2023-05-24 18:24:27.702559',6,3,1),(366,'Hi there','2023-05-24 18:25:30.079692',5,3,1),(367,'I am indiana','2023-05-24 18:25:42.088133',6,3,1),(368,'I am faisal','2023-05-24 18:26:34.378868',5,3,1),(369,'Bonjour','2023-05-24 18:27:37.965946',5,3,1),(370,'Hola','2023-05-24 18:27:47.132953',6,3,1),(371,'Hi there','2023-05-24 18:41:29.786214',6,3,1),(372,'Mac and Cheese','2023-05-24 18:49:43.522116',3,4,1),(373,'Jolly good day','2023-05-24 18:49:52.122315',3,4,1),(374,'Hi there','2023-05-24 18:50:18.613362',3,4,1),(375,'Bonjour','2023-05-24 18:50:39.035316',3,5,1),(376,'Hello there','2023-05-24 18:50:45.747613',5,3,1),(377,'Jolly good day','2023-05-24 18:53:12.169937',3,5,1),(378,'Bonjour','2023-05-24 18:53:44.859438',3,5,1),(379,'Mac and Cheese','2023-05-24 19:07:43.897915',3,5,1),(380,'Jolly good day','2023-05-24 19:07:57.374353',3,5,1),(381,'Hello there','2023-05-24 19:08:49.891911',3,5,1),(382,'Bonjour','2023-05-25 01:08:14.642572',5,3,1),(383,'Bonjour','2023-05-25 01:08:57.436108',5,3,1),(384,'Hello there','2023-05-25 01:10:06.963365',5,3,1),(385,'Hi Indiana this is Abdullah','2023-05-25 03:02:58.804641',2,6,1),(386,'Bonjour','2023-05-25 03:06:01.572212',2,6,1),(387,'Bonjour','2023-05-25 03:07:09.075070',3,2,1),(388,'Hi its Abdul Hannan','2023-05-25 03:20:06.308704',5,6,1),(389,'Bonjour','2023-05-25 03:27:14.230366',5,6,1),(390,'Bonjour and Hola','2023-05-25 03:31:07.473212',5,6,1),(391,'Hi there','2023-05-25 03:32:28.148239',5,6,1),(392,'Hello there','2023-05-25 03:49:25.457181',5,6,1),(393,'Bonjour','2023-05-25 03:52:03.488715',5,6,1),(394,'Hello there','2023-05-25 03:59:26.484710',5,3,1),(395,'Hello there my friend','2023-05-25 04:01:14.747689',5,3,1),(396,'Hello there','2023-05-25 04:04:21.225434',5,3,1),(397,'Hello there','2023-05-25 04:06:24.183902',5,3,1),(398,'Jolly good day','2023-05-25 04:07:36.392240',5,3,1),(399,'Bonjour','2023-05-25 04:08:07.394343',5,3,1),(400,'Hello','2023-05-25 04:08:10.644364',5,3,1),(401,'Jolly good day','2023-05-25 04:10:47.748059',5,3,1),(402,'Mac and Cheese','2023-05-25 04:11:04.228232',5,3,1),(403,'Jolly good day','2023-05-25 04:15:17.296724',3,5,1),(404,'Hi there','2023-05-25 04:16:05.222194',3,5,1),(405,'Hello there','2023-05-25 04:19:14.506066',5,3,1),(406,'Hello there','2023-05-25 04:19:29.327393',5,3,1),(407,'Mac and Cheese','2023-05-25 04:28:44.584872',5,3,1),(408,'Mac and Cheese ','2023-05-25 04:30:35.916847',5,3,1),(409,'from syed faisal to Abdul Hannan','2023-05-25 04:33:09.642403',5,3,1),(410,'Hello there','2023-05-25 04:45:53.986310',5,3,1),(411,'Mac and Cheese','2023-05-25 04:46:36.042778',5,3,1),(412,'Hello there','2023-05-25 04:48:00.607177',5,3,1),(413,'Mac and Cheese','2023-05-25 04:48:35.967582',5,3,1),(414,'Hi there','2023-05-25 04:50:25.019618',5,3,1),(415,'Mac and Cheese','2023-05-25 04:52:41.273063',5,3,1),(416,'Jolly good day','2023-05-25 04:53:35.335469',5,3,1),(417,'Hello','2023-05-25 04:54:11.446579',5,3,1),(418,'Hello there','2023-05-25 04:57:33.524355',5,3,1),(419,'Mac and Cheese','2023-05-25 05:00:10.575650',5,3,1),(420,'Hello','2023-05-25 05:12:40.079715',5,3,1),(421,'Hello there','2023-05-25 05:16:43.458613',5,3,1),(422,'Sour','2023-05-25 05:17:54.332812',6,5,1),(423,'Pose','2023-05-25 05:18:07.295962',6,5,1),(424,'Hello there','2023-05-25 05:19:35.784047',5,6,1),(425,'Mac and Cheese','2023-05-25 05:19:56.090392',5,3,1),(426,'Hello there','2023-05-25 05:21:06.036687',5,3,1),(427,'Bonjour','2023-05-25 05:27:52.895617',5,3,1),(428,'Hello there','2023-05-25 05:29:12.022074',5,3,1),(429,'Hi there','2023-05-25 05:30:26.700175',5,3,1),(430,'Jolly good day','2023-05-25 05:30:35.173534',5,3,1),(431,'Bonjour','2023-05-25 05:30:42.689014',5,3,1),(432,'Mac and Cheese','2023-05-25 05:30:45.717640',5,3,1),(433,'Jolly good day','2023-05-25 05:30:49.307714',5,3,1),(434,'Hello there','2023-05-25 05:30:57.966012',5,3,1),(435,'Hello','2023-05-25 05:31:01.012957',5,3,1),(436,'Hi from Indiana Jones','2023-05-25 05:31:15.191319',6,3,1),(437,'Bonjour','2023-05-25 05:33:04.878397',5,3,1),(438,'Hello','2023-05-25 05:33:07.768527',5,3,1),(439,'Hi there','2023-05-25 05:33:16.458665',6,5,1),(440,'Hola','2023-05-25 05:33:20.592434',6,5,1),(441,'Hola','2023-05-25 05:33:38.507610',6,3,1),(442,'Hi are you there','2023-05-25 05:53:59.913073',3,5,1),(443,'yes I am ','2023-05-25 05:54:14.461720',5,3,1),(444,'cool','2023-05-25 05:54:21.810221',3,5,1),(445,'Hi','2023-05-25 05:56:35.431816',6,3,1),(446,'Mac and Cheese','2023-05-25 05:56:49.289493',5,3,1),(447,'hi','2023-05-25 05:56:58.276107',6,3,1),(448,'Hello testing it out','2023-05-25 05:57:42.101585',6,3,1),(449,'Bonjour','2023-05-25 05:57:56.028380',5,3,1),(450,'Hi there','2023-05-25 05:58:05.432867',6,3,1),(451,'hola','2023-05-25 05:58:10.645624',5,3,1),(452,'hi there','2023-05-25 05:59:15.800380',6,3,1),(453,'Hello','2023-05-25 05:59:22.791623',5,3,1),(454,'Hello there','2023-05-25 06:08:48.410802',5,3,1),(455,'Bonjour','2023-05-25 06:08:52.051704',5,3,1),(456,'Hola','2023-05-25 06:08:59.555262',6,3,1),(457,'Hi','2023-05-25 07:13:57.763905',5,3,1),(458,'Great to see you','2023-05-25 07:14:13.842583',5,6,1),(459,'Hello there','2023-05-25 07:15:51.125562',5,3,1),(460,'How are you?','2023-05-25 07:16:01.465396',5,6,1),(461,'Hi yall','2023-05-25 07:18:15.099994',5,3,1),(462,'What\'s up','2023-05-25 07:18:50.733196',5,3,1),(463,'Hi there','2023-05-25 07:22:35.505117',5,3,1),(464,'What are you upto','2023-05-25 07:22:44.709378',5,6,1),(465,'What are you upto Jones','2023-05-25 09:10:17.995445',5,6,1),(466,'Hello there','2023-05-25 09:11:46.540179',5,3,1),(467,'Hi there','2023-05-25 09:15:21.538074',5,6,1),(468,'Bonjour','2023-05-25 09:16:34.041481',5,6,1),(469,'Hi there','2023-05-25 09:24:28.562598',6,3,1),(470,'abdul hannan','2023-05-25 09:24:43.966458',6,5,1),(471,'Hello how are you','2023-05-25 09:25:15.464267',6,5,1),(472,'Hello sir','2023-05-25 09:28:07.599564',5,6,1),(473,'How are you?','2023-05-25 09:31:21.634137',5,6,1),(474,'Is it a good time to call','2023-05-25 09:31:57.635797',5,6,1),(475,'Hello','2023-05-25 10:03:28.154157',5,6,1),(476,'Hello how are you ','2023-05-25 12:12:38.156535',5,6,1),(477,'Mac and Cheese','2023-05-25 12:24:03.911138',5,3,1),(478,'Hi there','2023-05-25 13:05:08.679200',5,3,1),(479,'Hola','2023-05-25 13:08:55.408774',5,6,1),(480,'Hi there','2023-05-25 13:56:18.047562',3,6,1),(481,'Bonjour','2023-05-25 13:56:36.490412',3,2,1),(482,'Jonathan Brown','2023-05-25 13:57:52.331163',3,6,1),(483,'Jonathan Brown','2023-05-25 13:58:14.358247',3,2,1),(484,'Hello','2023-05-25 14:19:19.068311',2,3,1),(485,'Hello indiana','2023-05-25 14:39:23.257969',5,6,1),(486,'Hello Syed Faisal ','2023-05-25 14:42:55.845676',5,3,1),(487,'Hi ','2023-05-25 14:45:15.824468',2,6,1),(488,'Hola','2023-05-25 16:34:36.642852',2,6,1),(489,'Hello Abdullah','2023-05-25 17:00:15.701776',3,2,1),(490,'Yolo','2023-05-25 17:04:14.614381',2,3,1),(491,'High ','2023-05-25 17:06:39.425839',2,3,1),(492,'High Abdullah ','2023-05-25 17:07:50.503362',2,3,1),(493,'Great ','2023-05-25 17:08:59.276232',2,3,1),(494,'Wasn\'t it great','2023-05-25 17:09:22.164264',2,3,1),(495,'Hello','2023-05-25 17:12:01.507157',2,3,1),(496,'Hi there ','2023-05-25 17:12:42.583872',2,3,1),(497,'Hello there','2023-05-25 17:29:34.872343',2,3,1),(498,'Hola','2023-05-25 17:30:14.811621',2,3,1),(499,'Hi there','2023-05-25 17:30:41.274156',2,3,1),(500,'Who is this ','2023-05-25 17:31:00.791413',2,5,1),(501,'Full ','2023-05-25 17:32:38.992336',2,5,1),(502,'Who si this ','2023-05-25 17:33:35.659369',2,3,1),(503,'Are you there','2023-05-25 17:33:44.501323',2,3,1),(504,'An who is this','2023-05-25 17:33:48.789162',2,3,1),(505,'How well do you know me','2023-05-25 17:33:57.601949',2,3,1),(506,'How are you my friend','2023-05-25 17:41:45.297190',3,2,1),(507,'HI THERE','2023-05-26 01:44:29.042929',5,3,1),(508,'Hello','2023-05-26 01:44:53.644477',5,3,1),(509,'Hello there','2023-05-26 01:45:21.398346',5,6,0),(510,'What\'s up','2023-05-26 01:45:29.167670',5,2,1),(511,'Nothing much','2023-05-26 01:45:39.239355',5,6,0),(512,'Hola','2023-05-26 01:49:32.276181',5,6,0),(513,'Hi there','2023-05-26 01:50:05.262292',5,6,0),(514,'Hola','2023-05-26 01:54:05.893730',5,3,1),(515,'Hi there','2023-05-26 02:00:58.190525',6,3,1),(516,'How are ya','2023-05-26 02:01:11.154745',6,3,1),(517,'Hi','2023-05-26 02:07:09.154864',3,5,1),(518,'Hello','2023-05-26 02:09:02.512479',3,2,1),(519,'What\'s new','2023-05-26 02:09:21.381537',3,4,0),(520,'Hi','2023-05-26 02:10:21.258857',2,6,0),(521,'Hello there','2023-05-26 02:29:55.648920',2,6,0),(522,'Hahahaha','2023-05-26 02:30:10.340420',2,3,1),(523,'Great to see ya','2023-05-26 02:30:44.540151',3,2,1),(524,'How are things ','2023-05-26 02:31:39.138340',3,2,1),(525,'Nice seeing you here','2023-05-26 02:33:38.975684',2,3,1),(526,'Jolly good day','2023-05-26 02:39:01.932181',2,3,1),(527,'Hi there','2023-05-26 02:39:33.031019',3,2,1),(528,'what\'s up','2023-05-26 02:40:06.253910',2,3,1),(529,'Nothing much ','2023-05-26 02:40:14.913297',3,2,1),(530,'How are you','2023-05-26 02:41:54.554668',3,2,1),(531,'Awesome','2023-05-26 02:42:07.705242',3,2,1),(532,'Great day','2023-05-26 02:42:27.865910',3,2,1),(533,'Hi there','2023-05-26 02:44:03.370211',3,2,1),(534,'Hello','2023-05-26 02:44:21.879044',3,2,1),(535,'Hi man','2023-05-26 02:51:17.916472',5,2,1),(536,'Mac and Cheese','2023-05-26 03:08:02.792984',2,5,1),(537,'Bonjour','2023-05-26 03:08:23.446032',2,5,1);
/*!40000 ALTER TABLE `myapp_message` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-26  8:51:21

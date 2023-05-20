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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$Xlvl5rRCyc2O8Hntb7wdHk$apNmRmv+e4MS+Z50xW6aMvMv/urrhwG8+KkXV0QGlmU=','2023-05-17 04:48:23.309916',1,'admin','','','',1,1,'2023-05-15 17:38:52.649387'),(2,'pbkdf2_sha256$260000$DDku4obaUa6v2r8FYwvq5n$T8BdwQfUf0iF0QYwzIdDvlHgHQU0dgn4uCr08mwwYM4=','2023-05-20 16:29:16.127710',0,'abdullah9912','Abdullah','Khan','',0,1,'2023-05-15 17:51:02.780911'),(3,'pbkdf2_sha256$260000$XTYl1FECzX6BxgbqHVAB8I$ANuhjKf1zVJZBrFPJ7KBULpop8IMeewn0T8UWnDvkuk=','2023-05-17 04:47:23.316033',0,'syedfaisal','Syed','Faisal','',0,1,'2023-05-15 17:52:15.290854'),(4,'pbkdf2_sha256$260000$vNeIrDPz5pM796yTSUFFgW$zz71RO8Www2/9twaZj70LRU7pNrethgQYqfa6NGIIOk=',NULL,0,'nabeelshareef','Nabeel','Shareef','',0,1,'2023-05-15 17:59:37.832191'),(5,'pbkdf2_sha256$260000$KReUYHsYNBDwx2oo18u87n$TTJ7lHinHtpakrAGO5TU4owpp9ZiFDRZBYEUWF5gaAY=','2023-05-20 15:48:50.745759',0,'abdulhannan','Abdul Hannan','Mujawar','',0,1,'2023-05-15 18:00:58.325994'),(6,'pbkdf2_sha256$260000$c4QoIfOBk0I2PomUnxhbX3$sTw2UxbH0BSIx8AUOhqtFV1fH7dE5JLYLi44tQAS/bQ=','2023-05-17 04:49:27.336097',0,'indianajones','Indiana','Jones','',0,1,'2023-05-15 18:02:05.028817');
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
INSERT INTO `authtoken_token` VALUES ('af0d2634ae5370e44fa50d9df9f888753019edfa','2023-05-18 07:10:15.056224',5),('c284182ec2b10691bb93ca2e261a7b9c951cf287','2023-05-18 01:59:53.373565',2);
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
INSERT INTO `django_session` VALUES ('35rw5vwxntz2oyx95qbf97y6winxy5ew','.eJxVjEEOwiAQRe_C2hCYMnRw6d4zEBhAqoYmpV0Z765NutDtf-_9l_BhW6vfel78lMRZgDj9bjHwI7cdpHtot1ny3NZlinJX5EG7vM4pPy-H-3dQQ6_f2jmiYAlMMoNTpBANREBdMNM4aGC22mIelUUwBRA1AllEZ6Llwkm8P5Q6Ngw:1pyqLE:VKtDm_1MDUlHJRwp1wnSm7SL42HkqISSDexGiVLq0G0','2023-05-30 08:47:32.404014'),('782oocywbvxkiumsugona6zh45p44i05','.eJxVjDsOwyAQBe9CHaHlZ3DK9D4DWlgITiKQjF1FuXtsyUXSvpl5b-ZxW4vfelr8TOzKDLv8bgHjM9UD0APrvfHY6rrMgR8KP2nnU6P0up3u30HBXvY6DgQ6aScwCwuUBmkhQDYYZHDKhDGPAAp3C5FEJkORIhplrJNJA7HPF_MmOHc:1q0Fkr:SW1Srwjvkq9Wkrwb7svUPyVcd_7TSByeG7WvTNZHL1k','2023-06-03 06:07:49.514166'),('9nmw1mwmb5p0j1nd1ixca2qs808c3onm','.eJxVjDsOwyAQBe9CHaHlZ3DK9D4DWlgITiKQjF1FuXtsyUXSvpl5b-ZxW4vfelr8TOzKDLv8bgHjM9UD0APrvfHY6rrMgR8KP2nnU6P0up3u30HBXvY6DgQ6aScwCwuUBmkhQDYYZHDKhDGPAAp3C5FEJkORIhplrJNJA7HPF_MmOHc:1pzXmB:3i07wXFFMcAAtUtjMHLxrKPZ-AdMkDHC1yGocAuurSc','2023-06-01 07:10:15.095637'),('eherk1gqlblynek60k0li9mmyxvwkr16','.eJxVjEEOwiAQRe_C2hCYMnRw6d4zEBhAqoYmpV0Z765NutDtf-_9l_BhW6vfel78lMRZgDj9bjHwI7cdpHtot1ny3NZlinJX5EG7vM4pPy-H-3dQQ6_f2jmiYAlMMoNTpBANREBdMNM4aGC22mIelUUwBRA1AllEZ6Llwkm8P5Q6Ngw:1q0Fg0:Znad_dC2ABcrxzgc-6r81o5wKA9N-MJemK1HhnUfaLY','2023-06-03 06:02:48.940990'),('lgst31x4wxav27ju1818bnff2tcznu7k','.eJxVjEEOwiAQRe_C2hCYMnRw6d4zEBhAqoYmpV0Z765NutDtf-_9l_BhW6vfel78lMRZgDj9bjHwI7cdpHtot1ny3NZlinJX5EG7vM4pPy-H-3dQQ6_f2jmiYAlMMoNTpBANREBdMNM4aGC22mIelUUwBRA1AllEZ6Llwkm8P5Q6Ngw:1q0PSG:Pwm7lHnTaSSV7Io73Siagf-NEDF_bCwoyM-9ufemJ4o','2023-06-03 16:29:16.148627'),('qqv0joayu5la5iukalf9zvh6hkeusoka','.eJxVjDsOwyAQBe9CHaHlZ3DK9D4DWlgITiKQjF1FuXtsyUXSvpl5b-ZxW4vfelr8TOzKDLv8bgHjM9UD0APrvfHY6rrMgR8KP2nnU6P0up3u30HBXvY6DgQ6aScwCwuUBmkhQDYYZHDKhDGPAAp3C5FEJkORIhplrJNJA7HPF_MmOHc:1q0Op8:jzap1VuOlb98Ukcuw5F8lwIbL79cniG82qPyh8j8igM','2023-06-03 15:48:50.770292'),('smwpjui3eg0hzk0wvnuu0it4rcc2c2n4','.eJxVjEEOwiAQRe_C2hCYMnRw6d4zEBhAqoYmpV0Z765NutDtf-_9l_BhW6vfel78lMRZgDj9bjHwI7cdpHtot1ny3NZlinJX5EG7vM4pPy-H-3dQQ6_f2jmiYAlMMoNTpBANREBdMNM4aGC22mIelUUwBRA1AllEZ6Llwkm8P5Q6Ngw:1pzYtR:5JxmKzyYwALsLWrVc0_y1_dG-w7UMyMlmqZjZizkFRI','2023-06-01 08:21:49.518544'),('t9rjksgotr5fhtiqahh8wbyhau8h35jk','.eJxVjEEOwiAQRe_C2hAYQkGX7j1DM8wwUjWQlHbVeHdt0oVu_3vvb2rEdSnj2vM8TqwualCn3y0hPXPdAT-w3pumVpd5SnpX9EG7vjXOr-vh_h0U7OVbSx4I2AfnDQWUZEXIm0wYzmCAbGQnPoAFjBGzELMLHsglgzKAF_X-AAdROLo:1pz96N:SmjavIRxXzReHkvXw_KOrtI5yVBDNwkqV4d70gMfcUE','2023-05-31 04:49:27.339990'),('u3wdnx2f2owbjdj8s7fir2j1p1qooeg7','.eJxVjDsOwjAQBe_iGln-fyjpOYO1u7ZxADlSnFSIu0OkFNC-mXkvlmBbW9pGWdKU2ZlpdvrdEOhR-g7yHfpt5jT3dZmQ7wo_6ODXOZfn5XD_DhqM9q2rL5WiU6Bz1tqRFwodymhlDMFHIFfRymyFUkGDwOCEMySqVWS9NYa9P98dNxk:1pz94N:_EPhGU7hJKWp3eiNtuNElcaxyu1i_ymhGEv8gbIiFdg','2023-05-31 04:47:23.321248'),('xj249ncn7911mrc5zwfimzrmxmmq7n48','.eJxVjEEOwiAQRe_C2hCYMnRw6d4zEBhAqoYmpV0Z765NutDtf-_9l_BhW6vfel78lMRZgDj9bjHwI7cdpHtot1ny3NZlinJX5EG7vM4pPy-H-3dQQ6_f2jmiYAlMMoNTpBANREBdMNM4aGC22mIelUUwBRA1AllEZ6Llwkm8P5Q6Ngw:1pzXls:5ZqqVgYk1yQnUrBiTus10GQAZGGHGASjKD0Z-52K9Ng','2023-06-01 07:09:56.905403'),('ze7u55lwfi85r3huxhb2dp853eq3ezwm','e30:1pzSvp:_L2idLJuFuy9gndVGXA3rDDBDCkwrKo8hjvdHw-YKYE','2023-06-01 01:59:53.383769'),('zlopyjg304als43w45op7kscbtjoq9yr','.eJxVjEEOwiAQRe_C2hCYMnRw6d4zEBhAqoYmpV0Z765NutDtf-_9l_BhW6vfel78lMRZgDj9bjHwI7cdpHtot1ny3NZlinJX5EG7vM4pPy-H-3dQQ6_f2jmiYAlMMoNTpBANREBdMNM4aGC22mIelUUwBRA1AllEZ6Llwkm8P5Q6Ngw:1pzWbo:RxgGI41pbU1ZVuxUcz4BD84dZboDtSbr-1WB75a3AP4','2023-06-01 05:55:28.452000'),('zs2shtvp7vxt96jn00taklh9qvzimd97','.eJxVjDsOwyAQBe9CHaHlZ3DK9D4DWlgITiKQjF1FuXtsyUXSvpl5b-ZxW4vfelr8TOzKDLv8bgHjM9UD0APrvfHY6rrMgR8KP2nnU6P0up3u30HBXvY6DgQ6aScwCwuUBmkhQDYYZHDKhDGPAAp3C5FEJkORIhplrJNJA7HPF_MmOHc:1pycY8:9FkX7jKbJ967vV3CS3a1vR7QVT5cqGN0dMd96p7us6k','2023-05-29 18:03:56.335568');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_contact`
--

LOCK TABLES `myapp_contact` WRITE;
/*!40000 ALTER TABLE `myapp_contact` DISABLE KEYS */;
INSERT INTO `myapp_contact` VALUES (2,'Abdullah Khan',2),(3,'Syed Faisal',3),(4,'Nabeel Shareef',4),(5,'Abdul Hannan Mujawar',5),(6,'Indiana Jones',6);
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
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_message`
--

LOCK TABLES `myapp_message` WRITE;
/*!40000 ALTER TABLE `myapp_message` DISABLE KEYS */;
INSERT INTO `myapp_message` VALUES (1,'Hello there......how we doing this moring??','2023-05-16 02:26:02.669111',5,2,1),(2,'Hello','2023-05-16 02:26:29.108118',5,3,1),(3,'sorry to disturb you','2023-05-16 02:27:01.000000',5,2,1),(4,'Hello how are you','2023-05-16 02:50:47.000000',3,5,1),(5,'Greetings','2023-05-16 02:57:28.248369',3,5,1),(6,'How are you doing','2023-05-16 02:58:23.524149',3,5,1),(7,'Hi again','2023-05-16 02:58:51.903579',3,5,1),(8,'hello there','2023-05-16 02:59:01.672385',3,5,1),(9,'Jolly good day','2023-05-16 03:03:50.991469',3,5,1),(10,'Mac and Cheese','2023-05-16 03:03:54.300799',3,5,1),(11,'Hi are you there','2023-05-16 03:05:20.391203',3,5,1),(12,'Jolly good day','2023-05-16 03:58:27.596125',3,5,1),(13,'Bonjour','2023-05-16 03:58:31.451852',3,5,1),(14,'Trying again','2023-05-16 04:05:16.754917',3,5,1),(15,'One','2023-05-16 05:18:42.505051',3,5,1),(16,'Two','2023-05-16 05:18:45.712469',3,5,1),(17,'Three','2023-05-16 05:18:48.685460',3,5,1),(18,'One','2023-05-16 05:24:09.392049',2,5,1),(19,'Two','2023-05-16 05:24:16.114424',2,5,1),(20,'Three','2023-05-16 05:24:22.268002',2,5,1),(21,'Hello there','2023-05-16 05:26:20.198039',3,5,1),(22,'Hello ','2023-05-16 05:39:51.172657',5,2,1),(23,'How are you','2023-05-16 05:39:56.658513',5,2,1),(24,'Jolly good day','2023-05-16 06:08:47.665686',2,5,1),(25,'Bonjour','2023-05-16 06:08:52.176916',2,5,1),(26,'Hello there','2023-05-16 06:09:04.659065',2,5,1),(27,'Hi there hello how are you','2023-05-16 06:11:23.384976',2,5,1),(28,'Jolly good day','2023-05-16 06:12:06.115297',2,5,1),(29,'Seen your mesages','2023-05-16 06:12:25.862778',5,2,1),(30,'Hi there','2023-05-16 06:47:59.513863',2,5,1),(31,'Hello trying again','2023-05-16 06:49:44.319750',2,5,1),(32,'Yeah received','2023-05-16 07:09:33.612872',5,2,1),(33,'Jolly good day','2023-05-16 07:11:15.467554',5,2,1),(34,'Bonjour','2023-05-16 07:14:14.476686',5,2,1),(35,'Mac and Cheese','2023-05-16 07:14:35.187012',5,2,1),(36,'Hello','2023-05-16 07:14:59.852055',5,2,1),(37,'Hello there','2023-05-16 09:59:14.099826',2,5,1),(38,'Are you there','2023-05-16 10:01:45.937246',2,5,1),(39,'Ignore if received','2023-05-16 10:01:56.759544',2,5,1),(40,'totally fine','2023-05-16 10:02:13.258456',2,5,1),(41,'Jolly good day','2023-05-16 10:02:17.094593',2,5,1),(42,'Mac and Cheese','2023-05-16 10:02:19.113649',2,5,1),(43,'Bonjour','2023-05-16 10:02:21.677563',2,5,1),(44,'Jolly good day','2023-05-16 10:02:24.059166',2,5,1),(45,'Hello','2023-05-16 10:02:26.333032',2,5,1),(46,'make it a ten','2023-05-16 10:02:41.885024',2,5,1),(47,'make it a twelve','2023-05-16 10:02:59.499427',2,5,1),(48,'one more message','2023-05-16 12:49:10.639754',2,5,1),(49,'another message','2023-05-16 12:49:16.197367',2,5,1),(50,'Anothr message for you','2023-05-16 12:55:38.349841',2,5,1),(51,'Jolly good day','2023-05-16 13:00:58.841477',2,5,1),(52,'Jolly good day','2023-05-16 13:41:27.843418',2,5,1),(53,'Hello there','2023-05-16 14:01:20.740486',2,5,1),(54,'Bonjour','2023-05-16 14:05:16.620244',2,5,1),(55,'Bonjour','2023-05-16 14:05:40.965001',2,5,1),(56,'Bonjour','2023-05-16 14:06:38.893992',2,5,1),(57,'Hello','2023-05-16 14:16:04.690618',2,5,1),(58,'Bonjour','2023-05-16 14:18:12.616784',2,5,1),(59,'Hello there neighbour','2023-05-16 14:27:09.771256',2,5,1),(60,'Mac and cheese','2023-05-16 14:28:07.827738',2,5,1),(61,'Jolly good day','2023-05-16 14:29:53.434259',2,5,1),(62,'this is testing 101','2023-05-16 14:33:26.185391',2,5,1),(63,'hi there','2023-05-16 14:35:33.840041',2,5,1),(64,'Jolly good day','2023-05-16 16:41:47.524632',2,5,1),(65,'Hello there','2023-05-16 16:46:29.805522',2,5,1),(66,'Jolly good day','2023-05-16 16:47:14.807090',2,5,1),(67,'Hello there','2023-05-16 16:51:34.860256',2,5,1),(68,'Hello there','2023-05-16 16:54:32.729908',2,5,1),(69,'He I\'m Jesse','2023-05-16 16:56:35.940421',2,5,1),(70,'this is 101 testing','2023-05-16 16:58:19.829813',2,5,1),(71,'it\'s a happy ending after all','2023-05-16 17:00:10.526903',2,5,1),(72,'Jolly good day','2023-05-16 17:01:06.656243',2,5,1),(73,'Hi there','2023-05-16 17:01:58.749581',2,5,1),(74,'Hello there','2023-05-16 17:28:46.573614',5,2,1),(75,'Bonjour','2023-05-16 17:31:38.010760',2,5,1),(76,'Jolly good day','2023-05-16 17:35:10.853454',2,5,1),(77,'Jolly good day','2023-05-16 17:37:52.466140',2,5,1),(78,'Mac and Cheese','2023-05-16 17:39:24.013018',2,5,1),(79,'Jolly good day','2023-05-16 17:47:28.101148',2,5,1),(80,'Mac and Cheese','2023-05-16 17:56:02.468948',2,6,1),(81,'Hello there','2023-05-17 04:42:06.956521',2,5,1),(82,'Mac and Cheese','2023-05-17 04:43:06.314970',2,5,1),(83,'Hi its indianajones','2023-05-17 04:50:49.813012',6,5,1),(84,'hi its syed Faisal','2023-05-17 04:51:12.334474',3,5,1),(85,'Hi its abdullah','2023-05-17 04:51:22.400544',2,5,1),(86,'indiainajones','2023-05-17 04:56:51.529012',6,5,1),(87,'syedfaisal','2023-05-17 04:56:57.370125',3,5,1),(88,'abdullah9912','2023-05-17 04:57:02.723430',2,5,1),(89,'hi there','2023-05-17 05:01:21.846132',6,5,1),(90,'hola','2023-05-17 05:01:28.935691',3,5,1),(91,'bonjour','2023-05-17 05:01:34.766103',2,5,1),(92,'Jolly good day','2023-05-17 05:03:05.151821',2,5,1),(93,'Bonjour','2023-05-17 05:37:44.614751',2,5,1),(94,'Jolly good day','2023-05-17 05:39:42.714074',2,5,1),(95,'Bonjour','2023-05-17 06:05:53.315201',2,5,1),(96,'Hello from Syed Faisal','2023-05-17 06:06:54.616300',3,5,1),(97,'Hello from Indiana Jones','2023-05-17 06:07:06.302969',6,5,1),(98,'Hello from Abdullah','2023-05-17 06:07:20.224926',2,5,1),(99,'Hello there','2023-05-19 04:19:51.008839',2,5,1),(100,NULL,'2023-05-19 17:57:14.967055',NULL,NULL,0),(101,NULL,'2023-05-19 17:58:17.488877',NULL,NULL,0),(102,NULL,'2023-05-19 17:59:47.618803',NULL,NULL,0),(103,NULL,'2023-05-19 18:00:27.540843',NULL,NULL,0),(104,NULL,'2023-05-19 18:00:41.036495',NULL,NULL,0),(105,NULL,'2023-05-19 18:00:52.134917',NULL,NULL,0),(106,NULL,'2023-05-19 18:01:33.781194',NULL,NULL,0),(107,'Testing via API again','2023-05-19 18:06:46.440393',5,2,1),(108,'Testing from react native app','2023-05-19 18:39:08.600361',5,2,1),(109,'Hello sending message to app','2023-05-20 06:03:24.893800',2,5,1),(110,'Hello testing again','2023-05-20 06:04:59.874816',2,5,1),(111,'Hello there','2023-05-20 06:13:12.366493',2,3,0),(112,'hello','2023-05-20 14:15:00.077878',2,3,0),(113,'Jolly good day','2023-05-20 15:56:17.414190',2,5,1),(114,'message','2023-05-20 16:29:44.929807',5,2,1);
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

-- Dump completed on 2023-05-20 22:20:09

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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add contact',7,'add_contact'),(26,'Can change contact',7,'change_contact'),(27,'Can delete contact',7,'delete_contact'),(28,'Can view contact',7,'view_contact'),(29,'Can add message',8,'add_message'),(30,'Can change message',8,'change_message'),(31,'Can delete message',8,'delete_message'),(32,'Can view message',8,'view_message');
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$cCJ7zPLJBTUNyTgbl4a8Et$14kTpxDPEMHAJo/3dWvqhi2yJ9I65ebFi3rKWMKxG9c=','2023-05-12 06:09:52.797363',1,'admin','','','',1,1,'2023-04-19 09:41:33.123615'),(3,'pbkdf2_sha256$260000$XDCTskVb16NbbXMLpplx14$LsDXTNgRAcOjDVl+vFzOdEPduDK0zP2eSu6nJUKAvfg=',NULL,0,'george','George','Clooney','',0,1,'2023-04-19 12:04:20.000000'),(4,'pbkdf2_sha256$260000$i9byp3tjcW6BvvVa9sL8c5$t77fhfx/0QP78yg4G4ugo98yUsBRKGmpkMOjmmPRQQA=','2023-05-11 01:16:12.308222',0,'Abdullah9912','Abdullah','Khan','',0,1,'2023-04-19 12:06:54.000000'),(5,'pbkdf2_sha256$260000$TCoYlC2FOAjFl2avD39E46$SU93Jje5MxcyUUN29DvnnmJezdk7aVVpDZD1BPJbMjE=','2023-05-12 06:10:04.986273',0,'syedfaisal','Syed','Faisal','',0,1,'2023-04-19 12:21:09.995519'),(6,'pbkdf2_sha256$260000$KpDj8LbqzPrZCd41C8s9EU$1TJHKsAxFp57U0u56fuEqN2A0XUlIxfEcbWmO00KAFQ=','2023-05-12 06:09:07.732900',0,'JohnAnd','John','Anderson','',0,1,'2023-04-19 12:22:16.025799'),(7,'pbkdf2_sha256$260000$9dAMUCjj9ePpddaJFquBJu$bM6AWIKv9fWBFQpfY8agZ+6DRWnLZY8eFERhbsRo1Hg=',NULL,0,'nas123','Nabeel','Shareef','',0,1,'2023-04-19 12:22:58.846920'),(9,'pbkdf2_sha256$260000$URT3HawVtWPcGfURxN7vHZ$Cn4BT0Q7fh+uB2MSg8hyeabs0dYM+tYA02cEHM60nvE=',NULL,0,'johndoe','John','Doe','',0,1,'2023-04-20 10:35:44.237341'),(10,'pbkdf2_sha256$260000$hJtKsM8DPMckU0B4wPBxZ7$8Hw2cuI5bP3pqul0+EA+FvBsaaRPWs5U3Cwfby2drGw=',NULL,0,'olivertwist','Oliver','Twist','',0,1,'2023-04-20 10:36:45.435028'),(11,'pbkdf2_sha256$260000$3BjPBex8mew9iLJIwqTWyK$UBmQLEEYJU7dxx3h70I10zCfAeJOC3BsaRaJ+pF9VXU=','2023-04-24 04:38:18.358922',0,'indianajones','Indiana','Jones','',0,1,'2023-04-20 10:37:43.472446');
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-04-19 12:04:20.912421','3','george',1,'[{\"added\": {}}]',4,1),(2,'2023-04-19 12:04:47.875726','3','george',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]',4,1),(3,'2023-04-20 10:33:59.579959','4','Abdullah9912',2,'[{\"changed\": {\"fields\": [\"Last name\"]}}]',4,1),(4,'2023-04-20 10:34:11.899093','2','Contact object (2)',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',7,1),(5,'2023-04-21 09:12:14.762046','1','Contact object (1)',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',7,1),(6,'2023-04-24 04:36:55.973582','1','Message object (1)',1,'[{\"added\": {}}]',8,1),(7,'2023-04-24 04:37:18.874520','2','Message object (2)',1,'[{\"added\": {}}]',8,1),(8,'2023-04-24 04:37:37.260251','3','Message object (3)',1,'[{\"added\": {}}]',8,1),(9,'2023-04-24 04:37:53.065023','4','Message object (4)',1,'[{\"added\": {}}]',8,1),(10,'2023-05-11 17:07:03.843050','5','syedfaisal',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,1),(11,'2023-05-11 17:26:54.428180','6','JohnAnd',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'myapp','contact'),(8,'myapp','message'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-04-18 11:08:27.512602'),(2,'auth','0001_initial','2023-04-18 11:08:28.339018'),(3,'admin','0001_initial','2023-04-18 11:08:28.518583'),(4,'admin','0002_logentry_remove_auto_add','2023-04-18 11:08:28.534564'),(5,'admin','0003_logentry_add_action_flag_choices','2023-04-18 11:08:28.555588'),(6,'contenttypes','0002_remove_content_type_name','2023-04-18 11:08:28.715028'),(7,'auth','0002_alter_permission_name_max_length','2023-04-18 11:08:28.787001'),(8,'auth','0003_alter_user_email_max_length','2023-04-18 11:08:28.849236'),(9,'auth','0004_alter_user_username_opts','2023-04-18 11:08:28.874657'),(10,'auth','0005_alter_user_last_login_null','2023-04-18 11:08:28.958968'),(11,'auth','0006_require_contenttypes_0002','2023-04-18 11:08:28.966184'),(12,'auth','0007_alter_validators_add_error_messages','2023-04-18 11:08:28.985723'),(13,'auth','0008_alter_user_username_max_length','2023-04-18 11:08:29.081345'),(14,'auth','0009_alter_user_last_name_max_length','2023-04-18 11:08:29.175112'),(15,'auth','0010_alter_group_name_max_length','2023-04-18 11:08:29.229069'),(16,'auth','0011_update_proxy_permissions','2023-04-18 11:08:29.251965'),(17,'auth','0012_alter_user_first_name_max_length','2023-04-18 11:08:29.338789'),(18,'sessions','0001_initial','2023-04-18 11:08:29.391763'),(19,'myapp','0001_initial','2023-04-19 12:04:13.969283'),(20,'myapp','0002_auto_20230421_0949','2023-04-21 09:49:45.186703');
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
INSERT INTO `django_session` VALUES ('4fstdb7smathkcwxeqpu7bex0l404bvb','.eJxVjEsOAiEQBe_C2pAB-enSvWcg3XQjowaSYWZlvLuSzEK3VfXeS0TY1hK3zkucSZyFFYdfhpAeXIegO9Rbk6nVdZlRjkTutstrI35e9vbvoEAv37X3SOyMxlOm4KYMTrEGq4wj1tlYGzg5DCYQsfJHr1FNg7HlEBCceH8A8804Sw:1px9lM:tJR4RA0xpQ8k0dYTrk4LEFPQl9J7b-gXkmG0_VUUAew','2023-05-25 17:07:32.115552'),('72mnhpy4t4d4gigk7wzfspzz2222ui6a','.eJxVjEsOAiEQBe_C2pAB-enSvWcg3XQjowaSYWZlvLuSzEK3VfXeS0TY1hK3zkucSZyFFYdfhpAeXIegO9Rbk6nVdZlRjkTutstrI35e9vbvoEAv37X3SOyMxlOm4KYMTrEGq4wj1tlYGzg5DCYQsfJHr1FNg7HlEBCceH8A8804Sw:1pxLye:K-Wcx15ppZy58MzXOfC8DzdOH4o4nftZGkS00bhUDpE','2023-05-26 06:10:04.993616'),('7gth311q1pqb5g01k9npai2miurk8qyu','.eJxVjEEOwiAQRe_C2hAIwlCX7j0DmWEGqRqalHbVeHdt0oVu_3vvbyrhutS0dpnTyOqirFWn35EwP6XthB_Y7pPOU1vmkfSu6IN2fZtYXtfD_Tuo2Ou3jt6hkI8BAQcfxESAjFnMQALBIQFQIWEowCbaYBCzYXEA_mwsF_X-AB7iOMs:1pqnxy:104TnCb5yUKZnAO-zbQ3w9cGjAB3tdPQ1BQFTlzBYXo','2023-05-08 04:38:18.362208'),('vcid58gjum1vcl4y8kjyca9g6uwzlst5','.eJxVjDsOwjAQBe_iGlmO8ZeSPmew1rtrHECOFCcV4u4QKQW0b2beSyTY1pq2zkuaSFyEE6ffLQM-uO2A7tBus8S5rcuU5a7Ig3Y5zsTP6-H-HVTo9VsDGdbZea3L4IFpiFZFFYt39lwAFRoHaBRyxECIzoDPPqC1pA0EBPH-APVrOJU:1pxA4S:SugvOJfB97Puspvwx0v8PD0Tb6eRcg_Po6fTuFzIzqU','2023-05-25 17:27:16.350991');
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
  KEY `myapp_contact_user_id_706cf770_fk_auth_user_id` (`user_id`),
  CONSTRAINT `myapp_contact_user_id_706cf770_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_contact`
--

LOCK TABLES `myapp_contact` WRITE;
/*!40000 ALTER TABLE `myapp_contact` DISABLE KEYS */;
INSERT INTO `myapp_contact` VALUES (1,'George Clooney',3),(2,'Abdullah Khan',4),(3,'Syed Faisal',5),(4,'John Anderson',6),(5,'Nabeel Shareef',7),(6,'John Doe',9),(7,'Oliver Twist',10),(8,'Indiana Jones',11);
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
  `created_at` date NOT NULL,
  `from_user_id` int DEFAULT NULL,
  `to_user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_message_from_user_id_e5962b9a_fk_auth_user_id` (`from_user_id`),
  KEY `myapp_message_to_user_id_f335846b_fk_auth_user_id` (`to_user_id`),
  CONSTRAINT `myapp_message_from_user_id_e5962b9a_fk_auth_user_id` FOREIGN KEY (`from_user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `myapp_message_to_user_id_f335846b_fk_auth_user_id` FOREIGN KEY (`to_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_message`
--

LOCK TABLES `myapp_message` WRITE;
/*!40000 ALTER TABLE `myapp_message` DISABLE KEYS */;
INSERT INTO `myapp_message` VALUES (1,'Hello','2023-04-24',11,4),(2,'Hi\r\nHow are you?????','2023-04-24',4,11),(3,'Fine........wau?','2023-04-24',11,4),(4,'never been better','2023-04-24',4,11),(5,'this is a test string','2023-04-24',11,4),(6,'hellllloooooo??????','2023-04-24',11,4),(7,'hi','2023-04-24',11,4),(8,'hello','2023-04-24',11,4),(13,'hello','2023-04-24',11,4),(14,'hello','2023-04-24',11,4),(15,'Hello','2023-05-11',4,11),(16,'This is Indiana Jones','2023-05-11',4,11),(17,'??\r\n','2023-05-11',4,11),(42,'Type yoru message here\r\n','2023-05-11',4,11),(43,'Bonjour','2023-05-11',4,3),(44,'Bonjour','2023-05-11',4,11),(45,'Hola amigo','2023-05-11',4,11),(46,'Hola amigo','2023-05-11',4,11),(47,'Bonjour','2023-05-11',4,11),(48,'Hello','2023-05-11',4,11),(49,'Mac and Cheese','2023-05-11',4,6),(50,'Jolly good day','2023-05-11',4,11),(51,'Hello','2023-05-11',4,11),(52,'Hello','2023-05-11',4,11),(53,'Hello','2023-05-11',4,11),(54,'Hello','2023-05-11',4,11),(55,'Hello','2023-05-11',4,11),(56,'Hello','2023-05-11',4,11),(57,'Hello','2023-05-11',4,11),(58,'Hello','2023-05-11',4,11),(59,'Hello','2023-05-11',4,11),(60,'Hello','2023-05-11',4,11),(61,'Hello','2023-05-11',4,11),(62,'Hello','2023-05-11',4,11),(63,'Hello','2023-05-11',4,11),(64,'Hello','2023-05-11',4,11),(65,'Hello','2023-05-11',4,11),(66,'Hello','2023-05-11',4,9),(67,'Hello','2023-05-11',4,9),(68,'Hello','2023-05-11',4,9),(69,'Hello','2023-05-11',4,9),(70,'Hello','2023-05-11',4,9),(71,'Hello','2023-05-11',4,9),(72,'Hello','2023-05-11',4,9),(73,'Bonjour','2023-05-11',4,5),(74,'Mac and Cheese','2023-05-11',4,5),(75,'Hi there','2023-05-11',4,5),(76,'Jolly good day','2023-05-11',4,5),(77,'Bonjour','2023-05-11',4,5),(78,'Bonjour','2023-05-11',4,5),(79,'Mac and Cheese','2023-05-11',4,5),(80,'Mac and Cheese','2023-05-11',4,5),(81,'are you there','2023-05-11',4,5),(82,'Jolly good day','2023-05-11',5,4),(83,'Jolly good day','2023-05-11',5,4),(84,'Jolly good','2023-05-11',5,4),(85,'have a nice day','2023-05-11',4,5),(86,'bon apetite','2023-05-11',5,4),(87,'how are you','2023-05-11',4,5),(88,'let us go','2023-05-11',4,5),(89,'hello how are you','2023-05-11',6,5),(90,'I am fine. How are you','2023-05-11',5,6),(91,'Hello there','2023-05-11',5,6),(92,'Bonjour','2023-05-11',5,6),(93,'Hello again','2023-05-12',6,5),(94,'Are you up for badminton??','2023-05-12',5,6),(95,'Mac and Cheese','2023-05-12',6,5),(96,'Mac and Cheese','2023-05-12',6,5),(97,'Jolly good day','2023-05-12',5,6),(98,'There is a stranger at your door','2023-05-12',6,5),(99,'WHERE???','2023-05-12',5,6),(100,'Bonjour','2023-05-12',5,6),(101,'Hola','2023-05-12',6,5),(102,'Mon Ami','2023-05-12',6,5),(103,'Je Mapelle','2023-05-12',5,6),(104,'qual es tu nombre','2023-05-12',6,5),(105,'you are terminated','2023-05-12',5,6),(106,'You are terminated','2023-05-12',6,5);
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

-- Dump completed on 2023-05-12 14:58:49

CREATE DATABASE  IF NOT EXISTS `keycloak` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `keycloak`;
-- MySQL dump 10.13  Distrib 8.0.25, for Linux (x86_64)
--
-- Host: localhost    Database: keycloak
-- ------------------------------------------------------
-- Server version	5.7.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ADMIN_EVENT_ENTITY`
--

DROP TABLE IF EXISTS `ADMIN_EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ADMIN_EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `ADMIN_EVENT_TIME` bigint(20) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `OPERATION_TYPE` varchar(255) DEFAULT NULL,
  `AUTH_REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_CLIENT_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `RESOURCE_PATH` varchar(2550) DEFAULT NULL,
  `REPRESENTATION` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `RESOURCE_TYPE` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_EVENT_ENTITY`
--

LOCK TABLES `ADMIN_EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ASSOCIATED_POLICY`
--

DROP TABLE IF EXISTS `ASSOCIATED_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ASSOCIATED_POLICY` (
  `POLICY_ID` varchar(36) NOT NULL,
  `ASSOCIATED_POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`POLICY_ID`,`ASSOCIATED_POLICY_ID`),
  KEY `IDX_ASSOC_POL_ASSOC_POL_ID` (`ASSOCIATED_POLICY_ID`),
  CONSTRAINT `FK_FRSR5S213XCX4WNKOG82SSRFY` FOREIGN KEY (`ASSOCIATED_POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPAS14XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASSOCIATED_POLICY`
--

LOCK TABLES `ASSOCIATED_POLICY` WRITE;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_EXECUTION`
--

DROP TABLE IF EXISTS `AUTHENTICATION_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_EXECUTION` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `AUTHENTICATOR` varchar(36) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `REQUIREMENT` int(11) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `AUTHENTICATOR_FLOW` bit(1) NOT NULL DEFAULT b'0',
  `AUTH_FLOW_ID` varchar(36) DEFAULT NULL,
  `AUTH_CONFIG` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_EXEC_REALM_FLOW` (`REALM_ID`,`FLOW_ID`),
  KEY `IDX_AUTH_EXEC_FLOW` (`FLOW_ID`),
  CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `AUTHENTICATION_FLOW` (`ID`),
  CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_EXECUTION`
--

LOCK TABLES `AUTHENTICATION_EXECUTION` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('0040fe17-d6c5-4ce3-bbf7-b43ad7e09134',NULL,NULL,'master','51fc4663-55aa-4638-b327-3b3d708a3868',0,20,_binary '','7e95d04d-ac28-4fcc-a758-6159e2bdf0ae',NULL),('05f7e25f-9f5a-405f-ad4e-3c5459971c1a',NULL,'registration-profile-action','master','9e3fed70-2fdc-4e1a-9515-f7078aa3cfe7',0,40,_binary '\0',NULL,NULL),('07fb4222-c105-43b5-991b-210cafc0102b',NULL,NULL,'ias','a2532804-32ee-4e45-a330-ec32bc43a374',0,20,_binary '','697a3f28-c687-4baf-9393-f6350bfd837e',NULL),('0bc69817-19a7-4efc-9a32-1a2a9be07d83',NULL,NULL,'ias','2a203b3a-dd1f-469b-8785-f63c7a48efcf',2,20,_binary '','79feb47e-2ba9-413f-90ab-b72156e9109a',NULL),('0e7e138b-a18b-431b-9d70-bd8940aad10a',NULL,'no-cookie-redirect','ias','48a2cbbc-56e9-4f9c-a6c3-d933bbaf3195',0,10,_binary '\0',NULL,NULL),('10ca592b-5e65-477c-b4ce-12065a636021',NULL,'auth-cookie','ias','57366c19-cb5c-451b-aa8c-ee6dd681222a',2,10,_binary '\0',NULL,NULL),('125bdc76-91ee-4ecb-8f27-564b8c874fc1',NULL,NULL,'master','f258b9e9-dfee-4b5d-a182-ed6bcb184aac',0,20,_binary '','3025c269-07f1-4692-ad83-1af317a09883',NULL),('1322272d-686d-480b-b01d-8e94f3e4d1fb',NULL,'reset-otp','ias','c3f8c298-5442-4062-b974-edae0f324a20',0,20,_binary '\0',NULL,NULL),('194c74f2-c71e-46e6-951e-f8fbffff4a43',NULL,'identity-provider-redirector','ias','57366c19-cb5c-451b-aa8c-ee6dd681222a',2,25,_binary '\0',NULL,NULL),('1a8b7718-b1d4-448f-98b2-170c2593738e',NULL,NULL,'ias','48a2cbbc-56e9-4f9c-a6c3-d933bbaf3195',0,20,_binary '','000ce055-114c-4aa0-ba40-7669bbe7e1cd',NULL),('1bfe5665-be83-4785-9fe1-25cf9c75f3f8',NULL,NULL,'ias','3ff6652a-a694-4171-b95e-4807dfba0bc3',1,20,_binary '','45f622d8-8f87-4167-8b89-1ca004a419b5',NULL),('24b1f165-fec2-4e20-8c48-c5a2df82ecfe',NULL,'conditional-user-configured','ias','45f622d8-8f87-4167-8b89-1ca004a419b5',0,10,_binary '\0',NULL,NULL),('27f28e38-6856-45f7-8ccb-2c1807930ab1',NULL,'registration-user-creation','master','9e3fed70-2fdc-4e1a-9515-f7078aa3cfe7',0,20,_binary '\0',NULL,NULL),('2e5b05ca-dc9d-4764-b387-7510fffe78a5',NULL,'registration-profile-action','ias','5a0459b7-3371-4eb6-85c1-1badab7b5959',0,40,_binary '\0',NULL,NULL),('2f1c63dd-44d4-4831-ab13-bc9fef793e45',NULL,'client-jwt','ias','7ce6f7f0-55bc-4bea-9cab-2d8939d4fd6b',2,20,_binary '\0',NULL,NULL),('303fb4b7-1cfa-4d12-ad26-eb2386905a5f',NULL,'direct-grant-validate-password','master','58e526f1-ae3e-4933-a3a9-6d132d89ac78',0,20,_binary '\0',NULL,NULL),('31513ad7-f011-42ba-adf2-1d127eca61ec',NULL,'basic-auth','ias','000ce055-114c-4aa0-ba40-7669bbe7e1cd',0,10,_binary '\0',NULL,NULL),('346c70db-65ca-4ea3-9dce-5eb4f47d567d',NULL,'client-jwt','master','c9258cb2-365b-43d9-8a23-33193a4ba0ab',2,20,_binary '\0',NULL,NULL),('34c183ef-f657-46fa-ba89-418aaaa55788',NULL,'auth-spnego','master','a6c70792-09c0-4b90-9a67-95c3185a38c3',3,20,_binary '\0',NULL,NULL),('422690ea-891f-4192-8262-def6eee4495b',NULL,'auth-username-password-form','ias','3ff6652a-a694-4171-b95e-4807dfba0bc3',0,10,_binary '\0',NULL,NULL),('4265b88b-35d3-4875-a80b-7fe17ad537e1',NULL,'registration-recaptcha-action','ias','5a0459b7-3371-4eb6-85c1-1badab7b5959',3,60,_binary '\0',NULL,NULL),('42de1128-2436-47bc-8c94-41e6c18cf7c4',NULL,'client-secret','master','c9258cb2-365b-43d9-8a23-33193a4ba0ab',2,10,_binary '\0',NULL,NULL),('436404e6-7042-45d8-894d-e52f2a5e6434',NULL,'client-secret-jwt','ias','7ce6f7f0-55bc-4bea-9cab-2d8939d4fd6b',2,30,_binary '\0',NULL,NULL),('4555d670-0f9f-4cbb-9422-09d922408e6e',NULL,'client-secret','ias','7ce6f7f0-55bc-4bea-9cab-2d8939d4fd6b',2,10,_binary '\0',NULL,NULL),('599a1944-d17b-46c6-8512-dd282f8df6ea',NULL,'auth-otp-form','ias','45f622d8-8f87-4167-8b89-1ca004a419b5',0,20,_binary '\0',NULL,NULL),('5a547649-c5ce-416b-8b05-6748c0a2bd12',NULL,'basic-auth-otp','ias','000ce055-114c-4aa0-ba40-7669bbe7e1cd',3,20,_binary '\0',NULL,NULL),('5ad5da73-6de2-4f9e-9915-ebf5acdc6de6',NULL,NULL,'master','3025c269-07f1-4692-ad83-1af317a09883',2,20,_binary '','51fc4663-55aa-4638-b327-3b3d708a3868',NULL),('5c239683-de53-4d21-b89c-ef154b0e3893',NULL,'client-x509','master','c9258cb2-365b-43d9-8a23-33193a4ba0ab',2,40,_binary '\0',NULL,NULL),('5e027823-407f-4b10-b73a-926715f48725',NULL,'conditional-user-configured','ias','8be23980-557f-42da-9b48-50eba3ec227b',0,10,_binary '\0',NULL,NULL),('5ed2884c-e8be-488e-ba57-e77a37a695bf',NULL,'reset-password','ias','aa7c056e-e2ed-40f7-9f91-0c4e8274ba07',0,30,_binary '\0',NULL,NULL),('62c8e0cd-9abd-4d21-a0e1-e6aff31d91e9',NULL,'auth-spnego','ias','57366c19-cb5c-451b-aa8c-ee6dd681222a',3,20,_binary '\0',NULL,NULL),('6664ec27-f5d3-4b86-ba45-bdb2e3893963',NULL,NULL,'master','6c1d01a3-e03b-4d94-8821-fc8c3c3e3ffc',1,20,_binary '','43f85967-4b98-462d-b625-280062c2ce32',NULL),('67667ef1-1b04-4d89-b51b-83a9430c8910',NULL,NULL,'master','58e526f1-ae3e-4933-a3a9-6d132d89ac78',1,30,_binary '','0bba8549-58b3-4859-bde2-a3ae43c1721f',NULL),('6c72a3c0-2c94-487f-9da2-21a941185a39',NULL,'idp-username-password-form','master','302f56de-6902-421d-bed9-2e3f13f8323f',0,10,_binary '\0',NULL,NULL),('6e830d80-ab49-4572-9677-30e9707782fa',NULL,'auth-otp-form','master','43f85967-4b98-462d-b625-280062c2ce32',0,20,_binary '\0',NULL,NULL),('747b8904-3d98-49e2-b09b-a8a535b55aec',NULL,'auth-otp-form','ias','8be23980-557f-42da-9b48-50eba3ec227b',0,20,_binary '\0',NULL,NULL),('782baad4-c85e-4b27-9354-61f5335d5a8a',NULL,NULL,'ias','2c859f7b-6f9a-401e-a887-593210959ce8',1,30,_binary '','5ca87f17-6c59-4025-beae-347d34870841',NULL),('797d1cfb-95be-4d81-bfef-d22123f32bcc',NULL,'auth-cookie','master','a6c70792-09c0-4b90-9a67-95c3185a38c3',2,10,_binary '\0',NULL,NULL),('79ecd76f-fe22-4a88-83ec-ef44d2b8892b',NULL,'idp-confirm-link','ias','2e0ecd18-730b-438b-8eba-3ece618ecccd',0,10,_binary '\0',NULL,NULL),('7b5d6b13-bc2f-4f45-833f-495e1ed9554a',NULL,'no-cookie-redirect','master','c01fa6a8-f3de-4190-b9c5-90383fd9ada5',0,10,_binary '\0',NULL,NULL),('7c428abf-2670-4b9a-b9b7-bf8069d99b47',NULL,NULL,'ias','2e0ecd18-730b-438b-8eba-3ece618ecccd',0,20,_binary '','2a203b3a-dd1f-469b-8785-f63c7a48efcf',NULL),('7f107f7a-5adc-4c7a-ae34-14aee1df4633',NULL,'docker-http-basic-authenticator','ias','9629bd8f-c7cd-471f-a86e-707bae414ba9',0,10,_binary '\0',NULL,NULL),('81e2f197-4c2c-402d-84e0-b44b58cb09e2',NULL,'client-x509','ias','7ce6f7f0-55bc-4bea-9cab-2d8939d4fd6b',2,40,_binary '\0',NULL,NULL),('8242f367-efcc-410c-a17a-75403600d6dc',NULL,'direct-grant-validate-otp','ias','5ca87f17-6c59-4025-beae-347d34870841',0,20,_binary '\0',NULL,NULL),('873a89a8-f10b-454b-bb40-20e1e96891d8',NULL,'http-basic-authenticator','master','9a3dc3f0-4464-4814-9cb7-8019c0b93c61',0,10,_binary '\0',NULL,NULL),('8c15abb4-7a61-4a0d-85a5-c37b4f716425',NULL,NULL,'master','7e95d04d-ac28-4fcc-a758-6159e2bdf0ae',2,20,_binary '','302f56de-6902-421d-bed9-2e3f13f8323f',NULL),('8edadc73-9826-4a9c-81ce-903588c20ef5',NULL,'idp-username-password-form','ias','79feb47e-2ba9-413f-90ab-b72156e9109a',0,10,_binary '\0',NULL,NULL),('91bcfbc7-25a6-40c4-9c6c-dcafc66af108',NULL,NULL,'master','1a6c254f-dd72-41ac-b7e2-44ea9eec5904',1,40,_binary '','fa015c4d-9944-4c2a-8c90-678a4644d001',NULL),('93f8f536-3e2f-4fef-9931-da6733e537d4',NULL,'conditional-user-configured','master','0bba8549-58b3-4859-bde2-a3ae43c1721f',0,10,_binary '\0',NULL,NULL),('97daae41-0686-4c3f-aca0-07c9254a4e22',NULL,'basic-auth','master','6c636f96-4c5e-4db7-a3f7-bb09a9c5a892',0,10,_binary '\0',NULL,NULL),('9a701946-bbc2-4932-b016-56faeed9a894',NULL,'idp-confirm-link','master','51fc4663-55aa-4638-b327-3b3d708a3868',0,10,_binary '\0',NULL,NULL),('9f3285d8-b7e7-4fd0-a935-e15061ee924c',NULL,'direct-grant-validate-otp','master','0bba8549-58b3-4859-bde2-a3ae43c1721f',0,20,_binary '\0',NULL,NULL),('a085fac8-8b3b-41d6-8905-9c997dcd47bf',NULL,'reset-password','master','1a6c254f-dd72-41ac-b7e2-44ea9eec5904',0,30,_binary '\0',NULL,NULL),('a0bb4449-b777-4f71-be49-2a65ded9a0bb',NULL,'idp-create-user-if-unique','ias','697a3f28-c687-4baf-9393-f6350bfd837e',2,10,_binary '\0',NULL,'ecb36786-1d62-43af-8c17-bdddce14e733'),('a37d5dcf-73f2-4408-a2d4-699772339127',NULL,'reset-credential-email','master','1a6c254f-dd72-41ac-b7e2-44ea9eec5904',0,20,_binary '\0',NULL,NULL),('a476bb8a-c68f-4c9e-9e0b-b41c54828e39',NULL,NULL,'master','302f56de-6902-421d-bed9-2e3f13f8323f',1,20,_binary '','525a1728-3898-44fc-8fc9-9dcf57f6bc0d',NULL),('a63bc47b-dc53-432f-a53f-abe7fa1b8f70',NULL,'conditional-user-configured','master','43f85967-4b98-462d-b625-280062c2ce32',0,10,_binary '\0',NULL,NULL),('a7074995-c3ef-4a6c-94ee-35d761299789',NULL,'conditional-user-configured','ias','5ca87f17-6c59-4025-beae-347d34870841',0,10,_binary '\0',NULL,NULL),('a91d4d6e-cbbb-4f3e-b1da-30749b57b144',NULL,NULL,'ias','57366c19-cb5c-451b-aa8c-ee6dd681222a',2,30,_binary '','3ff6652a-a694-4171-b95e-4807dfba0bc3',NULL),('adfb9515-d2b7-4a2f-82d2-a0caea486ae5',NULL,'registration-password-action','master','9e3fed70-2fdc-4e1a-9515-f7078aa3cfe7',0,50,_binary '\0',NULL,NULL),('b1dbf02b-6d6f-45b8-8d32-54df0c724ecf',NULL,NULL,'ias','79feb47e-2ba9-413f-90ab-b72156e9109a',1,20,_binary '','8be23980-557f-42da-9b48-50eba3ec227b',NULL),('b47c68d9-0661-45ab-a152-487f2e561b96',NULL,'conditional-user-configured','ias','c3f8c298-5442-4062-b974-edae0f324a20',0,10,_binary '\0',NULL,NULL),('b50a0487-3053-4027-94c8-ab083155a2bc',NULL,'reset-otp','master','fa015c4d-9944-4c2a-8c90-678a4644d001',0,20,_binary '\0',NULL,NULL),('b8730bef-e469-4383-b8c9-fd6730dde0a6',NULL,'idp-create-user-if-unique','master','3025c269-07f1-4692-ad83-1af317a09883',2,10,_binary '\0',NULL,'5b5e79ec-5297-45fe-aa5c-7effdadeabb7'),('b972b7f5-ce47-4048-b2dc-bc3535b4762b',NULL,'identity-provider-redirector','master','a6c70792-09c0-4b90-9a67-95c3185a38c3',2,25,_binary '\0',NULL,NULL),('bad2036b-c601-4d60-b45e-f7dd054273d0',NULL,'registration-password-action','ias','5a0459b7-3371-4eb6-85c1-1badab7b5959',0,50,_binary '\0',NULL,NULL),('bdc3cfb3-2f36-4a70-bfd1-667501979bdd',NULL,'auth-otp-form','master','525a1728-3898-44fc-8fc9-9dcf57f6bc0d',0,20,_binary '\0',NULL,NULL),('bf2cef3c-eeff-43c5-a9bd-30ea34e088a0',NULL,NULL,'ias','697a3f28-c687-4baf-9393-f6350bfd837e',2,20,_binary '','2e0ecd18-730b-438b-8eba-3ece618ecccd',NULL),('c0807f43-405b-488e-ac35-de540c5ec737',NULL,'conditional-user-configured','master','525a1728-3898-44fc-8fc9-9dcf57f6bc0d',0,10,_binary '\0',NULL,NULL),('c17fb3a8-db6b-4135-aad3-1c81de9d2f1a',NULL,'auth-spnego','ias','000ce055-114c-4aa0-ba40-7669bbe7e1cd',3,30,_binary '\0',NULL,NULL),('c1e8878f-60d5-4a37-98e3-9f7d5c299479',NULL,NULL,'master','c01fa6a8-f3de-4190-b9c5-90383fd9ada5',0,20,_binary '','6c636f96-4c5e-4db7-a3f7-bb09a9c5a892',NULL),('c207b6a8-39dc-4120-91f4-da0b4527f2a9',NULL,'idp-email-verification','ias','2a203b3a-dd1f-469b-8785-f63c7a48efcf',2,10,_binary '\0',NULL,NULL),('c5235d5f-c02e-4467-b0e8-83259ce1de17',NULL,'docker-http-basic-authenticator','master','7c468234-f615-48b5-9c6e-792582d9ec53',0,10,_binary '\0',NULL,NULL),('c6a511eb-8986-4459-9577-a8a8b51499ff',NULL,'reset-credentials-choose-user','ias','aa7c056e-e2ed-40f7-9f91-0c4e8274ba07',0,10,_binary '\0',NULL,NULL),('c8c9699a-0124-426f-afb5-e49434d824c0',NULL,'reset-credentials-choose-user','master','1a6c254f-dd72-41ac-b7e2-44ea9eec5904',0,10,_binary '\0',NULL,NULL),('ca46d2ac-4684-4fa5-a95b-22f5152a3ead',NULL,NULL,'ias','aa7c056e-e2ed-40f7-9f91-0c4e8274ba07',1,40,_binary '','c3f8c298-5442-4062-b974-edae0f324a20',NULL),('cbd26db8-ceda-497a-b475-598babe5fdeb',NULL,'basic-auth-otp','master','6c636f96-4c5e-4db7-a3f7-bb09a9c5a892',3,20,_binary '\0',NULL,NULL),('cc1b1e3e-02a7-4d27-9016-2eaf940156d7',NULL,'registration-page-form','ias','1df33ea9-4ad5-4ce7-b3dc-da3072ca1363',0,10,_binary '','5a0459b7-3371-4eb6-85c1-1badab7b5959',NULL),('d4acee50-c7f3-452e-b4fb-e36ed89e40cb',NULL,NULL,'master','a6c70792-09c0-4b90-9a67-95c3185a38c3',2,30,_binary '','6c1d01a3-e03b-4d94-8821-fc8c3c3e3ffc',NULL),('d6baa3ff-888c-496e-8b69-e0797645ac0b',NULL,'auth-spnego','master','6c636f96-4c5e-4db7-a3f7-bb09a9c5a892',3,30,_binary '\0',NULL,NULL),('d770b6af-ff29-4013-852a-ef86d5487655',NULL,'idp-review-profile','ias','a2532804-32ee-4e45-a330-ec32bc43a374',0,10,_binary '\0',NULL,'ad0f472d-29d8-43a4-95fa-25f579640edb'),('dd622ed6-f064-433c-9d6d-709cb29855ef',NULL,'registration-page-form','master','ec0b3d7b-0930-434a-a9d3-9a2ff587344c',0,10,_binary '','9e3fed70-2fdc-4e1a-9515-f7078aa3cfe7',NULL),('df2cae4c-5599-4c2e-9a63-5f21b076e9e1',NULL,'idp-review-profile','master','f258b9e9-dfee-4b5d-a182-ed6bcb184aac',0,10,_binary '\0',NULL,'f6b5bd9f-b1e9-4a18-8ce4-4b737a8a803f'),('e4f2e876-f69d-445c-b39b-4f96d7f3b857',NULL,'idp-email-verification','master','7e95d04d-ac28-4fcc-a758-6159e2bdf0ae',2,10,_binary '\0',NULL,NULL),('e6c6d8f9-5482-4e06-b313-617c92bf4f82',NULL,'direct-grant-validate-username','master','58e526f1-ae3e-4933-a3a9-6d132d89ac78',0,10,_binary '\0',NULL,NULL),('e89f36de-fc68-4ff0-8229-f2a596bbb9f8',NULL,'auth-username-password-form','master','6c1d01a3-e03b-4d94-8821-fc8c3c3e3ffc',0,10,_binary '\0',NULL,NULL),('ebc43853-3930-494f-956e-957a549c16ea',NULL,'registration-user-creation','ias','5a0459b7-3371-4eb6-85c1-1badab7b5959',0,20,_binary '\0',NULL,NULL),('ec657b1f-1c45-4e9b-92ad-719efaa6dd52',NULL,'http-basic-authenticator','ias','67d9e4ea-b7c0-49f7-8271-89524ca5d556',0,10,_binary '\0',NULL,NULL),('f263ff31-9afc-413a-91e8-adb37998da82',NULL,'client-secret-jwt','master','c9258cb2-365b-43d9-8a23-33193a4ba0ab',2,30,_binary '\0',NULL,NULL),('f88aa5c6-9894-458a-a1cb-d21354090cfc',NULL,'reset-credential-email','ias','aa7c056e-e2ed-40f7-9f91-0c4e8274ba07',0,20,_binary '\0',NULL,NULL),('fa37d41d-5dc3-41fb-a1bf-57eb390fe869',NULL,'registration-recaptcha-action','master','9e3fed70-2fdc-4e1a-9515-f7078aa3cfe7',3,60,_binary '\0',NULL,NULL),('fb33c10a-6e7e-43fe-b956-3bb7a08f1bbf',NULL,'direct-grant-validate-username','ias','2c859f7b-6f9a-401e-a887-593210959ce8',0,10,_binary '\0',NULL,NULL),('fdabeb8c-ec4e-4565-b079-1177cab750c1',NULL,'direct-grant-validate-password','ias','2c859f7b-6f9a-401e-a887-593210959ce8',0,20,_binary '\0',NULL,NULL),('fed737f1-65f2-4974-8d37-f2e364f5cd1a',NULL,'conditional-user-configured','master','fa015c4d-9944-4c2a-8c90-678a4644d001',0,10,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_FLOW`
--

DROP TABLE IF EXISTS `AUTHENTICATION_FLOW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_FLOW` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) NOT NULL DEFAULT 'basic-flow',
  `TOP_LEVEL` bit(1) NOT NULL DEFAULT b'0',
  `BUILT_IN` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_FLOW_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_FLOW`
--

LOCK TABLES `AUTHENTICATION_FLOW` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('000ce055-114c-4aa0-ba40-7669bbe7e1cd','Authentication Options','Authentication options.','ias','basic-flow',_binary '\0',_binary ''),('0bba8549-58b3-4859-bde2-a3ae43c1721f','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('1a6c254f-dd72-41ac-b7e2-44ea9eec5904','reset credentials','Reset credentials for a user if they forgot their password or something','master','basic-flow',_binary '',_binary ''),('1df33ea9-4ad5-4ce7-b3dc-da3072ca1363','registration','registration flow','ias','basic-flow',_binary '',_binary ''),('2a203b3a-dd1f-469b-8785-f63c7a48efcf','Account verification options','Method with which to verity the existing account','ias','basic-flow',_binary '\0',_binary ''),('2c859f7b-6f9a-401e-a887-593210959ce8','direct grant','OpenID Connect Resource Owner Grant','ias','basic-flow',_binary '',_binary ''),('2e0ecd18-730b-438b-8eba-3ece618ecccd','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','ias','basic-flow',_binary '\0',_binary ''),('3025c269-07f1-4692-ad83-1af317a09883','User creation or linking','Flow for the existing/non-existing user alternatives','master','basic-flow',_binary '\0',_binary ''),('302f56de-6902-421d-bed9-2e3f13f8323f','Verify Existing Account by Re-authentication','Reauthentication of existing account','master','basic-flow',_binary '\0',_binary ''),('3ff6652a-a694-4171-b95e-4807dfba0bc3','forms','Username, password, otp and other auth forms.','ias','basic-flow',_binary '\0',_binary ''),('43f85967-4b98-462d-b625-280062c2ce32','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('45f622d8-8f87-4167-8b89-1ca004a419b5','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','ias','basic-flow',_binary '\0',_binary ''),('48a2cbbc-56e9-4f9c-a6c3-d933bbaf3195','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','ias','basic-flow',_binary '',_binary ''),('51fc4663-55aa-4638-b327-3b3d708a3868','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','master','basic-flow',_binary '\0',_binary ''),('525a1728-3898-44fc-8fc9-9dcf57f6bc0d','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('57366c19-cb5c-451b-aa8c-ee6dd681222a','browser','browser based authentication','ias','basic-flow',_binary '',_binary ''),('58e526f1-ae3e-4933-a3a9-6d132d89ac78','direct grant','OpenID Connect Resource Owner Grant','master','basic-flow',_binary '',_binary ''),('5a0459b7-3371-4eb6-85c1-1badab7b5959','registration form','registration form','ias','form-flow',_binary '\0',_binary ''),('5ca87f17-6c59-4025-beae-347d34870841','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','ias','basic-flow',_binary '\0',_binary ''),('67d9e4ea-b7c0-49f7-8271-89524ca5d556','saml ecp','SAML ECP Profile Authentication Flow','ias','basic-flow',_binary '',_binary ''),('697a3f28-c687-4baf-9393-f6350bfd837e','User creation or linking','Flow for the existing/non-existing user alternatives','ias','basic-flow',_binary '\0',_binary ''),('6c1d01a3-e03b-4d94-8821-fc8c3c3e3ffc','forms','Username, password, otp and other auth forms.','master','basic-flow',_binary '\0',_binary ''),('6c636f96-4c5e-4db7-a3f7-bb09a9c5a892','Authentication Options','Authentication options.','master','basic-flow',_binary '\0',_binary ''),('79feb47e-2ba9-413f-90ab-b72156e9109a','Verify Existing Account by Re-authentication','Reauthentication of existing account','ias','basic-flow',_binary '\0',_binary ''),('7c468234-f615-48b5-9c6e-792582d9ec53','docker auth','Used by Docker clients to authenticate against the IDP','master','basic-flow',_binary '',_binary ''),('7ce6f7f0-55bc-4bea-9cab-2d8939d4fd6b','clients','Base authentication for clients','ias','client-flow',_binary '',_binary ''),('7e95d04d-ac28-4fcc-a758-6159e2bdf0ae','Account verification options','Method with which to verity the existing account','master','basic-flow',_binary '\0',_binary ''),('8be23980-557f-42da-9b48-50eba3ec227b','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','ias','basic-flow',_binary '\0',_binary ''),('9629bd8f-c7cd-471f-a86e-707bae414ba9','docker auth','Used by Docker clients to authenticate against the IDP','ias','basic-flow',_binary '',_binary ''),('9a3dc3f0-4464-4814-9cb7-8019c0b93c61','saml ecp','SAML ECP Profile Authentication Flow','master','basic-flow',_binary '',_binary ''),('9e3fed70-2fdc-4e1a-9515-f7078aa3cfe7','registration form','registration form','master','form-flow',_binary '\0',_binary ''),('a2532804-32ee-4e45-a330-ec32bc43a374','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','ias','basic-flow',_binary '',_binary ''),('a6c70792-09c0-4b90-9a67-95c3185a38c3','browser','browser based authentication','master','basic-flow',_binary '',_binary ''),('aa7c056e-e2ed-40f7-9f91-0c4e8274ba07','reset credentials','Reset credentials for a user if they forgot their password or something','ias','basic-flow',_binary '',_binary ''),('c01fa6a8-f3de-4190-b9c5-90383fd9ada5','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','master','basic-flow',_binary '',_binary ''),('c3f8c298-5442-4062-b974-edae0f324a20','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','ias','basic-flow',_binary '\0',_binary ''),('c9258cb2-365b-43d9-8a23-33193a4ba0ab','clients','Base authentication for clients','master','client-flow',_binary '',_binary ''),('ec0b3d7b-0930-434a-a9d3-9a2ff587344c','registration','registration flow','master','basic-flow',_binary '',_binary ''),('f258b9e9-dfee-4b5d-a182-ed6bcb184aac','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','master','basic-flow',_binary '',_binary ''),('fa015c4d-9944-4c2a-8c90-678a4644d001','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','master','basic-flow',_binary '\0',_binary '');
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_CONFIG_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG`
--

LOCK TABLES `AUTHENTICATOR_CONFIG` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('5b5e79ec-5297-45fe-aa5c-7effdadeabb7','create unique user config','master'),('ad0f472d-29d8-43a4-95fa-25f579640edb','review profile config','ias'),('ecb36786-1d62-43af-8c17-bdddce14e733','create unique user config','ias'),('f6b5bd9f-b1e9-4a18-8ce4-4b737a8a803f','review profile config','master');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG_ENTRY`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG_ENTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG_ENTRY` (
  `AUTHENTICATOR_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`AUTHENTICATOR_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG_ENTRY`
--

LOCK TABLES `AUTHENTICATOR_CONFIG_ENTRY` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('5b5e79ec-5297-45fe-aa5c-7effdadeabb7','false','require.password.update.after.registration'),('ad0f472d-29d8-43a4-95fa-25f579640edb','missing','update.profile.on.first.login'),('ecb36786-1d62-43af-8c17-bdddce14e733','false','require.password.update.after.registration'),('f6b5bd9f-b1e9-4a18-8ce4-4b737a8a803f','missing','update.profile.on.first.login');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BROKER_LINK`
--

DROP TABLE IF EXISTS `BROKER_LINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BROKER_LINK` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  `BROKER_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BROKER_LINK`
--

LOCK TABLES `BROKER_LINK` WRITE;
/*!40000 ALTER TABLE `BROKER_LINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `BROKER_LINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT`
--

DROP TABLE IF EXISTS `CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT` (
  `ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FULL_SCOPE_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int(11) DEFAULT NULL,
  `PUBLIC_CLIENT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` varchar(255) DEFAULT NULL,
  `BASE_URL` varchar(255) DEFAULT NULL,
  `BEARER_ONLY` bit(1) NOT NULL DEFAULT b'0',
  `MANAGEMENT_URL` varchar(255) DEFAULT NULL,
  `SURROGATE_AUTH_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  `NODE_REREG_TIMEOUT` int(11) DEFAULT '0',
  `FRONTCHANNEL_LOGOUT` bit(1) NOT NULL DEFAULT b'0',
  `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `SERVICE_ACCOUNTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_AUTHENTICATOR_TYPE` varchar(255) DEFAULT NULL,
  `ROOT_URL` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `REGISTRATION_TOKEN` varchar(255) DEFAULT NULL,
  `STANDARD_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'1',
  `IMPLICIT_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DIRECT_ACCESS_GRANTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ALWAYS_DISPLAY_IN_CONSOLE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`),
  KEY `IDX_CLIENT_ID` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT`
--

LOCK TABLES `CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT` VALUES ('27c8591f-ac8e-4963-ac86-558e7a5d88d9',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','ias','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('3c04d5eb-fe24-4756-862e-a932791e7a75',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('52dd3a56-5419-42f6-b96f-56a5f51ed33c',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/ias/account/',_binary '\0',NULL,_binary '\0','ias','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('56c9a6a6-510a-441d-b3ac-786925735a57',_binary '',_binary '\0','realm-management',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','ias','openid-connect',0,_binary '\0',_binary '\0','${client_realm-management}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('5b734b54-c78b-4b36-bf53-82d79c7c8467',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/master/console/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('61c765a6-d03e-4137-a5ed-db4cbfe571d0',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','ias','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('6f20237f-7229-4ff6-9011-a90e501fe8f8',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/ias/console/',_binary '\0',NULL,_binary '\0','ias','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('7a84a3da-8dc2-43f2-ac9c-7ce7dfacdb25',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('84f4ebb2-45fd-470b-9cb5-cb116da34f1d',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('8c58b5b0-11d5-44d0-9592-095fa99404d4',_binary '',_binary '','django',0,_binary '\0','1e236955-34a7-41d6-af06-af155d5fe251',NULL,_binary '\0',NULL,_binary '\0','ias','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('9fe0ddbf-37a6-40ef-8174-61d6e1b6df86',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/ias/account/',_binary '\0',NULL,_binary '\0','ias','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('a28b534d-bd92-45d0-a311-c1e63d20dc72',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('b090d4b0-5a7c-44ff-9985-06632767b68e',_binary '',_binary '\0','ias-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master',NULL,0,_binary '\0',_binary '\0','ias Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('e702d638-b763-454f-8514-9af9c7c5530e',_binary '',_binary '\0','master-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master',NULL,0,_binary '\0',_binary '\0','master Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0');
/*!40000 ALTER TABLE `CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_ATTRIBUTES` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(4000) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  KEY `IDX_CLIENT_ATT_BY_NAME_VALUE` (`NAME`,`VALUE`(255)),
  CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_ATTRIBUTES`
--

LOCK TABLES `CLIENT_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_ATTRIBUTES` VALUES ('52dd3a56-5419-42f6-b96f-56a5f51ed33c','S256','pkce.code.challenge.method'),('5b734b54-c78b-4b36-bf53-82d79c7c8467','S256','pkce.code.challenge.method'),('6f20237f-7229-4ff6-9011-a90e501fe8f8','S256','pkce.code.challenge.method'),('7a84a3da-8dc2-43f2-ac9c-7ce7dfacdb25','S256','pkce.code.challenge.method'),('8c58b5b0-11d5-44d0-9592-095fa99404d4','false','backchannel.logout.revoke.offline.tokens'),('8c58b5b0-11d5-44d0-9592-095fa99404d4','true','backchannel.logout.session.required'),('8c58b5b0-11d5-44d0-9592-095fa99404d4','false','client_credentials.use_refresh_token'),('8c58b5b0-11d5-44d0-9592-095fa99404d4','false','display.on.consent.screen'),('8c58b5b0-11d5-44d0-9592-095fa99404d4','false','exclude.session.state.from.auth.response'),('8c58b5b0-11d5-44d0-9592-095fa99404d4','false','id.token.as.detached.signature'),('8c58b5b0-11d5-44d0-9592-095fa99404d4','false','oauth2.device.authorization.grant.enabled'),('8c58b5b0-11d5-44d0-9592-095fa99404d4','false','oidc.ciba.grant.enabled'),('8c58b5b0-11d5-44d0-9592-095fa99404d4','false','require.pushed.authorization.requests'),('8c58b5b0-11d5-44d0-9592-095fa99404d4','false','saml.artifact.binding'),('8c58b5b0-11d5-44d0-9592-095fa99404d4','false','saml.assertion.signature'),('8c58b5b0-11d5-44d0-9592-095fa99404d4','false','saml.authnstatement'),('8c58b5b0-11d5-44d0-9592-095fa99404d4','false','saml.client.signature'),('8c58b5b0-11d5-44d0-9592-095fa99404d4','false','saml.encrypt'),('8c58b5b0-11d5-44d0-9592-095fa99404d4','false','saml.force.post.binding'),('8c58b5b0-11d5-44d0-9592-095fa99404d4','false','saml.multivalued.roles'),('8c58b5b0-11d5-44d0-9592-095fa99404d4','false','saml.onetimeuse.condition'),('8c58b5b0-11d5-44d0-9592-095fa99404d4','false','saml.server.signature'),('8c58b5b0-11d5-44d0-9592-095fa99404d4','false','saml.server.signature.keyinfo.ext'),('8c58b5b0-11d5-44d0-9592-095fa99404d4','false','saml_force_name_id_format'),('8c58b5b0-11d5-44d0-9592-095fa99404d4','false','tls.client.certificate.bound.access.tokens'),('8c58b5b0-11d5-44d0-9592-095fa99404d4','true','use.refresh.tokens');
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_AUTH_FLOW_BINDINGS`
--

DROP TABLE IF EXISTS `CLIENT_AUTH_FLOW_BINDINGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_AUTH_FLOW_BINDINGS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `BINDING_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`BINDING_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_AUTH_FLOW_BINDINGS`
--

LOCK TABLES `CLIENT_AUTH_FLOW_BINDINGS` WRITE;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_INITIAL_ACCESS`
--

DROP TABLE IF EXISTS `CLIENT_INITIAL_ACCESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_INITIAL_ACCESS` (
  `ID` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `EXPIRATION` int(11) DEFAULT NULL,
  `COUNT` int(11) DEFAULT NULL,
  `REMAINING_COUNT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_INIT_ACC_REALM` (`REALM_ID`),
  CONSTRAINT `FK_CLIENT_INIT_ACC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_INITIAL_ACCESS`
--

LOCK TABLES `CLIENT_INITIAL_ACCESS` WRITE;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_NODE_REGISTRATIONS`
--

DROP TABLE IF EXISTS `CLIENT_NODE_REGISTRATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_NODE_REGISTRATIONS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` int(11) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_NODE_REGISTRATIONS`
--

LOCK TABLES `CLIENT_NODE_REGISTRATIONS` WRITE;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_CLI_SCOPE` (`REALM_ID`,`NAME`),
  KEY `IDX_REALM_CLSCOPE` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE`
--

LOCK TABLES `CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE` VALUES ('0d2adae3-9c3f-466b-a0a0-f752702bfdd2','address','master','OpenID Connect built-in scope: address','openid-connect'),('18400ef8-fbae-4f84-807e-0acaa7bbee4d','phone','master','OpenID Connect built-in scope: phone','openid-connect'),('2459308e-fddf-4b3a-899b-55d5a0fc1294','web-origins','master','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('313a7bf7-8e07-4de9-9683-dfb73167f487','offline_access','ias','OpenID Connect built-in scope: offline_access','openid-connect'),('39268d8a-17b5-48b1-9183-21c2c1f2d43e','profile','ias','OpenID Connect built-in scope: profile','openid-connect'),('53ad39f2-fc13-4433-9bc5-11bd6190c795','phone','ias','OpenID Connect built-in scope: phone','openid-connect'),('5755dfef-515a-4de5-b836-84c970222efd','roles','ias','OpenID Connect scope for add user roles to the access token','openid-connect'),('6b81ca3a-ffc8-4323-89ac-2d7a98780dab','microprofile-jwt','ias','Microprofile - JWT built-in scope','openid-connect'),('76350a65-39d6-40c7-9897-8bf0bec8ca5c','role_list','ias','SAML role list','saml'),('7cda1a4b-e080-4720-8b27-5608836577bd','profile','master','OpenID Connect built-in scope: profile','openid-connect'),('99c6158f-a751-4534-a7a0-c44abfc08db7','address','ias','OpenID Connect built-in scope: address','openid-connect'),('af515964-3d12-4f67-8772-3873fbceed28','offline_access','master','OpenID Connect built-in scope: offline_access','openid-connect'),('b16581f0-4322-411b-980f-0dd7c2b7ac72','microprofile-jwt','master','Microprofile - JWT built-in scope','openid-connect'),('bc884bfa-5c80-4424-ac83-cafcb007f3ea','email','ias','OpenID Connect built-in scope: email','openid-connect'),('bcd64792-adbb-432b-ae1f-b6250679eb90','web-origins','ias','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('bf087016-cb94-4c2d-ab57-fde45ac05718','email','master','OpenID Connect built-in scope: email','openid-connect'),('cb3046bf-efc2-4875-86e2-f57a04bfa569','roles','master','OpenID Connect scope for add user roles to the access token','openid-connect'),('d86ee1f1-07a3-4a4f-8abb-9d749493654b','role_list','master','SAML role list','saml');
/*!40000 ALTER TABLE `CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ATTRIBUTES` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `VALUE` varchar(2048) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`NAME`),
  KEY `IDX_CLSCOPE_ATTRS` (`SCOPE_ID`),
  CONSTRAINT `FK_CL_SCOPE_ATTR_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ATTRIBUTES`
--

LOCK TABLES `CLIENT_SCOPE_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('0d2adae3-9c3f-466b-a0a0-f752702bfdd2','${addressScopeConsentText}','consent.screen.text'),('0d2adae3-9c3f-466b-a0a0-f752702bfdd2','true','display.on.consent.screen'),('0d2adae3-9c3f-466b-a0a0-f752702bfdd2','true','include.in.token.scope'),('18400ef8-fbae-4f84-807e-0acaa7bbee4d','${phoneScopeConsentText}','consent.screen.text'),('18400ef8-fbae-4f84-807e-0acaa7bbee4d','true','display.on.consent.screen'),('18400ef8-fbae-4f84-807e-0acaa7bbee4d','true','include.in.token.scope'),('2459308e-fddf-4b3a-899b-55d5a0fc1294','','consent.screen.text'),('2459308e-fddf-4b3a-899b-55d5a0fc1294','false','display.on.consent.screen'),('2459308e-fddf-4b3a-899b-55d5a0fc1294','false','include.in.token.scope'),('313a7bf7-8e07-4de9-9683-dfb73167f487','${offlineAccessScopeConsentText}','consent.screen.text'),('313a7bf7-8e07-4de9-9683-dfb73167f487','true','display.on.consent.screen'),('39268d8a-17b5-48b1-9183-21c2c1f2d43e','${profileScopeConsentText}','consent.screen.text'),('39268d8a-17b5-48b1-9183-21c2c1f2d43e','true','display.on.consent.screen'),('39268d8a-17b5-48b1-9183-21c2c1f2d43e','true','include.in.token.scope'),('53ad39f2-fc13-4433-9bc5-11bd6190c795','${phoneScopeConsentText}','consent.screen.text'),('53ad39f2-fc13-4433-9bc5-11bd6190c795','true','display.on.consent.screen'),('53ad39f2-fc13-4433-9bc5-11bd6190c795','true','include.in.token.scope'),('5755dfef-515a-4de5-b836-84c970222efd','${rolesScopeConsentText}','consent.screen.text'),('5755dfef-515a-4de5-b836-84c970222efd','true','display.on.consent.screen'),('5755dfef-515a-4de5-b836-84c970222efd','false','include.in.token.scope'),('6b81ca3a-ffc8-4323-89ac-2d7a98780dab','false','display.on.consent.screen'),('6b81ca3a-ffc8-4323-89ac-2d7a98780dab','true','include.in.token.scope'),('76350a65-39d6-40c7-9897-8bf0bec8ca5c','${samlRoleListScopeConsentText}','consent.screen.text'),('76350a65-39d6-40c7-9897-8bf0bec8ca5c','true','display.on.consent.screen'),('7cda1a4b-e080-4720-8b27-5608836577bd','${profileScopeConsentText}','consent.screen.text'),('7cda1a4b-e080-4720-8b27-5608836577bd','true','display.on.consent.screen'),('7cda1a4b-e080-4720-8b27-5608836577bd','true','include.in.token.scope'),('99c6158f-a751-4534-a7a0-c44abfc08db7','${addressScopeConsentText}','consent.screen.text'),('99c6158f-a751-4534-a7a0-c44abfc08db7','true','display.on.consent.screen'),('99c6158f-a751-4534-a7a0-c44abfc08db7','true','include.in.token.scope'),('af515964-3d12-4f67-8772-3873fbceed28','${offlineAccessScopeConsentText}','consent.screen.text'),('af515964-3d12-4f67-8772-3873fbceed28','true','display.on.consent.screen'),('b16581f0-4322-411b-980f-0dd7c2b7ac72','false','display.on.consent.screen'),('b16581f0-4322-411b-980f-0dd7c2b7ac72','true','include.in.token.scope'),('bc884bfa-5c80-4424-ac83-cafcb007f3ea','${emailScopeConsentText}','consent.screen.text'),('bc884bfa-5c80-4424-ac83-cafcb007f3ea','true','display.on.consent.screen'),('bc884bfa-5c80-4424-ac83-cafcb007f3ea','true','include.in.token.scope'),('bcd64792-adbb-432b-ae1f-b6250679eb90','','consent.screen.text'),('bcd64792-adbb-432b-ae1f-b6250679eb90','false','display.on.consent.screen'),('bcd64792-adbb-432b-ae1f-b6250679eb90','false','include.in.token.scope'),('bf087016-cb94-4c2d-ab57-fde45ac05718','${emailScopeConsentText}','consent.screen.text'),('bf087016-cb94-4c2d-ab57-fde45ac05718','true','display.on.consent.screen'),('bf087016-cb94-4c2d-ab57-fde45ac05718','true','include.in.token.scope'),('cb3046bf-efc2-4875-86e2-f57a04bfa569','${rolesScopeConsentText}','consent.screen.text'),('cb3046bf-efc2-4875-86e2-f57a04bfa569','true','display.on.consent.screen'),('cb3046bf-efc2-4875-86e2-f57a04bfa569','false','include.in.token.scope'),('d86ee1f1-07a3-4a4f-8abb-9d749493654b','${samlRoleListScopeConsentText}','consent.screen.text'),('d86ee1f1-07a3-4a4f-8abb-9d749493654b','true','display.on.consent.screen');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_CLIENT`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_CLIENT` (
  `CLIENT_ID` varchar(255) NOT NULL,
  `SCOPE_ID` varchar(255) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`CLIENT_ID`,`SCOPE_ID`),
  KEY `IDX_CLSCOPE_CL` (`CLIENT_ID`),
  KEY `IDX_CL_CLSCOPE` (`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_CLIENT`
--

LOCK TABLES `CLIENT_SCOPE_CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('27c8591f-ac8e-4963-ac86-558e7a5d88d9','313a7bf7-8e07-4de9-9683-dfb73167f487',_binary '\0'),('27c8591f-ac8e-4963-ac86-558e7a5d88d9','39268d8a-17b5-48b1-9183-21c2c1f2d43e',_binary ''),('27c8591f-ac8e-4963-ac86-558e7a5d88d9','53ad39f2-fc13-4433-9bc5-11bd6190c795',_binary '\0'),('27c8591f-ac8e-4963-ac86-558e7a5d88d9','5755dfef-515a-4de5-b836-84c970222efd',_binary ''),('27c8591f-ac8e-4963-ac86-558e7a5d88d9','6b81ca3a-ffc8-4323-89ac-2d7a98780dab',_binary '\0'),('27c8591f-ac8e-4963-ac86-558e7a5d88d9','99c6158f-a751-4534-a7a0-c44abfc08db7',_binary '\0'),('27c8591f-ac8e-4963-ac86-558e7a5d88d9','bc884bfa-5c80-4424-ac83-cafcb007f3ea',_binary ''),('27c8591f-ac8e-4963-ac86-558e7a5d88d9','bcd64792-adbb-432b-ae1f-b6250679eb90',_binary ''),('3c04d5eb-fe24-4756-862e-a932791e7a75','0d2adae3-9c3f-466b-a0a0-f752702bfdd2',_binary '\0'),('3c04d5eb-fe24-4756-862e-a932791e7a75','18400ef8-fbae-4f84-807e-0acaa7bbee4d',_binary '\0'),('3c04d5eb-fe24-4756-862e-a932791e7a75','2459308e-fddf-4b3a-899b-55d5a0fc1294',_binary ''),('3c04d5eb-fe24-4756-862e-a932791e7a75','7cda1a4b-e080-4720-8b27-5608836577bd',_binary ''),('3c04d5eb-fe24-4756-862e-a932791e7a75','af515964-3d12-4f67-8772-3873fbceed28',_binary '\0'),('3c04d5eb-fe24-4756-862e-a932791e7a75','b16581f0-4322-411b-980f-0dd7c2b7ac72',_binary '\0'),('3c04d5eb-fe24-4756-862e-a932791e7a75','bf087016-cb94-4c2d-ab57-fde45ac05718',_binary ''),('3c04d5eb-fe24-4756-862e-a932791e7a75','cb3046bf-efc2-4875-86e2-f57a04bfa569',_binary ''),('52dd3a56-5419-42f6-b96f-56a5f51ed33c','313a7bf7-8e07-4de9-9683-dfb73167f487',_binary '\0'),('52dd3a56-5419-42f6-b96f-56a5f51ed33c','39268d8a-17b5-48b1-9183-21c2c1f2d43e',_binary ''),('52dd3a56-5419-42f6-b96f-56a5f51ed33c','53ad39f2-fc13-4433-9bc5-11bd6190c795',_binary '\0'),('52dd3a56-5419-42f6-b96f-56a5f51ed33c','5755dfef-515a-4de5-b836-84c970222efd',_binary ''),('52dd3a56-5419-42f6-b96f-56a5f51ed33c','6b81ca3a-ffc8-4323-89ac-2d7a98780dab',_binary '\0'),('52dd3a56-5419-42f6-b96f-56a5f51ed33c','99c6158f-a751-4534-a7a0-c44abfc08db7',_binary '\0'),('52dd3a56-5419-42f6-b96f-56a5f51ed33c','bc884bfa-5c80-4424-ac83-cafcb007f3ea',_binary ''),('52dd3a56-5419-42f6-b96f-56a5f51ed33c','bcd64792-adbb-432b-ae1f-b6250679eb90',_binary ''),('56c9a6a6-510a-441d-b3ac-786925735a57','313a7bf7-8e07-4de9-9683-dfb73167f487',_binary '\0'),('56c9a6a6-510a-441d-b3ac-786925735a57','39268d8a-17b5-48b1-9183-21c2c1f2d43e',_binary ''),('56c9a6a6-510a-441d-b3ac-786925735a57','53ad39f2-fc13-4433-9bc5-11bd6190c795',_binary '\0'),('56c9a6a6-510a-441d-b3ac-786925735a57','5755dfef-515a-4de5-b836-84c970222efd',_binary ''),('56c9a6a6-510a-441d-b3ac-786925735a57','6b81ca3a-ffc8-4323-89ac-2d7a98780dab',_binary '\0'),('56c9a6a6-510a-441d-b3ac-786925735a57','99c6158f-a751-4534-a7a0-c44abfc08db7',_binary '\0'),('56c9a6a6-510a-441d-b3ac-786925735a57','bc884bfa-5c80-4424-ac83-cafcb007f3ea',_binary ''),('56c9a6a6-510a-441d-b3ac-786925735a57','bcd64792-adbb-432b-ae1f-b6250679eb90',_binary ''),('5b734b54-c78b-4b36-bf53-82d79c7c8467','0d2adae3-9c3f-466b-a0a0-f752702bfdd2',_binary '\0'),('5b734b54-c78b-4b36-bf53-82d79c7c8467','18400ef8-fbae-4f84-807e-0acaa7bbee4d',_binary '\0'),('5b734b54-c78b-4b36-bf53-82d79c7c8467','2459308e-fddf-4b3a-899b-55d5a0fc1294',_binary ''),('5b734b54-c78b-4b36-bf53-82d79c7c8467','7cda1a4b-e080-4720-8b27-5608836577bd',_binary ''),('5b734b54-c78b-4b36-bf53-82d79c7c8467','af515964-3d12-4f67-8772-3873fbceed28',_binary '\0'),('5b734b54-c78b-4b36-bf53-82d79c7c8467','b16581f0-4322-411b-980f-0dd7c2b7ac72',_binary '\0'),('5b734b54-c78b-4b36-bf53-82d79c7c8467','bf087016-cb94-4c2d-ab57-fde45ac05718',_binary ''),('5b734b54-c78b-4b36-bf53-82d79c7c8467','cb3046bf-efc2-4875-86e2-f57a04bfa569',_binary ''),('61c765a6-d03e-4137-a5ed-db4cbfe571d0','313a7bf7-8e07-4de9-9683-dfb73167f487',_binary '\0'),('61c765a6-d03e-4137-a5ed-db4cbfe571d0','39268d8a-17b5-48b1-9183-21c2c1f2d43e',_binary ''),('61c765a6-d03e-4137-a5ed-db4cbfe571d0','53ad39f2-fc13-4433-9bc5-11bd6190c795',_binary '\0'),('61c765a6-d03e-4137-a5ed-db4cbfe571d0','5755dfef-515a-4de5-b836-84c970222efd',_binary ''),('61c765a6-d03e-4137-a5ed-db4cbfe571d0','6b81ca3a-ffc8-4323-89ac-2d7a98780dab',_binary '\0'),('61c765a6-d03e-4137-a5ed-db4cbfe571d0','99c6158f-a751-4534-a7a0-c44abfc08db7',_binary '\0'),('61c765a6-d03e-4137-a5ed-db4cbfe571d0','bc884bfa-5c80-4424-ac83-cafcb007f3ea',_binary ''),('61c765a6-d03e-4137-a5ed-db4cbfe571d0','bcd64792-adbb-432b-ae1f-b6250679eb90',_binary ''),('6f20237f-7229-4ff6-9011-a90e501fe8f8','313a7bf7-8e07-4de9-9683-dfb73167f487',_binary '\0'),('6f20237f-7229-4ff6-9011-a90e501fe8f8','39268d8a-17b5-48b1-9183-21c2c1f2d43e',_binary ''),('6f20237f-7229-4ff6-9011-a90e501fe8f8','53ad39f2-fc13-4433-9bc5-11bd6190c795',_binary '\0'),('6f20237f-7229-4ff6-9011-a90e501fe8f8','5755dfef-515a-4de5-b836-84c970222efd',_binary ''),('6f20237f-7229-4ff6-9011-a90e501fe8f8','6b81ca3a-ffc8-4323-89ac-2d7a98780dab',_binary '\0'),('6f20237f-7229-4ff6-9011-a90e501fe8f8','99c6158f-a751-4534-a7a0-c44abfc08db7',_binary '\0'),('6f20237f-7229-4ff6-9011-a90e501fe8f8','bc884bfa-5c80-4424-ac83-cafcb007f3ea',_binary ''),('6f20237f-7229-4ff6-9011-a90e501fe8f8','bcd64792-adbb-432b-ae1f-b6250679eb90',_binary ''),('7a84a3da-8dc2-43f2-ac9c-7ce7dfacdb25','0d2adae3-9c3f-466b-a0a0-f752702bfdd2',_binary '\0'),('7a84a3da-8dc2-43f2-ac9c-7ce7dfacdb25','18400ef8-fbae-4f84-807e-0acaa7bbee4d',_binary '\0'),('7a84a3da-8dc2-43f2-ac9c-7ce7dfacdb25','2459308e-fddf-4b3a-899b-55d5a0fc1294',_binary ''),('7a84a3da-8dc2-43f2-ac9c-7ce7dfacdb25','7cda1a4b-e080-4720-8b27-5608836577bd',_binary ''),('7a84a3da-8dc2-43f2-ac9c-7ce7dfacdb25','af515964-3d12-4f67-8772-3873fbceed28',_binary '\0'),('7a84a3da-8dc2-43f2-ac9c-7ce7dfacdb25','b16581f0-4322-411b-980f-0dd7c2b7ac72',_binary '\0'),('7a84a3da-8dc2-43f2-ac9c-7ce7dfacdb25','bf087016-cb94-4c2d-ab57-fde45ac05718',_binary ''),('7a84a3da-8dc2-43f2-ac9c-7ce7dfacdb25','cb3046bf-efc2-4875-86e2-f57a04bfa569',_binary ''),('84f4ebb2-45fd-470b-9cb5-cb116da34f1d','0d2adae3-9c3f-466b-a0a0-f752702bfdd2',_binary '\0'),('84f4ebb2-45fd-470b-9cb5-cb116da34f1d','18400ef8-fbae-4f84-807e-0acaa7bbee4d',_binary '\0'),('84f4ebb2-45fd-470b-9cb5-cb116da34f1d','2459308e-fddf-4b3a-899b-55d5a0fc1294',_binary ''),('84f4ebb2-45fd-470b-9cb5-cb116da34f1d','7cda1a4b-e080-4720-8b27-5608836577bd',_binary ''),('84f4ebb2-45fd-470b-9cb5-cb116da34f1d','af515964-3d12-4f67-8772-3873fbceed28',_binary '\0'),('84f4ebb2-45fd-470b-9cb5-cb116da34f1d','b16581f0-4322-411b-980f-0dd7c2b7ac72',_binary '\0'),('84f4ebb2-45fd-470b-9cb5-cb116da34f1d','bf087016-cb94-4c2d-ab57-fde45ac05718',_binary ''),('84f4ebb2-45fd-470b-9cb5-cb116da34f1d','cb3046bf-efc2-4875-86e2-f57a04bfa569',_binary ''),('8c58b5b0-11d5-44d0-9592-095fa99404d4','313a7bf7-8e07-4de9-9683-dfb73167f487',_binary '\0'),('8c58b5b0-11d5-44d0-9592-095fa99404d4','39268d8a-17b5-48b1-9183-21c2c1f2d43e',_binary ''),('8c58b5b0-11d5-44d0-9592-095fa99404d4','53ad39f2-fc13-4433-9bc5-11bd6190c795',_binary '\0'),('8c58b5b0-11d5-44d0-9592-095fa99404d4','5755dfef-515a-4de5-b836-84c970222efd',_binary ''),('8c58b5b0-11d5-44d0-9592-095fa99404d4','6b81ca3a-ffc8-4323-89ac-2d7a98780dab',_binary '\0'),('8c58b5b0-11d5-44d0-9592-095fa99404d4','99c6158f-a751-4534-a7a0-c44abfc08db7',_binary '\0'),('8c58b5b0-11d5-44d0-9592-095fa99404d4','bc884bfa-5c80-4424-ac83-cafcb007f3ea',_binary ''),('8c58b5b0-11d5-44d0-9592-095fa99404d4','bcd64792-adbb-432b-ae1f-b6250679eb90',_binary ''),('9fe0ddbf-37a6-40ef-8174-61d6e1b6df86','313a7bf7-8e07-4de9-9683-dfb73167f487',_binary '\0'),('9fe0ddbf-37a6-40ef-8174-61d6e1b6df86','39268d8a-17b5-48b1-9183-21c2c1f2d43e',_binary ''),('9fe0ddbf-37a6-40ef-8174-61d6e1b6df86','53ad39f2-fc13-4433-9bc5-11bd6190c795',_binary '\0'),('9fe0ddbf-37a6-40ef-8174-61d6e1b6df86','5755dfef-515a-4de5-b836-84c970222efd',_binary ''),('9fe0ddbf-37a6-40ef-8174-61d6e1b6df86','6b81ca3a-ffc8-4323-89ac-2d7a98780dab',_binary '\0'),('9fe0ddbf-37a6-40ef-8174-61d6e1b6df86','99c6158f-a751-4534-a7a0-c44abfc08db7',_binary '\0'),('9fe0ddbf-37a6-40ef-8174-61d6e1b6df86','bc884bfa-5c80-4424-ac83-cafcb007f3ea',_binary ''),('9fe0ddbf-37a6-40ef-8174-61d6e1b6df86','bcd64792-adbb-432b-ae1f-b6250679eb90',_binary ''),('a28b534d-bd92-45d0-a311-c1e63d20dc72','0d2adae3-9c3f-466b-a0a0-f752702bfdd2',_binary '\0'),('a28b534d-bd92-45d0-a311-c1e63d20dc72','18400ef8-fbae-4f84-807e-0acaa7bbee4d',_binary '\0'),('a28b534d-bd92-45d0-a311-c1e63d20dc72','2459308e-fddf-4b3a-899b-55d5a0fc1294',_binary ''),('a28b534d-bd92-45d0-a311-c1e63d20dc72','7cda1a4b-e080-4720-8b27-5608836577bd',_binary ''),('a28b534d-bd92-45d0-a311-c1e63d20dc72','af515964-3d12-4f67-8772-3873fbceed28',_binary '\0'),('a28b534d-bd92-45d0-a311-c1e63d20dc72','b16581f0-4322-411b-980f-0dd7c2b7ac72',_binary '\0'),('a28b534d-bd92-45d0-a311-c1e63d20dc72','bf087016-cb94-4c2d-ab57-fde45ac05718',_binary ''),('a28b534d-bd92-45d0-a311-c1e63d20dc72','cb3046bf-efc2-4875-86e2-f57a04bfa569',_binary ''),('e702d638-b763-454f-8514-9af9c7c5530e','0d2adae3-9c3f-466b-a0a0-f752702bfdd2',_binary '\0'),('e702d638-b763-454f-8514-9af9c7c5530e','18400ef8-fbae-4f84-807e-0acaa7bbee4d',_binary '\0'),('e702d638-b763-454f-8514-9af9c7c5530e','2459308e-fddf-4b3a-899b-55d5a0fc1294',_binary ''),('e702d638-b763-454f-8514-9af9c7c5530e','7cda1a4b-e080-4720-8b27-5608836577bd',_binary ''),('e702d638-b763-454f-8514-9af9c7c5530e','af515964-3d12-4f67-8772-3873fbceed28',_binary '\0'),('e702d638-b763-454f-8514-9af9c7c5530e','b16581f0-4322-411b-980f-0dd7c2b7ac72',_binary '\0'),('e702d638-b763-454f-8514-9af9c7c5530e','bf087016-cb94-4c2d-ab57-fde45ac05718',_binary ''),('e702d638-b763-454f-8514-9af9c7c5530e','cb3046bf-efc2-4875-86e2-f57a04bfa569',_binary '');
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ROLE_MAPPING` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`ROLE_ID`),
  KEY `IDX_CLSCOPE_ROLE` (`SCOPE_ID`),
  KEY `IDX_ROLE_CLSCOPE` (`ROLE_ID`),
  CONSTRAINT `FK_CL_SCOPE_RM_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ROLE_MAPPING`
--

LOCK TABLES `CLIENT_SCOPE_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ROLE_MAPPING` VALUES ('313a7bf7-8e07-4de9-9683-dfb73167f487','dcaf70bb-2a90-4660-a7d3-336d9c1f2bf3'),('af515964-3d12-4f67-8772-3873fbceed28','b2825f1c-b67f-45ce-ac83-881af5cd8122');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION`
--

DROP TABLE IF EXISTS `CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `REDIRECT_URI` varchar(255) DEFAULT NULL,
  `STATE` varchar(255) DEFAULT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `SESSION_ID` varchar(36) DEFAULT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(36) DEFAULT NULL,
  `CURRENT_ACTION` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_SESSION_SESSION` (`SESSION_ID`),
  CONSTRAINT `FK_B4AO2VCVAT6UKAU74WBWTFQO1` FOREIGN KEY (`SESSION_ID`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION`
--

LOCK TABLES `CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_AUTH_STATUS`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_AUTH_STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_AUTH_STATUS` (
  `AUTHENTICATOR` varchar(36) NOT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`AUTHENTICATOR`),
  CONSTRAINT `AUTH_STATUS_CONSTRAINT` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_AUTH_STATUS`
--

LOCK TABLES `CLIENT_SESSION_AUTH_STATUS` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51C2736` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_NOTE`
--

LOCK TABLES `CLIENT_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_PROT_MAPPER`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_PROT_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_PROT_MAPPER` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`PROTOCOL_MAPPER_ID`),
  CONSTRAINT `FK_33A8SGQW18I532811V7O2DK89` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_PROT_MAPPER`
--

LOCK TABLES `CLIENT_SESSION_PROT_MAPPER` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_ROLE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_ROLE` (
  `ROLE_ID` varchar(255) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`ROLE_ID`),
  CONSTRAINT `FK_11B7SGQW18I532811V7O2DV76` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_ROLE`
--

LOCK TABLES `CLIENT_SESSION_ROLE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_USER_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(2048) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK_CL_USR_SES_NOTE` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_USER_SESSION_NOTE`
--

LOCK TABLES `CLIENT_USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT`
--

DROP TABLE IF EXISTS `COMPONENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_TYPE` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `SUB_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPONENT_REALM` (`REALM_ID`),
  KEY `IDX_COMPONENT_PROVIDER_TYPE` (`PROVIDER_TYPE`),
  CONSTRAINT `FK_COMPONENT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT`
--

LOCK TABLES `COMPONENT` WRITE;
/*!40000 ALTER TABLE `COMPONENT` DISABLE KEYS */;
INSERT INTO `COMPONENT` VALUES ('020b6581-f488-492b-b6d4-c2937de17902','hmac-generated','ias','hmac-generated','org.keycloak.keys.KeyProvider','ias',NULL),('06c40acd-aebe-4c30-a10c-6c9b34fcb68b','Trusted Hosts','ias','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','ias','anonymous'),('1300a65c-02c4-4889-8dcf-e05ee5ee35da','Full Scope Disabled','master','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('1becf20e-3aa7-414d-b836-53d9ff279cf2','rsa-enc-generated','master','rsa-generated','org.keycloak.keys.KeyProvider','master',NULL),('3889f77b-73a6-4c1a-acc7-184a33085d33','Consent Required','ias','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','ias','anonymous'),('3929af18-bc0e-4021-9d0c-90b228eb1171','rsa-generated','ias','rsa-generated','org.keycloak.keys.KeyProvider','ias',NULL),('41fcdac5-0a53-49b6-96d4-3dcc9331ebce','Allowed Client Scopes','ias','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','ias','authenticated'),('46cdabcc-4a9e-4304-aeb6-3e32d6aeed56','rsa-enc-generated','ias','rsa-generated','org.keycloak.keys.KeyProvider','ias',NULL),('50b9d1f3-d33a-4347-ab3a-d67885f0d7b6','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('57e8cee7-4c51-490b-839c-285fa11fc6c1','aes-generated','ias','aes-generated','org.keycloak.keys.KeyProvider','ias',NULL),('64471549-e88c-4f3f-b85e-98eb7031bbc7','Allowed Protocol Mapper Types','ias','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','ias','authenticated'),('6bb83c5b-48ec-4c8b-8db0-2371f036bba7','aes-generated','master','aes-generated','org.keycloak.keys.KeyProvider','master',NULL),('77192398-2926-4544-ba64-064ad5ef198f','Allowed Protocol Mapper Types','ias','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','ias','anonymous'),('774fc7e1-d927-41b8-b86d-a6a577c01f1f','Trusted Hosts','master','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('7e058513-2bad-4c3d-89f8-9f17ad3e4db1','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('7fc32091-4c85-419f-bee1-292da390893a','hmac-generated','master','hmac-generated','org.keycloak.keys.KeyProvider','master',NULL),('8f0f4dcb-9599-4b85-9dd8-95f48e4c0d96','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('9578ca8b-1ee3-4adf-a595-4d56b8a7ff47','rsa-generated','master','rsa-generated','org.keycloak.keys.KeyProvider','master',NULL),('994fa3ac-85d9-4e2e-93c4-79427efa9a09','Max Clients Limit','ias','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','ias','anonymous'),('9ba2601b-b1ff-4b79-994c-85e11fbde842','Max Clients Limit','master','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('bbfe778e-1ddb-4baa-a3cd-fe032d128402','Allowed Client Scopes','ias','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','ias','anonymous'),('e48d63bb-56a2-4907-aeb6-4fe8e7974714','Consent Required','master','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('ebc112f6-77e5-40e5-a75a-d4795e5341cb','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('f1ffd10c-fec6-48ad-b744-b7bfaca780bf','Full Scope Disabled','ias','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','ias','anonymous');
/*!40000 ALTER TABLE `COMPONENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT_CONFIG`
--

DROP TABLE IF EXISTS `COMPONENT_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `COMPONENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(4000) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPO_CONFIG_COMPO` (`COMPONENT_ID`),
  CONSTRAINT `FK_COMPONENT_CONFIG` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `COMPONENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT_CONFIG`
--

LOCK TABLES `COMPONENT_CONFIG` WRITE;
/*!40000 ALTER TABLE `COMPONENT_CONFIG` DISABLE KEYS */;
INSERT INTO `COMPONENT_CONFIG` VALUES ('00598c76-02ef-4427-b960-2f5d15165df4','50b9d1f3-d33a-4347-ab3a-d67885f0d7b6','allowed-protocol-mapper-types','saml-role-list-mapper'),('01d9f6a8-1654-45ff-a38e-872c76207796','9578ca8b-1ee3-4adf-a595-4d56b8a7ff47','certificate','MIICmzCCAYMCBgF8apSWoTANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjExMDEwMTQxOTU1WhcNMzExMDEwMTQyMTM1WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDT/oUDzdOxC++k2GxGGxqWWRgnb10hCe+y8Y3SOifVigoVZ5CnrH9YGS4jYV5pZaUhdCn+B4IEszpCRubPLnja8dvPBIIETPGbGkw/UR9/ab1+vDUG6ZlPDvFrHLsk3V3diGFl2T9q7WlfkgO5l9cgGhXnGwMmZSrR2HHRYcSMGI9LIB4ByfOzde1oguE2azQQh4+a6Ablc2OPvZXkbIG+pWYZYsy8Or59jFQgG7cAvsE28UmvSMSlkay4CWKCoTcIHC+XUm0WPZ1Y4jmsBryktyzmhaVnFJh0/O3psP09rW9rv4CFapWbChrvH8DFEz3zUq7LZcWpMzPla5jwQBvTAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAEopUXhZItxmp/o7nnHtup2s0UTrD70Dcm+EDenR+QW/WL1IqBuRv7qd1BorAROmxuRIpfLBzthFDE32Vz03Jwr6scOcyQDLGVJgiyxiSw5SW2VZir5lin7EgxEC63/u9/pnsVEB4QU0////U2KMW+TifSTdFLb4/qtW1aAX0lB/CjhoZ2LoxlQX7CAhXU3oMl5LuyOJSpILlBVOJoRyybjPRjezl39e04y7IFv9h4mpws6my1p/8eG/0tU27OKd8xEG5WcurO23wAl4nw3TAiaRuagyAH7+7TSgY5LPHkkRPMhIpVe7sxIx+PM1/bdm39wbKcav/Mk7fledvtTyp9U='),('08502f81-245c-47fd-8420-308e98a455fd','64471549-e88c-4f3f-b85e-98eb7031bbc7','allowed-protocol-mapper-types','saml-role-list-mapper'),('08eda281-f56c-4535-b625-737c2c6b8ed2','994fa3ac-85d9-4e2e-93c4-79427efa9a09','max-clients','200'),('09136c28-8337-406b-b27c-5d63de01f9d8','64471549-e88c-4f3f-b85e-98eb7031bbc7','allowed-protocol-mapper-types','oidc-address-mapper'),('0aa8e750-2870-43db-a0d9-57f520ad8082','ebc112f6-77e5-40e5-a75a-d4795e5341cb','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('19f1c82e-f9ad-4ce1-add1-d6872b98cb6c','57e8cee7-4c51-490b-839c-285fa11fc6c1','kid','6f2a4108-fd95-43f0-a43c-920e84ae000b'),('1b6e7d60-9e8a-40c0-ba3a-f147780b1cdb','77192398-2926-4544-ba64-064ad5ef198f','allowed-protocol-mapper-types','saml-role-list-mapper'),('1be79c36-1250-46f9-a0d9-06511754cf7d','3929af18-bc0e-4021-9d0c-90b228eb1171','privateKey','MIIEowIBAAKCAQEAoptT3QonwbDUxzj+/pAk7JGBPq55cgOelTsZ82aUrWxJbIPhCW6vqCfXFkahpDd2PYQbmz6CJwtRJjzBoTWW7tjukgYVur3zIHRyKm/GUaE9/zRPqTCLY4IOyFWgfxkeNt8JtREHTB9D2BvrNxUEatTxleskgK8w/HT85lO2nbSgN7fFvABpdXBDMBInWnMlzfyOMuODslXKa1K87coJDgWFil7CAmrlGSbTfma8CZL2GimDqUcWi4RjGbahZJ7Bb/xXgj2T2hw0KzI6afJXYGvVUrG+m8RYrZKAWZQz3XjwzPmqH/x6INdEzEf0U9CYzAQF9PVfcZaT4++q7gB3hQIDAQABAoIBAEbDxE54we6IL0F4K3jLcFZHyHBn69BThOs66kNEDEYgzx9bkU7Sjb1ngTJfkK7vuBRzbrQ0Et49DZbPcBDhSostez2vSjuXuLwSETEora0Ot/VdZaGiz7aBfj9vDEbjvoNwsz/KZluZa6QcGlRBYEfB3lU5HQynsXDc1MbD/cBJjcUQKZWMTCuLznfK1N0Yc2gMjttp0i4S20+W8UZMoeRW5ygAkCZZDgX+fgq1/miLl3RY7HTtb3lN1rlPWNi+4v/i8vnzDfILWv1AC6oJB+hV9QvgaOTo9atEiO6B7Ho69DeDeMJWMQKq8SaleOLIrNXc5sVJ92yv/M61mOGXgeECgYEA4crJIzXH5RCBScBNcHyjBusB+ZuBK4tNvn6RfOKz7mgxfCXWxNoWVITiNKwijgeAkEadsDRLVc2nHmVEMY6iyaRMJxS3VDFw2h4UlUO8cKBGLS4pBJP49/vy5X5qsGsxeBKu/cbY+Xj2mJDY1nZCUUxmPh8e2W1/Q8ZSEizwGokCgYEAuFx9MT4noI2KWJfVea3FfR6YwOoQQ5AVmL4otPp5D6As4lSnzERVR40gq/yx31bG4k3LNMiKXc/wWcv42UPp7cWMmedjnu11HpJl1GEhdsF1cth8lZzSWMQhO3OVDZwzk72keV38b8O2TvV6zrI7u1zh1rctygm7sSyXuKAsRh0CgYBFHmygKLB+gKTzTLjn/F9zmLFMFbxe9g/ghqJG1qc6Dg9H79VlAVXgnaUZdrBFRiqm/9b5v6hoJcJI3bsYaI+QpojhVcghL9laC+dFIi0nVQjmf8Dys9F9KFVcx2wlgUrtdNq4uQxmog7q+TxHun/mnzqVPbWV3Z0dxDIPek4t8QKBgQCxCH9fTeQXlFMJB6QCmA9QOpVMinbbqfxTFCdawjqF+rWfENOgnu2VK7v360uSv21z2mgLY5caxpZyZB+t4j08Cbsd/sf20ObqWIJYEn1j4Bm8Eo5vzItgmdWflTnIO/p7IFxT/yBs4m6qG6e13AjnviVPXc8md3o4hC2dKJHbMQKBgEGvJm76WNMuOWHonUriO4S+z86zdGAU4zmeC3X6ppQ70TlzvU3UCcOJ4bXoBb3dQ9/ke4C1ojycqqtRJD/PODHD/4VRt/9rJhO/XPFRPx210md+XrCDh84QNmX/d8Oip4BGhovZTaFS1OLsk0zHizqtEc+bUsnwSh3v+tI2trC7'),('1d08de7c-0036-4419-bebd-66bd3627c5cc','06c40acd-aebe-4c30-a10c-6c9b34fcb68b','client-uris-must-match','true'),('203fd1cc-fa2d-4164-bacf-629f6f14ea4d','8f0f4dcb-9599-4b85-9dd8-95f48e4c0d96','allow-default-scopes','true'),('25f3b168-4bf8-4cf2-aa0c-9b7932d62f27','1becf20e-3aa7-414d-b836-53d9ff279cf2','certificate','MIICmzCCAYMCBgF8apSXHDANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjExMDEwMTQxOTU1WhcNMzExMDEwMTQyMTM1WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCVmfugiqtXcdTmH3d1NNj/3IkVXQ8I79qE+tgTDe87huRIODyISliMGQioH2xmFiD26cmRGpW7ni7p/ovygLuPm89uoogXdIaP0QUxOZAkkl+fNQ0YGZh8Q0lvV3O5bvKlLXXYM3tfFFtzPmXVoVnAhY1TNOcL/VivpsL+G3OJhCJ9AnKBkOnYO4YG0AzgR7CFDNICNgJU2uma0+APV6nzWtX0kZK8l4t2bjJriVCHm4MAzCr4oQGarQ3AVG3D5AXKdqWAH1TSKnNu4TezFz7i0a2/w5FTB5dsdgQ/Echf+foPU41qSWaVj9ArII7otOv60nIiGF5c+YMtARUmaN3nAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAGbuMXyI2bf7+xGBbbqlhpfO1jLT7yUvFLhfwUY+YjXIlIf889GcKDaQTksPW2ASPN23It2hvIT1tLHeuka0deM6sAoZ7lOpQ81j/7idklpn3b0HNG4J74IgvuQifNmcoZraedxDL/izIsmvzq8ZD8GrwpB2YXKINbLJVSdAy/Yw2knN5bQjVBZiR6DPLpdB4Vp2Y2BUQqPjhBCtNkVtGlp7K1j4jL5boi5GQoBaLQC7H+3/0UW4Sal7Tw0JH1PTD8ij6BE5vkydjdVlR0Vt1FX3TQi0I74m+ObAfkiLFYddZBQ7qaSu/ju+Qd4wXEq5Vf+NRjRv2pXknwfmef7c0kU='),('2616193a-2b3d-4e8e-8b33-fbff0507d2b3','06c40acd-aebe-4c30-a10c-6c9b34fcb68b','host-sending-registration-request-must-match','true'),('29904a41-e18f-4ee0-9118-49011b792c4f','020b6581-f488-492b-b6d4-c2937de17902','priority','100'),('2a25506a-dbfb-4622-b575-8350fd5730f3','77192398-2926-4544-ba64-064ad5ef198f','allowed-protocol-mapper-types','saml-user-property-mapper'),('2d14d6c0-5741-497d-ad1f-839c9f5f7d57','7fc32091-4c85-419f-bee1-292da390893a','priority','100'),('2fd1ed44-5ec3-4b4d-8aad-15aec2b4ab69','ebc112f6-77e5-40e5-a75a-d4795e5341cb','allowed-protocol-mapper-types','oidc-full-name-mapper'),('32c8a914-de4f-4827-a608-99b64c80a6b9','50b9d1f3-d33a-4347-ab3a-d67885f0d7b6','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('3398b2d4-096a-407f-bec1-aea0a12eb990','57e8cee7-4c51-490b-839c-285fa11fc6c1','secret','KiF1f3JDJe0voYDWaA6ZAA'),('33e03a85-531f-4932-a2f2-aa964d9de4c1','77192398-2926-4544-ba64-064ad5ef198f','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('3b6ee318-dde6-4df9-8907-b608f0ee6e28','ebc112f6-77e5-40e5-a75a-d4795e5341cb','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('3b8d466a-c359-4c77-ac55-8a653c161386','50b9d1f3-d33a-4347-ab3a-d67885f0d7b6','allowed-protocol-mapper-types','oidc-address-mapper'),('3fb531d1-e194-4e32-9dfc-2a85cb98cfa1','7fc32091-4c85-419f-bee1-292da390893a','algorithm','HS256'),('4033aa34-5e2e-4e7b-b4ef-7bf1d9920ce8','3929af18-bc0e-4021-9d0c-90b228eb1171','keyUse','sig'),('488bb650-70cc-4d38-95d0-d390984ce143','64471549-e88c-4f3f-b85e-98eb7031bbc7','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('55900353-7090-4dda-8dbb-0891f8201205','41fcdac5-0a53-49b6-96d4-3dcc9331ebce','allow-default-scopes','true'),('5bfafc60-626d-4fe5-ac55-1463626f68ec','77192398-2926-4544-ba64-064ad5ef198f','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('5d8f34d3-0f82-4c4b-8c2d-50f182f73883','77192398-2926-4544-ba64-064ad5ef198f','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('60bee7f5-aa76-4939-b616-75c155af7502','46cdabcc-4a9e-4304-aeb6-3e32d6aeed56','keyUse','enc'),('621a7247-637e-457a-914d-6a4e343e232a','50b9d1f3-d33a-4347-ab3a-d67885f0d7b6','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('6642e5ee-ffd2-4375-be53-8f29678fa371','46cdabcc-4a9e-4304-aeb6-3e32d6aeed56','certificate','MIIClTCCAX0CBgF8apdMlDANBgkqhkiG9w0BAQsFADAOMQwwCgYDVQQDDANpYXMwHhcNMjExMDEwMTQyMjUyWhcNMzExMDEwMTQyNDMyWjAOMQwwCgYDVQQDDANpYXMwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCrj9qrgkyyoSObTJxkAyTvVQvWvdlRvIN9EhCW60oUCe3H2/sPYod+1rKS4Vg63TdddlBLtC+fNRXsL/Kq5EWOFLqbYcSNqc/n+umfI6eBmpFKHSjxavcBuFuwMgcJZO03Il/WP4LqG0HJeOAWbKzwlaTHhZy5KXNVkpHU536tX9YL/CvWZ2248DzvcKuoR4/I0O4YLpPDu1MvP8CP5F7MNdmPs4x+5E46nNos756SWiA5MimN0wwRVkt/sWG1dqyXgI8HlZXeEHhgMUYGTOWkH5Hj+b/d8rQrD83SHb9LNHDuSXtG12kJqu+iI1V4DUqDi6VWPCbSanl0mUgxoGLbAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAB7FokEB7PpbteEXIqlDSLRgeBt9CYqs6rBLNdVKrwzIF9jHeF8HlKyLl3075Cu5FvFr9xDpXJ1iTam8mLAx/z07R8/HnibiZg4aNXJz+ltVGlVc6vHqykJmOkNEjbannaJHRGMo+XQhONeBdETGM1shGhLHfdrSVkqlIqQ23rDKM4kO4Ieijd8ZDDF2zUUCKVy/qV8zG0Kdlzk3T6pOE98WOnMPHy0kx4SZX2CrlE7NVh8ZERMFtCu2XAycAabJ/QRMi2552ReOFDVLyScYF6LmDiMh5XD1+0PqpIQeA3BeO0HPKeJwwzSJCYch/s5AUB3Yl0Omiayk3+dWd3FnaIQ='),('667a7cbf-91fe-4396-84e9-880c21530ec5','020b6581-f488-492b-b6d4-c2937de17902','kid','1aa32e84-3d17-459b-93aa-7b9916fa4286'),('67f39610-a47a-41a8-b03d-d4c2639421ff','ebc112f6-77e5-40e5-a75a-d4795e5341cb','allowed-protocol-mapper-types','saml-user-property-mapper'),('68849f68-ed89-4e4a-a51f-ab6908cdf9fd','ebc112f6-77e5-40e5-a75a-d4795e5341cb','allowed-protocol-mapper-types','oidc-address-mapper'),('693c6541-5fb2-4f67-b8f5-802312569672','020b6581-f488-492b-b6d4-c2937de17902','algorithm','HS256'),('6f3b8737-1003-4188-941a-1a6e2faa8802','64471549-e88c-4f3f-b85e-98eb7031bbc7','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('7255b288-2953-401b-b463-5177247763a7','77192398-2926-4544-ba64-064ad5ef198f','allowed-protocol-mapper-types','oidc-address-mapper'),('77c6262a-b456-47cb-b7ed-1c5815f4d562','9578ca8b-1ee3-4adf-a595-4d56b8a7ff47','priority','100'),('7b55a9b6-0440-4788-a784-4fc9b3051b6f','ebc112f6-77e5-40e5-a75a-d4795e5341cb','allowed-protocol-mapper-types','saml-role-list-mapper'),('7bb7e3c0-882e-4374-b338-cb0275f54bcb','64471549-e88c-4f3f-b85e-98eb7031bbc7','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('7e6461aa-00c4-497c-8f42-d6eb120447a4','46cdabcc-4a9e-4304-aeb6-3e32d6aeed56','priority','100'),('7eb10ae5-35b5-4d29-8910-5064322a253d','64471549-e88c-4f3f-b85e-98eb7031bbc7','allowed-protocol-mapper-types','saml-user-property-mapper'),('7edb6685-15b5-44bd-9b8d-b11f801c7617','9578ca8b-1ee3-4adf-a595-4d56b8a7ff47','privateKey','MIIEowIBAAKCAQEA0/6FA83TsQvvpNhsRhsallkYJ29dIQnvsvGN0jon1YoKFWeQp6x/WBkuI2FeaWWlIXQp/geCBLM6Qkbmzy542vHbzwSCBEzxmxpMP1Eff2m9frw1BumZTw7xaxy7JN1d3YhhZdk/au1pX5IDuZfXIBoV5xsDJmUq0dhx0WHEjBiPSyAeAcnzs3XtaILhNms0EIePmugG5XNjj72V5GyBvqVmGWLMvDq+fYxUIBu3AL7BNvFJr0jEpZGsuAligqE3CBwvl1JtFj2dWOI5rAa8pLcs5oWlZxSYdPzt6bD9Pa1va7+AhWqVmwoa7x/AxRM981Kuy2XFqTMz5WuY8EAb0wIDAQABAoIBAGj2r2N3yOXzc/9ZzRpVFy/0AxqbcDAInG8sXL0HYGvBgkag1aW/qfmz1f1cm4Nx+XX770LA8uZi22ivdF6Gsv4tHFl+8OUyN7pFJhV/lCng8BtNErBOf0L+shgHzL1vAafLe/YSv+ywiijwwfllrfVOFSQtYrzjAHWQRqKWVtvJ8avtnf70XwZugALvUoSHDG56phNjssA+PzadJsIsQMAkMck2pOWEkQOJArypsKM/4S0IkJeQvyjv50n069frzjNtVU8qEhFDxyGkorNj7SEmNdSUGrxIqgo8M+r+KaVrj1Eei+wipfdekYltvskU1VfbdXPVj3WNrJo8DUN3oUkCgYEA/lfr6A3+S3goa/MrGqDTX/0GUHSiHfseiFgQPyJcl6anC68SfFWZ7yjSW/mNDKBzz8ZwVTSziR3iGX6JPsRqmirDF7yLkRHBdwVKRi0Ppc+IwGI+1eqIE9cR7H3czCrhCTDETj4RKbiyzY8ucZnk3203SqdbW/scwKMva8pUr88CgYEA1V/8vd1fCZJJO+0vyAFvdYzfjxVoVGpb7e6YegVLcp1xCmIK1wnYp3EcqZFeAH8KihUXqM++y6mFxpnRw5DWOmmFXLVg5XFNp6kTdJqs5OKNEGssYPxiTsXuPSxZ1NnL7ZTxrHZ9xEKOA+rhABh2e2SsdxKjA2b27mVMQDZksL0CgYEA77deGHBX5Dlzn4qobYh2sFmBwgKraSZtOIQHi/mO2z+u4Uw4WAc19jq7SQSC9AumG4YkCaqKLAmGOBESuZ3V+0eiaJTD1g6uEMdjoZCG1vgrI2d1YZiSeGCT/BkEKUmgn1DfM/87nd7+Zs80Ls2k8Q+2tR3W9XJPPyCOaUFhX/ECgYA24twGkt0RfzmrWpXB4uyi1jvjeGQ/4qQHDirWqGoB75HWU+Xp7rR2TdhLngMKKaOyZT6Sw+2WQeMRdRvKLIWOvPn7IQTtwDlzeUBx7B+xOL2Ejaz6vbEkBjIENlZdNDEKyhdof4pWY7BYPaDm/2Pq1bivYHHiPCgkppX4poU8GQKBgFHn3jhhJr0a0VlN44ohVNM6vO/TnXjW21ybYIiHmxlckCuo0/0U4q80edpQHia31BRvS9MTxbEzllAYA7usEbwd8A4KaPPZr/sFCCugyZL7eRfvA99Aj3WumOKdhTSxMTUuMxByyOVM3TL7HUpWKlZx/k8dznw4OPu8xsYAZngv'),('7f4e2fed-5243-42f1-9b28-4c5109759144','6bb83c5b-48ec-4c8b-8db0-2371f036bba7','kid','bf5c6942-83ed-448c-9af1-6f848e7890f7'),('80a320bc-306d-43dd-a488-2899854f37bf','64471549-e88c-4f3f-b85e-98eb7031bbc7','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('843349c9-0e4c-447e-9fcc-04fe11fdf750','50b9d1f3-d33a-4347-ab3a-d67885f0d7b6','allowed-protocol-mapper-types','oidc-full-name-mapper'),('89bfee72-3f10-42dd-940a-24be4cf3aa8b','6bb83c5b-48ec-4c8b-8db0-2371f036bba7','secret','_3cSeVI8qPfbfBWlkVxpIg'),('8cd80bad-e89c-4cda-b7f0-957d7ee1a315','6bb83c5b-48ec-4c8b-8db0-2371f036bba7','priority','100'),('8e6acbc7-92de-4d9e-8728-8b484e94e163','64471549-e88c-4f3f-b85e-98eb7031bbc7','allowed-protocol-mapper-types','oidc-full-name-mapper'),('917d8ebc-c196-4996-aa0c-c3f0592b82cb','7fc32091-4c85-419f-bee1-292da390893a','secret','YoBxXzxBeslnMAqYi6YApF0vBy7ZK1CSSfAfr75FS-yH3C04Sibsf2Syn3S-RYTD63zs-jD9WezjIGU7STgXYQ'),('994b07a5-c241-44f9-b277-37663305fdea','1becf20e-3aa7-414d-b836-53d9ff279cf2','keyUse','enc'),('a4fcb11d-d0cb-44b7-9cfe-14c69644f0fd','50b9d1f3-d33a-4347-ab3a-d67885f0d7b6','allowed-protocol-mapper-types','saml-user-property-mapper'),('a769fbac-91fb-4dc6-b7b2-04c91bcaa5d6','ebc112f6-77e5-40e5-a75a-d4795e5341cb','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('a9d4418b-8d83-4cbe-b391-2d61048426ec','3929af18-bc0e-4021-9d0c-90b228eb1171','certificate','MIIClTCCAX0CBgF8apdLqTANBgkqhkiG9w0BAQsFADAOMQwwCgYDVQQDDANpYXMwHhcNMjExMDEwMTQyMjUyWhcNMzExMDEwMTQyNDMyWjAOMQwwCgYDVQQDDANpYXMwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCim1PdCifBsNTHOP7+kCTskYE+rnlyA56VOxnzZpStbElsg+EJbq+oJ9cWRqGkN3Y9hBubPoInC1EmPMGhNZbu2O6SBhW6vfMgdHIqb8ZRoT3/NE+pMItjgg7IVaB/GR423wm1EQdMH0PYG+s3FQRq1PGV6ySArzD8dPzmU7adtKA3t8W8AGl1cEMwEidacyXN/I4y44OyVcprUrztygkOBYWKXsICauUZJtN+ZrwJkvYaKYOpRxaLhGMZtqFknsFv/FeCPZPaHDQrMjpp8ldga9VSsb6bxFitkoBZlDPdePDM+aof/Hog10TMR/RT0JjMBAX09V9xlpPj76ruAHeFAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAAfaUGZqlKx7297aGv+/7T1vG/wLrkT6UhXJuxGS3DB7KCfedHBH+zDp4CdiFzH2YaPuwOkmTIRva2E9lTW6wdwoiXVB2q2RisifxtEV6OaZ+boQNSsINuj5I0d3S/tFToysq2h1eVsOwxaFDP7hHsN05PS68Pxn122vxLeTBNj7nr2g0MnZKc3OfwlsqvTYTmmTZBxOZVJF+1Pnlq3icHnvM4jwPPAr4gsiOfmsUyZ/mNHzz6XDerbJVyh/QqXc2geY9nvI7jmCSa5hLHvBap6nlv38B+5nPupD3+nW/N4X3xTtAngZFQ5X1HfqCANYI5KcH4QGxHqgUEE4M29W47A='),('aaeca9c6-1358-4482-8830-ab37286302a6','50b9d1f3-d33a-4347-ab3a-d67885f0d7b6','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('ad9d7e12-7620-4b48-bb0b-e3109682cb10','46cdabcc-4a9e-4304-aeb6-3e32d6aeed56','privateKey','MIIEpAIBAAKCAQEAq4/aq4JMsqEjm0ycZAMk71UL1r3ZUbyDfRIQlutKFAntx9v7D2KHftaykuFYOt03XXZQS7QvnzUV7C/yquRFjhS6m2HEjanP5/rpnyOngZqRSh0o8Wr3AbhbsDIHCWTtNyJf1j+C6htByXjgFmys8JWkx4WcuSlzVZKR1Od+rV/WC/wr1mdtuPA873CrqEePyNDuGC6Tw7tTLz/Aj+RezDXZj7OMfuROOpzaLO+eklogOTIpjdMMEVZLf7FhtXasl4CPB5WV3hB4YDFGBkzlpB+R4/m/3fK0Kw/N0h2/SzRw7kl7RtdpCarvoiNVeA1Kg4ulVjwm0mp5dJlIMaBi2wIDAQABAoIBAAkKtd2gKmans3a13PAwcjvi4ZLZwqBaLRvkXdd2YxsXQt7rqxmuebGnoxW2pq3Dhu14FNdIkdH0PEmMZV+4VCoe0Y7q4i8NKhXx1Wo7uNJN0SZ0zvmaR5ZhnwN0P4axOQdU2nQyOLYZ5ae2pSjJZXvwhxS06AOiOZ/i76im4rhEZKO7QLnhR9vaTlA5xQXIvdwBj+5WnSjpA88hkuaPXK42lqjfPkJs4HNGq/zejHnE9NUKe0Fz+JOBAdFO9KhdQytngALEEC2nmwewuAnfjr8VrlezezuCUSa7ioE0hXtrCJSmO6IRJYqY5eb0PxAZ+nkzntvm/OSH6BSrWesH8MECgYEA3t3eI7yRV2wtq8sWpTtbejJqGHEwDZUs2mdHfTCz7eMlaIjoUgQ2cgglgSFQG80zl7ua3y0VJfoumhuzLM6nwIFtEhNDJTffSWehnbqdp5Sfq3aqkLYT7uOLdoFRainZuwqYKEMyPOFx7yW/peHW6GowHWJk4nWFb7/fyq27oqsCgYEAxRFeLtqwKJjKtR+aHi0NBMgaWbxyoOY0lrasEY4o7/p2NqmP2drybXR+0GhgtUtYJZ5my8p9ajSvOqG/zXwV9ffvXMSV0QWruOF0jPoJnoNjCXS76zDyI+xNQSxnoXmp3hWWUyPnBHMMWLIv83O+tz8Agsy37kZNy0G8tTkLwJECgYEAmHvlCT5zkwUJGomRrOu34xurS53l6uUuEyCm4Rj5gsHvTl6d1b/cIJlCT9+jF+KGckKB7EDEP3+1cuuQ5A9g522mWr+jKUvZEjg9c9XDGG2v8Xj3qptpeAFn4mUId0K7HiZZhPK05MK7WYzSW4TxrYM5+GDh9a/C5Hq7e8jyoJECgYEAn4s6FvDR4Wwh4JVfLsMGYTKnsrLQktcNCF+H2waeufqqLgMFBTkvP9IqwQtgECaZjIs7ag3bj1pr6yn8oJ2vId3CmfZF3F2c8ycENwZPN1fjnEo3wWd1AgRTX0pV8/MNxVDwzQqqA34pJr3L+GtiofSNs1eOKYgdf0sPPiCbFSECgYBdNfh5oYcZPjIZpMRJjWY8jmYh+vbKrWkMaBA6MYKFtfnCN7eBLBe0f9isBvzN/59vTObpdcpJBIhRDqf5v1cElwXinxsC6bwNbKS6xwCd8Cq5CxJtRE4mx973vRagoqyimVqh1C3hx2d5F9RyDBS+6iwLhLAp6odcdjPXLAVAvA=='),('bf9d5da2-a67b-4833-9625-717aa3626ea8','9578ca8b-1ee3-4adf-a595-4d56b8a7ff47','keyUse','sig'),('c1dc33a5-7868-4540-b8aa-806fb1c32f8f','ebc112f6-77e5-40e5-a75a-d4795e5341cb','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('c2309dfe-bcbd-4e65-9604-4fedef0aab97','77192398-2926-4544-ba64-064ad5ef198f','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('c977893e-4cad-4c87-8a8d-96943f0ef2c6','50b9d1f3-d33a-4347-ab3a-d67885f0d7b6','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('ce01262f-def7-4246-8f55-7e602e19d0ba','77192398-2926-4544-ba64-064ad5ef198f','allowed-protocol-mapper-types','oidc-full-name-mapper'),('d1517d65-01c1-4150-897d-97909665d54d','020b6581-f488-492b-b6d4-c2937de17902','secret','iI0u1eFcbTawktIr52BQXImXjFf_MhFdtIjPxkXAVDVAw6B1OqDuMFnRTebMBYJfNzm-y9_m9HDGj1JCcfqcVw'),('d31318ee-f2b4-4369-b511-02cf998b0176','57e8cee7-4c51-490b-839c-285fa11fc6c1','priority','100'),('d5430305-b287-40d7-9234-934110437324','1becf20e-3aa7-414d-b836-53d9ff279cf2','privateKey','MIIEowIBAAKCAQEAlZn7oIqrV3HU5h93dTTY/9yJFV0PCO/ahPrYEw3vO4bkSDg8iEpYjBkIqB9sZhYg9unJkRqVu54u6f6L8oC7j5vPbqKIF3SGj9EFMTmQJJJfnzUNGBmYfENJb1dzuW7ypS112DN7XxRbcz5l1aFZwIWNUzTnC/1Yr6bC/htziYQifQJygZDp2DuGBtAM4EewhQzSAjYCVNrpmtPgD1ep81rV9JGSvJeLdm4ya4lQh5uDAMwq+KEBmq0NwFRtw+QFynalgB9U0ipzbuE3sxc+4tGtv8ORUweXbHYEPxHIX/n6D1ONaklmlY/QKyCO6LTr+tJyIhheXPmDLQEVJmjd5wIDAQABAoIBAEZbgvIABZE8oeoQhngDAMNkjrwTZgzH8Td1WcWsWgTe7eHhQObAQGCzLVUUYkCoy5wUW434uM7iGCJIar0EOjHSD35yxhpx3Q8qOIzsC5SHmp0fsCbTctmOM60/rddaDJgOh0vE+pK+2jua7v3HwpQ+uzaUvMzwu5LwlOg5NN9JIeC3TvnXDgEjfQPkU638vQc36PUdh0avJukIhdjbp3mz/ay/S655aZh4gBQbk1H96xlsvmSyAEB/HQFHJdpjowJaOSdWQcqyOJbaoOJzbznWrHWNv0lLE7wzBTUPNNFntLdsw9C0FY6X3fBXmwnQfPwfH+ArCaavlJ92Et50LEECgYEA3wP+81Oji5bCpt4B5x8QzTiF6Z9PpCUGpyes/aA4HauHLyxLqXJI8ck18X77OFEyfezZ027yaZgJFi1krZ3Ju6EHxjCmYuJ0VeJb6p8MDj3/Xurail+8x88idGt6dUpV38K8ykZ8SKF5OCnaANeUIVyYuMO51ixq+SZoXlqK1XcCgYEAq7pR/R5LqArf1B4t6pk6HmLtmUHWxDaFIC3A8u83/1IUm5A8AdxQKUR7vdqq1lW6sIfhM0vRRVBnfRxUPacUJf+pWVNdS0xjDBTO2+lmOUmxDJmFu7EK4aCgNlbzlf2ZjaxgDN28FooDDeDnT0e763Q2zO0e+lRk6pzxCOLVFxECgYEAmuSdmMcImhT10Qv06l+LPd36NE7v86O7wTEvV2CGWSUfWUY8rs2vmC8WBksZlP3gQdHVYKJ4P5rXBM42VNd4m5a2XZLAnYGHJ3d2O7iHmQS6b2RSsTTZWzWkSpOzk+8zQZxxn1PhUljEZpu6zEbunVVAxWM7mWN0UOO6LX5ZWvUCgYAJS1VCqNAZcTU6CsQbbV2a5WnMoKaaCgVcf31w6IeUVwHshXrp8t2XzjAQT3Rtk0g+Y6xJlXHnGXnwaIcaqx9JCzRENGHZQHIf5kRn3JL+yME/WFPHm8Zl/caOCli2pnoYE9tC9wFGCwQtTR3XyZ8fGDQbFT5W+BhaJlJZU8WKsQKBgDvS0gdBMpXEvhDNgCvnDUNLoRzQapP3dEEFNP/TfW1lNDr2RvQ7kBH59+pEeJzgy06qYbZm4YGlRZKqBUHqOAQqDmkqhdiV7lrRJFcunroIgY2GeausA94c0qlnV+jtD4Bf5GZSVyNi11GRg84a2qENCi8gFVR3P3vYJ0GnV007'),('d7950474-b09e-4179-bb67-a77cc7a817fd','774fc7e1-d927-41b8-b86d-a6a577c01f1f','host-sending-registration-request-must-match','true'),('dd48d3ea-71f6-4201-91ea-304a5a1b33ee','774fc7e1-d927-41b8-b86d-a6a577c01f1f','client-uris-must-match','true'),('dfe323a8-9fd2-4287-bd38-e9d925dff99e','7fc32091-4c85-419f-bee1-292da390893a','kid','3940781a-f2a3-4d3d-ba78-26f1d5c90fda'),('e3733d97-02b3-428c-8d99-7257f5e54e7e','3929af18-bc0e-4021-9d0c-90b228eb1171','priority','100'),('e448b4e3-d05d-43df-be27-220e1fecbaad','9ba2601b-b1ff-4b79-994c-85e11fbde842','max-clients','200'),('e7bbf79a-229c-4cbf-b767-9cfd5f0431e7','bbfe778e-1ddb-4baa-a3cd-fe032d128402','allow-default-scopes','true'),('ea494ed1-40d5-49cf-b0dd-f6c1241f1c42','7e058513-2bad-4c3d-89f8-9f17ad3e4db1','allow-default-scopes','true'),('fef2d332-a0a1-43af-9b55-94343fdaab35','1becf20e-3aa7-414d-b836-53d9ff279cf2','priority','100');
/*!40000 ALTER TABLE `COMPONENT_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPOSITE_ROLE`
--

DROP TABLE IF EXISTS `COMPOSITE_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPOSITE_ROLE` (
  `COMPOSITE` varchar(36) NOT NULL,
  `CHILD_ROLE` varchar(36) NOT NULL,
  PRIMARY KEY (`COMPOSITE`,`CHILD_ROLE`),
  KEY `IDX_COMPOSITE` (`COMPOSITE`),
  KEY `IDX_COMPOSITE_CHILD` (`CHILD_ROLE`),
  CONSTRAINT `FK_A63WVEKFTU8JO1PNJ81E7MCE2` FOREIGN KEY (`COMPOSITE`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_GR7THLLB9LU8Q4VQA4524JJY8` FOREIGN KEY (`CHILD_ROLE`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPOSITE_ROLE`
--

LOCK TABLES `COMPOSITE_ROLE` WRITE;
/*!40000 ALTER TABLE `COMPOSITE_ROLE` DISABLE KEYS */;
INSERT INTO `COMPOSITE_ROLE` VALUES ('1116b374-bd68-4938-87dd-26cff414bc20','e1c65ef9-7f72-4ecf-836a-efe9637baefe'),('1ecb5eac-444f-4ebd-9c5b-48afc5d958fa','5c4131d9-355a-468f-8068-8ceaac2fcfb5'),('1ecb5eac-444f-4ebd-9c5b-48afc5d958fa','8f636b28-9a43-4d73-b620-2d8b60bc090d'),('58b5ff7b-5c0b-4381-a5c7-c19190336111','1e69716d-4169-43ef-9986-e304da19444e'),('7296c420-b364-416b-8fb8-fca1ee4debe8','09e2b341-d2a7-4715-b998-261bdd32568e'),('7296c420-b364-416b-8fb8-fca1ee4debe8','1ecb5eac-444f-4ebd-9c5b-48afc5d958fa'),('7296c420-b364-416b-8fb8-fca1ee4debe8','1f1d3c22-39ce-4b0c-8ae3-2db5d48618fa'),('7296c420-b364-416b-8fb8-fca1ee4debe8','241945e8-97c3-4dd8-b646-8d10f3181429'),('7296c420-b364-416b-8fb8-fca1ee4debe8','29af42af-b954-4f41-872d-0c9f82f64b49'),('7296c420-b364-416b-8fb8-fca1ee4debe8','465b4fc6-1116-4f22-93ff-6a039d3c56f9'),('7296c420-b364-416b-8fb8-fca1ee4debe8','5c088ccf-1b06-417e-94a4-aa292516e93b'),('7296c420-b364-416b-8fb8-fca1ee4debe8','5c4131d9-355a-468f-8068-8ceaac2fcfb5'),('7296c420-b364-416b-8fb8-fca1ee4debe8','5db84ce1-b87c-4b5c-866d-f425f2ba565e'),('7296c420-b364-416b-8fb8-fca1ee4debe8','64dec002-b07d-4a89-93c2-7b17bc2682dd'),('7296c420-b364-416b-8fb8-fca1ee4debe8','89d09830-dfb3-4c01-87df-059fd293cf98'),('7296c420-b364-416b-8fb8-fca1ee4debe8','8d21d58e-47c8-4735-8450-68c73a49aa0d'),('7296c420-b364-416b-8fb8-fca1ee4debe8','8de14db7-d5f4-4c1f-9a19-36c9807d9dad'),('7296c420-b364-416b-8fb8-fca1ee4debe8','8ed9e7ff-ee79-42a3-a3ea-414412e957b5'),('7296c420-b364-416b-8fb8-fca1ee4debe8','8f636b28-9a43-4d73-b620-2d8b60bc090d'),('7296c420-b364-416b-8fb8-fca1ee4debe8','8f9725bc-539f-4945-8500-fb6548290c1a'),('7296c420-b364-416b-8fb8-fca1ee4debe8','9306ea87-e767-4292-a9c1-0a7239687e5d'),('7296c420-b364-416b-8fb8-fca1ee4debe8','988c1731-f8d2-4570-9636-0eada719812c'),('7296c420-b364-416b-8fb8-fca1ee4debe8','a51abb29-704e-47a2-a3c1-e50b084f43c8'),('7296c420-b364-416b-8fb8-fca1ee4debe8','ac9460e4-2ef5-4fec-9c2c-c4d7ad40f86a'),('7296c420-b364-416b-8fb8-fca1ee4debe8','af7865c7-5231-4d84-a0b9-458a61439516'),('7296c420-b364-416b-8fb8-fca1ee4debe8','c4c4d568-dd56-478b-9f3e-3496b54b1089'),('7296c420-b364-416b-8fb8-fca1ee4debe8','c6eee638-30ab-463b-b0a5-095a99baeb59'),('7296c420-b364-416b-8fb8-fca1ee4debe8','c94ded91-1635-4866-9300-e4b8e85a5ba4'),('7296c420-b364-416b-8fb8-fca1ee4debe8','ca9138cd-6f9e-4574-a1d7-d36d46e75a4b'),('7296c420-b364-416b-8fb8-fca1ee4debe8','ceef98f3-c473-48cc-a8f3-da3aa1c44c74'),('7296c420-b364-416b-8fb8-fca1ee4debe8','cf81adc8-27be-4847-b00e-d9676d061452'),('7296c420-b364-416b-8fb8-fca1ee4debe8','d1e6fdc2-f96b-43de-89e6-240d7f390108'),('7296c420-b364-416b-8fb8-fca1ee4debe8','d29c60f6-4d7a-4892-94c3-fe74e5a90d86'),('7296c420-b364-416b-8fb8-fca1ee4debe8','d3d6fd0d-ae2c-41bc-9474-26ab0eb82d5e'),('7296c420-b364-416b-8fb8-fca1ee4debe8','da12a11a-c5e1-4491-822a-e09e69aab52c'),('7296c420-b364-416b-8fb8-fca1ee4debe8','f217fb07-e50f-4a97-917d-3dbb00ad6c98'),('7296c420-b364-416b-8fb8-fca1ee4debe8','f261c937-41f8-487d-85c6-06dce4302e64'),('7296c420-b364-416b-8fb8-fca1ee4debe8','f58b0cbd-a182-4493-8be9-d35fcbc66cbd'),('7296c420-b364-416b-8fb8-fca1ee4debe8','f7613346-1308-4e4c-91e0-195a255a2cbe'),('7296c420-b364-416b-8fb8-fca1ee4debe8','fd04f63e-983c-4fb3-a9ab-1a45086f67b3'),('7296c420-b364-416b-8fb8-fca1ee4debe8','ff71ad99-1899-4f96-8ca8-9355c1f87607'),('751d2057-9bb9-436d-a48e-5d90ef3978ae','98f987d3-0489-4b49-8d7d-7377d8482515'),('c6eee638-30ab-463b-b0a5-095a99baeb59','89d09830-dfb3-4c01-87df-059fd293cf98'),('c6eee638-30ab-463b-b0a5-095a99baeb59','f261c937-41f8-487d-85c6-06dce4302e64'),('c7953691-e7a4-4fd8-b617-d5c69c59472f','58b5ff7b-5c0b-4381-a5c7-c19190336111'),('c7953691-e7a4-4fd8-b617-d5c69c59472f','b2825f1c-b67f-45ce-ac83-881af5cd8122'),('c7953691-e7a4-4fd8-b617-d5c69c59472f','c391dbdb-02b2-44af-a090-5ad2c52fa067'),('c7953691-e7a4-4fd8-b617-d5c69c59472f','e0d5dabb-e02b-4fe8-a8fd-50bd3f7e0f91'),('ca9138cd-6f9e-4574-a1d7-d36d46e75a4b','d29c60f6-4d7a-4892-94c3-fe74e5a90d86'),('cb4a2ab8-8899-48c0-9c25-042751b55223','86d10618-d183-4bcc-b022-a47ada317805'),('cb4a2ab8-8899-48c0-9c25-042751b55223','f6a924f6-a67d-4c7a-a799-91e6792ae2c2'),('e4112d36-90a7-4c0c-963b-39efd1812e49','01b2f51e-a8e8-48dc-bb84-567c504a27a7'),('e4112d36-90a7-4c0c-963b-39efd1812e49','1116b374-bd68-4938-87dd-26cff414bc20'),('e4112d36-90a7-4c0c-963b-39efd1812e49','24884348-c85f-4a23-b1ae-b13a2d09e041'),('e4112d36-90a7-4c0c-963b-39efd1812e49','2ce180f0-b0a3-452b-9b45-abd687861ed3'),('e4112d36-90a7-4c0c-963b-39efd1812e49','3735391e-7247-41ca-98dc-96479cc5913a'),('e4112d36-90a7-4c0c-963b-39efd1812e49','3a52155a-1092-411f-a8c6-4d69688a6130'),('e4112d36-90a7-4c0c-963b-39efd1812e49','48460b6a-d533-4300-a3fa-cb74551d9a55'),('e4112d36-90a7-4c0c-963b-39efd1812e49','487f95c2-f27c-4a52-945a-730aebfcbb16'),('e4112d36-90a7-4c0c-963b-39efd1812e49','698602b4-66ba-4f02-a1d1-49d2a7cc1785'),('e4112d36-90a7-4c0c-963b-39efd1812e49','734c832a-ba58-4cd4-9ea6-d20476198ba6'),('e4112d36-90a7-4c0c-963b-39efd1812e49','79b93d78-6d74-4ff7-acbc-5f33bd579375'),('e4112d36-90a7-4c0c-963b-39efd1812e49','7b8df8f6-ca82-4031-a889-5e68e87957fa'),('e4112d36-90a7-4c0c-963b-39efd1812e49','86d10618-d183-4bcc-b022-a47ada317805'),('e4112d36-90a7-4c0c-963b-39efd1812e49','91bc5b6a-7ab7-4e38-bb97-2e3cc45baa3f'),('e4112d36-90a7-4c0c-963b-39efd1812e49','b7982f06-e842-4c4c-811f-3c2b23708e17'),('e4112d36-90a7-4c0c-963b-39efd1812e49','cb4a2ab8-8899-48c0-9c25-042751b55223'),('e4112d36-90a7-4c0c-963b-39efd1812e49','e1c65ef9-7f72-4ecf-836a-efe9637baefe'),('e4112d36-90a7-4c0c-963b-39efd1812e49','f6a924f6-a67d-4c7a-a799-91e6792ae2c2'),('e5e998cc-407c-49ff-8b70-e12c2904a907','069d1ea3-5335-4601-aa4c-375de60a0781'),('e5e998cc-407c-49ff-8b70-e12c2904a907','7e20fc2c-3384-4547-a620-ac054a608815'),('e5e998cc-407c-49ff-8b70-e12c2904a907','dcaf70bb-2a90-4660-a7d3-336d9c1f2bf3'),('e5e998cc-407c-49ff-8b70-e12c2904a907','fb273d07-c3ab-4c83-94e9-d2b402556b1c'),('f27d17a2-12b3-4915-9b3d-a13efb053da1','39dcae65-3a8e-4328-9122-3535306e63ba'),('fb273d07-c3ab-4c83-94e9-d2b402556b1c','1ea40a4f-00cc-4a14-94b7-ba79ea64c154'),('ff71ad99-1899-4f96-8ca8-9355c1f87607','9306ea87-e767-4292-a9c1-0a7239687e5d');
/*!40000 ALTER TABLE `COMPOSITE_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CREDENTIAL`
--

DROP TABLE IF EXISTS `CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_CREDENTIAL` (`USER_ID`),
  CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CREDENTIAL`
--

LOCK TABLES `CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `CREDENTIAL` DISABLE KEYS */;
INSERT INTO `CREDENTIAL` VALUES ('31bb6143-c929-4169-9cbb-ace7fc551c60',NULL,'password','3a993f66-fb14-462b-9c55-04294191362b',1633875946992,NULL,'{\"value\":\"FjE4WbP7iiER+E5PfM8Vrfw11cdkaTrSN5+rjoS1BAXVWhSDWP4Y3CCjyy127DIaMf1Mhdh4y/ErWNUwUrbSjQ==\",\"salt\":\"BN3SfpSVLBVhL/kEYW7mNQ==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('415b30f8-9e07-48a0-a69e-7438a5c74246',NULL,'password','6107a8fe-a872-4ad1-99e1-76e8e3040247',1633875695709,NULL,'{\"value\":\"ZW7gkmxbxVVruND7oMLbYqAaWj23MJR2YNkoaR572S6+0lGz3sNenn5de5AbELjC5eJhjh1I8IXFew0AqV9lCA==\",\"salt\":\"fM+y5fXOJ8MNgjfE4a62dw==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10);
/*!40000 ALTER TABLE `CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2021-10-10 14:21:15',1,'EXECUTED','7:4e70412f24a3f382c82183742ec79317','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'3875672773'),('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2021-10-10 14:21:15',2,'MARK_RAN','7:cb16724583e9675711801c6875114f28','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'3875672773'),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2021-10-10 14:21:15',3,'EXECUTED','7:0310eb8ba07cec616460794d42ade0fa','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...','',NULL,'3.5.4',NULL,NULL,'3875672773'),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2021-10-10 14:21:15',4,'EXECUTED','7:5d25857e708c3233ef4439df1f93f012','renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'3875672773'),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2021-10-10 14:21:17',5,'EXECUTED','7:c7a54a1041d58eb3817a4a883b4d4e84','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'3875672773'),('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2021-10-10 14:21:17',6,'MARK_RAN','7:2e01012df20974c1c2a605ef8afe25b7','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'3875672773'),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2021-10-10 14:21:18',7,'EXECUTED','7:0f08df48468428e0f30ee59a8ec01a41','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'3875672773'),('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2021-10-10 14:21:18',8,'MARK_RAN','7:a77ea2ad226b345e7d689d366f185c8c','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'3875672773'),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2021-10-10 14:21:18',9,'EXECUTED','7:a3377a2059aefbf3b90ebb4c4cc8e2ab','update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'3875672773'),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2021-10-10 14:21:19',10,'EXECUTED','7:04c1dbedc2aa3e9756d1a1668e003451','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...','',NULL,'3.5.4',NULL,NULL,'3875672773'),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2021-10-10 14:21:20',11,'EXECUTED','7:36ef39ed560ad07062d956db861042ba','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'3875672773'),('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2021-10-10 14:21:20',12,'MARK_RAN','7:d909180b2530479a716d3f9c9eaea3d7','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'3875672773'),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2021-10-10 14:21:20',13,'EXECUTED','7:cf12b04b79bea5152f165eb41f3955f6','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'3875672773'),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2021-10-10 14:21:20',14,'EXECUTED','7:7e32c8f05c755e8675764e7d5f514509','addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...','',NULL,'3.5.4',NULL,NULL,'3875672773'),('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2021-10-10 14:21:20',15,'MARK_RAN','7:980ba23cc0ec39cab731ce903dd01291','delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'3875672773'),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2021-10-10 14:21:20',16,'MARK_RAN','7:2fa220758991285312eb84f3b4ff5336','dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...','',NULL,'3.5.4',NULL,NULL,'3875672773'),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2021-10-10 14:21:20',17,'EXECUTED','7:d41d8cd98f00b204e9800998ecf8427e','empty','',NULL,'3.5.4',NULL,NULL,'3875672773'),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2021-10-10 14:21:21',18,'EXECUTED','7:91ace540896df890cc00a0490ee52bbc','createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...','',NULL,'3.5.4',NULL,NULL,'3875672773'),('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2021-10-10 14:21:21',19,'EXECUTED','7:c31d1646dfa2618a9335c00e07f89f24','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'3875672773'),('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2021-10-10 14:21:21',20,'EXECUTED','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'3875672773'),('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2021-10-10 14:21:21',21,'MARK_RAN','7:f987971fe6b37d963bc95fee2b27f8df','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'3875672773'),('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2021-10-10 14:21:21',22,'MARK_RAN','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'3875672773'),('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2021-10-10 14:21:22',23,'EXECUTED','7:ed2dc7f799d19ac452cbcda56c929e47','update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...','',NULL,'3.5.4',NULL,NULL,'3875672773'),('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2021-10-10 14:21:22',24,'EXECUTED','7:80b5db88a5dda36ece5f235be8757615','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'3875672773'),('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2021-10-10 14:21:22',25,'MARK_RAN','7:1437310ed1305a9b93f8848f301726ce','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'3875672773'),('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2021-10-10 14:21:22',26,'EXECUTED','7:b82ffb34850fa0836be16deefc6a87c4','createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...','',NULL,'3.5.4',NULL,NULL,'3875672773'),('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2021-10-10 14:21:23',27,'EXECUTED','7:9cc98082921330d8d9266decdd4bd658','createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...','',NULL,'3.5.4',NULL,NULL,'3875672773'),('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2021-10-10 14:21:23',28,'EXECUTED','7:03d64aeed9cb52b969bd30a7ac0db57e','update tableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'3875672773'),('2.1.0-KEYCLOAK-5461','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2021-10-10 14:21:23',29,'EXECUTED','7:f1f9fd8710399d725b780f463c6b21cd','createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...','',NULL,'3.5.4',NULL,NULL,'3875672773'),('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2021-10-10 14:21:24',30,'EXECUTED','7:53188c3eb1107546e6f765835705b6c1','addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...','',NULL,'3.5.4',NULL,NULL,'3875672773'),('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2021-10-10 14:21:24',31,'EXECUTED','7:d6e6f3bc57a0c5586737d1351725d4d4','createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...','',NULL,'3.5.4',NULL,NULL,'3875672773'),('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2021-10-10 14:21:24',32,'EXECUTED','7:454d604fbd755d9df3fd9c6329043aa5','customChange','',NULL,'3.5.4',NULL,NULL,'3875672773'),('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2021-10-10 14:21:24',33,'EXECUTED','7:57e98a3077e29caf562f7dbf80c72600','customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'3875672773'),('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2021-10-10 14:21:24',34,'MARK_RAN','7:e4c7e8f2256210aee71ddc42f538b57a','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'3875672773'),('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2021-10-10 14:21:25',35,'EXECUTED','7:09a43c97e49bc626460480aa1379b522','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'3875672773'),('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2021-10-10 14:21:25',36,'EXECUTED','7:26bfc7c74fefa9126f2ce702fb775553','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'3875672773'),('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2021-10-10 14:21:25',37,'EXECUTED','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'3875672773'),('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2021-10-10 14:21:25',38,'EXECUTED','7:37fc1781855ac5388c494f1442b3f717','addColumn tableName=FED_USER_CONSENT','',NULL,'3.5.4',NULL,NULL,'3875672773'),('3.0.0','bburke@redhat.com','META-INF/jpa-changelog-3.0.0.xml','2021-10-10 14:21:25',39,'EXECUTED','7:13a27db0dae6049541136adad7261d27','addColumn tableName=IDENTITY_PROVIDER','',NULL,'3.5.4',NULL,NULL,'3875672773'),('3.2.0-fix','keycloak','META-INF/jpa-changelog-3.2.0.xml','2021-10-10 14:21:25',40,'MARK_RAN','7:550300617e3b59e8af3a6294df8248a3','addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'3875672773'),('3.2.0-fix-with-keycloak-5416','keycloak','META-INF/jpa-changelog-3.2.0.xml','2021-10-10 14:21:25',41,'MARK_RAN','7:e3a9482b8931481dc2772a5c07c44f17','dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'3875672773'),('3.2.0-fix-offline-sessions','hmlnarik','META-INF/jpa-changelog-3.2.0.xml','2021-10-10 14:21:25',42,'EXECUTED','7:72b07d85a2677cb257edb02b408f332d','customChange','',NULL,'3.5.4',NULL,NULL,'3875672773'),('3.2.0-fixed','keycloak','META-INF/jpa-changelog-3.2.0.xml','2021-10-10 14:21:26',43,'EXECUTED','7:a72a7858967bd414835d19e04d880312','addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...','',NULL,'3.5.4',NULL,NULL,'3875672773'),('3.3.0','keycloak','META-INF/jpa-changelog-3.3.0.xml','2021-10-10 14:21:26',44,'EXECUTED','7:94edff7cf9ce179e7e85f0cd78a3cf2c','addColumn tableName=USER_ENTITY','',NULL,'3.5.4',NULL,NULL,'3875672773'),('authz-3.4.0.CR1-resource-server-pk-change-part1','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2021-10-10 14:21:26',45,'EXECUTED','7:6a48ce645a3525488a90fbf76adf3bb3','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'3875672773'),('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2021-10-10 14:21:26',46,'EXECUTED','7:e64b5dcea7db06077c6e57d3b9e5ca14','customChange','',NULL,'3.5.4',NULL,NULL,'3875672773'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2021-10-10 14:21:26',47,'MARK_RAN','7:fd8cf02498f8b1e72496a20afc75178c','dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'3875672773'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2021-10-10 14:21:27',48,'EXECUTED','7:542794f25aa2b1fbabb7e577d6646319','addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...','',NULL,'3.5.4',NULL,NULL,'3875672773'),('authn-3.4.0.CR1-refresh-token-max-reuse','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2021-10-10 14:21:27',49,'EXECUTED','7:edad604c882df12f74941dac3cc6d650','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'3875672773'),('3.4.0','keycloak','META-INF/jpa-changelog-3.4.0.xml','2021-10-10 14:21:28',50,'EXECUTED','7:0f88b78b7b46480eb92690cbf5e44900','addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...','',NULL,'3.5.4',NULL,NULL,'3875672773'),('3.4.0-KEYCLOAK-5230','hmlnarik@redhat.com','META-INF/jpa-changelog-3.4.0.xml','2021-10-10 14:21:28',51,'EXECUTED','7:d560e43982611d936457c327f872dd59','createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...','',NULL,'3.5.4',NULL,NULL,'3875672773'),('3.4.1','psilva@redhat.com','META-INF/jpa-changelog-3.4.1.xml','2021-10-10 14:21:28',52,'EXECUTED','7:c155566c42b4d14ef07059ec3b3bbd8e','modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'3875672773'),('3.4.2','keycloak','META-INF/jpa-changelog-3.4.2.xml','2021-10-10 14:21:28',53,'EXECUTED','7:b40376581f12d70f3c89ba8ddf5b7dea','update tableName=REALM','',NULL,'3.5.4',NULL,NULL,'3875672773'),('3.4.2-KEYCLOAK-5172','mkanis@redhat.com','META-INF/jpa-changelog-3.4.2.xml','2021-10-10 14:21:28',54,'EXECUTED','7:a1132cc395f7b95b3646146c2e38f168','update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'3875672773'),('4.0.0-KEYCLOAK-6335','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2021-10-10 14:21:28',55,'EXECUTED','7:d8dc5d89c789105cfa7ca0e82cba60af','createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS','',NULL,'3.5.4',NULL,NULL,'3875672773'),('4.0.0-CLEANUP-UNUSED-TABLE','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2021-10-10 14:21:28',56,'EXECUTED','7:7822e0165097182e8f653c35517656a3','dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING','',NULL,'3.5.4',NULL,NULL,'3875672773'),('4.0.0-KEYCLOAK-6228','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2021-10-10 14:21:28',57,'EXECUTED','7:c6538c29b9c9a08f9e9ea2de5c2b6375','dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...','',NULL,'3.5.4',NULL,NULL,'3875672773'),('4.0.0-KEYCLOAK-5579-fixed','mposolda@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2021-10-10 14:21:30',58,'EXECUTED','7:6d4893e36de22369cf73bcb051ded875','dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...','',NULL,'3.5.4',NULL,NULL,'3875672773'),('authz-4.0.0.CR1','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.CR1.xml','2021-10-10 14:21:30',59,'EXECUTED','7:57960fc0b0f0dd0563ea6f8b2e4a1707','createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...','',NULL,'3.5.4',NULL,NULL,'3875672773'),('authz-4.0.0.Beta3','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.Beta3.xml','2021-10-10 14:21:30',60,'EXECUTED','7:2b4b8bff39944c7097977cc18dbceb3b','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'3875672773'),('authz-4.2.0.Final','mhajas@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2021-10-10 14:21:31',61,'EXECUTED','7:2aa42a964c59cd5b8ca9822340ba33a8','createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...','',NULL,'3.5.4',NULL,NULL,'3875672773'),('authz-4.2.0.Final-KEYCLOAK-9944','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2021-10-10 14:21:31',62,'EXECUTED','7:9ac9e58545479929ba23f4a3087a0346','addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS','',NULL,'3.5.4',NULL,NULL,'3875672773'),('4.2.0-KEYCLOAK-6313','wadahiro@gmail.com','META-INF/jpa-changelog-4.2.0.xml','2021-10-10 14:21:31',63,'EXECUTED','7:14d407c35bc4fe1976867756bcea0c36','addColumn tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'3875672773'),('4.3.0-KEYCLOAK-7984','wadahiro@gmail.com','META-INF/jpa-changelog-4.3.0.xml','2021-10-10 14:21:31',64,'EXECUTED','7:241a8030c748c8548e346adee548fa93','update tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'3875672773'),('4.6.0-KEYCLOAK-7950','psilva@redhat.com','META-INF/jpa-changelog-4.6.0.xml','2021-10-10 14:21:31',65,'EXECUTED','7:7d3182f65a34fcc61e8d23def037dc3f','update tableName=RESOURCE_SERVER_RESOURCE','',NULL,'3.5.4',NULL,NULL,'3875672773'),('4.6.0-KEYCLOAK-8377','keycloak','META-INF/jpa-changelog-4.6.0.xml','2021-10-10 14:21:31',66,'EXECUTED','7:b30039e00a0b9715d430d1b0636728fa','createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...','',NULL,'3.5.4',NULL,NULL,'3875672773'),('4.6.0-KEYCLOAK-8555','gideonray@gmail.com','META-INF/jpa-changelog-4.6.0.xml','2021-10-10 14:21:31',67,'EXECUTED','7:3797315ca61d531780f8e6f82f258159','createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT','',NULL,'3.5.4',NULL,NULL,'3875672773'),('4.7.0-KEYCLOAK-1267','sguilhen@redhat.com','META-INF/jpa-changelog-4.7.0.xml','2021-10-10 14:21:31',68,'EXECUTED','7:c7aa4c8d9573500c2d347c1941ff0301','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'3875672773'),('4.7.0-KEYCLOAK-7275','keycloak','META-INF/jpa-changelog-4.7.0.xml','2021-10-10 14:21:31',69,'EXECUTED','7:b207faee394fc074a442ecd42185a5dd','renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...','',NULL,'3.5.4',NULL,NULL,'3875672773'),('4.8.0-KEYCLOAK-8835','sguilhen@redhat.com','META-INF/jpa-changelog-4.8.0.xml','2021-10-10 14:21:31',70,'EXECUTED','7:ab9a9762faaba4ddfa35514b212c4922','addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'3875672773'),('authz-7.0.0-KEYCLOAK-10443','psilva@redhat.com','META-INF/jpa-changelog-authz-7.0.0.xml','2021-10-10 14:21:31',71,'EXECUTED','7:b9710f74515a6ccb51b72dc0d19df8c4','addColumn tableName=RESOURCE_SERVER','',NULL,'3.5.4',NULL,NULL,'3875672773'),('8.0.0-adding-credential-columns','keycloak','META-INF/jpa-changelog-8.0.0.xml','2021-10-10 14:21:31',72,'EXECUTED','7:ec9707ae4d4f0b7452fee20128083879','addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'3875672773'),('8.0.0-updating-credential-data-not-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2021-10-10 14:21:31',73,'EXECUTED','7:3979a0ae07ac465e920ca696532fc736','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'3875672773'),('8.0.0-updating-credential-data-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2021-10-10 14:21:31',74,'MARK_RAN','7:5abfde4c259119d143bd2fbf49ac2bca','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'3875672773'),('8.0.0-credential-cleanup-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2021-10-10 14:21:32',75,'EXECUTED','7:b48da8c11a3d83ddd6b7d0c8c2219345','dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...','',NULL,'3.5.4',NULL,NULL,'3875672773'),('8.0.0-resource-tag-support','keycloak','META-INF/jpa-changelog-8.0.0.xml','2021-10-10 14:21:32',76,'EXECUTED','7:a73379915c23bfad3e8f5c6d5c0aa4bd','addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL','',NULL,'3.5.4',NULL,NULL,'3875672773'),('9.0.0-always-display-client','keycloak','META-INF/jpa-changelog-9.0.0.xml','2021-10-10 14:21:32',77,'EXECUTED','7:39e0073779aba192646291aa2332493d','addColumn tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'3875672773'),('9.0.0-drop-constraints-for-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2021-10-10 14:21:32',78,'MARK_RAN','7:81f87368f00450799b4bf42ea0b3ec34','dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...','',NULL,'3.5.4',NULL,NULL,'3875672773'),('9.0.0-increase-column-size-federated-fk','keycloak','META-INF/jpa-changelog-9.0.0.xml','2021-10-10 14:21:32',79,'EXECUTED','7:20b37422abb9fb6571c618148f013a15','modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...','',NULL,'3.5.4',NULL,NULL,'3875672773'),('9.0.0-recreate-constraints-after-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2021-10-10 14:21:32',80,'MARK_RAN','7:1970bb6cfb5ee800736b95ad3fb3c78a','addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...','',NULL,'3.5.4',NULL,NULL,'3875672773'),('9.0.1-add-index-to-client.client_id','keycloak','META-INF/jpa-changelog-9.0.1.xml','2021-10-10 14:21:32',81,'EXECUTED','7:45d9b25fc3b455d522d8dcc10a0f4c80','createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'3875672773'),('9.0.1-KEYCLOAK-12579-drop-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2021-10-10 14:21:32',82,'MARK_RAN','7:890ae73712bc187a66c2813a724d037f','dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'3875672773'),('9.0.1-KEYCLOAK-12579-add-not-null-constraint','keycloak','META-INF/jpa-changelog-9.0.1.xml','2021-10-10 14:21:32',83,'EXECUTED','7:0a211980d27fafe3ff50d19a3a29b538','addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'3875672773'),('9.0.1-KEYCLOAK-12579-recreate-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2021-10-10 14:21:32',84,'MARK_RAN','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'3875672773'),('9.0.1-add-index-to-events','keycloak','META-INF/jpa-changelog-9.0.1.xml','2021-10-10 14:21:32',85,'EXECUTED','7:01c49302201bdf815b0a18d1f98a55dc','createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'3875672773'),('map-remove-ri','keycloak','META-INF/jpa-changelog-11.0.0.xml','2021-10-10 14:21:32',86,'EXECUTED','7:3dace6b144c11f53f1ad2c0361279b86','dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9','',NULL,'3.5.4',NULL,NULL,'3875672773'),('map-remove-ri','keycloak','META-INF/jpa-changelog-12.0.0.xml','2021-10-10 14:21:32',87,'EXECUTED','7:578d0b92077eaf2ab95ad0ec087aa903','dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...','',NULL,'3.5.4',NULL,NULL,'3875672773'),('12.1.0-add-realm-localization-table','keycloak','META-INF/jpa-changelog-12.0.0.xml','2021-10-10 14:21:32',88,'EXECUTED','7:c95abe90d962c57a09ecaee57972835d','createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS','',NULL,'3.5.4',NULL,NULL,'3875672773'),('default-roles','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-10-10 14:21:32',89,'EXECUTED','7:f1313bcc2994a5c4dc1062ed6d8282d3','addColumn tableName=REALM; customChange','',NULL,'3.5.4',NULL,NULL,'3875672773'),('default-roles-cleanup','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-10-10 14:21:32',90,'EXECUTED','7:90d763b52eaffebefbcbde55f269508b','dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES','',NULL,'3.5.4',NULL,NULL,'3875672773'),('13.0.0-KEYCLOAK-16844','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-10-10 14:21:32',91,'EXECUTED','7:d554f0cb92b764470dccfa5e0014a7dd','createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'3875672773'),('map-remove-ri-13.0.0','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-10-10 14:21:32',92,'EXECUTED','7:73193e3ab3c35cf0f37ccea3bf783764','dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...','',NULL,'3.5.4',NULL,NULL,'3875672773'),('13.0.0-KEYCLOAK-17992-drop-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-10-10 14:21:32',93,'MARK_RAN','7:90a1e74f92e9cbaa0c5eab80b8a037f3','dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT','',NULL,'3.5.4',NULL,NULL,'3875672773'),('13.0.0-increase-column-size-federated','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-10-10 14:21:32',94,'EXECUTED','7:5b9248f29cd047c200083cc6d8388b16','modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT','',NULL,'3.5.4',NULL,NULL,'3875672773'),('13.0.0-KEYCLOAK-17992-recreate-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-10-10 14:21:32',95,'MARK_RAN','7:64db59e44c374f13955489e8990d17a1','addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...','',NULL,'3.5.4',NULL,NULL,'3875672773'),('json-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-10-10 14:21:32',96,'EXECUTED','7:329a578cdb43262fff975f0a7f6cda60','addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE','',NULL,'3.5.4',NULL,NULL,'3875672773'),('14.0.0-KEYCLOAK-11019','keycloak','META-INF/jpa-changelog-14.0.0.xml','2021-10-10 14:21:32',97,'EXECUTED','7:fae0de241ac0fd0bbc2b380b85e4f567','createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'3875672773'),('14.0.0-KEYCLOAK-18286','keycloak','META-INF/jpa-changelog-14.0.0.xml','2021-10-10 14:21:32',98,'MARK_RAN','7:075d54e9180f49bb0c64ca4218936e81','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'3875672773'),('14.0.0-KEYCLOAK-18286-revert','keycloak','META-INF/jpa-changelog-14.0.0.xml','2021-10-10 14:21:32',99,'MARK_RAN','7:06499836520f4f6b3d05e35a59324910','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'3875672773'),('14.0.0-KEYCLOAK-18286-supported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2021-10-10 14:21:32',100,'EXECUTED','7:b558ad47ea0e4d3c3514225a49cc0d65','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'3875672773'),('14.0.0-KEYCLOAK-18286-unsupported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2021-10-10 14:21:32',101,'MARK_RAN','7:3d2b23076e59c6f70bae703aa01be35b','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'3875672773'),('KEYCLOAK-17267-add-index-to-user-attributes','keycloak','META-INF/jpa-changelog-14.0.0.xml','2021-10-10 14:21:32',102,'EXECUTED','7:1a7f28ff8d9e53aeb879d76ea3d9341a','createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE','',NULL,'3.5.4',NULL,NULL,'3875672773'),('KEYCLOAK-18146-add-saml-art-binding-identifier','keycloak','META-INF/jpa-changelog-14.0.0.xml','2021-10-10 14:21:32',103,'EXECUTED','7:2fd554456fed4a82c698c555c5b751b6','customChange','',NULL,'3.5.4',NULL,NULL,'3875672773'),('15.0.0-KEYCLOAK-18467','keycloak','META-INF/jpa-changelog-15.0.0.xml','2021-10-10 14:21:32',104,'EXECUTED','7:b06356d66c2790ecc2ae54ba0458397a','addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...','',NULL,'3.5.4',NULL,NULL,'3875672773');
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1,_binary '\0',NULL,NULL),(1000,_binary '\0',NULL,NULL),(1001,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEFAULT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `DEFAULT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEFAULT_CLIENT_SCOPE` (
  `REALM_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`REALM_ID`,`SCOPE_ID`),
  KEY `IDX_DEFCLS_REALM` (`REALM_ID`),
  KEY `IDX_DEFCLS_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_R_DEF_CLI_SCOPE_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEFAULT_CLIENT_SCOPE`
--

LOCK TABLES `DEFAULT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('ias','313a7bf7-8e07-4de9-9683-dfb73167f487',_binary '\0'),('ias','39268d8a-17b5-48b1-9183-21c2c1f2d43e',_binary ''),('ias','53ad39f2-fc13-4433-9bc5-11bd6190c795',_binary '\0'),('ias','5755dfef-515a-4de5-b836-84c970222efd',_binary ''),('ias','6b81ca3a-ffc8-4323-89ac-2d7a98780dab',_binary '\0'),('ias','76350a65-39d6-40c7-9897-8bf0bec8ca5c',_binary ''),('ias','99c6158f-a751-4534-a7a0-c44abfc08db7',_binary '\0'),('ias','bc884bfa-5c80-4424-ac83-cafcb007f3ea',_binary ''),('ias','bcd64792-adbb-432b-ae1f-b6250679eb90',_binary ''),('master','0d2adae3-9c3f-466b-a0a0-f752702bfdd2',_binary '\0'),('master','18400ef8-fbae-4f84-807e-0acaa7bbee4d',_binary '\0'),('master','2459308e-fddf-4b3a-899b-55d5a0fc1294',_binary ''),('master','7cda1a4b-e080-4720-8b27-5608836577bd',_binary ''),('master','af515964-3d12-4f67-8772-3873fbceed28',_binary '\0'),('master','b16581f0-4322-411b-980f-0dd7c2b7ac72',_binary '\0'),('master','bf087016-cb94-4c2d-ab57-fde45ac05718',_binary ''),('master','cb3046bf-efc2-4875-86e2-f57a04bfa569',_binary ''),('master','d86ee1f1-07a3-4a4f-8abb-9d749493654b',_binary '');
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENT_ENTITY`
--

DROP TABLE IF EXISTS `EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `DETAILS_JSON` varchar(2550) DEFAULT NULL,
  `ERROR` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `SESSION_ID` varchar(255) DEFAULT NULL,
  `EVENT_TIME` bigint(20) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_EVENT_TIME` (`REALM_ID`,`EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENT_ENTITY`
--

LOCK TABLES `EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_IDENTITY`
--

DROP TABLE IF EXISTS `FEDERATED_IDENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_IDENTITY` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FEDERATED_USER_ID` varchar(255) DEFAULT NULL,
  `FEDERATED_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`),
  KEY `IDX_FEDIDENTITY_USER` (`USER_ID`),
  KEY `IDX_FEDIDENTITY_FEDUSER` (`FEDERATED_USER_ID`),
  CONSTRAINT `FK404288B92EF007A6` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_IDENTITY`
--

LOCK TABLES `FEDERATED_IDENTITY` WRITE;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_USER`
--

DROP TABLE IF EXISTS `FEDERATED_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_USER` (
  `ID` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_USER`
--

LOCK TABLES `FEDERATED_USER` WRITE;
/*!40000 ALTER TABLE `FEDERATED_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `FED_USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `VALUE` varchar(2024) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_ATTRIBUTE` (`USER_ID`,`REALM_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ATTRIBUTE`
--

LOCK TABLES `FED_USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint(20) DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CONSENT` (`USER_ID`,`CLIENT_ID`),
  KEY `IDX_FU_CONSENT_RU` (`REALM_ID`,`USER_ID`),
  KEY `IDX_FU_CNSNT_EXT` (`USER_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT`
--

LOCK TABLES `FED_USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT_CL_SCOPE`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT_CL_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT_CL_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT_CL_SCOPE`
--

LOCK TABLES `FED_USER_CONSENT_CL_SCOPE` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CREDENTIAL`
--

DROP TABLE IF EXISTS `FED_USER_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CREDENTIAL` (`USER_ID`,`TYPE`),
  KEY `IDX_FU_CREDENTIAL_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CREDENTIAL`
--

LOCK TABLES `FED_USER_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `FED_USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP` (`USER_ID`,`GROUP_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `FED_USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `FED_USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_REQUIRED_ACTION` (
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_FU_REQUIRED_ACTION` (`USER_ID`,`REQUIRED_ACTION`),
  KEY `IDX_FU_REQUIRED_ACTION_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_REQUIRED_ACTION`
--

LOCK TABLES `FED_USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `FED_USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_FU_ROLE_MAPPING` (`USER_ID`,`ROLE_ID`),
  KEY `IDX_FU_ROLE_MAPPING_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ROLE_MAPPING`
--

LOCK TABLES `FED_USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ATTRIBUTE`
--

DROP TABLE IF EXISTS `GROUP_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GROUP_ATTR_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ATTRIBUTE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ATTRIBUTE`
--

LOCK TABLES `GROUP_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `GROUP_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`GROUP_ID`),
  KEY `IDX_GROUP_ROLE_MAPP_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ROLE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ROLE_MAPPING`
--

LOCK TABLES `GROUP_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER` (
  `INTERNAL_ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ALIAS` varchar(255) DEFAULT NULL,
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `STORE_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `AUTHENTICATE_BY_DEFAULT` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ADD_TOKEN_ROLE` bit(1) NOT NULL DEFAULT b'1',
  `TRUST_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `FIRST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `POST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `LINK_ONLY` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`INTERNAL_ID`),
  UNIQUE KEY `UK_2DAELWNIBJI49AVXSRTUF6XJ33` (`PROVIDER_ALIAS`,`REALM_ID`),
  KEY `IDX_IDENT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK2B4EBC52AE5C3B34` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER`
--

LOCK TABLES `IDENTITY_PROVIDER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_CONFIG`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_CONFIG` (
  `IDENTITY_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FKDC4897CF864C4E43` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `IDENTITY_PROVIDER` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_CONFIG`
--

LOCK TABLES `IDENTITY_PROVIDER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_MAPPER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `IDP_ALIAS` varchar(255) NOT NULL,
  `IDP_MAPPER_NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ID_PROV_MAPP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_IDPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_MAPPER`
--

LOCK TABLES `IDENTITY_PROVIDER_MAPPER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `IDP_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDP_MAPPER_CONFIG` (
  `IDP_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDP_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_IDPMCONFIG` FOREIGN KEY (`IDP_MAPPER_ID`) REFERENCES `IDENTITY_PROVIDER_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_MAPPER_CONFIG`
--

LOCK TABLES `IDP_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_GROUP`
--

DROP TABLE IF EXISTS `KEYCLOAK_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_GROUP` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `PARENT_GROUP` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SIBLING_NAMES` (`REALM_ID`,`PARENT_GROUP`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_GROUP`
--

LOCK TABLES `KEYCLOAK_GROUP` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_ROLE`
--

DROP TABLE IF EXISTS `KEYCLOAK_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_ROLE` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_REALM_CONSTRAINT` varchar(255) DEFAULT NULL,
  `CLIENT_ROLE` bit(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `CLIENT` varchar(36) DEFAULT NULL,
  `REALM` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
  KEY `IDX_KEYCLOAK_ROLE_CLIENT` (`CLIENT`),
  KEY `IDX_KEYCLOAK_ROLE_REALM` (`REALM`),
  CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_ROLE`
--

LOCK TABLES `KEYCLOAK_ROLE` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_ROLE` VALUES ('01b2f51e-a8e8-48dc-bb84-567c504a27a7','56c9a6a6-510a-441d-b3ac-786925735a57',_binary '','${role_manage-users}','manage-users','ias','56c9a6a6-510a-441d-b3ac-786925735a57',NULL),('069d1ea3-5335-4601-aa4c-375de60a0781','9fe0ddbf-37a6-40ef-8174-61d6e1b6df86',_binary '','${role_view-profile}','view-profile','ias','9fe0ddbf-37a6-40ef-8174-61d6e1b6df86',NULL),('09015771-b10a-429e-8950-2046a11ab71d','3c04d5eb-fe24-4756-862e-a932791e7a75',_binary '','${role_view-applications}','view-applications','master','3c04d5eb-fe24-4756-862e-a932791e7a75',NULL),('09e2b341-d2a7-4715-b998-261bdd32568e','e702d638-b763-454f-8514-9af9c7c5530e',_binary '','${role_manage-events}','manage-events','master','e702d638-b763-454f-8514-9af9c7c5530e',NULL),('1116b374-bd68-4938-87dd-26cff414bc20','56c9a6a6-510a-441d-b3ac-786925735a57',_binary '','${role_view-clients}','view-clients','ias','56c9a6a6-510a-441d-b3ac-786925735a57',NULL),('17a34ed1-31cc-4ce5-a8c7-edd784241f75','9fe0ddbf-37a6-40ef-8174-61d6e1b6df86',_binary '','${role_delete-account}','delete-account','ias','9fe0ddbf-37a6-40ef-8174-61d6e1b6df86',NULL),('1e69716d-4169-43ef-9986-e304da19444e','3c04d5eb-fe24-4756-862e-a932791e7a75',_binary '','${role_manage-account-links}','manage-account-links','master','3c04d5eb-fe24-4756-862e-a932791e7a75',NULL),('1ea40a4f-00cc-4a14-94b7-ba79ea64c154','9fe0ddbf-37a6-40ef-8174-61d6e1b6df86',_binary '','${role_manage-account-links}','manage-account-links','ias','9fe0ddbf-37a6-40ef-8174-61d6e1b6df86',NULL),('1ecb5eac-444f-4ebd-9c5b-48afc5d958fa','e702d638-b763-454f-8514-9af9c7c5530e',_binary '','${role_view-users}','view-users','master','e702d638-b763-454f-8514-9af9c7c5530e',NULL),('1f1d3c22-39ce-4b0c-8ae3-2db5d48618fa','e702d638-b763-454f-8514-9af9c7c5530e',_binary '','${role_manage-identity-providers}','manage-identity-providers','master','e702d638-b763-454f-8514-9af9c7c5530e',NULL),('241945e8-97c3-4dd8-b646-8d10f3181429','master',_binary '\0','${role_create-realm}','create-realm','master',NULL,NULL),('24884348-c85f-4a23-b1ae-b13a2d09e041','56c9a6a6-510a-441d-b3ac-786925735a57',_binary '','${role_impersonation}','impersonation','ias','56c9a6a6-510a-441d-b3ac-786925735a57',NULL),('29af42af-b954-4f41-872d-0c9f82f64b49','e702d638-b763-454f-8514-9af9c7c5530e',_binary '','${role_manage-authorization}','manage-authorization','master','e702d638-b763-454f-8514-9af9c7c5530e',NULL),('2ce180f0-b0a3-452b-9b45-abd687861ed3','56c9a6a6-510a-441d-b3ac-786925735a57',_binary '','${role_manage-events}','manage-events','ias','56c9a6a6-510a-441d-b3ac-786925735a57',NULL),('3735391e-7247-41ca-98dc-96479cc5913a','56c9a6a6-510a-441d-b3ac-786925735a57',_binary '','${role_view-identity-providers}','view-identity-providers','ias','56c9a6a6-510a-441d-b3ac-786925735a57',NULL),('39dcae65-3a8e-4328-9122-3535306e63ba','9fe0ddbf-37a6-40ef-8174-61d6e1b6df86',_binary '','${role_view-consent}','view-consent','ias','9fe0ddbf-37a6-40ef-8174-61d6e1b6df86',NULL),('3a52155a-1092-411f-a8c6-4d69688a6130','56c9a6a6-510a-441d-b3ac-786925735a57',_binary '','${role_manage-authorization}','manage-authorization','ias','56c9a6a6-510a-441d-b3ac-786925735a57',NULL),('3da153b7-048c-4768-9837-a052627f6004','61c765a6-d03e-4137-a5ed-db4cbfe571d0',_binary '','${role_read-token}','read-token','ias','61c765a6-d03e-4137-a5ed-db4cbfe571d0',NULL),('465b4fc6-1116-4f22-93ff-6a039d3c56f9','b090d4b0-5a7c-44ff-9985-06632767b68e',_binary '','${role_impersonation}','impersonation','master','b090d4b0-5a7c-44ff-9985-06632767b68e',NULL),('48460b6a-d533-4300-a3fa-cb74551d9a55','56c9a6a6-510a-441d-b3ac-786925735a57',_binary '','${role_view-events}','view-events','ias','56c9a6a6-510a-441d-b3ac-786925735a57',NULL),('487f95c2-f27c-4a52-945a-730aebfcbb16','56c9a6a6-510a-441d-b3ac-786925735a57',_binary '','${role_view-realm}','view-realm','ias','56c9a6a6-510a-441d-b3ac-786925735a57',NULL),('58b5ff7b-5c0b-4381-a5c7-c19190336111','3c04d5eb-fe24-4756-862e-a932791e7a75',_binary '','${role_manage-account}','manage-account','master','3c04d5eb-fe24-4756-862e-a932791e7a75',NULL),('5c088ccf-1b06-417e-94a4-aa292516e93b','b090d4b0-5a7c-44ff-9985-06632767b68e',_binary '','${role_manage-events}','manage-events','master','b090d4b0-5a7c-44ff-9985-06632767b68e',NULL),('5c4131d9-355a-468f-8068-8ceaac2fcfb5','e702d638-b763-454f-8514-9af9c7c5530e',_binary '','${role_query-groups}','query-groups','master','e702d638-b763-454f-8514-9af9c7c5530e',NULL),('5db84ce1-b87c-4b5c-866d-f425f2ba565e','e702d638-b763-454f-8514-9af9c7c5530e',_binary '','${role_query-realms}','query-realms','master','e702d638-b763-454f-8514-9af9c7c5530e',NULL),('64dec002-b07d-4a89-93c2-7b17bc2682dd','b090d4b0-5a7c-44ff-9985-06632767b68e',_binary '','${role_query-realms}','query-realms','master','b090d4b0-5a7c-44ff-9985-06632767b68e',NULL),('698602b4-66ba-4f02-a1d1-49d2a7cc1785','56c9a6a6-510a-441d-b3ac-786925735a57',_binary '','${role_view-authorization}','view-authorization','ias','56c9a6a6-510a-441d-b3ac-786925735a57',NULL),('7296c420-b364-416b-8fb8-fca1ee4debe8','master',_binary '\0','${role_admin}','admin','master',NULL,NULL),('734c832a-ba58-4cd4-9ea6-d20476198ba6','56c9a6a6-510a-441d-b3ac-786925735a57',_binary '','${role_manage-clients}','manage-clients','ias','56c9a6a6-510a-441d-b3ac-786925735a57',NULL),('751d2057-9bb9-436d-a48e-5d90ef3978ae','3c04d5eb-fe24-4756-862e-a932791e7a75',_binary '','${role_manage-consent}','manage-consent','master','3c04d5eb-fe24-4756-862e-a932791e7a75',NULL),('79b93d78-6d74-4ff7-acbc-5f33bd579375','56c9a6a6-510a-441d-b3ac-786925735a57',_binary '','${role_query-realms}','query-realms','ias','56c9a6a6-510a-441d-b3ac-786925735a57',NULL),('7b8df8f6-ca82-4031-a889-5e68e87957fa','56c9a6a6-510a-441d-b3ac-786925735a57',_binary '','${role_create-client}','create-client','ias','56c9a6a6-510a-441d-b3ac-786925735a57',NULL),('7e20fc2c-3384-4547-a620-ac054a608815','ias',_binary '\0','${role_uma_authorization}','uma_authorization','ias',NULL,NULL),('86d10618-d183-4bcc-b022-a47ada317805','56c9a6a6-510a-441d-b3ac-786925735a57',_binary '','${role_query-users}','query-users','ias','56c9a6a6-510a-441d-b3ac-786925735a57',NULL),('89d09830-dfb3-4c01-87df-059fd293cf98','b090d4b0-5a7c-44ff-9985-06632767b68e',_binary '','${role_query-groups}','query-groups','master','b090d4b0-5a7c-44ff-9985-06632767b68e',NULL),('8d21d58e-47c8-4735-8450-68c73a49aa0d','b090d4b0-5a7c-44ff-9985-06632767b68e',_binary '','${role_create-client}','create-client','master','b090d4b0-5a7c-44ff-9985-06632767b68e',NULL),('8de14db7-d5f4-4c1f-9a19-36c9807d9dad','b090d4b0-5a7c-44ff-9985-06632767b68e',_binary '','${role_manage-authorization}','manage-authorization','master','b090d4b0-5a7c-44ff-9985-06632767b68e',NULL),('8ed9e7ff-ee79-42a3-a3ea-414412e957b5','e702d638-b763-454f-8514-9af9c7c5530e',_binary '','${role_manage-users}','manage-users','master','e702d638-b763-454f-8514-9af9c7c5530e',NULL),('8f636b28-9a43-4d73-b620-2d8b60bc090d','e702d638-b763-454f-8514-9af9c7c5530e',_binary '','${role_query-users}','query-users','master','e702d638-b763-454f-8514-9af9c7c5530e',NULL),('8f9725bc-539f-4945-8500-fb6548290c1a','e702d638-b763-454f-8514-9af9c7c5530e',_binary '','${role_view-realm}','view-realm','master','e702d638-b763-454f-8514-9af9c7c5530e',NULL),('91bc5b6a-7ab7-4e38-bb97-2e3cc45baa3f','56c9a6a6-510a-441d-b3ac-786925735a57',_binary '','${role_manage-identity-providers}','manage-identity-providers','ias','56c9a6a6-510a-441d-b3ac-786925735a57',NULL),('9306ea87-e767-4292-a9c1-0a7239687e5d','b090d4b0-5a7c-44ff-9985-06632767b68e',_binary '','${role_query-clients}','query-clients','master','b090d4b0-5a7c-44ff-9985-06632767b68e',NULL),('988c1731-f8d2-4570-9636-0eada719812c','b090d4b0-5a7c-44ff-9985-06632767b68e',_binary '','${role_manage-users}','manage-users','master','b090d4b0-5a7c-44ff-9985-06632767b68e',NULL),('98f987d3-0489-4b49-8d7d-7377d8482515','3c04d5eb-fe24-4756-862e-a932791e7a75',_binary '','${role_view-consent}','view-consent','master','3c04d5eb-fe24-4756-862e-a932791e7a75',NULL),('a51abb29-704e-47a2-a3c1-e50b084f43c8','b090d4b0-5a7c-44ff-9985-06632767b68e',_binary '','${role_view-authorization}','view-authorization','master','b090d4b0-5a7c-44ff-9985-06632767b68e',NULL),('ac9460e4-2ef5-4fec-9c2c-c4d7ad40f86a','b090d4b0-5a7c-44ff-9985-06632767b68e',_binary '','${role_view-identity-providers}','view-identity-providers','master','b090d4b0-5a7c-44ff-9985-06632767b68e',NULL),('af7865c7-5231-4d84-a0b9-458a61439516','e702d638-b763-454f-8514-9af9c7c5530e',_binary '','${role_view-authorization}','view-authorization','master','e702d638-b763-454f-8514-9af9c7c5530e',NULL),('b02ef54c-0421-4fc5-a2eb-f2e049310925','84f4ebb2-45fd-470b-9cb5-cb116da34f1d',_binary '','${role_read-token}','read-token','master','84f4ebb2-45fd-470b-9cb5-cb116da34f1d',NULL),('b2825f1c-b67f-45ce-ac83-881af5cd8122','master',_binary '\0','${role_offline-access}','offline_access','master',NULL,NULL),('b7982f06-e842-4c4c-811f-3c2b23708e17','56c9a6a6-510a-441d-b3ac-786925735a57',_binary '','${role_manage-realm}','manage-realm','ias','56c9a6a6-510a-441d-b3ac-786925735a57',NULL),('c391dbdb-02b2-44af-a090-5ad2c52fa067','master',_binary '\0','${role_uma_authorization}','uma_authorization','master',NULL,NULL),('c4c4d568-dd56-478b-9f3e-3496b54b1089','b090d4b0-5a7c-44ff-9985-06632767b68e',_binary '','${role_view-events}','view-events','master','b090d4b0-5a7c-44ff-9985-06632767b68e',NULL),('c6eee638-30ab-463b-b0a5-095a99baeb59','b090d4b0-5a7c-44ff-9985-06632767b68e',_binary '','${role_view-users}','view-users','master','b090d4b0-5a7c-44ff-9985-06632767b68e',NULL),('c7953691-e7a4-4fd8-b617-d5c69c59472f','master',_binary '\0','${role_default-roles}','default-roles-master','master',NULL,NULL),('c94ded91-1635-4866-9300-e4b8e85a5ba4','b090d4b0-5a7c-44ff-9985-06632767b68e',_binary '','${role_manage-realm}','manage-realm','master','b090d4b0-5a7c-44ff-9985-06632767b68e',NULL),('ca9138cd-6f9e-4574-a1d7-d36d46e75a4b','e702d638-b763-454f-8514-9af9c7c5530e',_binary '','${role_view-clients}','view-clients','master','e702d638-b763-454f-8514-9af9c7c5530e',NULL),('cb4a2ab8-8899-48c0-9c25-042751b55223','56c9a6a6-510a-441d-b3ac-786925735a57',_binary '','${role_view-users}','view-users','ias','56c9a6a6-510a-441d-b3ac-786925735a57',NULL),('ceef98f3-c473-48cc-a8f3-da3aa1c44c74','e702d638-b763-454f-8514-9af9c7c5530e',_binary '','${role_view-identity-providers}','view-identity-providers','master','e702d638-b763-454f-8514-9af9c7c5530e',NULL),('cf81adc8-27be-4847-b00e-d9676d061452','e702d638-b763-454f-8514-9af9c7c5530e',_binary '','${role_view-events}','view-events','master','e702d638-b763-454f-8514-9af9c7c5530e',NULL),('d098b3cb-8079-4069-adec-b536b525f754','9fe0ddbf-37a6-40ef-8174-61d6e1b6df86',_binary '','${role_view-applications}','view-applications','ias','9fe0ddbf-37a6-40ef-8174-61d6e1b6df86',NULL),('d1e6fdc2-f96b-43de-89e6-240d7f390108','e702d638-b763-454f-8514-9af9c7c5530e',_binary '','${role_manage-realm}','manage-realm','master','e702d638-b763-454f-8514-9af9c7c5530e',NULL),('d29c60f6-4d7a-4892-94c3-fe74e5a90d86','e702d638-b763-454f-8514-9af9c7c5530e',_binary '','${role_query-clients}','query-clients','master','e702d638-b763-454f-8514-9af9c7c5530e',NULL),('d3d6fd0d-ae2c-41bc-9474-26ab0eb82d5e','b090d4b0-5a7c-44ff-9985-06632767b68e',_binary '','${role_view-realm}','view-realm','master','b090d4b0-5a7c-44ff-9985-06632767b68e',NULL),('d781db66-46cb-4b23-9995-f0c7d57854a6','3c04d5eb-fe24-4756-862e-a932791e7a75',_binary '','${role_delete-account}','delete-account','master','3c04d5eb-fe24-4756-862e-a932791e7a75',NULL),('da12a11a-c5e1-4491-822a-e09e69aab52c','b090d4b0-5a7c-44ff-9985-06632767b68e',_binary '','${role_manage-clients}','manage-clients','master','b090d4b0-5a7c-44ff-9985-06632767b68e',NULL),('dcaf70bb-2a90-4660-a7d3-336d9c1f2bf3','ias',_binary '\0','${role_offline-access}','offline_access','ias',NULL,NULL),('e0d5dabb-e02b-4fe8-a8fd-50bd3f7e0f91','3c04d5eb-fe24-4756-862e-a932791e7a75',_binary '','${role_view-profile}','view-profile','master','3c04d5eb-fe24-4756-862e-a932791e7a75',NULL),('e1c65ef9-7f72-4ecf-836a-efe9637baefe','56c9a6a6-510a-441d-b3ac-786925735a57',_binary '','${role_query-clients}','query-clients','ias','56c9a6a6-510a-441d-b3ac-786925735a57',NULL),('e4112d36-90a7-4c0c-963b-39efd1812e49','56c9a6a6-510a-441d-b3ac-786925735a57',_binary '','${role_realm-admin}','realm-admin','ias','56c9a6a6-510a-441d-b3ac-786925735a57',NULL),('e5e998cc-407c-49ff-8b70-e12c2904a907','ias',_binary '\0','${role_default-roles}','default-roles-ias','ias',NULL,NULL),('f217fb07-e50f-4a97-917d-3dbb00ad6c98','e702d638-b763-454f-8514-9af9c7c5530e',_binary '','${role_manage-clients}','manage-clients','master','e702d638-b763-454f-8514-9af9c7c5530e',NULL),('f261c937-41f8-487d-85c6-06dce4302e64','b090d4b0-5a7c-44ff-9985-06632767b68e',_binary '','${role_query-users}','query-users','master','b090d4b0-5a7c-44ff-9985-06632767b68e',NULL),('f27d17a2-12b3-4915-9b3d-a13efb053da1','9fe0ddbf-37a6-40ef-8174-61d6e1b6df86',_binary '','${role_manage-consent}','manage-consent','ias','9fe0ddbf-37a6-40ef-8174-61d6e1b6df86',NULL),('f58b0cbd-a182-4493-8be9-d35fcbc66cbd','e702d638-b763-454f-8514-9af9c7c5530e',_binary '','${role_impersonation}','impersonation','master','e702d638-b763-454f-8514-9af9c7c5530e',NULL),('f6a924f6-a67d-4c7a-a799-91e6792ae2c2','56c9a6a6-510a-441d-b3ac-786925735a57',_binary '','${role_query-groups}','query-groups','ias','56c9a6a6-510a-441d-b3ac-786925735a57',NULL),('f7613346-1308-4e4c-91e0-195a255a2cbe','b090d4b0-5a7c-44ff-9985-06632767b68e',_binary '','${role_manage-identity-providers}','manage-identity-providers','master','b090d4b0-5a7c-44ff-9985-06632767b68e',NULL),('fb273d07-c3ab-4c83-94e9-d2b402556b1c','9fe0ddbf-37a6-40ef-8174-61d6e1b6df86',_binary '','${role_manage-account}','manage-account','ias','9fe0ddbf-37a6-40ef-8174-61d6e1b6df86',NULL),('fd04f63e-983c-4fb3-a9ab-1a45086f67b3','e702d638-b763-454f-8514-9af9c7c5530e',_binary '','${role_create-client}','create-client','master','e702d638-b763-454f-8514-9af9c7c5530e',NULL),('ff71ad99-1899-4f96-8ca8-9355c1f87607','b090d4b0-5a7c-44ff-9985-06632767b68e',_binary '','${role_view-clients}','view-clients','master','b090d4b0-5a7c-44ff-9985-06632767b68e',NULL);
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MIGRATION_MODEL`
--

DROP TABLE IF EXISTS `MIGRATION_MODEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MIGRATION_MODEL` (
  `ID` varchar(36) NOT NULL,
  `VERSION` varchar(36) DEFAULT NULL,
  `UPDATE_TIME` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IDX_UPDATE_TIME` (`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MIGRATION_MODEL`
--

LOCK TABLES `MIGRATION_MODEL` WRITE;
/*!40000 ALTER TABLE `MIGRATION_MODEL` DISABLE KEYS */;
INSERT INTO `MIGRATION_MODEL` VALUES ('w10ft','15.0.2',1633875694);
/*!40000 ALTER TABLE `MIGRATION_MODEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_CLIENT_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_CLIENT_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `DATA` longtext,
  `CLIENT_STORAGE_PROVIDER` varchar(36) NOT NULL DEFAULT 'local',
  `EXTERNAL_CLIENT_ID` varchar(255) NOT NULL DEFAULT 'local',
  PRIMARY KEY (`USER_SESSION_ID`,`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`OFFLINE_FLAG`),
  KEY `IDX_US_SESS_ID_ON_CL_SESS` (`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_CSS_PRELOAD` (`CLIENT_ID`,`OFFLINE_FLAG`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_CLIENT_SESSION`
--

LOCK TABLES `OFFLINE_CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_USER_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_USER_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `CREATED_ON` int(11) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `DATA` longtext,
  `LAST_SESSION_REFRESH` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_CREATEDON` (`CREATED_ON`),
  KEY `IDX_OFFLINE_USS_PRELOAD` (`OFFLINE_FLAG`,`CREATED_ON`,`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_USS_BY_USER` (`USER_ID`,`REALM_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_BY_USERSESS` (`REALM_ID`,`OFFLINE_FLAG`,`USER_SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_USER_SESSION`
--

LOCK TABLES `OFFLINE_USER_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POLICY_CONFIG`
--

DROP TABLE IF EXISTS `POLICY_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `POLICY_CONFIG` (
  `POLICY_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext,
  PRIMARY KEY (`POLICY_ID`,`NAME`),
  CONSTRAINT `FKDC34197CF864C4E43` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POLICY_CONFIG`
--

LOCK TABLES `POLICY_CONFIG` WRITE;
/*!40000 ALTER TABLE `POLICY_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `POLICY_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PROTOCOL` varchar(255) NOT NULL,
  `PROTOCOL_MAPPER_NAME` varchar(255) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `CLIENT_SCOPE_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_PROTOCOL_MAPPER_CLIENT` (`CLIENT_ID`),
  KEY `IDX_CLSCOPE_PROTMAP` (`CLIENT_SCOPE_ID`),
  CONSTRAINT `FK_CLI_SCOPE_MAPPER` FOREIGN KEY (`CLIENT_SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`),
  CONSTRAINT `FK_PCM_REALM` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER`
--

LOCK TABLES `PROTOCOL_MAPPER` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER` VALUES ('061a9b80-3c85-4b7b-bcbe-cd329f9c640e','email','openid-connect','oidc-usermodel-property-mapper',NULL,'bc884bfa-5c80-4424-ac83-cafcb007f3ea'),('09cce9f1-ee81-43b0-890e-056bb4c08199','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'6b81ca3a-ffc8-4323-89ac-2d7a98780dab'),('0c34be6b-dc40-42f4-8a91-d9f976d04400','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'5755dfef-515a-4de5-b836-84c970222efd'),('161e4fa3-9611-48b3-b29f-2dc5f5d99316','address','openid-connect','oidc-address-mapper',NULL,'99c6158f-a751-4534-a7a0-c44abfc08db7'),('17b6fbb3-475b-479e-820a-85ee74c025a8','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'39268d8a-17b5-48b1-9183-21c2c1f2d43e'),('17f01557-a6e7-4564-bb7b-e4b465ef4d07','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'cb3046bf-efc2-4875-86e2-f57a04bfa569'),('19188f22-c835-45ff-8369-f231ee6283f1','full name','openid-connect','oidc-full-name-mapper',NULL,'7cda1a4b-e080-4720-8b27-5608836577bd'),('1afed892-97ec-429c-9006-db69f3567136','locale','openid-connect','oidc-usermodel-attribute-mapper','5b734b54-c78b-4b36-bf53-82d79c7c8467',NULL),('1bf0e534-08c3-4866-ab03-ec06775165bc','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'39268d8a-17b5-48b1-9183-21c2c1f2d43e'),('246c86e7-aeae-43fc-94d5-3dd984e1d85b','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'7cda1a4b-e080-4720-8b27-5608836577bd'),('24d3b8e1-7fb5-4b49-bbc0-68ac05571353','email','openid-connect','oidc-usermodel-property-mapper',NULL,'bf087016-cb94-4c2d-ab57-fde45ac05718'),('25d7acdf-717c-4a85-afc3-b59c597907bb','full name','openid-connect','oidc-full-name-mapper',NULL,'39268d8a-17b5-48b1-9183-21c2c1f2d43e'),('2977cc2a-6e17-438b-b470-30b35db53566','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'7cda1a4b-e080-4720-8b27-5608836577bd'),('298ce45b-e162-4a5a-9fb3-7dd20abeff6e','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'7cda1a4b-e080-4720-8b27-5608836577bd'),('3addfe5b-3c4b-4fad-80b4-706f8233ce70','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'6b81ca3a-ffc8-4323-89ac-2d7a98780dab'),('41691a14-bddc-4fef-8c2d-9a61ce1d85a6','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'39268d8a-17b5-48b1-9183-21c2c1f2d43e'),('4679bcb2-3dbf-475e-bc0b-2c4be60be265','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'39268d8a-17b5-48b1-9183-21c2c1f2d43e'),('4709a8fc-7930-4814-b329-7b2b24d5e570','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'53ad39f2-fc13-4433-9bc5-11bd6190c795'),('4b96ebd0-a20d-41f3-a97b-c8815a748b56','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'7cda1a4b-e080-4720-8b27-5608836577bd'),('50c1b20c-8ebf-4e11-8ab0-e8c7d6fb61dd','audience resolve','openid-connect','oidc-audience-resolve-mapper','7a84a3da-8dc2-43f2-ac9c-7ce7dfacdb25',NULL),('6490ba72-0cf7-4dac-8bc8-7f14dde63d5c','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'7cda1a4b-e080-4720-8b27-5608836577bd'),('64c2a3ba-6c91-4923-9b67-c2ee42a44378','username','openid-connect','oidc-usermodel-property-mapper',NULL,'7cda1a4b-e080-4720-8b27-5608836577bd'),('68e30c23-3b28-40c7-b68b-ab0d240d8abd','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'39268d8a-17b5-48b1-9183-21c2c1f2d43e'),('6a90ec22-dc59-4894-90d8-bf9dc1b9d80f','role list','saml','saml-role-list-mapper',NULL,'76350a65-39d6-40c7-9897-8bf0bec8ca5c'),('6ba9c4d5-d1f7-47b4-ace8-f77a430fc80c','locale','openid-connect','oidc-usermodel-attribute-mapper','6f20237f-7229-4ff6-9011-a90e501fe8f8',NULL),('71a11b2c-c2a4-4d57-b820-831095fa017d','role list','saml','saml-role-list-mapper',NULL,'d86ee1f1-07a3-4a4f-8abb-9d749493654b'),('726a8220-c3c3-452d-ae92-afca1d418d4f','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'b16581f0-4322-411b-980f-0dd7c2b7ac72'),('7bd059c7-4dba-4c31-b398-f300fffa20d4','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'18400ef8-fbae-4f84-807e-0acaa7bbee4d'),('80235b19-d236-437d-b907-375ad2a65741','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'5755dfef-515a-4de5-b836-84c970222efd'),('883aefde-5a5c-47e3-a8d0-23733586d11b','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'7cda1a4b-e080-4720-8b27-5608836577bd'),('89b1650f-da94-472f-8f13-4b5a44432a43','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'7cda1a4b-e080-4720-8b27-5608836577bd'),('8a7ce527-cb59-46bd-8d4c-464e43a679a3','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'39268d8a-17b5-48b1-9183-21c2c1f2d43e'),('8c447148-e607-4178-878a-64cca9f42ff7','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'bcd64792-adbb-432b-ae1f-b6250679eb90'),('8d3881f1-e76e-43a8-8a95-63b410ff82ef','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'2459308e-fddf-4b3a-899b-55d5a0fc1294'),('8d8d5c14-c20a-416a-b8ed-df9fea3c767c','username','openid-connect','oidc-usermodel-property-mapper',NULL,'39268d8a-17b5-48b1-9183-21c2c1f2d43e'),('919bcf6b-fc01-4504-9ef1-76d629540774','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'7cda1a4b-e080-4720-8b27-5608836577bd'),('96f1bfa7-88a9-4df6-8dd6-5165a10158fc','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'39268d8a-17b5-48b1-9183-21c2c1f2d43e'),('9dca009f-c299-4906-9041-31ee5c4517f6','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'39268d8a-17b5-48b1-9183-21c2c1f2d43e'),('a237bf54-939f-498b-880d-5290c6ee3bbf','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'cb3046bf-efc2-4875-86e2-f57a04bfa569'),('a4e1f842-6c24-43ec-8dc0-39fd9bb8cbf1','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'18400ef8-fbae-4f84-807e-0acaa7bbee4d'),('a6d5a105-0150-4518-a922-48d6ffa378e5','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'5755dfef-515a-4de5-b836-84c970222efd'),('aa01c509-2797-44a9-9752-cad0295251fe','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'7cda1a4b-e080-4720-8b27-5608836577bd'),('b5f4fed9-aed6-42f3-88ec-c460b2f210fd','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'b16581f0-4322-411b-980f-0dd7c2b7ac72'),('b74f11ce-8535-4914-9a70-40da6526772e','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'7cda1a4b-e080-4720-8b27-5608836577bd'),('cdbd5013-eb34-4c49-9494-17410dc73955','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'39268d8a-17b5-48b1-9183-21c2c1f2d43e'),('d7c93a67-4995-4a59-97d7-fa1ed9963144','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'39268d8a-17b5-48b1-9183-21c2c1f2d43e'),('dd7292f9-5de5-4e14-a4e9-13a74a9985df','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'7cda1a4b-e080-4720-8b27-5608836577bd'),('dee07ac9-2889-4d16-aef4-79d9b239a5c9','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'bf087016-cb94-4c2d-ab57-fde45ac05718'),('e06132e0-7cec-4c6d-92ba-8e376c6fa8be','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'cb3046bf-efc2-4875-86e2-f57a04bfa569'),('e378f511-2a35-4f81-9339-6202934c9c24','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'39268d8a-17b5-48b1-9183-21c2c1f2d43e'),('f198c131-0eb8-4216-a83b-a0294ebb5349','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'39268d8a-17b5-48b1-9183-21c2c1f2d43e'),('f2e15a91-546b-48b9-b3bd-ae312bca4138','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'bc884bfa-5c80-4424-ac83-cafcb007f3ea'),('f72d00c3-3f7f-4960-b0d6-12d53c71758b','address','openid-connect','oidc-address-mapper',NULL,'0d2adae3-9c3f-466b-a0a0-f752702bfdd2'),('f85d0510-8498-47d1-927c-16e1ad5b9561','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'7cda1a4b-e080-4720-8b27-5608836577bd'),('f868aa08-25b4-436f-9d8c-e236fe4d2fdd','audience resolve','openid-connect','oidc-audience-resolve-mapper','52dd3a56-5419-42f6-b96f-56a5f51ed33c',NULL),('fd8aaa5c-6ff0-49bb-9988-35b6f0bfdd9e','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'53ad39f2-fc13-4433-9bc5-11bd6190c795');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER_CONFIG` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`PROTOCOL_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_PMCONFIG` FOREIGN KEY (`PROTOCOL_MAPPER_ID`) REFERENCES `PROTOCOL_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER_CONFIG`
--

LOCK TABLES `PROTOCOL_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('061a9b80-3c85-4b7b-bcbe-cd329f9c640e','true','access.token.claim'),('061a9b80-3c85-4b7b-bcbe-cd329f9c640e','email','claim.name'),('061a9b80-3c85-4b7b-bcbe-cd329f9c640e','true','id.token.claim'),('061a9b80-3c85-4b7b-bcbe-cd329f9c640e','String','jsonType.label'),('061a9b80-3c85-4b7b-bcbe-cd329f9c640e','email','user.attribute'),('061a9b80-3c85-4b7b-bcbe-cd329f9c640e','true','userinfo.token.claim'),('09cce9f1-ee81-43b0-890e-056bb4c08199','true','access.token.claim'),('09cce9f1-ee81-43b0-890e-056bb4c08199','groups','claim.name'),('09cce9f1-ee81-43b0-890e-056bb4c08199','true','id.token.claim'),('09cce9f1-ee81-43b0-890e-056bb4c08199','String','jsonType.label'),('09cce9f1-ee81-43b0-890e-056bb4c08199','true','multivalued'),('09cce9f1-ee81-43b0-890e-056bb4c08199','foo','user.attribute'),('0c34be6b-dc40-42f4-8a91-d9f976d04400','true','access.token.claim'),('0c34be6b-dc40-42f4-8a91-d9f976d04400','realm_access.roles','claim.name'),('0c34be6b-dc40-42f4-8a91-d9f976d04400','String','jsonType.label'),('0c34be6b-dc40-42f4-8a91-d9f976d04400','true','multivalued'),('0c34be6b-dc40-42f4-8a91-d9f976d04400','foo','user.attribute'),('161e4fa3-9611-48b3-b29f-2dc5f5d99316','true','access.token.claim'),('161e4fa3-9611-48b3-b29f-2dc5f5d99316','true','id.token.claim'),('161e4fa3-9611-48b3-b29f-2dc5f5d99316','country','user.attribute.country'),('161e4fa3-9611-48b3-b29f-2dc5f5d99316','formatted','user.attribute.formatted'),('161e4fa3-9611-48b3-b29f-2dc5f5d99316','locality','user.attribute.locality'),('161e4fa3-9611-48b3-b29f-2dc5f5d99316','postal_code','user.attribute.postal_code'),('161e4fa3-9611-48b3-b29f-2dc5f5d99316','region','user.attribute.region'),('161e4fa3-9611-48b3-b29f-2dc5f5d99316','street','user.attribute.street'),('161e4fa3-9611-48b3-b29f-2dc5f5d99316','true','userinfo.token.claim'),('17b6fbb3-475b-479e-820a-85ee74c025a8','true','access.token.claim'),('17b6fbb3-475b-479e-820a-85ee74c025a8','gender','claim.name'),('17b6fbb3-475b-479e-820a-85ee74c025a8','true','id.token.claim'),('17b6fbb3-475b-479e-820a-85ee74c025a8','String','jsonType.label'),('17b6fbb3-475b-479e-820a-85ee74c025a8','gender','user.attribute'),('17b6fbb3-475b-479e-820a-85ee74c025a8','true','userinfo.token.claim'),('17f01557-a6e7-4564-bb7b-e4b465ef4d07','true','access.token.claim'),('17f01557-a6e7-4564-bb7b-e4b465ef4d07','resource_access.${client_id}.roles','claim.name'),('17f01557-a6e7-4564-bb7b-e4b465ef4d07','String','jsonType.label'),('17f01557-a6e7-4564-bb7b-e4b465ef4d07','true','multivalued'),('17f01557-a6e7-4564-bb7b-e4b465ef4d07','foo','user.attribute'),('19188f22-c835-45ff-8369-f231ee6283f1','true','access.token.claim'),('19188f22-c835-45ff-8369-f231ee6283f1','true','id.token.claim'),('19188f22-c835-45ff-8369-f231ee6283f1','true','userinfo.token.claim'),('1afed892-97ec-429c-9006-db69f3567136','true','access.token.claim'),('1afed892-97ec-429c-9006-db69f3567136','locale','claim.name'),('1afed892-97ec-429c-9006-db69f3567136','true','id.token.claim'),('1afed892-97ec-429c-9006-db69f3567136','String','jsonType.label'),('1afed892-97ec-429c-9006-db69f3567136','locale','user.attribute'),('1afed892-97ec-429c-9006-db69f3567136','true','userinfo.token.claim'),('1bf0e534-08c3-4866-ab03-ec06775165bc','true','access.token.claim'),('1bf0e534-08c3-4866-ab03-ec06775165bc','updated_at','claim.name'),('1bf0e534-08c3-4866-ab03-ec06775165bc','true','id.token.claim'),('1bf0e534-08c3-4866-ab03-ec06775165bc','String','jsonType.label'),('1bf0e534-08c3-4866-ab03-ec06775165bc','updatedAt','user.attribute'),('1bf0e534-08c3-4866-ab03-ec06775165bc','true','userinfo.token.claim'),('246c86e7-aeae-43fc-94d5-3dd984e1d85b','true','access.token.claim'),('246c86e7-aeae-43fc-94d5-3dd984e1d85b','family_name','claim.name'),('246c86e7-aeae-43fc-94d5-3dd984e1d85b','true','id.token.claim'),('246c86e7-aeae-43fc-94d5-3dd984e1d85b','String','jsonType.label'),('246c86e7-aeae-43fc-94d5-3dd984e1d85b','lastName','user.attribute'),('246c86e7-aeae-43fc-94d5-3dd984e1d85b','true','userinfo.token.claim'),('24d3b8e1-7fb5-4b49-bbc0-68ac05571353','true','access.token.claim'),('24d3b8e1-7fb5-4b49-bbc0-68ac05571353','email','claim.name'),('24d3b8e1-7fb5-4b49-bbc0-68ac05571353','true','id.token.claim'),('24d3b8e1-7fb5-4b49-bbc0-68ac05571353','String','jsonType.label'),('24d3b8e1-7fb5-4b49-bbc0-68ac05571353','email','user.attribute'),('24d3b8e1-7fb5-4b49-bbc0-68ac05571353','true','userinfo.token.claim'),('25d7acdf-717c-4a85-afc3-b59c597907bb','true','access.token.claim'),('25d7acdf-717c-4a85-afc3-b59c597907bb','true','id.token.claim'),('25d7acdf-717c-4a85-afc3-b59c597907bb','true','userinfo.token.claim'),('2977cc2a-6e17-438b-b470-30b35db53566','true','access.token.claim'),('2977cc2a-6e17-438b-b470-30b35db53566','gender','claim.name'),('2977cc2a-6e17-438b-b470-30b35db53566','true','id.token.claim'),('2977cc2a-6e17-438b-b470-30b35db53566','String','jsonType.label'),('2977cc2a-6e17-438b-b470-30b35db53566','gender','user.attribute'),('2977cc2a-6e17-438b-b470-30b35db53566','true','userinfo.token.claim'),('298ce45b-e162-4a5a-9fb3-7dd20abeff6e','true','access.token.claim'),('298ce45b-e162-4a5a-9fb3-7dd20abeff6e','picture','claim.name'),('298ce45b-e162-4a5a-9fb3-7dd20abeff6e','true','id.token.claim'),('298ce45b-e162-4a5a-9fb3-7dd20abeff6e','String','jsonType.label'),('298ce45b-e162-4a5a-9fb3-7dd20abeff6e','picture','user.attribute'),('298ce45b-e162-4a5a-9fb3-7dd20abeff6e','true','userinfo.token.claim'),('3addfe5b-3c4b-4fad-80b4-706f8233ce70','true','access.token.claim'),('3addfe5b-3c4b-4fad-80b4-706f8233ce70','upn','claim.name'),('3addfe5b-3c4b-4fad-80b4-706f8233ce70','true','id.token.claim'),('3addfe5b-3c4b-4fad-80b4-706f8233ce70','String','jsonType.label'),('3addfe5b-3c4b-4fad-80b4-706f8233ce70','username','user.attribute'),('3addfe5b-3c4b-4fad-80b4-706f8233ce70','true','userinfo.token.claim'),('41691a14-bddc-4fef-8c2d-9a61ce1d85a6','true','access.token.claim'),('41691a14-bddc-4fef-8c2d-9a61ce1d85a6','family_name','claim.name'),('41691a14-bddc-4fef-8c2d-9a61ce1d85a6','true','id.token.claim'),('41691a14-bddc-4fef-8c2d-9a61ce1d85a6','String','jsonType.label'),('41691a14-bddc-4fef-8c2d-9a61ce1d85a6','lastName','user.attribute'),('41691a14-bddc-4fef-8c2d-9a61ce1d85a6','true','userinfo.token.claim'),('4679bcb2-3dbf-475e-bc0b-2c4be60be265','true','access.token.claim'),('4679bcb2-3dbf-475e-bc0b-2c4be60be265','zoneinfo','claim.name'),('4679bcb2-3dbf-475e-bc0b-2c4be60be265','true','id.token.claim'),('4679bcb2-3dbf-475e-bc0b-2c4be60be265','String','jsonType.label'),('4679bcb2-3dbf-475e-bc0b-2c4be60be265','zoneinfo','user.attribute'),('4679bcb2-3dbf-475e-bc0b-2c4be60be265','true','userinfo.token.claim'),('4709a8fc-7930-4814-b329-7b2b24d5e570','true','access.token.claim'),('4709a8fc-7930-4814-b329-7b2b24d5e570','phone_number_verified','claim.name'),('4709a8fc-7930-4814-b329-7b2b24d5e570','true','id.token.claim'),('4709a8fc-7930-4814-b329-7b2b24d5e570','boolean','jsonType.label'),('4709a8fc-7930-4814-b329-7b2b24d5e570','phoneNumberVerified','user.attribute'),('4709a8fc-7930-4814-b329-7b2b24d5e570','true','userinfo.token.claim'),('4b96ebd0-a20d-41f3-a97b-c8815a748b56','true','access.token.claim'),('4b96ebd0-a20d-41f3-a97b-c8815a748b56','nickname','claim.name'),('4b96ebd0-a20d-41f3-a97b-c8815a748b56','true','id.token.claim'),('4b96ebd0-a20d-41f3-a97b-c8815a748b56','String','jsonType.label'),('4b96ebd0-a20d-41f3-a97b-c8815a748b56','nickname','user.attribute'),('4b96ebd0-a20d-41f3-a97b-c8815a748b56','true','userinfo.token.claim'),('6490ba72-0cf7-4dac-8bc8-7f14dde63d5c','true','access.token.claim'),('6490ba72-0cf7-4dac-8bc8-7f14dde63d5c','updated_at','claim.name'),('6490ba72-0cf7-4dac-8bc8-7f14dde63d5c','true','id.token.claim'),('6490ba72-0cf7-4dac-8bc8-7f14dde63d5c','String','jsonType.label'),('6490ba72-0cf7-4dac-8bc8-7f14dde63d5c','updatedAt','user.attribute'),('6490ba72-0cf7-4dac-8bc8-7f14dde63d5c','true','userinfo.token.claim'),('64c2a3ba-6c91-4923-9b67-c2ee42a44378','true','access.token.claim'),('64c2a3ba-6c91-4923-9b67-c2ee42a44378','preferred_username','claim.name'),('64c2a3ba-6c91-4923-9b67-c2ee42a44378','true','id.token.claim'),('64c2a3ba-6c91-4923-9b67-c2ee42a44378','String','jsonType.label'),('64c2a3ba-6c91-4923-9b67-c2ee42a44378','username','user.attribute'),('64c2a3ba-6c91-4923-9b67-c2ee42a44378','true','userinfo.token.claim'),('68e30c23-3b28-40c7-b68b-ab0d240d8abd','true','access.token.claim'),('68e30c23-3b28-40c7-b68b-ab0d240d8abd','given_name','claim.name'),('68e30c23-3b28-40c7-b68b-ab0d240d8abd','true','id.token.claim'),('68e30c23-3b28-40c7-b68b-ab0d240d8abd','String','jsonType.label'),('68e30c23-3b28-40c7-b68b-ab0d240d8abd','firstName','user.attribute'),('68e30c23-3b28-40c7-b68b-ab0d240d8abd','true','userinfo.token.claim'),('6a90ec22-dc59-4894-90d8-bf9dc1b9d80f','Role','attribute.name'),('6a90ec22-dc59-4894-90d8-bf9dc1b9d80f','Basic','attribute.nameformat'),('6a90ec22-dc59-4894-90d8-bf9dc1b9d80f','false','single'),('6ba9c4d5-d1f7-47b4-ace8-f77a430fc80c','true','access.token.claim'),('6ba9c4d5-d1f7-47b4-ace8-f77a430fc80c','locale','claim.name'),('6ba9c4d5-d1f7-47b4-ace8-f77a430fc80c','true','id.token.claim'),('6ba9c4d5-d1f7-47b4-ace8-f77a430fc80c','String','jsonType.label'),('6ba9c4d5-d1f7-47b4-ace8-f77a430fc80c','locale','user.attribute'),('6ba9c4d5-d1f7-47b4-ace8-f77a430fc80c','true','userinfo.token.claim'),('71a11b2c-c2a4-4d57-b820-831095fa017d','Role','attribute.name'),('71a11b2c-c2a4-4d57-b820-831095fa017d','Basic','attribute.nameformat'),('71a11b2c-c2a4-4d57-b820-831095fa017d','false','single'),('726a8220-c3c3-452d-ae92-afca1d418d4f','true','access.token.claim'),('726a8220-c3c3-452d-ae92-afca1d418d4f','upn','claim.name'),('726a8220-c3c3-452d-ae92-afca1d418d4f','true','id.token.claim'),('726a8220-c3c3-452d-ae92-afca1d418d4f','String','jsonType.label'),('726a8220-c3c3-452d-ae92-afca1d418d4f','username','user.attribute'),('726a8220-c3c3-452d-ae92-afca1d418d4f','true','userinfo.token.claim'),('7bd059c7-4dba-4c31-b398-f300fffa20d4','true','access.token.claim'),('7bd059c7-4dba-4c31-b398-f300fffa20d4','phone_number_verified','claim.name'),('7bd059c7-4dba-4c31-b398-f300fffa20d4','true','id.token.claim'),('7bd059c7-4dba-4c31-b398-f300fffa20d4','boolean','jsonType.label'),('7bd059c7-4dba-4c31-b398-f300fffa20d4','phoneNumberVerified','user.attribute'),('7bd059c7-4dba-4c31-b398-f300fffa20d4','true','userinfo.token.claim'),('883aefde-5a5c-47e3-a8d0-23733586d11b','true','access.token.claim'),('883aefde-5a5c-47e3-a8d0-23733586d11b','profile','claim.name'),('883aefde-5a5c-47e3-a8d0-23733586d11b','true','id.token.claim'),('883aefde-5a5c-47e3-a8d0-23733586d11b','String','jsonType.label'),('883aefde-5a5c-47e3-a8d0-23733586d11b','profile','user.attribute'),('883aefde-5a5c-47e3-a8d0-23733586d11b','true','userinfo.token.claim'),('89b1650f-da94-472f-8f13-4b5a44432a43','true','access.token.claim'),('89b1650f-da94-472f-8f13-4b5a44432a43','zoneinfo','claim.name'),('89b1650f-da94-472f-8f13-4b5a44432a43','true','id.token.claim'),('89b1650f-da94-472f-8f13-4b5a44432a43','String','jsonType.label'),('89b1650f-da94-472f-8f13-4b5a44432a43','zoneinfo','user.attribute'),('89b1650f-da94-472f-8f13-4b5a44432a43','true','userinfo.token.claim'),('8a7ce527-cb59-46bd-8d4c-464e43a679a3','true','access.token.claim'),('8a7ce527-cb59-46bd-8d4c-464e43a679a3','nickname','claim.name'),('8a7ce527-cb59-46bd-8d4c-464e43a679a3','true','id.token.claim'),('8a7ce527-cb59-46bd-8d4c-464e43a679a3','String','jsonType.label'),('8a7ce527-cb59-46bd-8d4c-464e43a679a3','nickname','user.attribute'),('8a7ce527-cb59-46bd-8d4c-464e43a679a3','true','userinfo.token.claim'),('8d8d5c14-c20a-416a-b8ed-df9fea3c767c','true','access.token.claim'),('8d8d5c14-c20a-416a-b8ed-df9fea3c767c','preferred_username','claim.name'),('8d8d5c14-c20a-416a-b8ed-df9fea3c767c','true','id.token.claim'),('8d8d5c14-c20a-416a-b8ed-df9fea3c767c','String','jsonType.label'),('8d8d5c14-c20a-416a-b8ed-df9fea3c767c','username','user.attribute'),('8d8d5c14-c20a-416a-b8ed-df9fea3c767c','true','userinfo.token.claim'),('919bcf6b-fc01-4504-9ef1-76d629540774','true','access.token.claim'),('919bcf6b-fc01-4504-9ef1-76d629540774','given_name','claim.name'),('919bcf6b-fc01-4504-9ef1-76d629540774','true','id.token.claim'),('919bcf6b-fc01-4504-9ef1-76d629540774','String','jsonType.label'),('919bcf6b-fc01-4504-9ef1-76d629540774','firstName','user.attribute'),('919bcf6b-fc01-4504-9ef1-76d629540774','true','userinfo.token.claim'),('96f1bfa7-88a9-4df6-8dd6-5165a10158fc','true','access.token.claim'),('96f1bfa7-88a9-4df6-8dd6-5165a10158fc','profile','claim.name'),('96f1bfa7-88a9-4df6-8dd6-5165a10158fc','true','id.token.claim'),('96f1bfa7-88a9-4df6-8dd6-5165a10158fc','String','jsonType.label'),('96f1bfa7-88a9-4df6-8dd6-5165a10158fc','profile','user.attribute'),('96f1bfa7-88a9-4df6-8dd6-5165a10158fc','true','userinfo.token.claim'),('9dca009f-c299-4906-9041-31ee5c4517f6','true','access.token.claim'),('9dca009f-c299-4906-9041-31ee5c4517f6','locale','claim.name'),('9dca009f-c299-4906-9041-31ee5c4517f6','true','id.token.claim'),('9dca009f-c299-4906-9041-31ee5c4517f6','String','jsonType.label'),('9dca009f-c299-4906-9041-31ee5c4517f6','locale','user.attribute'),('9dca009f-c299-4906-9041-31ee5c4517f6','true','userinfo.token.claim'),('a4e1f842-6c24-43ec-8dc0-39fd9bb8cbf1','true','access.token.claim'),('a4e1f842-6c24-43ec-8dc0-39fd9bb8cbf1','phone_number','claim.name'),('a4e1f842-6c24-43ec-8dc0-39fd9bb8cbf1','true','id.token.claim'),('a4e1f842-6c24-43ec-8dc0-39fd9bb8cbf1','String','jsonType.label'),('a4e1f842-6c24-43ec-8dc0-39fd9bb8cbf1','phoneNumber','user.attribute'),('a4e1f842-6c24-43ec-8dc0-39fd9bb8cbf1','true','userinfo.token.claim'),('a6d5a105-0150-4518-a922-48d6ffa378e5','true','access.token.claim'),('a6d5a105-0150-4518-a922-48d6ffa378e5','resource_access.${client_id}.roles','claim.name'),('a6d5a105-0150-4518-a922-48d6ffa378e5','String','jsonType.label'),('a6d5a105-0150-4518-a922-48d6ffa378e5','true','multivalued'),('a6d5a105-0150-4518-a922-48d6ffa378e5','foo','user.attribute'),('aa01c509-2797-44a9-9752-cad0295251fe','true','access.token.claim'),('aa01c509-2797-44a9-9752-cad0295251fe','middle_name','claim.name'),('aa01c509-2797-44a9-9752-cad0295251fe','true','id.token.claim'),('aa01c509-2797-44a9-9752-cad0295251fe','String','jsonType.label'),('aa01c509-2797-44a9-9752-cad0295251fe','middleName','user.attribute'),('aa01c509-2797-44a9-9752-cad0295251fe','true','userinfo.token.claim'),('b5f4fed9-aed6-42f3-88ec-c460b2f210fd','true','access.token.claim'),('b5f4fed9-aed6-42f3-88ec-c460b2f210fd','groups','claim.name'),('b5f4fed9-aed6-42f3-88ec-c460b2f210fd','true','id.token.claim'),('b5f4fed9-aed6-42f3-88ec-c460b2f210fd','String','jsonType.label'),('b5f4fed9-aed6-42f3-88ec-c460b2f210fd','true','multivalued'),('b5f4fed9-aed6-42f3-88ec-c460b2f210fd','foo','user.attribute'),('b74f11ce-8535-4914-9a70-40da6526772e','true','access.token.claim'),('b74f11ce-8535-4914-9a70-40da6526772e','website','claim.name'),('b74f11ce-8535-4914-9a70-40da6526772e','true','id.token.claim'),('b74f11ce-8535-4914-9a70-40da6526772e','String','jsonType.label'),('b74f11ce-8535-4914-9a70-40da6526772e','website','user.attribute'),('b74f11ce-8535-4914-9a70-40da6526772e','true','userinfo.token.claim'),('cdbd5013-eb34-4c49-9494-17410dc73955','true','access.token.claim'),('cdbd5013-eb34-4c49-9494-17410dc73955','picture','claim.name'),('cdbd5013-eb34-4c49-9494-17410dc73955','true','id.token.claim'),('cdbd5013-eb34-4c49-9494-17410dc73955','String','jsonType.label'),('cdbd5013-eb34-4c49-9494-17410dc73955','picture','user.attribute'),('cdbd5013-eb34-4c49-9494-17410dc73955','true','userinfo.token.claim'),('d7c93a67-4995-4a59-97d7-fa1ed9963144','true','access.token.claim'),('d7c93a67-4995-4a59-97d7-fa1ed9963144','birthdate','claim.name'),('d7c93a67-4995-4a59-97d7-fa1ed9963144','true','id.token.claim'),('d7c93a67-4995-4a59-97d7-fa1ed9963144','String','jsonType.label'),('d7c93a67-4995-4a59-97d7-fa1ed9963144','birthdate','user.attribute'),('d7c93a67-4995-4a59-97d7-fa1ed9963144','true','userinfo.token.claim'),('dd7292f9-5de5-4e14-a4e9-13a74a9985df','true','access.token.claim'),('dd7292f9-5de5-4e14-a4e9-13a74a9985df','locale','claim.name'),('dd7292f9-5de5-4e14-a4e9-13a74a9985df','true','id.token.claim'),('dd7292f9-5de5-4e14-a4e9-13a74a9985df','String','jsonType.label'),('dd7292f9-5de5-4e14-a4e9-13a74a9985df','locale','user.attribute'),('dd7292f9-5de5-4e14-a4e9-13a74a9985df','true','userinfo.token.claim'),('dee07ac9-2889-4d16-aef4-79d9b239a5c9','true','access.token.claim'),('dee07ac9-2889-4d16-aef4-79d9b239a5c9','email_verified','claim.name'),('dee07ac9-2889-4d16-aef4-79d9b239a5c9','true','id.token.claim'),('dee07ac9-2889-4d16-aef4-79d9b239a5c9','boolean','jsonType.label'),('dee07ac9-2889-4d16-aef4-79d9b239a5c9','emailVerified','user.attribute'),('dee07ac9-2889-4d16-aef4-79d9b239a5c9','true','userinfo.token.claim'),('e06132e0-7cec-4c6d-92ba-8e376c6fa8be','true','access.token.claim'),('e06132e0-7cec-4c6d-92ba-8e376c6fa8be','realm_access.roles','claim.name'),('e06132e0-7cec-4c6d-92ba-8e376c6fa8be','String','jsonType.label'),('e06132e0-7cec-4c6d-92ba-8e376c6fa8be','true','multivalued'),('e06132e0-7cec-4c6d-92ba-8e376c6fa8be','foo','user.attribute'),('e378f511-2a35-4f81-9339-6202934c9c24','true','access.token.claim'),('e378f511-2a35-4f81-9339-6202934c9c24','website','claim.name'),('e378f511-2a35-4f81-9339-6202934c9c24','true','id.token.claim'),('e378f511-2a35-4f81-9339-6202934c9c24','String','jsonType.label'),('e378f511-2a35-4f81-9339-6202934c9c24','website','user.attribute'),('e378f511-2a35-4f81-9339-6202934c9c24','true','userinfo.token.claim'),('f198c131-0eb8-4216-a83b-a0294ebb5349','true','access.token.claim'),('f198c131-0eb8-4216-a83b-a0294ebb5349','middle_name','claim.name'),('f198c131-0eb8-4216-a83b-a0294ebb5349','true','id.token.claim'),('f198c131-0eb8-4216-a83b-a0294ebb5349','String','jsonType.label'),('f198c131-0eb8-4216-a83b-a0294ebb5349','middleName','user.attribute'),('f198c131-0eb8-4216-a83b-a0294ebb5349','true','userinfo.token.claim'),('f2e15a91-546b-48b9-b3bd-ae312bca4138','true','access.token.claim'),('f2e15a91-546b-48b9-b3bd-ae312bca4138','email_verified','claim.name'),('f2e15a91-546b-48b9-b3bd-ae312bca4138','true','id.token.claim'),('f2e15a91-546b-48b9-b3bd-ae312bca4138','boolean','jsonType.label'),('f2e15a91-546b-48b9-b3bd-ae312bca4138','emailVerified','user.attribute'),('f2e15a91-546b-48b9-b3bd-ae312bca4138','true','userinfo.token.claim'),('f72d00c3-3f7f-4960-b0d6-12d53c71758b','true','access.token.claim'),('f72d00c3-3f7f-4960-b0d6-12d53c71758b','true','id.token.claim'),('f72d00c3-3f7f-4960-b0d6-12d53c71758b','country','user.attribute.country'),('f72d00c3-3f7f-4960-b0d6-12d53c71758b','formatted','user.attribute.formatted'),('f72d00c3-3f7f-4960-b0d6-12d53c71758b','locality','user.attribute.locality'),('f72d00c3-3f7f-4960-b0d6-12d53c71758b','postal_code','user.attribute.postal_code'),('f72d00c3-3f7f-4960-b0d6-12d53c71758b','region','user.attribute.region'),('f72d00c3-3f7f-4960-b0d6-12d53c71758b','street','user.attribute.street'),('f72d00c3-3f7f-4960-b0d6-12d53c71758b','true','userinfo.token.claim'),('f85d0510-8498-47d1-927c-16e1ad5b9561','true','access.token.claim'),('f85d0510-8498-47d1-927c-16e1ad5b9561','birthdate','claim.name'),('f85d0510-8498-47d1-927c-16e1ad5b9561','true','id.token.claim'),('f85d0510-8498-47d1-927c-16e1ad5b9561','String','jsonType.label'),('f85d0510-8498-47d1-927c-16e1ad5b9561','birthdate','user.attribute'),('f85d0510-8498-47d1-927c-16e1ad5b9561','true','userinfo.token.claim'),('fd8aaa5c-6ff0-49bb-9988-35b6f0bfdd9e','true','access.token.claim'),('fd8aaa5c-6ff0-49bb-9988-35b6f0bfdd9e','phone_number','claim.name'),('fd8aaa5c-6ff0-49bb-9988-35b6f0bfdd9e','true','id.token.claim'),('fd8aaa5c-6ff0-49bb-9988-35b6f0bfdd9e','String','jsonType.label'),('fd8aaa5c-6ff0-49bb-9988-35b6f0bfdd9e','phoneNumber','user.attribute'),('fd8aaa5c-6ff0-49bb-9988-35b6f0bfdd9e','true','userinfo.token.claim');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM`
--

DROP TABLE IF EXISTS `REALM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM` (
  `ID` varchar(36) NOT NULL,
  `ACCESS_CODE_LIFESPAN` int(11) DEFAULT NULL,
  `USER_ACTION_LIFESPAN` int(11) DEFAULT NULL,
  `ACCESS_TOKEN_LIFESPAN` int(11) DEFAULT NULL,
  `ACCOUNT_THEME` varchar(255) DEFAULT NULL,
  `ADMIN_THEME` varchar(255) DEFAULT NULL,
  `EMAIL_THEME` varchar(255) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_EXPIRATION` bigint(20) DEFAULT NULL,
  `LOGIN_THEME` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int(11) DEFAULT NULL,
  `PASSWORD_POLICY` varchar(2550) DEFAULT NULL,
  `REGISTRATION_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `RESET_PASSWORD_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `SOCIAL` bit(1) NOT NULL DEFAULT b'0',
  `SSL_REQUIRED` varchar(255) DEFAULT NULL,
  `SSO_IDLE_TIMEOUT` int(11) DEFAULT NULL,
  `SSO_MAX_LIFESPAN` int(11) DEFAULT NULL,
  `UPDATE_PROFILE_ON_SOC_LOGIN` bit(1) NOT NULL DEFAULT b'0',
  `VERIFY_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `MASTER_ADMIN_CLIENT` varchar(36) DEFAULT NULL,
  `LOGIN_LIFESPAN` int(11) DEFAULT NULL,
  `INTERNATIONALIZATION_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_LOCALE` varchar(255) DEFAULT NULL,
  `REG_EMAIL_AS_USERNAME` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_DETAILS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EDIT_USERNAME_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `OTP_POLICY_COUNTER` int(11) DEFAULT '0',
  `OTP_POLICY_WINDOW` int(11) DEFAULT '1',
  `OTP_POLICY_PERIOD` int(11) DEFAULT '30',
  `OTP_POLICY_DIGITS` int(11) DEFAULT '6',
  `OTP_POLICY_ALG` varchar(36) DEFAULT 'HmacSHA1',
  `OTP_POLICY_TYPE` varchar(36) DEFAULT 'totp',
  `BROWSER_FLOW` varchar(36) DEFAULT NULL,
  `REGISTRATION_FLOW` varchar(36) DEFAULT NULL,
  `DIRECT_GRANT_FLOW` varchar(36) DEFAULT NULL,
  `RESET_CREDENTIALS_FLOW` varchar(36) DEFAULT NULL,
  `CLIENT_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `OFFLINE_SESSION_IDLE_TIMEOUT` int(11) DEFAULT '0',
  `REVOKE_REFRESH_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `ACCESS_TOKEN_LIFE_IMPLICIT` int(11) DEFAULT '0',
  `LOGIN_WITH_EMAIL_ALLOWED` bit(1) NOT NULL DEFAULT b'1',
  `DUPLICATE_EMAILS_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `DOCKER_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `REFRESH_TOKEN_MAX_REUSE` int(11) DEFAULT '0',
  `ALLOW_USER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `SSO_MAX_LIFESPAN_REMEMBER_ME` int(11) NOT NULL,
  `SSO_IDLE_TIMEOUT_REMEMBER_ME` int(11) NOT NULL,
  `DEFAULT_ROLE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
  KEY `IDX_REALM_MASTER_ADM_CLI` (`MASTER_ADMIN_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM`
--

LOCK TABLES `REALM` WRITE;
/*!40000 ALTER TABLE `REALM` DISABLE KEYS */;
INSERT INTO `REALM` VALUES ('ias',60,300,300,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'ias',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','b090d4b0-5a7c-44ff-9985-06632767b68e',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','57366c19-cb5c-451b-aa8c-ee6dd681222a','1df33ea9-4ad5-4ce7-b3dc-da3072ca1363','2c859f7b-6f9a-401e-a887-593210959ce8','aa7c056e-e2ed-40f7-9f91-0c4e8274ba07','7ce6f7f0-55bc-4bea-9cab-2d8939d4fd6b',2592000,_binary '\0',900,_binary '',_binary '\0','9629bd8f-c7cd-471f-a86e-707bae414ba9',0,_binary '\0',0,0,'e5e998cc-407c-49ff-8b70-e12c2904a907'),('master',60,300,60,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'master',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','e702d638-b763-454f-8514-9af9c7c5530e',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','a6c70792-09c0-4b90-9a67-95c3185a38c3','ec0b3d7b-0930-434a-a9d3-9a2ff587344c','58e526f1-ae3e-4933-a3a9-6d132d89ac78','1a6c254f-dd72-41ac-b7e2-44ea9eec5904','c9258cb2-365b-43d9-8a23-33193a4ba0ab',2592000,_binary '\0',900,_binary '',_binary '\0','7c468234-f615-48b5-9c6e-792582d9ec53',0,_binary '\0',0,0,'c7953691-e7a4-4fd8-b617-d5c69c59472f');
/*!40000 ALTER TABLE `REALM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ATTRIBUTE`
--

DROP TABLE IF EXISTS `REALM_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` longtext CHARACTER SET utf8,
  PRIMARY KEY (`NAME`,`REALM_ID`),
  KEY `IDX_REALM_ATTR_REALM` (`REALM_ID`),
  CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ATTRIBUTE`
--

LOCK TABLES `REALM_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `REALM_ATTRIBUTE` VALUES ('actionTokenGeneratedByAdminLifespan','ias','43200'),('actionTokenGeneratedByUserLifespan','ias','300'),('bruteForceProtected','ias','false'),('bruteForceProtected','master','false'),('cibaAuthRequestedUserHint','ias','login_hint'),('cibaBackchannelTokenDeliveryMode','ias','poll'),('cibaExpiresIn','ias','120'),('cibaInterval','ias','5'),('defaultSignatureAlgorithm','ias','RS256'),('defaultSignatureAlgorithm','master','RS256'),('displayName','master','Keycloak'),('displayNameHtml','master','<div class=\"kc-logo-text\"><span>Keycloak</span></div>'),('failureFactor','ias','30'),('failureFactor','master','30'),('maxDeltaTimeSeconds','ias','43200'),('maxDeltaTimeSeconds','master','43200'),('maxFailureWaitSeconds','ias','900'),('maxFailureWaitSeconds','master','900'),('minimumQuickLoginWaitSeconds','ias','60'),('minimumQuickLoginWaitSeconds','master','60'),('oauth2DeviceCodeLifespan','ias','600'),('oauth2DevicePollingInterval','ias','5'),('offlineSessionMaxLifespan','ias','5184000'),('offlineSessionMaxLifespan','master','5184000'),('offlineSessionMaxLifespanEnabled','ias','false'),('offlineSessionMaxLifespanEnabled','master','false'),('parRequestUriLifespan','ias','60'),('permanentLockout','ias','false'),('permanentLockout','master','false'),('quickLoginCheckMilliSeconds','ias','1000'),('quickLoginCheckMilliSeconds','master','1000'),('waitIncrementSeconds','ias','60'),('waitIncrementSeconds','master','60'),('webAuthnPolicyAttestationConveyancePreference','ias','not specified'),('webAuthnPolicyAttestationConveyancePreferencePasswordless','ias','not specified'),('webAuthnPolicyAuthenticatorAttachment','ias','not specified'),('webAuthnPolicyAuthenticatorAttachmentPasswordless','ias','not specified'),('webAuthnPolicyAvoidSameAuthenticatorRegister','ias','false'),('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','ias','false'),('webAuthnPolicyCreateTimeout','ias','0'),('webAuthnPolicyCreateTimeoutPasswordless','ias','0'),('webAuthnPolicyRequireResidentKey','ias','not specified'),('webAuthnPolicyRequireResidentKeyPasswordless','ias','not specified'),('webAuthnPolicyRpEntityName','ias','keycloak'),('webAuthnPolicyRpEntityNamePasswordless','ias','keycloak'),('webAuthnPolicyRpId','ias',''),('webAuthnPolicyRpIdPasswordless','ias',''),('webAuthnPolicySignatureAlgorithms','ias','ES256'),('webAuthnPolicySignatureAlgorithmsPasswordless','ias','ES256'),('webAuthnPolicyUserVerificationRequirement','ias','not specified'),('webAuthnPolicyUserVerificationRequirementPasswordless','ias','not specified'),('_browser_header.contentSecurityPolicy','ias','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicy','master','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicyReportOnly','ias',''),('_browser_header.contentSecurityPolicyReportOnly','master',''),('_browser_header.strictTransportSecurity','ias','max-age=31536000; includeSubDomains'),('_browser_header.strictTransportSecurity','master','max-age=31536000; includeSubDomains'),('_browser_header.xContentTypeOptions','ias','nosniff'),('_browser_header.xContentTypeOptions','master','nosniff'),('_browser_header.xFrameOptions','ias','SAMEORIGIN'),('_browser_header.xFrameOptions','master','SAMEORIGIN'),('_browser_header.xRobotsTag','ias','none'),('_browser_header.xRobotsTag','master','none'),('_browser_header.xXSSProtection','ias','1; mode=block'),('_browser_header.xXSSProtection','master','1; mode=block');
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_DEFAULT_GROUPS`
--

DROP TABLE IF EXISTS `REALM_DEFAULT_GROUPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_DEFAULT_GROUPS` (
  `REALM_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`GROUP_ID`),
  UNIQUE KEY `CON_GROUP_ID_DEF_GROUPS` (`GROUP_ID`),
  KEY `IDX_REALM_DEF_GRP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_DEF_GROUPS_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_DEFAULT_GROUPS`
--

LOCK TABLES `REALM_DEFAULT_GROUPS` WRITE;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ENABLED_EVENT_TYPES`
--

DROP TABLE IF EXISTS `REALM_ENABLED_EVENT_TYPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ENABLED_EVENT_TYPES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_TYPES_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NWEDRF5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ENABLED_EVENT_TYPES`
--

LOCK TABLES `REALM_ENABLED_EVENT_TYPES` WRITE;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_EVENTS_LISTENERS`
--

DROP TABLE IF EXISTS `REALM_EVENTS_LISTENERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_EVENTS_LISTENERS` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_LIST_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NXEV9F5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_EVENTS_LISTENERS`
--

LOCK TABLES `REALM_EVENTS_LISTENERS` WRITE;
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` DISABLE KEYS */;
INSERT INTO `REALM_EVENTS_LISTENERS` VALUES ('ias','jboss-logging'),('master','jboss-logging');
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_LOCALIZATIONS`
--

DROP TABLE IF EXISTS `REALM_LOCALIZATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_LOCALIZATIONS` (
  `REALM_ID` varchar(255) NOT NULL,
  `LOCALE` varchar(255) NOT NULL,
  `TEXTS` longtext CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`REALM_ID`,`LOCALE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_LOCALIZATIONS`
--

LOCK TABLES `REALM_LOCALIZATIONS` WRITE;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_REQUIRED_CREDENTIAL`
--

DROP TABLE IF EXISTS `REALM_REQUIRED_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_REQUIRED_CREDENTIAL` (
  `TYPE` varchar(255) NOT NULL,
  `FORM_LABEL` varchar(255) DEFAULT NULL,
  `INPUT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`TYPE`),
  CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_REQUIRED_CREDENTIAL`
--

LOCK TABLES `REALM_REQUIRED_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` DISABLE KEYS */;
INSERT INTO `REALM_REQUIRED_CREDENTIAL` VALUES ('password','password',_binary '',_binary '','ias'),('password','password',_binary '',_binary '','master');
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SMTP_CONFIG`
--

DROP TABLE IF EXISTS `REALM_SMTP_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SMTP_CONFIG` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`NAME`),
  CONSTRAINT `FK_70EJ8XDXGXD0B9HH6180IRR0O` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SMTP_CONFIG`
--

LOCK TABLES `REALM_SMTP_CONFIG` WRITE;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SUPPORTED_LOCALES`
--

DROP TABLE IF EXISTS `REALM_SUPPORTED_LOCALES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SUPPORTED_LOCALES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_SUPP_LOCAL_REALM` (`REALM_ID`),
  CONSTRAINT `FK_SUPPORTED_LOCALES_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SUPPORTED_LOCALES`
--

LOCK TABLES `REALM_SUPPORTED_LOCALES` WRITE;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REDIRECT_URIS`
--

DROP TABLE IF EXISTS `REDIRECT_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REDIRECT_URIS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_REDIR_URI_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_1BURS8PB4OUJ97H5WUPPAHV9F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REDIRECT_URIS`
--

LOCK TABLES `REDIRECT_URIS` WRITE;
/*!40000 ALTER TABLE `REDIRECT_URIS` DISABLE KEYS */;
INSERT INTO `REDIRECT_URIS` VALUES ('3c04d5eb-fe24-4756-862e-a932791e7a75','/realms/master/account/*'),('52dd3a56-5419-42f6-b96f-56a5f51ed33c','/realms/ias/account/*'),('5b734b54-c78b-4b36-bf53-82d79c7c8467','/admin/master/console/*'),('6f20237f-7229-4ff6-9011-a90e501fe8f8','/admin/ias/console/*'),('7a84a3da-8dc2-43f2-ac9c-7ce7dfacdb25','/realms/master/account/*'),('8c58b5b0-11d5-44d0-9592-095fa99404d4','*'),('9fe0ddbf-37a6-40ef-8174-61d6e1b6df86','/realms/ias/account/*');
/*!40000 ALTER TABLE `REDIRECT_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_CONFIG`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_CONFIG` (
  `REQUIRED_ACTION_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REQUIRED_ACTION_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_CONFIG`
--

LOCK TABLES `REQUIRED_ACTION_CONFIG` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_PROVIDER`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_ACTION` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_REQ_ACT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_PROVIDER`
--

LOCK TABLES `REQUIRED_ACTION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` DISABLE KEYS */;
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('30939010-af90-459f-93df-b694c32bc81d','UPDATE_PROFILE','Update Profile','master',_binary '',_binary '\0','UPDATE_PROFILE',40),('38cfb46b-2f47-4bb0-8791-33e4605db12a','terms_and_conditions','Terms and Conditions','master',_binary '\0',_binary '\0','terms_and_conditions',20),('4aaa6e1f-a63a-4d07-bb4a-3e9aec6da61b','update_user_locale','Update User Locale','master',_binary '',_binary '\0','update_user_locale',1000),('4b59eb40-d5c4-46a2-86e8-2bf6e1205028','CONFIGURE_TOTP','Configure OTP','ias',_binary '',_binary '\0','CONFIGURE_TOTP',10),('7b67daad-a566-44c6-99ad-b9be360d7bb5','terms_and_conditions','Terms and Conditions','ias',_binary '\0',_binary '\0','terms_and_conditions',20),('8284f4d7-005a-46fe-be5d-38ad51bea0d7','VERIFY_EMAIL','Verify Email','ias',_binary '',_binary '\0','VERIFY_EMAIL',50),('991e1835-30b8-44a4-a7b7-d42ff54dba46','delete_account','Delete Account','master',_binary '\0',_binary '\0','delete_account',60),('9a182b97-e026-4b5c-a4ca-bebd10f1a97b','update_user_locale','Update User Locale','ias',_binary '',_binary '\0','update_user_locale',1000),('a34d6540-36d3-49ea-8655-1392f064bd72','UPDATE_PROFILE','Update Profile','ias',_binary '',_binary '\0','UPDATE_PROFILE',40),('b5965dee-7d08-4429-964b-4572bd8f88b2','UPDATE_PASSWORD','Update Password','ias',_binary '',_binary '\0','UPDATE_PASSWORD',30),('e577ff6c-c98c-4b58-9388-a6a999b5a7fd','UPDATE_PASSWORD','Update Password','master',_binary '',_binary '\0','UPDATE_PASSWORD',30),('ed65c754-317b-4630-bca9-79917123e4a3','delete_account','Delete Account','ias',_binary '\0',_binary '\0','delete_account',60),('f3d01b80-30be-4382-86f7-e9d0df8ae367','CONFIGURE_TOTP','Configure OTP','master',_binary '',_binary '\0','CONFIGURE_TOTP',10),('f8132458-db15-4db0-b5c1-d69bdf868fd7','VERIFY_EMAIL','Verify Email','master',_binary '',_binary '\0','VERIFY_EMAIL',50);
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `RESOURCE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_5HRM2VLF9QL5FU022KQEPOVBR` (`RESOURCE_ID`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU022KQEPOVBR` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_ATTRIBUTE`
--

LOCK TABLES `RESOURCE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_POLICY` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`POLICY_ID`),
  KEY `IDX_RES_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRPOS53XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPP213XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_POLICY`
--

LOCK TABLES `RESOURCE_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SCOPE` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`SCOPE_ID`),
  KEY `IDX_RES_SCOPE_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_FRSRPOS13XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPS213XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SCOPE`
--

LOCK TABLES `RESOURCE_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER` (
  `ID` varchar(36) NOT NULL,
  `ALLOW_RS_REMOTE_MGMT` bit(1) NOT NULL DEFAULT b'0',
  `POLICY_ENFORCE_MODE` varchar(15) NOT NULL,
  `DECISION_STRATEGY` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER`
--

LOCK TABLES `RESOURCE_SERVER` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_PERM_TICKET`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_PERM_TICKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_PERM_TICKET` (
  `ID` varchar(36) NOT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `REQUESTER` varchar(255) DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint(20) NOT NULL,
  `GRANTED_TIMESTAMP` bigint(20) DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5PMT` (`OWNER`,`REQUESTER`,`RESOURCE_SERVER_ID`,`RESOURCE_ID`,`SCOPE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG82SSPMT` (`RESOURCE_SERVER_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG83SSPMT` (`RESOURCE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG84SSPMT` (`SCOPE_ID`),
  KEY `FK_FRSRPO2128CX4WNKOG82SSRFY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSPMT` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG83SSPMT` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG84SSPMT` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`),
  CONSTRAINT `FK_FRSRPO2128CX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_PERM_TICKET`
--

LOCK TABLES `RESOURCE_SERVER_PERM_TICKET` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_POLICY` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `TYPE` varchar(255) NOT NULL,
  `DECISION_STRATEGY` varchar(20) DEFAULT NULL,
  `LOGIC` varchar(20) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRPT700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SERV_POL_RES_SERV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRPO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_POLICY`
--

LOCK TABLES `RESOURCE_SERVER_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_RESOURCE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_RESOURCE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5HA6` (`NAME`,`OWNER`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_RES_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_RESOURCE`
--

LOCK TABLES `RESOURCE_SERVER_RESOURCE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRST700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_SCOPE_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRSO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_SCOPE`
--

LOCK TABLES `RESOURCE_SERVER_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_URIS`
--

DROP TABLE IF EXISTS `RESOURCE_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_URIS` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`VALUE`),
  CONSTRAINT `FK_RESOURCE_SERVER_URIS` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_URIS`
--

LOCK TABLES `RESOURCE_URIS` WRITE;
/*!40000 ALTER TABLE `RESOURCE_URIS` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `ROLE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ROLE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ROLE_ATTRIBUTE` (`ROLE_ID`),
  CONSTRAINT `FK_ROLE_ATTRIBUTE_ID` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE_ATTRIBUTE`
--

LOCK TABLES `ROLE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_MAPPING`
--

DROP TABLE IF EXISTS `SCOPE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_MAPPING` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  KEY `IDX_SCOPE_MAPPING_ROLE` (`ROLE_ID`),
  CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_MAPPING`
--

LOCK TABLES `SCOPE_MAPPING` WRITE;
/*!40000 ALTER TABLE `SCOPE_MAPPING` DISABLE KEYS */;
INSERT INTO `SCOPE_MAPPING` VALUES ('7a84a3da-8dc2-43f2-ac9c-7ce7dfacdb25','58b5ff7b-5c0b-4381-a5c7-c19190336111'),('52dd3a56-5419-42f6-b96f-56a5f51ed33c','fb273d07-c3ab-4c83-94e9-d2b402556b1c');
/*!40000 ALTER TABLE `SCOPE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_POLICY`
--

DROP TABLE IF EXISTS `SCOPE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_POLICY` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`POLICY_ID`),
  KEY `IDX_SCOPE_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRASP13XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPASS3XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_POLICY`
--

LOCK TABLES `SCOPE_POLICY` WRITE;
/*!40000 ALTER TABLE `SCOPE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `SCOPE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERNAME_LOGIN_FAILURE`
--

DROP TABLE IF EXISTS `USERNAME_LOGIN_FAILURE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USERNAME_LOGIN_FAILURE` (
  `REALM_ID` varchar(36) NOT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 NOT NULL,
  `FAILED_LOGIN_NOT_BEFORE` int(11) DEFAULT NULL,
  `LAST_FAILURE` bigint(20) DEFAULT NULL,
  `LAST_IP_FAILURE` varchar(255) DEFAULT NULL,
  `NUM_FAILURES` int(11) DEFAULT NULL,
  PRIMARY KEY (`REALM_ID`,`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERNAME_LOGIN_FAILURE`
--

LOCK TABLES `USERNAME_LOGIN_FAILURE` WRITE;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_ATTRIBUTE` (`USER_ID`),
  KEY `IDX_USER_ATTRIBUTE_NAME` (`NAME`,`VALUE`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ATTRIBUTE`
--

LOCK TABLES `USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT`
--

DROP TABLE IF EXISTS `USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint(20) DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_JKUWUVD56ONTGSUHOGM8UEWRT` (`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`USER_ID`),
  KEY `IDX_USER_CONSENT` (`USER_ID`),
  CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT`
--

LOCK TABLES `USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `USER_CONSENT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT_CLIENT_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`),
  KEY `IDX_USCONSENT_CLSCOPE` (`USER_CONSENT_ID`),
  CONSTRAINT `FK_GRNTCSNT_CLSC_USC` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `USER_CONSENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT_CLIENT_SCOPE`
--

LOCK TABLES `USER_CONSENT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ENTITY`
--

DROP TABLE IF EXISTS `USER_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `EMAIL_CONSTRAINT` varchar(255) DEFAULT NULL,
  `EMAIL_VERIFIED` bit(1) NOT NULL DEFAULT b'0',
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FEDERATION_LINK` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `LAST_NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint(20) DEFAULT NULL,
  `SERVICE_ACCOUNT_CLIENT_LINK` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
  UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`),
  KEY `IDX_USER_EMAIL` (`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ENTITY`
--

LOCK TABLES `USER_ENTITY` WRITE;
/*!40000 ALTER TABLE `USER_ENTITY` DISABLE KEYS */;
INSERT INTO `USER_ENTITY` VALUES ('3a993f66-fb14-462b-9c55-04294191362b','manel.gracia.sola@gmail.com','manel.gracia.sola@gmail.com',_binary '',_binary '',NULL,'Manel','Gràcia Solà','ias','admin',1633875940657,NULL,0),('6107a8fe-a872-4ad1-99e1-76e8e3040247',NULL,'8a79ee24-81c0-418f-a76c-1bf41f5c8ed5',_binary '\0',_binary '',NULL,NULL,NULL,'master','admin',1633875695665,NULL,0);
/*!40000 ALTER TABLE `USER_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_CONFIG` (
  `USER_FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FK_T13HPU1J94R2EBPEKR39X5EU5` FOREIGN KEY (`USER_FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_CONFIG`
--

LOCK TABLES `USER_FEDERATION_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `FEDERATION_MAPPER_TYPE` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_MAP_FED_PRV` (`FEDERATION_PROVIDER_ID`),
  KEY `IDX_USR_FED_MAP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_FEDMAPPERPM_FEDPRV` FOREIGN KEY (`FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`),
  CONSTRAINT `FK_FEDMAPPERPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER`
--

LOCK TABLES `USER_FEDERATION_MAPPER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER_CONFIG` (
  `USER_FEDERATION_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_FEDMAPPER_CFG` FOREIGN KEY (`USER_FEDERATION_MAPPER_ID`) REFERENCES `USER_FEDERATION_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER_CONFIG`
--

LOCK TABLES `USER_FEDERATION_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_PROVIDER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `CHANGED_SYNC_PERIOD` int(11) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `FULL_SYNC_PERIOD` int(11) DEFAULT NULL,
  `LAST_SYNC` int(11) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `PROVIDER_NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_PRV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_PROVIDER`
--

LOCK TABLES `USER_FEDERATION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_USER_GROUP_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_USER_GROUP_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_REQUIRED_ACTION` (
  `USER_ID` varchar(36) NOT NULL,
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_USER_REQACTIONS` (`USER_ID`),
  CONSTRAINT `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_REQUIRED_ACTION`
--

LOCK TABLES `USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(255) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_USER_ROLE_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_C4FQV34P1MBYLLOXANG7B1Q3L` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ROLE_MAPPING`
--

LOCK TABLES `USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `USER_ROLE_MAPPING` VALUES ('e5e998cc-407c-49ff-8b70-e12c2904a907','3a993f66-fb14-462b-9c55-04294191362b'),('7296c420-b364-416b-8fb8-fca1ee4debe8','6107a8fe-a872-4ad1-99e1-76e8e3040247'),('c7953691-e7a4-4fd8-b617-d5c69c59472f','6107a8fe-a872-4ad1-99e1-76e8e3040247');
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION`
--

DROP TABLE IF EXISTS `USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SESSION` (
  `ID` varchar(36) NOT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `LAST_SESSION_REFRESH` int(11) DEFAULT NULL,
  `LOGIN_USERNAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `STARTED` int(11) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `USER_SESSION_STATE` int(11) DEFAULT NULL,
  `BROKER_SESSION_ID` varchar(255) DEFAULT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION`
--

LOCK TABLES `USER_SESSION` WRITE;
/*!40000 ALTER TABLE `USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SESSION_NOTE` (
  `USER_SESSION` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`USER_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51D3472` FOREIGN KEY (`USER_SESSION`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION_NOTE`
--

LOCK TABLES `USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WEB_ORIGINS`
--

DROP TABLE IF EXISTS `WEB_ORIGINS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WEB_ORIGINS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_WEB_ORIG_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_LOJPHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WEB_ORIGINS`
--

LOCK TABLES `WEB_ORIGINS` WRITE;
/*!40000 ALTER TABLE `WEB_ORIGINS` DISABLE KEYS */;
INSERT INTO `WEB_ORIGINS` VALUES ('5b734b54-c78b-4b36-bf53-82d79c7c8467','+'),('6f20237f-7229-4ff6-9011-a90e501fe8f8','+');
/*!40000 ALTER TABLE `WEB_ORIGINS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-10 16:43:46

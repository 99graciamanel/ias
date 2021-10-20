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
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('0375ce1e-324e-4d5c-9147-21cf86b86b10',NULL,NULL,'ias','e14e2f00-172f-4263-955a-57cc24c203f2',1,30,_binary '','6fa1635d-9694-4172-ba89-70d764f2f8a6',NULL),('055b2f67-0a34-4c14-b9bb-ee532a4dcb81',NULL,'no-cookie-redirect','master','17fdec6c-d508-4e06-84bb-4a45e2024a78',0,10,_binary '\0',NULL,NULL),('10717d7d-a00f-4d54-835b-f68df7fa2c7f',NULL,'client-secret-jwt','ias','0f1c87e3-a502-4307-8d50-ac90890a4624',2,30,_binary '\0',NULL,NULL),('120e1ed2-174c-4409-bbe8-55f9bafd9353',NULL,'auth-spnego','master','2e7d448a-d130-49fe-a7b2-9ac3a200253c',3,30,_binary '\0',NULL,NULL),('14e0b9d7-4488-46c5-974d-36668d8446aa',NULL,'reset-credentials-choose-user','ias','51c43bf0-8f51-49ed-9aeb-131d5da5fc41',0,10,_binary '\0',NULL,NULL),('19f8cff5-eb8f-4e54-b615-ccc463117a3b',NULL,'conditional-user-configured','master','775f7aaa-099e-4068-95af-3a45a86cd3ce',0,10,_binary '\0',NULL,NULL),('1af69409-4cd6-455d-bd5b-fad8b1818489',NULL,'registration-recaptcha-action','ias','771f98bb-9aeb-43c9-b84a-b43f7fc3d19d',0,60,_binary '\0',NULL,'a4ee2093-3770-4bdf-8853-c06df0f6df7d'),('1c09ba53-aa3f-4be1-92fa-f6310fbd8b8f',NULL,NULL,'master','afdd7c0f-94d9-480d-b1f3-e27582f0f55c',1,40,_binary '','38602ce1-7d00-4ccc-bbe1-588f526b5404',NULL),('20aacdaa-e347-4142-a233-023d57099ba9',NULL,'basic-auth-otp','ias','cee7f4df-8ad8-4fbe-8b0f-8fe0ab9d5ad0',3,20,_binary '\0',NULL,NULL),('21a9e520-fc24-4169-b35d-4e2e9b799400',NULL,'auth-username-password-form','ias','a917a1ba-8e9a-44e7-8446-bc55b987864e',0,10,_binary '\0',NULL,NULL),('22545817-a1f5-47f7-9cd2-53e5d09a65bb',NULL,'docker-http-basic-authenticator','master','e4aa5d2d-c775-44fe-b7ff-865d5c096509',0,10,_binary '\0',NULL,NULL),('22f345cf-abae-453f-8f57-21423a6f45e9',NULL,NULL,'ias','51c43bf0-8f51-49ed-9aeb-131d5da5fc41',1,40,_binary '','48493795-7f83-490d-8896-4fecdbc6507d',NULL),('262f7fb5-dfc5-4e10-b65a-f1139f59757f',NULL,'client-jwt','ias','0f1c87e3-a502-4307-8d50-ac90890a4624',2,20,_binary '\0',NULL,NULL),('28268511-6f43-4938-acf0-838ff8300e43',NULL,'conditional-user-configured','master','38602ce1-7d00-4ccc-bbe1-588f526b5404',0,10,_binary '\0',NULL,NULL),('30e9d473-a529-4a7a-98f4-da1441eafdac',NULL,NULL,'master','f79ef96c-d05f-4f25-8ef6-3c1c6392e1c5',1,30,_binary '','3e6aaacb-275c-40e1-896c-560b665442d0',NULL),('37d8cef0-c77b-45dd-bb79-3d6585f7d837',NULL,'conditional-user-configured','ias','4e25d76d-f691-4cf4-ae6d-4f4aeeba77b3',0,10,_binary '\0',NULL,NULL),('391216b3-f1bd-4ed4-8d56-27b91289bbbc',NULL,NULL,'ias','50dca0e2-afb3-440c-8552-c90d53f2762a',2,30,_binary '','a917a1ba-8e9a-44e7-8446-bc55b987864e',NULL),('39d7ed7e-c6d0-48fc-af4d-1195152ab14e',NULL,'client-secret','ias','0f1c87e3-a502-4307-8d50-ac90890a4624',2,10,_binary '\0',NULL,NULL),('3b2ace29-f706-48df-8b37-684c320ac518',NULL,'direct-grant-validate-username','ias','e14e2f00-172f-4263-955a-57cc24c203f2',0,10,_binary '\0',NULL,NULL),('408a383e-5960-4a0a-ab90-2f45353c5cb5',NULL,'idp-review-profile','master','7b8ceb64-43ac-4799-9c2a-926613942ce5',0,10,_binary '\0',NULL,'ef605807-842e-4aad-a14a-7bcd2025cf1c'),('40aa3e4e-9dbb-43a7-a0d9-d31939bd442d',NULL,'auth-otp-form','ias','4e25d76d-f691-4cf4-ae6d-4f4aeeba77b3',0,20,_binary '\0',NULL,NULL),('418f219f-5689-4644-b023-28f53f3c2dfc',NULL,NULL,'ias','ba2e81b8-6813-4f7b-bb7b-bf310a800617',2,20,_binary '','0a8fab10-9e33-4056-aa68-069cdef76d59',NULL),('41f740c9-a0f1-440d-b54e-cab9184f9ca8',NULL,'auth-otp-form','ias','83930f20-0239-48d2-9785-76fc5ab7f9a7',0,20,_binary '\0',NULL,NULL),('4219a5a1-8ce9-4801-af8f-702dbdcfea8e',NULL,'registration-password-action','master','d5125681-e5e5-4759-b968-79922f4fca46',0,50,_binary '\0',NULL,NULL),('42412c59-9c38-4d99-9f65-7347a7e8536a',NULL,NULL,'master','ae7c2b48-402a-4e00-a750-01f8ce1e497e',2,20,_binary '','e179cdfc-c1bc-4fe2-b801-1e114ee6e3a4',NULL),('43149af6-fe7d-4852-a695-1983cb270367',NULL,NULL,'master','e179cdfc-c1bc-4fe2-b801-1e114ee6e3a4',0,20,_binary '','f57840d6-0d68-4638-b77a-71bb5488523b',NULL),('43663a53-0353-43af-b3bd-11b9313a57e4',NULL,'registration-profile-action','ias','771f98bb-9aeb-43c9-b84a-b43f7fc3d19d',0,40,_binary '\0',NULL,NULL),('43d2b11a-fd15-4df0-b06a-7647cd39570e',NULL,'client-x509','ias','0f1c87e3-a502-4307-8d50-ac90890a4624',2,40,_binary '\0',NULL,NULL),('4626045a-a1d2-49d0-9a73-91b1205ced5c',NULL,'direct-grant-validate-password','ias','e14e2f00-172f-4263-955a-57cc24c203f2',0,20,_binary '\0',NULL,NULL),('46cadaeb-4c0c-4a10-8151-29350cffa566',NULL,NULL,'ias','736a9606-7f8e-4c09-b775-722eb1956ce8',0,20,_binary '','31f6daf4-a8dc-493c-bfd2-c3aa0613b915',NULL),('47b9319a-959f-4182-bdca-7edcafec1e8e',NULL,'auth-spnego','ias','cee7f4df-8ad8-4fbe-8b0f-8fe0ab9d5ad0',3,30,_binary '\0',NULL,NULL),('4a0997df-f6fa-47eb-a0f5-6e7038dd11c2',NULL,'conditional-user-configured','ias','83930f20-0239-48d2-9785-76fc5ab7f9a7',0,10,_binary '\0',NULL,NULL),('4de51056-6399-473f-a5b0-ea81ce38c0b7',NULL,'idp-username-password-form','master','84f3a72b-3b81-4a2d-8c01-330bdb6fc9f8',0,10,_binary '\0',NULL,NULL),('5246f25a-5566-486b-821c-e4e5391ff5a8',NULL,'reset-otp','ias','48493795-7f83-490d-8896-4fecdbc6507d',0,20,_binary '\0',NULL,NULL),('54df7c4d-fab1-4d9f-863f-70daa98b7520',NULL,'client-jwt','master','2514587b-4681-4d27-ba72-452f5688f9b7',2,20,_binary '\0',NULL,NULL),('5630ec60-a3bb-464c-b9cc-cdf154c730a5',NULL,'docker-http-basic-authenticator','ias','c4b67b2e-8d42-43fe-9121-1d0e686d0527',0,10,_binary '\0',NULL,NULL),('58245dda-c652-4a4f-afae-478fad0596f0',NULL,'reset-credentials-choose-user','master','afdd7c0f-94d9-480d-b1f3-e27582f0f55c',0,10,_binary '\0',NULL,NULL),('5bf40a4e-35c0-4b3e-b94e-129c82546aa3',NULL,NULL,'ias','e298afb0-3167-46b1-823b-0e8605dbcf99',0,20,_binary '','cee7f4df-8ad8-4fbe-8b0f-8fe0ab9d5ad0',NULL),('62df4232-8ecd-4e35-9e03-919c75d8d898',NULL,'auth-cookie','ias','50dca0e2-afb3-440c-8552-c90d53f2762a',2,10,_binary '\0',NULL,NULL),('6560c441-8647-4168-889a-a3d5243a2520',NULL,'auth-username-password-form','master','74ad950f-1d71-450e-a388-7bcfee637e68',0,10,_binary '\0',NULL,NULL),('658ad9f6-35f2-450f-9410-8970fd0cf4d3',NULL,'auth-cookie','master','8eb9d8b3-18f4-41c2-8a01-920a1d4db5f6',2,10,_binary '\0',NULL,NULL),('65b97a78-bbea-415b-8516-f5137989391f',NULL,'identity-provider-redirector','ias','50dca0e2-afb3-440c-8552-c90d53f2762a',2,25,_binary '\0',NULL,NULL),('695e4246-534a-4411-831c-b6ede3fac0bd',NULL,'reset-credential-email','master','afdd7c0f-94d9-480d-b1f3-e27582f0f55c',0,20,_binary '\0',NULL,NULL),('70a8ce36-680f-49a1-add6-19a870f14627',NULL,'auth-spnego','ias','50dca0e2-afb3-440c-8552-c90d53f2762a',3,20,_binary '\0',NULL,NULL),('74b57c36-2d90-48f4-b904-3481bb26b762',NULL,'basic-auth-otp','master','2e7d448a-d130-49fe-a7b2-9ac3a200253c',3,20,_binary '\0',NULL,NULL),('7642db8f-700f-4224-bef3-7da7a6784807',NULL,'registration-page-form','master','32347dd5-3412-4aab-b583-8a883612a74d',0,10,_binary '','d5125681-e5e5-4759-b968-79922f4fca46',NULL),('79d3fe30-ce6a-48fa-b7d6-d16ffc464d86',NULL,'direct-grant-validate-username','master','f79ef96c-d05f-4f25-8ef6-3c1c6392e1c5',0,10,_binary '\0',NULL,NULL),('86eef07b-8ef2-4be5-8e79-b07a9cc7ee5c',NULL,NULL,'master','f57840d6-0d68-4638-b77a-71bb5488523b',2,20,_binary '','84f3a72b-3b81-4a2d-8c01-330bdb6fc9f8',NULL),('8828a48b-2201-4287-b855-21d996fd07fa',NULL,'conditional-user-configured','master','3e6aaacb-275c-40e1-896c-560b665442d0',0,10,_binary '\0',NULL,NULL),('88570c5a-cd67-4da3-ac12-1065071f8011',NULL,'direct-grant-validate-otp','master','3e6aaacb-275c-40e1-896c-560b665442d0',0,20,_binary '\0',NULL,NULL),('89b06732-5fdf-4730-9d59-83e07bac5f25',NULL,'direct-grant-validate-password','master','f79ef96c-d05f-4f25-8ef6-3c1c6392e1c5',0,20,_binary '\0',NULL,NULL),('89e0914b-c8d0-4c0b-887e-cf07517ba535',NULL,'registration-recaptcha-action','master','d5125681-e5e5-4759-b968-79922f4fca46',3,60,_binary '\0',NULL,NULL),('92026356-8043-46b4-9c1b-8bc8c2317412',NULL,'conditional-user-configured','ias','6fa1635d-9694-4172-ba89-70d764f2f8a6',0,10,_binary '\0',NULL,NULL),('944ed5c6-a433-4fb6-b62c-56483b4019ef',NULL,'conditional-user-configured','master','1684869c-e848-49c9-ae72-bb4bff622612',0,10,_binary '\0',NULL,NULL),('9815393a-268e-427d-83dd-d15a7877640c',NULL,NULL,'ias','31f6daf4-a8dc-493c-bfd2-c3aa0613b915',2,20,_binary '','16d94513-8a67-46c1-9663-a731617cf8c1',NULL),('9b8a459a-1685-432c-abe1-19f664bf1568',NULL,'basic-auth','ias','cee7f4df-8ad8-4fbe-8b0f-8fe0ab9d5ad0',0,10,_binary '\0',NULL,NULL),('9c870862-a6b1-42f6-887c-cd359cd3fba1',NULL,'reset-password','master','afdd7c0f-94d9-480d-b1f3-e27582f0f55c',0,30,_binary '\0',NULL,NULL),('9fa650c6-bf59-4161-a1fd-0057248b0409',NULL,'registration-user-creation','master','d5125681-e5e5-4759-b968-79922f4fca46',0,20,_binary '\0',NULL,NULL),('a4865ede-0349-4e12-b68f-ae353071e212',NULL,'registration-password-action','ias','771f98bb-9aeb-43c9-b84a-b43f7fc3d19d',0,50,_binary '\0',NULL,NULL),('a524c024-0d6a-41b7-a7e4-3aae02304f27',NULL,NULL,'ias','16d94513-8a67-46c1-9663-a731617cf8c1',0,20,_binary '','ba2e81b8-6813-4f7b-bb7b-bf310a800617',NULL),('a54e2bc5-9d6e-48f3-8c98-c0c718b2eb3f',NULL,'reset-credential-email','ias','51c43bf0-8f51-49ed-9aeb-131d5da5fc41',0,20,_binary '\0',NULL,NULL),('a9a6e28b-1133-4993-b9d5-45fae48b955d',NULL,'auth-spnego','master','8eb9d8b3-18f4-41c2-8a01-920a1d4db5f6',3,20,_binary '\0',NULL,NULL),('ad3dae17-b542-4c6d-aa7a-ed08be58850d',NULL,'basic-auth','master','2e7d448a-d130-49fe-a7b2-9ac3a200253c',0,10,_binary '\0',NULL,NULL),('adfbd60e-9066-44d8-a894-bee7d85d3761',NULL,'auth-otp-form','master','775f7aaa-099e-4068-95af-3a45a86cd3ce',0,20,_binary '\0',NULL,NULL),('b1352fe6-34d0-429e-b4bd-6b8d0987276b',NULL,NULL,'master','84f3a72b-3b81-4a2d-8c01-330bdb6fc9f8',1,20,_binary '','775f7aaa-099e-4068-95af-3a45a86cd3ce',NULL),('b4f6f72a-a5b8-4a3b-9943-cf5bf59fe5d7',NULL,'registration-user-creation','ias','771f98bb-9aeb-43c9-b84a-b43f7fc3d19d',0,20,_binary '\0',NULL,NULL),('b5edb7ec-933d-4c40-a6d7-1eee72f13fe4',NULL,'auth-otp-form','master','1684869c-e848-49c9-ae72-bb4bff622612',0,20,_binary '\0',NULL,NULL),('b66f187c-7c50-4d9e-9b22-a08c5fd05689',NULL,NULL,'ias','0a8fab10-9e33-4056-aa68-069cdef76d59',1,20,_binary '','4e25d76d-f691-4cf4-ae6d-4f4aeeba77b3',NULL),('b9cf7581-847f-4cae-9434-f211e3bfdd67',NULL,'idp-create-user-if-unique','ias','31f6daf4-a8dc-493c-bfd2-c3aa0613b915',2,10,_binary '\0',NULL,'01625994-f5b7-47cc-995c-05933993b183'),('ba1e7fc7-b469-4e96-9f0d-6b6f6262f2a3',NULL,'conditional-user-configured','ias','48493795-7f83-490d-8896-4fecdbc6507d',0,10,_binary '\0',NULL,NULL),('bc393ee6-832a-4083-a24f-e09ae209a602',NULL,NULL,'master','17fdec6c-d508-4e06-84bb-4a45e2024a78',0,20,_binary '','2e7d448a-d130-49fe-a7b2-9ac3a200253c',NULL),('bc6b4232-192b-4e9e-86e5-110f3c6a5526',NULL,'idp-confirm-link','master','e179cdfc-c1bc-4fe2-b801-1e114ee6e3a4',0,10,_binary '\0',NULL,NULL),('bdcb5547-46b7-4d7a-83f2-55c7b6684a68',NULL,NULL,'master','7b8ceb64-43ac-4799-9c2a-926613942ce5',0,20,_binary '','ae7c2b48-402a-4e00-a750-01f8ce1e497e',NULL),('bde3f0ac-9796-48c7-901f-8e53af71f2e5',NULL,'idp-create-user-if-unique','master','ae7c2b48-402a-4e00-a750-01f8ce1e497e',2,10,_binary '\0',NULL,'a2932aa1-b8ae-4f35-bac5-f3ca2d176cd0'),('c3b0e8b1-0097-4391-adc4-472a206e05cb',NULL,'client-x509','master','2514587b-4681-4d27-ba72-452f5688f9b7',2,40,_binary '\0',NULL,NULL),('c60814f9-dcd1-477e-a9dd-ffb465ab1a6c',NULL,'idp-email-verification','master','f57840d6-0d68-4638-b77a-71bb5488523b',2,10,_binary '\0',NULL,NULL),('c72e51dc-fd03-44fa-ac2e-de9b70324f8f',NULL,'registration-profile-action','master','d5125681-e5e5-4759-b968-79922f4fca46',0,40,_binary '\0',NULL,NULL),('c98caba9-17ef-4b87-b1c4-90b2b2ae04b7',NULL,'reset-otp','master','38602ce1-7d00-4ccc-bbe1-588f526b5404',0,20,_binary '\0',NULL,NULL),('cd7b3d68-31c6-4b09-8b8d-798362bc2ade',NULL,'no-cookie-redirect','ias','e298afb0-3167-46b1-823b-0e8605dbcf99',0,10,_binary '\0',NULL,NULL),('cddb7234-5310-4f7f-89a9-4c54a13e4671',NULL,'direct-grant-validate-otp','ias','6fa1635d-9694-4172-ba89-70d764f2f8a6',0,20,_binary '\0',NULL,NULL),('cee17fdb-4cd8-4d06-a6f1-776ed9680b88',NULL,'http-basic-authenticator','ias','1270e2eb-09bd-4284-9812-4485c34b1e2e',0,10,_binary '\0',NULL,NULL),('cfb35839-33ec-4789-b1d0-3be9e30bba54',NULL,'idp-review-profile','ias','736a9606-7f8e-4c09-b775-722eb1956ce8',0,10,_binary '\0',NULL,'38eb1ef6-c916-4037-b36c-7fe5a9c5c6c9'),('d49a3184-3333-4432-8e32-f617a642b994',NULL,'reset-password','ias','51c43bf0-8f51-49ed-9aeb-131d5da5fc41',0,30,_binary '\0',NULL,NULL),('d60b324b-7d2d-46e3-8ec4-3da9e54c9327',NULL,'idp-confirm-link','ias','16d94513-8a67-46c1-9663-a731617cf8c1',0,10,_binary '\0',NULL,NULL),('db7249a7-7bbf-4a13-a2d0-317f5e680b0c',NULL,NULL,'master','74ad950f-1d71-450e-a388-7bcfee637e68',1,20,_binary '','1684869c-e848-49c9-ae72-bb4bff622612',NULL),('db85cb51-7932-458b-9c0e-d01270328eb9',NULL,NULL,'ias','a917a1ba-8e9a-44e7-8446-bc55b987864e',1,20,_binary '','83930f20-0239-48d2-9785-76fc5ab7f9a7',NULL),('e0e67579-19c3-4cb5-b019-61ea2b1326bc',NULL,'idp-email-verification','ias','ba2e81b8-6813-4f7b-bb7b-bf310a800617',2,10,_binary '\0',NULL,NULL),('e3b7ee20-21b6-4f3f-98eb-ea4b35727983',NULL,NULL,'master','8eb9d8b3-18f4-41c2-8a01-920a1d4db5f6',2,30,_binary '','74ad950f-1d71-450e-a388-7bcfee637e68',NULL),('eb9cffe2-d28c-49de-a542-51645d59ba3c',NULL,'client-secret-jwt','master','2514587b-4681-4d27-ba72-452f5688f9b7',2,30,_binary '\0',NULL,NULL),('ebff794b-4afb-4f85-99cc-5ef2475be9c5',NULL,'idp-username-password-form','ias','0a8fab10-9e33-4056-aa68-069cdef76d59',0,10,_binary '\0',NULL,NULL),('ecf00a7e-bd05-4da4-9fd3-8173b7dfcdac',NULL,'identity-provider-redirector','master','8eb9d8b3-18f4-41c2-8a01-920a1d4db5f6',2,25,_binary '\0',NULL,NULL),('f659ea41-da98-4cf7-97d1-20991893d944',NULL,'registration-page-form','ias','0e006cd9-bea8-4941-8189-41eb9b43d8a7',0,10,_binary '','771f98bb-9aeb-43c9-b84a-b43f7fc3d19d',NULL),('fa3b4d47-054f-47ce-912b-5407fd39bf34',NULL,'client-secret','master','2514587b-4681-4d27-ba72-452f5688f9b7',2,10,_binary '\0',NULL,NULL),('fd66ae15-d535-455f-b069-ce777ba297c2',NULL,'http-basic-authenticator','master','0d520903-5745-4990-b851-b5ab2d49b9a0',0,10,_binary '\0',NULL,NULL);
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
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('0a8fab10-9e33-4056-aa68-069cdef76d59','Verify Existing Account by Re-authentication','Reauthentication of existing account','ias','basic-flow',_binary '\0',_binary ''),('0d520903-5745-4990-b851-b5ab2d49b9a0','saml ecp','SAML ECP Profile Authentication Flow','master','basic-flow',_binary '',_binary ''),('0e006cd9-bea8-4941-8189-41eb9b43d8a7','registration','registration flow','ias','basic-flow',_binary '',_binary ''),('0f1c87e3-a502-4307-8d50-ac90890a4624','clients','Base authentication for clients','ias','client-flow',_binary '',_binary ''),('1270e2eb-09bd-4284-9812-4485c34b1e2e','saml ecp','SAML ECP Profile Authentication Flow','ias','basic-flow',_binary '',_binary ''),('1684869c-e848-49c9-ae72-bb4bff622612','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('16d94513-8a67-46c1-9663-a731617cf8c1','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','ias','basic-flow',_binary '\0',_binary ''),('17fdec6c-d508-4e06-84bb-4a45e2024a78','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','master','basic-flow',_binary '',_binary ''),('2514587b-4681-4d27-ba72-452f5688f9b7','clients','Base authentication for clients','master','client-flow',_binary '',_binary ''),('2e7d448a-d130-49fe-a7b2-9ac3a200253c','Authentication Options','Authentication options.','master','basic-flow',_binary '\0',_binary ''),('31f6daf4-a8dc-493c-bfd2-c3aa0613b915','User creation or linking','Flow for the existing/non-existing user alternatives','ias','basic-flow',_binary '\0',_binary ''),('32347dd5-3412-4aab-b583-8a883612a74d','registration','registration flow','master','basic-flow',_binary '',_binary ''),('38602ce1-7d00-4ccc-bbe1-588f526b5404','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','master','basic-flow',_binary '\0',_binary ''),('3e6aaacb-275c-40e1-896c-560b665442d0','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('48493795-7f83-490d-8896-4fecdbc6507d','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','ias','basic-flow',_binary '\0',_binary ''),('4e25d76d-f691-4cf4-ae6d-4f4aeeba77b3','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','ias','basic-flow',_binary '\0',_binary ''),('50dca0e2-afb3-440c-8552-c90d53f2762a','browser','browser based authentication','ias','basic-flow',_binary '',_binary ''),('51c43bf0-8f51-49ed-9aeb-131d5da5fc41','reset credentials','Reset credentials for a user if they forgot their password or something','ias','basic-flow',_binary '',_binary ''),('6fa1635d-9694-4172-ba89-70d764f2f8a6','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','ias','basic-flow',_binary '\0',_binary ''),('736a9606-7f8e-4c09-b775-722eb1956ce8','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','ias','basic-flow',_binary '',_binary ''),('74ad950f-1d71-450e-a388-7bcfee637e68','forms','Username, password, otp and other auth forms.','master','basic-flow',_binary '\0',_binary ''),('771f98bb-9aeb-43c9-b84a-b43f7fc3d19d','registration form','registration form','ias','form-flow',_binary '\0',_binary ''),('775f7aaa-099e-4068-95af-3a45a86cd3ce','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('7b8ceb64-43ac-4799-9c2a-926613942ce5','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','master','basic-flow',_binary '',_binary ''),('83930f20-0239-48d2-9785-76fc5ab7f9a7','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','ias','basic-flow',_binary '\0',_binary ''),('84f3a72b-3b81-4a2d-8c01-330bdb6fc9f8','Verify Existing Account by Re-authentication','Reauthentication of existing account','master','basic-flow',_binary '\0',_binary ''),('8eb9d8b3-18f4-41c2-8a01-920a1d4db5f6','browser','browser based authentication','master','basic-flow',_binary '',_binary ''),('a917a1ba-8e9a-44e7-8446-bc55b987864e','forms','Username, password, otp and other auth forms.','ias','basic-flow',_binary '\0',_binary ''),('ae7c2b48-402a-4e00-a750-01f8ce1e497e','User creation or linking','Flow for the existing/non-existing user alternatives','master','basic-flow',_binary '\0',_binary ''),('afdd7c0f-94d9-480d-b1f3-e27582f0f55c','reset credentials','Reset credentials for a user if they forgot their password or something','master','basic-flow',_binary '',_binary ''),('ba2e81b8-6813-4f7b-bb7b-bf310a800617','Account verification options','Method with which to verity the existing account','ias','basic-flow',_binary '\0',_binary ''),('c4b67b2e-8d42-43fe-9121-1d0e686d0527','docker auth','Used by Docker clients to authenticate against the IDP','ias','basic-flow',_binary '',_binary ''),('cee7f4df-8ad8-4fbe-8b0f-8fe0ab9d5ad0','Authentication Options','Authentication options.','ias','basic-flow',_binary '\0',_binary ''),('d5125681-e5e5-4759-b968-79922f4fca46','registration form','registration form','master','form-flow',_binary '\0',_binary ''),('e14e2f00-172f-4263-955a-57cc24c203f2','direct grant','OpenID Connect Resource Owner Grant','ias','basic-flow',_binary '',_binary ''),('e179cdfc-c1bc-4fe2-b801-1e114ee6e3a4','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','master','basic-flow',_binary '\0',_binary ''),('e298afb0-3167-46b1-823b-0e8605dbcf99','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','ias','basic-flow',_binary '',_binary ''),('e4aa5d2d-c775-44fe-b7ff-865d5c096509','docker auth','Used by Docker clients to authenticate against the IDP','master','basic-flow',_binary '',_binary ''),('f57840d6-0d68-4638-b77a-71bb5488523b','Account verification options','Method with which to verity the existing account','master','basic-flow',_binary '\0',_binary ''),('f79ef96c-d05f-4f25-8ef6-3c1c6392e1c5','direct grant','OpenID Connect Resource Owner Grant','master','basic-flow',_binary '',_binary '');
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
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('01625994-f5b7-47cc-995c-05933993b183','create unique user config','ias'),('38eb1ef6-c916-4037-b36c-7fe5a9c5c6c9','review profile config','ias'),('a2932aa1-b8ae-4f35-bac5-f3ca2d176cd0','create unique user config','master'),('a4ee2093-3770-4bdf-8853-c06df0f6df7d','recaptcha','ias'),('ef605807-842e-4aad-a14a-7bcd2025cf1c','review profile config','master');
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
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('01625994-f5b7-47cc-995c-05933993b183','false','require.password.update.after.registration'),('38eb1ef6-c916-4037-b36c-7fe5a9c5c6c9','missing','update.profile.on.first.login'),('a2932aa1-b8ae-4f35-bac5-f3ca2d176cd0','false','require.password.update.after.registration'),('a4ee2093-3770-4bdf-8853-c06df0f6df7d','6LeyQeIcAAAAAIb5oculclevOIsWJuMfNCSaoIis','secret'),('a4ee2093-3770-4bdf-8853-c06df0f6df7d','6LeyQeIcAAAAANsd9t2gtnUXblqArrTZODLjg8Ly','site.key'),('a4ee2093-3770-4bdf-8853-c06df0f6df7d','false','useRecaptchaNet'),('ef605807-842e-4aad-a14a-7bcd2025cf1c','missing','update.profile.on.first.login');
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
INSERT INTO `CLIENT` VALUES ('073999fd-253d-4682-a528-5a9a4107d606',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/ias/console/',_binary '\0',NULL,_binary '\0','ias','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('17e4b6ce-2d37-4120-8a06-63cbfc1e44bf',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/master/console/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('188e81b0-1500-44c6-83ad-a165bbaed7cb',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','ias','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('5f96970c-5f18-467f-aaa4-393a06c1f888',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/ias/account/',_binary '\0',NULL,_binary '\0','ias','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('67d49066-d651-410f-9920-8752a4441887',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('7df64a72-159e-42ab-9566-bada3b93a0b7',_binary '',_binary '\0','realm-management',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','ias','openid-connect',0,_binary '\0',_binary '\0','${client_realm-management}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('848e6b3a-035c-41a4-90a8-7dd05717c6fb',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('8dabb2ba-cbcb-4c82-971d-7da037d5e1e5',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','ias','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('ba740bf8-c5e8-4fe6-8fcb-74d16583ba35',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('bb57334f-1281-418d-9b72-242980a349f0',_binary '',_binary '\0','master-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master',NULL,0,_binary '\0',_binary '\0','master Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('c25c16d2-e62e-4c3d-96ed-8857138a01c4',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/ias/account/',_binary '\0',NULL,_binary '\0','ias','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('d51526d9-f3c6-48c5-807f-98a41d72dbe2',_binary '',_binary '\0','ias-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master',NULL,0,_binary '\0',_binary '\0','ias Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('f3f58bd1-dff3-4979-ac43-f5e56e9567b0',_binary '',_binary '','django',0,_binary '\0','3b4c1f2b-b2d5-4442-948e-fc9c686162db',NULL,_binary '\0',NULL,_binary '\0','ias','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('fe998b2b-c79a-4b1d-9bb9-b49bf4a5ea9f',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0');
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
INSERT INTO `CLIENT_ATTRIBUTES` VALUES ('073999fd-253d-4682-a528-5a9a4107d606','S256','pkce.code.challenge.method'),('17e4b6ce-2d37-4120-8a06-63cbfc1e44bf','S256','pkce.code.challenge.method'),('5f96970c-5f18-467f-aaa4-393a06c1f888','S256','pkce.code.challenge.method'),('f3f58bd1-dff3-4979-ac43-f5e56e9567b0','false','backchannel.logout.revoke.offline.tokens'),('f3f58bd1-dff3-4979-ac43-f5e56e9567b0','true','backchannel.logout.session.required'),('f3f58bd1-dff3-4979-ac43-f5e56e9567b0','false','client_credentials.use_refresh_token'),('f3f58bd1-dff3-4979-ac43-f5e56e9567b0','false','display.on.consent.screen'),('f3f58bd1-dff3-4979-ac43-f5e56e9567b0','false','exclude.session.state.from.auth.response'),('f3f58bd1-dff3-4979-ac43-f5e56e9567b0','false','id.token.as.detached.signature'),('f3f58bd1-dff3-4979-ac43-f5e56e9567b0','false','oauth2.device.authorization.grant.enabled'),('f3f58bd1-dff3-4979-ac43-f5e56e9567b0','false','oidc.ciba.grant.enabled'),('f3f58bd1-dff3-4979-ac43-f5e56e9567b0','false','require.pushed.authorization.requests'),('f3f58bd1-dff3-4979-ac43-f5e56e9567b0','false','saml.artifact.binding'),('f3f58bd1-dff3-4979-ac43-f5e56e9567b0','false','saml.assertion.signature'),('f3f58bd1-dff3-4979-ac43-f5e56e9567b0','false','saml.authnstatement'),('f3f58bd1-dff3-4979-ac43-f5e56e9567b0','false','saml.client.signature'),('f3f58bd1-dff3-4979-ac43-f5e56e9567b0','false','saml.encrypt'),('f3f58bd1-dff3-4979-ac43-f5e56e9567b0','false','saml.force.post.binding'),('f3f58bd1-dff3-4979-ac43-f5e56e9567b0','false','saml.multivalued.roles'),('f3f58bd1-dff3-4979-ac43-f5e56e9567b0','false','saml.onetimeuse.condition'),('f3f58bd1-dff3-4979-ac43-f5e56e9567b0','false','saml.server.signature'),('f3f58bd1-dff3-4979-ac43-f5e56e9567b0','false','saml.server.signature.keyinfo.ext'),('f3f58bd1-dff3-4979-ac43-f5e56e9567b0','false','saml_force_name_id_format'),('f3f58bd1-dff3-4979-ac43-f5e56e9567b0','false','tls.client.certificate.bound.access.tokens'),('f3f58bd1-dff3-4979-ac43-f5e56e9567b0','true','use.refresh.tokens'),('fe998b2b-c79a-4b1d-9bb9-b49bf4a5ea9f','S256','pkce.code.challenge.method');
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
INSERT INTO `CLIENT_SCOPE` VALUES ('00e914d0-5a5b-41fa-b340-bb569cae64b4','web-origins','master','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('1f84e575-9641-47da-851e-b2f36be3fd99','phone','master','OpenID Connect built-in scope: phone','openid-connect'),('21705b5e-1868-4124-a6e7-8f8e0ad2c06b','microprofile-jwt','master','Microprofile - JWT built-in scope','openid-connect'),('28a88a8b-766b-4f4b-8fec-078bb763db4a','microprofile-jwt','ias','Microprofile - JWT built-in scope','openid-connect'),('39a7c67b-b33b-4f76-8342-92f2637d58d7','phone','ias','OpenID Connect built-in scope: phone','openid-connect'),('4b9909c5-a42f-4918-977a-5838a054985e','address','master','OpenID Connect built-in scope: address','openid-connect'),('59192a1a-e36a-42b2-bf25-cd28adcd29e3','role_list','ias','SAML role list','saml'),('5db91e77-860f-4d85-ac52-c7c7b33bf983','email','master','OpenID Connect built-in scope: email','openid-connect'),('60c4906c-0891-4c67-98ef-dd1808de630f','roles','ias','OpenID Connect scope for add user roles to the access token','openid-connect'),('6182ac67-b543-4025-848f-6a515620099f','email','ias','OpenID Connect built-in scope: email','openid-connect'),('7ff9af48-41ae-495c-85c9-7192d55ba3c0','profile','master','OpenID Connect built-in scope: profile','openid-connect'),('83089d6a-98d8-443c-a264-3433f2a0e9d8','address','ias','OpenID Connect built-in scope: address','openid-connect'),('9aa6c533-f30a-4185-9917-f8bf5382c0ce','role_list','master','SAML role list','saml'),('a73aa148-01a8-41dd-b7af-2f1b2233a9df','offline_access','master','OpenID Connect built-in scope: offline_access','openid-connect'),('aa7d9552-67cf-4af3-a062-6dd5b3cf7a4a','roles','master','OpenID Connect scope for add user roles to the access token','openid-connect'),('c11e6f95-2ce3-4d06-ac70-074171a216d9','web-origins','ias','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('ce99109a-e23f-4d3b-981a-04910c07f7c9','offline_access','ias','OpenID Connect built-in scope: offline_access','openid-connect'),('f66cf953-2950-456a-aedd-3f30e5c764ba','profile','ias','OpenID Connect built-in scope: profile','openid-connect');
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
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('00e914d0-5a5b-41fa-b340-bb569cae64b4','','consent.screen.text'),('00e914d0-5a5b-41fa-b340-bb569cae64b4','false','display.on.consent.screen'),('00e914d0-5a5b-41fa-b340-bb569cae64b4','false','include.in.token.scope'),('1f84e575-9641-47da-851e-b2f36be3fd99','${phoneScopeConsentText}','consent.screen.text'),('1f84e575-9641-47da-851e-b2f36be3fd99','true','display.on.consent.screen'),('1f84e575-9641-47da-851e-b2f36be3fd99','true','include.in.token.scope'),('21705b5e-1868-4124-a6e7-8f8e0ad2c06b','false','display.on.consent.screen'),('21705b5e-1868-4124-a6e7-8f8e0ad2c06b','true','include.in.token.scope'),('28a88a8b-766b-4f4b-8fec-078bb763db4a','false','display.on.consent.screen'),('28a88a8b-766b-4f4b-8fec-078bb763db4a','true','include.in.token.scope'),('39a7c67b-b33b-4f76-8342-92f2637d58d7','${phoneScopeConsentText}','consent.screen.text'),('39a7c67b-b33b-4f76-8342-92f2637d58d7','true','display.on.consent.screen'),('39a7c67b-b33b-4f76-8342-92f2637d58d7','true','include.in.token.scope'),('4b9909c5-a42f-4918-977a-5838a054985e','${addressScopeConsentText}','consent.screen.text'),('4b9909c5-a42f-4918-977a-5838a054985e','true','display.on.consent.screen'),('4b9909c5-a42f-4918-977a-5838a054985e','true','include.in.token.scope'),('59192a1a-e36a-42b2-bf25-cd28adcd29e3','${samlRoleListScopeConsentText}','consent.screen.text'),('59192a1a-e36a-42b2-bf25-cd28adcd29e3','true','display.on.consent.screen'),('5db91e77-860f-4d85-ac52-c7c7b33bf983','${emailScopeConsentText}','consent.screen.text'),('5db91e77-860f-4d85-ac52-c7c7b33bf983','true','display.on.consent.screen'),('5db91e77-860f-4d85-ac52-c7c7b33bf983','true','include.in.token.scope'),('60c4906c-0891-4c67-98ef-dd1808de630f','${rolesScopeConsentText}','consent.screen.text'),('60c4906c-0891-4c67-98ef-dd1808de630f','true','display.on.consent.screen'),('60c4906c-0891-4c67-98ef-dd1808de630f','false','include.in.token.scope'),('6182ac67-b543-4025-848f-6a515620099f','${emailScopeConsentText}','consent.screen.text'),('6182ac67-b543-4025-848f-6a515620099f','true','display.on.consent.screen'),('6182ac67-b543-4025-848f-6a515620099f','true','include.in.token.scope'),('7ff9af48-41ae-495c-85c9-7192d55ba3c0','${profileScopeConsentText}','consent.screen.text'),('7ff9af48-41ae-495c-85c9-7192d55ba3c0','true','display.on.consent.screen'),('7ff9af48-41ae-495c-85c9-7192d55ba3c0','true','include.in.token.scope'),('83089d6a-98d8-443c-a264-3433f2a0e9d8','${addressScopeConsentText}','consent.screen.text'),('83089d6a-98d8-443c-a264-3433f2a0e9d8','true','display.on.consent.screen'),('83089d6a-98d8-443c-a264-3433f2a0e9d8','true','include.in.token.scope'),('9aa6c533-f30a-4185-9917-f8bf5382c0ce','${samlRoleListScopeConsentText}','consent.screen.text'),('9aa6c533-f30a-4185-9917-f8bf5382c0ce','true','display.on.consent.screen'),('a73aa148-01a8-41dd-b7af-2f1b2233a9df','${offlineAccessScopeConsentText}','consent.screen.text'),('a73aa148-01a8-41dd-b7af-2f1b2233a9df','true','display.on.consent.screen'),('aa7d9552-67cf-4af3-a062-6dd5b3cf7a4a','${rolesScopeConsentText}','consent.screen.text'),('aa7d9552-67cf-4af3-a062-6dd5b3cf7a4a','true','display.on.consent.screen'),('aa7d9552-67cf-4af3-a062-6dd5b3cf7a4a','false','include.in.token.scope'),('c11e6f95-2ce3-4d06-ac70-074171a216d9','','consent.screen.text'),('c11e6f95-2ce3-4d06-ac70-074171a216d9','false','display.on.consent.screen'),('c11e6f95-2ce3-4d06-ac70-074171a216d9','false','include.in.token.scope'),('ce99109a-e23f-4d3b-981a-04910c07f7c9','${offlineAccessScopeConsentText}','consent.screen.text'),('ce99109a-e23f-4d3b-981a-04910c07f7c9','true','display.on.consent.screen'),('f66cf953-2950-456a-aedd-3f30e5c764ba','${profileScopeConsentText}','consent.screen.text'),('f66cf953-2950-456a-aedd-3f30e5c764ba','true','display.on.consent.screen'),('f66cf953-2950-456a-aedd-3f30e5c764ba','true','include.in.token.scope');
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
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('073999fd-253d-4682-a528-5a9a4107d606','28a88a8b-766b-4f4b-8fec-078bb763db4a',_binary '\0'),('073999fd-253d-4682-a528-5a9a4107d606','39a7c67b-b33b-4f76-8342-92f2637d58d7',_binary '\0'),('073999fd-253d-4682-a528-5a9a4107d606','60c4906c-0891-4c67-98ef-dd1808de630f',_binary ''),('073999fd-253d-4682-a528-5a9a4107d606','6182ac67-b543-4025-848f-6a515620099f',_binary ''),('073999fd-253d-4682-a528-5a9a4107d606','83089d6a-98d8-443c-a264-3433f2a0e9d8',_binary '\0'),('073999fd-253d-4682-a528-5a9a4107d606','c11e6f95-2ce3-4d06-ac70-074171a216d9',_binary ''),('073999fd-253d-4682-a528-5a9a4107d606','ce99109a-e23f-4d3b-981a-04910c07f7c9',_binary '\0'),('073999fd-253d-4682-a528-5a9a4107d606','f66cf953-2950-456a-aedd-3f30e5c764ba',_binary ''),('17e4b6ce-2d37-4120-8a06-63cbfc1e44bf','00e914d0-5a5b-41fa-b340-bb569cae64b4',_binary ''),('17e4b6ce-2d37-4120-8a06-63cbfc1e44bf','1f84e575-9641-47da-851e-b2f36be3fd99',_binary '\0'),('17e4b6ce-2d37-4120-8a06-63cbfc1e44bf','21705b5e-1868-4124-a6e7-8f8e0ad2c06b',_binary '\0'),('17e4b6ce-2d37-4120-8a06-63cbfc1e44bf','4b9909c5-a42f-4918-977a-5838a054985e',_binary '\0'),('17e4b6ce-2d37-4120-8a06-63cbfc1e44bf','5db91e77-860f-4d85-ac52-c7c7b33bf983',_binary ''),('17e4b6ce-2d37-4120-8a06-63cbfc1e44bf','7ff9af48-41ae-495c-85c9-7192d55ba3c0',_binary ''),('17e4b6ce-2d37-4120-8a06-63cbfc1e44bf','a73aa148-01a8-41dd-b7af-2f1b2233a9df',_binary '\0'),('17e4b6ce-2d37-4120-8a06-63cbfc1e44bf','aa7d9552-67cf-4af3-a062-6dd5b3cf7a4a',_binary ''),('188e81b0-1500-44c6-83ad-a165bbaed7cb','28a88a8b-766b-4f4b-8fec-078bb763db4a',_binary '\0'),('188e81b0-1500-44c6-83ad-a165bbaed7cb','39a7c67b-b33b-4f76-8342-92f2637d58d7',_binary '\0'),('188e81b0-1500-44c6-83ad-a165bbaed7cb','60c4906c-0891-4c67-98ef-dd1808de630f',_binary ''),('188e81b0-1500-44c6-83ad-a165bbaed7cb','6182ac67-b543-4025-848f-6a515620099f',_binary ''),('188e81b0-1500-44c6-83ad-a165bbaed7cb','83089d6a-98d8-443c-a264-3433f2a0e9d8',_binary '\0'),('188e81b0-1500-44c6-83ad-a165bbaed7cb','c11e6f95-2ce3-4d06-ac70-074171a216d9',_binary ''),('188e81b0-1500-44c6-83ad-a165bbaed7cb','ce99109a-e23f-4d3b-981a-04910c07f7c9',_binary '\0'),('188e81b0-1500-44c6-83ad-a165bbaed7cb','f66cf953-2950-456a-aedd-3f30e5c764ba',_binary ''),('5f96970c-5f18-467f-aaa4-393a06c1f888','28a88a8b-766b-4f4b-8fec-078bb763db4a',_binary '\0'),('5f96970c-5f18-467f-aaa4-393a06c1f888','39a7c67b-b33b-4f76-8342-92f2637d58d7',_binary '\0'),('5f96970c-5f18-467f-aaa4-393a06c1f888','60c4906c-0891-4c67-98ef-dd1808de630f',_binary ''),('5f96970c-5f18-467f-aaa4-393a06c1f888','6182ac67-b543-4025-848f-6a515620099f',_binary ''),('5f96970c-5f18-467f-aaa4-393a06c1f888','83089d6a-98d8-443c-a264-3433f2a0e9d8',_binary '\0'),('5f96970c-5f18-467f-aaa4-393a06c1f888','c11e6f95-2ce3-4d06-ac70-074171a216d9',_binary ''),('5f96970c-5f18-467f-aaa4-393a06c1f888','ce99109a-e23f-4d3b-981a-04910c07f7c9',_binary '\0'),('5f96970c-5f18-467f-aaa4-393a06c1f888','f66cf953-2950-456a-aedd-3f30e5c764ba',_binary ''),('67d49066-d651-410f-9920-8752a4441887','00e914d0-5a5b-41fa-b340-bb569cae64b4',_binary ''),('67d49066-d651-410f-9920-8752a4441887','1f84e575-9641-47da-851e-b2f36be3fd99',_binary '\0'),('67d49066-d651-410f-9920-8752a4441887','21705b5e-1868-4124-a6e7-8f8e0ad2c06b',_binary '\0'),('67d49066-d651-410f-9920-8752a4441887','4b9909c5-a42f-4918-977a-5838a054985e',_binary '\0'),('67d49066-d651-410f-9920-8752a4441887','5db91e77-860f-4d85-ac52-c7c7b33bf983',_binary ''),('67d49066-d651-410f-9920-8752a4441887','7ff9af48-41ae-495c-85c9-7192d55ba3c0',_binary ''),('67d49066-d651-410f-9920-8752a4441887','a73aa148-01a8-41dd-b7af-2f1b2233a9df',_binary '\0'),('67d49066-d651-410f-9920-8752a4441887','aa7d9552-67cf-4af3-a062-6dd5b3cf7a4a',_binary ''),('7df64a72-159e-42ab-9566-bada3b93a0b7','28a88a8b-766b-4f4b-8fec-078bb763db4a',_binary '\0'),('7df64a72-159e-42ab-9566-bada3b93a0b7','39a7c67b-b33b-4f76-8342-92f2637d58d7',_binary '\0'),('7df64a72-159e-42ab-9566-bada3b93a0b7','60c4906c-0891-4c67-98ef-dd1808de630f',_binary ''),('7df64a72-159e-42ab-9566-bada3b93a0b7','6182ac67-b543-4025-848f-6a515620099f',_binary ''),('7df64a72-159e-42ab-9566-bada3b93a0b7','83089d6a-98d8-443c-a264-3433f2a0e9d8',_binary '\0'),('7df64a72-159e-42ab-9566-bada3b93a0b7','c11e6f95-2ce3-4d06-ac70-074171a216d9',_binary ''),('7df64a72-159e-42ab-9566-bada3b93a0b7','ce99109a-e23f-4d3b-981a-04910c07f7c9',_binary '\0'),('7df64a72-159e-42ab-9566-bada3b93a0b7','f66cf953-2950-456a-aedd-3f30e5c764ba',_binary ''),('848e6b3a-035c-41a4-90a8-7dd05717c6fb','00e914d0-5a5b-41fa-b340-bb569cae64b4',_binary ''),('848e6b3a-035c-41a4-90a8-7dd05717c6fb','1f84e575-9641-47da-851e-b2f36be3fd99',_binary '\0'),('848e6b3a-035c-41a4-90a8-7dd05717c6fb','21705b5e-1868-4124-a6e7-8f8e0ad2c06b',_binary '\0'),('848e6b3a-035c-41a4-90a8-7dd05717c6fb','4b9909c5-a42f-4918-977a-5838a054985e',_binary '\0'),('848e6b3a-035c-41a4-90a8-7dd05717c6fb','5db91e77-860f-4d85-ac52-c7c7b33bf983',_binary ''),('848e6b3a-035c-41a4-90a8-7dd05717c6fb','7ff9af48-41ae-495c-85c9-7192d55ba3c0',_binary ''),('848e6b3a-035c-41a4-90a8-7dd05717c6fb','a73aa148-01a8-41dd-b7af-2f1b2233a9df',_binary '\0'),('848e6b3a-035c-41a4-90a8-7dd05717c6fb','aa7d9552-67cf-4af3-a062-6dd5b3cf7a4a',_binary ''),('8dabb2ba-cbcb-4c82-971d-7da037d5e1e5','28a88a8b-766b-4f4b-8fec-078bb763db4a',_binary '\0'),('8dabb2ba-cbcb-4c82-971d-7da037d5e1e5','39a7c67b-b33b-4f76-8342-92f2637d58d7',_binary '\0'),('8dabb2ba-cbcb-4c82-971d-7da037d5e1e5','60c4906c-0891-4c67-98ef-dd1808de630f',_binary ''),('8dabb2ba-cbcb-4c82-971d-7da037d5e1e5','6182ac67-b543-4025-848f-6a515620099f',_binary ''),('8dabb2ba-cbcb-4c82-971d-7da037d5e1e5','83089d6a-98d8-443c-a264-3433f2a0e9d8',_binary '\0'),('8dabb2ba-cbcb-4c82-971d-7da037d5e1e5','c11e6f95-2ce3-4d06-ac70-074171a216d9',_binary ''),('8dabb2ba-cbcb-4c82-971d-7da037d5e1e5','ce99109a-e23f-4d3b-981a-04910c07f7c9',_binary '\0'),('8dabb2ba-cbcb-4c82-971d-7da037d5e1e5','f66cf953-2950-456a-aedd-3f30e5c764ba',_binary ''),('ba740bf8-c5e8-4fe6-8fcb-74d16583ba35','00e914d0-5a5b-41fa-b340-bb569cae64b4',_binary ''),('ba740bf8-c5e8-4fe6-8fcb-74d16583ba35','1f84e575-9641-47da-851e-b2f36be3fd99',_binary '\0'),('ba740bf8-c5e8-4fe6-8fcb-74d16583ba35','21705b5e-1868-4124-a6e7-8f8e0ad2c06b',_binary '\0'),('ba740bf8-c5e8-4fe6-8fcb-74d16583ba35','4b9909c5-a42f-4918-977a-5838a054985e',_binary '\0'),('ba740bf8-c5e8-4fe6-8fcb-74d16583ba35','5db91e77-860f-4d85-ac52-c7c7b33bf983',_binary ''),('ba740bf8-c5e8-4fe6-8fcb-74d16583ba35','7ff9af48-41ae-495c-85c9-7192d55ba3c0',_binary ''),('ba740bf8-c5e8-4fe6-8fcb-74d16583ba35','a73aa148-01a8-41dd-b7af-2f1b2233a9df',_binary '\0'),('ba740bf8-c5e8-4fe6-8fcb-74d16583ba35','aa7d9552-67cf-4af3-a062-6dd5b3cf7a4a',_binary ''),('bb57334f-1281-418d-9b72-242980a349f0','00e914d0-5a5b-41fa-b340-bb569cae64b4',_binary ''),('bb57334f-1281-418d-9b72-242980a349f0','1f84e575-9641-47da-851e-b2f36be3fd99',_binary '\0'),('bb57334f-1281-418d-9b72-242980a349f0','21705b5e-1868-4124-a6e7-8f8e0ad2c06b',_binary '\0'),('bb57334f-1281-418d-9b72-242980a349f0','4b9909c5-a42f-4918-977a-5838a054985e',_binary '\0'),('bb57334f-1281-418d-9b72-242980a349f0','5db91e77-860f-4d85-ac52-c7c7b33bf983',_binary ''),('bb57334f-1281-418d-9b72-242980a349f0','7ff9af48-41ae-495c-85c9-7192d55ba3c0',_binary ''),('bb57334f-1281-418d-9b72-242980a349f0','a73aa148-01a8-41dd-b7af-2f1b2233a9df',_binary '\0'),('bb57334f-1281-418d-9b72-242980a349f0','aa7d9552-67cf-4af3-a062-6dd5b3cf7a4a',_binary ''),('c25c16d2-e62e-4c3d-96ed-8857138a01c4','28a88a8b-766b-4f4b-8fec-078bb763db4a',_binary '\0'),('c25c16d2-e62e-4c3d-96ed-8857138a01c4','39a7c67b-b33b-4f76-8342-92f2637d58d7',_binary '\0'),('c25c16d2-e62e-4c3d-96ed-8857138a01c4','60c4906c-0891-4c67-98ef-dd1808de630f',_binary ''),('c25c16d2-e62e-4c3d-96ed-8857138a01c4','6182ac67-b543-4025-848f-6a515620099f',_binary ''),('c25c16d2-e62e-4c3d-96ed-8857138a01c4','83089d6a-98d8-443c-a264-3433f2a0e9d8',_binary '\0'),('c25c16d2-e62e-4c3d-96ed-8857138a01c4','c11e6f95-2ce3-4d06-ac70-074171a216d9',_binary ''),('c25c16d2-e62e-4c3d-96ed-8857138a01c4','ce99109a-e23f-4d3b-981a-04910c07f7c9',_binary '\0'),('c25c16d2-e62e-4c3d-96ed-8857138a01c4','f66cf953-2950-456a-aedd-3f30e5c764ba',_binary ''),('f3f58bd1-dff3-4979-ac43-f5e56e9567b0','28a88a8b-766b-4f4b-8fec-078bb763db4a',_binary '\0'),('f3f58bd1-dff3-4979-ac43-f5e56e9567b0','39a7c67b-b33b-4f76-8342-92f2637d58d7',_binary '\0'),('f3f58bd1-dff3-4979-ac43-f5e56e9567b0','60c4906c-0891-4c67-98ef-dd1808de630f',_binary ''),('f3f58bd1-dff3-4979-ac43-f5e56e9567b0','6182ac67-b543-4025-848f-6a515620099f',_binary ''),('f3f58bd1-dff3-4979-ac43-f5e56e9567b0','83089d6a-98d8-443c-a264-3433f2a0e9d8',_binary '\0'),('f3f58bd1-dff3-4979-ac43-f5e56e9567b0','c11e6f95-2ce3-4d06-ac70-074171a216d9',_binary ''),('f3f58bd1-dff3-4979-ac43-f5e56e9567b0','ce99109a-e23f-4d3b-981a-04910c07f7c9',_binary '\0'),('f3f58bd1-dff3-4979-ac43-f5e56e9567b0','f66cf953-2950-456a-aedd-3f30e5c764ba',_binary ''),('fe998b2b-c79a-4b1d-9bb9-b49bf4a5ea9f','00e914d0-5a5b-41fa-b340-bb569cae64b4',_binary ''),('fe998b2b-c79a-4b1d-9bb9-b49bf4a5ea9f','1f84e575-9641-47da-851e-b2f36be3fd99',_binary '\0'),('fe998b2b-c79a-4b1d-9bb9-b49bf4a5ea9f','21705b5e-1868-4124-a6e7-8f8e0ad2c06b',_binary '\0'),('fe998b2b-c79a-4b1d-9bb9-b49bf4a5ea9f','4b9909c5-a42f-4918-977a-5838a054985e',_binary '\0'),('fe998b2b-c79a-4b1d-9bb9-b49bf4a5ea9f','5db91e77-860f-4d85-ac52-c7c7b33bf983',_binary ''),('fe998b2b-c79a-4b1d-9bb9-b49bf4a5ea9f','7ff9af48-41ae-495c-85c9-7192d55ba3c0',_binary ''),('fe998b2b-c79a-4b1d-9bb9-b49bf4a5ea9f','a73aa148-01a8-41dd-b7af-2f1b2233a9df',_binary '\0'),('fe998b2b-c79a-4b1d-9bb9-b49bf4a5ea9f','aa7d9552-67cf-4af3-a062-6dd5b3cf7a4a',_binary '');
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
INSERT INTO `CLIENT_SCOPE_ROLE_MAPPING` VALUES ('a73aa148-01a8-41dd-b7af-2f1b2233a9df','888ecaf8-aadc-45da-8767-b10cc42c2481'),('ce99109a-e23f-4d3b-981a-04910c07f7c9','92f4d874-7670-4892-b2f9-89818e9d355f');
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
INSERT INTO `COMPONENT` VALUES ('235befcd-b489-4698-8b8f-da033287f29d','Consent Required','ias','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','ias','anonymous'),('339492a8-b723-41c0-ad34-2bbd837be40a','Allowed Client Scopes','ias','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','ias','anonymous'),('354876ef-ab10-4a1f-b2a7-d63da1a36f70','Trusted Hosts','ias','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','ias','anonymous'),('391a4fa5-71d7-4f22-bd33-302baa281b49',NULL,'ias','declarative-user-profile','org.keycloak.userprofile.UserProfileProvider','ias',NULL),('3d86c0ee-4cfc-4c7d-bd34-dae4fc3c3180','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('45229e83-9e77-434f-bd74-7b8691a86b4b','Max Clients Limit','ias','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','ias','anonymous'),('47db9f75-9f18-4a7c-82e9-5ec270dac527','Max Clients Limit','master','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('4c201bf3-e6ba-4e39-b0b0-07ac5fedf166','rsa-generated','master','rsa-generated','org.keycloak.keys.KeyProvider','master',NULL),('4fc57844-da41-4a5d-8fe7-c60822f1fbe5','rsa-enc-generated','ias','rsa-generated','org.keycloak.keys.KeyProvider','ias',NULL),('54efa8dd-580f-435e-898f-0f7c8e8a3eac','aes-generated','ias','aes-generated','org.keycloak.keys.KeyProvider','ias',NULL),('5c584003-01a3-44ff-bc19-eb0778080d3e','Allowed Protocol Mapper Types','ias','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','ias','authenticated'),('74632b50-a3a7-4cd3-9bd3-66d6355228bf','Allowed Client Scopes','ias','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','ias','authenticated'),('7b7c15a9-8456-4e36-a18a-6bc72c9e763b','Full Scope Disabled','ias','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','ias','anonymous'),('7e1bfaea-ea70-4702-9c3d-18f989345936','Allowed Protocol Mapper Types','ias','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','ias','anonymous'),('84bc79cd-9e95-4266-93b3-bbc28a26b257','Trusted Hosts','master','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('a05f0de5-0a71-4072-950f-51b9a9271f4d','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('a762baff-ef26-4264-9cfb-fe82b10d7b25','rsa-enc-generated','master','rsa-generated','org.keycloak.keys.KeyProvider','master',NULL),('ac818e64-cc4c-4085-9c1d-e58f6a1dc2b6','hmac-generated','ias','hmac-generated','org.keycloak.keys.KeyProvider','ias',NULL),('b1dd975d-c51c-40be-9497-723cecc14946','hmac-generated','master','hmac-generated','org.keycloak.keys.KeyProvider','master',NULL),('bf9270af-0ce8-4260-88ec-09d8e407ef12','rsa-generated','ias','rsa-generated','org.keycloak.keys.KeyProvider','ias',NULL),('c1fbab7b-39b4-4a80-9a50-f74afeab916d','Consent Required','master','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('c2d88a76-4b64-4add-bbb7-0c7cd449ce02','Full Scope Disabled','master','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('c57ec8f8-5689-4ad0-8f3a-d7e87effa25e','aes-generated','master','aes-generated','org.keycloak.keys.KeyProvider','master',NULL),('cbd7fe66-b8d1-4da1-9cfe-4f10bbb06488','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('d993c4e2-9faa-4938-a4e7-bb8f4eeafec9','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous');
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
INSERT INTO `COMPONENT_CONFIG` VALUES ('01f767bf-4099-44b9-a2f4-e5d851465b85','a762baff-ef26-4264-9cfb-fe82b10d7b25','privateKey','MIIEowIBAAKCAQEA3fWEhReSQo0Cw93jq27OSW8v43W0LHevCxLCjJFO+5zi4QnZF8oL7Z9lpE8/YXcWHkVGvrl6eIagB/vGUt0XhFMPUnsHWxiyz5EfYaBqQ0L//8pUBCL2/rXjX6iEIB+bp/OmOy9KgLVHR1lisEvjNNXp8HP3NJWtFs9f13djXFY5eQSAwzVhbU5pFX7eprb8Ye/vQNV/XjFF6HKdgVPAVHKVrvYchMhjp/HLcvyzDXBiejsf0J+3L2FOtGu9nziZT56vJpir8IOhDbV5jaE2a9HPkhzwPfYJwd3lF6tQaZg8RxOZMVyl1k9ltW/+lUczyaGYxdVzS3CR2VGs95Ns7QIDAQABAoIBAQC+c670LJeZdzmKK1jxfrCPHlKvEA47oa6XB8/boctt5t5eTn7zBLFbgcxLQpyV2wMlkjfz618FEC886nLwIznMlyCsm1hieDzmEhYlROopMNJM/6U7r2zUfenN6OEGV1jOsihO3HNHIUU6GZ6uu08HxQ1o/3h8rHnK+sG4Nn8ReGmd5Ys/rYPxzP9zopZPz7hpDeC9uvNGLq9WtfIGG7hhQ2wDEAeB7MkEi0TwnGoVnD7h816cQjJbPuU6NBNnbdFm26jo2fPlVqRt/YPnSCQc5u1S9MqSF0M4cZTORxdSsSpACwBs/sk2azR4GaYScaImv6CO0BlxV7ggYqCUPbEZAoGBAPcGeyxNONUgaZW0OPRx4tjCCNSBzT2QsK3g64MrcvQ9OnE8hxsm99krf7AMW0i4P813gDgO+9masO56Q/WoviTygPMRZVNa7selXCfYNWUS6hGnkGaNHjJ4Hkp4dkGpaMy2b99SIK1aLwdFiYwiNisY5ujY0u2MxyHTqdrVwZizAoGBAOYF5tJwSI6GaexaAd2hfD/YlDJt+40fJ4q4jk0q2ZWAvGJLNbvE/S/JevDoxxQsf7WyMBKT+c2WETQSq8Z9dfGiPoEEf5huM1/KsLLTedeIp748Q56cEROzKQqHoFK/FyrMyhLKJFoQlBibOr0XHk5ZepVYzHmg+ZJKyPLnzXPfAoGAIzwlbZhGNwA8j0H5rcRg2xIyOD2bjOCKkwK2FSupZfUl1OkRTGouiCeQOwhILQM69o/JFjXs7okGG74M24mKNbLxebpNfapGzOtlTbmlRBmCkaoZCseuOvyvNWghVhRYAnszUeNhDdkDREJC8F4g49zVcvkafQ/Lh6OtYq2Cw8kCgYACSrrDDAVdDi/OABOWrr47MKBBZGEmRdIyCqa4VB345GB8Jj2x0kOnjz1fWyJorAzVtaHO/ZR2nPEs8Kavgp6DOteel3nh/e8bHDzoezzyjdUGCzmtQebVqGpXRYSubmL/tSyqRUNZdmLTX/CU478UjsWu6USYTadO8tnPucmNRwKBgDY7kmuYciqTa2Om+bjW9BzriVzx4zGM1u7QLRXs3zDzecGEvL60mH9cNMfwEw+lQZSE/XH6h1vUTXDWV4dnNBvSaGVRSuyBuGR39+CwgwsDhDc63WMyK5+PWPW3PvxJZGnKUsl/7rwYnpL/C1ljHYuJzuhJv1WcIO4Gck2+PCb1'),('027ca406-6085-4935-8360-88b6727c9cb3','7e1bfaea-ea70-4702-9c3d-18f989345936','allowed-protocol-mapper-types','saml-role-list-mapper'),('04977918-287c-49c4-abc4-547cd4c3e555','5c584003-01a3-44ff-bc19-eb0778080d3e','allowed-protocol-mapper-types','oidc-address-mapper'),('0c96b2d5-25ea-4ba6-91ed-7ff5afec5c03','b1dd975d-c51c-40be-9497-723cecc14946','secret','hRdeMxO9jcG2MOd-qT36d-F-agHVUf48nlEbwYOFeX6TLjlIRkf2xS2KZazMlZRlMIgu6SIaYp8CNhRqQpD8CA'),('11b5137e-e181-4090-bc49-7513d2c27bca','4c201bf3-e6ba-4e39-b0b0-07ac5fedf166','priority','100'),('132f638b-4c6e-4919-8469-1d53810b8ec3','54efa8dd-580f-435e-898f-0f7c8e8a3eac','secret','iaU3-Cm4_j8phphuGJxrlQ'),('1b440cd2-5136-4210-986a-4bb48a960707','bf9270af-0ce8-4260-88ec-09d8e407ef12','keyUse','sig'),('224cccc9-d614-4b65-be14-15292f023dae','354876ef-ab10-4a1f-b2a7-d63da1a36f70','host-sending-registration-request-must-match','true'),('27929479-251c-4bdd-88b9-794d1f7a1578','d993c4e2-9faa-4938-a4e7-bb8f4eeafec9','allowed-protocol-mapper-types','oidc-address-mapper'),('2a860ad7-7215-4a32-a7ad-2d29c8328323','a762baff-ef26-4264-9cfb-fe82b10d7b25','certificate','MIICmzCCAYMCBgF8PFdOxjANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjExMDAxMTQ1MDI3WhcNMzExMDAxMTQ1MjA3WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDd9YSFF5JCjQLD3eOrbs5Jby/jdbQsd68LEsKMkU77nOLhCdkXygvtn2WkTz9hdxYeRUa+uXp4hqAH+8ZS3ReEUw9SewdbGLLPkR9hoGpDQv//ylQEIvb+teNfqIQgH5un86Y7L0qAtUdHWWKwS+M01enwc/c0la0Wz1/Xd2NcVjl5BIDDNWFtTmkVft6mtvxh7+9A1X9eMUXocp2BU8BUcpWu9hyEyGOn8cty/LMNcGJ6Ox/Qn7cvYU60a72fOJlPnq8mmKvwg6ENtXmNoTZr0c+SHPA99gnB3eUXq1BpmDxHE5kxXKXWT2W1b/6VRzPJoZjF1XNLcJHZUaz3k2ztAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAGinktxjxwCd3H8yqLgtyE6CactDWSNCxUqZoaQ8uugoCyIEG7gfBcdxftvqCIcPy5KOBVybd3kOBDCzPcV7z7e6PY1rC3nSCs2aLJ3eElg82Mql+5BQ47XkQeFy5K69RezYwFvIQjAyq1fnj4uhHnSg/kg1YwjT+G5SLcs5NGa1n6i+91IXpD7P6INZTagXz2o5LTyUPNPof0ss5L+YiIQBb3udveA8VW/Jpw6t0i7zZW8/g2xmMmRUfv9gV/BeptlwGYGJGdZusxXogWvTTSoJazEastIJIlzHWnCbU2RzYuotafouL4OVe88EzLdLeeMhB/+6BH/PCivalhifLZg='),('2a86ab0e-bd0d-482b-a467-8582b2d502e5','d993c4e2-9faa-4938-a4e7-bb8f4eeafec9','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('2ad2ba69-2a1e-4fc6-947a-31a935684d02','5c584003-01a3-44ff-bc19-eb0778080d3e','allowed-protocol-mapper-types','saml-role-list-mapper'),('2b2aa11c-9e73-4a4b-8d12-f5780142033f','5c584003-01a3-44ff-bc19-eb0778080d3e','allowed-protocol-mapper-types','oidc-full-name-mapper'),('2b2abae1-1420-4b22-877f-1573f55d24a5','354876ef-ab10-4a1f-b2a7-d63da1a36f70','client-uris-must-match','true'),('2d315226-1c55-4ffe-b66f-015c15b22b18','7e1bfaea-ea70-4702-9c3d-18f989345936','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('30d60b1d-9343-41ce-ad66-8444775e4b07','4fc57844-da41-4a5d-8fe7-c60822f1fbe5','privateKey','MIIEowIBAAKCAQEAuFcC6haiMql0m6hR2GjO94KcL08w3c/kXkDqeF5XAA5l+IQju2/KbwuhFgGHSC09vGuR+M0pHewpGewdjFdZ69bo2S6g4qlG7bMeX3SmhTmylnVvSbS9qFEMPOX5w5AWQbAax3ubNWMxlV4k9GAVDvn4tDLMdCmOZz1luFr1sXSMXp9m/GXhTKOIb4J8bEwSirDe/8ojdQWlFb4gm8AgE5ijAzqVjyzeLPn2dEKkKRGDCMIfR5OQrhpSsnmBVuBxeBQnXS3tL4iQ2BmukQ/cejc47s3xIwUKN+3MEgXfXD5zXqmX5meiKf95ZkIgbjtwpJvdKjxbstEgECYeGCFaAwIDAQABAoIBAGqRKscnZIdDPX1LNl2UYanm4OHctxRUPeJbRvFlIIiQylR8F6ghPXcq0upE4e9Q8DLAQTgDavS4dR5eSMq8KOjVafE8Kpg+YhnChhmK90VnkJ24sCh9C3OFvzxpexWac7Nv2lteUuDvQlfmgBiifyoUSrnp8BZre76lWOvV8dmu19i1g/VKAR2BrnXRBFTQ3BvJiCFcsgjSpBCEfRmM8zMwNyjUc8Qd4VGjMZPIMAq1Thh4PKXf9PgDGTdwmA8dySkg08lYkLWaVsUx3K267mxR6c/hNBXKrUOxcC3xcFeOFuuos3jHfqn7dF5nTb/3Ky79iJI871Tz8XyuFSBvjAkCgYEA/Xk7a64GpjYFM/T8IVEHuEfbNQBUmwo0T13ToKkK7FtKDJvhBRRR4n0098+GT7E7uHQspT02lAAYoneJuGPdcIvWFAwJ4u53KoVd0hZEDhVRxMYgHE5Y62I0pRwSL8X2jlIIVStw8GYmDl/JkE1JvrWTeMhZpSKAPJzfwX4Iv5cCgYEAui1gYelZbIMKqEuG8Vdh1WbfLaoLvl4tfJcKL4bacPGP/ExIwX9kRj03OdrMq16oDFclyKZgdFMxZAyEjkffhWSjO+6FXB0BgT73LKq+945A067fJMrXtYTN4Gb6TIs+bM+2QqVgHq8A2x311CtRColNYiW5pbuju3cdnmQFxnUCgYEA2/vRVDzuzGXp0hP2ljurBYZnevJUe1I53//AYZkUP9lixNqsSio+fuDHjaLwIE3jVMyOysH7kisbNjWkswEI+FqEa1WfZvIrPh4NNP3aBpb+JlcFG0vr5C2RHxLjvc6DkzUiwjg3hoxAzwzW9IP/UqJn4NWQ576vqOtFTrrBgPUCgYBT0shZbRnRDHMI8PBxyvkGfwmu4qfk7zwlo093tIy3W1uLqcD8NeIs6bTqvIN4COc6nyYo4Bf/Z9GODUDFWsDdq0D/Y9XxcjHSQkpBdyMCDK9NX6eiRh224XNcPKEnQ244yZBzE0hiqEKHZUbgXxxe1RDdRsT+RKxkZC4WuUwMXQKBgEvSwa+WcSlCSKzt4ytYG/D5fA/sqQPeQXrfTqQULJbUY6/bKxnXIRTLpT0OJTCl2loJxdB193DYEi0D4OTejoJJV0urfKIuhZT9wBzcV/Rq7ND0Skld7YGbTJV1LyJ7Rj+DTbCTuG/wrd9KlbZYQUUShDhvXTsRReu6qEz62/A/'),('32babd05-8f35-4b9c-9af1-106386be7304','bf9270af-0ce8-4260-88ec-09d8e407ef12','certificate','MIIClTCCAX0CBgF8aTLKZjANBgkqhkiG9w0BAQsFADAOMQwwCgYDVQQDDANpYXMwHhcNMjExMDEwMDc1MzI4WhcNMzExMDEwMDc1NTA4WjAOMQwwCgYDVQQDDANpYXMwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCOPjXN7tTy6i3K1Z/yBimMS+VbTJnVcdA1RVNMnWX5ZPLUrlqIVHasuKEfZ/OIQhwW58GR61wsiKh/PT6YVuCbANJOnJ3V5A0ID+EpgU1dQ4X7h9I/XLV4CHXS8lAfyiPvlu/CxXEy+4AVgIZcbme8WVfescQSaSeVNX1CddWWLl5O9ZEOxyVmTepwzpQrOrykBxUNWdTaKjUjJXqHrnAhoiLqE/leu6PbRh8+qsprbVscp/H2ftqxHtxDypS2gkOpLucMoV7X9rycNSy3wAfFoUw0QiIkozYg0cenTpqXiqiNYVMA2fxjHRCXqvGQA9hnd8LuV+TJh8HNzerbxi39AgMBAAEwDQYJKoZIhvcNAQELBQADggEBAIRhTVZiKLMm8PmQP+4svpPMna/n1EnzoEn0OnL0u8RHqmrh0PpKE1gkcutZJR+0Ceu/M6EK4nLrjua7GeM4thSMZ7nOj/lOO/bpzNtpjFiuVT2cpT9SNktTVo0QN8stSfXmuLPE1euCkEmlGBuZgat9mA/S7OhWUtBneYc4HyFYSD/D/57sOWAOrztGJWochlI6YprHMy8ts1nA+xvLgrio+doXOavS3MryIc6kzC53Y4xIo1bw9TJDwYa5onTVzzLbh7gIQc72c327gi+bspW6jL2eXyLWxkHhDYYT+eNLdD2vdfYUR9XWiWFwoaJvq1cUv80Wf3VG4EojnM3BnCA='),('3aa0b3cb-cf57-411f-aa26-7580253161fe','d993c4e2-9faa-4938-a4e7-bb8f4eeafec9','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('45182148-ee46-4c99-a8eb-328a76950a0d','45229e83-9e77-434f-bd74-7b8691a86b4b','max-clients','200'),('45ef7199-b077-4a8a-8d7b-24d97cf26321','a05f0de5-0a71-4072-950f-51b9a9271f4d','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('4b79fc45-1371-4a5d-ae51-c9d78e4fc96b','4c201bf3-e6ba-4e39-b0b0-07ac5fedf166','certificate','MIICmzCCAYMCBgF8PFdOVDANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjExMDAxMTQ1MDI3WhcNMzExMDAxMTQ1MjA3WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCbqAeCxbbKqcUYVPR9RPMqMQO7xy1T/+4o8HBnVPRLqxsI4Hg1L0sa6iythKNHKCJonJoyFxHs6Rr423Mf5tq8DNTqxKOSyE7xynDpO7aM7o+knkXVORipmRM2QvZs+13tEfPEagwbV2uY8B3SGhUgR7pxW4+9kixtogOZj7vi4mDeIw+lv6Fln5u2r+YW7JkvHjRCgGO5492DDKK9m4m6mTMHHPr62EkMcsdyNuFFhyUzxFt6/jgdFq7VKF2DGJjeLxZnEmM/tgfwEGlTPmZBFp1ZMmHQEoGEa/ZpgY3OavpnkLrT1gwdQJldSMo9hhRZMnckDENZhs/Uaw1Aw0UJAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAFByFy696GVIAfXmci18U8FT9BFFgWj6HHHYAbfYakuXN1+40752TiMwexSPZXK+aDp3sfmPx0SN9/Qaqj+D2YZkW+hIUIxvUU/NezJu3guTKQwlEyaeYZHIemp56cDU4TFDsntGvwAiBSwXLllLqhyMs0xKxhE4lHVaeCh0kCsQONh4tUvMF01q2UbsoH233V5lmd/6vCPUUAUx8pat0h9wXHL8k1N7GZKfOKSMS4Uw5ETFN5gvOlRfuK5E6qKOFSiszGUWTKd5uXX71fh+MSfZPFHncw36MSwfImpwztwVsZKqJNAWtSgJTAwb6CahFUTgmhYvA2Dic7qdLxOLvAI='),('4c0895cf-d998-4f6e-aca8-e59845cf3cad','54efa8dd-580f-435e-898f-0f7c8e8a3eac','priority','100'),('4f3d5059-932b-44bd-b57e-4b539384e764','4fc57844-da41-4a5d-8fe7-c60822f1fbe5','priority','100'),('567ed54d-d2c8-410e-a162-8445130d0c46','7e1bfaea-ea70-4702-9c3d-18f989345936','allowed-protocol-mapper-types','oidc-address-mapper'),('5cf4069b-da96-45fe-861b-0fc38c0e15ce','c57ec8f8-5689-4ad0-8f3a-d7e87effa25e','priority','100'),('615bc231-282a-48b6-bbb4-9ae45c4281a1','a762baff-ef26-4264-9cfb-fe82b10d7b25','priority','100'),('61f756df-3b43-4734-b73f-66142dd0e7b1','4c201bf3-e6ba-4e39-b0b0-07ac5fedf166','privateKey','MIIEogIBAAKCAQEAm6gHgsW2yqnFGFT0fUTzKjEDu8ctU//uKPBwZ1T0S6sbCOB4NS9LGuosrYSjRygiaJyaMhcR7Oka+NtzH+bavAzU6sSjkshO8cpw6Tu2jO6PpJ5F1TkYqZkTNkL2bPtd7RHzxGoMG1drmPAd0hoVIEe6cVuPvZIsbaIDmY+74uJg3iMPpb+hZZ+btq/mFuyZLx40QoBjuePdgwyivZuJupkzBxz6+thJDHLHcjbhRYclM8Rbev44HRau1ShdgxiY3i8WZxJjP7YH8BBpUz5mQRadWTJh0BKBhGv2aYGNzmr6Z5C609YMHUCZXUjKPYYUWTJ3JAxDWYbP1GsNQMNFCQIDAQABAoIBAFVmFtjUiLkf85ap5Ylk7tRTF+1KFcBkRdIIOGM45N8u/SIdpVXooJgfqmt4vewoRNiIMsEQjzEfo0CthbgW/CL4F0jGocfCRi26F8CelkU0DXMPstiM/s7twPCgRHr+XkXW95rnY8UMbWf3NSU0Uirnr47J4U7sh5uOq9LwXPDYzoNXcfij1ob8pYdkSAfG4cfBoriOEoDRLyl8VaW6PwvcIk5rjWbTJVKqq86oiTGa55jxPYEyxb5BUNX91ZJTcPa1g4RlaaR1MYdhcB3E3BBLo3EbAV1YdW/WmQeqpiQBMSLDpj0lmnT1V23hcrDJfehKjTDza4TQ4MZHA9107RECgYEA3SpOX5fEGH8q+XoPIyMhVCh414J7r+AvFbBf5P4Rme7SkElLf9o61IxixghEodkMXJsvmu67LOkslf1fRehGgKoU6zQFXDQ6yjf+cnmlz+zNetDy8Wd/maaCWz45CDjkMK1vcG9CPzg+EsfHzgQ8MKH3z/EolCCQhU9ExpABDl8CgYEAtCxQBaJYuY0X9WVeb/3pclFSnMjIyfVOBw5thf/nFjpd36PyJd9AU63ivAAdbGCTGKb8UFKBBaul3gJ8Qh+G23+5uN6+5Phomfza3EjUPPtKRqN8KvHx3T3xvrk55iq0oag2BC+UHdB6ToOOQKS9U0GbRc2kLCF+ClV6C/3KFZcCgYArDBT9HjkY24etz0gq+qd+DfKXX9pbPTNs8Ut48srSP13Un6+GTx+sRzbifLF/HxP84me9rEHaV/hJqWtl2/P9Dx3LOfDhJXlb6tInze2sLtc/1HO08QQxD+vHfrDzHL+tidRq+fzW+Ud7uE73lnNws9XcL4BKdJwslmU4kMbj2QKBgA/eRz33ynCtKIsIXoTmjATxfKEqXeTLog+lCahfnW6rvVDRE6aaPwQfsHR2XiEJcGsfaeF5IrvpHjaraV45gJscaLMLiyyHZE8Logr8rxSf3S7Tf0AZBwBBUGVH0v2ejUIfmoJL3nOxxNPdak3vNG18vbwsHGV2na8zUAh2VbIJAoGAL0g68VOT8oLAL3qJIc3uCL60B4BxLtwZ8upQFKFu2qv9FtXE4qzQYC8B9TsWCkOygydux6cXtBiHipxw6UC1g4PKdRgsbrKuW91UWxmtnZjbYRerAyCgBdJRSaZM/OsT6fKFZmoOI65Nu0FFTLVIfVWLGi9yWp8Iw+0qOmsVagI='),('6a81eadb-17eb-4dfa-b370-c1dc7bbc1b39','7e1bfaea-ea70-4702-9c3d-18f989345936','allowed-protocol-mapper-types','oidc-full-name-mapper'),('70891ca8-9cb3-4216-8eb2-4a2b5a481f19','a05f0de5-0a71-4072-950f-51b9a9271f4d','allowed-protocol-mapper-types','oidc-full-name-mapper'),('71b56c37-5ab6-47d7-b2d7-85acd79d1f02','ac818e64-cc4c-4085-9c1d-e58f6a1dc2b6','algorithm','HS256'),('739639b7-bb14-42d3-9c34-1b9931ad0321','b1dd975d-c51c-40be-9497-723cecc14946','algorithm','HS256'),('74e48fee-d0c3-42f7-9c68-94cb349e1502','3d86c0ee-4cfc-4c7d-bd34-dae4fc3c3180','allow-default-scopes','true'),('7b69a659-46b2-4102-85bc-299afd831c39','ac818e64-cc4c-4085-9c1d-e58f6a1dc2b6','secret','N3eo3p4JEHOsGyB6LTVxBl_YbxorJ1z8LJAQvfceKzwXb22aMvNc3DKv5-1xU25mhsdhdjnplbHw36YG22xtJQ'),('7db60d23-ab13-46fe-b81f-92ae2e949b69','a05f0de5-0a71-4072-950f-51b9a9271f4d','allowed-protocol-mapper-types','saml-role-list-mapper'),('8263e592-9a0f-4f92-9876-13addd8f5fff','d993c4e2-9faa-4938-a4e7-bb8f4eeafec9','allowed-protocol-mapper-types','oidc-full-name-mapper'),('854032a2-6f0d-4482-ac31-112611290e92','c57ec8f8-5689-4ad0-8f3a-d7e87effa25e','secret','PMCfqnjN8w6BPHPFBphLXg'),('8c4b2ace-812d-4a19-b47f-9e6b986a15e3','a05f0de5-0a71-4072-950f-51b9a9271f4d','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('8d44d44b-8406-47aa-a446-6ee53d36d7a1','5c584003-01a3-44ff-bc19-eb0778080d3e','allowed-protocol-mapper-types','saml-user-property-mapper'),('93bbe9ee-b6ce-421e-bdb7-8c399d521982','a05f0de5-0a71-4072-950f-51b9a9271f4d','allowed-protocol-mapper-types','oidc-address-mapper'),('94430751-821c-4e96-9c62-67100658f6cd','7e1bfaea-ea70-4702-9c3d-18f989345936','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('96519f0c-d118-41a7-9572-95938345b574','b1dd975d-c51c-40be-9497-723cecc14946','kid','3665dd47-bbb4-4a1d-8d98-2c329d3afc39'),('978f4808-3024-41c9-86cf-c61203436b51','5c584003-01a3-44ff-bc19-eb0778080d3e','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('99988304-3793-4949-ba78-cb4f69f1db3f','7e1bfaea-ea70-4702-9c3d-18f989345936','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('9b9801e2-07a2-45ef-8b0a-0018edaa0434','b1dd975d-c51c-40be-9497-723cecc14946','priority','100'),('9c472eb7-d52b-4a01-a3dc-51cfd385ab4f','d993c4e2-9faa-4938-a4e7-bb8f4eeafec9','allowed-protocol-mapper-types','saml-role-list-mapper'),('9f4ac572-c7b6-45b7-a043-4a7f13875e49','47db9f75-9f18-4a7c-82e9-5ec270dac527','max-clients','200'),('a09a6adf-2936-42e9-9f63-3fba7629f97c','a05f0de5-0a71-4072-950f-51b9a9271f4d','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('a4cb1cc9-60c8-4d7b-bcbf-512306cba6d8','bf9270af-0ce8-4260-88ec-09d8e407ef12','privateKey','MIIEpAIBAAKCAQEAjj41ze7U8uotytWf8gYpjEvlW0yZ1XHQNUVTTJ1l+WTy1K5aiFR2rLihH2fziEIcFufBketcLIiofz0+mFbgmwDSTpyd1eQNCA/hKYFNXUOF+4fSP1y1eAh10vJQH8oj75bvwsVxMvuAFYCGXG5nvFlX3rHEEmknlTV9QnXVli5eTvWRDsclZk3qcM6UKzq8pAcVDVnU2io1IyV6h65wIaIi6hP5Xruj20YfPqrKa21bHKfx9n7asR7cQ8qUtoJDqS7nDKFe1/a8nDUst8AHxaFMNEIiJKM2INHHp06al4qojWFTANn8Yx0Ql6rxkAPYZ3fC7lfkyYfBzc3q28Yt/QIDAQABAoIBACbeMO2YuW+3NdQbE52auXewtXeBMvf0JaSo0N46lEbVotUi33IpQlRoDv759L3i8rH/mhE5cvJoVUKPha8y7iTs0IrSmP59VmJBlJE21+EINnBI6NaPirbF+QwvUl2darxpThK2yPvZZWJ6wDw5nvcEotIjWSR+v2YyO4wRjs9+asxQjhaMG/+wK2mnrSkOMVQgLPl80RpwYwMgXtbDVvI2U3Q51njsvBG7eODPd8fl14SgomM8Y6OgR6hE1JlQhrg7qNV23hQACSkEhC2ME+FC3TFUNQ/XWzvD80532v1EuBnJTouooL5e2/mfnNYW2KXZfbiJFXV6VWVhRAYecDECgYEA26lusP7ptEyNzdnToFTUEo0xuSC37ALOQdvy09kw9rngglqUXlio7/lmhlRgNpCl9ogSU4G1hkPK6Q2PhxzBo+SV5G14gBJAV6j2l+Uq1tk9eOb5gwNYXawThcs1cLm+UdtYIhRu6jsoDnJ7OPTQPErhASb+DNvDOJ0JsPh8FH8CgYEApcYhHZoKWYt7OKO+pLA2mSFj9ACeyOM7R3SqauHsCcP4qzeJDx6AMLsN0c5wbEtYaaJc6MslwCf35g1leBkxcSeLVCVeOgyzhMj2sALlrof/b/m41YI1W9BNR9RGxfRyM5uLKLuY7KjZWzoBmRM6t+RKxPOu9Ss9jBxfOWHLz4MCgYEAh+613ToijbzCFB00ZQeZpVFS7+lbZ+XklcTy5D6Hmmc0k/ZR0oCzKq3/0Cju0VV6HrHeBWdDWi8hpk8J/ubAvhd62r0T0M16m8SntR/P/ty4udTVm0m6qV0PR8CU9Yk8SZOfWpeie7jX9PjLYFe/dVAxJXFnzbVBfgtQL//VaSkCgYEAm9kqFvdT1Z1xKe2fdJsJqWsf2iyfGwOuHl6LPNLLIt8vsGAUpbcqEyY4NtAbF2S6aQ0wxdb+1al9wLVFeOROfDAOJ/y9mluIhkSczxraLfxDZFVktK2mVnv9u5LROpe2qdgIuzGq8otHVSGykOPoJywkMwdZq7qMMWYXDA5qGtsCgYB1N94Ji47lHT3b9U+bFuzXCVoKyzHicvoy4xHrpKB0FRZ89VdG3VK+38H/Ad0wnnsCho3Hv/a48GD5Sc+CapZKc7oe6x5u1pWDRPks+j/o8T0G6qJskU0s7n3ATQy01lnc0P/agouasLVZl43Vmhu2ZEUgr+5wXKDlz4oTfvnFEA=='),('aa1f4dc4-7ebe-4b81-8021-77e9146f8cf8','4fc57844-da41-4a5d-8fe7-c60822f1fbe5','certificate','MIIClTCCAX0CBgF8aTLMNTANBgkqhkiG9w0BAQsFADAOMQwwCgYDVQQDDANpYXMwHhcNMjExMDEwMDc1MzI5WhcNMzExMDEwMDc1NTA5WjAOMQwwCgYDVQQDDANpYXMwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC4VwLqFqIyqXSbqFHYaM73gpwvTzDdz+ReQOp4XlcADmX4hCO7b8pvC6EWAYdILT28a5H4zSkd7CkZ7B2MV1nr1ujZLqDiqUbtsx5fdKaFObKWdW9JtL2oUQw85fnDkBZBsBrHe5s1YzGVXiT0YBUO+fi0Msx0KY5nPWW4WvWxdIxen2b8ZeFMo4hvgnxsTBKKsN7/yiN1BaUVviCbwCATmKMDOpWPLN4s+fZ0QqQpEYMIwh9Hk5CuGlKyeYFW4HF4FCddLe0viJDYGa6RD9x6NzjuzfEjBQo37cwSBd9cPnNeqZfmZ6Ip/3lmQiBuO3Ckm90qPFuy0SAQJh4YIVoDAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAAKze1/+pWtZlYEGJ9xArGJln33AzR+Zpsf3rFpd7YCng/zHlTjOcSrks4cTaZDW5zv+7j7EM1hlBujPYKQlZO2JfF9P7iOPZQrilXy/sXg0dUkafDShLzWspfpj3lw5dICx4QTPxBoGceqQzzRWMOHV7P8JXBhsjeKsJHIDM/6uJlH9hKKxfsKEPVlLDGnCEg+w9R9Nwf51DAOQn8vdGnDl2l1drK2y9hObg1Tp+IHgxI3a5mrgyCU/D6Xm/+F5lBcFzDvHfwp87GjV8amLlxvpwyWrgGQnoRASlEWwb3bqLx5IReEvVTlY9dcGyMGA0IuVqYVG/0D+IJNU/hNJxjw='),('ae8277ea-15dc-42af-813b-609ea0284f6f','84bc79cd-9e95-4266-93b3-bbc28a26b257','client-uris-must-match','true'),('b5cb648e-2b0f-4ebe-922e-e59b1a1b0020','ac818e64-cc4c-4085-9c1d-e58f6a1dc2b6','priority','100'),('b868c65f-6eeb-43ed-9334-03dc0041d506','7e1bfaea-ea70-4702-9c3d-18f989345936','allowed-protocol-mapper-types','saml-user-property-mapper'),('b9df5e89-6c35-4379-a104-4ccccfe1c315','a762baff-ef26-4264-9cfb-fe82b10d7b25','keyUse','enc'),('bafb222e-117b-457b-914d-4755ecc049a2','c57ec8f8-5689-4ad0-8f3a-d7e87effa25e','kid','fc663a74-96b0-4bbb-88e5-c02037f162e7'),('bb03e77c-2db9-422c-9bce-4924dc4eb8b0','cbd7fe66-b8d1-4da1-9cfe-4f10bbb06488','allow-default-scopes','true'),('c45d7c1f-8fba-4ab7-944f-4b9d8715c0cc','54efa8dd-580f-435e-898f-0f7c8e8a3eac','kid','104437b9-84f6-4a4d-939d-e32544525bb6'),('c751d969-554a-4c05-9989-53a69065e66c','ac818e64-cc4c-4085-9c1d-e58f6a1dc2b6','kid','4b5eddd2-d004-40ee-8f30-0856072f128e'),('ca4d3216-d70d-47e6-9d73-e499ad37707b','339492a8-b723-41c0-ad34-2bbd837be40a','allow-default-scopes','true'),('cba7d50f-4b6b-423c-af9d-353f5dd28b31','d993c4e2-9faa-4938-a4e7-bb8f4eeafec9','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('d56ebbef-4dd3-4b49-bac8-d7ed006e42a9','4c201bf3-e6ba-4e39-b0b0-07ac5fedf166','keyUse','sig'),('d8fab878-3c0d-43e4-a653-86510bfeba8a','a05f0de5-0a71-4072-950f-51b9a9271f4d','allowed-protocol-mapper-types','saml-user-property-mapper'),('e0abb310-f770-4683-9e23-75456f740871','d993c4e2-9faa-4938-a4e7-bb8f4eeafec9','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('e6bc3a5d-8fc0-4dc1-b98c-f7685f3c1747','5c584003-01a3-44ff-bc19-eb0778080d3e','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('e868f812-dbbb-42f2-84c9-6e1a4fe27a22','a05f0de5-0a71-4072-950f-51b9a9271f4d','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('e99a7e65-6d97-4512-9376-bddc74a71c7c','5c584003-01a3-44ff-bc19-eb0778080d3e','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('ec2a0bae-ded1-4f9f-b51d-d9497ac09b4a','7e1bfaea-ea70-4702-9c3d-18f989345936','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('ef26e025-6783-4969-9e0f-47cc7d862b26','5c584003-01a3-44ff-bc19-eb0778080d3e','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('f1b8e508-21d6-413f-bc61-41f770daec4a','74632b50-a3a7-4cd3-9bd3-66d6355228bf','allow-default-scopes','true'),('f3fd0f21-d3e6-4214-befb-e45e9ba6590c','4fc57844-da41-4a5d-8fe7-c60822f1fbe5','keyUse','enc'),('f4aac927-51de-40d2-9697-d45c675a0b75','d993c4e2-9faa-4938-a4e7-bb8f4eeafec9','allowed-protocol-mapper-types','saml-user-property-mapper'),('f6e4a574-902a-46b2-9fb2-f2fb16c83310','bf9270af-0ce8-4260-88ec-09d8e407ef12','priority','100'),('fc577027-98d1-448f-af59-4988b7975bfd','84bc79cd-9e95-4266-93b3-bbc28a26b257','host-sending-registration-request-must-match','true');
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
INSERT INTO `COMPOSITE_ROLE` VALUES ('110a3016-4bbc-4a10-bd66-404a225779c9','db9c235f-6968-4152-9736-9e6e61016016'),('24bbf88e-9391-4d53-add5-b17fc3d47d80','027addf4-578e-4ece-bfce-acd0c2450e82'),('24bbf88e-9391-4d53-add5-b17fc3d47d80','0841c1ca-4eab-4061-9e5a-a7ef64f336c5'),('24bbf88e-9391-4d53-add5-b17fc3d47d80','17867fe0-44fd-4ca9-9440-8b335b05d172'),('24bbf88e-9391-4d53-add5-b17fc3d47d80','191866b9-d6aa-4eb8-ac17-1a5806f3f29a'),('24bbf88e-9391-4d53-add5-b17fc3d47d80','1b22363f-46d8-4ce1-95ce-fb88e0b349a7'),('24bbf88e-9391-4d53-add5-b17fc3d47d80','1ba02f2b-695b-4c89-95e6-df6c5c4e150f'),('24bbf88e-9391-4d53-add5-b17fc3d47d80','2e771d5b-f85d-43c0-b08b-dd1a0c91f7cc'),('24bbf88e-9391-4d53-add5-b17fc3d47d80','30af4cbf-a59b-4687-9cd2-7815bb57cd2f'),('24bbf88e-9391-4d53-add5-b17fc3d47d80','417cfd61-9557-49a1-b949-dace5e44e764'),('24bbf88e-9391-4d53-add5-b17fc3d47d80','4346ac02-2d43-4100-8301-6b65b70869f4'),('24bbf88e-9391-4d53-add5-b17fc3d47d80','483ef9b6-6fcc-4016-8434-bedaa26155da'),('24bbf88e-9391-4d53-add5-b17fc3d47d80','4e6fb82e-66db-4433-9f8c-70725dc181ce'),('24bbf88e-9391-4d53-add5-b17fc3d47d80','519add8a-12d2-42c2-aa8b-4fbaeed102d6'),('24bbf88e-9391-4d53-add5-b17fc3d47d80','52350c1e-1951-48fd-be4d-525d98dc6d86'),('24bbf88e-9391-4d53-add5-b17fc3d47d80','57e3ce04-53bb-4a17-8d70-259134311a86'),('24bbf88e-9391-4d53-add5-b17fc3d47d80','6359458b-4a53-4b89-8b1e-46f699c7827b'),('24bbf88e-9391-4d53-add5-b17fc3d47d80','64003d82-cdba-4e87-8cd2-9715f87edcd3'),('24bbf88e-9391-4d53-add5-b17fc3d47d80','6a470b4a-90dd-47ed-a443-260e655d108b'),('24bbf88e-9391-4d53-add5-b17fc3d47d80','712bab89-874e-4729-a2a8-25c5f8b996fd'),('24bbf88e-9391-4d53-add5-b17fc3d47d80','744fc607-416e-4de9-bc1a-23fb8c92f205'),('24bbf88e-9391-4d53-add5-b17fc3d47d80','7541938c-d158-4129-8fad-f54f98515164'),('24bbf88e-9391-4d53-add5-b17fc3d47d80','7b793447-6b10-46da-b9be-9041198dd4ba'),('24bbf88e-9391-4d53-add5-b17fc3d47d80','7e69a3f0-95c9-4ac1-b0e1-aca5fd36c7e5'),('24bbf88e-9391-4d53-add5-b17fc3d47d80','9420e41f-6814-4170-9dfa-07cd49b37b7f'),('24bbf88e-9391-4d53-add5-b17fc3d47d80','9ca6adaf-20fe-43f1-83ae-d4891056f23a'),('24bbf88e-9391-4d53-add5-b17fc3d47d80','b7a71a73-3e59-4e07-9926-7899f323eb61'),('24bbf88e-9391-4d53-add5-b17fc3d47d80','be410c71-4d2d-4971-ad3d-b32e00b4bcb1'),('24bbf88e-9391-4d53-add5-b17fc3d47d80','d3ba6cb8-3a21-42a3-bb0d-b1bec6e9aac9'),('24bbf88e-9391-4d53-add5-b17fc3d47d80','d7d1ca7c-1df3-4b66-844f-d9dbc5da85f2'),('24bbf88e-9391-4d53-add5-b17fc3d47d80','dea27025-fed7-46db-a09a-53e66ef575cf'),('24bbf88e-9391-4d53-add5-b17fc3d47d80','df7c2391-8769-4466-84e2-8bcac6dc3b47'),('24bbf88e-9391-4d53-add5-b17fc3d47d80','e032a411-ca8a-4a71-bbd0-b3f3e7ed291f'),('24bbf88e-9391-4d53-add5-b17fc3d47d80','e95a4525-52ba-4a21-b9fa-ca79b34d0472'),('24bbf88e-9391-4d53-add5-b17fc3d47d80','f033cfe7-0c2f-4417-989b-4bc36f752269'),('24bbf88e-9391-4d53-add5-b17fc3d47d80','fab05c86-65ab-48ca-95ce-1d7cae6a527a'),('24bbf88e-9391-4d53-add5-b17fc3d47d80','fd3c8507-9369-4b47-b21c-c5ab67f36f15'),('24bbf88e-9391-4d53-add5-b17fc3d47d80','fe7da1a9-34e7-4358-8d2e-8fc0fdb6636a'),('3fdade43-938b-4577-bad8-bdf822e4c9bf','b43b7320-395e-4431-ac88-b0e8a78579a9'),('483ef9b6-6fcc-4016-8434-bedaa26155da','2e771d5b-f85d-43c0-b08b-dd1a0c91f7cc'),('483ef9b6-6fcc-4016-8434-bedaa26155da','fab05c86-65ab-48ca-95ce-1d7cae6a527a'),('4e6fb82e-66db-4433-9f8c-70725dc181ce','e95a4525-52ba-4a21-b9fa-ca79b34d0472'),('64003d82-cdba-4e87-8cd2-9715f87edcd3','52350c1e-1951-48fd-be4d-525d98dc6d86'),('89df4bae-0bae-4edf-9bbb-d0edba7af71d','3b432587-bd6c-4809-8718-3889d1dcbf27'),('8a3e5e1d-7856-40a8-9701-fe34235ffc36','01c53c21-9c9b-4060-b5f3-bbf58e2d8236'),('8a3e5e1d-7856-40a8-9701-fe34235ffc36','09b4415d-07b5-4677-bd94-0059ba0f0283'),('8a3e5e1d-7856-40a8-9701-fe34235ffc36','25c3ba21-8f64-49b1-9017-9445c980ffa7'),('8a3e5e1d-7856-40a8-9701-fe34235ffc36','2f889b82-f335-4aa7-871e-bafa474e8fe6'),('8a3e5e1d-7856-40a8-9701-fe34235ffc36','3b432587-bd6c-4809-8718-3889d1dcbf27'),('8a3e5e1d-7856-40a8-9701-fe34235ffc36','523629c0-370f-4b2f-8fad-afade575f062'),('8a3e5e1d-7856-40a8-9701-fe34235ffc36','63876d56-0204-4692-8fe4-e4892e7e4387'),('8a3e5e1d-7856-40a8-9701-fe34235ffc36','6b15c315-fe44-4f3a-954e-92f6833b115c'),('8a3e5e1d-7856-40a8-9701-fe34235ffc36','6db8b427-e254-4d1d-854d-fcf35bb7afc5'),('8a3e5e1d-7856-40a8-9701-fe34235ffc36','89df4bae-0bae-4edf-9bbb-d0edba7af71d'),('8a3e5e1d-7856-40a8-9701-fe34235ffc36','9841983e-3a6a-4670-9f84-94ac0d4a128b'),('8a3e5e1d-7856-40a8-9701-fe34235ffc36','98d8bc19-7620-4d65-af07-e1c2feb7aadf'),('8a3e5e1d-7856-40a8-9701-fe34235ffc36','9b9a6c90-b4eb-48d5-af5f-5f045f359646'),('8a3e5e1d-7856-40a8-9701-fe34235ffc36','c940c962-bbc6-4160-905b-91d85aa957e3'),('8a3e5e1d-7856-40a8-9701-fe34235ffc36','cafbe776-bf03-40be-a585-39517b147fb3'),('8a3e5e1d-7856-40a8-9701-fe34235ffc36','cd5fc065-a6b1-499c-a709-6ab3d85396c1'),('8a3e5e1d-7856-40a8-9701-fe34235ffc36','e13fe897-dfa3-40d3-a200-7f484ee935b9'),('8a3e5e1d-7856-40a8-9701-fe34235ffc36','fcd8f906-b40d-47ac-9394-6c6f7fe27dd1'),('8efd33d3-868c-4936-8ac0-f5a1ebb04cfd','12e9d9be-5d5b-448a-a759-3c63fb810736'),('8efd33d3-868c-4936-8ac0-f5a1ebb04cfd','3fdade43-938b-4577-bad8-bdf822e4c9bf'),('8efd33d3-868c-4936-8ac0-f5a1ebb04cfd','79d7ffa5-9306-429e-8d63-5841e7f028c1'),('8efd33d3-868c-4936-8ac0-f5a1ebb04cfd','92f4d874-7670-4892-b2f9-89818e9d355f'),('9420e41f-6814-4170-9dfa-07cd49b37b7f','1b22363f-46d8-4ce1-95ce-fb88e0b349a7'),('9420e41f-6814-4170-9dfa-07cd49b37b7f','7b793447-6b10-46da-b9be-9041198dd4ba'),('b253da55-ea14-41c8-ba50-a99d05764cf9','110a3016-4bbc-4a10-bd66-404a225779c9'),('b253da55-ea14-41c8-ba50-a99d05764cf9','1423924a-2b6a-4077-9c5b-d7c89c88531b'),('b253da55-ea14-41c8-ba50-a99d05764cf9','888ecaf8-aadc-45da-8767-b10cc42c2481'),('b253da55-ea14-41c8-ba50-a99d05764cf9','94329c19-4388-45c8-8fd6-02dca5133269'),('c4130cac-7e6a-416c-ae22-821995608938','e5721d57-caac-4323-88f2-2c14c9585a73'),('c940c962-bbc6-4160-905b-91d85aa957e3','09b4415d-07b5-4677-bd94-0059ba0f0283'),('c940c962-bbc6-4160-905b-91d85aa957e3','9841983e-3a6a-4670-9f84-94ac0d4a128b'),('f77bd52c-1e47-44dd-ba1a-c1ee734dc2aa','926e2483-fd5f-4f08-a444-9a64576878f4');
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
INSERT INTO `CREDENTIAL` VALUES ('2f5e721e-796e-4275-a783-bc223b0721eb',NULL,'password','817f97a1-60fc-4da5-bf00-4f7265189a50',1634742634925,NULL,'{\"value\":\"RGzxqqOnkYmkl34nAy9vHD4xuK+5l1P1lSKXR4DJflJwKnRRn7nHAzZrRRCSoiSk9WQHiSUVqucWXSzQKJ3yow==\",\"salt\":\"yHVKmWs4y0thuLFOMVdx8w==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('57ab3752-9fdb-4efa-a7bb-cb8525360cb4',NULL,'password','b1bbec59-6bf4-49cc-a1d9-326445aac326',1634742647115,NULL,'{\"value\":\"zkNbIiQkb35zegWr9ZQsxyDO3GDGSwn/fXtpZQaP7KJjdOauReWd0yUZ+4Yy5Oq++LkBsw+9Z8jOoqBoyeArCw==\",\"salt\":\"o/fue34dDd9+ze7mZ0dSgQ==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('5e4ca2a8-facb-4dd4-8f92-3265c0554a45',NULL,'password','09a764d4-ed25-47e5-b1ab-d09d7c95dad2',1634742618556,NULL,'{\"value\":\"yp1Qqm17PU2mX9dVNUA+Z5Su9QNcmUs6lj8Z4ftIeQ9KlfShkH+k98JvZW5v+AgbMFdvSi5a0NffVb10zWld6g==\",\"salt\":\"IdeyUMm8z7I1fJ0qjVcAdQ==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('7f0e1944-ed69-4f74-8058-a3b57ddf83a7',NULL,'password','a30ac1c8-cb3e-4f07-8e2f-2581bc2ce4aa',1634742606150,NULL,'{\"value\":\"A1hpA0NyVtNPCrnOOjgEc9+SDqmj32IH7OmJU/Go4XRFdJVMt7AoBb2eHLZbCctp75rsQXhXbE4KmIj9pZpYSw==\",\"salt\":\"SVqHKL6ywp5zxjNsPZzQ2w==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('807e53f5-1396-4173-8b42-7e5faaf15eeb',NULL,'password','e647640b-4d1a-4ab6-8602-4570d857cc6e',1633099927695,NULL,'{\"value\":\"f1d8qeLVepcCajv6vfLW06b0HSG31n6tKFfVvhL5oA5tpBZ9yFW94HluEWiL2P227u2AbTaGxhtXMIjyogdi/g==\",\"salt\":\"fqautoQ6bHoThSdXZTjUGA==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('a7e705c2-ca0b-4771-bb67-04c6714dce19',NULL,'password','22b4bbce-437e-48f4-aa1d-b00ae3db4d2d',1634742593926,NULL,'{\"value\":\"qQ5bVILtHhVuy0AE5mDf6MCPuLfplqpBaJVAobKcA1SRRLfuuy8Eu44pmO6f3TfmZNDyXbHv/XCn953qqgEiEg==\",\"salt\":\"KA7c9okO0JcQ1Idks+ND2w==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('de281056-3042-4e74-aee0-ad8711674912',NULL,'password','c29078ef-504f-46bb-aebf-61f72e1d0c9b',1634732342426,NULL,'{\"value\":\"FD3GUHjpeg/TPOSBHQ7VlSiyBubtgYxTk8nyMEdrHxM8Qqxtig3md56sfQLSb0S90WQHIYyJIIjAZy5Jhu94cA==\",\"salt\":\"uQ1Pcqm6MZIrrT23iRCKPw==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10);
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
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2021-10-01 14:51:53',1,'EXECUTED','7:4e70412f24a3f382c82183742ec79317','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'3099908069'),('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2021-10-01 14:51:53',2,'MARK_RAN','7:cb16724583e9675711801c6875114f28','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'3099908069'),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2021-10-01 14:51:53',3,'EXECUTED','7:0310eb8ba07cec616460794d42ade0fa','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...','',NULL,'3.5.4',NULL,NULL,'3099908069'),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2021-10-01 14:51:53',4,'EXECUTED','7:5d25857e708c3233ef4439df1f93f012','renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'3099908069'),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2021-10-01 14:51:54',5,'EXECUTED','7:c7a54a1041d58eb3817a4a883b4d4e84','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'3099908069'),('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2021-10-01 14:51:54',6,'MARK_RAN','7:2e01012df20974c1c2a605ef8afe25b7','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'3099908069'),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2021-10-01 14:51:54',7,'EXECUTED','7:0f08df48468428e0f30ee59a8ec01a41','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'3099908069'),('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2021-10-01 14:51:54',8,'MARK_RAN','7:a77ea2ad226b345e7d689d366f185c8c','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'3099908069'),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2021-10-01 14:51:54',9,'EXECUTED','7:a3377a2059aefbf3b90ebb4c4cc8e2ab','update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'3099908069'),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2021-10-01 14:51:55',10,'EXECUTED','7:04c1dbedc2aa3e9756d1a1668e003451','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...','',NULL,'3.5.4',NULL,NULL,'3099908069'),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2021-10-01 14:51:55',11,'EXECUTED','7:36ef39ed560ad07062d956db861042ba','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'3099908069'),('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2021-10-01 14:51:55',12,'MARK_RAN','7:d909180b2530479a716d3f9c9eaea3d7','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'3099908069'),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2021-10-01 14:51:55',13,'EXECUTED','7:cf12b04b79bea5152f165eb41f3955f6','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'3099908069'),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2021-10-01 14:51:55',14,'EXECUTED','7:7e32c8f05c755e8675764e7d5f514509','addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...','',NULL,'3.5.4',NULL,NULL,'3099908069'),('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2021-10-01 14:51:55',15,'MARK_RAN','7:980ba23cc0ec39cab731ce903dd01291','delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'3099908069'),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2021-10-01 14:51:55',16,'MARK_RAN','7:2fa220758991285312eb84f3b4ff5336','dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...','',NULL,'3.5.4',NULL,NULL,'3099908069'),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2021-10-01 14:51:55',17,'EXECUTED','7:d41d8cd98f00b204e9800998ecf8427e','empty','',NULL,'3.5.4',NULL,NULL,'3099908069'),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2021-10-01 14:51:56',18,'EXECUTED','7:91ace540896df890cc00a0490ee52bbc','createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...','',NULL,'3.5.4',NULL,NULL,'3099908069'),('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2021-10-01 14:51:56',19,'EXECUTED','7:c31d1646dfa2618a9335c00e07f89f24','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'3099908069'),('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2021-10-01 14:51:56',20,'EXECUTED','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'3099908069'),('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2021-10-01 14:51:56',21,'MARK_RAN','7:f987971fe6b37d963bc95fee2b27f8df','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'3099908069'),('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2021-10-01 14:51:56',22,'MARK_RAN','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'3099908069'),('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2021-10-01 14:51:56',23,'EXECUTED','7:ed2dc7f799d19ac452cbcda56c929e47','update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...','',NULL,'3.5.4',NULL,NULL,'3099908069'),('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2021-10-01 14:51:56',24,'EXECUTED','7:80b5db88a5dda36ece5f235be8757615','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'3099908069'),('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2021-10-01 14:51:56',25,'MARK_RAN','7:1437310ed1305a9b93f8848f301726ce','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'3099908069'),('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2021-10-01 14:51:56',26,'EXECUTED','7:b82ffb34850fa0836be16deefc6a87c4','createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...','',NULL,'3.5.4',NULL,NULL,'3099908069'),('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2021-10-01 14:51:57',27,'EXECUTED','7:9cc98082921330d8d9266decdd4bd658','createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...','',NULL,'3.5.4',NULL,NULL,'3099908069'),('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2021-10-01 14:51:57',28,'EXECUTED','7:03d64aeed9cb52b969bd30a7ac0db57e','update tableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'3099908069'),('2.1.0-KEYCLOAK-5461','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2021-10-01 14:51:57',29,'EXECUTED','7:f1f9fd8710399d725b780f463c6b21cd','createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...','',NULL,'3.5.4',NULL,NULL,'3099908069'),('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2021-10-01 14:51:57',30,'EXECUTED','7:53188c3eb1107546e6f765835705b6c1','addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...','',NULL,'3.5.4',NULL,NULL,'3099908069'),('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2021-10-01 14:51:58',31,'EXECUTED','7:d6e6f3bc57a0c5586737d1351725d4d4','createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...','',NULL,'3.5.4',NULL,NULL,'3099908069'),('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2021-10-01 14:51:58',32,'EXECUTED','7:454d604fbd755d9df3fd9c6329043aa5','customChange','',NULL,'3.5.4',NULL,NULL,'3099908069'),('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2021-10-01 14:51:58',33,'EXECUTED','7:57e98a3077e29caf562f7dbf80c72600','customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'3099908069'),('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2021-10-01 14:51:58',34,'MARK_RAN','7:e4c7e8f2256210aee71ddc42f538b57a','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'3099908069'),('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2021-10-01 14:51:58',35,'EXECUTED','7:09a43c97e49bc626460480aa1379b522','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'3099908069'),('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2021-10-01 14:51:58',36,'EXECUTED','7:26bfc7c74fefa9126f2ce702fb775553','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'3099908069'),('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2021-10-01 14:51:58',37,'EXECUTED','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'3099908069'),('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2021-10-01 14:51:58',38,'EXECUTED','7:37fc1781855ac5388c494f1442b3f717','addColumn tableName=FED_USER_CONSENT','',NULL,'3.5.4',NULL,NULL,'3099908069'),('3.0.0','bburke@redhat.com','META-INF/jpa-changelog-3.0.0.xml','2021-10-01 14:51:58',39,'EXECUTED','7:13a27db0dae6049541136adad7261d27','addColumn tableName=IDENTITY_PROVIDER','',NULL,'3.5.4',NULL,NULL,'3099908069'),('3.2.0-fix','keycloak','META-INF/jpa-changelog-3.2.0.xml','2021-10-01 14:51:58',40,'MARK_RAN','7:550300617e3b59e8af3a6294df8248a3','addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'3099908069'),('3.2.0-fix-with-keycloak-5416','keycloak','META-INF/jpa-changelog-3.2.0.xml','2021-10-01 14:51:58',41,'MARK_RAN','7:e3a9482b8931481dc2772a5c07c44f17','dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'3099908069'),('3.2.0-fix-offline-sessions','hmlnarik','META-INF/jpa-changelog-3.2.0.xml','2021-10-01 14:51:58',42,'EXECUTED','7:72b07d85a2677cb257edb02b408f332d','customChange','',NULL,'3.5.4',NULL,NULL,'3099908069'),('3.2.0-fixed','keycloak','META-INF/jpa-changelog-3.2.0.xml','2021-10-01 14:51:59',43,'EXECUTED','7:a72a7858967bd414835d19e04d880312','addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...','',NULL,'3.5.4',NULL,NULL,'3099908069'),('3.3.0','keycloak','META-INF/jpa-changelog-3.3.0.xml','2021-10-01 14:51:59',44,'EXECUTED','7:94edff7cf9ce179e7e85f0cd78a3cf2c','addColumn tableName=USER_ENTITY','',NULL,'3.5.4',NULL,NULL,'3099908069'),('authz-3.4.0.CR1-resource-server-pk-change-part1','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2021-10-01 14:51:59',45,'EXECUTED','7:6a48ce645a3525488a90fbf76adf3bb3','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'3099908069'),('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2021-10-01 14:51:59',46,'EXECUTED','7:e64b5dcea7db06077c6e57d3b9e5ca14','customChange','',NULL,'3.5.4',NULL,NULL,'3099908069'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2021-10-01 14:51:59',47,'MARK_RAN','7:fd8cf02498f8b1e72496a20afc75178c','dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'3099908069'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2021-10-01 14:51:59',48,'EXECUTED','7:542794f25aa2b1fbabb7e577d6646319','addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...','',NULL,'3.5.4',NULL,NULL,'3099908069'),('authn-3.4.0.CR1-refresh-token-max-reuse','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2021-10-01 14:51:59',49,'EXECUTED','7:edad604c882df12f74941dac3cc6d650','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'3099908069'),('3.4.0','keycloak','META-INF/jpa-changelog-3.4.0.xml','2021-10-01 14:52:00',50,'EXECUTED','7:0f88b78b7b46480eb92690cbf5e44900','addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...','',NULL,'3.5.4',NULL,NULL,'3099908069'),('3.4.0-KEYCLOAK-5230','hmlnarik@redhat.com','META-INF/jpa-changelog-3.4.0.xml','2021-10-01 14:52:00',51,'EXECUTED','7:d560e43982611d936457c327f872dd59','createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...','',NULL,'3.5.4',NULL,NULL,'3099908069'),('3.4.1','psilva@redhat.com','META-INF/jpa-changelog-3.4.1.xml','2021-10-01 14:52:00',52,'EXECUTED','7:c155566c42b4d14ef07059ec3b3bbd8e','modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'3099908069'),('3.4.2','keycloak','META-INF/jpa-changelog-3.4.2.xml','2021-10-01 14:52:00',53,'EXECUTED','7:b40376581f12d70f3c89ba8ddf5b7dea','update tableName=REALM','',NULL,'3.5.4',NULL,NULL,'3099908069'),('3.4.2-KEYCLOAK-5172','mkanis@redhat.com','META-INF/jpa-changelog-3.4.2.xml','2021-10-01 14:52:00',54,'EXECUTED','7:a1132cc395f7b95b3646146c2e38f168','update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'3099908069'),('4.0.0-KEYCLOAK-6335','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2021-10-01 14:52:00',55,'EXECUTED','7:d8dc5d89c789105cfa7ca0e82cba60af','createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS','',NULL,'3.5.4',NULL,NULL,'3099908069'),('4.0.0-CLEANUP-UNUSED-TABLE','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2021-10-01 14:52:00',56,'EXECUTED','7:7822e0165097182e8f653c35517656a3','dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING','',NULL,'3.5.4',NULL,NULL,'3099908069'),('4.0.0-KEYCLOAK-6228','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2021-10-01 14:52:00',57,'EXECUTED','7:c6538c29b9c9a08f9e9ea2de5c2b6375','dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...','',NULL,'3.5.4',NULL,NULL,'3099908069'),('4.0.0-KEYCLOAK-5579-fixed','mposolda@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2021-10-01 14:52:01',58,'EXECUTED','7:6d4893e36de22369cf73bcb051ded875','dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...','',NULL,'3.5.4',NULL,NULL,'3099908069'),('authz-4.0.0.CR1','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.CR1.xml','2021-10-01 14:52:02',59,'EXECUTED','7:57960fc0b0f0dd0563ea6f8b2e4a1707','createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...','',NULL,'3.5.4',NULL,NULL,'3099908069'),('authz-4.0.0.Beta3','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.Beta3.xml','2021-10-01 14:52:02',60,'EXECUTED','7:2b4b8bff39944c7097977cc18dbceb3b','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'3099908069'),('authz-4.2.0.Final','mhajas@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2021-10-01 14:52:02',61,'EXECUTED','7:2aa42a964c59cd5b8ca9822340ba33a8','createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...','',NULL,'3.5.4',NULL,NULL,'3099908069'),('authz-4.2.0.Final-KEYCLOAK-9944','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2021-10-01 14:52:02',62,'EXECUTED','7:9ac9e58545479929ba23f4a3087a0346','addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS','',NULL,'3.5.4',NULL,NULL,'3099908069'),('4.2.0-KEYCLOAK-6313','wadahiro@gmail.com','META-INF/jpa-changelog-4.2.0.xml','2021-10-01 14:52:02',63,'EXECUTED','7:14d407c35bc4fe1976867756bcea0c36','addColumn tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'3099908069'),('4.3.0-KEYCLOAK-7984','wadahiro@gmail.com','META-INF/jpa-changelog-4.3.0.xml','2021-10-01 14:52:02',64,'EXECUTED','7:241a8030c748c8548e346adee548fa93','update tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'3099908069'),('4.6.0-KEYCLOAK-7950','psilva@redhat.com','META-INF/jpa-changelog-4.6.0.xml','2021-10-01 14:52:02',65,'EXECUTED','7:7d3182f65a34fcc61e8d23def037dc3f','update tableName=RESOURCE_SERVER_RESOURCE','',NULL,'3.5.4',NULL,NULL,'3099908069'),('4.6.0-KEYCLOAK-8377','keycloak','META-INF/jpa-changelog-4.6.0.xml','2021-10-01 14:52:02',66,'EXECUTED','7:b30039e00a0b9715d430d1b0636728fa','createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...','',NULL,'3.5.4',NULL,NULL,'3099908069'),('4.6.0-KEYCLOAK-8555','gideonray@gmail.com','META-INF/jpa-changelog-4.6.0.xml','2021-10-01 14:52:02',67,'EXECUTED','7:3797315ca61d531780f8e6f82f258159','createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT','',NULL,'3.5.4',NULL,NULL,'3099908069'),('4.7.0-KEYCLOAK-1267','sguilhen@redhat.com','META-INF/jpa-changelog-4.7.0.xml','2021-10-01 14:52:02',68,'EXECUTED','7:c7aa4c8d9573500c2d347c1941ff0301','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'3099908069'),('4.7.0-KEYCLOAK-7275','keycloak','META-INF/jpa-changelog-4.7.0.xml','2021-10-01 14:52:02',69,'EXECUTED','7:b207faee394fc074a442ecd42185a5dd','renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...','',NULL,'3.5.4',NULL,NULL,'3099908069'),('4.8.0-KEYCLOAK-8835','sguilhen@redhat.com','META-INF/jpa-changelog-4.8.0.xml','2021-10-01 14:52:02',70,'EXECUTED','7:ab9a9762faaba4ddfa35514b212c4922','addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'3099908069'),('authz-7.0.0-KEYCLOAK-10443','psilva@redhat.com','META-INF/jpa-changelog-authz-7.0.0.xml','2021-10-01 14:52:02',71,'EXECUTED','7:b9710f74515a6ccb51b72dc0d19df8c4','addColumn tableName=RESOURCE_SERVER','',NULL,'3.5.4',NULL,NULL,'3099908069'),('8.0.0-adding-credential-columns','keycloak','META-INF/jpa-changelog-8.0.0.xml','2021-10-01 14:52:02',72,'EXECUTED','7:ec9707ae4d4f0b7452fee20128083879','addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'3099908069'),('8.0.0-updating-credential-data-not-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2021-10-01 14:52:02',73,'EXECUTED','7:3979a0ae07ac465e920ca696532fc736','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'3099908069'),('8.0.0-updating-credential-data-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2021-10-01 14:52:02',74,'MARK_RAN','7:5abfde4c259119d143bd2fbf49ac2bca','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'3099908069'),('8.0.0-credential-cleanup-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2021-10-01 14:52:02',75,'EXECUTED','7:b48da8c11a3d83ddd6b7d0c8c2219345','dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...','',NULL,'3.5.4',NULL,NULL,'3099908069'),('8.0.0-resource-tag-support','keycloak','META-INF/jpa-changelog-8.0.0.xml','2021-10-01 14:52:02',76,'EXECUTED','7:a73379915c23bfad3e8f5c6d5c0aa4bd','addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL','',NULL,'3.5.4',NULL,NULL,'3099908069'),('9.0.0-always-display-client','keycloak','META-INF/jpa-changelog-9.0.0.xml','2021-10-01 14:52:03',77,'EXECUTED','7:39e0073779aba192646291aa2332493d','addColumn tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'3099908069'),('9.0.0-drop-constraints-for-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2021-10-01 14:52:03',78,'MARK_RAN','7:81f87368f00450799b4bf42ea0b3ec34','dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...','',NULL,'3.5.4',NULL,NULL,'3099908069'),('9.0.0-increase-column-size-federated-fk','keycloak','META-INF/jpa-changelog-9.0.0.xml','2021-10-01 14:52:03',79,'EXECUTED','7:20b37422abb9fb6571c618148f013a15','modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...','',NULL,'3.5.4',NULL,NULL,'3099908069'),('9.0.0-recreate-constraints-after-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2021-10-01 14:52:03',80,'MARK_RAN','7:1970bb6cfb5ee800736b95ad3fb3c78a','addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...','',NULL,'3.5.4',NULL,NULL,'3099908069'),('9.0.1-add-index-to-client.client_id','keycloak','META-INF/jpa-changelog-9.0.1.xml','2021-10-01 14:52:03',81,'EXECUTED','7:45d9b25fc3b455d522d8dcc10a0f4c80','createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'3099908069'),('9.0.1-KEYCLOAK-12579-drop-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2021-10-01 14:52:03',82,'MARK_RAN','7:890ae73712bc187a66c2813a724d037f','dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'3099908069'),('9.0.1-KEYCLOAK-12579-add-not-null-constraint','keycloak','META-INF/jpa-changelog-9.0.1.xml','2021-10-01 14:52:03',83,'EXECUTED','7:0a211980d27fafe3ff50d19a3a29b538','addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'3099908069'),('9.0.1-KEYCLOAK-12579-recreate-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2021-10-01 14:52:03',84,'MARK_RAN','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'3099908069'),('9.0.1-add-index-to-events','keycloak','META-INF/jpa-changelog-9.0.1.xml','2021-10-01 14:52:03',85,'EXECUTED','7:01c49302201bdf815b0a18d1f98a55dc','createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'3099908069'),('map-remove-ri','keycloak','META-INF/jpa-changelog-11.0.0.xml','2021-10-01 14:52:03',86,'EXECUTED','7:3dace6b144c11f53f1ad2c0361279b86','dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9','',NULL,'3.5.4',NULL,NULL,'3099908069'),('map-remove-ri','keycloak','META-INF/jpa-changelog-12.0.0.xml','2021-10-01 14:52:03',87,'EXECUTED','7:578d0b92077eaf2ab95ad0ec087aa903','dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...','',NULL,'3.5.4',NULL,NULL,'3099908069'),('12.1.0-add-realm-localization-table','keycloak','META-INF/jpa-changelog-12.0.0.xml','2021-10-01 14:52:03',88,'EXECUTED','7:c95abe90d962c57a09ecaee57972835d','createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS','',NULL,'3.5.4',NULL,NULL,'3099908069'),('default-roles','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-10-01 14:52:03',89,'EXECUTED','7:f1313bcc2994a5c4dc1062ed6d8282d3','addColumn tableName=REALM; customChange','',NULL,'3.5.4',NULL,NULL,'3099908069'),('default-roles-cleanup','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-10-01 14:52:03',90,'EXECUTED','7:90d763b52eaffebefbcbde55f269508b','dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES','',NULL,'3.5.4',NULL,NULL,'3099908069'),('13.0.0-KEYCLOAK-16844','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-10-01 14:52:03',91,'EXECUTED','7:d554f0cb92b764470dccfa5e0014a7dd','createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'3099908069'),('map-remove-ri-13.0.0','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-10-01 14:52:03',92,'EXECUTED','7:73193e3ab3c35cf0f37ccea3bf783764','dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...','',NULL,'3.5.4',NULL,NULL,'3099908069'),('13.0.0-KEYCLOAK-17992-drop-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-10-01 14:52:03',93,'MARK_RAN','7:90a1e74f92e9cbaa0c5eab80b8a037f3','dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT','',NULL,'3.5.4',NULL,NULL,'3099908069'),('13.0.0-increase-column-size-federated','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-10-01 14:52:03',94,'EXECUTED','7:5b9248f29cd047c200083cc6d8388b16','modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT','',NULL,'3.5.4',NULL,NULL,'3099908069'),('13.0.0-KEYCLOAK-17992-recreate-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-10-01 14:52:03',95,'MARK_RAN','7:64db59e44c374f13955489e8990d17a1','addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...','',NULL,'3.5.4',NULL,NULL,'3099908069'),('json-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-10-01 14:52:03',96,'EXECUTED','7:329a578cdb43262fff975f0a7f6cda60','addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE','',NULL,'3.5.4',NULL,NULL,'3099908069'),('14.0.0-KEYCLOAK-11019','keycloak','META-INF/jpa-changelog-14.0.0.xml','2021-10-01 14:52:03',97,'EXECUTED','7:fae0de241ac0fd0bbc2b380b85e4f567','createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'3099908069'),('14.0.0-KEYCLOAK-18286','keycloak','META-INF/jpa-changelog-14.0.0.xml','2021-10-01 14:52:03',98,'MARK_RAN','7:075d54e9180f49bb0c64ca4218936e81','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'3099908069'),('14.0.0-KEYCLOAK-18286-revert','keycloak','META-INF/jpa-changelog-14.0.0.xml','2021-10-01 14:52:03',99,'MARK_RAN','7:06499836520f4f6b3d05e35a59324910','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'3099908069'),('14.0.0-KEYCLOAK-18286-supported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2021-10-01 14:52:03',100,'EXECUTED','7:b558ad47ea0e4d3c3514225a49cc0d65','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'3099908069'),('14.0.0-KEYCLOAK-18286-unsupported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2021-10-01 14:52:03',101,'MARK_RAN','7:3d2b23076e59c6f70bae703aa01be35b','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'3099908069'),('KEYCLOAK-17267-add-index-to-user-attributes','keycloak','META-INF/jpa-changelog-14.0.0.xml','2021-10-01 14:52:03',102,'EXECUTED','7:1a7f28ff8d9e53aeb879d76ea3d9341a','createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE','',NULL,'3.5.4',NULL,NULL,'3099908069'),('KEYCLOAK-18146-add-saml-art-binding-identifier','keycloak','META-INF/jpa-changelog-14.0.0.xml','2021-10-01 14:52:03',103,'EXECUTED','7:2fd554456fed4a82c698c555c5b751b6','customChange','',NULL,'3.5.4',NULL,NULL,'3099908069'),('15.0.0-KEYCLOAK-18467','keycloak','META-INF/jpa-changelog-15.0.0.xml','2021-10-01 14:52:03',104,'EXECUTED','7:b06356d66c2790ecc2ae54ba0458397a','addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...','',NULL,'3.5.4',NULL,NULL,'3099908069');
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
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('ias','28a88a8b-766b-4f4b-8fec-078bb763db4a',_binary '\0'),('ias','39a7c67b-b33b-4f76-8342-92f2637d58d7',_binary '\0'),('ias','59192a1a-e36a-42b2-bf25-cd28adcd29e3',_binary ''),('ias','60c4906c-0891-4c67-98ef-dd1808de630f',_binary ''),('ias','6182ac67-b543-4025-848f-6a515620099f',_binary ''),('ias','83089d6a-98d8-443c-a264-3433f2a0e9d8',_binary '\0'),('ias','c11e6f95-2ce3-4d06-ac70-074171a216d9',_binary ''),('ias','ce99109a-e23f-4d3b-981a-04910c07f7c9',_binary '\0'),('ias','f66cf953-2950-456a-aedd-3f30e5c764ba',_binary ''),('master','00e914d0-5a5b-41fa-b340-bb569cae64b4',_binary ''),('master','1f84e575-9641-47da-851e-b2f36be3fd99',_binary '\0'),('master','21705b5e-1868-4124-a6e7-8f8e0ad2c06b',_binary '\0'),('master','4b9909c5-a42f-4918-977a-5838a054985e',_binary '\0'),('master','5db91e77-860f-4d85-ac52-c7c7b33bf983',_binary ''),('master','7ff9af48-41ae-495c-85c9-7192d55ba3c0',_binary ''),('master','9aa6c533-f30a-4185-9917-f8bf5382c0ce',_binary ''),('master','a73aa148-01a8-41dd-b7af-2f1b2233a9df',_binary '\0'),('master','aa7d9552-67cf-4af3-a062-6dd5b3cf7a4a',_binary '');
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
INSERT INTO `EVENT_ENTITY` VALUES ('2fd2e1d4-2ac9-419e-9a62-d5f0b3ebd9c4',NULL,'{\"redirect_uri\":\"https://keycloak/auth/admin/ias/console/#/realms/ias/authentication/flows/0e006cd9-bea8-4941-8189-41eb9b43d8a7/config/registration-recaptcha-action/a4ee2093-3770-4bdf-8853-c06df0f6df7d\"}',NULL,'172.28.0.1','ias','b243784d-f0a0-4fb8-accc-049f57ec31d7',1634747952386,'LOGOUT','c29078ef-504f-46bb-aebf-61f72e1d0c9b'),('38f48436-45e8-43cb-bb9f-62e6d0aac9be','security-admin-console','{\"auth_method\":\"openid-connect\",\"auth_type\":\"code\",\"register_method\":\"form\",\"last_name\":\"pablito\",\"redirect_uri\":\"https://keycloak/auth/admin/ias/console/#/realms/ias/authentication/password-policy\",\"first_name\":\"pablito\",\"code_id\":\"e4c1d925-2c29-44d7-8d5a-9392e3228a3f\",\"email\":\"pablito@gmail.com\",\"username\":\"pablito\"}',NULL,'172.28.0.1','ias',NULL,1634743107737,'REGISTER','c1f3b0ac-51bc-44c4-bb77-ca8caf753828'),('3c5e206d-2d1d-4dfb-8a56-59c63af8bf92','security-admin-console','{\"auth_method\":\"openid-connect\",\"redirect_uri\":\"https://keycloak/auth/admin/ias/console/#/realms/ias/authentication/password-policy\",\"consent\":\"no_consent_required\",\"code_id\":\"e4c1d925-2c29-44d7-8d5a-9392e3228a3f\",\"username\":\"admin\"}',NULL,'172.28.0.1','ias','e4c1d925-2c29-44d7-8d5a-9392e3228a3f',1634743143318,'LOGIN','c29078ef-504f-46bb-aebf-61f72e1d0c9b'),('3ff4be88-1a0f-4e2f-a4a7-a709d8e8a799','security-admin-console','{\"auth_method\":\"openid-connect\",\"auth_type\":\"code\",\"response_type\":\"code\",\"redirect_uri\":\"https://keycloak/auth/admin/ias/console/\",\"consent\":\"no_consent_required\",\"code_id\":\"b243784d-f0a0-4fb8-accc-049f57ec31d7\",\"response_mode\":\"fragment\",\"username\":\"admin\"}',NULL,'172.28.0.1','ias','b243784d-f0a0-4fb8-accc-049f57ec31d7',1634747920325,'LOGIN','c29078ef-504f-46bb-aebf-61f72e1d0c9b'),('54b70a1b-a992-4f78-a6d5-eae83196feae','security-admin-console','{\"auth_method\":\"openid-connect\",\"auth_type\":\"code\",\"redirect_uri\":\"https://keycloak/auth/admin/ias/console/#/realms/ias\",\"consent\":\"no_consent_required\",\"code_id\":\"47ea036a-1e9f-4adf-9594-035b9e3dda74\",\"username\":\"admin\"}',NULL,'172.28.0.1','ias','47ea036a-1e9f-4adf-9594-035b9e3dda74',1634744578651,'LOGIN','c29078ef-504f-46bb-aebf-61f72e1d0c9b'),('6ada7944-0ecb-4026-bab6-593f2530bc98',NULL,'{\"redirect_uri\":\"https://keycloak/auth/admin/ias/console/#/realms/ias/authentication/flows/0e006cd9-bea8-4941-8189-41eb9b43d8a7/config/registration-recaptcha-action/a4ee2093-3770-4bdf-8853-c06df0f6df7d\"}',NULL,'172.28.0.1','ias','eb0c1a67-4c0d-4a30-8639-556d4570e403',1634743231185,'LOGOUT','c29078ef-504f-46bb-aebf-61f72e1d0c9b'),('6d13f1ab-e077-49a2-96e7-38450c6819f1','security-admin-console','{\"auth_method\":\"openid-connect\",\"auth_type\":\"code\",\"redirect_uri\":\"https://keycloak/auth/admin/ias/console/#/create/authentication/ias/flows/0e006cd9-bea8-4941-8189-41eb9b43d8a7/execution/1af69409-4cd6-455d-bd5b-fad8b1818489/provider/registration-recaptcha-action\",\"consent\":\"no_consent_required\",\"code_id\":\"eb0c1a67-4c0d-4a30-8639-556d4570e403\",\"username\":\"admin\"}',NULL,'172.28.0.1','ias','eb0c1a67-4c0d-4a30-8639-556d4570e403',1634743216333,'LOGIN','c29078ef-504f-46bb-aebf-61f72e1d0c9b'),('70069467-44ff-4bbd-9c07-2fa4de7d1af2',NULL,'{\"redirect_uri\":\"https://keycloak/auth/admin/ias/console/#/realms/ias/authentication/password-policy\"}',NULL,'172.28.0.1','ias','b3596543-8783-4bfa-bca3-080211f7109d',1634743029660,'LOGOUT','c29078ef-504f-46bb-aebf-61f72e1d0c9b'),('78a68177-cda4-4b86-85c8-514b69418568','security-admin-console','{\"auth_method\":\"openid-connect\",\"auth_type\":\"code\",\"redirect_uri\":\"https://keycloak/auth/admin/ias/console/#/realms/ias/theme-settings\",\"consent\":\"no_consent_required\",\"code_id\":\"88785db5-1396-47e7-9332-a14438993b20\",\"username\":\"admin\"}',NULL,'172.28.0.1','ias','88785db5-1396-47e7-9332-a14438993b20',1634742337159,'LOGIN','c29078ef-504f-46bb-aebf-61f72e1d0c9b'),('85bbc7db-af98-49b1-a428-3261f574f590',NULL,'{\"redirect_uri\":\"https://keycloak/auth/admin/ias/console/#/realms/ias/theme-settings\"}',NULL,'172.28.0.1','ias','d8c91db9-63f1-438a-b59a-a6b305afb36f',1634742332084,'LOGOUT','c29078ef-504f-46bb-aebf-61f72e1d0c9b'),('9e3a7efc-e695-41fc-8434-aae22180f20b','security-admin-console','{\"auth_method\":\"openid-connect\",\"auth_type\":\"code\",\"redirect_uri\":\"https://keycloak/auth/admin/ias/console/#/realms/ias\",\"consent\":\"no_consent_required\",\"code_id\":\"b243784d-f0a0-4fb8-accc-049f57ec31d7\",\"username\":\"admin\"}',NULL,'172.28.0.1','ias','b243784d-f0a0-4fb8-accc-049f57ec31d7',1634747605762,'LOGIN','c29078ef-504f-46bb-aebf-61f72e1d0c9b'),('a71c5e24-971a-4e66-a024-5420eaf3125a','security-admin-console','{\"auth_method\":\"openid-connect\",\"auth_type\":\"code\",\"redirect_uri\":\"https://keycloak/auth/admin/ias/console/#/realms/ias/theme-settings\",\"consent\":\"no_consent_required\",\"code_id\":\"b3596543-8783-4bfa-bca3-080211f7109d\",\"username\":\"admin\"}',NULL,'172.28.0.1','ias','b3596543-8783-4bfa-bca3-080211f7109d',1634742369890,'LOGIN','c29078ef-504f-46bb-aebf-61f72e1d0c9b'),('a7bdd809-f06c-4ccd-981d-f6f645c8f563',NULL,'{\"redirect_uri\":\"https://keycloak/auth/admin/ias/console/#/create/authentication/ias/flows/0e006cd9-bea8-4941-8189-41eb9b43d8a7/execution/1af69409-4cd6-455d-bd5b-fad8b1818489/provider/registration-recaptcha-action\"}',NULL,'172.28.0.1','ias','e4c1d925-2c29-44d7-8d5a-9392e3228a3f',1634743185911,'LOGOUT','c29078ef-504f-46bb-aebf-61f72e1d0c9b'),('bf42d842-2308-456e-9868-03361cf6baf2',NULL,'{\"redirect_uri\":\"https://keycloak/auth/admin/ias/console/#/realms/ias\"}',NULL,'172.28.0.1','ias','47ea036a-1e9f-4adf-9594-035b9e3dda74',1634744583453,'LOGOUT','c29078ef-504f-46bb-aebf-61f72e1d0c9b'),('c10c2378-50da-4b22-a9ee-7b6341c8bb34',NULL,'{\"redirect_uri\":\"https://keycloak/auth/admin/ias/console/#/realms/ias/theme-settings\"}',NULL,'172.28.0.1','ias','88785db5-1396-47e7-9332-a14438993b20',1634742344794,'LOGOUT','c29078ef-504f-46bb-aebf-61f72e1d0c9b'),('c8e2cb5a-007c-4b4b-b9cb-d5e5696228dd','security-admin-console','{\"auth_method\":\"openid-connect\",\"auth_type\":\"code\",\"redirect_uri\":\"https://keycloak/auth/admin/ias/console/\",\"consent\":\"no_consent_required\",\"code_id\":\"d8c91db9-63f1-438a-b59a-a6b305afb36f\",\"username\":\"admin\"}',NULL,'172.28.0.1','ias','d8c91db9-63f1-438a-b59a-a6b305afb36f',1634742147974,'LOGIN','c29078ef-504f-46bb-aebf-61f72e1d0c9b');
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
INSERT INTO `KEYCLOAK_ROLE` VALUES ('01c53c21-9c9b-4060-b5f3-bbf58e2d8236','7df64a72-159e-42ab-9566-bada3b93a0b7',_binary '','${role_view-authorization}','view-authorization','ias','7df64a72-159e-42ab-9566-bada3b93a0b7',NULL),('027addf4-578e-4ece-bfce-acd0c2450e82','d51526d9-f3c6-48c5-807f-98a41d72dbe2',_binary '','${role_manage-clients}','manage-clients','master','d51526d9-f3c6-48c5-807f-98a41d72dbe2',NULL),('0841c1ca-4eab-4061-9e5a-a7ef64f336c5','bb57334f-1281-418d-9b72-242980a349f0',_binary '','${role_create-client}','create-client','master','bb57334f-1281-418d-9b72-242980a349f0',NULL),('09b4415d-07b5-4677-bd94-0059ba0f0283','7df64a72-159e-42ab-9566-bada3b93a0b7',_binary '','${role_query-groups}','query-groups','ias','7df64a72-159e-42ab-9566-bada3b93a0b7',NULL),('110a3016-4bbc-4a10-bd66-404a225779c9','67d49066-d651-410f-9920-8752a4441887',_binary '','${role_manage-account}','manage-account','master','67d49066-d651-410f-9920-8752a4441887',NULL),('12e9d9be-5d5b-448a-a759-3c63fb810736','c25c16d2-e62e-4c3d-96ed-8857138a01c4',_binary '','${role_view-profile}','view-profile','ias','c25c16d2-e62e-4c3d-96ed-8857138a01c4',NULL),('1423924a-2b6a-4077-9c5b-d7c89c88531b','master',_binary '\0','${role_uma_authorization}','uma_authorization','master',NULL,NULL),('14ce901f-9f52-4473-93a9-08989218fff1','67d49066-d651-410f-9920-8752a4441887',_binary '','${role_delete-account}','delete-account','master','67d49066-d651-410f-9920-8752a4441887',NULL),('17867fe0-44fd-4ca9-9440-8b335b05d172','bb57334f-1281-418d-9b72-242980a349f0',_binary '','${role_view-authorization}','view-authorization','master','bb57334f-1281-418d-9b72-242980a349f0',NULL),('191866b9-d6aa-4eb8-ac17-1a5806f3f29a','d51526d9-f3c6-48c5-807f-98a41d72dbe2',_binary '','${role_query-realms}','query-realms','master','d51526d9-f3c6-48c5-807f-98a41d72dbe2',NULL),('1b22363f-46d8-4ce1-95ce-fb88e0b349a7','bb57334f-1281-418d-9b72-242980a349f0',_binary '','${role_query-users}','query-users','master','bb57334f-1281-418d-9b72-242980a349f0',NULL),('1ba02f2b-695b-4c89-95e6-df6c5c4e150f','bb57334f-1281-418d-9b72-242980a349f0',_binary '','${role_manage-events}','manage-events','master','bb57334f-1281-418d-9b72-242980a349f0',NULL),('24bbf88e-9391-4d53-add5-b17fc3d47d80','master',_binary '\0','${role_admin}','admin','master',NULL,NULL),('25c3ba21-8f64-49b1-9017-9445c980ffa7','7df64a72-159e-42ab-9566-bada3b93a0b7',_binary '','${role_manage-realm}','manage-realm','ias','7df64a72-159e-42ab-9566-bada3b93a0b7',NULL),('2dd9196b-b1b9-47cd-bbf0-fd8d39de92da','c25c16d2-e62e-4c3d-96ed-8857138a01c4',_binary '','${role_view-applications}','view-applications','ias','c25c16d2-e62e-4c3d-96ed-8857138a01c4',NULL),('2e771d5b-f85d-43c0-b08b-dd1a0c91f7cc','d51526d9-f3c6-48c5-807f-98a41d72dbe2',_binary '','${role_query-groups}','query-groups','master','d51526d9-f3c6-48c5-807f-98a41d72dbe2',NULL),('2f889b82-f335-4aa7-871e-bafa474e8fe6','7df64a72-159e-42ab-9566-bada3b93a0b7',_binary '','${role_view-identity-providers}','view-identity-providers','ias','7df64a72-159e-42ab-9566-bada3b93a0b7',NULL),('30af4cbf-a59b-4687-9cd2-7815bb57cd2f','bb57334f-1281-418d-9b72-242980a349f0',_binary '','${role_impersonation}','impersonation','master','bb57334f-1281-418d-9b72-242980a349f0',NULL),('3b432587-bd6c-4809-8718-3889d1dcbf27','7df64a72-159e-42ab-9566-bada3b93a0b7',_binary '','${role_query-clients}','query-clients','ias','7df64a72-159e-42ab-9566-bada3b93a0b7',NULL),('3fdade43-938b-4577-bad8-bdf822e4c9bf','c25c16d2-e62e-4c3d-96ed-8857138a01c4',_binary '','${role_manage-account}','manage-account','ias','c25c16d2-e62e-4c3d-96ed-8857138a01c4',NULL),('417cfd61-9557-49a1-b949-dace5e44e764','d51526d9-f3c6-48c5-807f-98a41d72dbe2',_binary '','${role_view-identity-providers}','view-identity-providers','master','d51526d9-f3c6-48c5-807f-98a41d72dbe2',NULL),('4346ac02-2d43-4100-8301-6b65b70869f4','bb57334f-1281-418d-9b72-242980a349f0',_binary '','${role_manage-identity-providers}','manage-identity-providers','master','bb57334f-1281-418d-9b72-242980a349f0',NULL),('483ef9b6-6fcc-4016-8434-bedaa26155da','d51526d9-f3c6-48c5-807f-98a41d72dbe2',_binary '','${role_view-users}','view-users','master','d51526d9-f3c6-48c5-807f-98a41d72dbe2',NULL),('4e6fb82e-66db-4433-9f8c-70725dc181ce','bb57334f-1281-418d-9b72-242980a349f0',_binary '','${role_view-clients}','view-clients','master','bb57334f-1281-418d-9b72-242980a349f0',NULL),('519add8a-12d2-42c2-aa8b-4fbaeed102d6','bb57334f-1281-418d-9b72-242980a349f0',_binary '','${role_manage-realm}','manage-realm','master','bb57334f-1281-418d-9b72-242980a349f0',NULL),('52350c1e-1951-48fd-be4d-525d98dc6d86','d51526d9-f3c6-48c5-807f-98a41d72dbe2',_binary '','${role_query-clients}','query-clients','master','d51526d9-f3c6-48c5-807f-98a41d72dbe2',NULL),('523629c0-370f-4b2f-8fad-afade575f062','7df64a72-159e-42ab-9566-bada3b93a0b7',_binary '','${role_manage-identity-providers}','manage-identity-providers','ias','7df64a72-159e-42ab-9566-bada3b93a0b7',NULL),('57e3ce04-53bb-4a17-8d70-259134311a86','d51526d9-f3c6-48c5-807f-98a41d72dbe2',_binary '','${role_view-authorization}','view-authorization','master','d51526d9-f3c6-48c5-807f-98a41d72dbe2',NULL),('6359458b-4a53-4b89-8b1e-46f699c7827b','d51526d9-f3c6-48c5-807f-98a41d72dbe2',_binary '','${role_view-events}','view-events','master','d51526d9-f3c6-48c5-807f-98a41d72dbe2',NULL),('63876d56-0204-4692-8fe4-e4892e7e4387','7df64a72-159e-42ab-9566-bada3b93a0b7',_binary '','${role_create-client}','create-client','ias','7df64a72-159e-42ab-9566-bada3b93a0b7',NULL),('64003d82-cdba-4e87-8cd2-9715f87edcd3','d51526d9-f3c6-48c5-807f-98a41d72dbe2',_binary '','${role_view-clients}','view-clients','master','d51526d9-f3c6-48c5-807f-98a41d72dbe2',NULL),('6a470b4a-90dd-47ed-a443-260e655d108b','bb57334f-1281-418d-9b72-242980a349f0',_binary '','${role_query-realms}','query-realms','master','bb57334f-1281-418d-9b72-242980a349f0',NULL),('6b15c315-fe44-4f3a-954e-92f6833b115c','7df64a72-159e-42ab-9566-bada3b93a0b7',_binary '','${role_manage-users}','manage-users','ias','7df64a72-159e-42ab-9566-bada3b93a0b7',NULL),('6db8b427-e254-4d1d-854d-fcf35bb7afc5','7df64a72-159e-42ab-9566-bada3b93a0b7',_binary '','${role_manage-events}','manage-events','ias','7df64a72-159e-42ab-9566-bada3b93a0b7',NULL),('712bab89-874e-4729-a2a8-25c5f8b996fd','d51526d9-f3c6-48c5-807f-98a41d72dbe2',_binary '','${role_manage-authorization}','manage-authorization','master','d51526d9-f3c6-48c5-807f-98a41d72dbe2',NULL),('744fc607-416e-4de9-bc1a-23fb8c92f205','d51526d9-f3c6-48c5-807f-98a41d72dbe2',_binary '','${role_view-realm}','view-realm','master','d51526d9-f3c6-48c5-807f-98a41d72dbe2',NULL),('7541938c-d158-4129-8fad-f54f98515164','d51526d9-f3c6-48c5-807f-98a41d72dbe2',_binary '','${role_impersonation}','impersonation','master','d51526d9-f3c6-48c5-807f-98a41d72dbe2',NULL),('79d7ffa5-9306-429e-8d63-5841e7f028c1','ias',_binary '\0','${role_uma_authorization}','uma_authorization','ias',NULL,NULL),('7b793447-6b10-46da-b9be-9041198dd4ba','bb57334f-1281-418d-9b72-242980a349f0',_binary '','${role_query-groups}','query-groups','master','bb57334f-1281-418d-9b72-242980a349f0',NULL),('7e69a3f0-95c9-4ac1-b0e1-aca5fd36c7e5','d51526d9-f3c6-48c5-807f-98a41d72dbe2',_binary '','${role_manage-identity-providers}','manage-identity-providers','master','d51526d9-f3c6-48c5-807f-98a41d72dbe2',NULL),('83d67fd4-18e5-40a8-8d16-9cbf4d03fe92','848e6b3a-035c-41a4-90a8-7dd05717c6fb',_binary '','${role_read-token}','read-token','master','848e6b3a-035c-41a4-90a8-7dd05717c6fb',NULL),('888ecaf8-aadc-45da-8767-b10cc42c2481','master',_binary '\0','${role_offline-access}','offline_access','master',NULL,NULL),('89df4bae-0bae-4edf-9bbb-d0edba7af71d','7df64a72-159e-42ab-9566-bada3b93a0b7',_binary '','${role_view-clients}','view-clients','ias','7df64a72-159e-42ab-9566-bada3b93a0b7',NULL),('8a3e5e1d-7856-40a8-9701-fe34235ffc36','7df64a72-159e-42ab-9566-bada3b93a0b7',_binary '','${role_realm-admin}','realm-admin','ias','7df64a72-159e-42ab-9566-bada3b93a0b7',NULL),('8d3ed81f-35c4-4b9b-ace3-b7c8419c9fa3','188e81b0-1500-44c6-83ad-a165bbaed7cb',_binary '','${role_read-token}','read-token','ias','188e81b0-1500-44c6-83ad-a165bbaed7cb',NULL),('8efd33d3-868c-4936-8ac0-f5a1ebb04cfd','ias',_binary '\0','${role_default-roles}','default-roles-ias','ias',NULL,NULL),('926e2483-fd5f-4f08-a444-9a64576878f4','c25c16d2-e62e-4c3d-96ed-8857138a01c4',_binary '','${role_view-consent}','view-consent','ias','c25c16d2-e62e-4c3d-96ed-8857138a01c4',NULL),('92f4d874-7670-4892-b2f9-89818e9d355f','ias',_binary '\0','${role_offline-access}','offline_access','ias',NULL,NULL),('9420e41f-6814-4170-9dfa-07cd49b37b7f','bb57334f-1281-418d-9b72-242980a349f0',_binary '','${role_view-users}','view-users','master','bb57334f-1281-418d-9b72-242980a349f0',NULL),('94329c19-4388-45c8-8fd6-02dca5133269','67d49066-d651-410f-9920-8752a4441887',_binary '','${role_view-profile}','view-profile','master','67d49066-d651-410f-9920-8752a4441887',NULL),('9841983e-3a6a-4670-9f84-94ac0d4a128b','7df64a72-159e-42ab-9566-bada3b93a0b7',_binary '','${role_query-users}','query-users','ias','7df64a72-159e-42ab-9566-bada3b93a0b7',NULL),('98d8bc19-7620-4d65-af07-e1c2feb7aadf','7df64a72-159e-42ab-9566-bada3b93a0b7',_binary '','${role_impersonation}','impersonation','ias','7df64a72-159e-42ab-9566-bada3b93a0b7',NULL),('9acb6d57-2d49-4b0c-9744-a16e0f7ca380','67d49066-d651-410f-9920-8752a4441887',_binary '','${role_view-applications}','view-applications','master','67d49066-d651-410f-9920-8752a4441887',NULL),('9b9a6c90-b4eb-48d5-af5f-5f045f359646','7df64a72-159e-42ab-9566-bada3b93a0b7',_binary '','${role_query-realms}','query-realms','ias','7df64a72-159e-42ab-9566-bada3b93a0b7',NULL),('9ca6adaf-20fe-43f1-83ae-d4891056f23a','bb57334f-1281-418d-9b72-242980a349f0',_binary '','${role_view-realm}','view-realm','master','bb57334f-1281-418d-9b72-242980a349f0',NULL),('b253da55-ea14-41c8-ba50-a99d05764cf9','master',_binary '\0','${role_default-roles}','default-roles-master','master',NULL,NULL),('b43b7320-395e-4431-ac88-b0e8a78579a9','c25c16d2-e62e-4c3d-96ed-8857138a01c4',_binary '','${role_manage-account-links}','manage-account-links','ias','c25c16d2-e62e-4c3d-96ed-8857138a01c4',NULL),('b7a71a73-3e59-4e07-9926-7899f323eb61','master',_binary '\0','${role_create-realm}','create-realm','master',NULL,NULL),('be410c71-4d2d-4971-ad3d-b32e00b4bcb1','bb57334f-1281-418d-9b72-242980a349f0',_binary '','${role_manage-clients}','manage-clients','master','bb57334f-1281-418d-9b72-242980a349f0',NULL),('c4130cac-7e6a-416c-ae22-821995608938','67d49066-d651-410f-9920-8752a4441887',_binary '','${role_manage-consent}','manage-consent','master','67d49066-d651-410f-9920-8752a4441887',NULL),('c940c962-bbc6-4160-905b-91d85aa957e3','7df64a72-159e-42ab-9566-bada3b93a0b7',_binary '','${role_view-users}','view-users','ias','7df64a72-159e-42ab-9566-bada3b93a0b7',NULL),('cafbe776-bf03-40be-a585-39517b147fb3','7df64a72-159e-42ab-9566-bada3b93a0b7',_binary '','${role_manage-clients}','manage-clients','ias','7df64a72-159e-42ab-9566-bada3b93a0b7',NULL),('cd5fc065-a6b1-499c-a709-6ab3d85396c1','7df64a72-159e-42ab-9566-bada3b93a0b7',_binary '','${role_manage-authorization}','manage-authorization','ias','7df64a72-159e-42ab-9566-bada3b93a0b7',NULL),('d3ba6cb8-3a21-42a3-bb0d-b1bec6e9aac9','bb57334f-1281-418d-9b72-242980a349f0',_binary '','${role_manage-users}','manage-users','master','bb57334f-1281-418d-9b72-242980a349f0',NULL),('d6bec4bb-acab-4dd5-a6d0-bf6ee522ffb7','c25c16d2-e62e-4c3d-96ed-8857138a01c4',_binary '','${role_delete-account}','delete-account','ias','c25c16d2-e62e-4c3d-96ed-8857138a01c4',NULL),('d7d1ca7c-1df3-4b66-844f-d9dbc5da85f2','d51526d9-f3c6-48c5-807f-98a41d72dbe2',_binary '','${role_manage-users}','manage-users','master','d51526d9-f3c6-48c5-807f-98a41d72dbe2',NULL),('db9c235f-6968-4152-9736-9e6e61016016','67d49066-d651-410f-9920-8752a4441887',_binary '','${role_manage-account-links}','manage-account-links','master','67d49066-d651-410f-9920-8752a4441887',NULL),('dea27025-fed7-46db-a09a-53e66ef575cf','bb57334f-1281-418d-9b72-242980a349f0',_binary '','${role_manage-authorization}','manage-authorization','master','bb57334f-1281-418d-9b72-242980a349f0',NULL),('df7c2391-8769-4466-84e2-8bcac6dc3b47','bb57334f-1281-418d-9b72-242980a349f0',_binary '','${role_view-events}','view-events','master','bb57334f-1281-418d-9b72-242980a349f0',NULL),('e032a411-ca8a-4a71-bbd0-b3f3e7ed291f','bb57334f-1281-418d-9b72-242980a349f0',_binary '','${role_view-identity-providers}','view-identity-providers','master','bb57334f-1281-418d-9b72-242980a349f0',NULL),('e13fe897-dfa3-40d3-a200-7f484ee935b9','7df64a72-159e-42ab-9566-bada3b93a0b7',_binary '','${role_view-events}','view-events','ias','7df64a72-159e-42ab-9566-bada3b93a0b7',NULL),('e5721d57-caac-4323-88f2-2c14c9585a73','67d49066-d651-410f-9920-8752a4441887',_binary '','${role_view-consent}','view-consent','master','67d49066-d651-410f-9920-8752a4441887',NULL),('e95a4525-52ba-4a21-b9fa-ca79b34d0472','bb57334f-1281-418d-9b72-242980a349f0',_binary '','${role_query-clients}','query-clients','master','bb57334f-1281-418d-9b72-242980a349f0',NULL),('f033cfe7-0c2f-4417-989b-4bc36f752269','d51526d9-f3c6-48c5-807f-98a41d72dbe2',_binary '','${role_create-client}','create-client','master','d51526d9-f3c6-48c5-807f-98a41d72dbe2',NULL),('f77bd52c-1e47-44dd-ba1a-c1ee734dc2aa','c25c16d2-e62e-4c3d-96ed-8857138a01c4',_binary '','${role_manage-consent}','manage-consent','ias','c25c16d2-e62e-4c3d-96ed-8857138a01c4',NULL),('fab05c86-65ab-48ca-95ce-1d7cae6a527a','d51526d9-f3c6-48c5-807f-98a41d72dbe2',_binary '','${role_query-users}','query-users','master','d51526d9-f3c6-48c5-807f-98a41d72dbe2',NULL),('fcd8f906-b40d-47ac-9394-6c6f7fe27dd1','7df64a72-159e-42ab-9566-bada3b93a0b7',_binary '','${role_view-realm}','view-realm','ias','7df64a72-159e-42ab-9566-bada3b93a0b7',NULL),('fd3c8507-9369-4b47-b21c-c5ab67f36f15','d51526d9-f3c6-48c5-807f-98a41d72dbe2',_binary '','${role_manage-realm}','manage-realm','master','d51526d9-f3c6-48c5-807f-98a41d72dbe2',NULL),('fe7da1a9-34e7-4358-8d2e-8fc0fdb6636a','d51526d9-f3c6-48c5-807f-98a41d72dbe2',_binary '','${role_manage-events}','manage-events','master','d51526d9-f3c6-48c5-807f-98a41d72dbe2',NULL);
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
INSERT INTO `MIGRATION_MODEL` VALUES ('z17sp','15.0.2',1633099925);
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
INSERT INTO `PROTOCOL_MAPPER` VALUES ('03e4210c-e878-4a16-acff-8e28285e828b','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'28a88a8b-766b-4f4b-8fec-078bb763db4a'),('0656fe96-f2ee-4f05-87fb-bc6d36853ccb','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'00e914d0-5a5b-41fa-b340-bb569cae64b4'),('0acc042e-feef-4cfd-923c-4dde28e77b6d','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'f66cf953-2950-456a-aedd-3f30e5c764ba'),('14086790-dd3a-4aad-ab19-edc1d7dec07e','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'7ff9af48-41ae-495c-85c9-7192d55ba3c0'),('18a0f507-814a-4e1d-9c94-90dcca888d1e','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'f66cf953-2950-456a-aedd-3f30e5c764ba'),('1ba2680a-0e9e-4db3-b617-bf05851a612b','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'f66cf953-2950-456a-aedd-3f30e5c764ba'),('1cd832b2-85ec-45a9-bd74-f2e327f1a412','username','openid-connect','oidc-usermodel-property-mapper',NULL,'f66cf953-2950-456a-aedd-3f30e5c764ba'),('26445d59-cf89-48a0-8355-9e2c9eed846a','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'f66cf953-2950-456a-aedd-3f30e5c764ba'),('267c3371-12ec-4419-8a2c-3fd0a6544334','full name','openid-connect','oidc-full-name-mapper',NULL,'f66cf953-2950-456a-aedd-3f30e5c764ba'),('2c39bba0-c4ca-4575-9f38-e4ba50033a1d','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'f66cf953-2950-456a-aedd-3f30e5c764ba'),('2dca1a79-ab3e-42d0-b681-e2a66bc6b1e0','address','openid-connect','oidc-address-mapper',NULL,'83089d6a-98d8-443c-a264-3433f2a0e9d8'),('314f98dc-c7c7-408e-85bf-c019b2eb5000','locale','openid-connect','oidc-usermodel-attribute-mapper','17e4b6ce-2d37-4120-8a06-63cbfc1e44bf',NULL),('340eecc6-e5f3-4474-b8a5-1cedb9a147c8','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'aa7d9552-67cf-4af3-a062-6dd5b3cf7a4a'),('36283f66-43cc-433a-9bbd-0a6be528c9e5','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'f66cf953-2950-456a-aedd-3f30e5c764ba'),('3708a9fd-6c9f-479c-b724-3259a3afb395','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'aa7d9552-67cf-4af3-a062-6dd5b3cf7a4a'),('4bbe62c4-278e-4190-a58a-66c39ef94f13','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'7ff9af48-41ae-495c-85c9-7192d55ba3c0'),('4e87989e-fe59-4036-bdab-733d5e25485a','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'7ff9af48-41ae-495c-85c9-7192d55ba3c0'),('51c330d7-bb8a-4d38-a5ea-37dda2f8e876','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'7ff9af48-41ae-495c-85c9-7192d55ba3c0'),('53d9527d-7aa2-4069-abab-f15c67494e5b','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'7ff9af48-41ae-495c-85c9-7192d55ba3c0'),('56417700-4c86-43c4-9631-61c27f402f8b','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'f66cf953-2950-456a-aedd-3f30e5c764ba'),('574e2c80-f89d-4a0c-a3e8-25692ddf3933','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'28a88a8b-766b-4f4b-8fec-078bb763db4a'),('5f79af5a-e26b-4bee-bf58-69f3366223f4','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'7ff9af48-41ae-495c-85c9-7192d55ba3c0'),('5f8278ae-92d1-4ea8-b288-c1df261bd39e','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'60c4906c-0891-4c67-98ef-dd1808de630f'),('63901b7a-0c89-4d18-8053-e07435aa2e02','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'f66cf953-2950-456a-aedd-3f30e5c764ba'),('64866e34-5df7-477f-bd55-59bbe590db7b','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'c11e6f95-2ce3-4d06-ac70-074171a216d9'),('6ac08882-c465-476d-b64a-353156974168','username','openid-connect','oidc-usermodel-property-mapper',NULL,'7ff9af48-41ae-495c-85c9-7192d55ba3c0'),('6be91be8-4b00-4be8-9eea-e5c154e1bef2','full name','openid-connect','oidc-full-name-mapper',NULL,'7ff9af48-41ae-495c-85c9-7192d55ba3c0'),('6bedec57-3858-4177-a8a1-207bd37e1b7d','email','openid-connect','oidc-usermodel-property-mapper',NULL,'5db91e77-860f-4d85-ac52-c7c7b33bf983'),('71670ff3-7dde-4eab-91b8-e6bb3df9ef21','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'7ff9af48-41ae-495c-85c9-7192d55ba3c0'),('72bb25ce-cb3f-4d98-827f-faf1942df975','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'5db91e77-860f-4d85-ac52-c7c7b33bf983'),('75342b62-3581-4818-aea8-96082bb0d51d','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'7ff9af48-41ae-495c-85c9-7192d55ba3c0'),('77c945c2-9074-4923-a459-ba8139e035bc','role list','saml','saml-role-list-mapper',NULL,'59192a1a-e36a-42b2-bf25-cd28adcd29e3'),('7d1ab210-5e53-451e-87a4-72e27d99da4b','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'39a7c67b-b33b-4f76-8342-92f2637d58d7'),('7fa231ae-e240-43b7-9ba3-939db60afa75','role list','saml','saml-role-list-mapper',NULL,'9aa6c533-f30a-4185-9917-f8bf5382c0ce'),('8b3a4cab-8d01-4112-a264-5cbef8a40a39','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'aa7d9552-67cf-4af3-a062-6dd5b3cf7a4a'),('8da11ebd-6430-4341-a57a-b4b7c0a58e44','audience resolve','openid-connect','oidc-audience-resolve-mapper','fe998b2b-c79a-4b1d-9bb9-b49bf4a5ea9f',NULL),('959f99ca-30ca-4152-8064-7c653bff5bdf','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'60c4906c-0891-4c67-98ef-dd1808de630f'),('9a0789d5-6ed4-43c6-ad87-7be1325f44fb','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'7ff9af48-41ae-495c-85c9-7192d55ba3c0'),('9de5550d-1cd6-4dea-bb36-b9fbead20c1f','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'f66cf953-2950-456a-aedd-3f30e5c764ba'),('9ed5c8aa-1079-44e8-9dc4-c091f0adbf7a','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'7ff9af48-41ae-495c-85c9-7192d55ba3c0'),('a2a670a1-7ceb-490d-a5ac-b0a93a6b9d6e','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'1f84e575-9641-47da-851e-b2f36be3fd99'),('a7bda6cb-4f8f-48a3-b2a8-fca5ea48c483','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'7ff9af48-41ae-495c-85c9-7192d55ba3c0'),('ad46bb5f-8d0a-4069-b46e-9fbcf9220b96','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'6182ac67-b543-4025-848f-6a515620099f'),('b9d790fe-aeb7-4ab3-a1fc-622e54da5c32','email','openid-connect','oidc-usermodel-property-mapper',NULL,'6182ac67-b543-4025-848f-6a515620099f'),('bd19d078-1ebd-4395-bf7c-ccc5f5ed29ae','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'60c4906c-0891-4c67-98ef-dd1808de630f'),('be16a9e9-fbf7-4499-9bd8-2f43a858e5db','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'f66cf953-2950-456a-aedd-3f30e5c764ba'),('c3174874-def4-4f0b-b39b-aa5be9a26826','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'39a7c67b-b33b-4f76-8342-92f2637d58d7'),('da846d3a-d1c1-4ecb-9eed-3d12388fef1a','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'7ff9af48-41ae-495c-85c9-7192d55ba3c0'),('dfe4a6d9-4e81-4b8c-9830-3ff8e8878099','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'21705b5e-1868-4124-a6e7-8f8e0ad2c06b'),('e7d54325-636d-46a7-9250-35b17856c43b','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'f66cf953-2950-456a-aedd-3f30e5c764ba'),('e8eb6708-904f-4d2c-8e0a-6f8c8ddf9de1','address','openid-connect','oidc-address-mapper',NULL,'4b9909c5-a42f-4918-977a-5838a054985e'),('ea8b0364-dc30-4484-b416-3abdd0b4bb38','locale','openid-connect','oidc-usermodel-attribute-mapper','073999fd-253d-4682-a528-5a9a4107d606',NULL),('eccfb5bc-7707-4e28-a732-5e2b7bcfedab','audience resolve','openid-connect','oidc-audience-resolve-mapper','5f96970c-5f18-467f-aaa4-393a06c1f888',NULL),('eef71e92-1941-42eb-b27e-f272d5e91601','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'1f84e575-9641-47da-851e-b2f36be3fd99'),('eff766bc-ef8e-4ce3-a242-f0134ee61a14','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'21705b5e-1868-4124-a6e7-8f8e0ad2c06b'),('fbbb94f7-0b6a-4037-93a4-e9624959a412','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'f66cf953-2950-456a-aedd-3f30e5c764ba');
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
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('03e4210c-e878-4a16-acff-8e28285e828b','true','access.token.claim'),('03e4210c-e878-4a16-acff-8e28285e828b','groups','claim.name'),('03e4210c-e878-4a16-acff-8e28285e828b','true','id.token.claim'),('03e4210c-e878-4a16-acff-8e28285e828b','String','jsonType.label'),('03e4210c-e878-4a16-acff-8e28285e828b','true','multivalued'),('03e4210c-e878-4a16-acff-8e28285e828b','foo','user.attribute'),('0acc042e-feef-4cfd-923c-4dde28e77b6d','true','access.token.claim'),('0acc042e-feef-4cfd-923c-4dde28e77b6d','given_name','claim.name'),('0acc042e-feef-4cfd-923c-4dde28e77b6d','true','id.token.claim'),('0acc042e-feef-4cfd-923c-4dde28e77b6d','String','jsonType.label'),('0acc042e-feef-4cfd-923c-4dde28e77b6d','firstName','user.attribute'),('0acc042e-feef-4cfd-923c-4dde28e77b6d','true','userinfo.token.claim'),('14086790-dd3a-4aad-ab19-edc1d7dec07e','true','access.token.claim'),('14086790-dd3a-4aad-ab19-edc1d7dec07e','birthdate','claim.name'),('14086790-dd3a-4aad-ab19-edc1d7dec07e','true','id.token.claim'),('14086790-dd3a-4aad-ab19-edc1d7dec07e','String','jsonType.label'),('14086790-dd3a-4aad-ab19-edc1d7dec07e','birthdate','user.attribute'),('14086790-dd3a-4aad-ab19-edc1d7dec07e','true','userinfo.token.claim'),('18a0f507-814a-4e1d-9c94-90dcca888d1e','true','access.token.claim'),('18a0f507-814a-4e1d-9c94-90dcca888d1e','website','claim.name'),('18a0f507-814a-4e1d-9c94-90dcca888d1e','true','id.token.claim'),('18a0f507-814a-4e1d-9c94-90dcca888d1e','String','jsonType.label'),('18a0f507-814a-4e1d-9c94-90dcca888d1e','website','user.attribute'),('18a0f507-814a-4e1d-9c94-90dcca888d1e','true','userinfo.token.claim'),('1ba2680a-0e9e-4db3-b617-bf05851a612b','true','access.token.claim'),('1ba2680a-0e9e-4db3-b617-bf05851a612b','picture','claim.name'),('1ba2680a-0e9e-4db3-b617-bf05851a612b','true','id.token.claim'),('1ba2680a-0e9e-4db3-b617-bf05851a612b','String','jsonType.label'),('1ba2680a-0e9e-4db3-b617-bf05851a612b','picture','user.attribute'),('1ba2680a-0e9e-4db3-b617-bf05851a612b','true','userinfo.token.claim'),('1cd832b2-85ec-45a9-bd74-f2e327f1a412','true','access.token.claim'),('1cd832b2-85ec-45a9-bd74-f2e327f1a412','preferred_username','claim.name'),('1cd832b2-85ec-45a9-bd74-f2e327f1a412','true','id.token.claim'),('1cd832b2-85ec-45a9-bd74-f2e327f1a412','String','jsonType.label'),('1cd832b2-85ec-45a9-bd74-f2e327f1a412','username','user.attribute'),('1cd832b2-85ec-45a9-bd74-f2e327f1a412','true','userinfo.token.claim'),('26445d59-cf89-48a0-8355-9e2c9eed846a','true','access.token.claim'),('26445d59-cf89-48a0-8355-9e2c9eed846a','updated_at','claim.name'),('26445d59-cf89-48a0-8355-9e2c9eed846a','true','id.token.claim'),('26445d59-cf89-48a0-8355-9e2c9eed846a','String','jsonType.label'),('26445d59-cf89-48a0-8355-9e2c9eed846a','updatedAt','user.attribute'),('26445d59-cf89-48a0-8355-9e2c9eed846a','true','userinfo.token.claim'),('267c3371-12ec-4419-8a2c-3fd0a6544334','true','access.token.claim'),('267c3371-12ec-4419-8a2c-3fd0a6544334','true','id.token.claim'),('267c3371-12ec-4419-8a2c-3fd0a6544334','true','userinfo.token.claim'),('2c39bba0-c4ca-4575-9f38-e4ba50033a1d','true','access.token.claim'),('2c39bba0-c4ca-4575-9f38-e4ba50033a1d','nickname','claim.name'),('2c39bba0-c4ca-4575-9f38-e4ba50033a1d','true','id.token.claim'),('2c39bba0-c4ca-4575-9f38-e4ba50033a1d','String','jsonType.label'),('2c39bba0-c4ca-4575-9f38-e4ba50033a1d','nickname','user.attribute'),('2c39bba0-c4ca-4575-9f38-e4ba50033a1d','true','userinfo.token.claim'),('2dca1a79-ab3e-42d0-b681-e2a66bc6b1e0','true','access.token.claim'),('2dca1a79-ab3e-42d0-b681-e2a66bc6b1e0','true','id.token.claim'),('2dca1a79-ab3e-42d0-b681-e2a66bc6b1e0','country','user.attribute.country'),('2dca1a79-ab3e-42d0-b681-e2a66bc6b1e0','formatted','user.attribute.formatted'),('2dca1a79-ab3e-42d0-b681-e2a66bc6b1e0','locality','user.attribute.locality'),('2dca1a79-ab3e-42d0-b681-e2a66bc6b1e0','postal_code','user.attribute.postal_code'),('2dca1a79-ab3e-42d0-b681-e2a66bc6b1e0','region','user.attribute.region'),('2dca1a79-ab3e-42d0-b681-e2a66bc6b1e0','street','user.attribute.street'),('2dca1a79-ab3e-42d0-b681-e2a66bc6b1e0','true','userinfo.token.claim'),('314f98dc-c7c7-408e-85bf-c019b2eb5000','true','access.token.claim'),('314f98dc-c7c7-408e-85bf-c019b2eb5000','locale','claim.name'),('314f98dc-c7c7-408e-85bf-c019b2eb5000','true','id.token.claim'),('314f98dc-c7c7-408e-85bf-c019b2eb5000','String','jsonType.label'),('314f98dc-c7c7-408e-85bf-c019b2eb5000','locale','user.attribute'),('314f98dc-c7c7-408e-85bf-c019b2eb5000','true','userinfo.token.claim'),('340eecc6-e5f3-4474-b8a5-1cedb9a147c8','true','access.token.claim'),('340eecc6-e5f3-4474-b8a5-1cedb9a147c8','realm_access.roles','claim.name'),('340eecc6-e5f3-4474-b8a5-1cedb9a147c8','String','jsonType.label'),('340eecc6-e5f3-4474-b8a5-1cedb9a147c8','true','multivalued'),('340eecc6-e5f3-4474-b8a5-1cedb9a147c8','foo','user.attribute'),('36283f66-43cc-433a-9bbd-0a6be528c9e5','true','access.token.claim'),('36283f66-43cc-433a-9bbd-0a6be528c9e5','family_name','claim.name'),('36283f66-43cc-433a-9bbd-0a6be528c9e5','true','id.token.claim'),('36283f66-43cc-433a-9bbd-0a6be528c9e5','String','jsonType.label'),('36283f66-43cc-433a-9bbd-0a6be528c9e5','lastName','user.attribute'),('36283f66-43cc-433a-9bbd-0a6be528c9e5','true','userinfo.token.claim'),('4bbe62c4-278e-4190-a58a-66c39ef94f13','true','access.token.claim'),('4bbe62c4-278e-4190-a58a-66c39ef94f13','locale','claim.name'),('4bbe62c4-278e-4190-a58a-66c39ef94f13','true','id.token.claim'),('4bbe62c4-278e-4190-a58a-66c39ef94f13','String','jsonType.label'),('4bbe62c4-278e-4190-a58a-66c39ef94f13','locale','user.attribute'),('4bbe62c4-278e-4190-a58a-66c39ef94f13','true','userinfo.token.claim'),('4e87989e-fe59-4036-bdab-733d5e25485a','true','access.token.claim'),('4e87989e-fe59-4036-bdab-733d5e25485a','family_name','claim.name'),('4e87989e-fe59-4036-bdab-733d5e25485a','true','id.token.claim'),('4e87989e-fe59-4036-bdab-733d5e25485a','String','jsonType.label'),('4e87989e-fe59-4036-bdab-733d5e25485a','lastName','user.attribute'),('4e87989e-fe59-4036-bdab-733d5e25485a','true','userinfo.token.claim'),('51c330d7-bb8a-4d38-a5ea-37dda2f8e876','true','access.token.claim'),('51c330d7-bb8a-4d38-a5ea-37dda2f8e876','zoneinfo','claim.name'),('51c330d7-bb8a-4d38-a5ea-37dda2f8e876','true','id.token.claim'),('51c330d7-bb8a-4d38-a5ea-37dda2f8e876','String','jsonType.label'),('51c330d7-bb8a-4d38-a5ea-37dda2f8e876','zoneinfo','user.attribute'),('51c330d7-bb8a-4d38-a5ea-37dda2f8e876','true','userinfo.token.claim'),('53d9527d-7aa2-4069-abab-f15c67494e5b','true','access.token.claim'),('53d9527d-7aa2-4069-abab-f15c67494e5b','updated_at','claim.name'),('53d9527d-7aa2-4069-abab-f15c67494e5b','true','id.token.claim'),('53d9527d-7aa2-4069-abab-f15c67494e5b','String','jsonType.label'),('53d9527d-7aa2-4069-abab-f15c67494e5b','updatedAt','user.attribute'),('53d9527d-7aa2-4069-abab-f15c67494e5b','true','userinfo.token.claim'),('56417700-4c86-43c4-9631-61c27f402f8b','true','access.token.claim'),('56417700-4c86-43c4-9631-61c27f402f8b','birthdate','claim.name'),('56417700-4c86-43c4-9631-61c27f402f8b','true','id.token.claim'),('56417700-4c86-43c4-9631-61c27f402f8b','String','jsonType.label'),('56417700-4c86-43c4-9631-61c27f402f8b','birthdate','user.attribute'),('56417700-4c86-43c4-9631-61c27f402f8b','true','userinfo.token.claim'),('574e2c80-f89d-4a0c-a3e8-25692ddf3933','true','access.token.claim'),('574e2c80-f89d-4a0c-a3e8-25692ddf3933','upn','claim.name'),('574e2c80-f89d-4a0c-a3e8-25692ddf3933','true','id.token.claim'),('574e2c80-f89d-4a0c-a3e8-25692ddf3933','String','jsonType.label'),('574e2c80-f89d-4a0c-a3e8-25692ddf3933','username','user.attribute'),('574e2c80-f89d-4a0c-a3e8-25692ddf3933','true','userinfo.token.claim'),('5f79af5a-e26b-4bee-bf58-69f3366223f4','true','access.token.claim'),('5f79af5a-e26b-4bee-bf58-69f3366223f4','middle_name','claim.name'),('5f79af5a-e26b-4bee-bf58-69f3366223f4','true','id.token.claim'),('5f79af5a-e26b-4bee-bf58-69f3366223f4','String','jsonType.label'),('5f79af5a-e26b-4bee-bf58-69f3366223f4','middleName','user.attribute'),('5f79af5a-e26b-4bee-bf58-69f3366223f4','true','userinfo.token.claim'),('5f8278ae-92d1-4ea8-b288-c1df261bd39e','true','access.token.claim'),('5f8278ae-92d1-4ea8-b288-c1df261bd39e','resource_access.${client_id}.roles','claim.name'),('5f8278ae-92d1-4ea8-b288-c1df261bd39e','String','jsonType.label'),('5f8278ae-92d1-4ea8-b288-c1df261bd39e','true','multivalued'),('5f8278ae-92d1-4ea8-b288-c1df261bd39e','foo','user.attribute'),('63901b7a-0c89-4d18-8053-e07435aa2e02','true','access.token.claim'),('63901b7a-0c89-4d18-8053-e07435aa2e02','profile','claim.name'),('63901b7a-0c89-4d18-8053-e07435aa2e02','true','id.token.claim'),('63901b7a-0c89-4d18-8053-e07435aa2e02','String','jsonType.label'),('63901b7a-0c89-4d18-8053-e07435aa2e02','profile','user.attribute'),('63901b7a-0c89-4d18-8053-e07435aa2e02','true','userinfo.token.claim'),('6ac08882-c465-476d-b64a-353156974168','true','access.token.claim'),('6ac08882-c465-476d-b64a-353156974168','preferred_username','claim.name'),('6ac08882-c465-476d-b64a-353156974168','true','id.token.claim'),('6ac08882-c465-476d-b64a-353156974168','String','jsonType.label'),('6ac08882-c465-476d-b64a-353156974168','username','user.attribute'),('6ac08882-c465-476d-b64a-353156974168','true','userinfo.token.claim'),('6be91be8-4b00-4be8-9eea-e5c154e1bef2','true','access.token.claim'),('6be91be8-4b00-4be8-9eea-e5c154e1bef2','true','id.token.claim'),('6be91be8-4b00-4be8-9eea-e5c154e1bef2','true','userinfo.token.claim'),('6bedec57-3858-4177-a8a1-207bd37e1b7d','true','access.token.claim'),('6bedec57-3858-4177-a8a1-207bd37e1b7d','email','claim.name'),('6bedec57-3858-4177-a8a1-207bd37e1b7d','true','id.token.claim'),('6bedec57-3858-4177-a8a1-207bd37e1b7d','String','jsonType.label'),('6bedec57-3858-4177-a8a1-207bd37e1b7d','email','user.attribute'),('6bedec57-3858-4177-a8a1-207bd37e1b7d','true','userinfo.token.claim'),('71670ff3-7dde-4eab-91b8-e6bb3df9ef21','true','access.token.claim'),('71670ff3-7dde-4eab-91b8-e6bb3df9ef21','picture','claim.name'),('71670ff3-7dde-4eab-91b8-e6bb3df9ef21','true','id.token.claim'),('71670ff3-7dde-4eab-91b8-e6bb3df9ef21','String','jsonType.label'),('71670ff3-7dde-4eab-91b8-e6bb3df9ef21','picture','user.attribute'),('71670ff3-7dde-4eab-91b8-e6bb3df9ef21','true','userinfo.token.claim'),('72bb25ce-cb3f-4d98-827f-faf1942df975','true','access.token.claim'),('72bb25ce-cb3f-4d98-827f-faf1942df975','email_verified','claim.name'),('72bb25ce-cb3f-4d98-827f-faf1942df975','true','id.token.claim'),('72bb25ce-cb3f-4d98-827f-faf1942df975','boolean','jsonType.label'),('72bb25ce-cb3f-4d98-827f-faf1942df975','emailVerified','user.attribute'),('72bb25ce-cb3f-4d98-827f-faf1942df975','true','userinfo.token.claim'),('75342b62-3581-4818-aea8-96082bb0d51d','true','access.token.claim'),('75342b62-3581-4818-aea8-96082bb0d51d','nickname','claim.name'),('75342b62-3581-4818-aea8-96082bb0d51d','true','id.token.claim'),('75342b62-3581-4818-aea8-96082bb0d51d','String','jsonType.label'),('75342b62-3581-4818-aea8-96082bb0d51d','nickname','user.attribute'),('75342b62-3581-4818-aea8-96082bb0d51d','true','userinfo.token.claim'),('77c945c2-9074-4923-a459-ba8139e035bc','Role','attribute.name'),('77c945c2-9074-4923-a459-ba8139e035bc','Basic','attribute.nameformat'),('77c945c2-9074-4923-a459-ba8139e035bc','false','single'),('7d1ab210-5e53-451e-87a4-72e27d99da4b','true','access.token.claim'),('7d1ab210-5e53-451e-87a4-72e27d99da4b','phone_number','claim.name'),('7d1ab210-5e53-451e-87a4-72e27d99da4b','true','id.token.claim'),('7d1ab210-5e53-451e-87a4-72e27d99da4b','String','jsonType.label'),('7d1ab210-5e53-451e-87a4-72e27d99da4b','phoneNumber','user.attribute'),('7d1ab210-5e53-451e-87a4-72e27d99da4b','true','userinfo.token.claim'),('7fa231ae-e240-43b7-9ba3-939db60afa75','Role','attribute.name'),('7fa231ae-e240-43b7-9ba3-939db60afa75','Basic','attribute.nameformat'),('7fa231ae-e240-43b7-9ba3-939db60afa75','false','single'),('8b3a4cab-8d01-4112-a264-5cbef8a40a39','true','access.token.claim'),('8b3a4cab-8d01-4112-a264-5cbef8a40a39','resource_access.${client_id}.roles','claim.name'),('8b3a4cab-8d01-4112-a264-5cbef8a40a39','String','jsonType.label'),('8b3a4cab-8d01-4112-a264-5cbef8a40a39','true','multivalued'),('8b3a4cab-8d01-4112-a264-5cbef8a40a39','foo','user.attribute'),('959f99ca-30ca-4152-8064-7c653bff5bdf','true','access.token.claim'),('959f99ca-30ca-4152-8064-7c653bff5bdf','realm_access.roles','claim.name'),('959f99ca-30ca-4152-8064-7c653bff5bdf','String','jsonType.label'),('959f99ca-30ca-4152-8064-7c653bff5bdf','true','multivalued'),('959f99ca-30ca-4152-8064-7c653bff5bdf','foo','user.attribute'),('9a0789d5-6ed4-43c6-ad87-7be1325f44fb','true','access.token.claim'),('9a0789d5-6ed4-43c6-ad87-7be1325f44fb','given_name','claim.name'),('9a0789d5-6ed4-43c6-ad87-7be1325f44fb','true','id.token.claim'),('9a0789d5-6ed4-43c6-ad87-7be1325f44fb','String','jsonType.label'),('9a0789d5-6ed4-43c6-ad87-7be1325f44fb','firstName','user.attribute'),('9a0789d5-6ed4-43c6-ad87-7be1325f44fb','true','userinfo.token.claim'),('9de5550d-1cd6-4dea-bb36-b9fbead20c1f','true','access.token.claim'),('9de5550d-1cd6-4dea-bb36-b9fbead20c1f','locale','claim.name'),('9de5550d-1cd6-4dea-bb36-b9fbead20c1f','true','id.token.claim'),('9de5550d-1cd6-4dea-bb36-b9fbead20c1f','String','jsonType.label'),('9de5550d-1cd6-4dea-bb36-b9fbead20c1f','locale','user.attribute'),('9de5550d-1cd6-4dea-bb36-b9fbead20c1f','true','userinfo.token.claim'),('9ed5c8aa-1079-44e8-9dc4-c091f0adbf7a','true','access.token.claim'),('9ed5c8aa-1079-44e8-9dc4-c091f0adbf7a','profile','claim.name'),('9ed5c8aa-1079-44e8-9dc4-c091f0adbf7a','true','id.token.claim'),('9ed5c8aa-1079-44e8-9dc4-c091f0adbf7a','String','jsonType.label'),('9ed5c8aa-1079-44e8-9dc4-c091f0adbf7a','profile','user.attribute'),('9ed5c8aa-1079-44e8-9dc4-c091f0adbf7a','true','userinfo.token.claim'),('a2a670a1-7ceb-490d-a5ac-b0a93a6b9d6e','true','access.token.claim'),('a2a670a1-7ceb-490d-a5ac-b0a93a6b9d6e','phone_number','claim.name'),('a2a670a1-7ceb-490d-a5ac-b0a93a6b9d6e','true','id.token.claim'),('a2a670a1-7ceb-490d-a5ac-b0a93a6b9d6e','String','jsonType.label'),('a2a670a1-7ceb-490d-a5ac-b0a93a6b9d6e','phoneNumber','user.attribute'),('a2a670a1-7ceb-490d-a5ac-b0a93a6b9d6e','true','userinfo.token.claim'),('a7bda6cb-4f8f-48a3-b2a8-fca5ea48c483','true','access.token.claim'),('a7bda6cb-4f8f-48a3-b2a8-fca5ea48c483','gender','claim.name'),('a7bda6cb-4f8f-48a3-b2a8-fca5ea48c483','true','id.token.claim'),('a7bda6cb-4f8f-48a3-b2a8-fca5ea48c483','String','jsonType.label'),('a7bda6cb-4f8f-48a3-b2a8-fca5ea48c483','gender','user.attribute'),('a7bda6cb-4f8f-48a3-b2a8-fca5ea48c483','true','userinfo.token.claim'),('ad46bb5f-8d0a-4069-b46e-9fbcf9220b96','true','access.token.claim'),('ad46bb5f-8d0a-4069-b46e-9fbcf9220b96','email_verified','claim.name'),('ad46bb5f-8d0a-4069-b46e-9fbcf9220b96','true','id.token.claim'),('ad46bb5f-8d0a-4069-b46e-9fbcf9220b96','boolean','jsonType.label'),('ad46bb5f-8d0a-4069-b46e-9fbcf9220b96','emailVerified','user.attribute'),('ad46bb5f-8d0a-4069-b46e-9fbcf9220b96','true','userinfo.token.claim'),('b9d790fe-aeb7-4ab3-a1fc-622e54da5c32','true','access.token.claim'),('b9d790fe-aeb7-4ab3-a1fc-622e54da5c32','email','claim.name'),('b9d790fe-aeb7-4ab3-a1fc-622e54da5c32','true','id.token.claim'),('b9d790fe-aeb7-4ab3-a1fc-622e54da5c32','String','jsonType.label'),('b9d790fe-aeb7-4ab3-a1fc-622e54da5c32','email','user.attribute'),('b9d790fe-aeb7-4ab3-a1fc-622e54da5c32','true','userinfo.token.claim'),('be16a9e9-fbf7-4499-9bd8-2f43a858e5db','true','access.token.claim'),('be16a9e9-fbf7-4499-9bd8-2f43a858e5db','gender','claim.name'),('be16a9e9-fbf7-4499-9bd8-2f43a858e5db','true','id.token.claim'),('be16a9e9-fbf7-4499-9bd8-2f43a858e5db','String','jsonType.label'),('be16a9e9-fbf7-4499-9bd8-2f43a858e5db','gender','user.attribute'),('be16a9e9-fbf7-4499-9bd8-2f43a858e5db','true','userinfo.token.claim'),('c3174874-def4-4f0b-b39b-aa5be9a26826','true','access.token.claim'),('c3174874-def4-4f0b-b39b-aa5be9a26826','phone_number_verified','claim.name'),('c3174874-def4-4f0b-b39b-aa5be9a26826','true','id.token.claim'),('c3174874-def4-4f0b-b39b-aa5be9a26826','boolean','jsonType.label'),('c3174874-def4-4f0b-b39b-aa5be9a26826','phoneNumberVerified','user.attribute'),('c3174874-def4-4f0b-b39b-aa5be9a26826','true','userinfo.token.claim'),('da846d3a-d1c1-4ecb-9eed-3d12388fef1a','true','access.token.claim'),('da846d3a-d1c1-4ecb-9eed-3d12388fef1a','website','claim.name'),('da846d3a-d1c1-4ecb-9eed-3d12388fef1a','true','id.token.claim'),('da846d3a-d1c1-4ecb-9eed-3d12388fef1a','String','jsonType.label'),('da846d3a-d1c1-4ecb-9eed-3d12388fef1a','website','user.attribute'),('da846d3a-d1c1-4ecb-9eed-3d12388fef1a','true','userinfo.token.claim'),('dfe4a6d9-4e81-4b8c-9830-3ff8e8878099','true','access.token.claim'),('dfe4a6d9-4e81-4b8c-9830-3ff8e8878099','groups','claim.name'),('dfe4a6d9-4e81-4b8c-9830-3ff8e8878099','true','id.token.claim'),('dfe4a6d9-4e81-4b8c-9830-3ff8e8878099','String','jsonType.label'),('dfe4a6d9-4e81-4b8c-9830-3ff8e8878099','true','multivalued'),('dfe4a6d9-4e81-4b8c-9830-3ff8e8878099','foo','user.attribute'),('e7d54325-636d-46a7-9250-35b17856c43b','true','access.token.claim'),('e7d54325-636d-46a7-9250-35b17856c43b','zoneinfo','claim.name'),('e7d54325-636d-46a7-9250-35b17856c43b','true','id.token.claim'),('e7d54325-636d-46a7-9250-35b17856c43b','String','jsonType.label'),('e7d54325-636d-46a7-9250-35b17856c43b','zoneinfo','user.attribute'),('e7d54325-636d-46a7-9250-35b17856c43b','true','userinfo.token.claim'),('e8eb6708-904f-4d2c-8e0a-6f8c8ddf9de1','true','access.token.claim'),('e8eb6708-904f-4d2c-8e0a-6f8c8ddf9de1','true','id.token.claim'),('e8eb6708-904f-4d2c-8e0a-6f8c8ddf9de1','country','user.attribute.country'),('e8eb6708-904f-4d2c-8e0a-6f8c8ddf9de1','formatted','user.attribute.formatted'),('e8eb6708-904f-4d2c-8e0a-6f8c8ddf9de1','locality','user.attribute.locality'),('e8eb6708-904f-4d2c-8e0a-6f8c8ddf9de1','postal_code','user.attribute.postal_code'),('e8eb6708-904f-4d2c-8e0a-6f8c8ddf9de1','region','user.attribute.region'),('e8eb6708-904f-4d2c-8e0a-6f8c8ddf9de1','street','user.attribute.street'),('e8eb6708-904f-4d2c-8e0a-6f8c8ddf9de1','true','userinfo.token.claim'),('ea8b0364-dc30-4484-b416-3abdd0b4bb38','true','access.token.claim'),('ea8b0364-dc30-4484-b416-3abdd0b4bb38','locale','claim.name'),('ea8b0364-dc30-4484-b416-3abdd0b4bb38','true','id.token.claim'),('ea8b0364-dc30-4484-b416-3abdd0b4bb38','String','jsonType.label'),('ea8b0364-dc30-4484-b416-3abdd0b4bb38','locale','user.attribute'),('ea8b0364-dc30-4484-b416-3abdd0b4bb38','true','userinfo.token.claim'),('eef71e92-1941-42eb-b27e-f272d5e91601','true','access.token.claim'),('eef71e92-1941-42eb-b27e-f272d5e91601','phone_number_verified','claim.name'),('eef71e92-1941-42eb-b27e-f272d5e91601','true','id.token.claim'),('eef71e92-1941-42eb-b27e-f272d5e91601','boolean','jsonType.label'),('eef71e92-1941-42eb-b27e-f272d5e91601','phoneNumberVerified','user.attribute'),('eef71e92-1941-42eb-b27e-f272d5e91601','true','userinfo.token.claim'),('eff766bc-ef8e-4ce3-a242-f0134ee61a14','true','access.token.claim'),('eff766bc-ef8e-4ce3-a242-f0134ee61a14','upn','claim.name'),('eff766bc-ef8e-4ce3-a242-f0134ee61a14','true','id.token.claim'),('eff766bc-ef8e-4ce3-a242-f0134ee61a14','String','jsonType.label'),('eff766bc-ef8e-4ce3-a242-f0134ee61a14','username','user.attribute'),('eff766bc-ef8e-4ce3-a242-f0134ee61a14','true','userinfo.token.claim'),('fbbb94f7-0b6a-4037-93a4-e9624959a412','true','access.token.claim'),('fbbb94f7-0b6a-4037-93a4-e9624959a412','middle_name','claim.name'),('fbbb94f7-0b6a-4037-93a4-e9624959a412','true','id.token.claim'),('fbbb94f7-0b6a-4037-93a4-e9624959a412','String','jsonType.label'),('fbbb94f7-0b6a-4037-93a4-e9624959a412','middleName','user.attribute'),('fbbb94f7-0b6a-4037-93a4-e9624959a412','true','userinfo.token.claim');
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
INSERT INTO `REALM` VALUES ('ias',60,300,300,NULL,NULL,NULL,_binary '',_binary '',0,NULL,'ias',0,'forceExpiredPasswordChange(90) and passwordHistory(3) and maxLength(64) and upperCase(1) and lowerCase(1) and notUsername(undefined) and notEmail(undefined) and length(8) and digits(1) and specialChars(1)',_binary '',_binary '',_binary '',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','d51526d9-f3c6-48c5-807f-98a41d72dbe2',1800,_binary '','es',_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','50dca0e2-afb3-440c-8552-c90d53f2762a','0e006cd9-bea8-4941-8189-41eb9b43d8a7','e14e2f00-172f-4263-955a-57cc24c203f2','51c43bf0-8f51-49ed-9aeb-131d5da5fc41','0f1c87e3-a502-4307-8d50-ac90890a4624',2592000,_binary '\0',900,_binary '',_binary '\0','c4b67b2e-8d42-43fe-9121-1d0e686d0527',0,_binary '\0',0,0,'8efd33d3-868c-4936-8ac0-f5a1ebb04cfd'),('master',60,300,60,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'master',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','bb57334f-1281-418d-9b72-242980a349f0',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','8eb9d8b3-18f4-41c2-8a01-920a1d4db5f6','32347dd5-3412-4aab-b583-8a883612a74d','f79ef96c-d05f-4f25-8ef6-3c1c6392e1c5','afdd7c0f-94d9-480d-b1f3-e27582f0f55c','2514587b-4681-4d27-ba72-452f5688f9b7',2592000,_binary '\0',900,_binary '',_binary '\0','e4aa5d2d-c775-44fe-b7ff-865d5c096509',0,_binary '\0',0,0,'b253da55-ea14-41c8-ba50-a99d05764cf9');
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
INSERT INTO `REALM_ATTRIBUTE` VALUES ('actionTokenGeneratedByAdminLifespan','ias','43200'),('actionTokenGeneratedByUserLifespan','ias','300'),('bruteForceProtected','ias','true'),('bruteForceProtected','master','false'),('cibaAuthRequestedUserHint','ias','login_hint'),('cibaBackchannelTokenDeliveryMode','ias','poll'),('cibaExpiresIn','ias','120'),('cibaInterval','ias','5'),('client-policies.policies','ias','{\"policies\":[]}'),('client-policies.profiles','ias','{\"profiles\":[]}'),('clientOfflineSessionIdleTimeout','ias','0'),('clientOfflineSessionMaxLifespan','ias','0'),('clientSessionIdleTimeout','ias','0'),('clientSessionMaxLifespan','ias','0'),('defaultSignatureAlgorithm','ias','RS256'),('defaultSignatureAlgorithm','master','RS256'),('displayName','master','Keycloak'),('displayNameHtml','master','<div class=\"kc-logo-text\"><span>Keycloak</span></div>'),('failureFactor','ias','2'),('failureFactor','master','30'),('maxDeltaTimeSeconds','ias','43200'),('maxDeltaTimeSeconds','master','43200'),('maxFailureWaitSeconds','ias','900'),('maxFailureWaitSeconds','master','900'),('minimumQuickLoginWaitSeconds','ias','60'),('minimumQuickLoginWaitSeconds','master','60'),('oauth2DeviceCodeLifespan','ias','600'),('oauth2DevicePollingInterval','ias','5'),('offlineSessionMaxLifespan','ias','5184000'),('offlineSessionMaxLifespan','master','5184000'),('offlineSessionMaxLifespanEnabled','ias','false'),('offlineSessionMaxLifespanEnabled','master','false'),('parRequestUriLifespan','ias','60'),('permanentLockout','ias','false'),('permanentLockout','master','false'),('quickLoginCheckMilliSeconds','ias','1000'),('quickLoginCheckMilliSeconds','master','1000'),('waitIncrementSeconds','ias','60'),('waitIncrementSeconds','master','60'),('webAuthnPolicyAttestationConveyancePreference','ias','not specified'),('webAuthnPolicyAttestationConveyancePreferencePasswordless','ias','not specified'),('webAuthnPolicyAuthenticatorAttachment','ias','not specified'),('webAuthnPolicyAuthenticatorAttachmentPasswordless','ias','not specified'),('webAuthnPolicyAvoidSameAuthenticatorRegister','ias','false'),('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','ias','false'),('webAuthnPolicyCreateTimeout','ias','0'),('webAuthnPolicyCreateTimeoutPasswordless','ias','0'),('webAuthnPolicyRequireResidentKey','ias','not specified'),('webAuthnPolicyRequireResidentKeyPasswordless','ias','not specified'),('webAuthnPolicyRpEntityName','ias','keycloak'),('webAuthnPolicyRpEntityNamePasswordless','ias','keycloak'),('webAuthnPolicyRpId','ias',''),('webAuthnPolicyRpIdPasswordless','ias',''),('webAuthnPolicySignatureAlgorithms','ias','ES256'),('webAuthnPolicySignatureAlgorithmsPasswordless','ias','ES256'),('webAuthnPolicyUserVerificationRequirement','ias','not specified'),('webAuthnPolicyUserVerificationRequirementPasswordless','ias','not specified'),('_browser_header.contentSecurityPolicy','ias','frame-src \'self\' https://www.google.com'),('_browser_header.contentSecurityPolicy','master','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicyReportOnly','ias',''),('_browser_header.contentSecurityPolicyReportOnly','master',''),('_browser_header.strictTransportSecurity','ias','max-age=31536000; includeSubDomains'),('_browser_header.strictTransportSecurity','master','max-age=31536000; includeSubDomains'),('_browser_header.xContentTypeOptions','ias','nosniff'),('_browser_header.xContentTypeOptions','master','nosniff'),('_browser_header.xFrameOptions','ias','ALLOW-FROM https://www.google.com'),('_browser_header.xFrameOptions','master','SAMEORIGIN'),('_browser_header.xRobotsTag','ias','none'),('_browser_header.xRobotsTag','master','none'),('_browser_header.xXSSProtection','ias','1; mode=block'),('_browser_header.xXSSProtection','master','1; mode=block');
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
INSERT INTO `REALM_ENABLED_EVENT_TYPES` VALUES ('ias','LOGIN'),('ias','LOGOUT'),('ias','REGISTER'),('ias','RESET_PASSWORD');
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
INSERT INTO `REALM_SUPPORTED_LOCALES` VALUES ('ias','ca'),('ias','cs'),('ias','da'),('ias','de'),('ias','en'),('ias','es'),('ias','fr'),('ias','hu'),('ias','it'),('ias','ja'),('ias','lt'),('ias','nl'),('ias','no'),('ias','pl'),('ias','pt-BR'),('ias','ru'),('ias','sk'),('ias','sv'),('ias','tr'),('ias','zh-CN');
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
INSERT INTO `REDIRECT_URIS` VALUES ('073999fd-253d-4682-a528-5a9a4107d606','/admin/ias/console/*'),('17e4b6ce-2d37-4120-8a06-63cbfc1e44bf','/admin/master/console/*'),('5f96970c-5f18-467f-aaa4-393a06c1f888','/realms/ias/account/*'),('67d49066-d651-410f-9920-8752a4441887','/realms/master/account/*'),('c25c16d2-e62e-4c3d-96ed-8857138a01c4','/realms/ias/account/*'),('f3f58bd1-dff3-4979-ac43-f5e56e9567b0','*'),('fe998b2b-c79a-4b1d-9bb9-b49bf4a5ea9f','/realms/master/account/*');
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
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('2273afa7-3d34-44f5-a177-d7e6e28ca956','update_user_locale','Update User Locale','ias',_binary '',_binary '\0','update_user_locale',1000),('32fa5cd5-86ce-44a6-b32d-60a9d7ffc61c','terms_and_conditions','Terms and Conditions','ias',_binary '\0',_binary '\0','terms_and_conditions',20),('40257373-29b2-438e-ae5b-82a760c6335e','update_user_locale','Update User Locale','master',_binary '',_binary '\0','update_user_locale',1000),('561688d6-12e7-403f-9f0b-e0f9da5ff770','VERIFY_EMAIL','Verify Email','master',_binary '',_binary '\0','VERIFY_EMAIL',50),('5627bd66-64eb-44d7-957f-c57382f08f9f','UPDATE_PASSWORD','Update Password','master',_binary '',_binary '\0','UPDATE_PASSWORD',30),('84583746-6854-4b98-bd4b-7ea6a615d6e6','UPDATE_PROFILE','Update Profile','ias',_binary '',_binary '\0','UPDATE_PROFILE',40),('86748eac-2161-4c74-90e4-bebef323afe7','VERIFY_EMAIL','Verify Email','ias',_binary '',_binary '\0','VERIFY_EMAIL',50),('87ccec82-fd98-4d4d-b538-b77eeb5e9d00','CONFIGURE_TOTP','Configure OTP','ias',_binary '',_binary '','CONFIGURE_TOTP',10),('8a7db360-f41b-4365-866e-ce9e54712849','UPDATE_PASSWORD','Update Password','ias',_binary '',_binary '','UPDATE_PASSWORD',30),('8bf370b4-bd1a-4785-9cad-58b05d73282d','terms_and_conditions','Terms and Conditions','master',_binary '\0',_binary '\0','terms_and_conditions',20),('9ad8b839-a255-471b-9a36-68cb46dc96aa','CONFIGURE_TOTP','Configure OTP','master',_binary '',_binary '\0','CONFIGURE_TOTP',10),('bed01572-7173-481d-b0a3-6f5e37325e34','delete_account','Delete Account','master',_binary '\0',_binary '\0','delete_account',60),('da303585-806d-415a-9a88-5a85b9d8572b','UPDATE_PROFILE','Update Profile','master',_binary '',_binary '\0','UPDATE_PROFILE',40),('df639344-100b-4b48-9f65-db7394b21453','delete_account','Delete Account','ias',_binary '\0',_binary '\0','delete_account',60);
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
INSERT INTO `SCOPE_MAPPING` VALUES ('fe998b2b-c79a-4b1d-9bb9-b49bf4a5ea9f','110a3016-4bbc-4a10-bd66-404a225779c9'),('5f96970c-5f18-467f-aaa4-393a06c1f888','3fdade43-938b-4577-bad8-bdf822e4c9bf');
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
INSERT INTO `USER_ATTRIBUTE` VALUES ('locale','en','c29078ef-504f-46bb-aebf-61f72e1d0c9b','40251614-ac39-4ee9-936a-d809d506fc19');
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
INSERT INTO `USER_ENTITY` VALUES ('09a764d4-ed25-47e5-b1ab-d09d7c95dad2','lluismartinez@gmail.com','lluismartinez@gmail.com',_binary '',_binary '',NULL,'Lluís','Martínez','ias','lluis',1634732177166,NULL,0),('22b4bbce-437e-48f4-aa1d-b00ae3db4d2d','enric.artus@gmail.com','enric.artus@gmail.com',_binary '',_binary '',NULL,'Enric','Artús','ias','enric',1634732266789,NULL,0),('817f97a1-60fc-4da5-bf00-4f7265189a50','manel.gracia.sola@gmail.com','manel.gracia.sola@gmail.com',_binary '',_binary '',NULL,'Manel','Gràcia','ias','manel',1633852576851,NULL,0),('a30ac1c8-cb3e-4f07-8e2f-2581bc2ce4aa','guillem.reig@gmail.com','guillem.reig@gmail.com',_binary '',_binary '',NULL,'Guillem','Reig','ias','guillem',1634732248661,NULL,0),('b1bbec59-6bf4-49cc-a1d9-326445aac326','marticanyelles@gmail.com','marticanyelles@gmail.com',_binary '',_binary '',NULL,'Martí','Canyelles','ias','marti',1634732152865,NULL,0),('c29078ef-504f-46bb-aebf-61f72e1d0c9b','admin@admin.com','admin@admin.com',_binary '',_binary '',NULL,'Admin','Admin','ias','admin',1634732316454,NULL,0),('e647640b-4d1a-4ab6-8602-4570d857cc6e',NULL,'7b986e8c-6fee-4ed8-b056-d11561d56714',_binary '\0',_binary '',NULL,NULL,NULL,'master','admin',1633099927639,NULL,0);
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
INSERT INTO `USER_REQUIRED_ACTION` VALUES ('09a764d4-ed25-47e5-b1ab-d09d7c95dad2','CONFIGURE_TOTP'),('09a764d4-ed25-47e5-b1ab-d09d7c95dad2','UPDATE_PASSWORD'),('22b4bbce-437e-48f4-aa1d-b00ae3db4d2d','CONFIGURE_TOTP'),('22b4bbce-437e-48f4-aa1d-b00ae3db4d2d','UPDATE_PASSWORD'),('817f97a1-60fc-4da5-bf00-4f7265189a50','CONFIGURE_TOTP'),('817f97a1-60fc-4da5-bf00-4f7265189a50','UPDATE_PASSWORD'),('a30ac1c8-cb3e-4f07-8e2f-2581bc2ce4aa','CONFIGURE_TOTP'),('a30ac1c8-cb3e-4f07-8e2f-2581bc2ce4aa','UPDATE_PASSWORD'),('b1bbec59-6bf4-49cc-a1d9-326445aac326','CONFIGURE_TOTP'),('b1bbec59-6bf4-49cc-a1d9-326445aac326','UPDATE_PASSWORD');
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
INSERT INTO `USER_ROLE_MAPPING` VALUES ('8efd33d3-868c-4936-8ac0-f5a1ebb04cfd','09a764d4-ed25-47e5-b1ab-d09d7c95dad2'),('8efd33d3-868c-4936-8ac0-f5a1ebb04cfd','22b4bbce-437e-48f4-aa1d-b00ae3db4d2d'),('8a3e5e1d-7856-40a8-9701-fe34235ffc36','817f97a1-60fc-4da5-bf00-4f7265189a50'),('8efd33d3-868c-4936-8ac0-f5a1ebb04cfd','817f97a1-60fc-4da5-bf00-4f7265189a50'),('8efd33d3-868c-4936-8ac0-f5a1ebb04cfd','a30ac1c8-cb3e-4f07-8e2f-2581bc2ce4aa'),('8efd33d3-868c-4936-8ac0-f5a1ebb04cfd','b1bbec59-6bf4-49cc-a1d9-326445aac326'),('8a3e5e1d-7856-40a8-9701-fe34235ffc36','c29078ef-504f-46bb-aebf-61f72e1d0c9b'),('8efd33d3-868c-4936-8ac0-f5a1ebb04cfd','c29078ef-504f-46bb-aebf-61f72e1d0c9b'),('24bbf88e-9391-4d53-add5-b17fc3d47d80','e647640b-4d1a-4ab6-8602-4570d857cc6e'),('b253da55-ea14-41c8-ba50-a99d05764cf9','e647640b-4d1a-4ab6-8602-4570d857cc6e');
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
INSERT INTO `WEB_ORIGINS` VALUES ('073999fd-253d-4682-a528-5a9a4107d606','+'),('17e4b6ce-2d37-4120-8a06-63cbfc1e44bf','+'),('f3f58bd1-dff3-4979-ac43-f5e56e9567b0','*');
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

-- Dump completed on 2021-10-20 19:58:33

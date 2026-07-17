-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: calorycut
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin1@yourhealth.com','admin1234','관리자','010-0000-0000','2026-06-22 15:51:07'),(5,'admin2@yourhealth.com','admin1235','관리자','010-0000-0000','2026-06-25 11:14:58');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `added_at` datetime DEFAULT NULL,
  `users_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cart_id`),
  KEY `users_id` (`users_id`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`users_id`),
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`users_id`) REFERENCES `users` (`users_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (24,3,1,NULL,12,'2026-07-07 09:34:48'),(35,1,1,NULL,16,'2026-07-07 15:19:34');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inquiries`
--

DROP TABLE IF EXISTS `inquiries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inquiries` (
  `inquiry_id` int NOT NULL AUTO_INCREMENT,
  `users_id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `answer` text,
  `status` varchar(20) NOT NULL,
  `is_secret` varchar(45) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `answered_at` datetime DEFAULT NULL,
  PRIMARY KEY (`inquiry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inquiries`
--

LOCK TABLES `inquiries` WRITE;
/*!40000 ALTER TABLE `inquiries` DISABLE KEYS */;
INSERT INTO `inquiries` VALUES (1,5,1,'배송 몬의드립니다','언제쯤 배송되나요?','2-3일 소요됩니다! ','답변완료','N','2026-07-06 09:47:48','2026-07-07 12:55:07');
/*!40000 ALTER TABLE `inquiries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `integrated_user`
--

DROP TABLE IF EXISTS `integrated_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `integrated_user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '로그인 아이디',
  `password` varchar(255) NOT NULL COMMENT '비밀번호',
  `nickname` varchar(50) NOT NULL COMMENT '닉네임',
  `email` varchar(100) NOT NULL COMMENT '이메일',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integrated_user`
--

LOCK TABLES `integrated_user` WRITE;
/*!40000 ALTER TABLE `integrated_user` DISABLE KEYS */;
INSERT INTO `integrated_user` VALUES (1,'honggildong',' test1234','íê¸¸ë','honggildong2@test.com','2026-07-06 14:59:21'),(2,'abc123','1234','ìì´ë¹ì¨','abc123@naver.com','2026-07-06 15:00:34'),(3,'hello123','hello1234','í¬ë¡','hello@hello.co.kr','2026-07-06 15:05:27'),(4,'test345','test345','test3','test345@test.com','2026-07-06 15:11:37'),(5,'test4','12345','íì¤í¸4','test4@test4.com','2026-07-06 15:14:41'),(6,'test5','4455','íì¤í¸5','test5@test.com','2026-07-06 16:11:33'),(7,'tes6','12345','íì¤í¸6','test6@test.com','2026-07-06 16:14:16'),(8,'test99','123','테스트99','test99@test.com','2026-07-07 10:02:59'),(9,'test100','123456','테스트백','test100@test.com','2026-07-07 11:42:46');
/*!40000 ALTER TABLE `integrated_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` int NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (2,1,1,2,38000),(3,1,1,2,38000),(5,1,1,2,38000),(6,2,2,1,52000),(7,1,1,2,38000),(8,2,2,1,52000),(9,1,1,2,38000),(10,2,2,1,52000),(11,1,1,2,38000),(12,1,1,2,38000),(13,2,2,1,52000),(14,1,1,2,38000),(15,2,2,1,52000),(16,1,1,2,38000),(17,2,2,1,52000),(18,1,1,2,38000),(19,2,2,1,52000),(20,1,1,2,38000),(21,2,2,1,52000),(22,1,1,2,38000),(23,2,2,1,52000),(24,1,1,2,38000),(25,2,2,1,52000),(26,1,1,2,38000),(27,2,2,1,52000),(28,13,1,1,40000),(29,14,1,1,40000),(30,15,1,1,40000),(31,16,3,1,65000),(32,18,4,1,48000),(33,19,2,1,52000),(34,20,2,1,52000),(35,21,4,1,48000),(36,22,1,1,40000),(37,23,7,1,45000),(38,24,2,1,52000),(39,25,8,1,58000),(40,26,3,1,65000),(41,27,3,1,65000),(42,28,3,1,65000),(43,28,4,1,48000);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `users_id` int NOT NULL DEFAULT '1',
  `order_number` varchar(20) NOT NULL,
  `total_price` int NOT NULL,
  `receiver_name` varchar(50) NOT NULL,
  `receiver_phone` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `payment_method` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `ordered_at` datetime DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_number_UNIQUE` (`order_number`),
  KEY `users_id` (`users_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`users_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'ORD-1001',76000,'홍길동','010-1234-5678','서울시 강남구','카드','주문취소','2026-06-19 15:45:15'),(2,1,'ORD-1002',52000,'김철수','010-9876-5432','서울시 송파구','카카오페이','결제완료','2026-06-22 11:05:24'),(11,1,'ORD-1003',46000,'박봉곤','010-7777-7777','서울시 송파구','카카오페이','결제완료','2026-06-25 10:48:49'),(12,1,'ORD-1004',46000,'박봉곤','010-7777-7777','서울시 송파구','카카오페이','결제완료','2026-06-25 10:53:36'),(13,1,'ORD-1782985099476',40000,'박봉구','010-1111','안산','카드','결제완료','2026-07-02 18:38:19'),(14,1,'ORD-1782985183395',40000,'박봉곤','555','경기도','카드','결제완료','2026-07-02 18:39:43'),(15,1,'ORD-1782985216466',40000,'김철수','010-5555-2222','수원','카드','결제완료','2026-07-02 18:40:16'),(16,1,'ORD-1782985525196',65000,'신짱구','010-7878-8989','고양시','카드','결제완료','2026-07-02 18:45:25'),(17,1,'ORD-1782986129508',48000,'테스트','010-1111-1111','용인','카드','결제완료','2026-07-02 18:55:29'),(18,5,'ORD-1782986252933',48000,'테스트','010-1111-1111','용인','카드','결제완료','2026-07-02 18:57:32'),(19,12,'ORD1783382859648',52000,'최수민','010-1234-5678','용인시','카드','주문완료','2026-07-07 09:07:39'),(20,12,'ORD1783383187664',52000,'최수민','010-8888-9999','용인시','카드','주문완료','2026-07-07 09:13:07'),(21,12,'ORD1783383667491',48000,'A','010-1111-2222','수원시','계좌이체','주문완료','2026-07-07 09:21:07'),(22,9,'ORD1783385057611',40000,'ABC','010-3333-4444','수원시 매산1로','카카오페이','주문완료','2026-07-07 09:44:17'),(23,15,'ORD1783388418138',45000,'테스트99','010-123-456','경기도 수원시 ','카카오페이','취소','2026-07-07 10:40:18'),(24,15,'ORD1783388458150',52000,'테스트99','010-888-888','수원','네이버페이','환불완료','2026-07-07 10:40:58'),(25,1,'ORD1783391985194',58000,'김다은','010-9999-9999','수원시','카카오페이','취소','2026-07-07 11:39:45'),(26,16,'ORD1783392205371',65000,'테스트100','010-111-111','서울특별시 ','카드','주문완료','2026-07-07 11:43:25'),(27,15,'ORD1783404314512',65000,'테스트','010-888-999','수원시','카드','주문완료','2026-07-07 15:05:14'),(28,15,'ORD1783404711710',113000,'ABCD','010-123-123','역삼동','네이버페이','주문완료','2026-07-07 15:11:51');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `price` int NOT NULL,
  `category` varchar(20) NOT NULL,
  `description` text,
  `caution` text,
  `img_emoji` varchar(50) DEFAULT NULL,
  `stock` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'슬림컷 지방분해 캡슐',40000,'20대','카르니틴 CLA 녹차추출물 함유','임산부 섭취 금지','capsule.png',90,'2026-06-26 16:41:27'),(2,'대사부스터 포뮬라',52000,'30대','코엔자임Q10 비타민B 함유','고혈압 환자 상담 필요','fire.png',85,'2026-06-26 16:41:28'),(3,'콜라겐 다이어트 40플러스',65000,'40대','저분자 콜라겐 히알루론산 함유','갑상선암 환자 상담 필요','sparkle.png',60,'2026-06-26 16:41:30'),(4,'시니어 슬림케어',48000,'50대이상','글루코사민 보스웰리아 함유','당뇨환자 상담 필요','leaf.png',95,'2026-06-26 16:41:32'),(6,'나이트번 야간지방연소',42000,'20대','멜라토닌 전구체 마그네슘 함유','수면제 복용자 상담 필요','night.png',70,'2026-06-26 16:43:58'),(7,'이너뷰티 멀티비타민',45000,'30대','비타민C D E 아연 함유','임산부 상담 필요','vitamin.png',80,'2026-06-26 16:44:00'),(8,'히알루론산 수분케어',58000,'40대','히알루론산 세라마이드 함유','알레르기 환자 상담 필요','moisture.png',75,'2026-06-26 16:44:02'),(9,'오메가3 혈관케어',55000,'50대이상','오메가3 코엔자임Q10 함유','혈액희석제 복용자 상담 필요','omega.png',65,'2026-06-26 16:44:04');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refunds`
--

DROP TABLE IF EXISTS `refunds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refunds` (
  `refunds_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `users_id` int NOT NULL,
  `reason` varchar(255) NOT NULL,
  `status` varchar(20) NOT NULL,
  `requested_at` datetime NOT NULL,
  `processed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`refunds_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refunds`
--

LOCK TABLES `refunds` WRITE;
/*!40000 ALTER TABLE `refunds` DISABLE KEYS */;
INSERT INTO `refunds` VALUES (1,1,1,'단순 변심','승인','2026-06-22 15:35:07','2026-06-22 17:45:25'),(4,24,15,'효과미흡','환불완료','2026-07-07 10:41:09','2026-07-07 11:33:02');
/*!40000 ALTER TABLE `refunds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `reviews_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `rating` tinyint NOT NULL,
  `content` text,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`reviews_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,3,5,'피부도 좋아졌어요','2026-06-22 11:10:02'),(2,2,4,'피로감도 좋았어요','2026-06-22 11:10:04'),(3,2,5,'대사가 살아났어요!','2026-06-22 11:10:06'),(4,1,5,'꾸준히 먹으니 효과 있어요','2026-06-22 11:10:09'),(5,1,5,'한 달 만에 2kg 감량!','2026-06-22 11:10:11'),(6,1,5,'한 달 만에 2kg 감량!','2026-06-25 10:57:11'),(7,1,5,'꾸준히 먹으니 효과 있어요','2026-06-25 10:57:14'),(8,2,5,'대사가 살아났어요!','2026-06-25 10:57:16'),(9,2,4,'피로감도 좋았어요','2026-06-25 10:57:18'),(10,3,5,'피부도 좋아졌어요','2026-06-25 10:57:19'),(11,1,1,'앞으로 이것만 쓰는 나의 애착템이 될겁니다!','2026-06-25 10:58:58'),(12,1,5,'앞으로 이것만 쓰는 나의 애착템이 될겁니다!','2026-06-25 10:59:23'),(13,4,5,'소화가 편해서 좋아요','2026-07-07 14:51:07'),(14,4,4,'부모님께 선물했는데 만족하세요','2026-07-07 14:51:07'),(15,6,5,'자기 전에 먹으니 편하네요','2026-07-07 14:51:09'),(16,6,4,'한 달째 꾸준히 먹는 중이에요','2026-07-07 14:51:09'),(17,7,5,'피부톤이 확실히 밝아졌어요','2026-07-07 14:51:13'),(18,7,5,'비타민 하나로 여러 개 챙기는 느낌','2026-07-07 14:51:13'),(19,8,4,'피부 속부터 촉촉해지는 느낌이에요','2026-07-07 14:51:15'),(20,8,5,'건조한 겨울에 딱이에요','2026-07-07 14:51:15'),(21,9,5,'혈액순환이 좋아진 것 같아요','2026-07-07 14:51:17'),(22,9,4,'가족 모두 챙겨먹고 있어요','2026-07-07 14:51:17'),(23,3,5,'피부결도 부드러워지고 살도 같이 빠지니 효과직빵입니다! ','2026-07-07 15:01:52'),(24,9,5,'혈액순환이 좋아진 것 같아요','2026-07-07 15:02:04'),(25,9,4,'가족 모두 챙겨먹고 있어요','2026-07-07 15:02:04'),(26,9,5,'혈액순환이 좋아진 것 같아요','2026-07-07 15:02:04'),(27,9,4,'가족 모두 챙겨먹고 있어요','2026-07-07 15:02:04');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `users_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `role` varchar(10) DEFAULT 'user',
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`users_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'kim123@korea.com','12345','김다은','010-9999-9999',NULL,'users','2026-06-22 12:59:01'),(5,'test@test.com','1234','테스트','010-1111-1111',NULL,'user','2026-06-26 12:53:50'),(6,'bong8@test.com','5566','최봉팔','010-9555-9555',NULL,'user','2026-06-26 12:54:58'),(7,'tes6','12345','íì¤í¸6','000-0000-0000',NULL,'user','2026-07-06 16:14:16'),(8,'honggildong',' test1234','íê¸¸ë','000-0000-0000',NULL,'user','2026-07-06 14:59:21'),(9,'abc123','1234','ìì´ë¹ì¨','000-0000-0000',NULL,'user','2026-07-06 15:00:34'),(10,'hello123','hello1234','í¬ë¡','000-0000-0000',NULL,'user','2026-07-06 15:05:27'),(11,'test345','test345','test3','000-0000-0000',NULL,'user','2026-07-06 15:11:37'),(12,'test4','12345','íì¤í¸4','000-0000-0000',NULL,'user','2026-07-06 15:14:41'),(13,'test5','4455','íì¤í¸5','000-0000-0000',NULL,'user','2026-07-06 16:11:33'),(15,'test99','123','테스트99','000-0000-0000',NULL,'user','2026-07-07 10:02:59'),(16,'test100','123456','테스트백','000-0000-0000',NULL,'user','2026-07-07 11:42:46');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-07 17:41:53
